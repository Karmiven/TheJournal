-- ##################################################################
-- # UITooltipEnhancement.lua - Enhanced BOE Tooltip Integration
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Tooltip Enhancement Module ✿ʕ•ᴥ•ʔ

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

-- ＼ʕ •ᴥ•ʔ／✿ Check if faction data is already present on the tooltip ✿＼ʕ •ᴥ•ʔ／
function FactionTooltipEnhancement.HasFactionData(tooltip)
    local tooltipName = tooltip:GetName()
    local line1 = _G[tooltipName .. "TextLeft1"]
    if line1 then
        local text = line1:GetText()
        if text and text:find("INV_BannerPVP", 1, true) then
            return true
        end
    end
    return false
end

-- ʕ •ᴥ•ʔ✿ Old faction cache check removed - using simpler per-frame tracking ✿ʕ •ᴥ•ʔ

-- ʕ ◕ᴥ◕ ʔ✿ Process faction tooltip enhancement ✿ʕ ◕ᴥ◕ ʔ
function FactionTooltipEnhancement.ProcessFactionTooltip(tooltip, itemLink)
    -- ʕ ◕ᴥ◕ ʔ✿ Debug - always show this when enabled to test if function is being called ✿ʕ ◕ᴥ◕ ʔ

    if not FactionTooltipEnhancement.IsFactionTooltipEnabled() then
        return
    end

    if not itemLink or not itemLink:match("^|c%x+|Hitem:") then
        return
    end

    local itemID = CustomExtractItemId(itemLink)
    if not itemID or itemID == 0 then
        return
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Cache checking is now handled by OnUpdate frame ✿ʕ ◕ᴥ◕ ʔ

    if FactionTooltipEnhancement.HasFactionData(tooltip) then
        return
    end

    local factionType = FactionTooltipEnhancement.GetItemFaction(itemID)
    if not factionType then
        return
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Debug output ✿ʕ ◕ᴥ◕ ʔ

    local factionIcon = ""

    if factionType == 1 then
        factionIcon = "|TInterface\\Icons\\INV_BannerPVP_02:16:16|t"
    elseif factionType == 2 then
        factionIcon = "|TInterface\\Icons\\INV_BannerPVP_01:16:16|t"
    end

    if factionIcon ~= "" then
        -- ʕ ● ᴥ ●ʔ✿ Modify the item name line directly to include faction icon ✿ʕ ● ᴥ ●ʔ
        local tooltipName = tooltip:GetName()
        local line1 = _G[tooltipName .. "TextLeft1"]
        if line1 then
            local currentText = line1:GetText()
            if currentText and not currentText:find("INV_BannerPVP") then
                line1:SetText(factionIcon .. " " .. currentText)
            end
        end

        -- ʕ ◕ᴥ◕ ʔ✿ Cache tracking handled by OnUpdate frame ✿ʕ ◕ᴥ◕ ʔ
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Single unified tooltip processing frame ✿ʕ ◕ᴥ◕ ʔ
local tooltipFrame = CreateFrame("Frame")
local lastProcessedTooltip = {
    itemLink = nil,
    timestamp = 0,
    boeProcessed = false,
    factionProcessed = false
}

-- ʕ •ᴥ•ʔ✿ CONSOLIDATED: Remove duplicate OnUpdate processing ✿ʕ•ᴥ•ʔ
-- ʕ ◕ᴥ◕ ʔ✿ This is now handled by UIBOETooltipEnhancement.lua to avoid conflicts ✿ʕ ◕ᴥ◕ ʔ

-- ʕ •ᴥ•ʔ✿ Safe tooltip enhancement functions with error protection ✿ʕ •ᴥ•ʔ
local function SafeEnhanceFactionTooltip()
    -- ʕ ◕ᴥ◕ ʔ✿ Multiple safety checks to prevent errors ✿ʕ ◕ᴥ◕ ʔ
    if not GameTooltip or not GameTooltip:IsVisible() or not GameTooltip.GetOwner or not GameTooltip:GetOwner() then 
        return 
    end

    local success, itemLink = pcall(function()
        return TooltipEnhancement.GetItemLinkFromTooltip()
    end)
    
    if not success or not itemLink then 
        return 
    end

    -- ʕ ● ᴥ ●ʔ✿ Prevent duplicate processing with additional safety ✿ʕ ● ᴥ ●ʔ
    if lastProcessedTooltip.itemLink == itemLink and lastProcessedTooltip.factionProcessed then
        return
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Process faction tooltip enhancement with error protection ✿ʕ ◕ᴥ◕ ʔ
    if _G.DJ_Settings and _G.DJ_Settings.showFactionTooltips then
        pcall(function()
            FactionTooltipEnhancement.ProcessFactionTooltip(GameTooltip, itemLink)
        end)
    end

    lastProcessedTooltip.itemLink = itemLink
    lastProcessedTooltip.factionProcessed = true
end

-- ʕ •ᴥ•ʔ✿ Safe BOE tooltip enhancement with error protection ✿ʕ •ᴥ•ʔ
local function SafeEnhanceBOETooltip()
    -- ʕ ◕ᴥ◕ ʔ✿ Multiple safety checks to prevent errors ✿ʕ ◕ᴥ◕ ʔ
    if not GameTooltip or not GameTooltip:IsVisible() or not GameTooltip.GetOwner or not GameTooltip:GetOwner() then 
        return 
    end

    local success, itemLink = pcall(function()
        return TooltipEnhancement.GetItemLinkFromTooltip()
    end)
    
    if not success or not itemLink then 
        return 
    end

    -- ʕ ● ᴥ ●ʔ✿ Prevent duplicate processing with additional safety ✿ʕ ● ᴥ ●ʔ
    if lastProcessedTooltip.itemLink == itemLink and lastProcessedTooltip.boeProcessed then
        return
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Process BOE tooltip enhancement with error protection ✿ʕ ◕ᴥ◕ ʔ
    if _G.ProcessBOETooltip then
        pcall(function()
            ProcessBOETooltip(GameTooltip, itemLink)
        end)
    end

    lastProcessedTooltip.itemLink = itemLink
    lastProcessedTooltip.boeProcessed = true
end

-- ʕ •ᴥ•ʔ✿ Combined safe tooltip enhancement ✿ʕ •ᴥ•ʔ
local function SafeEnhanceAllTooltips()
    SafeEnhanceFactionTooltip()
    SafeEnhanceBOETooltip()
end

-- ʕ •ᴥ•ʔ✿ Initialize tooltip hooks safely with conflict prevention ✿ʕ•ᴥ•ʔ
local function InitializeFactionTooltipHooks()
    -- ʕ ◕ᴥ◕ ʔ✿ Add safety checks to prevent multiple hook conflicts ✿ʕ ◕ᴥ◕ ʔ
    if TooltipEnhancement.hooksInitialized then
        return
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Use pcall to safely hook without breaking existing functionality ✿ʕ ● ᴥ ●ʔ
    local success1 = pcall(function()
        GameTooltip:HookScript("OnTooltipSetItem", function(self)
            -- ʕ ◕ᴥ◕ ʔ✿ Only enhance if tooltip is still visible and valid ✿ʕ ◕ᴥ◕ ʔ
            if GameTooltip:IsVisible() and GameTooltip:GetOwner() then
                SafeEnhanceAllTooltips()
            end
        end)
    end)
    
    local success2 = pcall(function()
        GameTooltip:HookScript("OnShow", function(self)
            -- ʕ ● ᴥ ●ʔ✿ Only enhance if tooltip has valid content ✿ʕ ● ᴥ ●ʔ
            if GameTooltip:IsVisible() and GameTooltip:GetOwner() then
                SafeEnhanceAllTooltips()
            end
        end)
    end)

    -- ʕ ◕ᴥ◕ ʔ✿ Reset processed state when tooltip hides - with error protection ✿ʕ ◕ᴥ◕ ʔ
    local success3 = pcall(function()
        GameTooltip:HookScript("OnHide", function()
            lastProcessedTooltip.itemLink = nil
            lastProcessedTooltip.boeProcessed = false
            lastProcessedTooltip.factionProcessed = false
        end)
    end)
    
    if success1 and success2 and success3 then
        TooltipEnhancement.hooksInitialized = true
    end
end

-- ʕ •ᴥ•ʔ✿ Initialize faction tooltip system safely ✿ʕ•ᴥ•ʔ
function TooltipEnhancement.Initialize()
    -- ʕ ◕ᴥ◕ ʔ✿ Wait for addon to be fully loaded before hooking ✿ʕ ◕ᴥ◕ ʔ
    if IsAddOnLoaded("TheJournal") then
        InitializeFactionTooltipHooks()
    else
        local initFrame = CreateFrame("Frame")
        initFrame:RegisterEvent("ADDON_LOADED")
        initFrame:SetScript("OnEvent", function(self, event, addonName)
            if event == "ADDON_LOADED" and addonName == "TheJournal" then
                InitializeFactionTooltipHooks()
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

-- ʕ •ᴥ•ʔ✿ Auto-initialize when this module loads ✿ʕ•ᴥ•ʔ
TooltipEnhancement.Initialize()

-- ʕ •ᴥ•ʔ✿ Export global functions ✿ʕ •ᴥ•ʔ
_G.ProcessBOETooltip = ProcessBOETooltip
_G.TooltipEnhancement = TooltipEnhancement

-- ʕ ● ᴥ ●ʔ✿ Enhanced item link detection with better container frame support ✿ʕ ● ᴥ ●ʔ
function TooltipEnhancement.GetItemLinkFromTooltip()
    local itemLink = nil

    -- ʕ ◕ᴥ◕ ʔ✿ First try to get item link directly from GameTooltip ✿ʕ ◕ᴥ◕ ʔ
    local success, name, link = pcall(function()
        return GameTooltip:GetItem()
    end)
    
    if success and link then
        local itemID = CustomExtractItemId(link)
        if itemID and itemID > 0 then
            return link
        end
    end

    -- ʕ ● ᴥ ●ʔ✿ Enhanced container frame detection with error protection ✿ʕ ● ᴥ ●ʔ
    local mouseoverFrame = GetMouseFocus()
    if mouseoverFrame and mouseoverFrame.GetName then
        local success2, frameName = pcall(function()
            return mouseoverFrame:GetName()
        end)
        
        if success2 and frameName and frameName:match("ContainerFrame%d+Item%d+") then
            local success3, bag, slot = pcall(function()
                local bag = mouseoverFrame:GetParent():GetID()
                local slot = mouseoverFrame:GetID()
                return bag, slot
            end)
            
            if success3 and bag and slot then
                local success4, containerLink = pcall(function()
                    return GetContainerItemLink(bag, slot)
                end)
                
                if success4 and containerLink then
                    local itemID = CustomExtractItemId(containerLink)
                    if itemID and itemID > 0 then
                        return containerLink
                    end
                end
            end
        end
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Fallback: try to get from tooltip owner if it's a container frame ✿ʕ ◕ᴥ◕ ʔ
    if GameTooltip:GetOwner() and GameTooltip:GetOwner().GetName then
        local success5, ownerName = pcall(function()
            return GameTooltip:GetOwner():GetName()
        end)
        
        if success5 and ownerName and ownerName:match("ContainerFrame%d+Item%d+") then
            local success6, bag, slot = pcall(function()
                local owner = GameTooltip:GetOwner()
                local bag = owner:GetParent():GetID()
                local slot = owner:GetID()
                return bag, slot
            end)
            
            if success6 and bag and slot then
                local success7, ownerLink = pcall(function()
                    return GetContainerItemLink(bag, slot)
                end)
                
                if success7 and ownerLink then
                    local itemID = CustomExtractItemId(ownerLink)
                    if itemID and itemID > 0 then
                        return ownerLink
                    end
                end
            end
        end
    end

    return nil
end

-- ʕノ•ᴥ•ʔノ✿ Cache check function removed - using simpler approach to prevent spam ✿ʕノ•ᴥ•ʔノ

-- ＼ʕ •ᴥ•ʔ／✿ Check if BOE data is already present on the tooltip ✿＼ʕ •ᴥ•ʔ／
function TooltipEnhancement.HasBoEData(tooltip, itemLink, itemID)
    local hasBoEData = false
    local numLines = tooltip:NumLines()
    for i = 1, numLines do
        local lineText = _G[tooltip:GetName() .. "TextLeft" .. i]
        if lineText then
            local text = lineText:GetText()
            if text and text:find("BOE Item", 1, true) then
                hasBoEData = true
                break
            end
        end
    end
    return hasBoEData
end

-- ʕ •ᴥ•ʔ✿ Debug helpers for BOE Tooltip Testing ✿ʕ •ᴥ•ʔ
local debugFrame = CreateFrame("Frame")
debugFrame:RegisterEvent("PLAYER_LOGIN")
debugFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        local timer = CreateFrame("Frame")
        timer:SetScript("OnUpdate", function(timerSelf, elapsed)
            timerSelf.elapsed = (timerSelf.elapsed or 0) + elapsed
            if timerSelf.elapsed >= 2 then
                timerSelf:SetScript("OnUpdate", nil)
            end
        end)
    end
end)

-- ʕノ•ᴥ•ʔノ✿ Global storage for original item links ✿ʕノ•ᴥ•ʔノ
_G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}

-- ʕ •ᴥ•ʔ✿ Initialize BOE query tracking variables ✿ʕ •ᴥ•ʔ
_G.LAST_BOE_QUERY_TIME = _G.LAST_BOE_QUERY_TIME or {}
_G.LAST_BOE_CHAT_TIME = _G.LAST_BOE_CHAT_TIME or {}
_G.PROCESSED_BOE_RESPONSES = _G.PROCESSED_BOE_RESPONSES or {}

-- ＼ʕ •ᴥ•ʔ／✿ Hook the slash command handler ✿＼ʕ •ᴥ•ʔ／
local originalSlashCmdList = SlashCmdList["DJ"]
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

-- ʕ ◕ᴥ◕ ʔ✿ Enhanced BOE Processing ✿ʕ ◕ᴥ◕ ʔ
function ProcessBOETooltip(tooltip, link)
    if not link or not CustomExtractItemId(link) then return end
    local itemID = CustomExtractItemId(link)
    if not itemID then return end

    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Processing item ID: " .. itemID)
    end

    local itemName, _, _, _, _, _, _, _, _, _ = GetItemInfo(itemID)


    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)
    elseif _G.CanAttuneItemHelper then
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0
    end

    if not isAttunable then return end

    -- ʕ •ᴥ•ʔ✿ Check if auto testboe is enabled and use the new system ✿ʕ •ᴥ•ʔ
    if _G.DJ_Settings and _G.DJ_Settings.autoTestBoe and _G.PerformBOETest then
        local lastQueryTime = _G.LAST_BOE_QUERY_TIME[itemID]
        if not lastQueryTime or (GetTime() - lastQueryTime) > 10 then
            _G.PerformBOETest(itemID, link, true) -- true = automatic mode
            _G.LAST_BOE_QUERY_TIME[itemID] = GetTime()
        end
        -- ʕ ◕ᴥ◕ ʔ✿ Return here when auto mode is enabled - don't run fallback ✿ʕ ◕ᴥ◕ ʔ
    else
        -- ʕ ◕ᴥ◕ ʔ✿ Fallback to old system if auto mode disabled ✿ʕ ◕ᴥ◕ ʔ
        local lastQueryTime = _G.LAST_BOE_QUERY_TIME[itemID]
        if not lastQueryTime or (GetTime() - lastQueryTime) > 10 then
            if _G.QueryItemFromFriends then
                _G.QueryItemFromFriends(itemID, link)
                _G.LAST_BOE_QUERY_TIME[itemID] = GetTime()
                local lastChatTime = _G.LAST_BOE_CHAT_TIME[itemID]
                if not lastChatTime or (GetTime() - lastChatTime) > 30 then
                    print("|cFFFFD700[Auto BOE]|r Checking if friends need " .. (itemName or ("Item " .. itemID)))
                    _G.LAST_BOE_CHAT_TIME[itemID] = GetTime()
                end
            end
        end
    end

    tooltip:AddLine(" ")
    tooltip:AddLine("|cFFFFD700BOE Item - Friend Status:|r")

    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        local responses = _G.ITEM_QUERY_RESPONSES[itemID]
        local friendsWhoNeed = {}
        local friendsWhoNeedAffixes = {}
        local friendsWhoCanUpgrade = {}

        local fullItemLink = _G.QUERIED_ITEM_LINKS and _G.QUERIED_ITEM_LINKS[itemID] or link
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

        if #friendsWhoNeed > 0 then
            tooltip:AddLine("|cFF00FF00NEED: " .. table.concat(friendsWhoNeed, ", ") .. "|r")
        end
        if #friendsWhoNeedAffixes > 0 then
            tooltip:AddLine("|cFFFFFF00AFFIXES: " .. table.concat(friendsWhoNeedAffixes, ", ") .. "|r")
        end
        if #friendsWhoCanUpgrade > 0 then
            tooltip:AddLine("|cFFFFFF00UPGRADE: " .. table.concat(friendsWhoCanUpgrade, ", ") .. "|r")
        end

        if #friendsWhoNeed == 0 and #friendsWhoNeedAffixes == 0 and #friendsWhoCanUpgrade == 0 then
            tooltip:AddLine("|cFF888888No friends need this item|r")
        end
    else
        tooltip:AddLine("|cFF888888Checking friends...|r")
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Cleanup old processed responses ✿ʕ ◕ᴥ◕ ʔ
local function CleanupProcessedResponses()
    local currentTime = GetTime()
    local cutoffTime = 300
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
-- Schedule cleanup every 5 minutes
local cleanupTimer = C_Timer.NewTicker(300, CleanupProcessedResponses)

-- ＼ʕ •ᴥ•ʔ／✿ Export global functions ✿＼ʕ •ᴥ•ʔ／
_G.FactionTooltipEnhancement = FactionTooltipEnhancement

-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ

-- ʕ •ᴥ•ʔ✿ Debug utility to test tooltip functionality ✿ʕ•ᴥ•ʔ
function TooltipEnhancement.TestTooltipFunctionality()
    local tests = {
        {
            name = "GameTooltip exists and has core functions",
            test = function()
                return GameTooltip and 
                       GameTooltip.Show and 
                       GameTooltip.Hide and 
                       GameTooltip.IsVisible and 
                       GameTooltip.SetOwner and 
                       GameTooltip.GetOwner
            end
        },
        {
            name = "Tooltip hooks are properly initialized",
            test = function()
                return TooltipEnhancement.hooksInitialized == true
            end
        },
        {
            name = "No tooltip hooks are breaking GameTooltip.Show",
            test = function()
                -- Test that GameTooltip.Show hasn't been completely replaced
                return type(GameTooltip.Show) == "function" and 
                       not GameTooltip.Show.__replaced
            end
        },
        {
            name = "GameTooltip can be shown and hidden normally",
            test = function()
                local wasVisible = GameTooltip:IsVisible()
                GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
                GameTooltip:SetText("Test")
                GameTooltip:Show()
                local canShow = GameTooltip:IsVisible()
                GameTooltip:Hide()
                local canHide = not GameTooltip:IsVisible()
                
                -- Restore original state
                if wasVisible then
                    GameTooltip:Show()
                end
                
                return canShow and canHide
            end
        },
        {
            name = "Tooltip restoration system is active",
            test = function()
                return _G.TooltipRestoration ~= nil
            end
        },
        {
            name = "Container frame tooltip detection works",
            test = function()
                -- Test that we can detect container frames without errors
                local mouseFrame = GetMouseFocus()
                return pcall(function()
                    TooltipEnhancement.GetItemLinkFromTooltip()
                    return true
                end)
            end
        }
    }
    
    print("|cFF00FFFF[Tooltip Debug]|r Testing tooltip functionality...")
    local passed = 0
    local total = #tests
    
    for i, test in ipairs(tests) do
        local success, result = pcall(test.test)
        if success and result then
            print("|cFF00FF00✓|r " .. test.name)
            passed = passed + 1
        else
            print("|cFFFF0000✗|r " .. test.name .. (success and "" or " (ERROR: " .. tostring(result) .. ")"))
        end
    end
    
    print("|cFF00FFFF[Tooltip Debug]|r Results: " .. passed .. "/" .. total .. " tests passed")
    
    if passed == total then
        print("|cFF00FF00[Tooltip Debug]|r All tests passed! Tooltips should work normally.")
        print("|cFFFFFFFF[Tooltip Debug]|r Try '/rt' to manually refresh tooltips if needed.")
    else
        print("|cFFFF6600[Tooltip Debug]|r Some tests failed. There may be tooltip issues.")
        print("|cFFFFFFFF[Tooltip Debug]|r Try '/rt' to manually refresh tooltips.")
    end
end

-- ʕ •ᴥ•ʔ✿ Export debug function globally for easy access ✿ʕ•ᴥ•ʔ
_G.TestTooltipFunctionality = TooltipEnhancement.TestTooltipFunctionality

-- ʕ •ᴥ•ʔ✿ Tooltip Restoration System for Right-Click Events ✿ʕ•ᴥ•ʔ
local TooltipRestoration = {}

-- ʕ ◕ᴥ◕ ʔ✿ Track tooltip state before mouse events ✿ʕ ◕ᴥ◕ ʔ
local tooltipState = {
    wasVisible = false,
    owner = nil,
    lastMouseFrame = nil,
    lastUpdateTime = 0
}

-- ʕ ● ᴥ ●ʔ✿ Force tooltip refresh for container frames ✿ʕ ● ᴥ ●ʔ
function TooltipRestoration.RefreshContainerTooltip()
    local mouseFrame = GetMouseFocus()
    if not mouseFrame or not mouseFrame:GetName() then
        return
    end
    
    local frameName = mouseFrame:GetName()
    if frameName:match("ContainerFrame%d+Item%d+") then
        -- ʕ ◕ᴥ◕ ʔ✿ Get container item information ✿ʕ ◕ᴥ◕ ʔ
        local success, bag, slot = pcall(function()
            local bag = mouseFrame:GetParent():GetID()
            local slot = mouseFrame:GetID()
            return bag, slot
        end)
        
        if success and bag and slot then
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                -- ʕ ● ᴥ ●ʔ✿ Force tooltip to show with proper content ✿ʕ ● ᴥ ●ʔ
                GameTooltip:SetOwner(mouseFrame, "ANCHOR_RIGHT")
                GameTooltip:SetHyperlink(itemLink)
                GameTooltip:Show()
                
                -- ʕ ◕ᴥ◕ ʔ✿ Update tooltip state ✿ʕ ◕ᴥ◕ ʔ
                tooltipState.wasVisible = true
                tooltipState.owner = mouseFrame
                tooltipState.lastMouseFrame = mouseFrame
                tooltipState.lastUpdateTime = GetTime()
                
                return true
            end
        end
    end
    
    return false
end

-- ʕ •ᴥ•ʔ✿ Monitor mouse events for tooltip restoration ✿ʕ•ᴥ•ʔ
local mouseEventFrame = CreateFrame("Frame")
mouseEventFrame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < 0.1 then return end
    self.elapsed = 0
    
    -- ʕ ◕ᴥ◕ ʔ✿ Check if mouse is over a container frame and tooltip should be showing ✿ʕ ◕ᴥ◕ ʔ
    local mouseFrame = GetMouseFocus()
    if mouseFrame and mouseFrame:GetName() then
        local frameName = mouseFrame:GetName()
        if frameName:match("ContainerFrame%d+Item%d+") then
            -- ʕ ● ᴥ ●ʔ✿ If tooltip is not visible but should be, restore it ✿ʕ ● ᴥ ●ʔ
            if not GameTooltip:IsVisible() or GameTooltip:GetOwner() ~= mouseFrame then
                local currentTime = GetTime()
                -- ʕ ◕ᴥ◕ ʔ✿ Add small delay to prevent spam during rapid mouse movements ✿ʕ ◕ᴥ◕ ʔ
                if currentTime - tooltipState.lastUpdateTime > 0.2 then
                    TooltipRestoration.RefreshContainerTooltip()
                end
            end
        end
    end
end)

-- ʕ •ᴥ•ʔ✿ Hook right-click events to preserve tooltip state ✿ʕ•ᴥ•ʔ
local function HookRightClickEvents()
    -- ʕ ◕ᴥ◕ ʔ✿ Hook the global right-click handler ✿ʕ ◕ᴥ◕ ʔ
    local originalOnClick = nil
    
    -- ʕ ● ᴥ ●ʔ✿ Create a frame to capture mouse down events ✿ʕ ● ᴥ ●ʔ
    local clickCapture = CreateFrame("Frame")
    clickCapture:SetAllPoints(UIParent)
    clickCapture:EnableMouse(false) -- Don't block mouse events
    clickCapture:SetFrameStrata("TOOLTIP")
    
    -- ʕ ◕ᴥ◕ ʔ✿ Monitor for right-click events ✿ʕ ◕ᴥ◕ ʔ
    clickCapture:SetScript("OnUpdate", function(self, elapsed)
        if IsMouseButtonDown("RightButton") then
            -- ʕ ● ᴥ ●ʔ✿ Store current tooltip state before right-click processing ✿ʕ ● ᴥ ●ʔ
            tooltipState.wasVisible = GameTooltip:IsVisible()
            tooltipState.owner = GameTooltip:GetOwner()
            tooltipState.lastMouseFrame = GetMouseFocus()
            
            -- ʕ ◕ᴥ◕ ʔ✿ Schedule tooltip restoration after a brief delay ✿ʕ ◕ᴥ◕ ʔ
            C_Timer.After(0.1, function()
                if tooltipState.wasVisible and tooltipState.lastMouseFrame then
                    TooltipRestoration.RefreshContainerTooltip()
                end
            end)
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Initialize tooltip restoration system ✿ʕ•ᴥ•ʔ
function TooltipRestoration.Initialize()
    HookRightClickEvents()
end

-- ʕ •ᴥ•ʔ✿ Auto-initialize ✿ʕ•ᴥ•ʔ
TooltipRestoration.Initialize()

-- ʕ •ᴥ•ʔ✿ Export globally ✿ʕ•ᴥ•ʔ
_G.TooltipRestoration = TooltipRestoration

-- ʕ •ᴥ•ʔ✿ Manual tooltip refresh system ✿ʕ•ᴥ•ʔ
function TooltipEnhancement.RefreshTooltip()
    local mouseFrame = GetMouseFocus()
    if not mouseFrame then
        return false
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Check if mouse is over a container frame ✿ʕ ◕ᴥ◕ ʔ
    if mouseFrame.GetName then
        local success, frameName = pcall(function()
            return mouseFrame:GetName()
        end)
        
        if success and frameName and frameName:match("ContainerFrame%d+Item%d+") then
            return TooltipRestoration.RefreshContainerTooltip()
        end
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Try to refresh tooltip for other frame types ✿ʕ ● ᴥ ●ʔ
    if GameTooltip:IsVisible() then
        local owner = GameTooltip:GetOwner()
        if owner then
            -- ʕ ◕ᴥ◕ ʔ✿ Try to get item information and refresh ✿ʕ ◕ᴥ◕ ʔ
            local success, name, link = pcall(function()
                return GameTooltip:GetItem()
            end)
            
            if success and link then
                GameTooltip:SetHyperlink(link)
                GameTooltip:Show()
                return true
            end
        end
    end
    
    return false
end

-- ʕ •ᴥ•ʔ✿ Slash command for manual tooltip refresh ✿ʕ•ᴥ•ʔ
SLASH_REFRESHTOOLTIP1 = "/refreshtooltip"
SLASH_REFRESHTOOLTIP2 = "/rt"
SlashCmdList["REFRESHTOOLTIP"] = function()
    if TooltipEnhancement.RefreshTooltip() then
        print("|cFF00FF00[Tooltip]|r Tooltip refreshed successfully")
    else
        print("|cFFFFFF00[Tooltip]|r No tooltip to refresh or refresh failed")
    end
end
