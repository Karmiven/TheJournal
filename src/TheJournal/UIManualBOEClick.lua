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

-- ʕ •ᴥ•ʔ✿ Manual BOE test function ✿ʕ•ᴥ•ʔ
local function DoManualBOETest(itemLink)
    if not itemLink then return end

    local itemID = tonumber(itemLink:match("item:(%d+)"))
    if itemID and _G.PerformBOETest then
        print("|cFF87CEEB[Manual BOE]|r Testing " .. (GetItemInfo(itemID) or ("Item " .. itemID)))
        _G.MANUAL_BOE_QUERIES[itemID] = GetTime()
        _G.PerformBOETest(itemID, itemLink, false)

        -- Store original link
        _G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}
        _G.ORIGINAL_ITEM_LINKS[itemID] = itemLink
    end
end

-- ʕ •ᴥ•ʔ✿ Test item from current tooltip ✿ʕ•ᴥ•ʔ
local function TestTooltipItem()
    if GameTooltip:IsVisible() then
        local name, link = GameTooltip:GetItem()
        if link then
            DoManualBOETest(link)
        else
            print("|cFFFFFF00[Manual BOE]|r No item found in tooltip")
        end
    else
        print("|cFFFFFF00[Manual BOE]|r No tooltip visible")
    end
end

-- ʕ •ᴥ•ʔ✿ Slash command for tooltip testing ✿ʕ•ᴥ•ʔ
SLASH_TESTTOOLTIP1 = "/testtooltip"
SLASH_TESTTOOLTIP2 = "/tt"
SlashCmdList["TESTTOOLTIP"] = TestTooltipItem

print("|cFF87CEEB[Manual BOE]|r Loaded! Use /tt when hovering over item tooltips")

-- ʕ •ᴥ•ʔ✿ Export functions ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIManualBOEClick = {
    WasManuallyQueried = WasManuallyQueried,
    TestTooltipItem = TestTooltipItem
}
