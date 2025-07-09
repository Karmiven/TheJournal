-- ##################################################################
-- # UIFriendAttunements.lua - Friend Attunement Tracking and Tooltips
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Friend Attunement Module ✿ʕ•ᴥ•ʔ

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
                                local dungeon = FindDungeonByName(dungeonInfo.name)
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

-- ʕ •ᴥ•ʔ✿ Enhanced ProcessBOETooltip function ✿ʕ •ᴥ•ʔ
function FriendAttunements.ProcessBOETooltip(tooltip, link)
    if not link or not link:match("^item:") then return end
    
    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then return end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Check if any friends need this item for attunement ✿ʕ ◕ᴥ◕ ʔ
    local friendsWhoNeed = FriendAttunements.GetFriendsWhoNeedItem(itemID)
    
    if #friendsWhoNeed > 0 then
        tooltip:AddLine(" ")
        tooltip:AddLine("|cFFFFD700Friend Attunement Status:|r")
        tooltip:AddLine("|cFFFF6600Unattuned: " .. table.concat(friendsWhoNeed, ", ") .. "|r", 1, 1, 1, true)
    end
end

-- ʕ ● ᴥ ●ʔ✿ Enhance tooltip with friend status ✿ʕ ● ᴥ ●ʔ
function FriendAttunements.EnhanceTooltipWithFriendStatus(tooltip)
    local name, link = tooltip:GetItem()
    if link then
        FriendAttunements.ProcessBOETooltip(tooltip, link)
    end
end

-- ʕノ•ᴥ•ʔノ✿ Hook existing ProcessBOETooltip function ✿ʕノ•ᴥ•ʔノ
function FriendAttunements.HookBOETooltip()
    local originalProcessBOETooltip = ProcessBOETooltip
    ProcessBOETooltip = function(tooltip, link)
        -- ＼ʕ •ᴥ•ʔ／✿ Call the original function first ✿＼ʕ •ᴥ•ʔ／
        if originalProcessBOETooltip then
            originalProcessBOETooltip(tooltip, link)
        end
        
        -- ʕ •ᴥ•ʔ✿ Add friend attunement check ✿ʕ •ᴥ•ʔ
        FriendAttunements.ProcessBOETooltip(tooltip, link)
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Hook GameTooltip to show friend status on all item tooltips ✿ʕ ◕ᴥ◕ ʔ
function FriendAttunements.HookGameTooltip()
    local originalGameTooltipShow = GameTooltip.Show
    GameTooltip.Show = function(self)
        FriendAttunements.EnhanceTooltipWithFriendStatus(self)
        return originalGameTooltipShow(self)
    end
end

-- ʕ ● ᴥ ●ʔ✿ Initialize friend attunement tracking ✿ʕ ● ᴥ ●ʔ
function FriendAttunements.Initialize()
    FriendAttunements.HookBOETooltip()
    FriendAttunements.HookGameTooltip()
end

-- ʕノ•ᴥ•ʔノ✿ Export global functions ✿ʕノ•ᴥ•ʔノ
_G.FriendAttunements = FriendAttunements
_G.GetFriendsWhoNeedItem = FriendAttunements.GetFriendsWhoNeedItem

-- ＼ʕ •ᴥ•ʔ／✿ Auto-initialize ✿＼ʕ •ᴥ•ʔ／
FriendAttunements.Initialize()

-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ
