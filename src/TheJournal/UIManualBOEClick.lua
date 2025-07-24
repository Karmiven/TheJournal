-- ##################################################################
-- # UIManualBOEClick.lua
-- # ʕ •ᴥ•ʔ✿ Simple Manual BOE Click Handler ✿ʕ•ᴥ•ʔ
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Track manually queried items ✿ʕ•ᴥ•ʔ
if not _G.MANUAL_BOE_QUERIES then
    _G.MANUAL_BOE_QUERIES = {}
end

-- ʕ ◕ᴥ◕ ʔ✿ Flag to prevent tooltip restoration interference ✿ʕ ◕ᴥ◕ ʔ
if not _G.MANUAL_TOOLTIP_ACTIVE then
    _G.MANUAL_TOOLTIP_ACTIVE = false
end

-- ʕ •ᴥ•ʔ✿ Check if an item was manually queried ✿ʕ•ᴥ•ʔ
local function WasManuallyQueried(itemID)
    if not itemID or not _G.MANUAL_BOE_QUERIES then
        return false
    end
    local queryTime = _G.MANUAL_BOE_QUERIES[itemID]
    if not queryTime then
        return false
    end
    return (GetTime() - queryTime) < 1800
end

-- ʕ •ᴥ•ʔ✿ Manual BOE test function ✿ʕ •ᴥ•ʔ
local function DoManualBOETest(itemLink)
    if not itemLink then 
        print("|cFFFF0000[Manual BOE]|r Error: No item link provided")
        return 
    end

    local itemID = tonumber(itemLink:match("item:(%d+)"))
    if not itemID then
        print("|cFFFF0000[Manual BOE]|r Error: Could not extract item ID from link")
        return
    end
    
    local itemName = GetItemInfo(itemID)
    if not itemName then
        print("|cFFFF0000[Manual BOE]|r Error: Could not get item info for ID " .. itemID)
        return
    end
    
    print("|cFF87CEEB[Manual BOE]|r Testing " .. itemName .. " (ID: " .. itemID .. ")")
    
    -- ʕ ◕ᴥ◕ ʔ✿ Mark as manually queried ✿ʕ ◕ᴥ◕ ʔ
    _G.MANUAL_BOE_QUERIES[itemID] = GetTime()
    
    -- ʕ ● ᴥ ●ʔ✿ Use the new PerformBOETest system if available ✿ʕ ● ᴥ ●ʔ
    if _G.PerformBOETest then
        _G.PerformBOETest(itemID, itemLink, false) -- false = manual mode
        print("|cFF00FF00[Manual BOE]|r Query sent to friends for " .. itemName)
    else
        print("|cFFFF0000[Manual BOE]|r Error: PerformBOETest function not available")
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Store original link for later use ✿ʕ ◕ᴥ◕ ʔ
    _G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}
    _G.ORIGINAL_ITEM_LINKS[itemID] = itemLink
end

-- ʕ •ᴥ•ʔ✿ Test item from current tooltip ✿ʕ•ᴥ•ʔ
local function TestTooltipItem()
    if GameTooltip:IsVisible() then
        local name, link = GameTooltip:GetItem()
        if link then
            print("|cFF87CEEB[Manual BOE]|r Testing item from tooltip: " .. (name or "Unknown Item"))
            
            local itemID = tonumber(link:match("item:(%d+)"))
            if itemID then
                -- ʕ ◕ᴥ◕ ʔ✿ Mark as manually queried first ✿ʕ ◕ᴥ◕ ʔ
                _G.MANUAL_BOE_QUERIES[itemID] = GetTime()
                
                -- ʕ ◕ᴥ◕ ʔ✿ Store original link for later use ✿ʕ ◕ᴥ◕ ʔ
                _G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}
                _G.ORIGINAL_ITEM_LINKS[itemID] = link
            end
            
            -- ʕ ◕ᴥ◕ ʔ✿ Set flags to prevent interference ✿ʕ ◕ᴥ◕ ʔ
            _G.MANUAL_TOOLTIP_ACTIVE = true
            _G.MANUAL_PROCESSING_ACTIVE = true
            
            -- ʕ ● ᴥ ●ʔ✿ Use unified UIBOETooltipEnhancement system ✿ʕ ● ᴥ ●ʔ
            if _G.TheJournal_UIBOETooltipEnhancement and _G.TheJournal_UIBOETooltipEnhancement.ProcessBOETooltip then
                _G.TheJournal_UIBOETooltipEnhancement.ProcessBOETooltip(GameTooltip, link)
                print("|cFF87CEEB[Manual BOE]|r Processing BOE tooltip...")
            elseif _G.ProcessBOETooltip then
                -- ʕ ◕ᴥ◕ ʔ✿ Fallback to old system if new one not available ✿ʕ ◕ᴥ◕ ʔ
                _G.ProcessBOETooltip(GameTooltip, link, true) -- true = manual mode
            else
                print("|cFFFF0000[Manual BOE]|r Error: BOE tooltip processing not available")
            end
            
            -- ʕ ◕ᴥ◕ ʔ✿ Clear the flags after a short delay ✿ʕ ◕ᴥ◕ ʔ
            C_Timer.After(0.5, function()
                _G.MANUAL_TOOLTIP_ACTIVE = false
                _G.MANUAL_PROCESSING_ACTIVE = false
            end)
        else
            print("|cFFFFFF00[Manual BOE]|r No item found in tooltip")
        end
    else
        print("|cFFFFFF00[Manual BOE]|r No tooltip visible - hover over an item first")
    end
end

-- ʕ •ᴥ•ʔ✿ Slash command for tooltip testing ✿ʕ•ᴥ•ʔ
SLASH_TESTTOOLTIP1 = "/testtooltip"
SLASH_TESTTOOLTIP2 = "/tt"
SlashCmdList["TESTTOOLTIP"] = TestTooltipItem

print("|cFF87CEEB[Manual BOE]|r Loaded! Use /tt when hovering over item tooltips to test BOE status")

-- ʕ •ᴥ•ʔ✿ Export functions ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIManualBOEClick = {
    WasManuallyQueried = WasManuallyQueried,
    TestTooltipItem = TestTooltipItem
}
