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
                    class = data.class,
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
        
        if loadedCount > 0 then
            print("|cFF87CEEB[DJ Friends]|r Loaded " .. loadedCount .. " friends from cache")
        end
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
    if not _G.Journal_FriendCache then
        _G.Journal_FriendCache = {friends = {}, hiddenPlayers = {}, lastCleanup = GetTime()}
    end
    
    if hide then
        _G.Journal_FriendCache.hiddenPlayers[playerName] = true
        -- Remove from current session
        FRIENDS_DATA[playerName] = nil
        print("|cFFFFD700[DJ Friends]|r Hidden player: " .. playerName)
    else
        _G.Journal_FriendCache.hiddenPlayers[playerName] = nil
        print("|cFFFFD700[DJ Friends]|r Unhidden player: " .. playerName)
        -- Reload from cache if available
        LoadFriendsFromCache()
    end
    
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

-- Initialize friends cache from saved variables
FRIENDS_DATA = FRIENDS_DATA or {}

-- Function to load persistent friends data (called after saved variables are loaded)
local function LoadPersistentFriendsData()
    -- Load from global cache first (this provides base data)
    LoadFriendsFromCache()

    -- Load from UIFrames persistent data (highest priority - overwrites cache data)
    if Journal_charDB and Journal_charDB.friendsAttunementData then
        local loadedFromPersistent = 0
        for playerName, data in pairs(Journal_charDB.friendsAttunementData) do
            FRIENDS_DATA[playerName] = data
            loadedFromPersistent = loadedFromPersistent + 1
        end
        if loadedFromPersistent > 0 then
            print("|cFF00FF00[DJ Friends]|r Loaded " .. loadedFromPersistent .. " friends from persistent data")
        end
    end

    -- Load journal points from persistent data
    if Journal_charDB and Journal_charDB.friendsJournalPoints then
        _G.FRIENDS_JOURNAL_POINTS = _G.FRIENDS_JOURNAL_POINTS or {}
        local pointsLoaded = 0
        for playerName, points in pairs(Journal_charDB.friendsJournalPoints) do
            _G.FRIENDS_JOURNAL_POINTS[playerName] = points
            pointsLoaded = pointsLoaded + 1
        end
        if pointsLoaded > 0 then
            print("|cFF00FF00[DJ Friends]|r Loaded " .. pointsLoaded .. " friends with journal points")
        end
    end
    
    -- Update the global reference
    _G.FRIENDS_ATTUNEMENT_DATA = FRIENDS_DATA
    
    -- Update friends display if it's available
    if _G.UpdateAttunementFriendsDisplay then
        _G.UpdateAttunementFriendsDisplay()
    end
end

-- Clean up old cache entries periodically
if _G.Journal_FriendCache and (GetTime() - (_G.Journal_FriendCache.lastCleanup or 0)) > (7 * 24 * 3600) then
    CleanupFriendsCache()
end

-- Function to save friends cache (both character-specific and global)
local function SaveFriendsCache()
    -- Save to character-specific settings
    Journal_charDB.friendsCache = FRIENDS_DATA
    Journal_charDB.friendsCacheTime = GetTime()
    
    -- Save to UIFrames persistent data system (highest priority)
    Journal_charDB.friendsAttunementData = Journal_charDB.friendsAttunementData or {}
    Journal_charDB.friendsJournalPoints = Journal_charDB.friendsJournalPoints or {}
    
    local savedFriends = 0
    local savedPoints = 0
    
    for playerName, data in pairs(FRIENDS_DATA) do
        Journal_charDB.friendsAttunementData[playerName] = data
        savedFriends = savedFriends + 1
    end
    
    -- Also save journal points if they exist
    if _G.FRIENDS_JOURNAL_POINTS then
        for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
            Journal_charDB.friendsJournalPoints[playerName] = points
            savedPoints = savedPoints + 1
        end
    end
    
    -- Save confirmation for user feedback
    if savedFriends > 0 or savedPoints > 0 then
        print("|cFF00FF00[DJ Friends]|r Saved " .. savedFriends .. " friends and " .. savedPoints .. " journal points")
    end
    
    -- Also save to global cross-character cache
    if _G.Journal_FriendCache then
        for playerName, data in pairs(FRIENDS_DATA) do
            if not data.isPlayer then -- Don't cache our own data globally
                _G.Journal_FriendCache.friends[playerName] = {
                    class = data.class,
                    attuned = data.attuned,
                    total = data.total,
                    percentage = data.percentage,
                    missingBOE = data.missingBOE,
                    top3Dungeons = data.top3Dungeons,
                    dungeonDetails = data.dungeonDetails, -- Cache detailed dungeon data
                    lastSeen = data.lastSeen,
                    lastSeenTime = data.lastSeenTime,
                    timestamp = data.timestamp
                }
            end
        end
    end
end

-- Function to calculate our own attunement percentage
local function CalculateOwnAttunementPercentage()
    local totalAttunable = 0
    local totalAttuned = 0
    
    -- Get all dungeon data
    local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
    local processedItems = {} -- Track unique items across all dungeons
    
    for _, dungeon in ipairs(dungeonData) do
        if dungeon.items then
            for _, itemID in ipairs(dungeon.items) do
                -- Only count each item once (since items can appear in multiple dungeons)
                if not processedItems[itemID] then
                    processedItems[itemID] = true
                    
                    local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                    if canAttune == 1 then
                        totalAttunable = totalAttunable + 1
                        local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                        if attuneProgress >= 100 then
                            totalAttuned = totalAttuned + 1
                        end
                    end
                end
            end
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
    
    -- Get top 3 dungeons we need most
    local dungeonNeeds = {}
    local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
    
    for _, dungeon in ipairs(dungeonData) do
        if dungeon.items then
            local attunablesLeft = 0
            local totalAttunable = 0
            for _, itemID in ipairs(dungeon.items) do
                local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                if canAttune == 1 then
                    totalAttunable = totalAttunable + 1
                    local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
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
    
    -- Add ourselves to the friends data
    FRIENDS_DATA[playerName] = {
        class = englishClass,
        attuned = attuned,
        total = total,
        percentage = percentage,
        missingBOE = {},
        top3Dungeons = top3Dungeons,
        dungeonDetails = dungeonDetails, -- Add detailed dungeon breakdown
        timestamp = GetTime(),
        lastSeen = "Now",
        isPlayer = true -- Mark as the current player
    }
end



-- Function to send our attunement data to friends
local function SendAttunementData()
    local attuned, total = CalculateOwnAttunementPercentage()
    local percentage = total > 0 and math.floor((attuned / total) * 100) or 0
    local playerName = UnitName("player")
    local _, englishClass = UnitClass("player")
    
    -- Get top 3 dungeons we need most
    local dungeonNeeds = {}
    local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
    
    for _, dungeon in ipairs(dungeonData) do
        if dungeon.items then
            local attunablesLeft = 0
            local totalAttunable = 0
            for _, itemID in ipairs(dungeon.items) do
                local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                if canAttune == 1 then
                    totalAttunable = totalAttunable + 1
                    local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
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
        class = englishClass,
        attuned = attuned,
        total = total,
        percentage = percentage,
        top3Dungeons = top3Dungeons,
        dungeonDetails = dungeonDetails, -- Add detailed dungeon breakdown
        timestamp = GetTime()
    }
    
    -- Create minimal message for network transmission (lightweight)
    local message = strjoin(":", "DATA", playerName, englishClass, attuned, total, percentage,  table.concat(top3Dungeons, ","))
    
    -- Send to guild and party members
    --SendAddonMessage(ADDON_PREFIX, message, "WORLD")
    if IsInGuild() then
        SendAddonMessage(ADDON_PREFIX, message, "GUILD")
    end
    if GetNumPartyMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, message, "PARTY")
    end
    if GetNumRaidMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, message, "RAID")
    end
    
    -- Send to online friends via whisper
    local numFriends = GetNumFriends()
    if numFriends > 0 then
        for i = 1, numFriends do
            local name, level, class, area, connected = GetFriendInfo(i)
            if connected and name then
                SendAddonMessage(ADDON_PREFIX, message, "WHISPER", name)
            end
        end
    end
end

-- Function to request attunement data from others
local function RequestAttunementData()
    local message = "REQUEST:" .. UnitName("player")
    local friendsSent = 0
    
    if IsInGuild() then
        SendAddonMessage(ADDON_PREFIX, message, "GUILD")
    end
    if GetNumPartyMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, message, "PARTY")
    end
    if GetNumRaidMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, message, "RAID")
    end
    
    -- Request from online friends via whisper
    local numFriends = GetNumFriends()
    if numFriends > 0 then
        for i = 1, numFriends do
            local name, level, class, area, connected = GetFriendInfo(i)
            if connected and name then
                SendAddonMessage(ADDON_PREFIX, message, "WHISPER", name)
                friendsSent = friendsSent + 1
            end
        end
    end
    
    if friendsSent > 0 then
        print("|cFF00FF00[DJ Friends]|r Requested attunement data from " .. friendsSent .. " online friends")
    end
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
    
    print("|cFFFFD700[DJ BOE]|r Querying friends about: " .. (itemLink or ("Item " .. itemID)) .. " (Forge: " .. forgeLevel .. ")")
    
    if IsInGuild() then
        SendAddonMessage(ADDON_PREFIX, message, "GUILD")
    end
    if GetNumPartyMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, message, "PARTY")
    end
    if GetNumRaidMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, message, "RAID")
    end
    
    -- Query online friends via whisper
    local numFriends = GetNumFriends()
    if numFriends > 0 then
        for i = 1, numFriends do
            local name, level, class, area, connected = GetFriendInfo(i)
            if connected and name then
                SendAddonMessage(ADDON_PREFIX, message, "WHISPER", name)
            end
        end
    end
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

    -- Only respond if we can attune this type of item
    if canAttune < 1 then
        return
    end
    
    local needsItem = 0
    local canUpgrade = 0
    local needsAffixesOnly = 0
    local ourForgeLevel = 0
    
    -- Get our current forge level for this item first
    if _G.GetItemAttuneForge then
        ourForgeLevel = _G.GetItemAttuneForge(itemID) or 0
    end
    
    local baseProgress = 0
    if _G.GetItemAttuneProgress then
        baseProgress = _G.GetItemAttuneProgress(itemID) or 0
    end
    
    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r   baseProgress: " .. tostring(baseProgress))
    end
    
    -- Check if we have the SPECIFIC variant first (most important check)
    local specificProgress = 0
    if itemLink and _G.GetItemLinkAttuneProgress then
        specificProgress = _G.GetItemLinkAttuneProgress(itemLink) or 0
        if specificProgress >= 100 then
            return -- Exit early, no response needed
        elseif specificProgress > 0 then
            -- We have this specific variant but it's not complete - we need it!
            needsItem = 1
        end
    end
    
    -- If we don't have the specific variant, check other conditions
    if specificProgress == 0 then
        -- Check if we need the base item first
        if baseProgress < 100 then
            needsItem = 1
        -- Check for upgrade opportunity: queried forge level > our current forge level
        elseif queriedForgeLevel and queriedForgeLevel > ourForgeLevel then
            canUpgrade = 1
                -- Check if we have base item but need this specific affix variant
        elseif baseProgress >= 100 and itemLink then
            -- Check if the item link contains affix information (has more than basic item data)
            -- Item links with affixes typically have additional data beyond the basic format
            local hasAffixes = itemLink:find(":%d+:%d+:%d+:%d+:%d+:%d+:%d+") ~= nil
            if hasAffixes then
                -- This item has affixes, and we have the base - check if we need this specific affix
                needsAffixesOnly = 1
            end
        end
    end
     
    if needsItem == 1 or canUpgrade == 1 or needsAffixesOnly == 1 then
        local message = strjoin(":", "ITEM_RESPONSE", UnitName("player"), itemID, needsItem, canUpgrade, ourForgeLevel, needsAffixesOnly)
        
        SendAddonMessage(ADDON_PREFIX, message, "WHISPER", requester)
        
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
        print("|cFF87CEEB[BOE Response]|r Told " .. requester .. " I " .. statusText .. " " .. itemName .. " (Queried: " .. (queriedForgeLevel or 0) .. " vs Mine: " .. ourForgeLevel .. ")")
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
    
    if msgType == "TEST" then
        -- Test message received
        print("|cFF00FF00[DJ DEBUG]|r Received TEST message from " .. sender .. ": " .. message)
        return
    elseif msgType == "REQUEST" and parts[2] ~= UnitName("player") then
        -- Someone is requesting data, send ours
        SendAttunementData()
    elseif msgType == "DATA" and parts[2] ~= UnitName("player") then
        -- Received someone's attunement data
        local playerName = parts[2]
        local playerClass = parts[3] or "WARRIOR"
        local attuned = tonumber(parts[4]) or 0
        local total = tonumber(parts[5]) or 0
        local percentage = tonumber(parts[6]) or 0
        local top3DungeonsStr = parts[7] or ""  -- Fixed: was parts[8], now parts[7] since we removed BOE count
        
        local top3Dungeons = {}
        if top3DungeonsStr ~= "" then
            for dungeonName in gmatch(top3DungeonsStr, "[^,]+") do
                table.insert(top3Dungeons, dungeonName)
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
        
        FRIENDS_DATA[playerName] = {
            class = playerClass,
            attuned = attuned,
            total = total,
            percentage = percentage,
            top3Dungeons = top3Dungeons,
            dungeonDetails = dungeonDetails, 
            timestamp = GetTime(),
            lastSeen = lastSeenText,
            lastSeenTime = now,
            isPlayer = false
        }
        
        -- Save to cache
        SaveFriendsCache()
        
        -- Update the friends frame if it's visible
        if _G.AttunementFriendsFrame and _G.AttunementFriendsFrame:IsShown() then
            _G.UpdateAttunementFriendsDisplay()
        end
    elseif msgType == "ITEM_QUERY" and parts[2] ~= UnitName("player") then
        -- Someone is asking about a specific item with detailed data
        local requester = parts[2]
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
            
            ITEM_QUERY_RESPONSES[itemID][responder] = {
                needsItem = needsItem == 1,
                canUpgrade = canUpgrade == 1,
                needsAffixesOnly = needsAffixesOnly == 1,
                currentForge = currentForge,
                timestamp = GetTime()
            }
            
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
                print("|cFF87CEEB[BOE Response]|r " .. responder .. " " .. statusText .. " " .. itemName)
            end
            
            -- Clear old responses after 30 seconds (use simple timer for WotLK compatibility)
            local cleanupFrame = CreateFrame("Frame")
            cleanupFrame:SetScript("OnUpdate", function(self, elapsed)
                self.elapsed = (self.elapsed or 0) + elapsed
                if self.elapsed >= 30 then
                    if ITEM_QUERY_RESPONSES[itemID] and ITEM_QUERY_RESPONSES[itemID][responder] then
                        ITEM_QUERY_RESPONSES[itemID][responder] = nil
                    end
                    self:SetScript("OnUpdate", nil)
                end
            end)
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
        if _G.AttunementFriendsFrame and _G.AttunementFriendsFrame:IsShown() and _G.UpdateAttunementFriendsDisplay then
            _G.UpdateAttunementFriendsDisplay()
        end
    end
end

-- Update last seen times every 30 seconds
-- WotLK compatible timer instead of C_Timer
local updateTimer = CreateFrame("Frame")
updateTimer:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed >= 30 then
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

-- Expose functions globally
_G.SendAttunementData = SendAttunementData
_G.RequestAttunementData = RequestAttunementData
_G.QueryItemFromFriends = QueryItemFromFriends
_G.AddSelfToFriendsData = AddSelfToFriendsData
_G.HidePlayer = HidePlayer
_G.SaveFriendsCache = SaveFriendsCache
_G.FRIENDS_ATTUNEMENT_DATA = FRIENDS_DATA
_G.ITEM_QUERY_RESPONSES = ITEM_QUERY_RESPONSES
_G.QUERIED_ITEM_LINKS = QUERIED_ITEM_LINKS
_G.ItemQualifiesForBagEquip = ItemQualifiesForBagEquip

-- Initialize DJ_Settings if not already done
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false, filterType = "All" }

local settings = Journal_charDB
--------------------------------------------------------------------
-- INITIALIZATION ON ADDON LOAD
--------------------------------------------------------------------
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == "TheJournal" then
                -- Initialize character-specific settings
        settings.showDungeonName = (settings.showDungeonName == nil) and true or settings.showDungeonName
        settings.hasAlreadyCached = settings.hasAlreadyCached or false
        settings.cached = settings.cached or {}
        settings.recacheScheduled = settings.recacheScheduled or {}
        settings.favorites = settings.favorites or {}
        settings.filterType = settings.filterType or "All"
        settings.leveledBoss = settings.leveledBoss or {}
        settings.activeFilters = settings.activeFilters or {}
        settings.levelUpClickCount = settings.levelUpClickCount or {}
        
        -- Initialize cross-character friends cache
        if not _G.Journal_FriendCache then
            _G.Journal_FriendCache = {
                friends = {}, -- playerName -> friend data
                hiddenPlayers = {}, -- playerName -> true for hidden players
                lastCleanup = GetTime()
            }
        end
        
        -- Initialize ItemLoc integration setting
        if settings.useItemLocData == nil then
            settings.useItemLocData = true -- Default to enabled
        end

        -- Default armor and weapon types, plus armor slots
        local localizedClass, englishClass = UnitClass("player")
        if not settings.allowedArmorType then
            settings.allowedArmorType = {
                WARRIOR     = { "Plate", "Mail", "Leather" },
                DEATHKNIGHT = { "Plate", "Mail", "Leather" },
                PALADIN     = { "Plate", "Mail", "Leather", "Cloth" },
                HUNTER      = { "Mail", "Leather" },
                ROGUE       = { "Leather" },
                PRIEST      = { "Cloth" },
                MAGE        = { "Cloth" },
                WARLOCK     = { "Cloth" },
                DRUID       = { "Leather", "Cloth" },
                SHAMAN      = { "Mail", "Leather", "Cloth" },
            }
        end

        if not settings.allowedWeaponType then
            settings.allowedWeaponType = {
                WARRIOR     = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms", "Shield" },
                DEATHKNIGHT = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms" },
                PALADIN     = { "One-Handed Maces", "One-Handed Swords", "Two-Handed Maces", "Two-Handed Swords",
                    "Daggers", "Fist Weapons", "Staves", "Shield" },
                HUNTER      = { "Bows", "Guns", "Crossbows", "Daggers", "One-Handed Swords", "One-Handed Axes", "Fist Weapons" },
                ROGUE       = { "Daggers", "Fist Weapons", "One-Handed Swords", "One-Handed Axes" },
                PRIEST      = { "Daggers", "Staves", "Wands", "One-Handed Maces" },
                MAGE        = { "Daggers", "Staves", "Wands", "One-Handed Swords", "Two-Handed Swords", "Shield" },
                WARLOCK     = { "Daggers", "Staves", "Wands", "One-Handed Swords" },
                DRUID       = { "Daggers", "Fist Weapons", "Staves", "One-Handed Maces" },
                SHAMAN      = { "One-Handed Axes", "One-Handed Maces", "Two-Handed Maces", "Staves", "Daggers", "Fist Weapons", "Shield" },
            }
        end

        if not settings.allowedArmorSlots then
            settings.allowedArmorSlots = {
                Head     = true,
                Neck     = true,
                Shoulder = true,
                Back     = true,
                Chest    = true,
                Wrist    = true,
                Hands    = true,
                Waist    = true,
                Legs     = true,
                Feet     = true,
                Finger   = true,
                Trinket  = true,
            }
        end
        
        -- Load persistent friends data now that saved variables are available
        LoadPersistentFriendsData()
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
end)

-- Slash command to toggle
SLASH_DJ1 = "/dj"
SlashCmdList["DJ"] = function(msg)
    if DungeonJournalFrame then
        DungeonJournalFrame:Show()
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

-- Slash command for simplified BOE testing
SLASH_TESTBOE1 = "/testboe"
SlashCmdList["TESTBOE"] = function(msg)
  -- try to pull out a full "|Hitem:…|h[…]|
  local link = msg:match("(|Hitem:%d+:[^|]-|h%[.-%]|h)")
  local itemID

  if link then
    -- might be missing the color codes at front/back
    if not link:match("^|c") then
      link = msg:match("(|c%x+|Hitem:%d+:[^|]-|h%[.-%]|h|r)")
             or ("|cffffffff" .. link .. "|r")
    end
    itemID = tonumber(link:match("item:(%d+)"))
  else
    -- no hyperlink: treat msg as a bare item name
    local name = msg:gsub("^%s*", ""):gsub("%[", ""):gsub("%]", "")
    local _, gotLink = GetItemInfo(name)
    if not gotLink then
      print("|cFFFFD700[BOE Test]|r Usage: /testboe + shift-click item")
        return
    end
    link = gotLink
    itemID = tonumber(link:match("item:(%d+)"))
    end
    
    if not itemID then
        return
    end

  -- store the original link so you can reuse full affix/forge data later
  _G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}
  _G.ORIGINAL_ITEM_LINKS[itemID] = link
    
    local itemName = GetItemInfo(itemID)
    if not itemName then
        return
    end
    
    print("|cFFFFD700[BOE Test]|r Checking if friends need " .. itemName)
    
    if _G.QueryItemFromFriends then
        _G.QueryItemFromFriends(itemID, link)
        print("|cFF00FF00[BOE Test]|r Query sent for " .. itemName)
    end
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
        print("  /fcache info    - Show cache statistics")
        print("  /fcache clear   - Clear all cached friends")
        print("  /fcache cleanup - Remove old entries (30+ days)")
        print("  /fcache reload  - Reload friends from cache")
        print("  /fcache save    - Save current friends to cache")
        print("")
        print("|cFFFFD700[DJ Friends]|r Player Management:")
        print("  /hideplayer <name>   - Hide player from BOE responses")
        print("  /unhideplayer <name> - Unhide player")
        print("  /listhidden          - List all hidden players")
    end
end
-- Test command to verify addon communication is working
SLASH_TESTCOMM1 = "/testcomm"
SlashCmdList["TESTCOMM"] = function(msg)
    local testMessage = "TEST:TestMessage:" .. GetTime()
    local messagesSent = 0
    
    print("|cFF00FF00[DJ DEBUG]|r Testing addon communication...")
    print("|cFF00FF00[DJ DEBUG]|r ADDON_PREFIX: " .. ADDON_PREFIX)
    print("|cFF00FF00[DJ DEBUG]|r Test message: " .. testMessage)
    
    if IsInGuild() then
        SendAddonMessage(ADDON_PREFIX, testMessage, "GUILD")
        messagesSent = messagesSent + 1
        print("|cFF00FF00[DJ DEBUG]|r Sent test message to GUILD")
    end
    
    if GetNumPartyMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, testMessage, "PARTY")
        messagesSent = messagesSent + 1
        print("|cFF00FF00[DJ DEBUG]|r Sent test message to PARTY")
    end
    
    if GetNumRaidMembers() > 0 then
        SendAddonMessage(ADDON_PREFIX, testMessage, "RAID")
        messagesSent = messagesSent + 1
        print("|cFF00FF00[DJ DEBUG]|r Sent test message to RAID")
    end
    
    local numFriends = GetNumFriends()
    print("|cFF00FF00[DJ DEBUG]|r Checking " .. numFriends .. " friends for test message")
    
    if numFriends > 0 then
        for i = 1, numFriends do
            local name, level, class, area, connected = GetFriendInfo(i)
            if connected and name then
                SendAddonMessage(ADDON_PREFIX, testMessage, "WHISPER", name)
                messagesSent = messagesSent + 1
                print("|cFF00FF00[DJ DEBUG]|r Sent test message to friend: " .. name)
            end
        end
    end
    
    print("|cFF00FF00[DJ DEBUG]|r Total test messages sent: " .. messagesSent)
    print("|cFF00FF00[DJ DEBUG]|r If you don't see any responses, the addon communication may not be working")
end
