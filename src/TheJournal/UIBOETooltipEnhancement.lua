-- ##################################################################
-- # UIBOETooltipEnhancement.lua
-- # ʕ •ᴥ•ʔ✿ BOE Tooltip Enhancement System ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIBOETooltipEnhancement = {}

-- ʕ •ᴥ•ʔ✿ Initialize tracking tables ✿ʕ•ᴥ•ʔ
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

-- ʕ •ᴥ•ʔ✿ Clean up old processed responses ✿ʕ•ᴥ•ʔ
local function CleanupProcessedResponses()
    local currentTime = GetTime()
    local cutoffTime = 300 -- 5 minutes
    local cleaned = 0

    for key, _ in pairs(_G.PROCESSED_BOE_RESPONSES) do
        local timestamp = tonumber(key:match("_(%d+%.?%d*)$"))
        if timestamp and (currentTime - timestamp) > cutoffTime then
            _G.PROCESSED_BOE_RESPONSES[key] = nil
            cleaned = cleaned + 1
        end
    end

    if cleaned > 0 and _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Cleaned up " .. cleaned .. " old BOE response records")
    end
end

-- ʕ •ᴥ•ʔ✿ Schedule cleanup every 5 minutes ✿ʕ•ᴥ•ʔ
local cleanupTimer = C_Timer.NewTicker(300, CleanupProcessedResponses)

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

    local hasResponses = false
    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        local responses = _G.ITEM_QUERY_RESPONSES[itemID]
        local friendsWhoNeed = {}
        local friendsWhoNeedAffixes = {}
        local friendsWhoCanUpgrade = {}

        local fullItemLink = _G.QUERIED_ITEM_LINKS and _G.QUERIED_ITEM_LINKS[itemID]
        if not fullItemLink then
            fullItemLink = link
        end

        for friendName, response in pairs(responses) do
            if GetTime() - response.timestamp < 30 then
                if response.needsItem then
                    table.insert(friendsWhoNeed, friendName)
                    local responseKey = itemID .. "_" .. friendName .. "_" .. response.timestamp
                    if not _G.PROCESSED_BOE_RESPONSES[responseKey] then
                        _G.PROCESSED_BOE_RESPONSES[responseKey] = true
                    end
                elseif response.needsAffixesOnly then
                    table.insert(friendsWhoNeedAffixes, friendName)
                elseif response.canUpgrade then
                    local forgeText = ""
                    if response.currentForge == 1 then forgeText = " (Titanforged)"
                    elseif response.currentForge == 2 then forgeText = " (Warforged)"
                    elseif response.currentForge == 3 then forgeText = " (Lightforged)"
                    end
                    table.insert(friendsWhoCanUpgrade, friendName .. forgeText)
                    local upgradeResponseKey = itemID .. "_" .. friendName .. "_upgrade_" .. response.timestamp
                    if not _G.PROCESSED_BOE_RESPONSES[upgradeResponseKey] then
                        print("|cFFFFFF00[BOE Upgrade]|r Whispered " .. friendName .. " about upgrade opportunity")
                        _G.PROCESSED_BOE_RESPONSES[upgradeResponseKey] = true
                    end
                end
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

            tooltip:AddLine("|cFF888888(Responses from last 30s)|r")
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

    -- ʕ ◕ᴥ◕ ʔ✿ More robust duplicate prevention ✿ʕ ◕ᴥ◕ ʔ
    local currentTime = GetTime()

    -- Check if we recently processed this exact item (within 2 seconds to prevent spam)
    if lastProcessedItem.itemID == itemID and
       lastProcessedItem.processed and
       (currentTime - lastProcessedItem.timestamp) < 2 then
        return -- Already processed this item very recently (spam prevention)
    end

    -- ʕ ● ᴥ ●ʔ✿ Perform BOE test since auto testing is enabled - with error protection ✿ʕ ● ᴥ ●ʔ
    if _G.PerformBOETest then
        local lastQueryTime = _G.LAST_BOE_QUERY_TIME[itemID]
        -- Test immediately if never tested, or after 10 minutes (600 seconds)
        if not lastQueryTime or (currentTime - lastQueryTime) > 600 then
            -- Mark as processed BEFORE calling PerformBOETest to prevent loops
            lastProcessedItem.itemID = itemID
            lastProcessedItem.processed = true
            lastProcessedItem.timestamp = currentTime

            -- Store the link and perform the test with error protection
            if link then
                pcall(function()
                    _G.ORIGINAL_ITEM_LINKS[itemID] = link
                    _G.PerformBOETest(itemID, link, true) -- true = automatic mode
                    _G.LAST_BOE_QUERY_TIME[itemID] = currentTime
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

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIBOETooltipEnhancement = UIBOETooltipEnhancement
_G.ProcessBOETooltip = UIBOETooltipEnhancement.ProcessBOETooltip
_G.GetFriendsWhoNeedItem = UIBOETooltipEnhancement.GetFriendsWhoNeedItem

return UIBOETooltipEnhancement
