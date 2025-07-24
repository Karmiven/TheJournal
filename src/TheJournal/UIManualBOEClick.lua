-- ##################################################################
-- # UIManualBOEClick.lua
-- # ʕ •ᴥ•ʔ✿ Simple Manual BOE Click Handler ✿ʕ•ᴥ•ʔ
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Track manually queried items ✿ʕ•ᴥ•ʔ
if not _G.MANUAL_BOE_QUERIES then
    _G.MANUAL_BOE_QUERIES = {}
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
            DoManualBOETest(link)
            
            -- ʕ ◕ᴥ◕ ʔ✿ Force refresh the tooltip to show BOE information ✿ʕ ◕ᴥ◕ ʔ
            local owner = GameTooltip:GetOwner()
            if owner then
                -- ʕ ● ᴥ ●ʔ✿ Re-set tooltip content without showing it yet ✿ʕ ● ᴥ ●ʔ
                GameTooltip:SetOwner(owner, "ANCHOR_NONE")
                GameTooltip:SetHyperlink(link)
                
                -- ʕ ◕ᴥ◕ ʔ✿ Force tooltip enhancement processing immediately ✿ʕ ◕ᴥ◕ ʔ
                if _G.ProcessBOETooltip then
                    _G.ProcessBOETooltip(GameTooltip, link, true) -- true = manual mode
                end
                
                -- ʕ ● ᴥ ●ʔ✿ Also trigger faction tooltip enhancement if available ✿ʕ ● ᴥ ●ʔ
                if _G.FactionTooltipEnhancement and _G.FactionTooltipEnhancement.ProcessFactionTooltip then
                    _G.FactionTooltipEnhancement.ProcessFactionTooltip(GameTooltip, link)
                end
                
                -- ʕ ◕ᴥ◕ ʔ✿ Now show the enhanced tooltip ✿ʕ ◕ᴥ◕ ʔ
                GameTooltip:Show()
            end
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
