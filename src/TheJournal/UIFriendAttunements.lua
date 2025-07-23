-- ##################################################################
-- # UIFriendAttunements.lua - Simplified Friend Attunement Module
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Simplified Friend Attunement Module ✿ʕ•ᴥ•ʔ

local FriendAttunements = {}

-- ʕ ◕ᴥ◕ ʔ✿ Check if friends need an item for attunement ✿ʕ ◕ᴥ◕ ʔ
function FriendAttunements.GetFriendsWhoNeedItem(itemID)
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

                -- ʕノ•ᴥ•ʔノ✿ Method 1: Check their missing BOE items list ✿ʕノ•ᴥ•ʔノ
                if friendData.missingBOE and #friendData.missingBOE > 0 then
                    for _, missingItemID in ipairs(friendData.missingBOE) do
                        if missingItemID == itemID then
                            needsItem = true
                            break
                        end
                    end
                end

                -- ＼ʕ •ᴥ•ʔ／✿ Method 2: Heuristic based on overall progress ✿＼ʕ •ᴥ•ʔ／
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

-- ʕ •ᴥ•ʔ✿ Initialize friend attunement tracking ✿ʕ •ᴥ•ʔ
function FriendAttunements.Initialize()
    -- ʕ ◕ᴥ◕ ʔ✿ This module is now simplified - main tooltip processing handled by UITooltipEnhancement.lua ✿ʕ ◕ᴥ◕ ʔ
    print("|cFF00FF00[Friend Attunements]|r Initialized (integrated with main tooltip system)")
end

-- ʕ •ᴥ•ʔ✿ Auto-initialize when this module loads ✿ʕ•ᴥ•ʔ
FriendAttunements.Initialize()

-- ʕノ•ᴥ•ʔノ✿ Export global functions for compatibility ✿ʕノ•ᴥ•ʔノ
_G.FriendAttunements = FriendAttunements
_G.GetFriendsWhoNeedItem = FriendAttunements.GetFriendsWhoNeedItem

-- ʕ •ᴥ•ʔ✿ Backward compatibility functions ✿ʕ •ᴥ•ʔ
function FriendAttunements.ProcessBOEItem(itemLink)
    -- ʕ ◕ᴥ◕ ʔ✿ Redirect to main tooltip system ✿ʕ ◕ᴥ◕ ʔ
    if _G.TooltipEnhancement and _G.TooltipEnhancement.ProcessFriendAttunementTooltip then
        local itemID = tonumber(itemLink:match("item:(%d+)"))
        return _G.TooltipEnhancement.GetFriendsWhoNeedItem(itemID)
    end
    return {}
end

function FriendAttunements.ProcessBOETooltip(tooltip, link)
    -- ʕ ◕ᴥ◕ ʔ✿ Redirect to main tooltip system ✿ʕ ◕ᴥ◕ ʔ
    if _G.TooltipEnhancement and _G.TooltipEnhancement.ProcessFriendAttunementTooltip then
        return _G.TooltipEnhancement.ProcessFriendAttunementTooltip(tooltip, link)
    end
end

function FriendAttunements.EnhanceTooltipWithFriendStatus(tooltip)
    -- ʕ ● ᴥ ●ʔ✿ This function is now handled by secure hooks in main tooltip system ✿ʕ ● ᴥ ●ʔ
    local name, link = tooltip:GetItem()
    if link then
        FriendAttunements.ProcessBOETooltip(tooltip, link)
    end
end

-- ʕ •ᴥ•ʔ✿ Module loaded successfully ✿ʕ •ᴥ•ʔ
