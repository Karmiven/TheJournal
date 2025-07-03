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
    if not link or not link:match("^item:") then return end
    
    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then return end
    
    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Processing item ID: " .. itemID)
    end
    
    local itemName, itemLink, quality, _, _, _, _, _, _, texture, _, _, _, bindType = GetItemInfo(itemID)
    if not itemName then return end
    
    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Item: " .. itemName .. ", BindType: " .. (bindType or "nil"))
    end
    
    if bindType ~= 2 then return end
    
    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)
    elseif _G.CanAttuneItemHelper then
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0
    end
    
    if not isAttunable then return end
    
    -- Auto-query friends about this item
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
    
    if not link or not link:match("^item:") then return end
    
    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then return end
    
    local friendsWhoNeed = UIBOETooltipEnhancement.GetFriendsWhoNeedItem(itemID)
    
    if #friendsWhoNeed > 0 then
        tooltip:AddLine(" ")
        tooltip:AddLine("|cFFFFD700Friend Attunement Status:|r")
        tooltip:AddLine("|cFFFF6600Unattuned: " .. table.concat(friendsWhoNeed, ", ") .. "|r", 1, 1, 1, true)
    end
end

-- ʕ •ᴥ•ʔ✿ Tooltip frame for handling updates ✿ʕ•ᴥ•ʔ
local tooltipFrame = CreateFrame("Frame")
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
    
    if not itemLink or not itemLink:match("^item:") then 
        lastTooltipCache.processed = false
        return 
    end
    
    local currentTime = GetTime()
    if lastTooltipCache.itemLink == itemLink and 
       lastTooltipCache.processed and 
       (currentTime - lastTooltipCache.timestamp) < 1 then
        return
    end
    
    local itemID = tonumber(itemLink:match("item:(%d+)"))
    if not itemID or not _G.ITEM_QUERY_RESPONSES or not _G.ITEM_QUERY_RESPONSES[itemID] then 
        lastTooltipCache.processed = false
        return 
    end
    
    local hasBoEData = false
    local numLines = GameTooltip:NumLines()
    for i = 1, numLines do
        local lineText = _G[tooltipName .. "TextLeft" .. i]
        if lineText then
            local text = lineText:GetText()
            if text and text:find("BOE Item", 1, true) then
                hasBoEData = true
                break
            end
        end
    end
    
    if not hasBoEData then
        UIBOETooltipEnhancement.ProcessBOETooltip(GameTooltip, itemLink)
        GameTooltip:Show()
        
        lastTooltipCache.itemLink = itemLink
        lastTooltipCache.timestamp = currentTime
        lastTooltipCache.processed = true
    end
end)

-- ʕ •ᴥ•ʔ✿ Hook item link capture ✿ʕ•ᴥ•ʔ
local originalTooltipSetOwner = GameTooltip.SetOwner
GameTooltip.SetOwner = function(self, owner, ...)
    local result = originalTooltipSetOwner(self, owner, ...)
    
    if self == GameTooltip then
        local itemName, itemLink = self:GetItem()
        if itemLink then
            local itemID = tonumber(itemLink:match("item:(%d+)"))
            if itemID then
                _G.ORIGINAL_ITEM_LINKS[itemID] = itemLink
                if _G.debug then
                    print("|cFF00FF00[BOE Pre-Process]|r Captured original item link for ID " .. itemID .. " via tooltip")
                end
            end
        end
    end
    
    return result
end

-- ʕ •ᴥ•ʔ✿ Hook GameTooltip show ✿ʕ•ᴥ•ʔ
local originalGameTooltipShow = GameTooltip.Show
GameTooltip.Show = function(self)
    local name, link = self:GetItem()
    if link then
        UIBOETooltipEnhancement.EnhanceTooltipWithFriendStatus(self, link)
    end
    return originalGameTooltipShow(self)
end

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

-- ʕ •ᴥ•ʔ✿ Debug slash commands ✿ʕ•ᴥ•ʔ
SLASH_DJBOETEST1 = "/djboetest"
SlashCmdList["DJBOETEST"] = function(msg)
    local itemID = tonumber(msg)
    if not itemID then
        print("|cFFFFD700[BOE Debug]|r Usage: /djboetest <itemID>")
        return
    end
    
    print("|cFFFFD700[BOE Debug]|r Checking responses for item " .. itemID)
    
    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        print("|cFF00FF00[BOE Debug]|r Found responses for item " .. itemID .. ":")
        for friendName, response in pairs(_G.ITEM_QUERY_RESPONSES[itemID]) do
            local statusParts = {}
            if response.needsItem then table.insert(statusParts, "NEEDS") end
            if response.needsAffixesOnly then table.insert(statusParts, "AFFIXES_ONLY") end
            if response.canUpgrade then table.insert(statusParts, "CAN_UPGRADE") end
            local status = table.concat(statusParts, ", ")
            local age = math.floor(GetTime() - response.timestamp)
            print("|cFF87CEEB[BOE Debug]|r   " .. friendName .. ": " .. status .. " (age: " .. age .. "s)")
        end
    else
        print("|cFFFF0000[BOE Debug]|r No responses found for item " .. itemID)
    end
end

SLASH_DJBOEADD1 = "/djboeadd"
SlashCmdList["DJBOEADD"] = function(msg)
    local parts = {}
    for part in msg:gmatch("%S+") do
        table.insert(parts, part)
    end
    
    if #parts < 2 then
        print("|cFFFFD700[BOE Debug]|r Usage: /djboeadd <itemID> <playerName> [needs|affixes|upgrade]")
        return
    end
    
    local itemID = tonumber(parts[1])
    local playerName = parts[2]
    local responseType = parts[3] or "needs"
    
    if not itemID then
        print("|cFFFF0000[BOE Debug]|r Invalid item ID: " .. tostring(parts[1]))
        return
    end
    
    if not _G.ITEM_QUERY_RESPONSES then
        _G.ITEM_QUERY_RESPONSES = {}
    end
    if not _G.ITEM_QUERY_RESPONSES[itemID] then
        _G.ITEM_QUERY_RESPONSES[itemID] = {}
    end
    
    _G.ITEM_QUERY_RESPONSES[itemID][playerName] = {
        needsItem = (responseType == "needs"),
        needsAffixesOnly = (responseType == "affixes"),
        canUpgrade = (responseType == "upgrade"),
        currentForge = 0,
        timestamp = GetTime()
    }
    
    local itemName = GetItemInfo(itemID) or ("Item " .. itemID)
    print("|cFF00FF00[BOE Debug]|r Added test response for " .. itemName .. " from " .. playerName .. " (" .. responseType .. ")")
end

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIBOETooltipEnhancement = UIBOETooltipEnhancement
_G.ProcessBOETooltip = UIBOETooltipEnhancement.ProcessBOETooltip
_G.GetFriendsWhoNeedItem = UIBOETooltipEnhancement.GetFriendsWhoNeedItem

return UIBOETooltipEnhancement
