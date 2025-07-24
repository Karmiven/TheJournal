-- ##################################################################
-- # UIBOETooltipEnhancement.lua
-- # ʕ •ᴥ•ʔ✿ BOE Tooltip Enhancement System ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIBOETooltipEnhancement = {}

-- ʕ •ᴥ•ʔ✿ Persistent BOE Cache System ✿ʕ•ᴥ•ʔ
local function EnsureCacheStructure()
    -- ʕ ● ᴥ ●ʔ✿ Initialize character database for BOE cache with nil checks ✿ʕ ● ᴥ ●ʔ
    if not Journal_charDB then
        Journal_charDB = {}
    end
    
    if not Journal_charDB.boeCache then
        Journal_charDB.boeCache = {
            items = {}, -- itemID -> { friendResponses = { friendName -> responseData }, lastQueried = timestamp }
            lastCleanup = GetTime()
        }
    end
    
    if not Journal_charDB.boeCache.items then
        Journal_charDB.boeCache.items = {}
    end
    
    if not Journal_charDB.boeCache.lastCleanup then
        Journal_charDB.boeCache.lastCleanup = GetTime()
    end
end

local function InitializePersistentBOECache()
    EnsureCacheStructure()
    
    -- ʕ ◕ᴥ◕ ʔ✿ Initialize global tables for compatibility ✿ʕ ◕ᴥ◕ ʔ
    if not _G.ITEM_QUERY_RESPONSES then
        _G.ITEM_QUERY_RESPONSES = {}
    end
    if not _G.LAST_BOE_QUERY_TIME then
        _G.LAST_BOE_QUERY_TIME = {}
    end
    if not _G.LAST_BOE_CHAT_TIME then
        _G.LAST_BOE_CHAT_TIME = {}
    end
    if not _G.PROCESSED_BOE_RESPONSES then
        _G.PROCESSED_BOE_RESPONSES = {}
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Load persistent cache into runtime tables ✿ʕ ● ᴥ ●ʔ
    if Journal_charDB.boeCache and Journal_charDB.boeCache.items then
        for itemID, cacheData in pairs(Journal_charDB.boeCache.items) do
            if cacheData.friendResponses then
                _G.ITEM_QUERY_RESPONSES[tonumber(itemID)] = cacheData.friendResponses
            end
            if cacheData.lastQueried then
                _G.LAST_BOE_QUERY_TIME[tonumber(itemID)] = cacheData.lastQueried
            end
        end
    end
    
    local cacheCount = UIBOETooltipEnhancement.GetCacheItemCount()
    if cacheCount > 0 then
        print("|cFF87CEEB[BOE Cache]|r Loaded " .. cacheCount .. " cached BOE items")
    end
end

-- ʕ •ᴥ•ʔ✿ Save BOE response to persistent cache ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.SaveBOEResponse(itemID, friendName, responseData)
    if not itemID or not friendName or not responseData then return end
    
    -- ʕ ● ᴥ ●ʔ✿ Ensure cache structure exists ✿ʕ ● ᴥ ●ʔ
    EnsureCacheStructure()
    
    if not Journal_charDB.boeCache.items[itemID] then
        Journal_charDB.boeCache.items[itemID] = {
            friendResponses = {},
            lastQueried = GetTime()
        }
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Save to persistent cache ✿ʕ ◕ᴥ◕ ʔ
    Journal_charDB.boeCache.items[itemID].friendResponses[friendName] = responseData
    
    -- ʕ ● ᴥ ●ʔ✿ Update runtime cache for immediate access ✿ʕ ● ᴥ ●ʔ
    if not _G.ITEM_QUERY_RESPONSES[itemID] then
        _G.ITEM_QUERY_RESPONSES[itemID] = {}
    end
    _G.ITEM_QUERY_RESPONSES[itemID][friendName] = responseData
    
    if _G.debug then
        print("|cFF00FF00[BOE Cache]|r Saved response from " .. friendName .. " for item " .. itemID)
    end
end

-- ʕ •ᴥ•ʔ✿ Mark item as queried in persistent cache ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.MarkItemQueried(itemID, timestamp)
    if not itemID then return end
    
    timestamp = timestamp or GetTime()
    
    -- ʕ ● ᴥ ●ʔ✿ Ensure cache structure exists ✿ʕ ● ᴥ ●ʔ
    EnsureCacheStructure()
    
    -- ʕ ● ᴥ ●ʔ✿ Save to persistent cache ✿ʕ ● ᴥ ●ʔ
    if not Journal_charDB.boeCache.items[itemID] then
        Journal_charDB.boeCache.items[itemID] = {
            friendResponses = {},
            lastQueried = timestamp
        }
    else
        Journal_charDB.boeCache.items[itemID].lastQueried = timestamp
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Update runtime cache ✿ʕ ◕ᴥ◕ ʔ
    _G.LAST_BOE_QUERY_TIME[itemID] = timestamp
end

-- ʕ •ᴥ•ʔ✿ Get cached responses for an item ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.GetCachedResponses(itemID)
    if not itemID then return nil end
    
    -- ʕ ● ᴥ ●ʔ✿ Ensure cache structure exists ✿ʕ ● ᴥ ●ʔ
    EnsureCacheStructure()
    
    local cacheData = Journal_charDB.boeCache.items[itemID]
    if not cacheData or not cacheData.friendResponses then
        return nil
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Check if cache is still fresh (30 minutes = 1800 seconds) ✿ʕ ● ᴥ ●ʔ
    local currentTime = GetTime()
    local lastQueried = cacheData.lastQueried or 0
    
    if (currentTime - lastQueried) > 1800 then
        -- ʕ ◕ᴥ◕ ʔ✿ Cache expired, return nil ✿ʕ ◕ᴥ◕ ʔ
        return nil
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Filter out expired individual responses ✿ʕ ● ᴥ ●ʔ
    local freshResponses = {}
    for friendName, response in pairs(cacheData.friendResponses) do
        if response.timestamp and (currentTime - response.timestamp) < 1800 then
            freshResponses[friendName] = response
        end
    end
    
    return next(freshResponses) and freshResponses or nil
end

-- ʕ •ᴥ•ʔ✿ Clean up expired cache entries ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.CleanupExpiredCache()
    -- ʕ ● ᴥ ●ʔ✿ Ensure cache structure exists ✿ʕ ● ᴥ ●ʔ
    EnsureCacheStructure()
    
    local currentTime = GetTime()
    local cleaned = 0
    
    -- ʕ ● ᴥ ●ʔ✿ Only cleanup every 10 minutes to avoid excessive processing ✿ʕ ● ᴥ ●ʔ
    if (currentTime - Journal_charDB.boeCache.lastCleanup) < 600 then
        return
    end
    
    Journal_charDB.boeCache.lastCleanup = currentTime
    
    -- ʕ ◕ᴥ◕ ʔ✿ Clean up expired items from persistent cache ✿ʕ ◕ᴥ◕ ʔ
    for itemID, cacheData in pairs(Journal_charDB.boeCache.items) do
        local shouldRemove = false
        
        -- ʕ ● ᴥ ●ʔ✿ Remove if last queried more than 30 minutes ago ✿ʕ ● ᴥ ●ʔ
        if cacheData.lastQueried and (currentTime - cacheData.lastQueried) > 1800 then
            shouldRemove = true
        end
        
        -- ʕ ◕ᴥ◕ ʔ✿ Or remove if no fresh responses ✿ʕ ◕ᴥ◕ ʔ
        if cacheData.friendResponses then
            local hasFreshResponses = false
            for friendName, response in pairs(cacheData.friendResponses) do
                if response.timestamp and (currentTime - response.timestamp) < 1800 then
                    hasFreshResponses = true
                    break
                end
            end
            if not hasFreshResponses then
                shouldRemove = true
            end
        end
        
        if shouldRemove then
            Journal_charDB.boeCache.items[itemID] = nil
            _G.ITEM_QUERY_RESPONSES[tonumber(itemID)] = nil
            _G.LAST_BOE_QUERY_TIME[tonumber(itemID)] = nil
            cleaned = cleaned + 1
        end
    end
    
    if cleaned > 0 and _G.debug then
        print("|cFF00FF00[BOE Cache]|r Cleaned up " .. cleaned .. " expired cache entries")
    end
end

-- ʕ •ᴥ•ʔ✿ Get cache statistics ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.GetCacheItemCount()
    -- ʕ ● ᴥ ●ʔ✿ Ensure cache structure exists ✿ʕ ● ᴥ ●ʔ
    EnsureCacheStructure()
    
    local count = 0
    for _ in pairs(Journal_charDB.boeCache.items) do
        count = count + 1
    end
    return count
end

-- ʕ •ᴥ•ʔ✿ Manual cache management commands ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.ClearCache()
    -- ʕ ● ᴥ ●ʔ✿ Ensure cache structure exists ✿ʕ ● ᴥ ●ʔ
    EnsureCacheStructure()
    
    Journal_charDB.boeCache.items = {}
    _G.ITEM_QUERY_RESPONSES = {}
    _G.LAST_BOE_QUERY_TIME = {}
    print("|cFF00FF00[BOE Cache]|r Cleared all BOE cache data")
end

-- ʕ •ᴥ•ʔ✿ Initialize persistent cache on load ✿ʕ•ᴥ•ʔ
InitializePersistentBOECache()

-- ʕ •ᴥ•ʔ✿ Global storage for original item links ✿ʕ•ᴥ•ʔ
_G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}

-- ʕ •ᴥ•ʔ✿ Cache the last processed tooltip ✿ʕ•ᴥ•ʔ
local lastTooltipCache = {
    itemLink = nil,
    timestamp = 0,
    processed = false
}

-- ʕ •ᴥ•ʔ✿ Prevent duplicate processing and infinite loops ✿ʕ •ᴥ•ʔ
local lastProcessedItem = {
    itemID = nil,
    timestamp = 0,
    processed = false
}

-- ʕ •ᴥ•ʔ✿ Schedule cleanup every 10 minutes ✿ʕ•ᴥ•ʔ
local cleanupTimer = C_Timer.NewTicker(600, UIBOETooltipEnhancement.CleanupExpiredCache)

-- ʕ •ᴥ•ʔ✿ Enhanced BOE processing function ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.ProcessBOETooltip(tooltip, link)
    if not link or type(link) ~= "string" or not link:find("|Hitem:") then
        return
    end

    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then return end

    -- Check if we should show BOE info (auto enabled OR manually queried)
    local autoTestEnabled = _G.DJ_Settings and _G.DJ_Settings.autoTestBoe
    local wasManuallyQueried = _G.TheJournal_UIManualBOEClick and _G.TheJournal_UIManualBOEClick.WasManuallyQueried(itemID)

    if not (autoTestEnabled or wasManuallyQueried) then
        return -- Don't add tooltip text if auto BOE is disabled and item wasn't manually queried
    end

    -- Check if we already added BOE info to this tooltip
    if tooltip.hasBOEInfo then
        return
    end
    tooltip.hasBOEInfo = true

    -- ʕ •ᴥ•ʔ✿ Get item name for display purposes ✿ʕ •ᴥ•ʔ
    local itemName = GetItemInfoCustom(itemID) or ("Item " .. itemID)

    -- ʕ •ᴥ•ʔ✿ Add BOE status line to tooltip ✿ʕ •ᴥ•ʔ
    tooltip:AddLine(" ")
    if wasManuallyQueried and not autoTestEnabled then
        tooltip:AddLine("|cFF87CEEB[Manual Query] BOE Item - Friend Status:|r")
    else
        tooltip:AddLine("|cFFFFD700BOE Item - Friend Status:|r")
    end

    -- ʕ •ᴥ•ʔ✿ Use persistent cache system ✿ʕ•ᴥ•ʔ
    local hasResponses = false
    local responses = UIBOETooltipEnhancement.GetCachedResponses(itemID)
    
    if responses then
        local friendsWhoNeed = {}
        local friendsWhoNeedAffixes = {}
        local friendsWhoCanUpgrade = {}

        for friendName, response in pairs(responses) do
            if response.needsItem then
                table.insert(friendsWhoNeed, friendName)
            elseif response.needsAffixesOnly then
                table.insert(friendsWhoNeedAffixes, friendName)
            elseif response.canUpgrade then
                local forgeText = ""
                if response.currentForge == 1 then forgeText = " (Titanforged)"
                elseif response.currentForge == 2 then forgeText = " (Warforged)"
                elseif response.currentForge == 3 then forgeText = " (Lightforged)"
                end
                table.insert(friendsWhoCanUpgrade, friendName .. forgeText)
            end
        end

        if #friendsWhoNeed > 0 or #friendsWhoNeedAffixes > 0 or #friendsWhoCanUpgrade > 0 then
            hasResponses = true

            if #friendsWhoNeed > 0 then
                tooltip:AddLine("|cFF00FF00Needs:|r " .. table.concat(friendsWhoNeed, ", "), 1, 1, 1, true)
            end

            if #friendsWhoNeedAffixes > 0 then
                tooltip:AddLine("|cFFFFFF00Affixes Only:|r " .. table.concat(friendsWhoNeedAffixes, ", "), 1, 1, 1, true)
            end

            if #friendsWhoCanUpgrade > 0 then
                tooltip:AddLine("|cFFFFFF00Can Upgrade:|r " .. table.concat(friendsWhoCanUpgrade, ", "), 1, 1, 1, true)
            end

            -- ʕ ● ᴥ ●ʔ✿ Show cache age ✿ʕ ● ᴥ ●ʔ
            EnsureCacheStructure()
            local cacheData = Journal_charDB.boeCache.items[itemID]
            if cacheData and cacheData.lastQueried then
                local cacheAge = math.floor((GetTime() - cacheData.lastQueried) / 60)
                tooltip:AddLine("|cFF888888(Cached " .. cacheAge .. " min ago, valid for 30 min)|r")
            else
                tooltip:AddLine("|cFF888888(Cached for 30 minutes)|r")
            end
        end
    end

    if not hasResponses then
        tooltip:AddLine("|cFF888888Querying friends... (or no responses yet)|r")
    end
end

-- ʕ •ᴥ•ʔ✿ Function to check if friends need an item ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.GetFriendsWhoNeedItem(itemID)
    local friendsWhoNeed = {}

    if not _G.FRIENDS_ATTUNEMENT_DATA or not itemID then
        return friendsWhoNeed
    end

    for playerName, friendData in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        if not friendData.isPlayer then
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            if canAttune == 1 then
                local needsItem = false

                if friendData.missingBOE and #friendData.missingBOE > 0 then
                    for _, missingItemID in ipairs(friendData.missingBOE) do
                        if missingItemID == itemID then
                            needsItem = true
                            break
                        end
                    end
                end

                if not needsItem and friendData.percentage and friendData.percentage < 90 then
                    if friendData.dungeonDetails then
                        for _, dungeonInfo in ipairs(friendData.dungeonDetails) do
                            if dungeonInfo.attunablesLeft > 0 then
                                local dungeon = _G.FindDungeonByName and _G.FindDungeonByName(dungeonInfo.name)
                                if dungeon and dungeon.items then
                                    for _, dungeonItemID in ipairs(dungeon.items) do
                                        if dungeonItemID == itemID then
                                            needsItem = true
                                            break
                                        end
                                    end
                                end
                            end
                            if needsItem then break end
                        end
                    end
                end

                if needsItem then
                    table.insert(friendsWhoNeed, playerName)
                end
            end
        end
    end

    return friendsWhoNeed
end

-- ʕ •ᴥ•ʔ✿ Enhanced tooltip processing ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.EnhanceTooltipWithFriendStatus(tooltip, link)
    UIBOETooltipEnhancement.ProcessBOETooltip(tooltip, link)

    if not link or not link:match("^item:") then
        return
    end

    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then
        return
    end

    local friendsWhoNeed = UIBOETooltipEnhancement.GetFriendsWhoNeedItem(itemID)

    if #friendsWhoNeed > 0 then
        tooltip:AddLine(" ")
        tooltip:AddLine("|cFFFFD700Friend Attunement Status:|r")
        tooltip:AddLine("|cFFFF6600Unattuned: " .. table.concat(friendsWhoNeed, ", ") .. "|r", 1, 1, 1, true)
    end
end

-- ʕ •ᴥ•ʔ✿ REMOVED: OnUpdate frame that causes unnecessary polling ✿ʕ•ᴥ•ʔ
-- ʕ ◕ᴥ◕ ʔ✿ Now using event-driven approach for better performance and safety ✿ʕ ◕ᴥ◕ ʔ

-- ʕ •ᴥ•ʔ✿ Safe tooltip enhancement without taint ✿ʕ•ᴥ•ʔ
local function SafeEnhanceTooltip()
    -- ʕ ◕ᴥ◕ ʔ✿ Multiple safety checks to prevent breaking tooltip functionality ✿ʕ ◕ᴥ◕ ʔ
    if not GameTooltip or not GameTooltip:IsVisible() or not GameTooltip.GetOwner or not GameTooltip:GetOwner() then
        return
    end
    
    local autoTestEnabled = _G.DJ_Settings and _G.DJ_Settings.autoTestBoe

    -- ʕ ● ᴥ ●ʔ✿ Safely get item information with error protection ✿ʕ ● ᴥ ●ʔ
    local name, link
    local success = pcall(function()
        name, link = GameTooltip:GetItem()
    end)
    
    if not success or not name then 
        return 
    end

    local itemID = nil
    if link and link:find("|Hitem:") then
        itemID = tonumber(link:match("item:(%d+)"))
    else
        local success2, fullLink = pcall(GetItemInfo, name)
        if success2 and fullLink then
            link = fullLink
            itemID = tonumber(fullLink:match("item:(%d+)"))
        end
    end

    if not itemID then return end

    -- Check if manually queried
    local wasManuallyQueried = _G.TheJournal_UIManualBOEClick and _G.TheJournal_UIManualBOEClick.WasManuallyQueried(itemID)

    -- Show enhancement if auto is enabled OR item was manually queried
    if autoTestEnabled or wasManuallyQueried then
        pcall(function()
            UIBOETooltipEnhancement.ProcessBOETooltip(GameTooltip, link)
        end)
    end

    -- Only run auto testing if enabled
    if not autoTestEnabled then
        return
    end

    -- ʕ ● ᴥ ●ʔ✿ Check if item is attunable before testing ✿ʕ ● ᴥ ●ʔ
    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)
    elseif _G.CanAttuneItemHelper then
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0
    end

    if not isAttunable then
        return -- Don't test non-attunable items
    end

    -- ʕ ◕ᴥ◕ ʔ✿ More robust duplicate prevention ✿ʕ ◕ᴥ◕ ʔ
    local currentTime = GetTime()

    -- Check if we recently processed this exact item (within 2 seconds to prevent spam)
    if lastProcessedItem.itemID == itemID and
       lastProcessedItem.processed and
       (currentTime - lastProcessedItem.timestamp) < 2 then
        return -- Already processed this item very recently (spam prevention)
    end

    -- ʕ •ᴥ•ʔ✿ Perform automatic BOE test with reasonable cooldown ✿ʕ •ᴥ•ʔ
    if _G.PerformBOETest then
        local lastQueryTime = _G.LAST_BOE_QUERY_TIME[itemID]
        -- Test if never tested, or after 30 minutes (1800 seconds) - reasonable cache time
        if not lastQueryTime or (currentTime - lastQueryTime) > 1800 then
            -- Mark as processed BEFORE calling PerformBOETest to prevent loops
            lastProcessedItem.itemID = itemID
            lastProcessedItem.processed = true
            lastProcessedItem.timestamp = currentTime

            -- Store the link and perform the test with error protection
            if link then
                pcall(function()
                    _G.ORIGINAL_ITEM_LINKS[itemID] = link
                    _G.PerformBOETest(itemID, link, true) -- true = automatic mode
                    UIBOETooltipEnhancement.MarkItemQueried(itemID, currentTime) -- Mark as queried
                    
                end)
            end
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Use GameTooltip events instead of direct hooks with safety checks ✿ʕ•ᴥ•ʔ
local function InitializeTooltipHooks()
    -- ʕ ◕ᴥ◕ ʔ✿ Prevent multiple initializations ✿ʕ ◕ᴥ◕ ʔ
    if UIBOETooltipEnhancement.hooksInitialized then
        return
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Use pcall to safely hook without breaking existing functionality ✿ʕ ● ᴥ ●ʔ
    local success1 = pcall(function()
        GameTooltip:HookScript("OnTooltipSetItem", function()
            -- ʕ ◕ᴥ◕ ʔ✿ Only enhance if tooltip is still visible and valid ✿ʕ ◕ᴥ◕ ʔ
            if GameTooltip:IsVisible() and GameTooltip:GetOwner() then
                GameTooltip.hasBOEInfo = false -- Clear duplicate flag
                SafeEnhanceTooltip()
            end
        end)
    end)

    -- ʕ ◕ᴥ◕ ʔ✿ Reset processing state when tooltip hides with error protection ✿ʕ ◕ᴥ◕ ʔ
    local success2 = pcall(function()
        GameTooltip:HookScript("OnHide", function()
            -- Use a timer to reset state after a delay to prevent immediate reset
            if C_Timer and C_Timer.After then
                C_Timer.After(2, function()
                    lastProcessedItem.itemID = nil
                    lastProcessedItem.processed = false
                    lastProcessedItem.timestamp = 0
                end)
            else
                -- Fallback: reset immediately if no timer available
                lastProcessedItem.itemID = nil
                lastProcessedItem.processed = false
                lastProcessedItem.timestamp = 0
            end
        end)
    end)
    
    if success1 and success2 then
        UIBOETooltipEnhancement.hooksInitialized = true
    end
end

-- ʕ •ᴥ•ʔ✿ Initialize tooltip system safely ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.Initialize()
    -- ʕ ◕ᴥ◕ ʔ✿ Wait for addon to be fully loaded before hooking ✿ʕ ◕ᴥ◕ ʔ
    if IsAddOnLoaded("TheJournal") then
        InitializeTooltipHooks()
    else
        local initFrame = CreateFrame("Frame")
        initFrame:RegisterEvent("ADDON_LOADED")
        initFrame:SetScript("OnEvent", function(self, event, addonName)
            if event == "ADDON_LOADED" and addonName == "TheJournal" then
                InitializeTooltipHooks()
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

-- ʕ •ᴥ•ʔ✿ Auto-initialize when this module loads ✿ʕ•ᴥ•ʔ
UIBOETooltipEnhancement.Initialize()

-- ʕ •ᴥ•ʔ✿ Slash command hooks ✿ʕ•ᴥ•ʔ
local originalSlashCmdList = SlashCmdList["DJ"]
if originalSlashCmdList then
    SlashCmdList["DJ"] = function(msg)
        if msg and msg:find("^testboe") then
            local originalLink = msg:match("|c%x+|h%[.-%]|h|r")
            if originalLink then
                local itemID = tonumber(originalLink:match("item:(%d+)"))
                if itemID then
                    _G.ORIGINAL_ITEM_LINKS[itemID] = originalLink
                end
            end
        end
        return originalSlashCmdList(msg)
    end
end

-- ʕ •ᴥ•ʔ✿ Debug command to test automatic BOE functionality ✿ʕ•ᴥ•ʔ
SLASH_TESTAUTOBOE1 = "/testautoboe"
SlashCmdList["TESTAUTOBOE"] = function(msg)
    print("|cFFFFD700[Auto BOE Debug]|r === AUTO BOE STATUS ===")
    
    -- Check if auto BOE is enabled
    local autoEnabled = _G.DJ_Settings and _G.DJ_Settings.autoTestBoe or false
    print("Auto BOE Enabled: " .. (autoEnabled and "|cFF00FF00YES|r" or "|cFFFF0000NO|r"))
    
    -- Check if functions exist
    local performExists = _G.PerformBOETest ~= nil
    print("PerformBOETest Function: " .. (performExists and "|cFF00FF00EXISTS|r" or "|cFFFF0000MISSING|r"))
    
    local processExists = _G.ProcessBOETooltip ~= nil
    print("ProcessBOETooltip Function: " .. (processExists and "|cFF00FF00EXISTS|r" or "|cFFFF0000MISSING|r"))
    
    -- Check if hooks are initialized
    local hookStatus = UIBOETooltipEnhancement.hooksInitialized and "|cFF00FF00INITIALIZED|r" or "|cFFFF0000NOT INITIALIZED|r"
    print("Tooltip Hooks: " .. hookStatus)
    
    -- Check tooltip state
    print("GameTooltip Available: " .. (GameTooltip and "|cFF00FF00YES|r" or "|cFFFF0000NO|r"))
    
    -- ʕ •ᴥ•ʔ✿ Show cache statistics ✿ʕ•ᴥ•ʔ
    print("|cFFFFD700[Auto BOE Debug]|r === CACHE STATUS ===")
    local cacheCount = UIBOETooltipEnhancement.GetCacheItemCount()
    print("Cached Items: " .. cacheCount)
    
            if cacheCount > 0 then
            EnsureCacheStructure()
            local currentTime = GetTime()
            local freshCount = 0
            local expiredCount = 0
            
            for itemID, cacheData in pairs(Journal_charDB.boeCache.items) do
                if cacheData.lastQueried and (currentTime - cacheData.lastQueried) < 1800 then
                    freshCount = freshCount + 1
                else
                    expiredCount = expiredCount + 1
                end
            end
            
            print("Fresh Cache Entries: " .. freshCount)
            print("Expired Cache Entries: " .. expiredCount)
        end
    
    print("|cFFFFD700[Auto BOE Debug]|r === INSTRUCTIONS ===")
    print("1. Make sure '/testboe auto' shows 'enabled'")
    print("2. Hover over a BOE item that you can attune")
    print("3. Look for '[Auto BOE] Testing' messages in chat")
    print("4. Check tooltip for 'BOE Item - Friend Status' section")
    print("5. Results are cached for 30 minutes")
    print("6. Use '/dj debug' to enable debug messages")
    print("7. Use '/boecache clear' to clear the cache")
    print("8. Use '/boecache stats' to show cache details")
end

-- ʕ •ᴥ•ʔ✿ BOE Cache management commands ✿ʕ•ᴥ•ʔ
SLASH_BOECACHE1 = "/boecache"
SlashCmdList["BOECACHE"] = function(msg)
    local args = string.lower(msg or "")
    
    if args == "clear" then
        UIBOETooltipEnhancement.ClearCache()
    elseif args == "stats" then
        print("|cFFFFD700[BOE Cache]|r === CACHE STATISTICS ===")
        local cacheCount = UIBOETooltipEnhancement.GetCacheItemCount()
        print("Total Cached Items: " .. cacheCount)
        
        if cacheCount > 0 then
            EnsureCacheStructure()
            local currentTime = GetTime()
            local freshCount = 0
            local expiredCount = 0
            
            print("|cFF87CEEB[Fresh Cache Entries]|r")
            for itemID, cacheData in pairs(Journal_charDB.boeCache.items) do
                if cacheData.lastQueried and (currentTime - cacheData.lastQueried) < 1800 then
                    freshCount = freshCount + 1
                    local itemName = GetItemInfo(tonumber(itemID)) or ("Item " .. itemID)
                    local ageMinutes = math.floor((currentTime - cacheData.lastQueried) / 60)
                    local responseCount = 0
                    if cacheData.friendResponses then
                        for _ in pairs(cacheData.friendResponses) do
                            responseCount = responseCount + 1
                        end
                    end
                    print("  " .. itemName .. " (" .. responseCount .. " responses, " .. ageMinutes .. " min old)")
                else
                    expiredCount = expiredCount + 1
                end
            end
            
            print("Fresh Entries: " .. freshCount)
            print("Expired Entries: " .. expiredCount .. " (will be cleaned up)")
        end
    else
        print("|cFFFFD700[BOE Cache]|r Available commands:")
        print("/boecache stats - Show detailed cache statistics")
        print("/boecache clear - Clear all cached BOE data")
    end
end

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIBOETooltipEnhancement = UIBOETooltipEnhancement
_G.ProcessBOETooltip = UIBOETooltipEnhancement.ProcessBOETooltip
_G.GetFriendsWhoNeedItem = UIBOETooltipEnhancement.GetFriendsWhoNeedItem

return UIBOETooltipEnhancement
