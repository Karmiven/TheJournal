-- ##################################################################
-- # UIBagScanner.lua - Bag Scanning System for Item Indicators
-- # ʕ •ᴥ•ʔ✿ Efficient O(1) bag item lookup system ✿ʕ •ᴥ•ʔ
-- ##################################################################

local UIBagScanner = {}

-- ʕ •ᴥ•ʔ✿ Hash table for O(1) item lookups ✿ʕ •ᴥ•ʔ
local bagItemHash = {}
local bagItemCounts = {}

-- ʕ •ᴥ•ʔ✿ Performance optimizations ✿ʕ •ᴥ•ʔ
local GetContainerNumSlots = GetContainerNumSlots
local GetContainerItemLink = GetContainerItemLink
local GetContainerItemInfo = GetContainerItemInfo
local GetInventoryItemLink = GetInventoryItemLink
local GetTime = GetTime
local tonumber = tonumber
local pairs = pairs
local ipairs = ipairs

-- ʕ •ᴥ•ʔ✿ Scan throttling ✿ʕ •ᴥ•ʔ
local lastScanTime = 0
local SCAN_THROTTLE = 0.5 -- Don't scan more than twice per second
local needsFullScan = true

-- ʕ •ᴥ•ʔ✿ Event frame for bag updates ✿ʕ •ᴥ•ʔ
local bagEventFrame = CreateFrame("Frame")
bagEventFrame:RegisterEvent("BAG_UPDATE")
bagEventFrame:RegisterEvent("BAG_UPDATE_DELAYED")
bagEventFrame:RegisterEvent("PLAYER_LOGIN")
bagEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
bagEventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
bagEventFrame:RegisterEvent("CHAT_MSG_SYSTEM")

-- ʕ •ᴥ•ʔ✿ Core bag scanning function ✿ʕ •ᴥ•ʔ
function UIBagScanner.ScanAllBags()
    local currentTime = GetTime()
    if currentTime - lastScanTime < SCAN_THROTTLE and not needsFullScan then
        return
    end
    
    lastScanTime = currentTime
    needsFullScan = false
    
    -- Clear previous scan data
    bagItemHash = {}
    bagItemCounts = {}
    
    -- Define bag ranges as constants
    local PLAYER_BAGS = {0, 1, 2, 3, 4}
    local BANK_BAGS = {5, 6, 7, 8, 9, 10, 11, -1} -- -1 is main bank bag
    local EQUIPMENT_SLOTS = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}
    
    -- Helper function to extract item ID consistently
    local function ExtractItemID(itemLink)
        if CustomExtractItemId then
            return CustomExtractItemId(itemLink)
        else
            return tonumber(itemLink:match("item:(%d+)"))
        end
    end
    
    -- Helper function to scan a single bag
    local function ScanBag(bagID)
        local numSlots = GetContainerNumSlots(bagID)
        if not numSlots or numSlots <= 0 then
            return
        end
        
        for slot = 1, numSlots do
            local itemLink = GetContainerItemLink(bagID, slot)
            if itemLink then
                local itemID = ExtractItemID(itemLink)
                if itemID then
                    local _, itemCount = GetContainerItemInfo(bagID, slot)
                    itemCount = itemCount or 1
                    
                    bagItemHash[itemID] = true
                    bagItemCounts[itemID] = (bagItemCounts[itemID] or 0) + itemCount
                end
            end
        end
    end
    
    -- Scan player bags
    for _, bagID in ipairs(PLAYER_BAGS) do
        ScanBag(bagID)
    end
    
    -- Scan bank bags if bank is open
    if BankFrame and BankFrame:IsShown() then
        for _, bagID in ipairs(BANK_BAGS) do
            ScanBag(bagID)
        end
    end
    
    -- Scan equipped gear
    for _, slot in ipairs(EQUIPMENT_SLOTS) do
        local itemLink = GetInventoryItemLink("player", slot)
        if itemLink then
            local itemID = ExtractItemID(itemLink)
            if itemID then
                bagItemHash[itemID] = true
                bagItemCounts[itemID] = (bagItemCounts[itemID] or 0) + 1
            end
        end
    end
    
    -- Trigger UI update if journal is open
    if _G.currentDungeon and _G.LoadDungeonDetail then
        UIBagScanner.UpdateJournalDisplay()
    end
end

-- ʕ •ᴥ•ʔ✿ O(1) lookup function ✿ʕ •ᴥ•ʔ
function UIBagScanner.IsItemInBags(itemID)
    if not itemID then return false end
    return bagItemHash[itemID] == true
end

-- ʕ •ᴥ•ʔ✿ Get item count in bags ✿ʕ •ᴥ•ʔ
function UIBagScanner.GetItemCountInBags(itemID)
    if not itemID then return 0 end
    return bagItemCounts[itemID] or 0
end

-- ʕ •ᴥ•ʔ✿ Update journal display with bag indicators ✿ʕ •ᴥ•ʔ
function UIBagScanner.UpdateJournalDisplay()
    -- ʕ ◕ᴥ◕ ʔ✿ Only update bag indicators, don't reload entire dungeon to prevent quest popout hiding ✿ʕ ◕ᴥ◕ ʔ
    if not _G.currentDungeon then return end
    
    -- ʕ ● ᴥ ●ʔ✿ Update only the bag indicators on existing item buttons ✿ʕ ● ᴥ ●ʔ
    C_Timer.After(0.05, function()
        if _G.itemButtons then
            for i = 1, #_G.itemButtons do
                local button = _G.itemButtons[i]
                if button and button:IsShown() and button.itemID then
                    UIBagScanner.AddBagIndicatorToButton(button, button.itemID)
                end
            end
        end
        
        -- ʕ ◕ᴥ◕ ʔ✿ Also update any visible item list frames ✿ʕ ◕ᴥ◕ ʔ
        if _G.itemsListContainer and _G.itemsListContainer:IsShown() then
            local children = {_G.itemsListContainer:GetChildren()}
            for _, child in pairs(children) do
                if child and child:IsShown() and child.itemID and child.AddBagIndicatorToButton then
                    UIBagScanner.AddBagIndicatorToButton(child, child.itemID)
                elseif child and child:IsShown() and child.itemID then
                    -- ʕ ● ᴥ ●ʔ✿ Fallback for buttons without the method ✿ʕ ● ᴥ ●ʔ
                    UIBagScanner.AddBagIndicatorToButton(child, child.itemID)
                end
            end
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Invalidate attunement cache when items change ✿ʕ •ᴥ•ʔ
function UIBagScanner.InvalidateAttunementCache()
    -- Clear UI cache
    if _G.uiCache then
        _G.uiCache.dungeonAttunement = {}
        _G.uiCache.dungeonAttunementLastUpdate = {}
    end
    
    -- Clear UIDungeonManagement cache
    if _G.UIDungeonManagement and _G.UIDungeonManagement.InvalidateDungeonAttunementCache then
        _G.UIDungeonManagement.InvalidateDungeonAttunementCache()
    end
    
    -- ʕ •ᴥ•ʔ✿ Clear prepared items cache so filters update properly ✿ʕ •ᴥ•ʔ
    if _G.preparedItemsCache then
        _G.preparedItemsCache = {}
    end
    
    -- Clear smart cache for attunement data
    if _G.smartCache then
        _G.smartCache.attunement = {}
        _G.smartCache.forge = {}
    end
end

-- ʕ •ᴥ•ʔ✿ Event handler ✿ʕ •ᴥ•ʔ
bagEventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" or event == "PLAYER_ENTERING_WORLD" then
        needsFullScan = true
        C_Timer.After(2, function()
            UIBagScanner.ScanAllBags()
        end)
    elseif event == "BAG_UPDATE" or event == "BAG_UPDATE_DELAYED" or event == "PLAYER_EQUIPMENT_CHANGED" then
        UIBagScanner.ScanAllBags()
    elseif event == "CHAT_MSG_SYSTEM" then
        local message = ...
        if message and (message:find("attuned") or message:find("Attunement") or message:find("forge")) then
            -- ʕ •ᴥ•ʔ✿ Invalidate cache when attunement status changes ✿ʕ •ᴥ•ʔ
            UIBagScanner.InvalidateAttunementCache()
            
            -- ʕ •ᴥ•ʔ✿ Force refresh the journal if it's open ✿ʕ •ᴥ•ʔ
            if _G.DungeonJournalFrame and _G.DungeonJournalFrame:IsShown() and _G.currentDungeon then
                C_Timer.After(0.5, function()
                    if _G.LoadDungeonDetail then
                        _G.LoadDungeonDetail(_G.currentDungeon)
                    end
                end)
            end
        end
    end
end)

-- ʕ •ᴥ•ʔ✿ Add bag indicator to item button ✿ʕ •ᴥ•ʔ
function UIBagScanner.AddBagIndicatorToButton(button, itemID)
    if not button or not itemID then return end
    
    -- ʕ •ᴥ•ʔ✿ Create bag indicator if it doesn't exist ✿ʕ •ᴥ•ʔ
    if not button.bagIndicator then
        button.bagIndicator = button:CreateTexture(nil, "OVERLAY")
        button.bagIndicator:SetSize(16, 16)
        button.bagIndicator:SetPoint("BOTTOMRIGHT", button.iconTex, "BOTTOMRIGHT", 2, -2)
        button.bagIndicator:SetTexture("Interface\\Icons\\INV_Misc_Bag_08")
    end
    
    -- ʕ •ᴥ•ʔ✿ Create bag count text ✿ʕ •ᴥ•ʔ
    if not button.bagCountText then
        button.bagCountText = button:CreateFontString(nil, "OVERLAY", "NumberFontNormalSmall")
        button.bagCountText:SetPoint("BOTTOMRIGHT", button.bagIndicator, "BOTTOMRIGHT", 2, -2)
        button.bagCountText:SetTextColor(1, 1, 1)
        button.bagCountText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    end
    
    -- ʕ •ᴥ•ʔ✿ Check if item is in bags or equipped ✿ʕ •ᴥ•ʔ
    local isInBags = UIBagScanner.IsItemInBags(itemID)
    local itemCount = UIBagScanner.GetItemCountInBags(itemID)
    
    if isInBags then
        button.bagIndicator:Show()
        button.bagIndicator:SetDesaturated(false)
        button.bagIndicator:SetAlpha(0.9)
        
        -- ʕ •ᴥ•ʔ✿ Show count if more than 1 ✿ʕ •ᴥ•ʔ
        if itemCount > 1 then
            button.bagCountText:SetText(itemCount)
            button.bagCountText:Show()
        else
            button.bagCountText:Hide()
        end
        
        -- ʕ •ᴥ•ʔ✿ Add tooltip to show bag/equipped status ✿ʕ •ᴥ•ʔ
        if not button.bagTooltipScript then
            button.bagTooltipScript = true
            button:HookScript("OnEnter", function(self)
                if self.bagIndicator and self.bagIndicator:IsShown() then
                    GameTooltip:AddLine("|cFF00FF88You own this item|r")
                    GameTooltip:AddLine("|cFFFFFFFFIn bags/equipped: " .. (UIBagScanner.GetItemCountInBags(itemID) or 0) .. "|r")
                    GameTooltip:Show()
                end
            end)
        end
    else
        button.bagIndicator:Hide()
        button.bagCountText:Hide()
    end
end

-- ʕ •ᴥ•ʔ✿ Manual refresh function ✿ʕ •ᴥ•ʔ
function UIBagScanner.RefreshBagScan()
    needsFullScan = true
    UIBagScanner.ScanAllBags()
end

-- ʕ •ᴥ•ʔ✿ Debug function to print bag contents ✿ʕ •ᴥ•ʔ
function UIBagScanner.DebugPrintBagContents()
    local itemCount = 0
    for itemID, _ in pairs(bagItemHash) do
        local itemName = GetItemInfo(itemID) or ("Unknown Item " .. itemID)
        local count = bagItemCounts[itemID] or 0
        print("|cFF88FF88 - " .. itemName .. " (ID: " .. itemID .. ") x" .. count .. "|r")
        itemCount = itemCount + 1
    end
    print("|cFFFFD700[Bag Scanner]|r Total unique items: " .. itemCount)
end

-- ʕ •ᴥ•ʔ✿ Initialize bag scanner ✿ʕ •ᴥ•ʔ
function UIBagScanner.Initialize()
    UIBagScanner.ScanAllBags()
end

-- ʕ •ᴥ•ʔ✿ Make globally accessible ✿ʕ •ᴥ•ʔ
_G.TheJournal_UIBagScanner = UIBagScanner

-- ʕ •ᴥ•ʔ✿ Slash command for manual refresh ✿ʕ •ᴥ•ʔ
SLASH_BAGREFRESH1 = "/bagrefresh"
SLASH_BAGREFRESH2 = "/refreshbags"
SlashCmdList["BAGREFRESH"] = function()
    UIBagScanner.RefreshBagScan()
    print("|cFF00FF00[The Journal]|r Bags refreshed")
end

-- ʕ •ᴥ•ʔ✿ Debug slash command ✿ʕ •ᴥ•ʔ
SLASH_BAGDEBUG1 = "/bagdebug"
SlashCmdList["BAGDEBUG"] = function()
    UIBagScanner.DebugPrintBagContents()
end

-- ʕ •ᴥ•ʔ✿ Attunement cache clear command ✿ʕ •ᴥ•ʔ
SLASH_CLEARATTUNECACHE1 = "/clearattunecache"
SLASH_CLEARATTUNECACHE2 = "/refreshattune"
SlashCmdList["CLEARATTUNECACHE"] = function()
    UIBagScanner.InvalidateAttunementCache()
    print("|cFF00FF00[The Journal]|r Attunement cache cleared!")
    
    -- Force refresh the journal if it's open
    if _G.DungeonJournalFrame and _G.DungeonJournalFrame:IsShown() and _G.currentDungeon then
        if _G.LoadDungeonDetail then
            _G.LoadDungeonDetail(_G.currentDungeon)
        end
    end
end

return UIBagScanner 