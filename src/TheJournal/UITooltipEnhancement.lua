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

tooltipFrame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < 0.3 then return end  -- ʕ ◕ᴥ◕ ʔ✿ Check every 0.3 seconds ✿ʕ ◕ᴥ◕ ʔ
    self.elapsed = 0
    
    if not GameTooltip:IsVisible() then 
        lastProcessedTooltip.itemLink = nil
        lastProcessedTooltip.boeProcessed = false
        lastProcessedTooltip.factionProcessed = false
        return 
    end
    
    local tooltipName = GameTooltip:GetName()
    local line1 = _G[tooltipName .. "TextLeft1"]
    if not line1 or not line1:GetText() then 
        lastProcessedTooltip.itemLink = nil
        lastProcessedTooltip.boeProcessed = false
        lastProcessedTooltip.factionProcessed = false
        return 
    end
    
    local itemLink = TooltipEnhancement.GetItemLinkFromTooltip()
    if not itemLink or not itemLink:match("^|c%x+|Hitem:") then 
        lastProcessedTooltip.itemLink = nil
        lastProcessedTooltip.boeProcessed = false
        lastProcessedTooltip.factionProcessed = false
        return 
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Only process if this is a new tooltip ✿ʕ ◕ᴥ◕ ʔ
    if lastProcessedTooltip.itemLink == itemLink then
        return  -- Already processed this tooltip
    end
    
    local itemID = CustomExtractItemId(itemLink)
    if not itemID or itemID == 0 then 
        lastProcessedTooltip.itemLink = nil
        lastProcessedTooltip.boeProcessed = false
        lastProcessedTooltip.factionProcessed = false
        return 
    end
    
    local currentTime = GetTime()
    
    -- ʕ ● ᴥ ●ʔ✿ Process BOE tooltips ✿ʕ ● ᴥ ●ʔ
    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        if not TooltipEnhancement.HasBoEData(GameTooltip, itemLink, itemID) then
            ProcessBOETooltip(GameTooltip, itemLink)
            lastProcessedTooltip.boeProcessed = true
        end
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Process faction tooltips ✿ʕ ◕ᴥ◕ ʔ
    if FactionTooltipEnhancement.IsFactionTooltipEnabled() then
        if not FactionTooltipEnhancement.HasFactionData(GameTooltip) then
            FactionTooltipEnhancement.ProcessFactionTooltip(GameTooltip, itemLink)
            lastProcessedTooltip.factionProcessed = true
        end
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Update tooltip display if anything was processed ✿ʕ ● ᴥ ●ʔ
    if lastProcessedTooltip.boeProcessed or lastProcessedTooltip.factionProcessed then
        GameTooltip:Show()
    end
    
    -- ʕ ● ᴥ ●ʔ✿ Mark this tooltip as processed ✿ʕ ● ᴥ ●ʔ
    lastProcessedTooltip.itemLink = itemLink
    lastProcessedTooltip.timestamp = currentTime
end)

-- ʕ ● ᴥ ●ʔ✿ Get item link from various sources ✿ʕ ● ᴥ ●ʔ
function TooltipEnhancement.GetItemLinkFromTooltip()
    local itemLink = nil
    
    -- ʕ ◕ᴥ◕ ʔ✿ First try to get item link directly from GameTooltip ✿ʕ ◕ᴥ◕ ʔ
    local name, link = GameTooltip:GetItem()
    if link then
        local itemID = CustomExtractItemId(link)
        if itemID and itemID > 0 then
            itemLink = link
            return itemLink
        end
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Fallback: try container frame detection ✿ʕ ◕ᴥ◕ ʔ
    local mouseoverFrame = GetMouseFocus()
    if mouseoverFrame and mouseoverFrame:GetName() then
        local frameName = mouseoverFrame:GetName()
        if frameName:match("ContainerFrame%d+Item%d+") then
            local bag = mouseoverFrame:GetParent():GetID()
            local slot = mouseoverFrame:GetID()
            itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local itemID = CustomExtractItemId(itemLink)
                if itemID and itemID > 0 then
                    return itemLink
                end
            end
        end
    end
    
    return itemLink
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
local function ProcessBOETooltip(tooltip, link)
    if not link or not CustomExtractItemId(link) then return end
    local itemID = CustomExtractItemId(link)
    if not itemID then return end
    
    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Processing item ID: " .. itemID)
    end
    
    local itemName, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemID)
    if not itemName or bindType ~= 2 then return end
    
    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)
    elseif _G.CanAttuneItemHelper then
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0
    end

    if not isAttunable then return end

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
                        print("|cFF00FF00[BOE Alert]|r Whispered " .. friendName .. " about " .. itemName)
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

    else
        tooltip:AddLine("|cFF888888Querying friends... (or no responses yet)|r")
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
_G.TooltipEnhancement = TooltipEnhancement
_G.FactionTooltipEnhancement = FactionTooltipEnhancement

-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ

