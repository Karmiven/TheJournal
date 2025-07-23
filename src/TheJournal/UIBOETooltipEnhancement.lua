-- ##################################################################
-- # UIBOETooltipEnhancement.lua - Simplified BOE Enhancement
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Simplified BOE Enhancement Module ✿ʕ•ᴥ•ʔ

local UIBOETooltipEnhancement = {}

-- ʕ •ᴥ•ʔ✿ Initialize tracking tables securely ✿ʕ•ᴥ•ʔ
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

if not _G.ORIGINAL_ITEM_LINKS then
    _G.ORIGINAL_ITEM_LINKS = {}
end

-- ʕ •ᴥ•ʔ✿ Cache to prevent duplicate processing ✿ʕ•ᴥ•ʔ
local lastProcessedItem = {
    itemID = nil,
    timestamp = 0,
    processed = false
}

-- ʕ •ᴥ•ʔ✿ Function to get friends who need an item (for compatibility) ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.GetFriendsWhoNeedItem(itemID)
    local friendsWhoNeed = {}

    if not _G.FRIENDS_ATTUNEMENT_DATA or not itemID then
        return friendsWhoNeed
    end

    -- ʕ ● ᴥ ●ʔ✿ Check each friend's attunement status for this item ✿ʕ ● ᴥ ●ʔ
    for playerName, friendData in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        if not friendData.isPlayer then
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            if canAttune == 1 then
                local needsItem = false

                -- ʕ ◕ᴥ◕ ʔ✿ Check missing BOE items ✿ʕ ◕ᴥ◕ ʔ
                if friendData.missingBOE and #friendData.missingBOE > 0 then
                    for _, missingItemID in ipairs(friendData.missingBOE) do
                        if missingItemID == itemID then
                            needsItem = true
                            break
                        end
                    end
                end

                -- ʕ ● ᴥ ●ʔ✿ Check dungeon items for incomplete friends ✿ʕ ● ᴥ ●ʔ
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

-- ʕ •ᴥ•ʔ✿ Clean up old processed data ✿ʕ•ᴥ•ʔ
local function CleanupOldData()
    local currentTime = GetTime()
    local cutoffTime = 300 -- 5 minutes

    -- ʕ ● ᴥ ●ʔ✿ Clean up processed responses ✿ʕ ● ᴥ ●ʔ
    if _G.PROCESSED_BOE_RESPONSES then
        for key, _ in pairs(_G.PROCESSED_BOE_RESPONSES) do
            local timestamp = tonumber(key:match("_(%d+%.?%d*)$"))
            if timestamp and (currentTime - timestamp) > cutoffTime then
                _G.PROCESSED_BOE_RESPONSES[key] = nil
            end
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Initialize BOE tooltip system ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.Initialize()
    -- ʕ ◕ᴥ◕ ʔ✿ This module is now simplified - main tooltip processing handled by UITooltipEnhancement.lua ✿ʕ ◕ᴥ◕ ʔ
    print("|cFF00FF00[BOE Enhancement]|r Initialized (integrated with main tooltip system)")
end

-- ʕ •ᴥ•ʔ✿ Auto-initialize when this module loads ✿ʕ•ᴥ•ʔ
UIBOETooltipEnhancement.Initialize()

-- ʕ •ᴥ•ʔ✿ Schedule cleanup every 5 minutes ✿ʕ•ᴥ•ʔ
if C_Timer and C_Timer.NewTicker then
    local cleanupTimer = C_Timer.NewTicker(300, CleanupOldData)
end

-- ʕ •ᴥ•ʔ✿ Secure slash command hooks ✿ʕ•ᴥ•ʔ
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

-- ʕ •ᴥ•ʔ✿ Global access for compatibility ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIBOETooltipEnhancement = UIBOETooltipEnhancement
_G.GetFriendsWhoNeedItem = UIBOETooltipEnhancement.GetFriendsWhoNeedItem

-- ʕ •ᴥ•ʔ✿ Backward compatibility functions ✿ʕ•ᴥ•ʔ
function UIBOETooltipEnhancement.ProcessBOETooltip(tooltip, link)
    -- ʕ ◕ᴥ◕ ʔ✿ Redirect to main tooltip system ✿ʕ ◕ᴥ◕ ʔ
    if _G.TooltipEnhancement and _G.TooltipEnhancement.ProcessBOETooltip then
        return _G.TooltipEnhancement.ProcessBOETooltip(tooltip, link)
    end
end

function UIBOETooltipEnhancement.EnhanceTooltipWithFriendStatus(tooltip, link)
    -- ʕ ◕ᴥ◕ ʔ✿ Redirect to main tooltip system ✿ʕ ◕ᴥ◕ ʔ
    return UIBOETooltipEnhancement.ProcessBOETooltip(tooltip, link)
end

-- ʕ •ᴥ•ʔ✿ Export for backward compatibility ✿ʕ•ᴥ•ʔ
_G.ProcessBOETooltip = UIBOETooltipEnhancement.ProcessBOETooltip

return UIBOETooltipEnhancement
