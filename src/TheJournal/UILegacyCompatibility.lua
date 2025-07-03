-- ##################################################################
-- # UILegacyCompatibility.lua
-- # ʕ •ᴥ•ʔ✿ Legacy Compatibility Layer ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UILegacyCompatibility = {}

-- ʕ •ᴥ•ʔ✿ Legacy function wrappers ✿ʕ•ᴥ•ʔ

-- ʕ •ᴥ•ʔ✿ Deprecated frame pooling functions ✿ʕ•ᴥ•ʔ
_G.GetItemButton = function()
    if _G.TheJournal_UIPerformance and _G.TheJournal_UIPerformance.GetItemButton then
        return _G.TheJournal_UIPerformance.GetItemButton()
    end
    return CreateFrame("Button", nil, UIParent)
end

_G.ReleaseItemButton = function(button)
    if _G.TheJournal_UIPerformance and _G.TheJournal_UIPerformance.ReleaseItemButton then
        return _G.TheJournal_UIPerformance.ReleaseItemButton(button)
    end
end

_G.ReleaseAllItemButtons = function()
    if _G.TheJournal_UIPerformance and _G.TheJournal_UIPerformance.ReleaseAllItemButtons then
        return _G.TheJournal_UIPerformance.ReleaseAllItemButtons()
    end
end

_G.GetActiveButtonCount = function()
    if _G.TheJournal_UIPerformance and _G.TheJournal_UIPerformance.GetActiveButtonCount then
        return _G.TheJournal_UIPerformance.GetActiveButtonCount()
    end
    return 0
end

-- ʕ •ᴥ•ʔ✿ Legacy cache functions ✿ʕ•ᴥ•ʔ
_G.InvalidateAttunementCache = function()
    if _G.TheJournal_UIPerformance and _G.TheJournal_UIPerformance.InvalidateAttunementCache then
        return _G.TheJournal_UIPerformance.InvalidateAttunementCache()
    end
end

_G.GetCachedAttunementProgress = function(itemID)
    if _G.TheJournal_UIPerformance and _G.TheJournal_UIPerformance.GetCachedAttunementProgress then
        return _G.TheJournal_UIPerformance.GetCachedAttunementProgress(itemID)
    end
    return _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
end

-- ʕ •ᴥ•ʔ✿ Legacy quest system functions ✿ʕ•ᴥ•ʔ
_G.GetRandomUnattunedItem = function()
    if _G.TheJournal_UIQuestManager and _G.TheJournal_UIQuestManager.GetRandomUnattunedItem then
        return _G.TheJournal_UIQuestManager.GetRandomUnattunedItem()
    end
    return nil
end

_G.StartRandomQuest = function()
    if _G.TheJournal_UIQuestManager and _G.TheJournal_UIQuestManager.StartRandomQuest then
        return _G.TheJournal_UIQuestManager.StartRandomQuest()
    end
end

_G.CompleteRandomQuest = function()
    if _G.TheJournal_UIQuestManager and _G.TheJournal_UIQuestManager.CompleteRandomQuest then
        return _G.TheJournal_UIQuestManager.CompleteRandomQuest()
    end
end

_G.UpdateCurrentQuestDisplay = function()
    if _G.TheJournal_UIQuestManager and _G.TheJournal_UIQuestManager.UpdateCurrentQuestDisplay then
        return _G.TheJournal_UIQuestManager.UpdateCurrentQuestDisplay()
    end
end

-- ʕ •ᴥ•ʔ✿ Legacy friends system functions ✿ʕ•ᴥ•ʔ
_G.GetFriendsWhoNeedItem = function(itemID)
    if _G.TheJournal_UIFriends and _G.TheJournal_UIFriends.GetFriendsWhoNeedItem then
        return _G.TheJournal_UIFriends.GetFriendsWhoNeedItem(itemID)
    end
    return {}
end

_G.SaveFriendsData = function()
    if _G.TheJournal_UIDatabaseInterface and _G.TheJournal_UIDatabaseInterface.ForceSave then
        return _G.TheJournal_UIDatabaseInterface.ForceSave()
    elseif _G.TheJournal_UIFriends and _G.TheJournal_UIFriends.SaveFriendsData then
        return _G.TheJournal_UIFriends.SaveFriendsData()
    end
end

-- ʕ •ᴥ•ʔ✿ Legacy UI functions ✿ʕ•ᴥ•ʔ
_G.RefreshAllAttunableText = function()
    if _G.TheJournal_UICore and _G.TheJournal_UICore.RefreshAllAttunableText then
        return _G.TheJournal_UICore.RefreshAllAttunableText()
    end
end

_G.SortDungeonsByAttunement = function()
    if _G.TheJournal_UICore and _G.TheJournal_UICore.SortDungeonsByAttunement then
        return _G.TheJournal_UICore.SortDungeonsByAttunement()
    end
end

_G.FilterDungeonsByCategory = function()
    if _G.TheJournal_UICore and _G.TheJournal_UICore.FilterDungeonsByCategory then
        return _G.TheJournal_UICore.FilterDungeonsByCategory()
    end
end

-- ʕ •ᴥ•ʔ✿ Legacy tooltip functions ✿ʕ•ᴥ•ʔ
_G.ShowFriendTooltip = function(frame, playerName)
    if _G.TheJournal_UITooltipEnhancement and _G.TheJournal_UITooltipEnhancement.ShowFriendTooltip then
        return _G.TheJournal_UITooltipEnhancement.ShowFriendTooltip(frame, playerName)
    end
end

_G.HideFriendTooltip = function()
    if _G.TheJournal_UITooltipEnhancement and _G.TheJournal_UITooltipEnhancement.HideFriendTooltip then
        return _G.TheJournal_UITooltipEnhancement.HideFriendTooltip()
    end
end

-- ʕ •ᴥ•ʔ✿ Legacy configuration functions ✿ʕ•ᴥ•ʔ
_G.GetDJConfig = function(key)
    if _G.TheJournal_UIConfiguration then
        local getter = _G.TheJournal_UIConfiguration["Get" .. key]
        if getter then
            return getter()
        end
    end
    return nil
end

_G.SetDJConfig = function(key, value)
    if _G.TheJournal_UIConfiguration then
        local setter = _G.TheJournal_UIConfiguration["Set" .. key]
        if setter then
            return setter(value)
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Migration status tracking ✿ʕ•ᴥ•ʔ
local migrationStatus = {
    completed = false,
    warnings = {},
    errors = {}
}

function UILegacyCompatibility.GetMigrationStatus()
    return migrationStatus
end

function UILegacyCompatibility.LogMigrationWarning(message)
    table.insert(migrationStatus.warnings, message)
    if _G.DEBUG then
        print("|cFFFFAA00[Migration Warning]|r " .. message)
    end
end

function UILegacyCompatibility.LogMigrationError(message)
    table.insert(migrationStatus.errors, message)
    print("|cFFFF0000[Migration Error]|r " .. message)
end

function UILegacyCompatibility.MarkMigrationComplete()
    migrationStatus.completed = true
    print("|cFF00FF00[Migration]|r UIFrames migration completed successfully!")
end

-- ʕ •ᴥ•ʔ✿ Deprecated function warnings ✿ʕ•ᴥ•ʔ
local function CreateDeprecationWarning(functionName, replacement)
    return function(...)
        UILegacyCompatibility.LogMigrationWarning("Function " .. functionName .. " is deprecated. Use " .. replacement .. " instead.")
        return _G[replacement](...)
    end
end

-- ʕ •ᴥ•ʔ✿ Cleanup function for removing legacy wrappers ✿ʕ•ᴥ•ʔ
function UILegacyCompatibility.CleanupLegacyFunctions()
    local legacyFunctions = {
        "GetItemButton",
        "ReleaseItemButton", 
        "ReleaseAllItemButtons",
        "GetActiveButtonCount",
        "InvalidateAttunementCache",
        "GetCachedAttunementProgress",
        "GetRandomUnattunedItem",
        "StartRandomQuest",
        "CompleteRandomQuest",
        "UpdateCurrentQuestDisplay",
        "GetFriendsWhoNeedItem",
        "SaveFriendsData",
        "RefreshAllAttunableText",
        "SortDungeonsByAttunement",
        "FilterDungeonsByCategory",
        "ShowFriendTooltip",
        "HideFriendTooltip",
        "GetDJConfig",
        "SetDJConfig"
    }
    
    for _, funcName in ipairs(legacyFunctions) do
        _G[funcName] = nil
    end
    
    UILegacyCompatibility.LogMigrationWarning("Legacy function wrappers have been removed.")
end

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UILegacyCompatibility = UILegacyCompatibility

return UILegacyCompatibility
