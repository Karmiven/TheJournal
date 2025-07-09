-- ##################################################################
-- # UITooltipEnhancement.lua - Enhanced BOE Tooltip Integration
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Tooltip Enhancement Module ✿ʕ•ᴥ•ʔ

local TooltipEnhancement = {}

-- ʕ ◕ᴥ◕ ʔ✿ Create frame to handle tooltip updates ✿ʕ ◕ᴥ◕ ʔ
local tooltipFrame = CreateFrame("Frame")
local lastTooltipCache = {
    itemLink = nil,
    timestamp = 0,
    processed = false
}

tooltipFrame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < 0.25 then return end
    self.elapsed = 0
    
    if not GameTooltip:IsVisible() then 
        lastTooltipCache.processed = false
        return 
    end
    
    local tooltipName = GameTooltip:GetName()
    local line1 = _G[tooltipName .. "TextLeft1"]
    if not line1 or not line1:GetText() then return end
    
    local itemLink = TooltipEnhancement.GetItemLinkFromTooltip()
    if not itemLink then 
        lastTooltipCache.processed = false
        return 
    end
    
    local currentTime = GetTime()
    if TooltipEnhancement.TooltipCacheCheck(itemLink, currentTime) then return end
    
    local itemID = tonumber(itemLink:match("item:(%d+)"))
    if not itemID or not _G.ITEM_QUERY_RESPONSES or not _G.ITEM_QUERY_RESPONSES[itemID] then 
        lastTooltipCache.processed = false
        return 
    end
    
    if not TooltipEnhancement.HasBoEData(GameTooltip, itemLink, itemID) then
        ProcessBOETooltip(GameTooltip, itemLink)
        GameTooltip:Show()
        
        lastTooltipCache.itemLink = itemLink
        lastTooltipCache.timestamp = currentTime
        lastTooltipCache.processed = true
    end
end)

-- ʕ ● ᴥ ●ʔ✿ Get item link from various sources ✿ʕ ● ᴥ ●ʔ
function TooltipEnhancement.GetItemLinkFromTooltip()
    local itemLink = nil
    local mouseoverFrame = GetMouseFocus()
    if mouseoverFrame and mouseoverFrame:GetName() then
        local frameName = mouseoverFrame:GetName()
        if frameName:match("ContainerFrame%d+Item%d+") then
            local bag = mouseoverFrame:GetParent():GetID()
            local slot = mouseoverFrame:GetID()
            itemLink = GetContainerItemLink(bag, slot)
        end
    end
    if not itemLink then
        local name, link = GameTooltip:GetItem()
        itemLink = link
    end
    return itemLink
end

-- ʕノ•ᴥ•ʔノ✿ Check tooltip cache ✿ʕノ•ᴥ•ʔノ
function TooltipEnhancement.TooltipCacheCheck(itemLink, currentTime)
    return lastTooltipCache.itemLink == itemLink and 
           lastTooltipCache.processed and 
           (currentTime - lastTooltipCache.timestamp) < 1
end

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
    if not link or not link:match("^item:") then return end
    local itemID = tonumber(link:match("item:(%d+)"))
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

-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ

