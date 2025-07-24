local debug = false
Journal_charDB = Journal_charDB or {}

-- Initialize DJ_Settings early to avoid nil errors in UIFrames.lua
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false, filterType = "All" }

-- ##################################################################
-- # ATTUNEMENT SHARING SYSTEM
-- ##################################################################

-- Addon communication prefix for attunement sharing
local ADDON_PREFIX = "DJ_ATTUNE"
local FRIENDS_DATA = {} -- Store friends' attunement data
local ITEM_QUERY_RESPONSES = {} -- Store BOE item query responses

-- ʕ •ᴥ•ʔ✿ Initialize global friends data tables early ✿ʕ •ᴥ•ʔ
if not _G.FRIENDS_ATTUNEMENT_DATA then
    _G.FRIENDS_ATTUNEMENT_DATA = {}
end
if not _G.FRIENDS_JOURNAL_POINTS then
    _G.FRIENDS_JOURNAL_POINTS = {}
end
if not _G.FRIENDS_DATA then
    _G.FRIENDS_DATA = FRIENDS_DATA
end

-- ʕ ◕ᴥ◕ ʔ✿ Load saved friends data into global tables ✿ʕ ◕ᴥ◕ ʔ
if Journal_charDB and Journal_charDB.friendsAttunementData then
    local friendsLoaded = 0
    for playerName, data in pairs(Journal_charDB.friendsAttunementData) do
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = data
        FRIENDS_DATA[playerName] = data
        friendsLoaded = friendsLoaded + 1
    end

    local pointsLoaded = 0
    if Journal_charDB.friendsJournalPoints then
        for playerName, points in pairs(Journal_charDB.friendsJournalPoints) do
            _G.FRIENDS_JOURNAL_POINTS[playerName] = points
            pointsLoaded = pointsLoaded + 1
        end
    end

    -- ʕ •ᴥ•ʔ✿ Load silently ✿ʕ •ᴥ•ʔ
end

-- Message queue and throttling system
local MESSAGE_QUEUE = {}
local MESSAGE_THROTTLE_DELAY = 0.1  -- 100ms between messages to prevent spam
local BATCH_SIZE = 10  -- Max messages per batch
local lastMessageTime = 0
local queueProcessor = nil

-- Track who we've sent messages to recently to avoid duplicates
local RECENT_RECIPIENTS = {}
local RECIPIENT_COOLDOWN = 1

-- Initialize queue processor
local function InitializeMessageQueue()
    if queueProcessor then return end

    queueProcessor = CreateFrame("Frame")
    queueProcessor:SetScript("OnUpdate", function(self, elapsed)
        local currentTime = GetTime()

        -- Clean up old recipients every 30 seconds
        if not self.lastCleanup or (currentTime - self.lastCleanup) > 30 then
            local cleanupTime = currentTime - RECIPIENT_COOLDOWN
            for recipient, lastSent in pairs(RECENT_RECIPIENTS) do
                if lastSent < cleanupTime then
                    RECENT_RECIPIENTS[recipient] = nil
                end
            end
            self.lastCleanup = currentTime
        end

        -- Process message queue
        if #MESSAGE_QUEUE > 0 and (currentTime - lastMessageTime) >= MESSAGE_THROTTLE_DELAY then
            local messagesProcessed = 0
            local queueIndex = 1

            while queueIndex <= #MESSAGE_QUEUE and messagesProcessed < BATCH_SIZE do
                local messageData = MESSAGE_QUEUE[queueIndex]
                local shouldRemoveFromQueue = false
                local shouldSend = true

                -- Double-check online status for whispers before sending
                if messageData.channel == "WHISPER" and messageData.target then
                    shouldSend = false

                    -- Check friends list
                    local numFriends = GetNumFriends()
                    for i = 1, numFriends do
                        local name, level, class, area, connected = GetFriendInfo(i)
                        if name == messageData.target and connected then
                            shouldSend = true
                            break
                        end
                    end

                    -- Check guild members if not found in friends
                    if not shouldSend and IsInGuild() then
                        local numGuildMembers = GetNumGuildMembers()
                        for i = 1, numGuildMembers do
                            local name, _, _, _, _, _, _, _, online = GetGuildRosterInfo(i)
                            if name == messageData.target and online then
                                shouldSend = true
                                break
                            end
                        end
                    end

                    -- Check party/raid members if not found elsewhere
                    if not shouldSend then
                        -- Check party
                        for i = 1, GetNumPartyMembers() do
                            local name = UnitName("party" .. i)
                            if name == messageData.target then
                                shouldSend = true
                                break
                            end
                        end

                        -- Check raid if not in party
                        if not shouldSend then
                            for i = 1, GetNumRaidMembers() do
                                local name = UnitName("raid" .. i)
                                if name == messageData.target then
                                    shouldSend = true
                                    break
                                end
                            end
                        end
                    end

                    if not shouldSend then
                        if debug and messageData.message:find("ITEM_RESPONSE") then
                            print("|cFF00FF00[BOE DEBUG]|r Queue processor: REMOVED (offline/not found) - " .. messageData.message .. " to " .. (messageData.target or "broadcast"))
                            print("|cFF00FF00[BOE DEBUG]|r Checked friends, guild, party, and raid - target not found online")
                        end
                        shouldRemoveFromQueue = true -- Remove offline/unknown players from queue
                    else
                        if debug and messageData.message:find("ITEM_RESPONSE") then
                            print("|cFF00FF00[BOE DEBUG]|r Queue processor: Target " .. messageData.target .. " found online")
                        end
                    end
                end

                if shouldSend then
                    -- Check if we should skip this recipient due to recent send
                    local recipientKey = messageData.channel .. "_" .. (messageData.target or "broadcast")
                    local lastSentTime = RECENT_RECIPIENTS[recipientKey]

                    if not lastSentTime or (currentTime - lastSentTime) >= RECIPIENT_COOLDOWN then
                        -- Can send now - remove from queue and send
                        SendAddonMessage(messageData.prefix, messageData.message, messageData.channel, messageData.target)
                        RECENT_RECIPIENTS[recipientKey] = currentTime
                        lastMessageTime = currentTime
                        messagesProcessed = messagesProcessed + 1
                        shouldRemoveFromQueue = true

                        if debug and messageData.message:find("ITEM_RESPONSE") then
                            print("|cFF00FF00[BOE DEBUG]|r Queue processor: SENT - " .. messageData.message .. " to " .. (messageData.target or "broadcast") .. " via " .. messageData.channel)
                        end
                    else
                        -- Still in cooldown - leave in queue for later, move to next message
                        if debug and messageData.message:find("ITEM_RESPONSE") then
                            print("|cFF00FF00[BOE DEBUG]|r Queue processor: SKIPPED (cooldown) - " .. messageData.message .. " to " .. (messageData.target or "broadcast"))
                        end
                        queueIndex = queueIndex + 1 -- Move to next message without removing this one
                    end
                end

                -- Remove message from queue if we processed it or it's invalid
                if shouldRemoveFromQueue then
                    table.remove(MESSAGE_QUEUE, queueIndex)
                    -- Don't increment queueIndex since we removed an item
                else
                    -- Only increment if we didn't remove anything
                    if not shouldSend or (shouldSend and not shouldRemoveFromQueue) then
                        -- This handles the cooldown case where we already incremented above
                    end
                end
            end
        end
    end)
end

-- Queue a message for sending
local function QueueMessage(prefix, message, channel, target)
    table.insert(MESSAGE_QUEUE, {
        prefix = prefix,
        message = message,
        channel = channel,
        target = target,
        timestamp = GetTime()
    })

    if debug and message:find("ITEM_RESPONSE") then
        print("|cFF00FF00[BOE DEBUG]|r QueueMessage: Added to queue - " .. message .. " to " .. (target or "broadcast") .. " via " .. channel)
        print("|cFF00FF00[BOE DEBUG]|r Queue size is now: " .. #MESSAGE_QUEUE)
    end
end

-- Get list of unique recipients across all channels to avoid duplicates
local function GetUniqueRecipients()
    local recipients = {
        guild = {},
        party = {},
        raid = {},
        friends = {}
    }

    -- Get guild members (check online status)
    if IsInGuild() then
        local numGuildMembers = GetNumGuildMembers()
        for i = 1, numGuildMembers do
            local name, _, _, _, _, _, _, _, online = GetGuildRosterInfo(i)
            if online and name and name ~= UnitName("player") then
                recipients.guild[name] = true
            end
        end
    end

    -- Get party members
    if GetNumPartyMembers() > 0 then
        for i = 1, GetNumPartyMembers() do
            local name = UnitName("party" .. i)
            if name and name ~= UnitName("player") then
                recipients.party[name] = true
            end
        end
    end

    -- Get raid members
    if GetNumRaidMembers() > 0 then
        for i = 1, GetNumRaidMembers() do
            local name = UnitName("raid" .. i)
            if name and name ~= UnitName("player") then
                recipients.raid[name] = true
            end
        end
    end

    -- Get friends (only online ones)
    local numFriends = GetNumFriends()
    for i = 1, numFriends do
        local name, level, class, area, connected = GetFriendInfo(i)
        if connected and name then
            recipients.friends[name] = true
        end
    end

    return recipients
end

-- Smart message sending that avoids duplicates
local function SendMessageSmart(prefix, message, skipWhispers)
    InitializeMessageQueue()

    local recipients = GetUniqueRecipients()
    local channelsSent = {}

    -- Send to appropriate channels, prioritizing broader channels
    if IsInGuild() then
        QueueMessage(prefix, message, "GUILD")
        channelsSent.guild = true
    end

    if GetNumRaidMembers() > 0 then
        QueueMessage(prefix, message, "RAID")
        channelsSent.raid = true
    elseif GetNumPartyMembers() > 0 then
        QueueMessage(prefix, message, "PARTY")
        channelsSent.party = true
    end

    -- Only whisper friends who aren't already covered by guild/party/raid
    if not skipWhispers then
        for friendName in pairs(recipients.friends) do
            local shouldWhisper = true

            -- Skip if they're in guild and we sent to guild
            if channelsSent.guild and recipients.guild[friendName] then
                shouldWhisper = false
            end

            -- Skip if they're in party and we sent to party
            if channelsSent.party and recipients.party[friendName] then
                shouldWhisper = false
            end

            -- Skip if they're in raid and we sent to raid
            if channelsSent.raid and recipients.raid[friendName] then
                shouldWhisper = false
            end

            if shouldWhisper then
                QueueMessage(prefix, message, "WHISPER", friendName)
            end
        end
    end
end

function GetTableSize(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end
-- idk
local function HookChatEditBox()
    local function CaptureItemLink(editBox)
        local text = editBox:GetText()
        if text and text:match("/testboe") then
            local itemLink = text:match("|c%x+|h%[.-%]|h|r")
            if itemLink then
                local itemID = tonumber(itemLink:match("item:(%d+)"))
                if itemID then
                    if not _G.ORIGINAL_ITEM_LINKS then
                        _G.ORIGINAL_ITEM_LINKS = {}
                    end
                    _G.ORIGINAL_ITEM_LINKS[itemID] = itemLink

                end
            end
        end
    end

    -- Hook the default chat frame
    if ChatFrame1EditBox then
        ChatFrame1EditBox:HookScript("OnTextChanged", CaptureItemLink)
    end

    -- Hook other chat frames if they exist
    for i = 1, NUM_CHAT_WINDOWS do
        local editBox = _G["ChatFrame" .. i .. "EditBox"]
        if editBox then
            editBox:HookScript("OnTextChanged", CaptureItemLink)
        end
    end
end

-- Initialize the chat hook
HookChatEditBox()

-- Forge level mapping from the API documentation
local FORGE_LEVEL_MAP = {
    BASE = 0,
    TITANFORGED = 1,
    WARFORGED = 2,
    LIGHTFORGED = 3
}

local function GetForgeLevelFromLink(itemLink)
    if not itemLink then
        return FORGE_LEVEL_MAP.BASE
    end

    if _G.GetItemLinkTitanforge then
        local forgeValue = _G.GetItemLinkTitanforge(itemLink)

        -- Validate the returned value against known FORGE_LEVEL_MAP values
        for _, knownValue in pairs(FORGE_LEVEL_MAP) do
            if forgeValue == knownValue then
                return forgeValue
            end
        end

        -- Try to return the raw value anyway, it might still be useful
        if forgeValue and tonumber(forgeValue) then
            return tonumber(forgeValue)
        end
    end

    return FORGE_LEVEL_MAP.BASE -- Default if API not present or returns unexpected value
end

-- Function to check affix progress using the complex logic described
local function CheckAffixProgress(itemID, affixID, forgeLevel)
    if not _G.GetItemAttuneProgress or not _G.GetAttuneAffixName or not _G.ItemAttuneAffix then
        return 100 -- Assume complete if API not available
    end

    -- Get the affix name
    local affixName = _G.GetAttuneAffixName(itemID, affixID)
    if not affixName then
        return 100 -- Assume complete if we can't get the name
    end

    -- Search through all possible affixes to find matching names
    local affixIndex = nil
    if _G.ItemAttuneAffix then
        for i, affix in ipairs(_G.ItemAttuneAffix) do
            if affix.name == affixName then
                affixIndex = i
                break
            end
        end
    end

    if not affixIndex then
        return 100 -- Assume complete if we can't find the affix
    end

    if bit and bit.lshift and bit.bor then
        local specialItemID = bit.bor(bit.lshift(affixIndex + 1, 16), itemID)

        local progress = _G.GetItemAttuneProgress(specialItemID, affixID, forgeLevel)
        return progress or 0
    end

    return 0 -- Assume not complete if bit operations not available
end

-- Function to load friends from global cache
local function LoadFriendsFromCache()
    -- Always clean up hidden players first
    CleanupHiddenPlayersFromSession()

    if _G.Journal_FriendCache and _G.Journal_FriendCache.friends then
        local currentTime = GetTime()
        local loadedCount = 0

        for playerName, data in pairs(_G.Journal_FriendCache.friends) do
            if not (_G.Journal_FriendCache.hiddenPlayers and _G.Journal_FriendCache.hiddenPlayers[playerName]) then

                local timeDiff = currentTime - (data.lastSeenTime or data.timestamp or currentTime)
                local lastSeenText = "Long ago"

                if timeDiff < 60 then
                    lastSeenText = "Just now"
                elseif timeDiff < 3600 then
                    local minutes = math.floor(timeDiff / 60)
                    lastSeenText = minutes .. "m ago"
                elseif timeDiff < 86400 then
                    local hours = math.floor(timeDiff / 3600)
                    lastSeenText = hours .. "h ago"
                elseif timeDiff < (7 * 24 * 3600) then
                    local days = math.floor(timeDiff / 86400)
                    lastSeenText = days .. "d ago"
                else
                    local days = math.floor(timeDiff / 86400)
                    if days > 30 then
                        lastSeenText = "Over 30d ago"
                    else
                    lastSeenText = days .. "d ago"
                    end
                end

                FRIENDS_DATA[playerName] = {
                    classId = data.classId,
                    attuned = data.attuned,
                    total = data.total,
                    percentage = data.percentage,
                    missingBOE = data.missingBOE or {},
                    top3Dungeons = data.top3Dungeons or {},
                    dungeonDetails = data.dungeonDetails or {},
                    lastSeen = lastSeenText,
                    lastSeenTime = data.lastSeenTime or data.timestamp or currentTime,
                    timestamp = data.timestamp or currentTime,
                    isPlayer = false
                }
                loadedCount = loadedCount + 1
            end
        end

        -- ʕ •ᴥ•ʔ✿ Load silently ✿ʕ •ᴥ•ʔ
    end
end

-- Function to clean up old cache entries
local function CleanupFriendsCache()
    if not _G.Journal_FriendCache then return end

    local currentTime = GetTime()
    local cutoffTime = 180 * 24 * 3600 -- (180 days * 24) >  h * 3600 > seconds
    local cleaned = 0

    for playerName, data in pairs(_G.Journal_FriendCache.friends) do
        if (currentTime - (data.timestamp or 0)) > cutoffTime then
            _G.Journal_FriendCache.friends[playerName] = nil
            cleaned = cleaned + 1
        end
    end

    _G.Journal_FriendCache.lastCleanup = currentTime

    if cleaned > 0 then
        print("|cFF87CEEB[DJ Friends]|r Cleaned up " .. cleaned .. " old friend entries")
    end
end

-- Function to hide/unhide players
local function HidePlayer(playerName, hide)
    if hide then
        _G.Journal_FriendCache.hiddenPlayers[playerName] = true
        _G.Journal_charDB.hiddenPlayers[playerName] = true
        -- Remove from current session
        FRIENDS_DATA[playerName] = nil
        print("|cFFFFD700[DJ Friends]|r Hidden player: " .. playerName)
    else
        _G.Journal_FriendCache.hiddenPlayers[playerName] = nil
        _G.Journal_charDB.hiddenPlayers[playerName] = nil
        print("|cFFFFD700[DJ Friends]|r Unhidden player: " .. playerName)
        -- Reload from cache if available
        LoadFriendsFromCache()
    end

    -- Save the changes immediately to ensure persistence
    SaveFriendsCache()

    -- Update friends display if visible
    if _G.AttunementFriendsFrame and _G.AttunementFriendsFrame:IsShown() and _G.UpdateAttunementFriendsDisplay then
        _G.UpdateAttunementFriendsDisplay()
    end
end

-- Initialize global cache if it doesn't exist
if not _G.Journal_FriendCache then
    _G.Journal_FriendCache = {
        friends = {},
        hiddenPlayers = {},
        lastCleanup = GetTime()
    }
end

-- Initialize character-specific DB if it doesn't exist
_G.Journal_charDB = _G.Journal_charDB or {}
_G.Journal_charDB.friendsAttunementData = _G.Journal_charDB.friendsAttunementData or {}
_G.Journal_charDB.friendsJournalPoints = _G.Journal_charDB.friendsJournalPoints or {}
_G.Journal_charDB.hiddenPlayers = _G.Journal_charDB.hiddenPlayers or {}

-- ʕ •ᴥ•ʔ✿ Initialize global friends data tables ✿ʕ •ᴥ•ʔ
if not _G.FRIENDS_ATTUNEMENT_DATA then
    _G.FRIENDS_ATTUNEMENT_DATA = {}
end
if not _G.FRIENDS_JOURNAL_POINTS then
    _G.FRIENDS_JOURNAL_POINTS = {}
end

-- Load hidden players from Journal_charDB on initialization
for playerName, _ in pairs(_G.Journal_charDB.hiddenPlayers) do
    _G.Journal_FriendCache.hiddenPlayers[playerName] = true
end

-- Initialize friends cache from saved variables
FRIENDS_DATA = FRIENDS_DATA or {}

-- ʕ ◕ᴥ◕ ʔ✿ Load saved friends data into global tables ✿ʕ ◕ᴥ◕ ʔ
local friendsLoaded = 0
for playerName, data in pairs(_G.Journal_charDB.friendsAttunementData) do
    if not _G.Journal_FriendCache.hiddenPlayers[playerName] then
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = data
        FRIENDS_DATA[playerName] = data -- Also populate local FRIENDS_DATA
        friendsLoaded = friendsLoaded + 1
    end
end

local pointsLoaded = 0
for playerName, points in pairs(_G.Journal_charDB.friendsJournalPoints) do
    if not _G.Journal_FriendCache.hiddenPlayers[playerName] then
        _G.FRIENDS_JOURNAL_POINTS[playerName] = points
        pointsLoaded = pointsLoaded + 1
    end
end

-- Function to clean up hidden players from current session data
local function CleanupHiddenPlayersFromSession()
    if _G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers then
        local cleanedCount = 0
        for hiddenPlayer, _ in pairs(_G.Journal_FriendCache.hiddenPlayers) do
            if FRIENDS_DATA[hiddenPlayer] then
                FRIENDS_DATA[hiddenPlayer] = nil
                cleanedCount = cleanedCount + 1
            end
            if _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[hiddenPlayer] then
                _G.FRIENDS_JOURNAL_POINTS[hiddenPlayer] = nil
            end
        end
        if cleanedCount > 0 then
            print("|cFFFF0000[DJ Hidden]|r Cleaned " .. cleanedCount .. " hidden players from session")
        end
    end
end

-- Function to load persistent friends data (called after saved variables are loaded)
local function LoadPersistentFriendsData()
    if not _G.Journal_charDB then
        return
    end

    -- Always clean up hidden players first
    CleanupHiddenPlayersFromSession()

    -- Load friends data
    local loadedFromPersistent = 0
    if _G.Journal_charDB.friendsAttunementData then
        for playerName, data in pairs(_G.Journal_charDB.friendsAttunementData) do
            -- Skip hidden players
            if not (_G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers and _G.Journal_FriendCache.hiddenPlayers[playerName]) then
                FRIENDS_DATA[playerName] = data
                loadedFromPersistent = loadedFromPersistent + 1
            end
        end
    end

    -- Load journal points from persistent data
    local pointsLoaded = 0
    if _G.Journal_charDB.friendsJournalPoints then
        if not _G.FRIENDS_JOURNAL_POINTS then
            _G.FRIENDS_JOURNAL_POINTS = {}
        end
        for playerName, points in pairs(_G.Journal_charDB.friendsJournalPoints) do
            -- Skip hidden players
            if not (_G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers and _G.Journal_FriendCache.hiddenPlayers[playerName]) then
                _G.FRIENDS_JOURNAL_POINTS[playerName] = points
                pointsLoaded = pointsLoaded + 1
            end
        end
    end

    -- Load hidden players
    local hiddenLoaded = 0
    if _G.Journal_charDB.hiddenPlayers then
        for playerName, _ in pairs(_G.Journal_charDB.hiddenPlayers) do
            _G.Journal_FriendCache.hiddenPlayers[playerName] = true
            hiddenLoaded = hiddenLoaded + 1
        end
    end
end

-- Clean up old cache entries periodically
if _G.Journal_FriendCache and (GetTime() - (_G.Journal_FriendCache.lastCleanup or 0)) > (7 * 24 * 3600) then
    CleanupFriendsCache()
end

-- Save debouncing for Core.lua
local saveDebounceCore = {
    timer = nil,
    pending = false,
    lastSave = 0,
    minInterval = 15 -- Minimum 15 seconds between saves
}

-- Function to save friends cache (both character-specific and global) with debouncing
local function SaveFriendsCache(force)
    -- Check if we should debounce this save
    if not force and saveDebounceCore.timer then
        -- Cancel existing timer and restart
        saveDebounceCore.timer:Cancel()
    end

    if not force and not saveDebounceCore.pending then
        saveDebounceCore.pending = true
        saveDebounceCore.timer = C_Timer.After(3, function()
            if GetTime() - saveDebounceCore.lastSave >= saveDebounceCore.minInterval then
                SaveFriendsCache(true) -- Force save after debounce
                saveDebounceCore.lastSave = GetTime()
            end
            saveDebounceCore.pending = false
        end)
        return
    end

    if not force and (GetTime() - saveDebounceCore.lastSave) < saveDebounceCore.minInterval then
        return -- Skip save if too soon
    end

    -- Actual save logic
    _G.Journal_charDB.friendsAttunementData = _G.Journal_charDB.friendsAttunementData or {}
    _G.Journal_charDB.friendsJournalPoints = _G.Journal_charDB.friendsJournalPoints or {}
    _G.Journal_charDB.hiddenPlayers = _G.Journal_charDB.hiddenPlayers or {}

    local savedFriends = 0
    local savedPoints = 0
    local savedHidden = 0

    for playerName, data in pairs(FRIENDS_DATA) do
        _G.Journal_charDB.friendsAttunementData[playerName] = data
        savedFriends = savedFriends + 1
    end

    -- Also save journal points if they exist
    if _G.FRIENDS_JOURNAL_POINTS then
        for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
            _G.Journal_charDB.friendsJournalPoints[playerName] = points
            savedPoints = savedPoints + 1
        end
    end

    -- CRITICAL FIX: Save hidden players to persistent storage
    if _G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers then
        for playerName, _ in pairs(_G.Journal_FriendCache.hiddenPlayers) do
            _G.Journal_charDB.hiddenPlayers[playerName] = true
            savedHidden = savedHidden + 1
        end
    end



    -- Also save to global cross-character cache
    if _G.Journal_FriendCache then
        for playerName, data in pairs(FRIENDS_DATA) do
            if not data.isPlayer and not _G.Journal_FriendCache.hiddenPlayers[playerName] then -- Don't cache our own data globally or hidden players
                _G.Journal_FriendCache.friends[playerName] = {
                    classId = data.classId,
                    attuned = data.attuned,
                    total = data.total,
                    percentage = data.percentage,
                    missingBOE = data.missingBOE,
                    top3Dungeons = data.top3Dungeons,
                    dungeonDetails = data.dungeonDetails,
                    lastSeen = data.lastSeen,
                    lastSeenTime = data.lastSeenTime,
                    timestamp = data.timestamp
                }
            end
        end
    end
end

-- Function to calculate our own attunement percentage (using efficient cache system)
local function CalculateOwnAttunementPercentage()
    local totalAttunable = 0
    local totalAttuned = 0

    -- Get all dungeon data from the efficient cache
    local dungeonData = _G.dungeonData or (_G.Journal and _G.Journal.djDungeons) or {}

    -- Early exit if no dungeon data or APIs not available
    if #dungeonData == 0 then
        return 0, 0
    end

    if not _G.CanAttuneItemHelper or not _G.GetItemAttuneProgress then
        return 0, 0
    end

    -- Use the same calculation method as the working attunement report
    -- This aggregates unique items across all dungeons (same as GenerateAttunementReport)
    local globalUniqueItems = {} -- Track unique items across all dungeons
    local globalAttunedItems = {} -- Track attuned unique items

    -- Access the smart cache if available (from UIFrames.lua)
    local GetCachedAttunement = _G.GetCachedAttunement
    local useCache = GetCachedAttunement ~= nil

    for _, dungeon in ipairs(dungeonData) do
        if dungeon.items then
            for _, itemID in ipairs(dungeon.items) do
                local canAttune = _G.CanAttuneItemHelper(itemID) or 0
                if canAttune == 1 then
                    globalUniqueItems[itemID] = true

                    -- Use cached progress if available, otherwise get fresh data
                    local attuneProgress = 0
                    if useCache then
                        attuneProgress = GetCachedAttunement(itemID)
                        if attuneProgress == nil then
                            -- Not in cache, get fresh data
                            attuneProgress = _G.GetItemAttuneProgress(itemID) or 0
                        end
                    else
                        attuneProgress = _G.GetItemAttuneProgress(itemID) or 0
                    end

                    if attuneProgress >= 100 then
                        globalAttunedItems[itemID] = true
                    end
                end
            end
        end
    end

    -- Calculate actual unique totals (same as GenerateAttunementReport)
    for itemID, _ in pairs(globalUniqueItems) do
        totalAttunable = totalAttunable + 1
        if globalAttunedItems[itemID] then
            totalAttuned = totalAttuned + 1
        end
    end

    return totalAttuned, totalAttunable
end

-- Function to add ourselves to the leaderboard data
local function AddSelfToFriendsData()
    local attuned, total = CalculateOwnAttunementPercentage()
    local percentage = total > 0 and math.floor((attuned / total) * 100) or 0
    local playerName = UnitName("player")
    local _, englishClass = UnitClass("player")
    local classId = _G.CustomGetClassId and _G.CustomGetClassId() or 1 -- Default to Warrior if function not available

    -- Get top 3 dungeons we need most using efficient cache
    local dungeonNeeds = {}
    local dungeonData = _G.dungeonData or (_G.Journal and _G.Journal.djDungeons) or {}

    -- Access the smart cache if available
    local GetCachedAttunement = _G.GetCachedAttunement
    local useCache = GetCachedAttunement ~= nil

    for _, dungeon in ipairs(dungeonData) do
        if dungeon.items then
            local attunablesLeft = 0
            local totalAttunable = 0
            for _, itemID in ipairs(dungeon.items) do
                local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                if canAttune == 1 then
                    totalAttunable = totalAttunable + 1

                    -- Use cached progress if available
                    local attuneProgress = 0
                    if useCache then
                        attuneProgress = GetCachedAttunement(itemID)
                        if attuneProgress == nil then
                            attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                        end
                    else
                        attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                    end

                    if attuneProgress < 100 then
                        attunablesLeft = attunablesLeft + 1
                    end
                end
            end

            if attunablesLeft > 0 then
                table.insert(dungeonNeeds, {
                    name = dungeon.name or "Unknown",
                    needed = attunablesLeft,
                    total = totalAttunable,
                    percentage = totalAttunable > 0 and (attunablesLeft / totalAttunable) or 0
                })
            end
        end
    end

    -- Sort by percentage needed (highest first) then by total needed
    table.sort(dungeonNeeds, function(a, b)
        if math.abs(a.percentage - b.percentage) > 0.001 then
            return a.percentage > b.percentage
        end
        return a.needed > b.needed
    end)

    -- Take top 3 for compact display
    local top3Dungeons = {}
    for i = 1, math.min(3, #dungeonNeeds) do
        table.insert(top3Dungeons, dungeonNeeds[i].name)
    end

    -- Create detailed dungeon list (top 20) with proper attunement percentages
    local dungeonDetails = {}
    for i, dungeon in ipairs(dungeonNeeds) do
        if i > 20 then break end
        table.insert(dungeonDetails, {
            name = dungeon.name,
            attunablesLeft = dungeon.needed,
            totalAttunable = dungeon.total,
            attunementPercentage = dungeon.percentage
        })
    end

    -- Get current quest item if available
    local questItemID = 0
    if Journal_charDB.currentRandomQuest and Journal_charDB.currentRandomQuest.itemID then
        questItemID = Journal_charDB.currentRandomQuest.itemID
    end

    -- Add ourselves to the friends data
    local playerData = {
        classId = classId,
        attuned = attuned,
        total = total,
        percentage = percentage,
        missingBOE = {},
        top3Dungeons = top3Dungeons,
        dungeonDetails = dungeonDetails, -- Add detailed dungeon breakdown
        questItemID = questItemID,
        timestamp = GetTime(),
        lastSeen = "Now",
        isPlayer = true -- Mark as the current player
    }

    FRIENDS_DATA[playerName] = playerData
    _G.FRIENDS_ATTUNEMENT_DATA[playerName] = playerData

    -- ʕ •ᴥ•ʔ✿ Also add journal points to global table ✿ʕ •ᴥ•ʔ
    if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
        _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
    end
end



-- Function to send our attunement data to friends
local function SendAttunementData()
    local attuned, total = CalculateOwnAttunementPercentage()
    local percentage = total > 0 and math.floor((attuned / total) * 100) or 0
    local playerName = UnitName("player")
    local _, englishClass = UnitClass("player")
    local classId = _G.CustomGetClassId and _G.CustomGetClassId() or 1 -- Default to Warrior if function not available

    -- Get top 3 dungeons we need most using efficient cache
    local dungeonNeeds = {}
    local dungeonData = _G.dungeonData or (_G.Journal and _G.Journal.djDungeons) or {}

    -- Access the smart cache if available
    local GetCachedAttunement = _G.GetCachedAttunement
    local useCache = GetCachedAttunement ~= nil

    for _, dungeon in ipairs(dungeonData) do
        if dungeon.items then
            local attunablesLeft = 0
            local totalAttunable = 0
            for _, itemID in ipairs(dungeon.items) do
                local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                if canAttune == 1 then
                    totalAttunable = totalAttunable + 1

                    -- Use cached progress if available
                    local attuneProgress = 0
                    if useCache then
                        attuneProgress = GetCachedAttunement(itemID)
                        if attuneProgress == nil then
                            attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                        end
                    else
                        attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                    end

                    if attuneProgress < 100 then
                        attunablesLeft = attunablesLeft + 1
                    end
                end
            end

            if attunablesLeft > 0 then
                table.insert(dungeonNeeds, {
                    name = dungeon.name or "Unknown",
                    needed = attunablesLeft,
                    total = totalAttunable,
                    percentage = totalAttunable > 0 and (attunablesLeft / totalAttunable) or 0
                })
            end
        end
    end

    -- Sort by percentage needed (highest first) then by total needed
    table.sort(dungeonNeeds, function(a, b)
        if math.abs(a.percentage - b.percentage) > 0.001 then
            return a.percentage > b.percentage
        end
        return a.needed > b.needed
    end)

    -- Take top 3 for compact display
    local top3Dungeons = {}
    for i = 1, math.min(3, #dungeonNeeds) do
        table.insert(top3Dungeons, dungeonNeeds[i].name)
    end

    -- Create detailed dungeon list (top 20) with proper attunement percentages
    local dungeonDetails = {}
    for i, dungeon in ipairs(dungeonNeeds) do
        if i > 20 then break end
        table.insert(dungeonDetails, {
            name = dungeon.name,
            attunablesLeft = dungeon.needed,
            totalAttunable = dungeon.total,
            attunementPercentage = dungeon.percentage
        })
    end

    -- Create data package
    local data = {
        player = playerName,
        classId = classId,
        attuned = attuned,
        total = total,
        percentage = percentage,
        top3Dungeons = top3Dungeons,
        dungeonDetails = dungeonDetails, -- Add detailed dungeon breakdown
        timestamp = GetTime()
    }

    -- Get current quest item if available
    local questItemID = 0
    if Journal_charDB.currentRandomQuest and Journal_charDB.currentRandomQuest.itemID then
        questItemID = Journal_charDB.currentRandomQuest.itemID
    end

    -- Get current journal points
    local journalPoints = Journal_charDB.journalPoints or 0

    local encodedDungeons = ""
    if #top3Dungeons > 0 then
        -- Use a simple encoding that replaces problematic characters
        local safeDungeons = {}
        for _, dungeonName in ipairs(top3Dungeons) do
            -- Replace spaces and colons with safe characters
            local safeName = dungeonName:gsub(" ", "_"):gsub(":", "|"):gsub(",", ";")
            table.insert(safeDungeons, safeName)
        end
        encodedDungeons = table.concat(safeDungeons, ",")
    end

    local message = strjoin(":", "DATA", playerName, classId, attuned, total, percentage, encodedDungeons, questItemID, journalPoints)
    -- Use smart messaging system to avoid duplicates and throttle messages
    SendMessageSmart(ADDON_PREFIX, message, false)
end

-- Function to request attunement data from others
local function RequestAttunementData()
    local message = "REQUEST:" .. UnitName("player")

    -- Use smart messaging system to avoid duplicates and throttle requests
    SendMessageSmart(ADDON_PREFIX, message, false)
end

-- Function to query friends about a specific item (with full link and detailed data)
local function QueryItemFromFriends(itemID, itemLink)
    -- Store the original full item link for later use in whispers
    QUERIED_ITEM_LINKS[itemID] = itemLink

    -- Get detailed item information using the custom API
    local forgeLevel = GetForgeLevelFromLink(itemLink)
    local affixMask1, affixMask2 = 0, 0
    local itemTags1, itemTags2 = 0, 0

    -- Get affix information from the actual item link
    if _G.GetItemAffixMask then
        local possibleMask1, possibleMask2, attunedMask1, attunedMask2 = _G.GetItemAffixMask(itemID)
        affixMask1 = possibleMask1 or 0
        affixMask2 = possibleMask2 or 0
    end

    -- Get item tags for additional context
    if _G.GetItemTagsCustom then
        itemTags1, itemTags2 = _G.GetItemTagsCustom(itemID)
        itemTags1 = itemTags1 or 0
        itemTags2 = itemTags2 or 0
    end

    -- Use a safer encoding method that won't interfere with hyperlinks
    local encodedLink = ""
    if itemLink then
        encodedLink = itemLink:gsub(".", function(c)
            return string.format("%%%02X", string.byte(c))
        end)
    end
    local message = strjoin(":", "ITEM_QUERY", UnitName("player"), itemID, encodedLink, forgeLevel)

    -- Check if message is too long for WoW addon messages (255 character limit)
    if string.len(message) > 255 then
        -- Fallback: send without encoded link to stay under limit
        message = strjoin(":", "ITEM_QUERY", UnitName("player"), itemID, "", forgeLevel, affixMask1, affixMask2, itemTags1, itemTags2)
    end



    -- Use smart messaging system to avoid duplicates and throttle messages
    SendMessageSmart(ADDON_PREFIX, message, false)
end

-- Simplified ItemQualifiesForBagEquip function based on user requirements
local function ItemQualifiesForBagEquip(itemId, itemLink, isEquipNewAffixesOnlyEnabled)
    if not itemLink then
        return false
    end
    if not itemId then itemId = tonumber(itemLink:match("item:(%d+)")) end
    if not itemId then return false end

    -- Check if player can attune this item
    local canPlayerAttuneThisItem = false
    if _G.CanAttuneItemHelper then
        canPlayerAttuneThisItem = (_G.CanAttuneItemHelper(itemId) == 1)
    else
        return false
    end

    if not canPlayerAttuneThisItem then
        return false
    end

    -- Get the progress for this specific variant
    local progress
    if _G.GetItemLinkAttuneProgress then
        progress = _G.GetItemLinkAttuneProgress(itemLink)
        if type(progress) ~= "number" then
            progress = 100
        end
    else
        return false
    end

    if progress >= 100 then
        return false
    end

    if isEquipNewAffixesOnlyEnabled then
        local hasAnyVariantBeenAttuned = true
        if _G.HasAttunedAnyVariantOfItem then
            hasAnyVariantBeenAttuned = _G.HasAttunedAnyVariantOfItem(itemId)
        end

        if not hasAnyVariantBeenAttuned then
            return true
        else
            return false
        end
    else
        return true
    end
end

-- Function to respond to item queries with detailed affix/forge comparison
local function RespondToItemQuery(requester, itemID, itemLink, queriedForgeLevel)
    local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0

    if debug then
        print("|cFF00FF00[BOE DEBUG]|r RespondToItemQuery: requester=" .. requester .. ", itemID=" .. itemID .. ", canAttune=" .. canAttune)
    end

    -- Only respond if we can attune this type of item
    if canAttune < 1 then
        if debug then
            print("|cFF00FF00[BOE DEBUG]|r Not responding - cannot attune this item type (canAttune=" .. canAttune .. ")")
        end
        return
    end

    local needsItem = 0
    local canUpgrade = 0
    local needsAffixesOnly = 0
    local ourForgeLevel = 0

    -- Get our current forge level for this item first
    if _G.GetItemAttuneForge then
        ourForgeLevel = _G.GetItemAttuneForge(itemID) or -1
    end

    local baseProgress = 0
    if _G.GetItemAttuneProgress then
        baseProgress = _G.GetItemAttuneProgress(itemID) or 0
    end

    if debug then
        print("|cFF00FF00[BOE DEBUG]|r RespondToItemQuery: itemID=" .. itemID .. ", ourForgeLevel=" .. ourForgeLevel .. ", baseProgress=" .. baseProgress)
    end

    -- Check if we have the SPECIFIC variant first (most important check)
    local specificProgress = 0
    if itemLink and _G.GetItemLinkAttuneProgress then
        specificProgress = _G.GetItemLinkAttuneProgress(itemLink) or 0
        if debug then
            print("|cFF00FF00[BOE DEBUG]|r Specific variant progress: " .. specificProgress .. "%")
        end
        if specificProgress >= 100 then
            if debug then
                print("|cFF00FF00[BOE DEBUG]|r Not responding - already have this specific variant (100%)")
            end
            return -- Exit early, no response needed
        elseif specificProgress > 0 then
            -- We have this specific variant but it's not complete - we need it!
            needsItem = 1
            if debug then
                print("|cFF00FF00[BOE DEBUG]|r Need this specific variant (partial progress: " .. specificProgress .. "%)")
            end
        end
    end

    -- If we don't have the specific variant, check other conditions
    if specificProgress == 0 then
        if debug then
            print("|cFF00FF00[BOE DEBUG]|r No specific variant progress, checking forge level (ourForgeLevel=" .. ourForgeLevel .. ")")
        end

        -- Check if we need the item based on forge level
        -- -1 = not attuned at any level (need item)
        -- 0+ = attuned at some level, check for upgrades
        if ourForgeLevel == -1 then
            needsItem = 1
            if debug then
                print("|cFF00FF00[BOE DEBUG]|r Need base item (forge level -1 = not attuned)")
            end
        -- Check for upgrade opportunity: queried forge level > our current forge level
        elseif queriedForgeLevel and queriedForgeLevel > ourForgeLevel then
            canUpgrade = 1
            if debug then
                print("|cFF00FF00[BOE DEBUG]|r Can upgrade (our forge=" .. ourForgeLevel .. ", queried forge=" .. queriedForgeLevel .. ")")
            end
        -- Check if we have base item but need this specific affix variant
        elseif ourForgeLevel >= 0 and itemLink then
            -- Check if the item link contains affix information (has more than basic item data)
            -- Item links with affixes typically have additional data beyond the basic format
            local hasAffixes = itemLink:find(":%d+:%d+:%d+:%d+:%d+:%d+:%d+") ~= nil
            if hasAffixes then
                -- This item has affixes, and we have the base - check if we need this specific affix
                needsAffixesOnly = 1
                if debug then
                    print("|cFF00FF00[BOE DEBUG]|r Need affixes only (have base forge=" .. ourForgeLevel .. ", item has affixes)")
                end
            end
        end
    end

    if debug then
        print("|cFF00FF00[BOE DEBUG]|r Final decision: needsItem=" .. needsItem .. ", canUpgrade=" .. canUpgrade .. ", needsAffixesOnly=" .. needsAffixesOnly)
    end

    if needsItem == 1 or canUpgrade == 1 or needsAffixesOnly == 1 then
        local message = strjoin(":", "ITEM_RESPONSE", UnitName("player"), itemID, needsItem, canUpgrade, ourForgeLevel, needsAffixesOnly)

        QueueMessage(ADDON_PREFIX, message, "WHISPER", requester)

        if debug then
            print("|cFF00FF00[BOE DEBUG]|r Queued response to " .. requester .. ": " .. message)
        end

        local itemName = GetItemInfo(itemID) or ("Item " .. itemID)
        local statusText = ""
        local forgeText = ""
        if ourForgeLevel == 1 then forgeText = " (TF)"
        elseif ourForgeLevel == 2 then forgeText = " (WF)"
        elseif ourForgeLevel == 3 then forgeText = " (LF)"
        end

        if needsItem == 1 then
            statusText = "|cFF00FF00NEED|r"
        elseif needsAffixesOnly == 1 then
            statusText = "|cFFFFFF00AFFIXES ONLY|r"
        elseif canUpgrade == 1 then
            statusText = "|cFFFFFF00UPGRADE|r from" .. forgeText
        end

    else
        if debug then
            print("|cFF00FF00[BOE DEBUG]|r Not responding - don't need this item")
        end
    end
end

-- Store item query responses for tooltips (including full item links)
local ITEM_QUERY_RESPONSES = {}
local QUERIED_ITEM_LINKS = {} -- Store original full item links by itemID

-- Event handler for addon messages
local function OnAddonMessage(prefix, message, channel, sender)
    if prefix ~= ADDON_PREFIX then
        return
    end


    local parts = {strsplit(":", message)}
    local msgType = parts[1]

    if debug and (msgType == "ITEM_QUERY" or msgType == "ITEM_RESPONSE") then
        print("|cFF00FF00[BOE DEBUG]|r OnAddonMessage: " .. msgType .. " from " .. sender .. " on " .. channel)
    end

    if msgType == "TEST" then
        -- Test message received

        return
    elseif msgType == "REQUEST" and parts[2] ~= UnitName("player") then
        -- Someone is requesting data, send ours
        SendAttunementData()
    elseif msgType == "DATA" and parts[2] ~= UnitName("player") then
        -- Received someone's attunement data
        local playerName = parts[2]

        -- Skip if player is hidden
        if _G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers[playerName] then
            return
        end

        local classId = tonumber(parts[3]) or 1 -- Default to Warrior (1) if invalid
        local attuned = tonumber(parts[4]) or 0
        local total = tonumber(parts[5]) or 0
        local percentage = tonumber(parts[6]) or 0
        local top3DungeonsStr = parts[7] or ""
        local questItemID = tonumber(parts[8]) or 0
        local journalPoints = tonumber(parts[9]) or 0

        local top3Dungeons = {}
        if top3DungeonsStr ~= "" then
            for dungeonName in gmatch(top3DungeonsStr, "[^,]+") do
                -- Decode the safe characters back to original dungeon names
                local originalName = dungeonName:gsub("_", " "):gsub("|", ":"):gsub(";", ",")
                table.insert(top3Dungeons, originalName)
            end
        end

        -- Calculate time since last seen
        local now = GetTime()
        local existingData = FRIENDS_DATA[playerName]
        local lastSeenText = "Just now"

        -- If this is an update from existing friend, calculate time difference
        if existingData and not existingData.isPlayer then
            local timeDiff = now - (existingData.lastSeenTime or now)
            if timeDiff < 60 then
                lastSeenText = "Just now"
            elseif timeDiff < 3600 then
                local minutes = math.floor(timeDiff / 60)
                lastSeenText = minutes .. "m ago"
            elseif timeDiff < 86400 then
                local hours = math.floor(timeDiff / 3600)
                lastSeenText = hours .. "h ago"
            else
                local days = math.floor(timeDiff / 86400)
                lastSeenText = days .. "d ago"
            end
        end

        -- Generate detailed dungeon breakdown for this friend based on their top3Dungeons
        -- Since we can't transmit detailed data due to message size limits, we'll extrapolate
        -- from their basic data to create a reasonable detailed breakdown
        local dungeonDetails = {}
        if #top3Dungeons > 0 then
            -- Create estimated breakdown based on their top dungeons
            for i, dungeonName in ipairs(top3Dungeons) do
                table.insert(dungeonDetails, {
                    name = dungeonName,
                    attunablesLeft = math.max(1, math.floor((total - attuned) / math.max(1, #top3Dungeons))),
                    totalAttunable = math.max(1, math.floor(total / math.max(1, #top3Dungeons))),
                    attunementPercentage = 0.75 -- Estimate high need since these are their top dungeons
                })
            end
        end

        local friendData = {
            classId = classId,
            attuned = attuned,
            total = total,
            percentage = percentage,
            top3Dungeons = top3Dungeons,
            dungeonDetails = dungeonDetails,
            questItemID = questItemID,
            timestamp = GetTime(),
            lastSeen = lastSeenText,
            lastSeenTime = now,
            isPlayer = false
        }

        FRIENDS_DATA[playerName] = friendData
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = friendData

        -- Store journal points in the global table if they have any
        if journalPoints > 0 then
            if not _G.FRIENDS_JOURNAL_POINTS then
                _G.FRIENDS_JOURNAL_POINTS = {}
            end
            _G.FRIENDS_JOURNAL_POINTS[playerName] = journalPoints
        end
        -- Save to cache
        SaveFriendsCache()

        -- Update the friends frame if it's visible
        if _G.AttunementFriendsFrame and _G.AttunementFriendsFrame:IsShown() then
            _G.UpdateAttunementFriendsDisplay()
        end
    elseif msgType == "ITEM_QUERY" and parts[2] ~= UnitName("player") then
        -- Someone is asking about a specific item with detailed data
        local requester = parts[2]

        -- Skip if requester is hidden
        if _G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers[requester] then
            return
        end
        local itemID = tonumber(parts[3])
        local encodedLink = parts[4]
        local queriedForgeLevel = tonumber(parts[5]) or 0
        local itemLink = nil

        if encodedLink and encodedLink ~= "" then
            -- Decode the hex-encoded item link
            itemLink = encodedLink:gsub("%%(%x%x)", function(hex)
                return string.char(tonumber(hex, 16))
            end)
        end

        if itemID then
            RespondToItemQuery(requester, itemID, itemLink, queriedForgeLevel)
        end
    elseif msgType == "ITEM_RESPONSE" and parts[2] ~= UnitName("player") then
        -- Received response about an item
        local responder = parts[2]
        local itemID = tonumber(parts[3])
        local needsItem = tonumber(parts[4]) or 0
        local canUpgrade = tonumber(parts[5]) or 0
        local currentForge = tonumber(parts[6]) or 0
        local needsAffixesOnly = tonumber(parts[7]) or 0

        -- Skip response if player is hidden
        if _G.Journal_FriendCache and _G.Journal_FriendCache.hiddenPlayers[responder] then
            return
        end

        if itemID then
            if not ITEM_QUERY_RESPONSES[itemID] then
                ITEM_QUERY_RESPONSES[itemID] = {}
            end

            local responseData = {
                needsItem = needsItem == 1,
                canUpgrade = canUpgrade == 1,
                needsAffixesOnly = needsAffixesOnly == 1,
                currentForge = currentForge,
                timestamp = GetTime()
            }
            
            ITEM_QUERY_RESPONSES[itemID][responder] = responseData
            
            -- ʕ •ᴥ•ʔ✿ Save to persistent cache ✿ʕ•ᴥ•ʔ
            if _G.TheJournal_UIBOETooltipEnhancement and _G.TheJournal_UIBOETooltipEnhancement.SaveBOEResponse then
                pcall(function()
                    _G.TheJournal_UIBOETooltipEnhancement.SaveBOEResponse(itemID, responder, responseData)
                end)
            end

            -- Show the response in chat immediately with detailed forge/affix info
            local itemName = GetItemInfo(itemID) or ("Item " .. itemID)
            local statusText = ""
            local forgeText = ""
            if currentForge == 1 then forgeText = " (has TF)"
            elseif currentForge == 2 then forgeText = " (has WF)"
            elseif currentForge == 3 then forgeText = " (has LF)"
            end

            if needsItem == 1 then
                statusText = "|cFF00FF00NEEDS|r"
            elseif needsAffixesOnly == 1 then
                statusText = "|cFFFFFF00NEEDS [AFFIXES ONLY]|r" .. forgeText
            elseif canUpgrade == 1 then
                statusText = "|cFFFFFF00CAN UPGRADE|r" .. forgeText
            end

            if statusText ~= "" then
                if debug then
                    print("|cFF00FF00[BOE DEBUG]|r Received response from " .. responder .. ": " .. statusText)
                end
            end
            -- ʕ •ᴥ•ʔ✿ Removed 30-second cleanup - now handled by persistent cache system ✿ʕ•ᴥ•ʔ
        end
    end
end

-- Register the event handler
local commFrame = CreateFrame("Frame")
commFrame:RegisterEvent("CHAT_MSG_ADDON")
commFrame:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
    OnAddonMessage(prefix, message, channel, sender)
end)

-- Periodic timer to update last seen times for cached friends
local function UpdateLastSeenTimes()
    local now = GetTime()
    local updated = false

    for playerName, data in pairs(FRIENDS_DATA) do
        if not data.isPlayer and data.lastSeenTime then
            local timeDiff = now - data.lastSeenTime
            local newLastSeenText = "Just now"

            if timeDiff < 60 then
                newLastSeenText = "Just now"
            elseif timeDiff < 3600 then
                local minutes = math.floor(timeDiff / 60)
                newLastSeenText = minutes .. "m ago"
            elseif timeDiff < 86400 then
                local hours = math.floor(timeDiff / 3600)
                newLastSeenText = hours .. "h ago"
            else
                local days = math.floor(timeDiff / 86400)
                newLastSeenText = days .. "d ago"
            end

            if data.lastSeen ~= newLastSeenText then
                data.lastSeen = newLastSeenText
                updated = true
            end
        end
    end

    -- Save cache and update display if anything changed
    if updated then
        SaveFriendsCache()
        if _G.AttunementFriendsFrame and _G.AttunementFriendsFrame:IsShown() then
            if _G.ForceUpdateAttunementFriendsDisplay then
                _G.ForceUpdateAttunementFriendsDisplay() -- ʕ •ᴥ•ʔ✿ Force update for time changes ✿ʕ•ᴥ•ʔ
            elseif _G.UpdateAttunementFriendsDisplay then
                _G.UpdateAttunementFriendsDisplay()
            end
        end
    end
end

-- Update last seen times every 5 minutes (300 seconds) instead of 30 seconds
-- WotLK compatible timer instead of C_Timer
local updateTimer = CreateFrame("Frame")
updateTimer:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed >= 300 then -- Changed from 30 to 300 seconds
        self.elapsed = 0
        UpdateLastSeenTimes()
    end
end)

-- Create IsAttunableBySomeone function if it doesn't exist
if not _G.IsAttunableBySomeone then
    _G.IsAttunableBySomeone = function(itemID)
        -- Simple fallback: check if any known attunement function exists for this item
        if _G.CanAttuneItemHelper then
            return (_G.CanAttuneItemHelper(itemID) or 0) > 0
        end
        return false
    end
end

-- Create a frame to handle logout events
local logoutFrame = CreateFrame("Frame")
logoutFrame:RegisterEvent("PLAYER_LOGOUT")
logoutFrame:SetScript("OnEvent", function(self, event)
    -- Save hidden players state on logout
    if Journal_charDB and _G.Journal_FriendCache then
        Journal_charDB.hiddenPlayers = Journal_charDB.hiddenPlayers or {}
        for playerName, _ in pairs(_G.Journal_FriendCache.hiddenPlayers) do
            Journal_charDB.hiddenPlayers[playerName] = true
        end
    end
end)

-- Expose functions globally
_G.SendAttunementData = SendAttunementData
_G.RequestAttunementData = RequestAttunementData
_G.QueryItemFromFriends = QueryItemFromFriends
_G.AddSelfToFriendsData = AddSelfToFriendsData
_G.HidePlayer = HidePlayer
_G.SaveFriendsCache = SaveFriendsCache
_G.SendMessageSmart = SendMessageSmart
_G.QueueMessage = QueueMessage
_G.InitializeMessageQueue = InitializeMessageQueue
_G.CleanupHiddenPlayersFromSession = CleanupHiddenPlayersFromSession
_G.FRIENDS_ATTUNEMENT_DATA = FRIENDS_DATA
_G.ITEM_QUERY_RESPONSES = ITEM_QUERY_RESPONSES
_G.QUERIED_ITEM_LINKS = QUERIED_ITEM_LINKS
_G.ItemQualifiesForBagEquip = ItemQualifiesForBagEquip

-- Initialize DJ_Settings if not already done
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false, filterType = "All", autoTestBoe = false }

local settings = Journal_charDB
--------------------------------------------------------------------
-- INITIALIZATION ON ADDON LOAD
--------------------------------------------------------------------
-- Initialize saved variables
local function InitializeSavedVars()
    -- Initialize global saved variable
    _G.Journal_FriendCache = _G.Journal_FriendCache or {
        friends = {},
        hiddenPlayers = {},
        lastCleanup = GetTime()
    }

    -- Initialize character-specific saved variable
    _G.Journal_charDB = _G.Journal_charDB or {}
    _G.Journal_charDB.hiddenPlayers = _G.Journal_charDB.hiddenPlayers or {}
end

-- Create initialization frame
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "TheJournal" then
        InitializeSavedVars()

        -- Load hidden players from character DB to runtime cache
        for playerName, _ in pairs(_G.Journal_charDB.hiddenPlayers) do
            _G.Journal_FriendCache.hiddenPlayers[playerName] = true
        end

        -- Load persistent friends data immediately after addon loads
        LoadPersistentFriendsData()

        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_LOGIN" then
        -- Ensure data is loaded and add ourselves to friends data after login
        -- Use a longer delay to ensure all APIs are available
        C_Timer.After(5, function()
            LoadPersistentFriendsData()
            if _G.AddSelfToFriendsData then
                _G.AddSelfToFriendsData()
            end
            -- Save the updated data
            if _G.SaveFriendsCache then
                _G.SaveFriendsCache()
            end

            -- Check if calculation works now
            local attuned, total = CalculateOwnAttunementPercentage()
        end)

        self:UnregisterEvent("PLAYER_LOGIN")
    end
end)

-- Globals / saved variables
-- Put these in _G if you want other files to reference them easily
_G.Journal_charDB = _G.Journal_charDB or {}
_G.Journal_charDB.favorites = _G.Journal_charDB.favorites or {} -- itemID -> true if favorited
_G.Journal_charDB.currentVersionIndex = _G.Journal_charDB.currentVersionIndex or 1
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false }

-- If needed as globals elsewhere:
_G.lastBossNavDungeon = _G.lastBossNavDungeon or nil
_G.currentBossIndex = _G.currentBossIndex or 1

-- Access the global table of dungeons
local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
_G.dungeonData = dungeonData

-- Frame for loading, events, etc.
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Additional initialization after login
        C_Timer.After(3, function()
            -- Check if our attunement calculation is working
            local attuned, total = CalculateOwnAttunementPercentage()

            -- Ensure we're added to friends data
            if _G.AddSelfToFriendsData then
                _G.AddSelfToFriendsData()
            end

            -- ʕ •ᴥ•ʔ✿ Initialize bag scanner ✿ʕ •ᴥ•ʔ
            if _G.TheJournal_UIBagScanner and _G.TheJournal_UIBagScanner.Initialize then
                _G.TheJournal_UIBagScanner.Initialize()
            end
        end)
    end
end)

-- Slash command to toggle
SLASH_DJ1 = "/dj"
SlashCmdList["DJ"] = function(msg)
    local args = string.lower(msg or "")

    if args == "questmessage" then
        Journal_charDB.shareQuestCompletion = not Journal_charDB.shareQuestCompletion
        local status = Journal_charDB.shareQuestCompletion and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"
        print("|cFFFFD700[DJ Quest]|r Quest completion sharing " .. status)
    elseif args == "" then
        if DungeonJournalFrame then
            DungeonJournalFrame:Show()

            -- ʕ •ᴥ•ʔ✿ Refresh bag scanner when opening journal ✿ʕ •ᴥ•ʔ
            if _G.TheJournal_UIBagScanner and _G.TheJournal_UIBagScanner.RefreshBagScan then
                _G.TheJournal_UIBagScanner.RefreshBagScan()
            end

            -- ʕ •ᴥ•ʔ✿ Invalidate attunement cache when opening journal ✿ʕ •ᴥ•ʔ
            if _G.TheJournal_UIBagScanner and _G.TheJournal_UIBagScanner.InvalidateAttunementCache then
                _G.TheJournal_UIBagScanner.InvalidateAttunementCache()
            end
        end
    else
        print("|cFFFFD700[DJ Commands]|r Available commands:")
        print("|cFFFFD700[DJ Commands]|r /dj questmessage - Toggle quest completion sharing")
        print("|cFFFFD700[DJ Commands]|r /djscale <number> - Set UI scale (e.g., /djscale 75 for 75%)")
        print("|cFFFFD700[DJ Commands]|r /dj scalereset - Reset UI scale to 100% (normal size)")
        print("|cFFFFD700[DJ Commands]|r /testboe [item] - Test if friends need BOE item")
        print("|cFFFFD700[DJ Commands]|r /testboe auto - Toggle automatic BOE testing on tooltip hover")
        print("|cFFFFD700[DJ Commands]|r /boedebug - Toggle debug mode for BOE testing")
        print("|cFFFFD700[DJ Commands]|r /djc - Open settings panel")
        print("|cFFFFD700[DJ Commands]|r /dj - Open Dungeon Journal")
    end
end

-- Slash command to recache
SLASH_DJRECACHE1 = "/djcache"
SlashCmdList["DJRECACHE"] = function(msg)
    Journal_charDB.cached = {}
    print("|cFF00FF00[DJ Cache]|r Cache cleared")
end
SLASH_DJWIPE = "/djwipe"
SlashCmdList["DJWIPE"] = function(msg)
    _G.Journal_charDB = {}
    print("|cFF00FF00[DJ Wipe]|r All data wiped")
end

-- Slash command to search for boss drops
SLASH_DJBOSS1 = "/djboss"
SlashCmdList["DJBOSS"] = function(msg)
    if not msg or msg == "" then
        print("|cff66ccff[DJ Boss]|r Usage: /djboss <boss_name_or_id>")
        print("|cff66ccff[DJ Boss]|r Examples:")
        print("|cff66ccff[DJ Boss]|r   /djboss Kel'Thuzad")
        print("|cff66ccff[DJ Boss]|r   /djboss 15990")
        return
    end

    -- Check if ItemLoc functions exist
    if not ItemLocIsLoaded or not ItemLocIsLoaded() then
        print("|cff66ccff[DJ Boss]|r ItemLoc database not available")
        return
    end

    local bossId = tonumber(msg)
    local bossName = msg

    -- If not a number, try to find boss ID by name
    if not bossId then
        bossId = FindBossIdByName(bossName)
        if not bossId then
            print("|cff66ccff[DJ Boss]|r Boss not found:", bossName)
            print("|cff66ccff[DJ Boss]|r Try using the boss ID instead, or check spelling")
            return
        end
    end

    ShowBossDrops(bossId, bossName)
end

-- ʕ •ᴥ•ʔ✿ Auto testboe setting - sync with character database ✿ʕ •ᴥ•ʔ
_G.DJ_Settings = _G.DJ_Settings or {}
-- Load from character database if available
if Journal_charDB and Journal_charDB.autoTestBoe ~= nil then
    _G.DJ_Settings.autoTestBoe = Journal_charDB.autoTestBoe
else
    _G.DJ_Settings.autoTestBoe = _G.DJ_Settings.autoTestBoe or false
    -- Save to character database
    if Journal_charDB then
        Journal_charDB.autoTestBoe = _G.DJ_Settings.autoTestBoe
    end
end

-- ʕ •ᴥ•ʔ✿ Function to perform BOE test (shared between manual and automatic) ✿ʕ •ᴥ•ʔ
local function PerformBOETest(itemID, itemLink, isAutomatic)
    if not itemID then
        if not isAutomatic then
            print("|cFFFFD700[BOE Test]|r Invalid item ID")
        end
        return
    end

    -- Store the original link for later use
    _G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}
    _G.ORIGINAL_ITEM_LINKS[itemID] = itemLink

    local itemName = GetItemInfo(itemID)
    if not itemName then
        if not isAutomatic then
            print("|cFFFFD700[BOE Test]|r Could not get item info")
        end
        return
    end

    if not isAutomatic then
        print("|cFFFFD700[BOE Test]|r Checking if friends need " .. itemName)
    end

    if not _G.QueryItemFromFriends then
        if not isAutomatic then
            print("|cFFFF0000[BOE Test]|r ERROR: QueryItemFromFriends function not available!")
        end
        return
    end

    _G.QueryItemFromFriends(itemID, itemLink)

    -- ʕ •ᴥ•ʔ✿ Mark item as queried in persistent cache ✿ʕ•ᴥ•ʔ
    if _G.TheJournal_UIBOETooltipEnhancement and _G.TheJournal_UIBOETooltipEnhancement.MarkItemQueried then
        pcall(function()
            _G.TheJournal_UIBOETooltipEnhancement.MarkItemQueried(itemID)
        end)
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Initialize responses table if needed (don't clear existing responses) ✿ʕ ◕ᴥ◕ ʔ
    if not ITEM_QUERY_RESPONSES[itemID] then
        ITEM_QUERY_RESPONSES[itemID] = {}
    end

    -- Set up a simple timer to check for responses
    local responseFrame = CreateFrame("Frame")
    responseFrame.startTime = GetTime()
    responseFrame.itemID = itemID
    responseFrame.itemName = itemName
    responseFrame.isAutomatic = isAutomatic
    responseFrame:SetScript("OnUpdate", function(self, elapsed)
        local timeElapsed = GetTime() - self.startTime

        if timeElapsed >= 2.5 then
            self:SetScript("OnUpdate", nil)

            local responseCount = 0
            local needResponses = {}
            local upgradeResponses = {}
            local affixResponses = {}

            if ITEM_QUERY_RESPONSES[self.itemID] then
                for responder, data in pairs(ITEM_QUERY_RESPONSES[self.itemID]) do
                    responseCount = responseCount + 1

                    if data.needsItem then
                        table.insert(needResponses, responder)
                    elseif data.canUpgrade then
                        local forgeText = ""
                        if data.currentForge == 1 then forgeText = " (has TF)"
                        elseif data.currentForge == 2 then forgeText = " (has WF)"
                        elseif data.currentForge == 3 then forgeText = " (has LF)"
                        end
                        table.insert(upgradeResponses, responder .. forgeText)
                    elseif data.needsAffixesOnly then
                        local forgeText = ""
                        if data.currentForge == 1 then forgeText = " (has TF)"
                        elseif data.currentForge == 2 then forgeText = " (has WF)"
                        elseif data.currentForge == 3 then forgeText = " (has LF)"
                        end
                        table.insert(affixResponses, responder .. forgeText)
                    end
                end
            end

            -- Only show responses if there are any, or if manual command
            if responseCount > 0 or not self.isAutomatic then
                local prefix = self.isAutomatic and "|cFF87CEEB[Auto BOE]|r" or "|cFF00FF00[BOE Test]|r"

                if responseCount > 0 then
                    print(prefix .. " " .. responseCount .. " friends responded about " .. self.itemName .. ":")

                    if #needResponses > 0 then
                        print("|cFF00FF00  NEED:|r " .. table.concat(needResponses, ", "))
                    end

                    if #upgradeResponses > 0 then
                        print("|cFFFFFF00  UPGRADE:|r " .. table.concat(upgradeResponses, ", "))
                    end

                    if #affixResponses > 0 then
                        print("|cFFFFFF00  AFFIXES ONLY:|r " .. table.concat(affixResponses, ", "))
                    end
                elseif not self.isAutomatic then
                    print("|cFFFF0000[BOE Test]|r No responses received for " .. self.itemName)
                end
            end
        end
    end)
end

-- Slash command for simplified BOE testing
SLASH_TESTBOE1 = "/testboe"
SlashCmdList["TESTBOE"] = function(msg)
    local args = string.lower(msg or "")

    -- Handle auto toggle
    if args == "auto" then
        _G.DJ_Settings.autoTestBoe = not _G.DJ_Settings.autoTestBoe
        -- ʕ •ᴥ•ʔ✿ Save to character database ✿ʕ •ᴥ•ʔ
        if Journal_charDB then
            Journal_charDB.autoTestBoe = _G.DJ_Settings.autoTestBoe
        end
        local status = _G.DJ_Settings.autoTestBoe and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"
        print("|cFFFFD700[BOE Test]|r Automatic BOE testing " .. status)
        print("|cFFFFD700[BOE Test]|r Auto mode will check items when you hover over them in tooltips")
        return
    end

    -- Handle help
    if args == "help" or args == "" then
        print("|cFFFFD700[BOE Test]|r Usage:")
        print("|cFFFFD700[BOE Test]|r   /testboe [Item Link] - Test if friends need this item")
        print("|cFFFFD700[BOE Test]|r   /testboe auto - Toggle automatic testing on tooltip hover")
        print("|cFFFFD700[BOE Test]|r   /testboe help - Show this help")
        print("|cFFFFD700[BOE Test]|r Examples:")
        print("|cFFFFD700[BOE Test]|r   /tt (while hovering item tooltip)")
        print("|cFFFFD700[BOE Test]|r   /testboe Brimstone Igniter")
        local autoStatus = _G.DJ_Settings.autoTestBoe and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"
        print("|cFFFFD700[BOE Test]|r Auto mode is currently " .. autoStatus)
        print("|cFFFFD700[BOE Test]|r Use /tt while hovering any item tooltip for manual testing")
        return
    end

    -- Parse item from message
    local link = msg:match("(|c%x+|Hitem:%d+:[^|]-|h%[.-%]|h|r)")
    local itemID

    if link then
        itemID = tonumber(link:match("item:(%d+)"))
    else
        -- Try to extract just the hyperlink part without color codes
        link = msg:match("(|Hitem:%d+:[^|]-|h%[.-%]|h)")
        if link then
            -- Add default color codes
            link = "|cffffffff" .. link .. "|r"
            itemID = tonumber(link:match("item:(%d+)"))
        else
            -- No hyperlink: treat msg as a bare item name
            local name = msg:gsub("^%s*", ""):gsub("%[", ""):gsub("%]", "")
            if name ~= "" then
                local _, gotLink = GetItemInfo(name)
                if gotLink then
                    link = gotLink
                    itemID = tonumber(link:match("item:(%d+)"))
                else
                    print("|cFFFFD700[BOE Test]|r Item not found: " .. name)
                    print("|cFFFFD700[BOE Test]|r Try using /tt while hovering the item or using the exact item name")
                    return
                end
            else
                print("|cFFFFD700[BOE Test]|r Usage: /testboe [item name] or /tt while hovering")
                return
            end
        end
    end

    PerformBOETest(itemID, link, false)
end

-- Function to find boss ID by name from dungeon data
function FindBossIdByName(searchName)
    if not _G.dungeonData then
        return nil
    end

    local searchLower = searchName:lower()

    for _, dungeon in ipairs(_G.dungeonData) do
        if dungeon.bosses then
            for _, boss in ipairs(dungeon.bosses) do
                if boss.name and boss.bossID then
                    local bossNameLower = boss.name:lower()
                    if bossNameLower:find(searchLower, 1, true) then
                        return boss.bossID
                    end
                end
            end
        end
    end

    return nil
end

-- Function to display drops from a specific boss
function ShowBossDrops(bossId, bossName)
    if not ItemLocGetObjCount then
        print("|cff66ccff[DJ Boss]|r ItemLoc functions not available")
        return
    end

    -- Get items that drop from this boss (creature type = 1)
    local count = ItemLocGetObjCount(1, bossId)
    if not count or count == 0 then
        print("|cff66ccff[DJ Boss]|r No drops found for boss ID:", bossId)
        return
    end

    print("|cff66ccff[DJ Boss]|r" .. string.rep("=", 50))
    print("|cff66ccff[DJ Boss]|r Drops from:", bossName or ("Boss ID " .. bossId))
    print("|cff66ccff[DJ Boss]|r Total items:", count)
    print("|cff66ccff[DJ Boss]|r" .. string.rep("=", 50))

    local items = {}

    -- Collect all items
    for i = 1, count do
        local srcType, itemId, chance, dropsPerThousand = ItemLocGetObjAt(1, bossId, i)
        if itemId then
            table.insert(items, {
                itemId = itemId,
                chance = chance or 0,
                dropsPerThousand = dropsPerThousand or 0
            })
        end
    end

    -- Sort by drop chance (highest first)
    table.sort(items, function(a, b)
        return (a.chance or 0) > (b.chance or 0)
    end)

    -- Display items
    for i, item in ipairs(items) do
        local itemName, itemLink, quality = GetItemInfo(item.itemId)
        if not itemName then
            itemName = "Item " .. item.itemId
            itemLink = "|cffffffff[" .. itemName .. "]|r"
        end

        local qualityColor = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
        local chanceText = item.chance > 0 and string.format("%.2f%%", item.chance) or "Unknown%"

        print(string.format("|cff66ccff[DJ Boss]|r %d. %s%s|r - %s",
            i, qualityColor.hex, itemName, chanceText))
    end

    print("|cff66ccff[DJ Boss]|r" .. string.rep("=", 50))
end

-- Slash command to enable debug mode for BOE testing
SLASH_BOEDEBUG1 = "/boedebug"
SlashCmdList["BOEDEBUG"] = function(msg)
    debug = not debug
    print("|cFFFFD700[BOE Debug]|r Debug mode " .. (debug and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"))
end

-- Slash command to check message queue status
SLASH_CHECKQUEUE1 = "/checkqueue"
SlashCmdList["CHECKQUEUE"] = function(msg)
    print("|cFF00FF00[Queue Status]|r Message queue has " .. #MESSAGE_QUEUE .. " messages")

    if #MESSAGE_QUEUE > 0 then
        print("|cFF00FF00[Queue Status]|r Recent messages in queue:")
        for i = math.max(1, #MESSAGE_QUEUE - 5), #MESSAGE_QUEUE do
            local msg = MESSAGE_QUEUE[i]
            local age = GetTime() - msg.timestamp
            print("  " .. i .. ". " .. msg.message .. " to " .. (msg.target or "broadcast") .. " via " .. msg.channel .. " (age: " .. string.format("%.1f", age) .. "s)")
        end
    end

    local currentTime = GetTime()
    print("|cFF00FF00[Queue Status]|r Recent recipients cooldown:")
    local count = 0
    for recipientKey, lastSent in pairs(RECENT_RECIPIENTS) do
        local timeSince = currentTime - lastSent
        if timeSince < 10 then -- Show recent ones
            print("  " .. recipientKey .. ": " .. string.format("%.1f", timeSince) .. "s ago")
            count = count + 1
        end
    end
    if count == 0 then
        print("  (none in last 10 seconds)")
    end
end

-- Slash command to check item attunement progress
SLASH_CHECKITEM1 = "/checkitem"
SlashCmdList["CHECKITEM"] = function(msg)
    local itemID = tonumber(msg)
    if not itemID then
        print("|cFFFFD700[Check Item]|r Usage: /checkitem <itemID>")
        print("|cFFFFD700[Check Item]|r Example: /checkitem 60619")
        return
    end

    local itemName = GetItemInfo(itemID) or ("Item " .. itemID)
    print("|cFF00FF00[Check Item]|r Checking " .. itemName .. " (ID: " .. itemID .. ")")

    local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
    print("  Can Attune: " .. (canAttune == 1 and "|cFF00FF00Yes|r" or "|cFFFF0000No|r") .. " (" .. canAttune .. ")")

    if canAttune == 1 then
        local baseProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
        print("  Base Progress: " .. baseProgress .. "%")

        local ourForgeLevel = _G.GetItemAttuneForge and _G.GetItemAttuneForge(itemID) or -1
        local forgeText = ""
        if ourForgeLevel == -1 then
            forgeText = "Not Attuned"
        elseif ourForgeLevel == 0 then
            forgeText = "Base"
        elseif ourForgeLevel == 1 then
            forgeText = "Titanforge"
        elseif ourForgeLevel == 2 then
            forgeText = "Warforge"
        elseif ourForgeLevel == 3 then
            forgeText = "Lightforge"
        else
            forgeText = "Unknown (" .. ourForgeLevel .. ")"
        end
        print("  Current Forge Level: " .. ourForgeLevel .. " (" .. forgeText .. ")")

        if ourForgeLevel == -1 then
            print("  |cFF00FF00Result: NEED this item (not attuned)|r")
        elseif ourForgeLevel >= 0 then
            print("  |cFFFFFF00Result: Have base - might need upgrades/affixes|r")
        end
    else
        print("  |cFFFF0000Result: Cannot attune this item type|r")
    end
end

-- Slash command to simulate a BOE response for testing
SLASH_SIMULATEBOE1 = "/simulateboe"
SlashCmdList["SIMULATEBOE"] = function(msg)
    local args = {strsplit(" ", msg)}
    local itemID = tonumber(args[1])
    local playerName = args[2] or "TestPlayer"
    local responseType = args[3] or "needs" -- needs, upgrade, affixes

    if not itemID then
        print("|cFFFFD700[BOE Simulate]|r Usage: /simulateboe <itemID> [playerName] [needs|upgrade|affixes]")
        print("|cFFFFD700[BOE Simulate]|r Example: /simulateboe 60619 Cringer needs")
        return
    end

    local needsItem = (responseType == "needs") and 1 or 0
    local canUpgrade = (responseType == "upgrade") and 1 or 0
    local needsAffixesOnly = (responseType == "affixes") and 1 or 0
    local currentForge = 0

    -- Simulate the ITEM_RESPONSE message
    local message = strjoin(":", "ITEM_RESPONSE", playerName, itemID, needsItem, canUpgrade, currentForge, needsAffixesOnly)
    OnAddonMessage("DJ_ATTUNE", message, "WHISPER", playerName)

    print("|cFF00FF00[BOE Simulate]|r Simulated response from " .. playerName .. " for item " .. itemID .. " (" .. responseType .. ")")
end

-- Slash command to hide players from BOE responses
SLASH_HIDEPLAYER1 = "/hideplayer"
SLASH_HIDEPLAYER2 = "/hidepl"
SlashCmdList["HIDEPLAYER"] = function(msg)
    local playerName = msg:match("^%s*(.-)%s*$") -- Trim whitespace

    if not playerName or playerName == "" then
        print("|cFFFFD700[DJ Friends]|r Usage: /hideplayer <PlayerName>")
        print("|cFFFFD700[DJ Friends]|r Hides a player from BOE item responses and friends list")
        return
    end

    -- Capitalize first letter
    playerName = playerName:gsub("^%l", string.upper)

    HidePlayer(playerName, true)
end

-- Slash command to unhide players
SLASH_UNHIDEPLAYER1 = "/unhideplayer"
SLASH_UNHIDEPLAYER2 = "/unhidepl"
SlashCmdList["UNHIDEPLAYER"] = function(msg)
    local playerName = msg:match("^%s*(.-)%s*$") -- Trim whitespace

    if not playerName or playerName == "" then
        print("|cFFFFD700[DJ Friends]|r Usage: /unhideplayer <PlayerName>")
        print("|cFFFFD700[DJ Friends]|r Unhides a player and allows their BOE responses")
        return
    end

    -- Capitalize first letter
    playerName = playerName:gsub("^%l", string.upper)

    HidePlayer(playerName, false)
end

-- Slash command to list hidden players
SLASH_LISTHIDDEN1 = "/listhidden"
SLASH_LISTHIDDEN2 = "/hiddenlist"
SlashCmdList["LISTHIDDEN"] = function(msg)
    if not _G.Journal_FriendCache or not _G.Journal_FriendCache.hiddenPlayers then
        print("|cFFFFD700[DJ Friends]|r No hidden players")
        return
    end

    local hiddenCount = 0
    local hiddenList = {}

    for playerName, _ in pairs(_G.Journal_FriendCache.hiddenPlayers) do
        hiddenCount = hiddenCount + 1
        table.insert(hiddenList, playerName)
    end

    if hiddenCount == 0 then
        print("|cFFFFD700[DJ Friends]|r No hidden players")
    else
        print("|cFFFFD700[DJ Friends]|r Hidden players (" .. hiddenCount .. "):")
        table.sort(hiddenList)
        for _, name in ipairs(hiddenList) do
            print("  " .. name)
        end
        print("|cFFFFD700[DJ Friends]|r Use /unhideplayer <name> to unhide")
    end
end

-- Slash command to manually reload and send data
SLASH_DJRELOAD1 = "/djreload"
SlashCmdList["DJRELOAD"] = function(msg)
    print("|cFF00FF00[DJ Reload]|r Reloading friends data...")

    -- Load persistent data
    LoadPersistentFriendsData()

    -- Force recalculate our own data (ignore cache)
    local attuned, total = CalculateOwnAttunementPercentage()
    print("|cFF00FF00[DJ Reload]|r Calculated attunement: " .. attuned .. "/" .. total)

    -- Add ourselves to friends data
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
        local playerName = UnitName("player")
        if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
            print("|cFF00FF00[DJ Reload]|r Self data: " .. _G.FRIENDS_DATA[playerName].attuned .. "/" .. _G.FRIENDS_DATA[playerName].total .. " (" .. _G.FRIENDS_DATA[playerName].percentage .. "%)")
        end
    end

    -- Save the data
    if _G.SaveFriendsCache then
        _G.SaveFriendsCache()
    end

    -- Send data to friends
    if _G.SendAttunementData then
        _G.SendAttunementData()
    end

    print("|cFF00FF00[DJ Reload]|r Reload complete")
end

-- Slash command to force recalculate attunement (ignore all cache)
SLASH_DJRECALC1 = "/djrecalc"
SlashCmdList["DJRECALC"] = function(msg)
    print("|cFF00FF00[DJ Recalc]|r Force recalculating attunement...")

    -- Enable debug temporarily to see what's happening
    local oldDebug = debug
    debug = true

    local attuned, total = CalculateOwnAttunementPercentage()
    print("|cFF00FF00[DJ Recalc]|r Result: " .. attuned .. "/" .. total)

    -- Restore debug state
    debug = oldDebug

    -- Force update our data
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
        local playerName = UnitName("player")
        if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
            print("|cFF00FF00[DJ Recalc]|r Updated self data: " .. _G.FRIENDS_DATA[playerName].attuned .. "/" .. _G.FRIENDS_DATA[playerName].total .. " (" .. _G.FRIENDS_DATA[playerName].percentage .. "%)")
        end
    end
end

-- Slash command to check API availability
SLASH_DJAPI1 = "/djapi"
SlashCmdList["DJAPI"] = function(msg)
    print("|cFF00FF00[DJ API Check]|r Checking API availability...")

    -- Check dungeon data
    local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
    print("|cFF00FF00[DJ API]|r Journal table: " .. tostring(_G.Journal ~= nil))
    print("|cFF00FF00[DJ API]|r djDungeons: " .. tostring(_G.Journal and _G.Journal.djDungeons ~= nil))
    print("|cFF00FF00[DJ API]|r Dungeon count: " .. #dungeonData)

    -- Check APIs
    print("|cFF00FF00[DJ API]|r CanAttuneItemHelper: " .. tostring(_G.CanAttuneItemHelper ~= nil))
    print("|cFF00FF00[DJ API]|r GetItemAttuneProgress: " .. tostring(_G.GetItemAttuneProgress ~= nil))

    -- Test with a known item if APIs are available
    if _G.CanAttuneItemHelper and _G.GetItemAttuneProgress and #dungeonData > 0 then
        local testDungeon = dungeonData[1]
        if testDungeon and testDungeon.items and #testDungeon.items > 0 then
            local testItemID = testDungeon.items[1]
            print("|cFF00FF00[DJ API]|r Testing with item " .. testItemID .. " from " .. (testDungeon.name or "Unknown"))

            local canAttune = _G.CanAttuneItemHelper(testItemID)
            local progress = _G.GetItemAttuneProgress(testItemID)

            print("|cFF00FF00[DJ API]|r Test result: canAttune=" .. tostring(canAttune) .. ", progress=" .. tostring(progress))
        end
    end
end

-- Slash command to manage friends cache
SLASH_FRIENDSCACHE1 = "/friendscache"
SLASH_FRIENDSCACHE2 = "/fcache"
SlashCmdList["FRIENDSCACHE"] = function(msg)
    local cmd = msg:match("^%s*(%S+)")

    if cmd == "clear" then
        if _G.Journal_FriendCache then
            _G.Journal_FriendCache.friends = {}
            print("|cFF87CEEB[DJ Friends]|r Cleared friends cache")
        end
    elseif cmd == "cleanup" then
        CleanupFriendsCache()
    elseif cmd == "reload" then
        LoadFriendsFromCache()
    elseif cmd == "save" then
        SaveFriendsCache()
        print("|cFF87CEEB[DJ Friends]|r Saved friends cache")
    elseif cmd == "cleanhidden" then
        CleanupHiddenPlayersFromSession()
        print("|cFF87CEEB[DJ Friends]|r Cleaned hidden players from current session")
    elseif cmd == "info" then
        if _G.Journal_FriendCache then
            local friendCount = 0
            local hiddenCount = 0

            for _ in pairs(_G.Journal_FriendCache.friends) do
                friendCount = friendCount + 1
            end

            for _ in pairs(_G.Journal_FriendCache.hiddenPlayers) do
                hiddenCount = hiddenCount + 1
            end

            print("|cFF87CEEB[DJ Friends]|r Cache Info:")
            print("  Cached friends: " .. friendCount)
            print("  Hidden players: " .. hiddenCount)
            print("  Active session friends: " .. GetTableSize(FRIENDS_DATA))

            local lastCleanup = _G.Journal_FriendCache.lastCleanup or 0
            local timeSinceCleanup = GetTime() - lastCleanup
            local daysAgo = math.floor(timeSinceCleanup / (24 * 3600))
            print("  Last cleanup: " .. daysAgo .. " days ago")
        else
            print("|cFF87CEEB[DJ Friends]|r No cache initialized")
        end
    else
        print("|cFF87CEEB[DJ Friends]|r Friends Cache Commands:")
        print("  /fcache info      - Show cache statistics")
        print("  /fcache clear     - Clear all cached friends")
        print("  /fcache cleanup   - Remove old entries (30+ days)")
        print("  /fcache reload    - Reload friends from cache")
        print("  /fcache save      - Save current friends to cache")
        print("  /fcache cleanhidden - Remove hidden players from session")
        print("")
        print("|cFFFFD700[DJ Friends]|r Player Management:")
        print("  /hideplayer <name>   - Hide player from BOE responses")
        print("  /unhideplayer <name> - Unhide player")
        print("  /listhidden          - List all hidden players")
    end
end
-- Addon Message Tracking System
local ADDON_MESSAGE_STATS = {
    allMessages = {},  -- All message records with timestamps
    currentMinute = {},  -- Messages in current minute
    totalSent = 0,
    startTime = GetTime(),
    warningThreshold = 50,  -- Warn if more than 50 messages per minute
    maxThreshold = 100      -- Alert if more than 100 messages per minute
}

-- Hook SendAddonMessage to track all calls
local originalSendAddonMessage = SendAddonMessage
SendAddonMessage = function(prefix, message, chatType, target, priority)
    local currentTime = GetTime()

    -- Record this message
    local messageRecord = {
        timestamp = currentTime,
        prefix = prefix,
        chatType = chatType,
        target = target or "broadcast",
        messageLength = string.len(message),
        source = "unknown"
    }

    -- Simple source detection without expensive debugstack
    if prefix == "DJ_ATTUNE" then
        messageRecord.source = "DJ_ATTUNE"
    -- ʕ •ᴥ•ʔ✿ DISABLED: DJ_POINTS removed - using omega-merged messages ✿ʕ•ᴥ•ʔ
    -- elseif prefix == "DJ_POINTS" then
    --     messageRecord.source = "DJ_POINTS"
    end

    -- Add to tracking
    table.insert(ADDON_MESSAGE_STATS.allMessages, messageRecord)
    table.insert(ADDON_MESSAGE_STATS.currentMinute, messageRecord)
    ADDON_MESSAGE_STATS.totalSent = ADDON_MESSAGE_STATS.totalSent + 1

    -- Clean up old messages (keep only last 60 seconds for current minute tracking)
    local cutoffTime = currentTime - 60
    local newCurrentMinute = {}
    for _, msg in ipairs(ADDON_MESSAGE_STATS.currentMinute) do
        if msg.timestamp > cutoffTime then
            table.insert(newCurrentMinute, msg)
        end
    end
    ADDON_MESSAGE_STATS.currentMinute = newCurrentMinute

    -- Only warn on very high rates to avoid spam
    local messagesThisMinute = #ADDON_MESSAGE_STATS.currentMinute
    if messagesThisMinute >= ADDON_MESSAGE_STATS.maxThreshold then
        print("|cFFFF0000[DJ WARNING]|r High message rate: " .. messagesThisMinute .. " messages/minute!")
    end

    -- Call original function
    return originalSendAddonMessage(prefix, message, chatType, target, priority)
end

-- Command to show addon message statistics
SLASH_DJSTATS1 = "/djstats"
SlashCmdList["DJSTATS"] = function(msg)
    local currentTime = GetTime()
    local sessionTime = currentTime - ADDON_MESSAGE_STATS.startTime

    print("|cFF00FF00[DJ Message Stats]|r === ADDON MESSAGE STATISTICS ===")
    print("Session duration: " .. string.format("%.1f", sessionTime) .. " seconds (" .. string.format("%.1f", sessionTime/60) .. " minutes)")
    print("Total messages sent: " .. ADDON_MESSAGE_STATS.totalSent)
    print("Messages in last 60s: " .. #ADDON_MESSAGE_STATS.currentMinute)
    print("Average per minute: " .. string.format("%.1f", (ADDON_MESSAGE_STATS.totalSent / math.max(1, sessionTime/60))))

    -- Show breakdown by source
    local sourceCounts = {}
    local channelCounts = {}
    local last5Minutes = currentTime - 300  -- Last 5 minutes

    for _, msg in ipairs(ADDON_MESSAGE_STATS.allMessages) do
        if msg.timestamp > last5Minutes then
            sourceCounts[msg.source] = (sourceCounts[msg.source] or 0) + 1
            channelCounts[msg.chatType] = (channelCounts[msg.chatType] or 0) + 1
        end
    end

    print("\n|cFFFFD700[Last 5 Minutes by Source]|r")
    for source, count in pairs(sourceCounts) do
        print("  " .. source .. ": " .. count)
    end

    print("\n|cFFFFD700[Last 5 Minutes by Channel]|r")
    for channel, count in pairs(channelCounts) do
        print("  " .. channel .. ": " .. count)
    end

    -- Show recent activity
    if #ADDON_MESSAGE_STATS.currentMinute > 0 then
        print("\n|cFFFFD700[Recent Messages (last 60s)]|r")
        local recentCount = math.min(10, #ADDON_MESSAGE_STATS.currentMinute)
        for i = #ADDON_MESSAGE_STATS.currentMinute - recentCount + 1, #ADDON_MESSAGE_STATS.currentMinute do
            local msg = ADDON_MESSAGE_STATS.currentMinute[i]
            local timeAgo = currentTime - msg.timestamp
            print(string.format("  %.1fs ago: %s to %s (%s, %db)",
                timeAgo, msg.prefix, msg.chatType .. (msg.target ~= "broadcast" and (":" .. msg.target) or ""),
                msg.source, msg.messageLength))
        end
    end

    -- Show rate warnings
    local rate = #ADDON_MESSAGE_STATS.currentMinute
    if rate >= ADDON_MESSAGE_STATS.maxThreshold then
        print("\n|cFFFF0000[WARNING]|r 🚨 Message rate is VERY HIGH! Risk of self-muting!")
    elseif rate >= ADDON_MESSAGE_STATS.warningThreshold then
        print("\n|cFFFFFF00[WARNING]|r ⚠️  Message rate is elevated")
    else
        print("\n|cFF00FF00[STATUS]|r ✅ Message rate is healthy")
    end

    print("|cFF00FF00[DJ Message Stats]|r === END STATISTICS ===")
end

-- Save to persistent data
local function SavePersistentFriendsData()
    if not _G.Journal_charDB then
        _G.Journal_charDB = {}
    end

    -- Save friends data
    local savedFriends = 0
    _G.Journal_charDB.friendsAttunementData = {}
    for playerName, data in pairs(FRIENDS_DATA) do
        if not (_G.Journal_FriendCache.hiddenPlayers and _G.Journal_FriendCache.hiddenPlayers[playerName]) then
            _G.Journal_charDB.friendsAttunementData[playerName] = data
            savedFriends = savedFriends + 1
        end
    end

    -- Save journal points
    local savedPoints = 0
    if _G.FRIENDS_JOURNAL_POINTS then
        _G.Journal_charDB.friendsJournalPoints = {}
        for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
            if not (_G.Journal_FriendCache.hiddenPlayers and _G.Journal_FriendCache.hiddenPlayers[playerName]) then
                _G.Journal_charDB.friendsJournalPoints[playerName] = points
                savedPoints = savedPoints + 1
            end
        end
    end

    -- Save hidden players
    local savedHidden = 0
    _G.Journal_charDB.hiddenPlayers = {}
    for playerName, _ in pairs(_G.Journal_FriendCache.hiddenPlayers) do
        _G.Journal_charDB.hiddenPlayers[playerName] = true
        savedHidden = savedHidden + 1
    end
end

-- Command to show current Journal_charDB data state
SLASH_DJDATA1 = "/djdata"
SlashCmdList["DJDATA"] = function(msg)
    print("|cFFFF0000[DJ Data Debug]|r === JOURNAL_CHARDB STATE ===")
    print("Journal_charDB.journalPoints: " .. tostring(Journal_charDB.journalPoints or "nil"))
    print("Journal_charDB.currentRandomQuest: " .. tostring(Journal_charDB.currentRandomQuest and "exists" or "nil"))
    if Journal_charDB.currentRandomQuest then
        print("  itemID: " .. tostring(Journal_charDB.currentRandomQuest.itemID or "nil"))
        print("  sourceName: " .. tostring(Journal_charDB.currentRandomQuest.sourceName or "nil"))
    end

    local playerName = UnitName("player")
    if FRIENDS_DATA[playerName] then
        print("FRIENDS_DATA[" .. playerName .. "].questItemID: " .. tostring(FRIENDS_DATA[playerName].questItemID or "nil"))
    end

    if _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[playerName] then
        print("FRIENDS_JOURNAL_POINTS[" .. playerName .. "]: " .. tostring(_G.FRIENDS_JOURNAL_POINTS[playerName]))
    end
    print("|cFFFF0000[DJ Data Debug]|r === END DEBUG ===")
end

-- ʕ •ᴥ•ʔ✿ Export global functions for other modules ✿ʕ •ᴥ•ʔ
_G.AddSelfToFriendsData = AddSelfToFriendsData
_G.SendAttunementData = SendAttunementData
_G.RequestAttunementData = RequestAttunementData
_G.SavePersistentFriendsData = SavePersistentFriendsData
_G.PerformBOETest = PerformBOETest

-- Slash command to test auto BOE functionality
SLASH_TESTAUTOBOE1 = "/testautoboe"
SlashCmdList["TESTAUTOBOE"] = function(msg)
    print("|cFFFFD700[Auto BOE Debug]|r === AUTO BOE TEST ===")

    -- Check if auto BOE is enabled
    local autoEnabled = _G.DJ_Settings and _G.DJ_Settings.autoTestBoe or false
    print("Auto BOE Enabled: " .. (autoEnabled and "|cFF00FF00YES|r" or "|cFFFF0000NO|r"))

    -- Check if PerformBOETest function exists
    local performExists = _G.PerformBOETest ~= nil
    print("PerformBOETest Function: " .. (performExists and "|cFF00FF00EXISTS|r" or "|cFFFF0000MISSING|r"))

    -- Check if ProcessBOETooltip function exists
    local processExists = _G.ProcessBOETooltip ~= nil
    print("ProcessBOETooltip Function: " .. (processExists and "|cFF00FF00EXISTS|r" or "|cFFFF0000MISSING|r"))

    -- Check if tooltip hooks are working
    print("GameTooltip Available: " .. (GameTooltip and "|cFF00FF00YES|r" or "|cFFFF0000NO|r"))

    -- Check DJ_Settings state
    if _G.DJ_Settings then
        print("DJ_Settings.autoTestBoe: " .. tostring(_G.DJ_Settings.autoTestBoe))
        print("DJ_Settings.filterType: " .. tostring(_G.DJ_Settings.filterType))
    else
        print("DJ_Settings: |cFFFF0000MISSING|r")
    end

    -- Check Journal_charDB state
    if Journal_charDB then
        print("Journal_charDB.autoTestBoe: " .. tostring(Journal_charDB.autoTestBoe))
    else
        print("Journal_charDB: |cFFFF0000MISSING|r")
    end

    print("|cFFFFD700[Auto BOE Debug]|r === END TEST ===")
    print("|cFFFFD700[Auto BOE Debug]|r Instructions:")
    print("1. Make sure '/testboe auto' shows 'enabled'")
    print("2. Hover over a BOE item in your bags")
    print("3. Look for debug messages in chat")
    print("4. If no debug messages appear, the tooltip hooks aren't working")
end
