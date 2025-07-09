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

-- ʕ •ᴥ•ʔ✿ Core bag scanning function ✿ʕ •ᴥ•ʔ
function UIBagScanner.ScanAllBags()
    local currentTime = GetTime()
    if currentTime - lastScanTime < SCAN_THROTTLE and not needsFullScan then
        return
    end
    
    lastScanTime = currentTime
    needsFullScan = false
    
    -- ʕ •ᴥ•ʔ✿ Clear previous scan data ✿ʕ •ᴥ•ʔ
    bagItemHash = {}
    bagItemCounts = {}
    
    -- ʕ •ᴥ•ʔ✿ Scan all bags (0-4 are standard bags, -1 is bank if open) ✿ʕ •ᴥ•ʔ
    local bagsToScan = {0, 1, 2, 3, 4}
    
    -- ʕ •ᴥ•ʔ✿ Include bank bags if bank is open ✿ʕ •ᴥ•ʔ
    if BankFrame and BankFrame:IsShown() then
        for i = 5, 11 do
            table.insert(bagsToScan, i)
        end
        table.insert(bagsToScan, -1) -- Main bank bag
    end
    
    for _, bagID in ipairs(bagsToScan) do
        local numSlots = GetContainerNumSlots(bagID)
        if numSlots and numSlots > 0 then
            for slot = 1, numSlots do
                local itemLink = GetContainerItemLink(bagID, slot)
                if itemLink then
                    local itemID = tonumber(itemLink:match("item:(%d+)"))
                    if itemID then
                        local _, itemCount = GetContainerItemInfo(bagID, slot)
                        itemCount = itemCount or 1
                        
                        -- ʕ •ᴥ•ʔ✿ Store in hash table for O(1) lookup ✿ʕ •ᴥ•ʔ
                        bagItemHash[itemID] = true
                        bagItemCounts[itemID] = (bagItemCounts[itemID] or 0) + itemCount
                    end
                end
            end
        end
    end
    
    -- ʕ •ᴥ•ʔ✿ Trigger UI update if journal is open ✿ʕ •ᴥ•ʔ
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
    C_Timer.After(0.1, function()
        if _G.currentDungeon and _G.LoadDungeonDetail then
            _G.LoadDungeonDetail(_G.currentDungeon)
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Event handler ✿ʕ •ᴥ•ʔ
bagEventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" or event == "PLAYER_ENTERING_WORLD" then
        needsFullScan = true
        C_Timer.After(2, function()
            UIBagScanner.ScanAllBags()
        end)
    elseif event == "BAG_UPDATE" or event == "BAG_UPDATE_DELAYED" then
        UIBagScanner.ScanAllBags()
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
    
    -- ʕ •ᴥ•ʔ✿ Check if item is in bags ✿ʕ •ᴥ•ʔ
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

return UIBagScanner 