-- ##################################################################
-- # UITooltipEnhancement.lua - Safe Tooltip Enhancement System
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Safe Tooltip Enhancement Module (IdTip-style) ✿ʕ•ᴥ•ʔ

local TooltipEnhancement = {}

-- ʕ ◕ᴥ◕ ʔ✿ Faction Tooltip Enhancement System ✿ʕ ◕ᴥ◕ ʔ
local FactionTooltipEnhancement = {}

-- ʕ ● ᴥ ●ʔ✿ Check if faction tooltips are enabled ✿ʕ ● ᴥ ●ʔ
function FactionTooltipEnhancement.IsFactionTooltipEnabled()
    return Journal_charDB and Journal_charDB.showFactionTooltips ~= false
end

-- ʕノ•ᴥ•ʔノ✿ Check if item is faction-specific ✿ʕノ•ᴥ•ʔノ
function FactionTooltipEnhancement.GetItemFaction(itemID)
    if not _G.hashFactionItems or not itemID then
        return nil
    end
    return _G.hashFactionItems[itemID]
end

-- ʕ •ᴥ•ʔ✿ Safe function to add lines to tooltip (IdTip-style) ✿ʕ •ᴥ•ʔ
local function SafeAddLine(tooltip, text, r, g, b, wrap)
    if not tooltip or not text then return end

    -- Check if line already exists to prevent duplicates
    local found = false
    for i = 1, 30 do  -- Check up to 30 lines
        local frame = _G[tooltip:GetName() .. "TextLeft" .. i]
        if frame then
            local existingText = frame:GetText()
            if existingText and existingText:find(text:gsub("%|c%x%x%x%x%x%x%x%x", ""):gsub("%|r", ""), 1, true) then
                found = true
                break
            end
        end
    end

    if not found then
        if r and g and b then
            tooltip:AddLine(text, r, g, b, wrap)
        else
            tooltip:AddLine(text, 1, 1, 1, wrap)
        end
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Safe function to add double lines ✿ʕ ◕ᴥ◕ ʔ
local function SafeAddDoubleLine(tooltip, leftText, rightText, leftR, leftG, leftB, rightR, rightG, rightB)
    if not tooltip or not leftText then return end

    -- Check if line already exists
    local found = false
    for i = 1, 30 do
        local leftFrame = _G[tooltip:GetName() .. "TextLeft" .. i]
        if leftFrame then
            local existingText = leftFrame:GetText()
            if existingText and existingText:find(leftText:gsub("%|c%x%x%x%x%x%x%x%x", ""):gsub("%|r", ""), 1, true) then
                found = true
                break
            end
        end
    end

    if not found then
        tooltip:AddDoubleLine(leftText, rightText or "",
                            leftR or 1, leftG or 1, leftB or 1,
                            rightR or 1, rightG or 1, rightB or 1)
    end
end

-- ʕ ● ᴥ ●ʔ✿ Get item link from tooltip safely ✿ʕ ● ᴥ ●ʔ
function TooltipEnhancement.GetItemLinkFromTooltip(tooltip)
    if not tooltip then return nil end

    local name, link = tooltip:GetItem()
    if link then
        local itemID = CustomExtractItemId and CustomExtractItemId(link) or tonumber(link:match("item:(%d+)"))
        if itemID and itemID > 0 then
            return link, itemID
        end
    end

    return nil, nil
end

-- ʕ ◕ᴥ◕ ʔ✿ Process faction tooltip enhancement safely ✿ʕ ◕ᴥ◕ ʔ
function FactionTooltipEnhancement.ProcessFactionTooltip(tooltip, itemLink)
    if not FactionTooltipEnhancement.IsFactionTooltipEnabled() then
        return
    end

    if not itemLink or not itemLink:match("^|c%x+|Hitem:") then
        return
    end

    local itemID = CustomExtractItemId and CustomExtractItemId(itemLink) or tonumber(itemLink:match("item:(%d+)"))
    if not itemID or itemID == 0 then
        return
    end

    local factionType = FactionTooltipEnhancement.GetItemFaction(itemID)
    if not factionType then
        return
    end

    local factionIcon = ""
    local factionName = ""

    if factionType == 1 then
        factionIcon = "|TInterface\\Icons\\INV_BannerPVP_02:16:16|t"
        factionName = "Alliance"
    elseif factionType == 2 then
        factionIcon = "|TInterface\\Icons\\INV_BannerPVP_01:16:16|t"
        factionName = "Horde"
    end

    if factionIcon ~= "" then
        SafeAddLine(tooltip, " ")
        SafeAddDoubleLine(tooltip, factionIcon .. " " .. factionName, "Item", 1, 1, 1, 0.8, 0.8, 0.8)
    end
end

-- ʕ •ᴥ•ʔ✿ Enhanced BOE Processing ✿ʕ •ᴥ•ʔ
function TooltipEnhancement.ProcessBOETooltip(tooltip, itemLink)
    if not itemLink or not CustomExtractItemId then
        return
    end

    local itemID = CustomExtractItemId(itemLink)
    if not itemID then
        return
    end

    -- Check if item is attunable
    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)
    elseif _G.CanAttuneItemHelper then
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0
    end

    if not isAttunable then
        return
    end

    -- ʕ ● ᴥ ●ʔ✿ Check if auto testboe is enabled - only auto-query if enabled ✿ʕ ● ᴥ ●ʔ
    local autoTestEnabled = _G.DJ_Settings and _G.DJ_Settings.autoTestBoe
    local wasManuallyQueried = _G.TheJournal_UIManualBOEClick and _G.TheJournal_UIManualBOEClick.WasManuallyQueried(itemID)

    -- Only proceed with auto-querying if auto test is enabled OR item was manually queried
    if not (autoTestEnabled or wasManuallyQueried) then
        return
    end

    local itemName = GetItemInfo(itemID) or ("Item " .. itemID)

    -- Trigger querying if needed
    if autoTestEnabled and _G.PerformBOETest then
        local lastQueryTime = _G.LAST_BOE_QUERY_TIME and _G.LAST_BOE_QUERY_TIME[itemID]
        if not lastQueryTime or (GetTime() - lastQueryTime) > 10 then
            _G.PerformBOETest(itemID, itemLink, true) -- true = automatic mode
            if not _G.LAST_BOE_QUERY_TIME then
                _G.LAST_BOE_QUERY_TIME = {}
            end
            _G.LAST_BOE_QUERY_TIME[itemID] = GetTime()
        end
    elseif wasManuallyQueried then
        -- Fallback for manually queried items
        local lastQueryTime = _G.LAST_BOE_QUERY_TIME and _G.LAST_BOE_QUERY_TIME[itemID]
        if not lastQueryTime or (GetTime() - lastQueryTime) > 10 then
            if _G.QueryItemFromFriends then
                _G.QueryItemFromFriends(itemID, itemLink)
                if not _G.LAST_BOE_QUERY_TIME then
                    _G.LAST_BOE_QUERY_TIME = {}
                end
                _G.LAST_BOE_QUERY_TIME[itemID] = GetTime()
            end
        end
    end

    -- Add BOE status to tooltip
    SafeAddLine(tooltip, " ")
    if wasManuallyQueried and not autoTestEnabled then
        SafeAddLine(tooltip, "|cFF87CEEB[Manual Query] BOE Item - Friend Status:|r")
    else
        SafeAddLine(tooltip, "|cFFFFD700BOE Item - Friend Status:|r")
    end

    local hasResponses = false

    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        local responses = _G.ITEM_QUERY_RESPONSES[itemID]
        local friendsWhoNeed = {}
        local friendsWhoNeedAffixes = {}
        local friendsWhoCanUpgrade = {}

        for friendName, response in pairs(responses) do
            if GetTime() - response.timestamp < 30 then
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
        end

        if #friendsWhoNeed > 0 or #friendsWhoNeedAffixes > 0 or #friendsWhoCanUpgrade > 0 then
            hasResponses = true

            if #friendsWhoNeed > 0 then
                SafeAddLine(tooltip, "|cFF00FF00Needs:|r " .. table.concat(friendsWhoNeed, ", "), 1, 1, 1, true)
            end

            if #friendsWhoNeedAffixes > 0 then
                SafeAddLine(tooltip, "|cFFFFFF00Affixes Only:|r " .. table.concat(friendsWhoNeedAffixes, ", "), 1, 1, 1, true)
            end

            if #friendsWhoCanUpgrade > 0 then
                SafeAddLine(tooltip, "|cFFFFFF00Can Upgrade:|r " .. table.concat(friendsWhoCanUpgrade, ", "), 1, 1, 1, true)
            end

            SafeAddLine(tooltip, "|cFF888888(Responses from last 30s)|r")
        end
    end

    if not hasResponses then
        SafeAddLine(tooltip, "|cFF888888Querying friends... (or no responses yet)|r")
    end
end

-- ʕ •ᴥ•ʔ✿ Function to get friends who need an item ✿ʕ•ᴥ•ʔ
function TooltipEnhancement.GetFriendsWhoNeedItem(itemID)
    local friendsWhoNeed = {}

    if not _G.FRIENDS_ATTUNEMENT_DATA or not itemID then
        return friendsWhoNeed
    end

    for playerName, friendData in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        if not friendData.isPlayer then
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            if canAttune == 1 then
                local needsItem = false

                -- Check missing BOE items
                if friendData.missingBOE and #friendData.missingBOE > 0 then
                    for _, missingItemID in ipairs(friendData.missingBOE) do
                        if missingItemID == itemID then
                            needsItem = true
                            break
                        end
                    end
                end

                -- Check dungeon items for incomplete friends
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

-- ʕ •ᴥ•ʔ✿ Process friend attunement info ✿ʕ•ᴥ•ʔ
function TooltipEnhancement.ProcessFriendAttunementTooltip(tooltip, itemLink)
    if not itemLink or not itemLink:match("^item:") then
        return
    end

    local itemID = tonumber(itemLink:match("item:(%d+)"))
    if not itemID then
        return
    end

    -- Check if any friends need this item for attunement
    local friendsWhoNeed = TooltipEnhancement.GetFriendsWhoNeedItem(itemID)

    if #friendsWhoNeed > 0 then
        SafeAddLine(tooltip, " ")
        SafeAddLine(tooltip, "|cFFFFD700Friend Attunement Status:|r")
        SafeAddLine(tooltip, "|cFFFF6600Unattuned:|r " .. table.concat(friendsWhoNeed, ", "), 1, 1, 1, true)
    end
end

-- ʕ •ᴥ•ʔ✿ Main tooltip processing function ✿ʕ•ᴥ•ʔ
local function ProcessTooltip(tooltip)
    if not tooltip or not tooltip:IsVisible() then
        return
    end

    local itemLink, itemID = TooltipEnhancement.GetItemLinkFromTooltip(tooltip)
    if not itemLink then
        return
    end

    -- Process faction tooltip enhancement
    FactionTooltipEnhancement.ProcessFactionTooltip(tooltip, itemLink)

    -- Process BOE tooltip enhancement
    TooltipEnhancement.ProcessBOETooltip(tooltip, itemLink)

    -- Process friend attunement tooltip
    TooltipEnhancement.ProcessFriendAttunementTooltip(tooltip, itemLink)

    -- Refresh tooltip to show new content
    tooltip:Show()
end

<<<<<<< Updated upstream
-- ʕ •ᴥ•ʔ✿ Safe hook functions (IdTip-style) ✿ʕ•ᴥ•ʔ
local function InitializeSafeTooltipHooks()
    -- Hook tooltip set item events
    hooksecurefunc(GameTooltip, "SetHyperlink", function(self, link)
        if link and link:match("^item:") then
            ProcessTooltip(self)
        end
=======
-- ʕ •ᴥ•ʔ✿ Initialize tooltip hooks safely ✿ʕ•ᴥ•ʔ
local function InitializeFactionTooltipHooks()
    GameTooltip:HookScript("OnTooltipSetItem", function()
        -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only process if tooltip is actually visible and stable ✿ʕ•ᴥ•ʔ
        if not GameTooltip:IsVisible() then return end
        
        -- ʕ •ᴥ•ʔ✿ Don't interfere with right-click menus or unstable tooltip states ✿ʕ•ᴥ•ʔ
        local name, link = GameTooltip:GetItem()
        if not name or not link then return end
        
        -- ʕ •ᴥ•ʔ✿ Use a small delay to ensure tooltip is stable ✿ʕ•ᴥ•ʔ
        C_Timer.After(0.05, function()
            if GameTooltip:IsVisible() then
                SafeEnhanceAllTooltips()
            end
        end)
    end)
    
    -- ʕ •ᴥ•ʔ✿ Remove OnShow hook as it's too aggressive and conflicts with OnTooltipSetItem ✿ʕ•ᴥ•ʔ
    -- GameTooltip:HookScript("OnShow", SafeEnhanceAllTooltips)

    -- ʕ ● ᴥ ●ʔ✿ Reset processed state when tooltip hides ✿ʕ ● ᴥ ●ʔ
    GameTooltip:HookScript("OnHide", function()
        lastProcessedTooltip.itemLink = nil
        lastProcessedTooltip.boeProcessed = false
        lastProcessedTooltip.factionProcessed = false
>>>>>>> Stashed changes
    end)

    hooksecurefunc(GameTooltip, "SetBagItem", function(self, bag, slot)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetInventoryItem", function(self, unit, slot)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetLootItem", function(self, slot)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetMerchantItem", function(self, slot)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetTradeTargetItem", function(self, id)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetTradePlayerItem", function(self, id)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetQuestItem", function(self, itemType, index)
        ProcessTooltip(self)
    end)

    hooksecurefunc(GameTooltip, "SetQuestLogItem", function(self, itemType, index)
        ProcessTooltip(self)
    end)

    -- Hook script events for additional coverage
    GameTooltip:HookScript("OnTooltipSetItem", function(self)
        ProcessTooltip(self)
    end)

    -- Hook ItemRefTooltip for link clicks
    hooksecurefunc(ItemRefTooltip, "SetHyperlink", function(self, link)
        if link and link:match("^item:") then
            ProcessTooltip(self)
        end
    end)

    ItemRefTooltip:HookScript("OnTooltipSetItem", function(self)
        ProcessTooltip(self)
    end)

    -- Hook shopping tooltips
    if ShoppingTooltip1 then
        ShoppingTooltip1:HookScript("OnTooltipSetItem", function(self)
            ProcessTooltip(self)
        end)
    end

    if ShoppingTooltip2 then
        ShoppingTooltip2:HookScript("OnTooltipSetItem", function(self)
            ProcessTooltip(self)
        end)
    end

    if ItemRefShoppingTooltip1 then
        ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", function(self)
            ProcessTooltip(self)
        end)
    end

    if ItemRefShoppingTooltip2 then
        ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", function(self)
            ProcessTooltip(self)
        end)
    end
end

-- ʕ •ᴥ•ʔ✿ Initialize tooltip system safely ✿ʕ•ᴥ•ʔ
function TooltipEnhancement.Initialize()
<<<<<<< Updated upstream
    -- Wait for addon to be fully loaded before hooking
=======
    -- ʕ •ᴥ•ʔ✿ TEMPORARY DISABLE: Completely disable faction tooltip system to test right-click tooltips ✿ʕ•ᴥ•ʔ
    return
    
    -- ʕ ◕ᴥ◕ ʔ✿ Wait for addon to be fully loaded before hooking ✿ʕ ◕ᴥ◕ ʔ
>>>>>>> Stashed changes
    if IsAddOnLoaded("TheJournal") then
        InitializeSafeTooltipHooks()
    else
        local initFrame = CreateFrame("Frame")
        initFrame:RegisterEvent("ADDON_LOADED")
        initFrame:SetScript("OnEvent", function(self, event, addonName)
            if event == "ADDON_LOADED" and addonName == "TheJournal" then
                InitializeSafeTooltipHooks()
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

-- ʕ •ᴥ•ʔ✿ Auto-initialize when this module loads ✿ʕ•ᴥ•ʔ
TooltipEnhancement.Initialize()

-- ʕ •ᴥ•ʔ✿ Export global functions ✿ʕ •ᴥ•ʔ
_G.TooltipEnhancement = TooltipEnhancement
_G.FactionTooltipEnhancement = FactionTooltipEnhancement
_G.ProcessBOETooltip = TooltipEnhancement.ProcessBOETooltip
_G.GetFriendsWhoNeedItem = TooltipEnhancement.GetFriendsWhoNeedItem

-- ʕ •ᴥ•ʔ✿ Module loaded successfully ✿ʕ •ᴥ•ʔ
