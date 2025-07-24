-- ##################################################################
-- # UIFrames.lua - Core UI Frame Management
-- # ʕ •ᴥ•ʔ✿ Modular UI System ✿ʕ•ᴥ•ʔ
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Load required modules ✿ʕ•ᴥ•ʔ
local UIConfiguration = _G.TheJournal_UIConfiguration
local UIEventHandling = _G.TheJournal_UIEventHandling
local UIDatabaseInterface = _G.TheJournal_UIDatabaseInterface
local UILegacyCompatibility = _G.TheJournal_UILegacyCompatibility
local UIPerformance = _G.TheJournal_UIPerformance

-- ʕ •ᴥ•ʔ✿ Initialize all systems ✿ʕ•ᴥ•ʔ
if UIConfiguration then UIConfiguration.Initialize() end
if UIDatabaseInterface then UIDatabaseInterface.Initialize() end
if UIPerformance then UIPerformance.InitializeSmartCache() end

-- ʕ •ᴥ•ʔ✿ Define binding headers ✿ʕ•ᴥ•ʔ
BINDING_HEADER_THEJOURNAL = "The Journal"
BINDING_NAME_TOGGLEJOURNAL = "Toggle Dungeon Journal"

-- ʕ •ᴥ•ʔ✿ Cache frequently used global functions for better performance ✿ʕ•ᴥ•ʔ
local GetTime = GetTime
local GetItemInfo = GetItemInfo
local tonumber = tonumber
local pairs = pairs
local ipairs = ipairs
local table_insert = table.insert
local table_remove = table.remove
local string_match = string.match
local string_find = string.find

local AffixTooltip = CreateFrame("GameTooltip", "DJ_AffixTooltip", UIParent, "GameTooltipTemplate")

-- ʕ •ᴥ•ʔ✿ Dungeon Management System - Initialize after core UI is created
local UIDungeonManagement = nil

-- Local fallback functions until module is loaded
local function GetCurrentDungeon()
    return _G.currentDungeon
end

local function GetCurrentCategory()
    return "WOTLK" -- Default fallback
end

local function UpdateDungeonCache(dungeonName)
    -- Fallback implementation
end

local function GetCachedDropRate(itemId, dungeonName)
    -- Use the existing UIPerformance module reference
    if UIPerformance and UIPerformance.GetCachedDropRate then
        return UIPerformance.GetCachedDropRate(itemId, dungeonName)
    end

    -- Fallback to global function if module not available
    if _G.GetCachedDropRate and _G.GetCachedDropRate ~= GetCachedDropRate then
        return _G.GetCachedDropRate(itemId, dungeonName)
    end

    return 0 -- Default fallback
end

local function QueueDropRateUpdate(itemID, dungeonName)
    -- Fallback implementation
end

local function ClearDungeonDropRateCache(dungeonName)
    -- Fallback implementation
end

-- ʕ •ᴥ•ʔ✿ Initialize All Systems via UIInitializationManager ✿ʕ•ᴥ•ʔ
local UIInitializationManager = _G.TheJournal_UIInitializationManager
if UIInitializationManager then
    local initResults = UIInitializationManager.InitializeAll()
end

-- ʕ •ᴥ•ʔ✿ Import Module References ✿ʕ•ᴥ•ʔ
local function GetUILayoutManager()
    return _G.TheJournal_UILayoutManager
end

local function GetUIQuestManager()
    return _G.TheJournal_UIQuestManager
end

local function GetUIFriendsAttunement()
    return _G.TheJournal_UIFriendsAttunement
end

-- Add debug flag
local DEBUG = false

-- ʕ •ᴥ•ʔ✿ UI Cache System ✿ʕ•ᴥ•ʔ
local uiCache = {
    bossFrames = {},
    dungeonAttunement = {},
    dungeonAttunementLastUpdate = {},
    currentDungeon = nil,
    currentCategory = nil,
    lastDungeonUpdate = 0
}

-- Set up weak references for memory management
setmetatable(uiCache.bossFrames, {__mode = "v"})
setmetatable(uiCache.dungeonAttunement, {__mode = "v"})
setmetatable(uiCache.dungeonAttunementLastUpdate, {__mode = "v"})

-- ʕ •ᴥ•ʔ✿ Smart Cache System ✿ʕ•ᴥ•ʔ
local smartCache = {
    attunement = {}, -- itemID -> progress
    forge = {},      -- itemID -> forgeLevel
    lastUpdate = 0,  -- timestamp of last cache update
    processing = false, -- flag to prevent concurrent processing
    updateQueue = {} -- queue of items to update
}

-- Initialize smart cache from saved variables if available
if Journal_charDB and Journal_charDB.smartCache then
    smartCache.attunement = Journal_charDB.smartCache.attunement or {}
    smartCache.forge = Journal_charDB.smartCache.forge or {}
    smartCache.lastUpdate = Journal_charDB.smartCache.lastUpdate or 0
end

-- ʕ •ᴥ•ʔ✿ Drop Rate Cache ✿ʕ•ᴥ•ʔ
local dropRateCache = {}

-- Function to print debug messages (optimized empty function for performance)
local function DebugPrint() end
--[[
-- Add ourselves to the leaderboard on initial load
C_Timer.After(1, function()
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
        local playerName = UnitName("player")
        if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
            _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
            -- Also add our journal points
            if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
                _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
            end
            if Journal_charDB then
                SaveFriendsData()
            end
        end
    end
end)
--]]

-- Function to queue drop rate updates
local function QueueDropRateUpdate(itemID, dungeonName)
    local cacheKey = dungeonName .. "_" .. itemID
    if dropRateCache[cacheKey] == nil then
        C_Timer.After(0.1, function()
            GetCachedDropRate(itemID, dungeonName)
        end)
    end
end

-- Function to clear drop rate cache for a specific dungeon (call when switching dungeons)
local function ClearDungeonDropRateCache(dungeonName)
    if not dungeonName then return end

    -- Cache the search pattern to avoid repeated string concatenation
    local searchPattern = dungeonName .. "_"
    local keysToRemove = {}

    -- Collect keys to remove first, then remove them
    for cacheKey, _ in pairs(dropRateCache) do
        if cacheKey:find(searchPattern, 1, true) == 1 then
            keysToRemove[#keysToRemove + 1] = cacheKey
        end
    end

    -- Remove collected keys
    for i = 1, #keysToRemove do
        dropRateCache[keysToRemove[i]] = nil
    end
end

-- Smart cache functions
local function GetCachedAttunement(itemID)
    return smartCache.attunement[itemID]
end

local function GetCachedForge(itemID)
    return smartCache.forge[itemID]
end

local function SetCachedAttunement(itemID, progress)
    smartCache.attunement[itemID] = progress
end

local function SetCachedForge(itemID, forgeLevel)
    smartCache.forge[itemID] = forgeLevel
end

-- Background processing function to update cache in batches
local function ProcessCacheUpdates()
    if smartCache.processing or #smartCache.updateQueue == 0 then
        return
    end

    smartCache.processing = true
    local batchSize = 3 -- Reduced from 5 to 3 for better frame rate
    local processed = 0
    local queueLength = #smartCache.updateQueue

    -- Cache global function references locally
    local GetItemAttuneProgress = _G.GetItemAttuneProgress
    local GetItemAttuneForge = _G.GetItemAttuneForge

    while processed < batchSize and queueLength > 0 do
        local itemID = table_remove(smartCache.updateQueue, 1)
        queueLength = queueLength - 1

        -- Only update if not already cached
        if smartCache.attunement[itemID] == nil then
            local progress = GetItemAttuneProgress and GetItemAttuneProgress(itemID) or 0
            SetCachedAttunement(itemID, progress)

            -- Only get forge level if attuned
            if progress >= 100 and smartCache.forge[itemID] == nil then
                local forgeLevel = GetItemAttuneForge and GetItemAttuneForge(itemID) or 0
                SetCachedForge(itemID, forgeLevel)
            end
        end

        processed = processed + 1
    end

    smartCache.processing = false

    -- Continue processing if there are more items
    if queueLength > 0 then
        C_Timer.After(0.15, ProcessCacheUpdates) -- Slightly increased delay
    else
        -- Save cache when processing is complete
        SaveSmartCache()
    end
end

-- Function to queue items for cache updates
local function QueueCacheUpdate(itemID)
    if not smartCache.attunement[itemID] then
        table.insert(smartCache.updateQueue, itemID)
        -- Start processing if not already running
        if not smartCache.processing and #smartCache.updateQueue == 1 then
            C_Timer.After(0.1, ProcessCacheUpdates)
        end
    end
end

-- Function to save cache to saved variables
local function SaveSmartCache()
    Journal_charDB.smartCache = {
        attunement = smartCache.attunement,
        forge = smartCache.forge,
        lastUpdate = GetTime()
    }
end

-- Optimized frame creation functions
local function CreateBossFrame(boss)
    if not boss or not boss.bossID then return nil end

    -- Check if frame already exists in cache
    if uiCache.bossFrames[boss.bossID] then
        return uiCache.bossFrames[boss.bossID]
    end

    local frame = CreateFrame("Frame", nil, UIParent)
    frame.bossID = boss.bossID
    frame.name = boss.name
    frame.loot = boss.loot or {}

    -- Cache the frame
    uiCache.bossFrames[boss.bossID] = frame

    -- Pre-cache drop rates for boss loot
    for _, item in ipairs(frame.loot) do
        if item.itemID then
            QueueDropRateUpdate(item.itemID, uiCache.currentDungeon)
        end
    end

    return frame
end

-- ʕ •ᴥ•ʔ✿ OnDungeonChanged will be set later when module is loaded ✿ʕ•ᴥ•ʔ


-- Function to invalidate cache for a specific item (call when item is attuned)
local function InvalidateItemCache(itemID)
    smartCache.attunement[itemID] = nil
    smartCache.forge[itemID] = nil
end

-- Custom tooltip positioning function - using consistent ANCHOR_RIGHT positioning
local function GameTooltip_SetDefaultAnchor(tooltip, parent)
    tooltip:SetOwner(parent, "ANCHOR_RIGHT")
    tooltip.default = 1
end

-- Bounty system configuration
local BOUNTY_ICON = {
    SIZE = 16,
    TEXTURE = 'Interface/MoneyFrame/UI-GoldIcon',
}

-- Helper function to extract item ID from item link
local function GetItemIDFromLink(itemLink)
    if not itemLink then return nil end
    local itemID = string.match(itemLink, "item:(%d+)")
    return tonumber(itemID)
end

-- Check if an item is bountied
local function IsItemBountied(itemId)
    if not itemId or not _G.GetCustomGameData then
        return false
    end

    local bountiedValue = _G.GetCustomGameData(31, itemId)
    -- ʕ •ᴥ•ʔ✿ Only print debug for bounties that are found ✿ʕ •ᴥ•ʔ
    if (bountiedValue or 0) > 0 then
        print(string.format("UIFrames: Found bounty - ItemID=%s, BountiedValue=%s", tostring(itemId), tostring(bountiedValue)))
    end
    return (bountiedValue or 0) > 0
end

-- Set bounty icon on a frame, positioned relative to an icon
local function SetFrameBounty(frame, itemLink, iconFrame)
    -- ʕ •ᴥ•ʔ✿ Only run bounty system when journal is open ✿ʕ •ᴥ•ʔ
    if not DungeonJournalFrame or not DungeonJournalFrame:IsShown() then
        return
    end

    -- ʕ •ᴥ•ʔ✿ Validate inputs ✿ʕ •ᴥ•ʔ
    if not frame or not itemLink then
        return
    end

    local bountyFrameName = (frame:GetName() or "UnnamedFrame") .. '_Bounty'
    local bountyFrame = _G[bountyFrameName]
    local itemId = GetItemIDFromLink(itemLink)

    if not itemId then
        return
    end

    local isBountied = IsItemBountied(itemId)

    if itemId and isBountied then
        if not bountyFrame then
            bountyFrame = CreateFrame('Frame', bountyFrameName, frame)
            bountyFrame:SetWidth(BOUNTY_ICON.SIZE)
            bountyFrame:SetHeight(BOUNTY_ICON.SIZE)
            bountyFrame:SetFrameLevel((frame:GetFrameLevel() or 0) + 1)
            bountyFrame.texture = bountyFrame:CreateTexture(nil, 'OVERLAY')
            bountyFrame.texture:SetAllPoints()
            bountyFrame.texture:SetTexture(BOUNTY_ICON.TEXTURE)
            print("UIFrames: Created bounty icon for itemID", itemId)
        end
        bountyFrame:SetParent(frame)
        -- Position relative to the icon frame instead of the button frame
        local targetFrame = iconFrame or frame
        bountyFrame:SetPoint('TOPRIGHT', targetFrame, 'TOPRIGHT', -2, -2)
        bountyFrame:Show()
        print("UIFrames: Showing bounty icon for itemID", itemId)
    elseif bountyFrame then
        bountyFrame:Hide()
    end
end

-- Custom affix names for each dungeon
local DUNGEON_AFFIX_NAMES = {
    ["Hellfire Ramparts"] = "Scorched Earth",
    ["The Blood Furnace"] = "Shadow Dancer",
    ["Shattered Halls"] = "Blood Frenzy",
    ["The Mechanar"] = "Lightning Rod",
    ["The Botanica"] = "Thorn in Your Side",
    ["The Arcatraz"] = "Stay Close",
    ["Mana-Tombs"] = "Mana Burn",
    ["Sethekk Halls"] = "Cursed Luck",
    ["Shadow Labyrinth"] = "What Goes Around",
    ["Auchenai Crypts"] = "Healing Touch",
    ["The Slave Pens"] = "Chained Up",
    ["The Steamvault"] = "Pressure Cooker",
    ["The Underbog"] = "Contagion",
    ["Old Hillsbrad Foothills"] = "Temporal Flux",
    ["The Black Morass"] = "Escalation",
    ["Magisters' Terrace"] = "Speed Demon",
    ["The Culling of Stratholme"] = "Zombie Bomber",
    ["The Nexus"] = "High Risk High Reward",
    ["The Oculus"] = "Frozen Flight",
    ["Utgarde Keep"] = "Phoenix Rising",
    ["Utgarde Pinnacle"] = "Elemental Ward",
    ["Gundrak"] = "House Rules",
    ["Drak'Tharon Keep"] = "Shadow Links",
    ["Halls of Lightning"] = "Static Shock",
    ["Halls of Stone"] = "Stand Your Ground",
    ["Azjol-Nerub"] = "Sticky Situation",
    ["Ahn'kahet: The Old Kingdom"] = "Mind Games",
    ["Violet Hold"] = "Double Trouble",
    ["The Forge of Souls"] = "Spirit Guide",
    ["Pit of Saron"] = "Ice Ice Baby",
    ["Halls of Reflection"] = "Phantom Menace",
    ["Trial of the Champion"] = "Battle Scars"
}

-- Custom affix dataset for dungeons
-- Thank you so much Anthaney <3 for the affixes writeup!
local DUNGEON_AFFIXES = {
    ["Hellfire Ramparts"] = "Burning ground. |cFFFF6600Felfire|r - Stacking |cFFFF4500fire damage|r when standing in it.",
    ["The Blood Furnace"] = "Shadow Pools. |cFF9966CCPool of Shadow|r - Taking |cFF9966CCshadow damage|r when standing in it. Also |cFF00FF00increasing damage done|r.",
    ["Shattered Halls"] = "Killing an enemy grants you |cFFFF6600Enrage|r - |cFFFFFF00100%|r more |cFFFF4500damage taken|r and |cFF00FF00dealt|r.",
    ["The Mechanar"] = "Killing an enemy shoots |cFF66CCFFchain lightning|r at you.",
    ["The Botanica"] = "Enemies have |cFFFF6600thorns|r. Occurs every |cFFFFFF003|r seconds.",
    ["The Arcatraz"] = "|cFF66CCFFPower Core|r will be placed doing |cFF00FF00nature damage|r. Moving out of range of it |cFFFF4500increases|r it's damage dealt to you.",
    ["Mana-Tombs"] = "Being in combat gives |cFF9966CCMana Poisoning|r - |cFFFF4500Reduced health and mana|r until you kill a boss.",
    ["Sethekk Halls"] = "You get a |cFF9966CCrandom curse|r every |cFFFFFF0030|r seconds. Random curses could be anything.",
    ["Shadow Labyrinth"] = "|cFFFFFF0050%|r of the damage dealt to an enemy is |cFFFF4500reflect|r to you as a dot called |cFF9966CCShadow Wound|r.",
    ["Auchenai Crypts"] = "Overtime you will get |cFF9966CCSoul Sickness|r. You deal |cFFFFFF005%|r |cFFFF4500reduce damage|r per stack. |cFF00FF00Healing|r reduces the stacks.",
    ["The Slave Pens"] = "Entering Combat |cFF9966CCchains|r you. |cFFFF4500Immobalizing|r you for |cFFFFFF006|r seconds.",
    ["The Steamvault"] = "Every |cFFFFFF0060|r seconds you will get |cFFFF6600Steam overload|r. When expires, take |cFFFF4500fire damage|r and get |cFFFF4500knocked up|r.",
    ["The Underbog"] = "When in combat you will get |cFF9966CCSpore Disease|r. |cFF00FF00Nature dot|r that may |cFFFF4500spread|r to allies.",
    ["Old Hillsbrad Foothills"] = "You have a debuff called |cFF66CCFFFlow of time|r. Standing still |cFFFF4500reduces stacks|r causing at |cFFFFFF00zero|r to |cFFFF4500stun|r you. Moving |cFF00FF00increases stacks|r causing at |cFFFFFF00100|r to |cFFFF4500reduce attack speed|r by |cFFFFFF0070%|r.",
    ["The Black Morass"] = "In combat take |cFFFFFF001%|r |cFFFF4500increased damage|r every |cFFFFFF003|r seconds. Out of combat |cFF00FF00remove stacks|r every |cFFFFFF002|r seconds.",
    ["Magisters' Terrace"] = "You have |cFFFFFF00100%|r |cFF00FF00increase casting speed|r. But every cast gives you |cFF9966CCMagical Backlash|r causing a |cFFFF4500stacking debuff|r that when expires you take |cFF66CCFFarcane damage|r.",
    ["The Culling of Stratholme"] = "|cFFFF4500Exploding zombie|r chases you. When it explodes it deals |cFFFF4500massive shadow damage|r.",
    ["The Nexus"] = "Being close to the |cFF66CCFFAnomaly boss|r gives you a |cFFFF4500stacking debuff|r. |cFF00FF00Increases magic done|r and |cFFFF4500taken|r by up to |cFFFFFF00100%|r.",
    ["The Oculus"] = "Giving you the ability to |cFF66CCFFfly|r. Sort of like Priest levitate mobility perk but you take |cFF66CCFFfrost damage|r everytime you're in the air.",
    ["Utgarde Keep"] = "When enemies fall below |cFFFFFF0050%|r, they |cFF00FF00heal back to full|r. |cFF00FF00Healing Reduction|r talents/spells work on it.",
    ["Utgarde Pinnacle"] = "Enemies have |cFFFFFF007|r |cFF66CCFFblessings|r. One for each element and physical. Doing one of those elements |cFF00FF00removes the buff|r making them |cFFFF4500take more damage|r.",
    ["Gundrak"] = "There is |cFFFFFF004|r different debuffs for each area. |cFF9966CCSladran room|r is |cFF00FF00poison damage|r. |cFF9966CCDrakkari Colossus room|r is |cFFFF4500reduce health|r. |cFF9966CCMoorabi room|r is |cFFFF4500reduce attack speed|r. |cFF9966CCGaldarah room|r is |cFFFFFF0050%|r |cFFFF4500damage taken|r every |cFFFFFF008|r seconds.",
    ["Drak'Tharon Keep"] = "Each enemy thats killed drop a |cFF9966CCshadow orb|r on the ground. When |cFFFFFF002|r or more are active it |cFF66CCFFlinks|r. Walking in between the link does |cFF9966CCshadow damage|r.",
    ["Halls of Lightning"] = "Moving in combat deals |cFF66CCFFlightning damage|r to you.",
    ["Halls of Stone"] = "Standing still gives you |cFF9966CCStoneform|r in combat. |cFF00FF00Stacking buff|r that |cFF00FF00increases damage you do|r and |cFF00FF00reduces damage you take|r.",
    ["Azjol-Nerub"] = "In combat if you move you will get |cFF9966CCSticky Webs|r. Giving you |cFFFF4500reduce movement speed|r. Stacking up to |cFFFFFF005|r.",
    ["Ahn'kahet: The Old Kingdom"] = "In combat you will be given a |cFF66CCFFrandom prompt|r. It will either be an emote or an ability you have. Doing said ability gives you |cFF9966CCInsanity|r. |cFF00FF00Increase damage dealt|r and |cFFFF4500taken|r stacking up to |cFFFFFF00100|r. Failing a prompt |cFF00FF00reduces your stacks|r by |cFFFFFF0010|r.",
    ["Violet Hold"] = "Instead of fighting |cFFFFFF001|r boss at wave |cFFFFFF006|r and |cFFFFFF0012|r, you instead fight |cFFFFFF002|r.",
    ["The Forge of Souls"] = "In combat |cFF9966CCVile Spirits|r will attack you. Causing |cFF66CCFFarcane damage|r if not |cFF00FF00moved away|r from them.",
    ["Pit of Saron"] = "In combat |cFF66CCFFIcicles|r fall from the sky. Dealing |cFF66CCFFfrost damage|r and |cFFFF4500knocking you back|r. Same mechanic as the gauntlet when heading towards Tyrannus.",
    ["Halls of Reflection"] = "In combat a |cFF9966CCghost|r will follow you. Getting hit by the ghost |cFFFF4500blows it up|r and you take |cFF9966CCshadow damage|r.",
    ["Trial of the Champion"] = "After every boss is defeated, get a |cFFFF4500stacking bleed debuff|r."
}

local tempschedule = {}

local DungeonJournalFrame = CreateFrame("Frame", "DungeonJournalFrame", UIParent)
DungeonJournalFrame:SetSize(585, 430)
DungeonJournalFrame:SetPoint("CENTER")
DungeonJournalFrame:SetClampedToScreen(true)
DungeonJournalFrame:EnableMouse(true)
DungeonJournalFrame:SetMovable(true)
DungeonJournalFrame:SetFrameStrata("FULLSCREEN") -- Ensure frame appears above other addons

DungeonJournalFrame:RegisterForDrag("LeftButton", "RightButton")
DungeonJournalFrame:SetScript("OnDragStart", function(self, button)
    if button == "LeftButton" or button == "RightButton" then
        self:StartMoving()
    end
end)
DungeonJournalFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

DungeonJournalFrame.BackgroundTexture = DungeonJournalFrame:CreateTexture(nil, "BACKGROUND")
DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_base.blp")
DungeonJournalFrame.BackgroundTexture:SetTexCoord(0, 0.751, 0, 0.589)
DungeonJournalFrame.BackgroundTexture:SetAllPoints(DungeonJournalFrame)
DungeonJournalFrame:Hide()

-- ʕ •ᴥ•ʔ✿ Apply saved UI scale ✿ʕ•ᴥ•ʔ
local savedScale = Journal_charDB.uiScale or 100
if savedScale ~= 100 then
    local scaleFactor = savedScale / 100
    DungeonJournalFrame:SetScale(scaleFactor)
end

local mainCloseButton = CreateFrame("Button", nil, DungeonJournalFrame, "UIPanelCloseButton")
mainCloseButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", 4, -4)
mainCloseButton:SetSize(25, 25)

_G.itemButtonCache              = _G.itemButtonCache or {}
-- Make global item button cache weak to allow garbage collection
if not getmetatable(_G.itemButtonCache) then
    setmetatable(_G.itemButtonCache, {__mode = "v"})
end
_G.lastBossNavDungeon           = _G.lastBossNavDungeon or nil
_G.currentDungeon               = _G.currentDungeon or nil

local dungeonData               = _G.Journal and _G.Journal.djDungeons or {}

Journal_charDB.viewAllItems        = Journal_charDB.viewAllItems or false
Journal_charDB.currentItemPage     = Journal_charDB.currentItemPage or 1
Journal_charDB.currentVersionIndex = Journal_charDB.currentVersionIndex or 1
Journal_charDB.itemSearchQuery     = Journal_charDB.itemSearchQuery or ""

-- Initialize DJ_Settings if not already done
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false, filterType = "All" }

DJ_Settings.filterType          = DJ_Settings.filterType or "All"
DJ_Settings.onlyEquipable       = DJ_Settings.onlyEquipable or false
DJ_Settings.attuneFilter        = DJ_Settings.attuneFilter or "All"

local searchTooltip             = CreateFrame("GameTooltip", "DJ_ItemSearchTooltip", nil, "GameTooltipTemplate")
searchTooltip:SetOwner(UIParent, "ANCHOR_NONE")

local MAX_ITEMS_PER_PAGE = 16
local NUM_COLS           = 2
local displayedItems     = {}
local totalPages         = 1

-- Add cache for prepared items to avoid re-sorting on every page navigation
local preparedItemsCache = {}
-- Make prepared items cache weak to allow garbage collection of old entries
setmetatable(preparedItemsCache, {__mode = "v"})
local lastCacheKey = nil

-- Forward declaration for functions used before they're defined
local DisplayItemsList

-- Function to generate cache key based on current filter settings
local function GetCacheKey(dungeon)
    if not dungeon or not dungeon.name then return nil end

    local filterIcon = DJ_Settings.filterType or "All"
    local onlyEquipable = DJ_Settings.onlyEquipable and "equip" or "all"
    local searchQuery = (Journal_charDB.itemSearchQuery or ""):lower()
    local favorites = {}

    -- Create a stable favorites key by sorting favorite IDs
    if Journal_charDB.favorites then
        for itemID, _ in pairs(Journal_charDB.favorites) do
            table.insert(favorites, itemID)
        end
        table.sort(favorites)
    end
    local favoritesKey = table.concat(favorites, ",")

    -- Include item filters if they exist
    local filtersKey = ""
    if Journal_charDB.itemFilters then
        local filters = Journal_charDB.itemFilters
        filtersKey = string.format("%s_%d_%s_%s_%s",
            filters.searchType or "items",
            filters.maxSources or 0,
            tostring(filters.showRareDrops),
            tostring(filters.showCommonDrops),
            filters.mythicFilter or "all"
        )
    end

    return string.format("%s_%s_%s_%s_%s_%s",
        dungeon.name, filterIcon, onlyEquipable, searchQuery, favoritesKey, filtersKey)
end

-- Function to invalidate dungeon attunement cache
local function InvalidateDungeonAttunementCache(dungeonName)
    if dungeonName then
        -- Clear cache for specific dungeon (both old and new cache keys)
        uiCache.dungeonAttunement[dungeonName] = nil
        uiCache.dungeonAttunementLastUpdate[dungeonName] = nil

        -- ʕ •ᴥ•ʔ✿ Clear multi-difficulty cache for this dungeon ✿ʕ•ᴥ•ʔ
        local multiDiffKey = dungeonName .. "_all_difficulties"
        uiCache.dungeonAttunement[multiDiffKey] = nil
        uiCache.dungeonAttunementLastUpdate[multiDiffKey] = nil
    else
        -- Clear entire cache
        uiCache.dungeonAttunement = {}
        uiCache.dungeonAttunementLastUpdate = {}
        -- Recreate weak references
        setmetatable(uiCache.dungeonAttunement, {__mode = "v"})
        setmetatable(uiCache.dungeonAttunementLastUpdate, {__mode = "v"})
    end
end

-- Function to invalidate cache when settings change
local function InvalidateItemsCache(dungeonName)
    if dungeonName then
        -- Clear cache for specific dungeon
        for key, _ in pairs(preparedItemsCache) do
            if key:match("^" .. dungeonName .. "_") then
                preparedItemsCache[key] = nil
            end
        end
        -- Also invalidate dungeon attunement cache for this dungeon
        InvalidateDungeonAttunementCache(dungeonName)
    else
        -- Clear entire cache
        preparedItemsCache = {}
        -- Also invalidate all dungeon attunement cache
        InvalidateDungeonAttunementCache()
    end
    lastCacheKey = nil
end

-- Function to clear old cache entries (keep last 5 dungeons with multiple filter combinations)
local function CleanupItemsCache()
    local cacheCount = 0
    local cacheEntries = {}

    -- Collect all cache entries with their keys
    for key, value in pairs(preparedItemsCache) do
        cacheCount = cacheCount + 1
        table.insert(cacheEntries, {key = key, value = value, dungeonName = key:match("^([^_]+)")})
    end

    -- Only cleanup if we have more than 15 entries (5 dungeons * ~3 filter combinations each)
    if cacheCount > 15 then
        -- Sort by dungeon name to group entries together
        table.sort(cacheEntries, function(a, b)
            if a.dungeonName == b.dungeonName then
                return a.key < b.key -- Sort by full key within same dungeon
            end
            return a.dungeonName < b.dungeonName
        end)

        -- Keep only the last 5 unique dungeons
        local dungeonsSeen = {}
        local dungeonCount = 0
        local keepEntries = {}

        -- Process from end to keep most recent dungeons
        for i = #cacheEntries, 1, -1 do
            local entry = cacheEntries[i]
            if not dungeonsSeen[entry.dungeonName] then
                dungeonsSeen[entry.dungeonName] = true
                dungeonCount = dungeonCount + 1
            end

            if dungeonCount <= 5 then
                table.insert(keepEntries, entry)
            end
        end

        -- Rebuild cache with only entries we want to keep
        preparedItemsCache = {}
        for _, entry in ipairs(keepEntries) do
            preparedItemsCache[entry.key] = entry.value
        end

        -- Update weak reference
        setmetatable(preparedItemsCache, {__mode = "v"})
    end
end

-- Removed toggleEquippableButton - no longer needed with attunement system

local filterTypeButton = CreateFrame("Button", nil, DungeonJournalFrame)
filterTypeButton:SetSize(24, 24)
filterTypeButton:SetPoint("RIGHT", mainCloseButton, "LEFT", 5, -25)
filterTypeButton:SetFrameStrata("FULLSCREEN")
filterTypeButton:SetFrameLevel((DungeonJournalFrame:GetFrameLevel() or 0) + 20)

-- ʕ •ᴥ•ʔ✿ Mark as journal UI element for tooltip forcer identification ✿ʕ•ᴥ•ʔ
filterTypeButton.isJournalUIElement = true

-- ʕ •ᴥ•ʔ✿ Filter tooltip handling delegated to UILayoutManager ✿ʕ•ᴥ•ʔ

filterTypeButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self)
    GameTooltip:ClearLines()
    GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
    GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
    GameTooltip:Show()
end)


filterTypeButton:SetScript("OnLeave", function(self)
    -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only hide tooltip if it belongs to this button ✿ʕ•ᴥ•ʔ
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
        GameTooltip:Hide()
    end
end)

-- Show/hide functions will be defined after all buttons are created

local previewFrame = CreateFrame("Frame", "DungeonJournalPreviewFrame", DungeonJournalFrame)
previewFrame:SetSize(585, 430)
previewFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
previewFrame:Show()

-- ʕ •ᴥ•ʔ✿ Expose previewFrame globally for other modules ✿ʕ•ᴥ•ʔ
_G.previewFrame = previewFrame

local titleText = previewFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", previewFrame, "TOP", 0, 0)
titleText:SetText("Adventurer's Journal")

local scrollFrame = CreateFrame("ScrollFrame", "DungeonGridScrollFrame", previewFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetSize(585, math.floor(430 * 0.82))
scrollFrame:SetPoint("TOP", titleText, "BOTTOM", 20, -38)

-- Custom sleek scrollbar styling
local scrollBar = _G[scrollFrame:GetName() .. "ScrollBar"]
if scrollBar then
    scrollBar:SetWidth(8)
    scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -70, 0)
    scrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -70, 0)

    -- Create custom white 8x8 texture for the scrollbar track (WotLK 3.3.5a compatible)
    local trackTexture = scrollBar:CreateTexture(nil, "BACKGROUND")
    trackTexture:SetAllPoints(scrollBar)
    trackTexture:SetTexture("Interface\\Buttons\\WHITE8X8") -- Use built-in white texture
    trackTexture:SetVertexColor(1, 1, 1, 0.3) -- White with 30% opacity

    -- Style the thumb (draggable part) with red color
    local thumb = _G[scrollFrame:GetName() .. "ScrollBarThumbTexture"]
    if thumb then
        thumb:SetTexture("Interface\\Buttons\\WHITE8X8") -- Use built-in white texture
        thumb:SetVertexColor(0.8, 0.2, 0.2, 0.9) -- Red color (204, 51, 51) with 90% opacity
        thumb:SetSize(8, 20) -- Make thumb more sleek
    end

    -- Hide the default up/down buttons for cleaner look
    local upButton = _G[scrollFrame:GetName() .. "ScrollBarScrollUpButton"]
    local downButton = _G[scrollFrame:GetName() .. "ScrollBarScrollDownButton"]
    if upButton then upButton:Hide() end
    if downButton then downButton:Hide() end

    -- Adjust thumb position since we hid the buttons
    if thumb then
        thumb:ClearAllPoints()
        thumb:SetPoint("TOP", scrollBar, "TOP", 0, 0)
    end
end

local gridContainer       = CreateFrame("Frame", "DungeonGridContainer", scrollFrame)
local numDungeonCols      = 3
local dungeonButtonWidth  = 180
local dungeonButtonHeight = 90
gridContainer:SetSize(numDungeonCols * dungeonButtonWidth, 1)
scrollFrame:SetScrollChild(gridContainer)

dungeonDetailFrame = CreateFrame("Frame", "DungeonDetailFrame", DungeonJournalFrame)
dungeonDetailFrame:SetSize(456, 336)
dungeonDetailFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
dungeonDetailFrame:SetFrameStrata("FULLSCREEN") -- Ensure detail frame appears above other addons
dungeonDetailFrame:Hide()

local dungeonTitleText = dungeonDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
dungeonTitleText:SetPoint("TOP", dungeonDetailFrame, "TOP", 0, 1)

local dungeonDescScrollFrame = CreateFrame("ScrollFrame", "DungeonDescScrollFrame", dungeonDetailFrame,
    "UIPanelScrollFrameTemplate")
dungeonDescScrollFrame:SetSize(192, 240)
dungeonDescScrollFrame:SetPoint("TOPLEFT", dungeonDetailFrame, "TOPLEFT", 10, -40)
dungeonDescScrollFrame:EnableMouseWheel(true)
dungeonDescScrollFrame:SetScript("OnMouseWheel", function(self, delta)
    local cur = self:GetVerticalScroll()
    local new = cur - delta * 20
    if new < 0 then new = 0 end
    local maxScroll = self:GetVerticalScrollRange() or 0
    if new > maxScroll then new = maxScroll end
    self:SetVerticalScroll(new)
end)
local descScrollBar = _G["DungeonDescScrollFrameScrollBar"]
if descScrollBar then
    descScrollBar:Hide()
    descScrollBar.Show = function() end
end

-- Debug: Check if dungeonDetailFrame exists before creating itemsListFrame
if not dungeonDetailFrame then
    error("dungeonDetailFrame is nil when trying to create itemsListFrame")
    return
end

local itemsListFrame = CreateFrame("Frame", "DungeonItemsListFrame", dungeonDetailFrame)
if not itemsListFrame then
    error("Failed to create itemsListFrame - CreateFrame returned nil")
    return
end
itemsListFrame:SetSize(400, 340)
itemsListFrame:SetPoint("TOPRIGHT", dungeonDetailFrame, "TOPRIGHT", 90, -60)

-- Debug: Check if parent frame exists
if not itemsListFrame then
    error("itemsListFrame is nil when trying to create itemsListContainer")
    return
end

-- Check if frame already exists and remove it
if _G["ItemsListContainer"] then
    _G["ItemsListContainer"]:Hide()
    _G["ItemsListContainer"] = nil
end

local itemsListContainer = CreateFrame("Frame", "ItemsListContainer", itemsListFrame)
if not itemsListContainer then
    error("Failed to create itemsListContainer - CreateFrame returned nil")
    return
end

-- Debug: Verify the created frame
if type(itemsListContainer) ~= "table" then
    error("itemsListContainer creation failed - got " .. type(itemsListContainer) .. " instead of table")
    return
end

-- Debug: Check if it's a proper frame object
if not itemsListContainer.SetFrameStrata then
    error("itemsListContainer is missing SetFrameStrata method - CreateFrame may have failed")
    return
end
-- ʕ •ᴥ•ʔ✿ Ensure container is properly layered above parent frames ✿ʕ •ᴥ•ʔ
if itemsListContainer then
    -- Debug: Check what type of object itemsListContainer is
    if type(itemsListContainer) ~= "table" then
        error("itemsListContainer is not a table, it's: " .. type(itemsListContainer))
        return
    end

    -- Check if it has the required methods
    if not itemsListContainer.SetFrameStrata then
        error("itemsListContainer does not have SetFrameStrata method - it may not be a proper frame")
        return
    end

    itemsListContainer:SetFrameStrata("FULLSCREEN_DIALOG")

    if not itemsListContainer.SetFrameLevel then
        error("itemsListContainer does not have SetFrameLevel method")
        return
    end
    itemsListContainer:SetFrameLevel(10) -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Reasonable level instead of 100 which blocks mouse events ✿ʕ•ᴥ•ʔ

    if itemsListContainer.SetClipsChildren then
        itemsListContainer:SetClipsChildren(true) -- stop children from spilling out
    end
    itemsListContainer:SetSize(400, 340)
    itemsListContainer:SetPoint("TOPLEFT", itemsListFrame, "TOPLEFT", 2, -2)

    -- ʕ •ᴥ•ʔ✿ Make itemsListContainer globally accessible ✿ʕ•ᴥ•ʔ
    _G.ItemsListContainer = itemsListContainer
end

-- Check if frame already exists and remove it
if _G["DJ_ItemPageNavFrame"] then
    _G["DJ_ItemPageNavFrame"]:Hide()
    _G["DJ_ItemPageNavFrame"] = nil
end

local pageNavigationFrame = CreateFrame("Frame", "DJ_ItemPageNavFrame", itemsListFrame)
if not pageNavigationFrame then
    error("Failed to create pageNavigationFrame - itemsListFrame may be nil")
    return
end
pageNavigationFrame:SetSize(400, 25)
pageNavigationFrame:SetPoint("BOTTOM", itemsListFrame, "BOTTOM", 0, 0)

-- Move search box to top right area
-- Check if frame already exists and remove it
if _G["DJ_ItemSearchBox"] then
    _G["DJ_ItemSearchBox"]:Hide()
    _G["DJ_ItemSearchBox"] = nil
end

-- Check if filterTypeButton exists before referencing it
if not filterTypeButton then
    error("filterTypeButton is nil when trying to position itemSearchBox")
    return
end

local itemSearchBox = CreateFrame("EditBox", "DJ_ItemSearchBox", DungeonJournalFrame, "InputBoxTemplate")
if not itemSearchBox then
    error("Failed to create itemSearchBox")
    return
end
itemSearchBox:SetSize(120, 20)
itemSearchBox:SetAutoFocus(false)
itemSearchBox:SetPoint("RIGHT", filterTypeButton, "LEFT", -10, 0)
itemSearchBox:SetFrameStrata("FULLSCREEN")
itemSearchBox:SetFrameLevel((DungeonJournalFrame:GetFrameLevel() or 0) + 20)
itemSearchBox:SetText((Journal_charDB and Journal_charDB.itemSearchQuery) or "")
itemSearchBox:SetScript("OnTextChanged", function(self, userInput)
    if Journal_charDB then
        Journal_charDB.itemSearchQuery = self:GetText() or ""
    end

    -- Invalidate cache when search query changes
    if _G.currentDungeon then
        InvalidateItemsCache(_G.currentDungeon.name)
        LoadDungeonDetail(_G.currentDungeon)
    end
end)

-- Initialize filter settings (safe initialization)
if Journal_charDB and not Journal_charDB.itemFilters then
    Journal_charDB.itemFilters = {
        searchType = "items", -- "items", "bosses"
        maxSources = 0, -- maximum number of sources (0 = show all)
        showRareDrops = true, -- show items with < 5% droprate
        showCommonDrops = true -- show items with >= 5% droprate
    }
end

-- Create new icon-based filter controls positioned nicely in top right

-- Source Count Filter Icon Button (3 states: All, 1 source, >1 source)
local sourceCountOptions = {
    { state = 0, text = "All Items", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllSources.blp" },
    { state = 1, text = "1 Source", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\1Source.blp" },
    { state = 999, text = ">1 Source", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\MoreThan1Source.blp" }
}

local currentSourceIndex = 1
-- Find current index based on saved setting
if Journal_charDB and Journal_charDB.itemFilters then
    if Journal_charDB.itemFilters.maxSources == 1 then
        currentSourceIndex = 2
    elseif Journal_charDB.itemFilters.maxSources == 999 then
        currentSourceIndex = 3
    else
        currentSourceIndex = 1
    end
end

-- ʕ •ᴥ•ʔ✿ Source Count Filter delegated to UILayoutManager ʕ•ᴥ•ʔ
-- Check if itemSearchBox exists before referencing it
if not itemSearchBox then
    error("itemSearchBox is nil when trying to position sourceCountButton")
    return
end

local sourceCountButton = CreateFrame("Button", nil, DungeonJournalFrame)
if not sourceCountButton then
    error("Failed to create sourceCountButton")
    return
end
sourceCountButton:SetSize(24, 24)
sourceCountButton:SetPoint("RIGHT", itemSearchBox, "LEFT", -10, 0)
sourceCountButton:SetFrameStrata("FULLSCREEN")
sourceCountButton:SetFrameLevel((DungeonJournalFrame:GetFrameLevel() or 0) + 20)

local UILayoutManager = GetUILayoutManager()
if UILayoutManager then
    UILayoutManager.UpdateSourceCountButton(sourceCountButton)
end

sourceCountButton:SetScript("OnClick", function(self)
    local UILayoutManager = GetUILayoutManager()
    if UILayoutManager then
        UILayoutManager.OnSourceCountClick(self, InvalidateItemsCache, LoadDungeonDetail)
    end
end)

sourceCountButton:SetScript("OnEnter", function(self)
    local UILayoutManager = GetUILayoutManager()
    if UILayoutManager then
        UILayoutManager.OnSourceCountEnter(self)
    end
end)

sourceCountButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Mythic Filter Icon Button (3 states: All, Mythic Only, Non-Mythic Only)
local mythicFilterOptions = {
    { state = "all", text = "All Difficulties", icon = "Interface\\Icons\\INV_Misc_Gem_01" },
    { state = "mythic", text = "Mythic Only", icon = "Interface\\Icons\\INV_Misc_Gem_Emerald_01" },
    { state = "nonmythic", text = "Non-Mythic", icon = "Interface\\Icons\\INV_Misc_Gem_Ruby_01" }
}

local currentMythicIndex = 1
-- Find current index based on saved setting
if Journal_charDB and Journal_charDB.itemFilters then
    if Journal_charDB.itemFilters.mythicFilter == "mythic" then
        currentMythicIndex = 2
    elseif Journal_charDB.itemFilters.mythicFilter == "nonmythic" then
        currentMythicIndex = 3
    else
        currentMythicIndex = 1
    end
end

-- ʕ •ᴥ•ʔ✿ Mythic Filter delegated to UILayoutManager ✿ʕ•ᴥ•ʔ
-- Check if sourceCountButton exists before referencing it
if not sourceCountButton then
    error("sourceCountButton is nil when trying to position mythicFilterButton")
    return
end

local mythicFilterButton = CreateFrame("Button", nil, DungeonJournalFrame)
if not mythicFilterButton then
    error("Failed to create mythicFilterButton")
    return
end
mythicFilterButton:SetSize(24, 24)
mythicFilterButton:SetPoint("RIGHT", sourceCountButton, "LEFT", -5, 0)
mythicFilterButton:SetFrameStrata("FULLSCREEN")
mythicFilterButton:SetFrameLevel((DungeonJournalFrame:GetFrameLevel() or 0) + 20)

local UILayoutManager = GetUILayoutManager()
if UILayoutManager then
    UILayoutManager.UpdateMythicFilterButton(mythicFilterButton)
end

mythicFilterButton:SetScript("OnClick", function(self)
    local UILayoutManager = GetUILayoutManager()
    if UILayoutManager then
        UILayoutManager.OnMythicFilterClick(self, InvalidateItemsCache, LoadDungeonDetail)
    end
end)

mythicFilterButton:SetScript("OnEnter", function(self)
    local UILayoutManager = GetUILayoutManager()
    if UILayoutManager then
        UILayoutManager.OnMythicFilterEnter(self)
    end
end)

mythicFilterButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- ʕ •ᴥ•ʔ✿ Function to detect available difficulties in a dungeon ✿ʕ•ᴥ•ʔ
local function GetAvailableDifficulties(dungeon)
    if not dungeon then return {} end

    local difficulties = {}

    -- Check each difficulty array
    if dungeon.items and #dungeon.items > 0 then
        table.insert(difficulties, "normal")
    end
    if dungeon.items_hc and #dungeon.items_hc > 0 then
        table.insert(difficulties, "heroic")
    end
    if dungeon.items_my and #dungeon.items_my > 0 then
        table.insert(difficulties, "mythic")
    end
    if dungeon.items_10n and #dungeon.items_10n > 0 then
        table.insert(difficulties, "10n")
    end
    if dungeon.items_10h and #dungeon.items_10h > 0 then
        table.insert(difficulties, "10h")
    end
    if dungeon.items_25n and #dungeon.items_25n > 0 then
        table.insert(difficulties, "25n")
    end
    if dungeon.items_25h and #dungeon.items_25h > 0 then
        table.insert(difficulties, "25h")
    end

    return difficulties
end

-- ʕ •ᴥ•ʔ✿ Function to check if dungeon has multiple difficulties ✿ʕ•ᴥ•ʔ
local function HasMultipleDifficulties(dungeon)
    local difficulties = GetAvailableDifficulties(dungeon)
    return #difficulties > 1
end

-- ʕ •ᴥ•ʔ✿ Function to show smart filter message ✿ʕ•ᴥ•ʔ
local function ShowSmartFilterMessage(dungeonName, availableDifficulties)
    if DEBUG or _G.debug then
        local difficultyText = table.concat(availableDifficulties, ", ")
        print("|cFF87CEEB[Smart Filter]|r " .. dungeonName .. " only has: " .. difficultyText .. " - difficulty filter auto-cleared")
    end
end

-- Define show/hide functions now that all buttons are created
local function HideDungeonInteriorUI()
    if filterTypeButton then filterTypeButton:Hide() end
    if sourceCountButton then sourceCountButton:Hide() end
    if mythicFilterButton then mythicFilterButton:Hide() end
    if itemSearchBox then itemSearchBox:Hide() end
    -- ʕ •ᴥ•ʔ✿ Hide item list frames when leaving dungeon detail ✿ʕ•ᴥ•ʔ
    if itemsListFrame then itemsListFrame:Hide() end
    if itemsListContainer then itemsListContainer:Hide() end
    if pageNavigationFrame then pageNavigationFrame:Hide() end
end

local function ShowDungeonInteriorUI()
    if filterTypeButton then filterTypeButton:Show() end
    if sourceCountButton then sourceCountButton:Show() end
    if itemSearchBox then itemSearchBox:Show() end

    -- ʕ •ᴥ•ʔ✿ Smart difficulty filter - only show if multiple difficulties available ✿ʕ•ᴥ•ʔ
    if mythicFilterButton then
        if _G.currentDungeon and HasMultipleDifficulties(_G.currentDungeon) then
            mythicFilterButton:Show()
        else
            mythicFilterButton:Hide()
            -- ʕ ◕ᴥ◕ ʔ✿ Auto-reset filter to "all" when no multiple difficulties ✿ʕ ◕ᴥ◕ ʔ
            if Journal_charDB and Journal_charDB.itemFilters and Journal_charDB.itemFilters.difficultyFilter ~= "all" then
                Journal_charDB.itemFilters.difficultyFilter = "all"
                -- Show debug message if enabled
                if _G.currentDungeon and (DEBUG or _G.debug) then
                    local availableDifficulties = GetAvailableDifficulties(_G.currentDungeon)
                    ShowSmartFilterMessage(_G.currentDungeon.name, availableDifficulties)
                end
            end
        end
    end

    -- ʕ •ᴥ•ʔ✿ Show the item list frames when entering dungeon detail ✿ʕ•ᴥ•ʔ
    if itemsListFrame then itemsListFrame:Show() end
    if itemsListContainer then itemsListContainer:Show() end
    if pageNavigationFrame then pageNavigationFrame:Show() end
end

-- Removed dropdown controls - now using streamlined icon buttons

local prevPageButton = CreateFrame("Button", nil, pageNavigationFrame, "UIPanelButtonTemplate")
prevPageButton:SetSize(25, 20)
prevPageButton:SetText("<")

local pageText = pageNavigationFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
pageText:SetPoint("CENTER", pageNavigationFrame, "CENTER", -30, 0)
pageText:SetText("Page 1/1")

local nextPageButton = CreateFrame("Button", nil, pageNavigationFrame, "UIPanelButtonTemplate")
nextPageButton:SetSize(25, 20)
nextPageButton:SetText(">")

-- Center the navigation: prev button to left of text, next button to right of text
prevPageButton:SetPoint("RIGHT", pageText, "LEFT", -5, 0)
nextPageButton:SetPoint("LEFT", pageText, "RIGHT", 5, 0)

local function UpdatePage(offset)
    -- Only update if we have valid pages
    if totalPages <= 1 then
        return
    end

    Journal_charDB.currentItemPage = Journal_charDB.currentItemPage + offset

    -- Wrap around pages
    if Journal_charDB.currentItemPage < 1 then
        Journal_charDB.currentItemPage = totalPages
    elseif Journal_charDB.currentItemPage > totalPages then
        Journal_charDB.currentItemPage = 1
    end

    -- Only update the display instead of reloading everything
    if _G.currentDungeon then
        -- Use cached items to avoid re-sorting
        local cacheKey = GetCacheKey(_G.currentDungeon)
        local cachedItems = cacheKey and preparedItemsCache[cacheKey]

        if cachedItems then
            -- Update display with cached items (much faster)
            DisplayItemsList(_G.currentDungeon, nil, cachedItems)
        else
            -- Fall back to full reload if cache is empty - mark as pagination to prevent friends update
            LoadDungeonDetail(_G.currentDungeon, true)
        end
    end
end

prevPageButton:SetScript("OnClick", function() UpdatePage(-1) end)
nextPageButton:SetScript("OnClick", function() UpdatePage(1) end)

itemsListFrame:EnableMouseWheel(true)
itemsListFrame:SetScript("OnMouseWheel", function(self, delta)
    if delta > 0 then
        UpdatePage(-1)
    else
        UpdatePage(1)
    end
end)

local backButton = CreateFrame("Button", nil, DungeonJournalFrame)
backButton:SetSize(20, 20)
backButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", -12, -9)

local backFont = backButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
backFont:SetText("<  ")
backFont:SetPoint("CENTER", backButton, "CENTER", 0, 3)

local backTex = backButton:CreateTexture(nil, "BACKGROUND")
backTex:SetAllPoints(backButton)
backTex:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
backTex:SetBlendMode("ADD")

local backHighlightTexture = backButton:CreateTexture(nil, "HIGHLIGHT")
backHighlightTexture:SetAllPoints(backButton)
backHighlightTexture:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
backHighlightTexture:SetBlendMode("ADD")

backButton:SetScript("OnClick", function()
    if dungeonDetailFrame:IsShown() then
        -- Restore the main interface background when returning to preview
        DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_base.blp")
        dungeonDetailFrame:Hide()
        previewFrame:Show()
        HideDungeonInteriorUI()

        -- ʕ •ᴥ•ʔ✿ Hide and clear the item list when going back ✿ʕ•ᴥ•ʔ
        if itemsListFrame then itemsListFrame:Hide() end
        if itemsListContainer then itemsListContainer:Hide() end
        if pageNavigationFrame then pageNavigationFrame:Hide() end

        -- Clear all item buttons
        HideAllItemButtons()

        -- Clear current dungeon reference
        _G.currentDungeon = nil

        if randomQuestIcon then randomQuestIcon:Hide() end
        if previewQuestIcon then previewQuestIcon:Hide() -- Hide on preview
        if questPopoutFrame then questPopoutFrame:Hide() end

        C_Timer.After(0.1, function()
            RefreshAllAttunableText()
            FilterAndSortDungeons()
            -- ʕ •ᴥ•ʔ✿ Reposition friends frame for preview view ✿ʕ•ᴥ•ʔ
            if _G.PositionFriendsFrame then
                _G.PositionFriendsFrame()
            end
        end)
    elseif previewFrame:IsShown() then
        HideJournal()
    end
end)

-- ʕ •ᴥ•ʔ✿ Item button management delegated to UIItemsManager ✿ʕ•ᴥ•ʔ
local UIItemsManager = _G.TheJournal_UIItemsManager

function AcquireItemButton(dIndex, iIndex)
    return UIItemsManager.AcquireItemButton(dIndex, iIndex)
end

function HideAllItemButtons()
    UIItemsManager.HideAllItemButtons()
end

-- ʕ •ᴥ•ʔ✿ Make functions globally accessible ✿ʕ•ᴥ•ʔ
_G.AcquireItemButton = AcquireItemButton
_G.HideAllItemButtons = HideAllItemButtons

-- Simplified caching function - only cache current dungeon, no batch processing
local function HandleUncachedItem(itemID, dungeon)
    if dungeon and dungeon.name and not tempschedule[dungeon.name] then
        tempschedule[dungeon.name] = true
        C_Timer.After(0.5, function()
            -- Simple pre-cache only for current dungeon
            if dungeon.items then
                for _, id in ipairs(dungeon.items) do
                    CacheItem(id)
                end
            end
            if _G.currentDungeon and _G.currentDungeon.name == dungeon.name then
                LoadDungeonDetail(_G.currentDungeon)
            end
        end)
    end
end

-- Removed UpdateToggleEquippableButtonText and toggleEquippableButton logic

local filterTypeOptions = {
    { state = "All",     icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllItems.blp" },
    { state = "Attunable", icon ="Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AttunableItems.blp" },
    { state = "Attuned", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AttunedItems.blp" }
}

local currentFilterIndex = 1
for i, v in ipairs(filterTypeOptions) do
    if v.state == DJ_Settings.filterType then
        currentFilterIndex = i
        break
    end
end

local function UpdateFilterTypeButton()
    local opt = filterTypeOptions[currentFilterIndex]
    filterTypeButton:SetNormalTexture(opt.icon)
    local tex = filterTypeButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    filterTypeButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")

    DJ_Settings.filterType = opt.state
end

UpdateFilterTypeButton()

filterTypeButton:SetScript("OnClick", function(self)
    -- Store tooltip state before making changes
    local tooltipWasShown = GameTooltip:IsShown() and GameTooltip:GetOwner() == self

    currentFilterIndex = currentFilterIndex + 1
    if currentFilterIndex > #filterTypeOptions then
        currentFilterIndex = 1
    end
    UpdateFilterTypeButton()

    -- Invalidate cache when filter changes
    InvalidateItemsCache()  -- Clear all cache since filter affects all dungeons

    Journal_charDB.currentItemPage = 1
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end

    -- Restore tooltip if it was shown before the click
    if tooltipWasShown then
        if C_Timer and C_Timer.After then
            C_Timer.After(0.1, function()
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
                GameTooltip:ClearLines()
                GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
                GameTooltip:Show()
            end)
        else
            -- Fallback: Update immediately if no timer available
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
            GameTooltip:ClearLines()
            GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
            GameTooltip:Show()
        end
    end
end)

local function ToggleAll(list, boolMap)
    local allOn = true
    for _, val in ipairs(list) do
        if not boolMap[val] then
            allOn = false
            break
        end
    end
    for _, val in ipairs(list) do
        boolMap[val] = not allOn
    end
end

local function GetVersionModifierForDungeon(dungeon, versionIndex)
    if dungeon.versions and dungeon.versions[versionIndex] then
        return dungeon.versions[versionIndex].modifier or 0
    elseif dungeon.versions and #dungeon.versions > 0 then
        return dungeon.versions[#dungeon.versions].modifier or 0
    end
    return 0
end

local function FindDungeonByName(dName)
    for _, d in ipairs(dungeonData or {}) do
        if d.name == dName then
            return d
        end
    end
end

function PassesFilterIcon(iType, iSubType, eLoc, filterIcon)
    local function NormalizeWeaponSubType(subType)
        if subType == "Staves" then
            return "Staff"
        end
        return subType
    end

    if filterIcon == "All" then
        return true
    end

    if filterIcon == "Weapons" then
        if iType == "Weapon" then
            iSubType = NormalizeWeaponSubType(iSubType)
            return true
        end
        if iType == "Armor" and (iSubType == "Shields" or eLoc == "INVTYPE_HOLDABLE") then
            return true
        end
        return false
    end

    if filterIcon == "Armor" then
        if iType == "Armor" and iSubType ~= "Shields" and eLoc ~= "INVTYPE_HOLDABLE" then
            return true
        end
        return false
    end

    return true
end

local function PrepareItemsToShow(dungeon)
    return UIItemsManager.PrepareItemsToShow(dungeon, GetCacheKey, preparedItemsCache, GetCachedAttunement, SetCachedAttunement, GetCachedForge, SetCachedForge, GetCachedDropRate, CleanupItemsCache)
end

-- Function to get current filter information as a string
local function GetCurrentFilterInfo()
    local filterInfo = {}

    -- Get attunement filter
    local filterIcon = DJ_Settings.filterType or "All"
    if filterIcon == "Attunable" then
        table.insert(filterInfo, "|cFFFFFF00Attunable|r")
    elseif filterIcon == "Attuned" then
        table.insert(filterInfo, "|cFF00FF00Attuned|r")
    end

    -- Get difficulty filter
    local difficultyFilter = Journal_charDB.itemFilters and Journal_charDB.itemFilters.difficultyFilter or "all"
    if difficultyFilter == "normal" then
        table.insert(filterInfo, "|cFF87CEEBNormal|r")
    elseif difficultyFilter == "heroic" then
        table.insert(filterInfo, "|cFFFF6600Heroic|r")
    elseif difficultyFilter == "mythic" then
        table.insert(filterInfo, "|cFFFF6600Mythic|r")
    elseif difficultyFilter == "10n" then
        table.insert(filterInfo, "|cFF9966CC10N|r")
    elseif difficultyFilter == "10h" then
        table.insert(filterInfo, "|cFF9966CC10H|r")
    elseif difficultyFilter == "25n" then
        table.insert(filterInfo, "|cFFFFB34725N|r")
    elseif difficultyFilter == "25h" then
        table.insert(filterInfo, "|cFFFFB34725H|r")
    end

    -- Get source count filter
    local maxSources = Journal_charDB.itemFilters and Journal_charDB.itemFilters.maxSources or 0
    if maxSources == 1 then
        table.insert(filterInfo, "|cFF87CEEB1 Source|r")
    elseif maxSources == 999 then
        table.insert(filterInfo, "|cFF87CEEB>1 Source|r")
    end

    return table.concat(filterInfo, " • ")
end

-- Function to update dungeon title with filter information
local function UpdateDungeonTitleWithFilters(dungeon)
    if not dungeon or not dungeonTitleText then return end

    local baseName = dungeon.name or "Unknown Dungeon"
    local filterInfo = GetCurrentFilterInfo()

    if filterInfo and filterInfo ~= "" then
        dungeonTitleText:SetText(baseName .. " |cFF888888(" .. filterInfo .. ")|r")
    else
        dungeonTitleText:SetText(baseName)
    end
end

DisplayItemsList = function(dungeon, versionIndex, itemsToShow)
    wipe(displayedItems)
    local query = (Journal_charDB.itemSearchQuery or ""):lower()

    -- Initialize filters if not already initialized
    if not Journal_charDB.itemFilters then
        Journal_charDB.itemFilters = {
            searchType = "items", -- "items", "bosses"
            maxSources = 0, -- maximum number of sources (0 = show all)
            showRareDrops = true,
            showCommonDrops = true,
            difficultyFilter = "all" -- "all", "normal", "heroic", "mythic", "10n", "10h", "25n", "25h"
        }
    end

    -- Migrate old mythicFilter setting to new difficultyFilter
    if Journal_charDB.itemFilters.mythicFilter ~= nil then
        if Journal_charDB.itemFilters.mythicFilter == "mythic" then
            Journal_charDB.itemFilters.difficultyFilter = "mythic"
        elseif Journal_charDB.itemFilters.mythicFilter == "nonmythic" then
            Journal_charDB.itemFilters.difficultyFilter = "normal" -- Default non-mythic to normal
        else
            Journal_charDB.itemFilters.difficultyFilter = "all"
        end
        Journal_charDB.itemFilters.mythicFilter = nil -- Remove old setting
    end

    -- Add difficultyFilter field if missing from existing filters
    if Journal_charDB.itemFilters.difficultyFilter == nil then
        Journal_charDB.itemFilters.difficultyFilter = "all"
    end

    local filters = Journal_charDB.itemFilters

    -- Handle different search types and filtering
    if query ~= "" or filters.maxSources > 0 or filters.difficultyFilter ~= "all" then
        -- Filtering is active
        local filtered = {}

        -- Boss search mode
        if filters.searchType == "bosses" and query ~= "" then
            -- Find items that drop from bosses matching the search query
            if dungeon.bosses and ItemLocIsLoaded and ItemLocIsLoaded() then
                for _, boss in ipairs(dungeon.bosses) do
                    if boss.name and boss.bossID and boss.name:lower():find(query, 1, true) then
                        -- Get items from this boss
                        local count = ItemLocGetObjCount and ItemLocGetObjCount(1, boss.bossID) or 0
                        if count and count > 0 then
                            for i = 1, count do
                                local srcType, itemId, chance, dropsPerThousand = ItemLocGetObjAt(1, boss.bossID, i)
                                if itemId then
                                    -- Apply source count and drop rate filters
                                    local sourceCount = ItemLocGetSourceCount and ItemLocGetSourceCount(itemId) or 0
                                    local bestChance = chance or 0

                                    -- Check max sources filter (0 means show all, 999 means >1 source)
                                    local passesSourceFilter = true
                                    if filters.maxSources == 1 then
                                        passesSourceFilter = (sourceCount == 1)
                                    elseif filters.maxSources == 999 then
                                        passesSourceFilter = (sourceCount > 1)
                                    end
                                    -- 0 means show all, so no additional filtering needed

                                    if passesSourceFilter then
                                        -- Simplified - show all items (removed drop rate filtering)
                                        local showItem = true

                                        if showItem then
                                            -- Apply difficulty filter - for boss search, use simplified logic
                                            local passesDifficultyFilter = true
                                            if filters.difficultyFilter ~= "all" and _G.GetItemTagsCustom then
                                                local itemTags1, itemTags2 = _G.GetItemTagsCustom(itemId)
                                                local isMythicItem = itemTags1 and bit.band(itemTags1, 0x80) ~= 0 -- Check for 128 bit (Mythic)

                                                if filters.difficultyFilter == "mythic" and not isMythicItem then
                                                    passesDifficultyFilter = false
                                                elseif filters.difficultyFilter ~= "mythic" and filters.difficultyFilter ~= "all" and isMythicItem then
                                                    passesDifficultyFilter = false
                                                end
                                            end

                                            if passesDifficultyFilter then
                                                table.insert(filtered, {
                                                    baseID = itemId,
                                                    itemLink = "item:" .. itemId,
                                                    isSpecial = false,
                                                    index = #filtered + 1,
                                                    fromBoss = boss.name
                                                })
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            -- Normal item search with filtering
            for _, info in ipairs(itemsToShow) do
                local adjID = info.isSpecial and info.baseID or info.baseID
                local shouldInclude = true

                -- Apply max source count filter (0 means show all, 999 means >1 source)
                if filters.maxSources ~= 0 and ItemLocGetSourceCount then
                    local sourceCount = ItemLocGetSourceCount(adjID) or 0
                    if filters.maxSources == 1 then
                        if sourceCount ~= 1 then
                            shouldInclude = false
                        end
                    elseif filters.maxSources == 999 then
                        if sourceCount <= 1 then
                            shouldInclude = false
                        end
                    end
                end

                -- Apply difficulty filter - Note: This is simplified for compatibility
                -- Full difficulty filtering will be implemented in UIItemsManager
                if shouldInclude and filters.difficultyFilter ~= "all" and _G.GetItemTagsCustom then
                    local itemTags1, itemTags2 = _G.GetItemTagsCustom(adjID)
                    local isMythicItem = itemTags1 and bit.band(itemTags1, 0x80) ~= 0 -- Check for 128 bit (Mythic)

                    -- Difficulty filtering logic - simplified for backward compatibility
                    if filters.difficultyFilter == "mythic" and not isMythicItem then
                        shouldInclude = false
                    elseif filters.difficultyFilter ~= "mythic" and filters.difficultyFilter ~= "all" and isMythicItem then
                        shouldInclude = false
                    end
                end

                -- Removed drop rate filters - using streamlined interface

                -- Apply text search for items
                if shouldInclude and query ~= "" and filters.searchType == "items" then
                    local iName
                    -- ʕ •ᴥ•ʔ✿ Validate itemID before calling GetItemInfo ✿ʕ •ᴥ•ʔ
                    if adjID and tonumber(adjID) then
                        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfo(adjID)
                        if not iName then iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfoCustom(adjID) end
                        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfoCustom(adjID)

                        if iName then
                            local nameLower = iName:lower()
                            searchTooltip:ClearLines()
                            searchTooltip:SetHyperlink("item:" .. adjID)
                            local tooltipText = ""
                            for lineIndex = 1, searchTooltip:NumLines() do
                                local leftLine  = _G["DJ_ItemSearchTooltipTextLeft" .. lineIndex]
                                local rightLine = _G["DJ_ItemSearchTooltipTextRight" .. lineIndex]
                                local lt        = leftLine and leftLine:GetText() or ""
                                local rt        = rightLine and rightLine:GetText() or ""
                                tooltipText     = tooltipText .. lt:lower() .. "\n" .. rt:lower() .. "\n"
                            end
                            if not (nameLower:find(query, 1, true) or tooltipText:find(query, 1, true)) then
                                shouldInclude = false
                            end
                        else
                            -- ʕ •ᴥ•ʔ✿ Skip items with no name info ✿ʕ •ᴥ•ʔ
                            shouldInclude = false
                        end
                    else
                        -- ʕ •ᴥ•ʔ✿ Skip invalid item IDs ✿ʕ •ᴥ•ʔ
                        shouldInclude = false
                    end
                end

                if shouldInclude then
                    table.insert(filtered, info)
                end
            end
        end



        itemsToShow = filtered
    end

    for _, v in ipairs(itemsToShow) do
        table.insert(displayedItems, v)
    end


    totalPages = math.ceil(#displayedItems / MAX_ITEMS_PER_PAGE)
    if totalPages < 1 then
        totalPages = 1
    end

    -- Ensure current page is within valid range
    if Journal_charDB.currentItemPage > totalPages then
        Journal_charDB.currentItemPage = totalPages
    elseif Journal_charDB.currentItemPage < 1 then
        Journal_charDB.currentItemPage = 1
    end

    pageText:SetText(("Page %d/%d"):format(Journal_charDB.currentItemPage, totalPages))

    HideAllItemButtons()
    if #displayedItems == 0 then
        local noItemsLabel = AcquireItemButton(dungeon.index or 9999, 99999)
        noItemsLabel:ClearAllPoints()
        noItemsLabel:SetPoint("TOPLEFT", itemsListContainer, "TOPLEFT", 5, -5)
        noItemsLabel.iconTex:SetTexture("")
        noItemsLabel.itemText:SetText(
            DJ_Settings.onlyEquipable and "No equippable items available" or "No items available"
        )
        noItemsLabel.dropLocationText:SetText("")
        noItemsLabel.favoriteIcon:Hide()
        noItemsLabel:Show()
        itemsListContainer:SetHeight(40)
        return
    end

    local startIndex = (Journal_charDB.currentItemPage - 1) * MAX_ITEMS_PER_PAGE + 1
    local endIndex   = math.min(startIndex + MAX_ITEMS_PER_PAGE - 1, #displayedItems)
    local shownItems = 0

    for idx = startIndex, endIndex do
        local info = displayedItems[idx]
        shownItems = shownItems + 1
        local adjID = info.isSpecial and info.baseID or info.baseID
        local iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture

        -- Use GetItemInfoCustom if available, fallback to GetItemInfo
        -- local iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfo(itemID)
        -- if not iName then iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfoCustom(itemID) end
        -- local iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfoCustom(itemID)

        local iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture = GetItemInfo(adjID)
        if not iName then iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture = GetItemInfoCustom(adjID) end

        local color = ITEM_QUALITY_COLORS[iQuality or 1] or ITEM_QUALITY_COLORS[1]

        -- Create button first
        local btn = AcquireItemButton(dungeon.index or 9999, shownItems)
        if not btn then
            return
        end

        -- Use cached attunement and forge status from PrepareItemsToShow
        local attuneProgress = info.cachedProgress or 0
        local attuneText = ""
        local attuneColor = {1, 1, 1} -- Default white
        local forgeLevel = info.cachedForge or 0

        local forgeText = ""
        -- Set forge text based on level
        if forgeLevel == 1 then
            forgeText = "Titanforged"
        elseif forgeLevel == 2 then
            forgeText = "Warforged"
        elseif forgeLevel == 3 then
            forgeText = "Lightforged"
        end

        if attuneProgress > 0 then
            if attuneProgress >= 100 then
                attuneText = "Attuned"
                -- Set color based on forge level
                if forgeLevel == 1 then -- Titanforged
                    attuneColor = {0.5, 0.8, 1} -- Light Blue
                elseif forgeLevel == 2 then -- Warforged
                    attuneColor = {1, 0.5, 0.5} -- Light Red
                elseif forgeLevel == 3 then -- Lightforged
                    attuneColor = {1, 1, 0.5} -- Yellow
                else
                    attuneColor = {1, 1, 1} -- White for normal
                end
            else
                attuneText = "Attune in Progress - " .. string.format("%.2f", attuneProgress) .. "%"
                attuneColor = {0.5, 0.5, 0.5} -- Gray for in-progress
            end
        end

        -- Create status text
        local statusText = ""
        local statusColor = ""

        -- Convert color table to color string
        local function ColorTableToString(color)
            return string.format("|cFF%02X%02X%02X", color[1] * 255, color[2] * 255, color[3] * 255)
        end

        -- Get ItemLoc drop location info if available
        local dropLocationText = ""
        if _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
            dropLocationText = _G.ItemLocAPI:GetItemDropLocationText(adjID, _G.currentDungeon and _G.currentDungeon.name)
            -- Special formatting for Vault of Archavon
            if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" and dropLocationText ~= "" then
                -- Parse the drop location text to extract boss name and percentage
                local bossName, percentage = dropLocationText:match("^(.+) %- (.+)$")
                if bossName and percentage then
                    -- Truncate boss name to 17 characters
                    if string.len(bossName) > 17 then
                        bossName = string.sub(bossName, 1, 17)
                    end
                    dropLocationText = bossName .. "\n" .. percentage
                end
            end
        end

        if attuneText ~= "" then
            -- For attuned items: "Attuned - Lightforged" or just "Attuned"
            statusText = attuneText
            if forgeText ~= "" then
                statusText = statusText .. " - " .. forgeText
            end
            -- NO drop location for attuned items (too cluttered)
            statusColor = ColorTableToString(attuneColor)
        else
            -- For not attuned items: show droprate and drop source
            local droprateText = ""
            local dropSourceText = ""

            -- Try to get droprate when ItemLoc is available
            if ItemLocIsLoaded and ItemLocIsLoaded() and ItemLocGetSourceCount then
                local count = ItemLocGetSourceCount(adjID)
                if count and count > 0 then
                    local bestChance = 0
                    local bestSource = nil

                    -- Find the best (highest chance) source
                    for i = 1, count do
                        local srcType, objType, objId, chance, dropsPerThousand, objName, zoneName, spawnedCount = ItemLocGetSourceAt(adjID, i)
                        if chance and chance > bestChance then
                            bestChance = chance
                            bestSource = objName
                        end
                    end

                    if bestChance > 0 then
                        -- Check if droprate is 101 (quest/vendor flag) or >= 100
                        if bestChance >= 100 then
                            -- For Vault of Archavon, don't show quest/vendor sources at all
                            if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" then
                                droprateText = "" -- Hide completely
                            else
                                droprateText = "Quest/Vendor"
                            end
                        else
                            droprateText = string.format("%.2f%%", bestChance)
                        end
                        dropSourceText = bestSource or "Unknown"
                    end
                end
            elseif _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
                -- Fallback to wrapper if available
                local bestSource = _G.ItemLocAPI:GetBestSource(adjID, _G.currentDungeon and _G.currentDungeon.name)
                if bestSource and bestSource.chance and bestSource.chance > 0 then
                    -- Check if droprate is 101 (quest/vendor flag) or >= 100
                    if bestSource.chance >= 100 then
                        -- For Vault of Archavon, don't show quest/vendor sources at all
                        if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" then
                            droprateText = "" -- Hide completely
                        else
                            droprateText = "Quest/Vendor"
                        end
                    else
                        droprateText = string.format("%.2f%%", bestSource.chance)
                    end
                    dropSourceText = bestSource.sourceName or "Unknown"
                end
            end

            -- Build status text based on what info we have
            if info.fromBoss then
                -- Boss search results
                if droprateText ~= "" then
                    statusText = "From: " .. info.fromBoss .. "\n" .. droprateText
                else
                    statusText = "From: " .. info.fromBoss
                end
            elseif droprateText ~= "" then
                -- Show source and droprate
                if dropSourceText ~= "" and dropSourceText ~= "Unknown" then
                    local bossName = dropSourceText
                    -- For Vault of Archavon, truncate boss name to 17 characters max
                    if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" then
                        if string.len(bossName) > 17 then
                            bossName = string.sub(bossName, 1, 17)
                        end
                    end
                    statusText = bossName .. "\n" .. droprateText
                else
                    statusText = droprateText
                end
            elseif dropLocationText ~= "" and dropLocationText ~= "Unknown source" then
                -- Fallback to basic drop location if no droprate
                statusText = dropLocationText
            else
                -- Last fallback
                statusText = forgeText ~= "" and forgeText or "Unknown Source"
            end
            statusColor = "|cFFFFFFFF" -- Default white
        end

        -- Set button properties
        btn.iconTex:SetTexture(iTexture or "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllItems.blp")
        btn.itemText:SetText(color.hex .. iName .. "|r")
        btn.dropLocationText:SetText(statusColor .. statusText .. "|r")
        btn.dropLocationText:SetTextColor(1, 1, 1)
        btn.dropLocationText:SetFont("Fonts\\FRIZQT__.TTF", 12, "NONE")

        btn.itemID = info.baseID
        btn.itemLink = iLink
        btn.baseItemID = info.baseID

        if Journal_charDB.favorites[info.baseID] then
            btn.favoriteIcon:Show()
        else
            btn.favoriteIcon:Hide()
        end

        -- ʕ •ᴥ•ʔ✿ Add bag indicator ✿ʕ•ᴥ•ʔ
        if _G.TheJournal_UIBagScanner and _G.TheJournal_UIBagScanner.AddBagIndicatorToButton then
            _G.TheJournal_UIBagScanner.AddBagIndicatorToButton(btn, info.baseID)
        end

        -- Add bounty icon if item is bountied (positioned on the item icon)
        if _G.BountySystem and _G.BountySystem.SetFrameBounty then
            _G.BountySystem.SetFrameBounty(btn, iLink, btn.iconTex)
        else
            SetFrameBounty(btn, iLink, btn.iconTex)
        end

        local col = (shownItems - 1) % NUM_COLS
        local row = math.floor((shownItems - 1) / NUM_COLS)
        btn:ClearAllPoints()
btn:SetPoint("TOPLEFT", itemsListContainer, "TOPLEFT", col * 185, -row * 40)
        btn:Show()


    end

    local displayedCount = endIndex - startIndex + 1
    local rowCount       = math.ceil(displayedCount / NUM_COLS)
    itemsListContainer:SetHeight(rowCount * 40 + 10)
end

function LoadDungeonDetail(dungeon)
    if not dungeon then return end

    -- Reset forge debug counter for fresh output


    if not Journal_charDB.recacheScheduled then
        Journal_charDB.recacheScheduled = {}
    end

    local currentTime = GetTime()
    if Journal_charDB.viewAllItems then
        local forceRecache = false
        if not Journal_charDB.lastRecacheTime or (currentTime - Journal_charDB.lastRecacheTime) > 5 then
            forceRecache = true
        end
        if forceRecache then
            for _, d in ipairs(_G.dungeonData or {}) do
                if d.name then
                    Journal_charDB.recacheScheduled[d.name] = nil
                    if PreCacheDungeonVersion then
                        PreCacheDungeonVersion(d, nil, true)
                    end
                end
            end
            Journal_charDB.lastRecacheTime = currentTime
        end
    else
        if dungeon.name then
            Journal_charDB.recacheScheduled[dungeon.name] = nil
        end
        if PreCacheDungeonVersion then
            PreCacheDungeonVersion(dungeon, nil, true)
        end
    end

    if ShowBoss then
        ShowBoss(dungeon)
    end
    HideAllItemButtons()
    _G.currentDungeon = dungeon

    -- Clear drop rate cache only when switching to a different dungeon
    if _G.lastLoadedDungeon ~= dungeon.name then
        ClearDungeonDropRateCache(_G.lastLoadedDungeon)
        _G.lastLoadedDungeon = dungeon.name

        -- ʕ •ᴥ•ʔ✿ Invalidate attunement cache when switching dungeons ✿ʕ •ᴥ•ʔ
        uiCache.dungeonAttunement = {}
        uiCache.dungeonAttunementLastUpdate = {}

        -- ʕ •ᴥ•ʔ✿ Also invalidate UIDungeonManagement cache ✿ʕ •ᴥ•ʔ
        if _G.UIDungeonManagement and _G.UIDungeonManagement.InvalidateDungeonAttunementCache then
            _G.UIDungeonManagement.InvalidateDungeonAttunementCache()
        end

        -- ʕ •ᴥ•ʔ✿ Reset difficulty filter when switching to a different dungeon ✿ʕ •ᴥ•ʔ
        if Journal_charDB and Journal_charDB.itemFilters then
            Journal_charDB.itemFilters.difficultyFilter = "all"
            -- Update the UI button to reflect the reset
            local UILayoutManager = GetUILayoutManager()
            if UILayoutManager and mythicFilterButton then
                UILayoutManager.UpdateDifficultyFilterButton(mythicFilterButton)
            end
        end
    end

    DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_open.blp")
    previewFrame:Hide()
    dungeonDetailFrame:Show()

    -- ʕ •ᴥ•ʔ✿ Hide Category 2.0 filter controls when entering dungeon detail ✿ʕ•ᴥ•ʔ
    if dungeonDifficultyFilterButton then
        dungeonDifficultyFilterButton:Hide()
    end
    if dungeonListRefreshButton then
        dungeonListRefreshButton:Hide()
    end

    -- ʕ •ᴥ•ʔ✿ Smart filter: Auto-clear difficulty filter if only one difficulty available ✿ʕ•ᴥ•ʔ
    if not HasMultipleDifficulties(dungeon) then
        if Journal_charDB and Journal_charDB.itemFilters and Journal_charDB.itemFilters.difficultyFilter ~= "all" then
            local previousFilter = Journal_charDB.itemFilters.difficultyFilter
            Journal_charDB.itemFilters.difficultyFilter = "all"

            -- ʕ ◕ᴥ◕ ʔ✿ Show message about auto-clearing filter ✿ʕ ◕ᴥ◕ ʔ
            local availableDifficulties = GetAvailableDifficulties(dungeon)
            ShowSmartFilterMessage(dungeon.name, availableDifficulties)
        end
    end

    ShowDungeonInteriorUI()

    UpdateDungeonTitleWithFilters(dungeon)

    -- Add book icon if dungeon has affix data
    if not dungeonDetailFrame.bookIcon and DUNGEON_AFFIXES[dungeon.name] then
        local bookIcon = dungeonDetailFrame:CreateTexture(nil, "OVERLAY")
        bookIcon:SetSize(24, 24)
        bookIcon:SetPoint("BOTTOMLEFT", dungeonDetailFrame, "BOTTOMLEFT", -40, -55)
        bookIcon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
        bookIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9) -- Crop the texture for better appearance
        dungeonDetailFrame.bookIcon = bookIcon

        -- Add highlight texture
        local bookHighlight = dungeonDetailFrame:CreateTexture(nil, "HIGHLIGHT")
        bookHighlight:SetSize(24, 24)
        bookHighlight:SetPoint("BOTTOMLEFT", dungeonDetailFrame, "BOTTOMLEFT", -40, -55)
        bookHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
        bookHighlight:SetBlendMode("ADD")
        bookHighlight:Hide()
        dungeonDetailFrame.bookHighlight = bookHighlight

        -- Create invisible frame for mouse interaction
        local bookFrame = CreateFrame("Frame", "DJ_MythicAffixFrame", dungeonDetailFrame)
        bookFrame:SetSize(24, 24)
        bookFrame:SetPoint("BOTTOMLEFT", dungeonDetailFrame, "BOTTOMLEFT", -40, -55)
        bookFrame:SetFrameLevel((dungeonDetailFrame:GetFrameLevel() or 0) + 10)
        bookFrame:EnableMouse(true)
        dungeonDetailFrame.bookFrame = bookFrame
        dungeonDetailFrame.currentDungeon = dungeon

        bookFrame:SetScript("OnEnter", function(self)

            -- Show highlight
            if dungeonDetailFrame.bookHighlight then
                dungeonDetailFrame.bookHighlight:Show()
            end

            -- Create custom tooltip with affix description using our dedicated tooltip
            AffixTooltip:SetOwner(self, "ANCHOR_NONE")
            AffixTooltip:ClearAllPoints()
            AffixTooltip:ClearLines()

            local dungeonName = dungeonDetailFrame.currentDungeon and dungeonDetailFrame.currentDungeon.name
            local affixText = DUNGEON_AFFIXES[dungeonName]
            local affixName = DUNGEON_AFFIX_NAMES[dungeonName]

            if affixText then
                -- Set title with custom affix name
                local title = affixName and ("|cFFFFD700" .. affixName .. "|r") or "|cFFFFD700Dungeon Affix|r"
                AffixTooltip:SetText(title, 1, 1, 1, 1, true)
                AffixTooltip:AddLine(" ") -- Empty line for spacing
                AffixTooltip:AddLine(affixText, 1, 1, 1, true) -- White text with word wrap
            else
                AffixTooltip:SetText("|cFFFFD700Dungeon Affix|r", 1, 1, 1)
                AffixTooltip:AddLine("No affix information available", 0.8, 0.8, 0.8)
            end

            -- Position tooltip to the left of the book icon
            AffixTooltip:SetPoint("TOPRIGHT", self, "TOPLEFT", -5, 0)
            AffixTooltip:Show()
        end)

        bookFrame:SetScript("OnLeave", function(self)
            -- Hide highlight
            if dungeonDetailFrame.bookHighlight then
                dungeonDetailFrame.bookHighlight:Hide()
            end
            -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only hide AffixTooltip, don't interfere with other tooltips ✿ʕ•ᴥ•ʔ
            AffixTooltip:Hide()
        end)
    elseif dungeonDetailFrame.bookIcon then
        -- Show/hide and update spell based on current dungeon
        if DUNGEON_AFFIXES[dungeon.name] then
            dungeonDetailFrame.bookIcon:Show()
            dungeonDetailFrame.bookFrame:Show()
            dungeonDetailFrame.currentDungeon = dungeon
            -- Update position in case Val_modelFrame is now available
            dungeonDetailFrame.bookIcon:ClearAllPoints()
            dungeonDetailFrame.bookIcon:SetPoint("BOTTOMLEFT", dungeonDetailFrame, "BOTTOMLEFT", -45, -75)
            dungeonDetailFrame.bookFrame:ClearAllPoints()
            dungeonDetailFrame.bookFrame:SetPoint("BOTTOMLEFT", dungeonDetailFrame, "BOTTOMLEFT", -45, -75)
        else
            dungeonDetailFrame.bookIcon:Hide()
            dungeonDetailFrame.bookFrame:Hide()
        end
    end

    local items = PrepareItemsToShow(dungeon)
    DisplayItemsList(dungeon, nil, items)

    if _G.lastBossNavDungeon ~= dungeon and CreateBossNavigation then
        CreateBossNavigation(dungeonDetailFrame, dungeon)
        _G.lastBossNavDungeon = dungeon
    end
end

local dungeonSearchBox = CreateFrame("EditBox", "DJ_SearchEditBox", previewFrame, "InputBoxTemplate")
dungeonSearchBox:SetSize(150, 20)
dungeonSearchBox:SetPoint("CENTER", previewFrame, "CENTER", -120, 185)
dungeonSearchBox:SetAutoFocus(false)



-- Category filter dropdown
local categoryDropdown = CreateFrame("Frame", "DJ_CategoryDropdown", previewFrame, "UIDropDownMenuTemplate")
categoryDropdown:SetPoint("CENTER", previewFrame, "CENTER", 40, 185)



-- Initialize dropdown settings
Journal_charDB.selectedCategory = Journal_charDB.selectedCategory or "All"

local function CategoryDropdown_OnClick(self)
    Journal_charDB.selectedCategory = self.value
    UIDropDownMenu_SetSelectedID(categoryDropdown, self:GetID())

    -- Store current difficulty filter before switching categories
    local currentDifficultyFilter = Journal_charDB.dungeonListDifficultyFilter or "all"

    -- Update difficulty filter options for new category (only if dungeons are loaded)
    if dungeonButtons and #dungeonButtons > 0 and GetDungeonListDifficultyOptions then
        dungeonListDifficultyOptions = GetDungeonListDifficultyOptions()

        -- Check if current difficulty exists in new category
        local difficultyExistsInCategory = false
        for _, option in ipairs(dungeonListDifficultyOptions) do
            if option.state == currentDifficultyFilter then
                difficultyExistsInCategory = true
                break
            end
        end

        -- Reset to "all" if current difficulty doesn't exist in new category
        if not difficultyExistsInCategory then
            Journal_charDB.dungeonListDifficultyFilter = "all"
            currentDungeonListDifficultyIndex = 1
        else
            -- Keep current difficulty and find its index
            for i, option in ipairs(dungeonListDifficultyOptions) do
                if option.state == currentDifficultyFilter then
                    currentDungeonListDifficultyIndex = i
                    break
                end
            end
        end

        if UpdateDungeonListDifficultyFilterButton then
            UpdateDungeonListDifficultyFilterButton()
        end
    end

    -- Filter dungeons by category and difficulty
    FilterAndSortDungeons()
end

local function CategoryDropdown_Initialize(self, level)
    local info = UIDropDownMenu_CreateInfo()

    -- All Categories option
    info.text = "All Expansions"
    info.value = "All"
    info.func = CategoryDropdown_OnClick
    info.checked = (Journal_charDB.selectedCategory == "All")
    UIDropDownMenu_AddButton(info, level)

    -- CLASSIC option
    info.text = "Classic"
    info.value = "CLASSIC"
    info.func = CategoryDropdown_OnClick
    info.checked = (Journal_charDB.selectedCategory == "CLASSIC")
    UIDropDownMenu_AddButton(info, level)

    -- TBC option
    info.text = "Burning Crusade"
    info.value = "TBC"
    info.func = CategoryDropdown_OnClick
    info.checked = (Journal_charDB.selectedCategory == "TBC")
    UIDropDownMenu_AddButton(info, level)

    -- WOTLK option
    info.text = "Wrath of the Lich King"
    info.value = "WOTLK"
    info.func = CategoryDropdown_OnClick
    info.checked = (Journal_charDB.selectedCategory == "WOTLK")
    UIDropDownMenu_AddButton(info, level)
end

UIDropDownMenu_Initialize(categoryDropdown, CategoryDropdown_Initialize)
UIDropDownMenu_SetWidth(categoryDropdown, 120)
UIDropDownMenu_SetText(categoryDropdown, "All Expansions")

local dungeonButtons = {}

-- ʕ •ᴥ•ʔ✿ Check if dungeon has specific difficulty ✿ʕ•ᴥ•ʔ
function DungeonHasDifficulty(dungeon, difficulty)
    if not dungeon then return false end

    if difficulty == "all" then
        return true
    elseif difficulty == "zones" then
        -- Zones are dungeons that don't have levelreq or have levelreq <= 1
        return (not dungeon.levelreq or dungeon.levelreq <= 1) and (dungeon.items and #dungeon.items > 0)
    elseif difficulty == "raids" then
        -- Raids have dungeon.raid == true
        return (dungeon.raid == true)
    elseif difficulty == "normal" then
        -- Normal Dungeons have levelreq > 1 and dungeon.items
        return (dungeon.levelreq and dungeon.levelreq > 1) and (dungeon.items and #dungeon.items > 0)
    elseif difficulty == "heroic" then
        return (dungeon.items_hc and #dungeon.items_hc > 0) or false
    elseif difficulty == "mythic" then
        return (dungeon.items_my and #dungeon.items_my > 0) or false
    elseif difficulty == "10n" then
        return (dungeon.items_10n and #dungeon.items_10n > 0) or false
    elseif difficulty == "10h" then
        return (dungeon.items_10h and #dungeon.items_10h > 0) or false
    elseif difficulty == "25n" then
        return (dungeon.items_25n and #dungeon.items_25n > 0) or false
    elseif difficulty == "25h" then
        return (dungeon.items_25h and #dungeon.items_25h > 0) or false
    end

    return false
end

-- ʕ •ᴥ•ʔ✿ Dungeon List Difficulty Filter Options ✿ʕ•ᴥ•ʔ
-- ʕ •ᴥ•ʔ✿ Difficulty Filter Options - Dynamic based on expansion and counts ✿ʕ•ᴥ•ʔ
local function GetDungeonListDifficultyOptions()
    -- Early safety check - if called before dungeons are loaded, return fallback
    if not dungeonButtons or #dungeonButtons == 0 then
        return {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
    end

    -- Count dungeons per difficulty type for current category filter
    local selectedCategory = Journal_charDB.selectedCategory or "All"
    local counts = {
        all = 0,
        zones = 0,
        normal = 0,
        heroic = 0,
        mythic = 0,
        raids = 0,
        ["10n"] = 0,
        ["10h"] = 0,
        ["25n"] = 0,
        ["25h"] = 0
    }

    -- Count available dungeons per difficulty type for selected category
    if dungeonButtons and #dungeonButtons > 0 then
        for _, btn in ipairs(dungeonButtons) do
            if btn.dungeon then
                -- Apply category filter
                local dCategory = btn.dungeon.category or "CLASSIC"
                local matchesCategory = (selectedCategory == "All" or dCategory == selectedCategory)

                if matchesCategory then
                    counts.all = counts.all + 1

                    if DungeonHasDifficulty(btn.dungeon, "zones") then
                        counts.zones = counts.zones + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "normal") then
                        counts.normal = counts.normal + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "heroic") then
                        counts.heroic = counts.heroic + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "mythic") then
                        counts.mythic = counts.mythic + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "raids") then
                        counts.raids = counts.raids + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "10n") then
                        counts["10n"] = counts["10n"] + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "10h") then
                        counts["10h"] = counts["10h"] + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "25n") then
                        counts["25n"] = counts["25n"] + 1
                    end
                    if DungeonHasDifficulty(btn.dungeon, "25h") then
                        counts["25h"] = counts["25h"] + 1
                    end
                end
            end
        end
    end

    -- Build options list, only including difficulties with dungeons
    local options = {}

    -- Always include "All" if there are any dungeons
    if counts.all > 0 then
        table.insert(options, { state = "all", text = "All (" .. counts.all .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_01" })
    end

    -- Only include options that have dungeons
    if counts.zones > 0 then
        table.insert(options, { state = "zones", text = "Zones (" .. counts.zones .. ")", icon = "Interface\\Icons\\INV_Misc_Map_01" })
    end
    if counts.normal > 0 then
        table.insert(options, { state = "normal", text = "Normal Dungeons (" .. counts.normal .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Sapphire_01" })
    end
    if counts.heroic > 0 then
        table.insert(options, { state = "heroic", text = "Heroic Dungeons (" .. counts.heroic .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Ruby_01" })
    end
    if counts.mythic > 0 then
        table.insert(options, { state = "mythic", text = "Mythic Dungeons (" .. counts.mythic .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Emerald_01" })
    end
    if counts.raids > 0 then
        table.insert(options, { state = "raids", text = "Raids (" .. counts.raids .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Topaz_01" })
    end
    if counts["10n"] > 0 then
        table.insert(options, { state = "10n", text = "10-Man Normal (" .. counts["10n"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_01" })
    end
    if counts["10h"] > 0 then
        table.insert(options, { state = "10h", text = "10-Man Heroic (" .. counts["10h"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_02" })
    end
    if counts["25n"] > 0 then
        table.insert(options, { state = "25n", text = "25-Man Normal (" .. counts["25n"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Pearl_01" })
    end
    if counts["25h"] > 0 then
        table.insert(options, { state = "25h", text = "25-Man Heroic (" .. counts["25h"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Pearl_02" })
    end

    -- Fallback: if no options available, provide at least "All"
    if #options == 0 then
        options = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
    end

    return options
end

-- ʕ •ᴥ•ʔ✿ Difficulty Filter Variables ✿ʕ•ᴥ•ʔ
local dungeonListDifficultyOptions = {{ state = "all", text = "All", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
local currentDungeonListDifficultyIndex = 1

-- Function to calculate attunable items for a dungeon with caching
-- ʕ •ᴥ•ʔ✿ Calculate attunables for a single difficulty array ✿ʕ•ᴥ•ʔ
local function CalculateDifficultyAttunables(itemArray)
    if not itemArray or #itemArray == 0 then
        return 0, 0
    end

    local totalAttunable = 0
    local attunablesLeft = 0

    for _, itemID in ipairs(itemArray) do
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
        if canAttune == 1 then
            totalAttunable = totalAttunable + 1

            -- Use smart cache for attunement progress to avoid expensive API calls
            local attuneProgress = GetCachedAttunement(itemID)
            if attuneProgress == nil then
                attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                SetCachedAttunement(itemID, attuneProgress)
            end

            if attuneProgress < 100 then
                attunablesLeft = attunablesLeft + 1
            end
        end
    end

    return attunablesLeft, totalAttunable
end

-- ʕ •ᴥ•ʔ✿ Calculate attunables for all difficulties in a dungeon ✿ʕ•ᴥ•ʔ
local function CalculateAllDifficultyAttunables(dungeon)
    if not dungeon or not dungeon.name then
        return {}, 0, 0
    end

    local currentTime = GetTime()
    local cacheKey = dungeon.name .. "_all_difficulties"

    -- Check if we have cached data that's still fresh (cache for 5 seconds)
    local lastUpdate = uiCache.dungeonAttunementLastUpdate[cacheKey]
    if lastUpdate and (currentTime - lastUpdate) < 5 and uiCache.dungeonAttunement[cacheKey] then
        local cached = uiCache.dungeonAttunement[cacheKey]
        return cached.byDifficulty, cached.totalAttunablesLeft, cached.totalAttunable
    end

    local byDifficulty = {}
    local totalAttunablesLeft = 0
    local totalAttunable = 0

    -- Define difficulty arrays to check - ensure base items table exists for zones
    local baseItems = dungeon.items
    if not baseItems then
        -- For dungeons/raids/zones without base items, ensure we have an empty table
        -- This is especially important for zones that might not have items defined
        baseItems = {}
    end

    local difficulties = {
        { key = "normal", array = baseItems, name = "Normal" },
        { key = "heroic", array = dungeon.items_hc, name = "Heroic" },
        { key = "mythic", array = dungeon.items_my, name = "Mythic" },
        { key = "10n", array = dungeon.items_10n, name = "10N" },
        { key = "10h", array = dungeon.items_10h, name = "10H" },
        { key = "25n", array = dungeon.items_25n, name = "25N" },
        { key = "25h", array = dungeon.items_25h, name = "25H" }
    }

    for _, difficulty in ipairs(difficulties) do
        if difficulty.array then
            local attunablesLeft, totalAttunableForDiff = CalculateDifficultyAttunables(difficulty.array)
            if totalAttunableForDiff > 0 then
                byDifficulty[difficulty.key] = {
                    attunablesLeft = attunablesLeft,
                    totalAttunable = totalAttunableForDiff,
                    name = difficulty.name
                }
                totalAttunablesLeft = totalAttunablesLeft + attunablesLeft
                totalAttunable = totalAttunable + totalAttunableForDiff
            end
        end
    end

    -- Cache the results
    uiCache.dungeonAttunement[cacheKey] = {
        byDifficulty = byDifficulty,
        totalAttunablesLeft = totalAttunablesLeft,
        totalAttunable = totalAttunable
    }
    uiCache.dungeonAttunementLastUpdate[cacheKey] = currentTime

    return byDifficulty, totalAttunablesLeft, totalAttunable
end

-- ʕ •ᴥ•ʔ✿ Legacy function for backward compatibility ✿ʕ•ᴥ•ʔ
local function CalculateDungeonAttunables(dungeon)
    if not dungeon or not dungeon.name then
        return 0, 0
    end

    local _, totalAttunablesLeft, totalAttunable = CalculateAllDifficultyAttunables(dungeon)
    return totalAttunablesLeft, totalAttunable
end

-- ʕ •ᴥ•ʔ✿ Color function for attunement status ✿ʕ•ᴥ•ʔ
local function GetColorForAttunement(attunablesLeft, totalAttunable)
    if totalAttunable == 0 then
        return 0.5, 0.5, 0.5 -- Gray for no attunable items
    end

    local percentageLeft = attunablesLeft / totalAttunable

    if percentageLeft == 0 then
        -- 100% attuned - clear green
        return 0, 1, 0
    elseif percentageLeft <= 0.5 then
        -- Less than 50% left to attune - yellow
        return 1, 1, 0
    elseif percentageLeft < 1 then
        -- More than 50% left to attune - red
        return 1, 0.3, 0
    else
        -- 100% left to attune (0% attuned) - deep red
        return 0.8, 0, 0
    end
end

-- ʕ •ᴥ•ʔ✿ Calculate attunement for specific difficulty ✿ʕ•ᴥ•ʔ
local function CalculateDifficultyAttunablesForFilter(dungeon, difficultyFilter)
    if not dungeon then return 0, 0 end

    if difficultyFilter == "all" then
        local _, totalAttunablesLeft, totalAttunable = CalculateAllDifficultyAttunables(dungeon)
        return totalAttunablesLeft, totalAttunable
    elseif difficultyFilter == "zones" then
        -- For zones, only count items if it matches zone criteria
        if DungeonHasDifficulty(dungeon, "zones") then
            return CalculateDifficultyAttunables(dungeon.items or {})
        end
        return 0, 0
    elseif difficultyFilter == "normal" then
        -- For normal dungeons, only count if it matches normal criteria
        if DungeonHasDifficulty(dungeon, "normal") then
            return CalculateDifficultyAttunables(dungeon.items or {})
        end
        return 0, 0
    elseif difficultyFilter == "raids" then
        -- For raids, sum all raid difficulties
        if DungeonHasDifficulty(dungeon, "raids") then
            local _, totalAttunablesLeft, totalAttunable = CalculateAllDifficultyAttunables(dungeon)
            return totalAttunablesLeft, totalAttunable
        end
        return 0, 0
    elseif difficultyFilter == "heroic" then
        return CalculateDifficultyAttunables(dungeon.items_hc or {})
    elseif difficultyFilter == "mythic" then
        return CalculateDifficultyAttunables(dungeon.items_my or {})
    elseif difficultyFilter == "10n" then
        return CalculateDifficultyAttunables(dungeon.items_10n or {})
    elseif difficultyFilter == "10h" then
        return CalculateDifficultyAttunables(dungeon.items_10h or {})
    elseif difficultyFilter == "25n" then
        return CalculateDifficultyAttunables(dungeon.items_25n or {})
    elseif difficultyFilter == "25h" then
        return CalculateDifficultyAttunables(dungeon.items_25h or {})
    end

    return 0, 0
end

-- Function to update attuneable text on a button
local function UpdateAttunableText(btn, dungeon)
    if not btn.attunableText then
        return
    end

    local selectedDifficulty = Journal_charDB.dungeonListDifficultyFilter or "all"
    local totalAttunablesLeft, totalAttunable = CalculateDifficultyAttunablesForFilter(dungeon, selectedDifficulty)

    if totalAttunable > 0 then
        local r, g, b = GetColorForAttunement(totalAttunablesLeft, totalAttunable)
        local color = string.format("|cFF%02X%02X%02X", r * 255, g * 255, b * 255)

        -- ʕ •ᴥ•ʔ✿ Create clean display text showing only total (difficulty breakdown shown in tooltip) ✿ʕ •ᴥ•ʔ
        local displayText = color .. totalAttunablesLeft .. "/" .. totalAttunable .. " Attunable|r"

        btn.attunableText:SetText(displayText)
        btn.attunableText:Show()
    else
        btn.attunableText:Hide()
    end
end

-- Function to refresh all attuneable text on dungeon buttons
function RefreshAllAttunableText()
    -- Invalidate cache before refreshing to ensure fresh data
    InvalidateDungeonAttunementCache()

    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            UpdateAttunableText(btn, btn.dungeon)
        end
    end
end

-- Debounce timer for sorting to prevent excessive calls
local sortDebounceTimer = nil
local lastSortTime = 0

-- ʕ •ᴥ•ʔ✿ Function to sort dungeon buttons by attunement percentage with debouncing ✿ʕ•ᴥ•ʔ
function SortDungeonsByAttunement()
    if #dungeonButtons == 0 then return end

    local currentTime = GetTime()

    -- Debounce sorting calls to prevent excessive recalculation (minimum 1 second between sorts)
    if (currentTime - lastSortTime) < 1 then
        if sortDebounceTimer then
            sortDebounceTimer:Cancel()
        end
        sortDebounceTimer = C_Timer.After(1, function()
            SortDungeonsByAttunement()
        end)
        return
    end

    lastSortTime = currentTime

    -- Use the unified filtering and sorting function which already handles both filtering and sorting
    FilterAndSortDungeons()
end

function UpdateDungeonNames()
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.btnText and btn.dungeon then
            local newText = (Journal_charDB.showDungeonName and btn.dungeon.name or "")
            btn.btnText:SetText(newText)
        end
    end
    -- Also refresh attuneable text when updating dungeon names
    RefreshAllAttunableText()
    -- Sort dungeons by attunement progress
    SortDungeonsByAttunement()
end

do
    local count = #dungeonData
    if count > 0 then
        local rows = math.ceil(count / numDungeonCols)
        gridContainer:SetHeight(rows * dungeonButtonHeight)
    end

    -- Create buttons in original order - will be sorted later when data is available
    for i, d in ipairs(dungeonData) do
        local btn = CreateFrame("Button", nil, gridContainer)
        btn:SetSize(dungeonButtonWidth, dungeonButtonHeight)
        btn:SetNormalTexture("")
        btn:SetPushedTexture("")
        btn:SetHighlightTexture("")

        local tex = btn:CreateTexture(nil, "BACKGROUND")
        tex:SetAllPoints(btn)
        tex:SetTexture(d.icon)
        tex:SetTexCoord(0, 0.6, 0, 0.6)
        btn.tex = tex

        local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        btnText:SetPoint("BOTTOM", btn, "BOTTOM", 0, 20)
        btnText:SetText(d.name)
        btn.btnText = btnText

        btn.dungeon = d
        local col = (i - 1) % numDungeonCols
        local row = math.floor((i - 1) / numDungeonCols)
        local xOffset = col * dungeonButtonWidth
        local yOffset = -row * dungeonButtonHeight
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOffset, yOffset)

        btn:SetScript("OnClick", function()
            -- Store tooltip state before making changes
            local tooltipWasShown = GameTooltip:IsShown() and GameTooltip:GetOwner() == btn

            if PreCacheDungeonVersion then
                PreCacheDungeonVersion(d)
            end
            LoadDungeonDetail(d)

            -- Restore tooltip if it was shown before the click
            if tooltipWasShown then
                GameTooltip:SetOwner(btn, "ANCHOR_RIGHT")
                GameTooltip:SetText(d.name)

                -- ʕ ● ᴥ ●ʔ✿ Show total item count first ✿ʕ ● ᴥ ●ʔ
                local totalItems = 0
                if d.items then totalItems = totalItems + #d.items end
                if d.items_hc then totalItems = totalItems + #d.items_hc end
                if d.items_my then totalItems = totalItems + #d.items_my end
                if d.items_10n then totalItems = totalItems + #d.items_10n end
                if d.items_10h then totalItems = totalItems + #d.items_10h end
                if d.items_25n then totalItems = totalItems + #d.items_25n end
                if d.items_25h then totalItems = totalItems + #d.items_25h end

                if totalItems > 0 then
                    GameTooltip:AddLine(string.format("Total Items: %d", totalItems), 0.8, 0.8, 1, true)
                end

                -- ʕ ● ᴥ ●ʔ✿ Show attunement stats with difficulty breakdown ✿ʕ ● ᴥ ●ʔ
                if CalculateAllDifficultyAttunables then
                    local byDifficulty, totalAttunablesLeft, totalAttunable = CalculateAllDifficultyAttunables(d)
                    if totalAttunable and totalAttunable > 0 then
                        local percentLeft = (totalAttunablesLeft / totalAttunable) * 100
                        GameTooltip:AddLine(string.format("Total Attunes Remaining: %d/%d (%.0f%%)", totalAttunablesLeft, totalAttunable, percentLeft), 1, 0.8, 0, true)

                        -- Show breakdown by difficulty if multiple difficulties exist
                        local diffCount = 0
                        for _ in pairs(byDifficulty) do diffCount = diffCount + 1 end

                        if diffCount > 1 then
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("|cFF87CEEBDifficulty Breakdown:|r")

                            -- Sort difficulties for display
                            local sortedDifficulties = {}
                            for diffKey, diffData in pairs(byDifficulty) do
                                table.insert(sortedDifficulties, {
                                    key = diffKey,
                                    data = diffData,
                                    order = ({normal=1, heroic=2, mythic=3, ["10n"]=4, ["10h"]=5, ["25n"]=6, ["25h"]=7})[diffKey] or 99
                                })
                            end
                            table.sort(sortedDifficulties, function(a, b) return a.order < b.order end)

                            for _, diff in ipairs(sortedDifficulties) do
                                local diffPercentLeft = (diff.data.attunablesLeft / diff.data.totalAttunable) * 100
                                local r, g, b = GetColorForAttunement(diff.data.attunablesLeft, diff.data.totalAttunable)
                                GameTooltip:AddLine(string.format("  %s: %d/%d (%.0f%%)", diff.data.name, diff.data.attunablesLeft, diff.data.totalAttunable, diffPercentLeft), r, g, b, true)
                            end
                        end
                    end
                end

                 -- ʕ •ᴥ•ʔ✿ Show dungeon level requirement ✿ʕ •ᴥ•ʔ
                 if d.levelreq then
                    GameTooltip:AddLine("\n\nDungeon Challenge Max Level: " .. d.levelreq, 0.8, 0.8, 1, true)
                end

                GameTooltip:Show()
            end
        end)

        btn:SetScript("OnEnter", function(self)
            self.tex:SetVertexColor(0.7, 0.7, 0.7)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(d.name)

            -- ʕ ● ᴥ ●ʔ✿ Show total item count first ✿ʕ ● ᴥ ●ʔ
            local totalItems = 0
            if d.items then totalItems = totalItems + #d.items end
            if d.items_hc then totalItems = totalItems + #d.items_hc end
            if d.items_my then totalItems = totalItems + #d.items_my end
            if d.items_10n then totalItems = totalItems + #d.items_10n end
            if d.items_10h then totalItems = totalItems + #d.items_10h end
            if d.items_25n then totalItems = totalItems + #d.items_25n end
            if d.items_25h then totalItems = totalItems + #d.items_25h end

            if totalItems > 0 then
                GameTooltip:AddLine(string.format("Total Items: %d", totalItems), 0.8, 0.8, 1, true)
            end

            -- ʕ ● ᴥ ●ʔ✿ Show attunement stats with difficulty breakdown ✿ʕ ● ᴥ ●ʔ
            if CalculateAllDifficultyAttunables then
                local byDifficulty, totalAttunablesLeft, totalAttunable = CalculateAllDifficultyAttunables(d)
                if totalAttunable and totalAttunable > 0 then
                    local percentLeft = (totalAttunablesLeft / totalAttunable) * 100
                    GameTooltip:AddLine(string.format("Total Attunes Remaining: %d/%d (%.0f%%)", totalAttunablesLeft, totalAttunable, percentLeft), 1, 0.8, 0, true)

                    -- Show breakdown by difficulty if multiple difficulties exist
                    local diffCount = 0
                    for _ in pairs(byDifficulty) do diffCount = diffCount + 1 end

                    if diffCount > 1 then
                        GameTooltip:AddLine(" ")
                        GameTooltip:AddLine("|cFF87CEEBDifficulty Breakdown:|r")

                        -- Sort difficulties for display
                        local sortedDifficulties = {}
                        for diffKey, diffData in pairs(byDifficulty) do
                            table.insert(sortedDifficulties, {
                                key = diffKey,
                                data = diffData,
                                order = ({normal=1, heroic=2, mythic=3, ["10n"]=4, ["10h"]=5, ["25n"]=6, ["25h"]=7})[diffKey] or 99
                            })
                        end
                        table.sort(sortedDifficulties, function(a, b) return a.order < b.order end)

                        for _, diff in ipairs(sortedDifficulties) do
                            local diffPercentLeft = (diff.data.attunablesLeft / diff.data.totalAttunable) * 100
                            local r, g, b = GetColorForAttunement(diff.data.attunablesLeft, diff.data.totalAttunable)
                            GameTooltip:AddLine(string.format("  %s: %d/%d (%.0f%%)", diff.data.name, diff.data.attunablesLeft, diff.data.totalAttunable, diffPercentLeft), r, g, b, true)
                        end
                    end
                end
            end

             -- ʕ •ᴥ•ʔ✿ Show dungeon level requirement ✿ʕ •ᴥ•ʔ
             if d.levelreq then
                GameTooltip:AddLine("\n\nDungeon Challenge Max Level: " .. d.levelreq, 0.8, 0.8, 1, true)
            end

            GameTooltip:Show()
        end)

        btn:SetScript("OnLeave", function(self)
            self.tex:SetVertexColor(1, 1, 1)
            GameTooltip:Hide()
        end)

        -- Add attuneable items text
        local attunableText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        attunableText:SetPoint("BOTTOM", btn, "BOTTOM", 0, 8)
        attunableText:SetTextColor(1, 1, 1)
        btn.attunableText = attunableText

        -- Update the attuneable text for this dungeon
        UpdateAttunableText(btn, d)

        table.insert(dungeonButtons, btn)
    end

    -- Calculate attuneable text for all dungeons after buttons are created
    C_Timer.After(0.1, function()
        RefreshAllAttunableText()
        FilterAndSortDungeons()

        -- Update difficulty filter options now that dungeons are loaded
        dungeonListDifficultyOptions = GetDungeonListDifficultyOptions()
        if InitializeDungeonListDifficultyFilter then
            InitializeDungeonListDifficultyFilter()
        end

        local UILayoutManager = _G.TheJournal_UILayoutManager
        if UILayoutManager and UILayoutManager.Initialize then
            UILayoutManager.Initialize()
        end
    end)
end

HideDungeonInteriorUI()
previewFrame:Show()

    -- ʕ •ᴥ•ʔ✿ Show Category 2.0 filter controls on preview frame ✿ʕ•ᴥ•ʔ
    if dungeonDifficultyFilterButton then
        dungeonDifficultyFilterButton:Show()
    end
    if dungeonListRefreshButton then
        dungeonListRefreshButton:Show()
    end

-- Hide quest icons appropriately - preview icon hidden on preview, random icon hidden initially
if previewQuestIcon then
    previewQuestIcon:Hide() -- Hide on preview frame (will show in dungeon detail)
end
if randomQuestIcon then
    randomQuestIcon:Hide() -- Hide initially, only show in dungeon detail
end

-- ʕ •ᴥ•ʔ✿ Show friends frame on initial load with proper preview positioning ✿ʕ•ᴥ•ʔ
if friendsFrame then
    friendsFrame:ClearAllPoints()
    friendsFrame:SetPoint("TOPRIGHT", _G.previewFrame, "TOPLEFT", -10, -20)
    friendsFrame:SetHeight(380)
    -- ʕ ◕ᴥ◕ ʔ✿ Don't auto-show, let user toggle ✿ʕ ◕ᴥ◕ ʔ
    -- friendsFrame:Show()
end

-- Refresh attuneable text when preview frame is shown
RefreshAllAttunableText()

-- Create small paper report button next to back button (properly aligned with main frame)
local reportButton = CreateFrame("Button", "DJ_MainReportButton", DungeonJournalFrame)
reportButton:SetSize(22, 22)
reportButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", -32, -8)

-- Create button background
local reportBg = reportButton:CreateTexture(nil, "BACKGROUND")
reportBg:SetAllPoints(reportButton)
reportBg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
reportBg:SetTexCoord(0, 0.625, 0, 0.6875)

-- Create button icon
local reportIcon = reportButton:CreateTexture(nil, "ARTWORK")
reportIcon:SetSize(16, 16)
reportIcon:SetPoint("CENTER", reportButton, "CENTER")
reportIcon:SetTexture("Interface\\Icons\\INV_Scroll_08")

-- Create highlight texture
local reportHighlight = reportButton:CreateTexture(nil, "HIGHLIGHT")
reportHighlight:SetAllPoints(reportButton)
reportHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
reportHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
reportHighlight:SetBlendMode("ADD")

-- Button functionality
reportButton:SetScript("OnClick", function()
    PrintAttunementReport()
end)

reportButton:SetScript("OnEnter", function(self)
    local reportData, totalLeft, totalAttunable = GenerateAttunementReport()
    if type(reportData) == "string" then
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:SetText("|cFFFFD700Attunement Report|r")
        GameTooltip:AddLine(reportData, 1, 1, 1)
        GameTooltip:Show()
        return
    end

    GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
    GameTooltip:SetText("|cFFFFD700Attunement Report|r")
    GameTooltip:AddLine(" ")

    -- Overall progress with progress bar effect
    local overallPercent = 0
    if totalAttunable > 0 then
        overallPercent = ((totalAttunable - totalLeft) / totalAttunable) * 100
    end
    GameTooltip:AddLine("|cFF00FF00Overall: " .. (totalAttunable - totalLeft) .. "/" .. totalAttunable .. " (" .. string.format("%.1f", overallPercent) .. "%)|r")
    GameTooltip:AddLine(" ")

    -- Show top 5 dungeons needing attention
    local count = 0
    for i, data in ipairs(reportData) do
        if count >= 20 then break end
        if data.totalAttunable > 0 then
            count = count + 1
            local percentLeft = data.attunementPercentage * 100
            local color = "|cFF808080"
            local status = "No Items"

            if data.totalAttunable == 0 then
                color = "|cFF808080"
                status = "No Items"
            elseif data.attunementPercentage == 0 then
                color = "|cFF00FF00"
                status = "Complete"
            elseif data.attunementPercentage <= 0.5 then
                color = "|cFFFFFF00"
                status = "Good Progress"
            elseif data.attunementPercentage < 1 then
                color = "|cFFFF4500"
                status = "Needs Work"
            else
                color = "|cFFCC0000"
                status = "Not Started"
            end

            GameTooltip:AddDoubleLine(
                color .. data.name .. "|r",
                color .. data.attunablesLeft .. "/" .. data.totalAttunable .. " (" .. string.format("%.0f", percentLeft) .. "%)|r"
            )
        end
    end

    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cFF87CEEBClick to print full report to chat|r")
    GameTooltip:AddLine("|cFF87CEEBOr use: /dj report|r")
    GameTooltip:Show()
end)

reportButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Slash command
SLASH_DJREPORT1 = "/dj"
SlashCmdList["DJREPORT"] = function(msg)
    msg = string.lower((msg or ""):match("^%s*(.-)%s*$"))
    if msg == "report" then
        PrintAttunementReport()
    elseif msg == "debug" then
        _G.debug = not _G.debug
        print("|cFFFFD700[DJ Debug]|r Debug mode " .. (_G.debug and "ENABLED" or "DISABLED"))
        if _G.debug then
            print("|cFF00FF00[DJ DEBUG]|r Debug test message - this confirms debug is working!")
        end
    elseif msg == "factiontooltip" then
        -- ʕ ● ᴥ ●ʔ✿ Initialize setting if not set ✿ʕ ● ᴥ ●ʔ
        if Journal_charDB.showFactionTooltips == nil then
            Journal_charDB.showFactionTooltips = true
        end

        Journal_charDB.showFactionTooltips = not Journal_charDB.showFactionTooltips
        local status = Journal_charDB.showFactionTooltips and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"
        print("|cFFFFD700[DJ Faction]|r Faction tooltips " .. status)

        -- ʕ ◕ᴥ◕ ʔ✿ Debug info ✿ʕ ◕ᴥ◕ ʔ
        print("|cFF87CEEB[DJ Debug]|r FactionTooltipEnhancement available: " .. tostring(_G.FactionTooltipEnhancement ~= nil))
        print("|cFF87CEEB[DJ Debug]|r hashFactionItems available: " .. tostring(_G.hashFactionItems ~= nil))
        if _G.hashFactionItems then
            local count = 0
            for _ in pairs(_G.hashFactionItems) do count = count + 1 end
            print("|cFF87CEEB[DJ Debug]|r hashFactionItems has " .. count .. " entries")
        end
    elseif msg == "clearcache" then
        if _G.Journal_FriendCache then
            _G.Journal_FriendCache.friends = {}
            -- Don't clear saved friends data, only the temporary cache
            print("|cFFFFD700[DJ Cache]|r Cleared friends cache (persistent data preserved)")
            local UIFriendsManager = _G.TheJournal_UIFriendsManager
            if UIFriendsManager then
                UIFriendsManager.UpdateAttunementFriendsDisplay()
            end
        end
    elseif msg == "refresh" then
        -- ʕ •ᴥ•ʔ✿ Refresh dungeon list via slash command ✿ʕ•ᴥ•ʔ
        if OnDungeonListRefreshClick then
            OnDungeonListRefreshClick()
        else
            print("|cFFFF0000[DJ Refresh]|r Refresh function not available")
        end
    elseif msg == "showcache" then
        if _G.Journal_FriendCache and _G.Journal_FriendCache.friends then
            local count = 0
            for playerName, data in pairs(_G.Journal_FriendCache.friends) do
                count = count + 1
            end
            print("|cFFFFD700[DJ Cache]|r " .. count .. " friends in cache:")
            for playerName, data in pairs(_G.Journal_FriendCache.friends) do
                local timeDiff = GetTime() - (data.timestamp or 0)
                local age = "Unknown"
                if timeDiff < 3600 then
                    age = math.floor(timeDiff / 60) .. "m ago"
                elseif timeDiff < 86400 then
                    age = math.floor(timeDiff / 3600) .. "h ago"
                else
                    age = math.floor(timeDiff / 86400) .. "d ago"
                end
                print("|cFF87CEEB  " .. playerName .. "|r (ClassID:" .. (data.classId or "Unknown") .. ") - " .. (data.percentage or 0) .. "% - " .. age)
            end
        end
    elseif msg:find("^hide ") then
        local playerName = msg:match("hide (.+)")
        if playerName then
            playerName = playerName:gsub("^%l", string.upper) -- Capitalize first letter
            if _G.HidePlayer then
                _G.HidePlayer(playerName, true)
            else
                print("|cFFFF0000[DJ Cache]|r Hide function not available")
            end
        end
    elseif msg:find("^unhide ") then
        local playerName = msg:match("unhide (.+)")
        if playerName then
            playerName = playerName:gsub("^%l", string.upper) -- Capitalize first letter
            if _G.HidePlayer then
                _G.HidePlayer(playerName, false)
            else
                print("|cFFFF0000[DJ Cache]|r Hide function not available")
            end
        end
    elseif msg == "" then
        -- Open the dungeon journal
        if DungeonJournalFrame then
            if DungeonJournalFrame:IsShown() then
                DungeonJournalFrame:Hide()
            else
                DungeonJournalFrame:Show()
            end
        end
    else
        print("|cFFFFD700[Dungeon Journal]|r Available commands:")
        print("|cFF87CEEB/dj|r - Toggle Dungeon Journal")
        print("|cFF87CEEB/tj|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/j|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/ej|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/dj report|r - Show attunement progress report")
        print("|cFF87CEEB/dj clearcache|r - Clear friends cache")
        print("|cFF87CEEB/dj showcache|r - Show cached friends")
        print("|cFF87CEEB/dj hide <name>|r - Hide player from leaderboard")
        print("|cFF87CEEB/dj unhide <name>|r - Unhide player from leaderboard")
        print("|cFF87CEEB/dj factiontooltip|r - Toggle faction tooltips")
        print("|cFF87CEEB/dj testboe <item>|r - Test if friends need BOE item")
        print("|cFF87CEEB/testboe <item>|r - Same as above (standalone command)")
        print("|cFF87CEEB|r")
        print("|cFF87CEEB[Auto BOE Testing]|r When hovering over BOE items:")
        print("|cFF87CEEB• Automatically queries friends if they need the item|r")
        print("|cFF87CEEB• Whispers friends who need it with FULL item links|r")
        print("|cFF87CEEB• Preserves affix and forge level information|r")
        print("|cFF87CEEB• Shows responses in tooltip with smart throttling|r")
        print("|cFF87CEEB• Works with item names, IDs, or links|r")
    end
end

-- Additional command registrations for shortcuts
SLASH_DJ2 = "/tj"
SLASH_DJ3 = "/j"
SLASH_DJ4 = "/ej"
SlashCmdList["DJ"] = function(msg)
    msg = string.lower((msg or ""):match("^%s*(.-)%s*$"))
    if msg == "report" then
        PrintAttunementReport()
    elseif msg == "friends" then
        if _G.AttunementFriendsFrame then
            if _G.AttunementFriendsFrame:IsShown() then
                _G.AttunementFriendsFrame:Hide()
            else
                _G.AttunementFriendsFrame:Show()
            end
        end
    elseif msg == "share" then
        SendAttunementData()
    elseif msg == "request" then
        RequestAttunementData()
    elseif msg == "debug" then
        _G.debug = not _G.debug
        print("|cFFFFD700[DJ Debug]|r Debug mode " .. (_G.debug and "ENABLED" or "DISABLED"))
        if _G.debug then
            print("|cFF00FF00[DJ DEBUG]|r Debug test message - this confirms debug is working!")
        end
    elseif msg == "factiontooltip" then
        -- ʕ ● ᴥ ●ʔ✿ Initialize setting if not set ✿ʕ ● ᴥ ●ʔ
        if Journal_charDB.showFactionTooltips == nil then
            Journal_charDB.showFactionTooltips = true
        end

        Journal_charDB.showFactionTooltips = not Journal_charDB.showFactionTooltips
        local status = Journal_charDB.showFactionTooltips and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"
        print("|cFFFFD700[DJ Faction]|r Faction tooltips " .. status)

        -- ʕ ◕ᴥ◕ ʔ✿ Debug info ✿ʕ ◕ᴥ◕ ʔ
        print("|cFF87CEEB[DJ Debug]|r FactionTooltipEnhancement available: " .. tostring(_G.FactionTooltipEnhancement ~= nil))
        print("|cFF87CEEB[DJ Debug]|r hashFactionItems available: " .. tostring(_G.hashFactionItems ~= nil))
        if _G.hashFactionItems then
            local count = 0
            for _ in pairs(_G.hashFactionItems) do count = count + 1 end
            print("|cFF87CEEB[DJ Debug]|r hashFactionItems has " .. count .. " entries")
        end
    elseif msg == "testfaction" then
        -- ʕ ◕ᴥ◕ ʔ✿ Test faction tooltip with known Alliance item (ID 60) ✿ʕ ◕ᴥ◕ ʔ
        local testItemID = 60 -- Known Alliance item
        local testItemLink = "item:" .. testItemID
        print("|cFF87CEEB[DJ Faction Test]|r Testing faction tooltip for item " .. testItemID)

        -- Test the faction detection
        local factionType = _G.FactionTooltipEnhancement and _G.FactionTooltipEnhancement.GetItemFaction(testItemID)
        if factionType then
            print("|cFF87CEEB[DJ Faction Test]|r Item " .. testItemID .. " is faction " .. factionType)
        else
            print("|cFF87CEEB[DJ Faction Test]|r Item " .. testItemID .. " is not faction-specific")
        end

        -- Test the tooltip processing
        if _G.FactionTooltipEnhancement and _G.FactionTooltipEnhancement.ProcessFactionTooltip then
            print("|cFF87CEEB[DJ Faction Test]|r Calling ProcessFactionTooltip manually...")
            _G.FactionTooltipEnhancement.ProcessFactionTooltip(GameTooltip, testItemLink)
        else
            print("|cFF87CEEB[DJ Faction Test]|r FactionTooltipEnhancement.ProcessFactionTooltip not available")
        end

    elseif msg:find("^testboe") then
        print("|cFF00FFFF[Manual BOE DEBUG]|r Processing testboe command with message: " .. tostring(msg))

        local originalItemLink = nil
        local itemLink = nil
        local itemName = nil
        local itemID = nil

        -- First, try to extract item ID from any format in the message
        local linkInMsg = msg:match("|c%x+|h%[.-%]|h|r")
        if linkInMsg then
            itemID = CustomExtractItemId(linkInMsg)
        else
            itemID = tonumber(msg:match("testboe%s+(%d+)"))
        end
        print("|cFF00FFFF[Manual BOE DEBUG]|r Extracted item ID: " .. tostring(itemID))

        -- If we have an item ID, check if we captured the original link before chat processing
        if itemID and _G.ORIGINAL_ITEM_LINKS and _G.ORIGINAL_ITEM_LINKS[itemID] then
            originalItemLink = _G.ORIGINAL_ITEM_LINKS[itemID]
            itemLink = originalItemLink
            print("|cFF00FF00[Manual BOE]|r Using PRE-CAPTURED original item link: " .. originalItemLink)
            -- Clear it after use to prevent stale data
            _G.ORIGINAL_ITEM_LINKS[itemID] = nil
        else
            print("|cFF00FFFF[Manual BOE DEBUG]|r No pre-captured link found for ID " .. tostring(itemID))
            if _G.ORIGINAL_ITEM_LINKS then
                print("|cFF00FFFF[Manual BOE DEBUG]|r Available pre-captured IDs:")
                for id, link in pairs(_G.ORIGINAL_ITEM_LINKS) do
                    print("|cFF00FFFF[Manual BOE DEBUG]|r   ID " .. id .. ": " .. link)
                end
            end
        end

        -- If no pre-captured link, try to extract from current message (likely already processed)
        if not originalItemLink then
            originalItemLink = msg:match("|c%x+|h%[.-%]|h|r")
            if originalItemLink then
                itemID = CustomExtractItemId(originalItemLink)
                itemLink = originalItemLink
                print("|cFFFFFF00[Manual BOE]|r Found item link in message (may be processed): " .. originalItemLink)
            end
        end

        -- If still no link, try to parse item name for basic lookup
        if not itemID then
            local bracketName = msg:match("%[(.-)%]")
            if bracketName then
                itemName = bracketName
            else
                itemName = msg:match("testboe%s+(.+)")
            end

            -- Try to get basic item info (this will NOT have affixes/forge data)
            if itemName then
                local foundName, foundLink = GetItemInfo(itemName)
                            if foundLink then
                itemLink = foundLink
                itemID = CustomExtractItemId(foundLink)
                itemName = foundName
                    print("|cFFFF0000[Manual BOE WARNING]|r Using basic item link (NO AFFIXES): " .. foundLink)
                else
                    print("|cFFFFD700[DJ BOE Test]|r Searching for item: " .. itemName)
                end
            end
        end

        if not itemLink and not itemName then
            print("|cFFFFD700[DJ BOE Test]|r Usage: /dj testboe <item>")
            print("|cFFFFD700[DJ BOE Test]|r Examples:")
            print("|cFFFFD700[DJ BOE Test]|r   /dj testboe [Brimstone Igniter]")
            print("|cFFFFD700[DJ BOE Test]|r   /dj testboe Brimstone Igniter")
            print("|cFFFFD700[DJ BOE Test]|r   /dj testboe 19019")
            print("|cFFFFD700[DJ BOE Test]|r This will check if friends need this item for attunement")
            return
        end

        -- Try to parse as item ID if it's a number
        if not itemID and itemName and tonumber(itemName) then
            itemID = tonumber(itemName)
            local foundName, foundLink = GetItemInfo(itemID)
            if foundLink then
                itemLink = foundLink
                itemName = foundName
            else
                itemLink = "item:" .. itemID
            end
        end

        -- Final fallback - use what we have
        if not itemID and itemLink then
            itemID = CustomExtractItemId(itemLink)
        end

        local displayName = itemName or ("Item " .. (itemID or "Unknown"))
        print("|cFFFFD700[DJ BOE Test]|r Checking if friends need " .. displayName .. "...")

                 -- Query friends about this item
         if _G.QueryItemFromFriends and itemID then
             local linkToQuery = originalItemLink or itemLink or ("item:" .. itemID)
             _G.QueryItemFromFriends(itemID, linkToQuery)
             print("|cFF00FF00[DJ BOE Test]|r Sent query to online friends/guildies about " .. displayName)

             -- Set up a timer to check for responses and whisper friends who need it
             local function CheckResponsesAndWhisper()
                 if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
                     local friendsWhoNeed = {}
                     local friendsWhoCanUpgrade = {}

                     for friendName, response in pairs(_G.ITEM_QUERY_RESPONSES[itemID]) do
                         -- Check recent responses (within last 10 seconds for manual test)
                         if GetTime() - response.timestamp < 10 then
                             -- ALWAYS use the stored full item link (with affixes/forge level) - this is the original tested link
                             local fullItemLink = _G.QUERIED_ITEM_LINKS and _G.QUERIED_ITEM_LINKS[itemID]
                             if not fullItemLink then
                                 -- Only fallback if we somehow don't have the stored link
                                 fullItemLink = itemLink or ("item:" .. itemID)
                                 print("|cFFFF0000[Manual BOE WARNING]|r Using fallback link instead of stored full link for " .. (displayName or itemID))
                             end

                             if response.needsItem then
                                 table.insert(friendsWhoNeed, friendName)
                                 SendChatMessage("Hey! I have " .. fullItemLink .. " - you need this for attunement right?", "WHISPER", nil, friendName)
                                 print("|cFF00FF00[Manual BOE]|r Whispered " .. friendName .. " about " .. displayName .. " (using stored full link)")
                             elseif response.canUpgrade then
                                 local forgeText = ""
                                 if response.currentForge == 1 then forgeText = " (Titanforged)"
                                 elseif response.currentForge == 2 then forgeText = " (Warforged)"
                                 elseif response.currentForge == 3 then forgeText = " (Lightforged)"
                                 end
                                 table.insert(friendsWhoCanUpgrade, friendName)
                                 SendChatMessage("I have " .. fullItemLink .. " if you want to upgrade your" .. forgeText .. " version", "WHISPER", nil, friendName)
                                 print("|cFFFFFF00[Manual BOE]|r Whispered " .. friendName .. " about upgrade opportunity (using stored full link)")
                             end
                         end
                     end

                     if #friendsWhoNeed > 0 or #friendsWhoCanUpgrade > 0 then
                         print("|cFF00FF00[Manual BOE Results]|r Whispered " .. (#friendsWhoNeed + #friendsWhoCanUpgrade) .. " friends about " .. displayName)
                     else
                         print("|cFF888888[Manual BOE Results]|r No friends need " .. displayName .. " (or no responses yet)")
                     end
        else
                     print("|cFF888888[Manual BOE Results]|r No responses received for " .. displayName .. " yet")
                 end
             end

             -- Store the item link for use in whispers - ONLY store if we have the original
             if originalItemLink then
                 _G.QUERIED_ITEM_LINKS = _G.QUERIED_ITEM_LINKS or {}
                 _G.QUERIED_ITEM_LINKS[itemID] = originalItemLink
                 print("|cFF00FF00[Manual BOE]|r Stored ORIGINAL item link with affixes/forge data for ID " .. itemID)
             elseif itemLink then
                 -- Warn that we're using a basic link without affix data
                 _G.QUERIED_ITEM_LINKS = _G.QUERIED_ITEM_LINKS or {}
                 _G.QUERIED_ITEM_LINKS[itemID] = itemLink
                 print("|cFFFF0000[Manual BOE WARNING]|r Stored BASIC item link (NO AFFIXES) for ID " .. itemID .. " - friends will not see forge/affix data!")
             else
                 print("|cFFFF0000[Manual BOE ERROR]|r No item link available to store for ID " .. (itemID or "unknown"))
             end

             -- Check for responses after 3 seconds
             C_Timer.After(3, CheckResponsesAndWhisper)
         else
             print("|cFFFF0000[DJ BOE Test]|r Could not query item: " .. tostring(itemLink or itemName or "Unknown"))
        end
    elseif msg == "" then
        if DungeonJournalFrame:IsShown() then
            HideJournal()
        else
            ShowJournal()
        end
    else
        print("|cFFFFD700[Dungeon Journal]|r Available commands:")
        print("|cFF87CEEB/dj|r - Toggle Dungeon Journal")
        print("|cFF87CEEB/tj|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/j|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/ej|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/dj report|r - Show attunement progress report")
        print("|cFF87CEEB/dj friends|r - Toggle friends attunement panel")
        print("|cFF87CEEB/dj share|r - Share your attunement progress (guild/party/friends)")
        print("|cFF87CEEB/dj request|r - Request attunement data (guild/party/friends)")
        print("|cFF87CEEB/dj debug|r - Toggle debug mode for BOE tooltips")
        print("|cFF87CEEB/dj factiontooltip|r - Toggle faction tooltips")
        print("|cFF87CEEB/dj testfaction|r - Test faction tooltip system")
        print("|cFF87CEEB/dj testboe [Item Link]|r - Check if friends need BOE item")
    end
end

-- Removed separate testboe command - now integrated into main /dj command

-- Create the keybind function
function ToggleJournal()
    if DungeonJournalFrame:IsShown() then
        HideJournal()
    else
        ShowJournal()
    end
end

-- todo
-- Event handler for cache invalidation when items are attuned
local smartCacheFrame = CreateFrame("Frame")
smartCacheFrame:RegisterEvent("CHAT_MSG_SYSTEM")
smartCacheFrame:SetScript("OnEvent", function(self, event, message)
    -- Watch for attunement completion messages and invalidate cache
    if event == "CHAT_MSG_SYSTEM" and message then
        -- Look for attunement-related messages (this may need adjustment based on actual messages)
        if message:find("attuned") or message:find("Attunement") then
            -- For now, we'll do a simple cache refresh - could be made smarter
            -- by parsing the message to extract specific item IDs
            smartCache.lastUpdate = GetTime()
        end
    end
end)

_G.DungeonJournalFrame = DungeonJournalFrame
_G.LoadDungeonDetail   = LoadDungeonDetail
_G.UpdateDungeonNames  = UpdateDungeonNames
_G.RefreshAllAttunableText = RefreshAllAttunableText
_G.SortDungeonsByAttunement = SortDungeonsByAttunement

-- Add slash command for debugging cache performance (placed after all variables are declared)
SLASH_DJCACHE1 = "/djcache"
SlashCmdList["DJCACHE"] = function()
    print("|cFFFFD700[Cache Performance Debug]|r")

    -- Count dungeon attunement cache entries
    local dungeonCacheCount = 0
    if uiCache and uiCache.dungeonAttunement then
        for _ in pairs(uiCache.dungeonAttunement) do
            dungeonCacheCount = dungeonCacheCount + 1
        end
    end

    -- Count prepared items cache entries and show breakdown by dungeon
    local itemsCacheCount = 0
    local dungeonBreakdown = {}
    if preparedItemsCache then
        for key, _ in pairs(preparedItemsCache) do
            itemsCacheCount = itemsCacheCount + 1
            local dungeonName = key:match("^([^_]+)")
            if dungeonName then
                dungeonBreakdown[dungeonName] = (dungeonBreakdown[dungeonName] or 0) + 1
            end
        end
    end

    -- Count smart cache entries
    local smartCacheCount = 0
    if smartCache and smartCache.attunement then
        for _ in pairs(smartCache.attunement) do
            smartCacheCount = smartCacheCount + 1
        end
    end

    print("  Dungeon attunement cache: " .. dungeonCacheCount .. " entries")
    print("  Prepared items cache: " .. itemsCacheCount .. " entries")

    -- Show breakdown by dungeon if we have cache entries
    if itemsCacheCount > 0 then
        print("    Cache breakdown by dungeon:")
        for dungeonName, count in pairs(dungeonBreakdown) do
            print("      " .. dungeonName .. ": " .. count .. " filter combinations")
        end
    end

    print("  Smart attunement cache: " .. smartCacheCount .. " entries")
    print("  Last sort time: " .. (lastSortTime and string.format("%.1f", GetTime() - lastSortTime) .. "s ago" or "Never"))
    print("  Sort debounce active: " .. (sortDebounceTimer and "Yes" or "No"))
    print("|cFF87CEEB  Use '/djclear' to clear all caches for testing|r")
end

-- Add command to clear caches for testing
SLASH_DJCLEAR1 = "/djclear"
SlashCmdList["DJCLEAR"] = function()
    -- Clear all caches
    if preparedItemsCache then
        preparedItemsCache = {}
        setmetatable(preparedItemsCache, {__mode = "v"})
    end

    if uiCache then
        uiCache.dungeonAttunement = {}
        uiCache.dungeonAttunementLastUpdate = {}
        setmetatable(uiCache.dungeonAttunement, {__mode = "v"})
        setmetatable(uiCache.dungeonAttunementLastUpdate, {__mode = "v"})
    end

    if smartCache then
        smartCache.attunement = {}
        smartCache.forge = {}
        smartCache.lastUpdate = 0
    end

    print("|cFFFFD700[Cache Clear]|r All caches cleared for performance testing")
    print("|cFF87CEEB  Use '/djcache' to monitor cache rebuilding|r")
end
_G.PrintAttunementReport = PrintAttunementReport
_G.InvalidateItemCache = InvalidateItemCache -- Expose for external use
_G.GetAvailableDifficulties = GetAvailableDifficulties -- Expose for external use
_G.HasMultipleDifficulties = HasMultipleDifficulties -- Expose for external use
_G.CalculateAllDifficultyAttunables = CalculateAllDifficultyAttunables -- Expose for external use
_G.CalculateDungeonAttunables = CalculateDungeonAttunables -- Expose for external use (legacy)
_G.InvalidateDungeonAttunementCache = InvalidateDungeonAttunementCache -- Expose for external use

-- ʕ •ᴥ•ʔ✿ Debug function to test multi-difficulty attunement display ✿ʕ•ᴥ•ʔ
local function TestMultiDifficultyDisplay(dungeonName)
    if not dungeonName then
        print("|cFFFF0000[Multi-Difficulty Test]|r Usage: /run _G.TestMultiDifficultyDisplay('Naxxramas')")
        return
    end

    -- Find the dungeon by name
    local dungeon = nil
    for _, d in ipairs(_G.dungeonData or {}) do
        if d.name and d.name:lower():find(dungeonName:lower()) then
            dungeon = d
            break
        end
    end

    if not dungeon then
        print("|cFFFF0000[Multi-Difficulty Test]|r Dungeon not found: " .. dungeonName)
        return
    end

    print("|cFF87CEEB[Multi-Difficulty Test]|r Testing " .. dungeon.name)

    local availableDifficulties = GetAvailableDifficulties(dungeon)
    print("|cFF87CEEB[Available Difficulties]|r " .. table.concat(availableDifficulties, ", "))

    local byDifficulty, totalLeft, totalAttunable = CalculateAllDifficultyAttunables(dungeon)
    print("|cFF87CEEB[Total Attunables]|r " .. totalLeft .. "/" .. totalAttunable)

    if totalAttunable > 0 then
        for diffKey, diffData in pairs(byDifficulty) do
            local r, g, b = GetColorForAttunement(diffData.attunablesLeft, diffData.totalAttunable)
            local color = string.format("|cFF%02X%02X%02X", r * 255, g * 255, b * 255)
            print(color .. "  " .. diffData.name .. ": " .. diffData.attunablesLeft .. "/" .. diffData.totalAttunable .. "|r")
        end
    end

    print("|cFF87CEEB[Has Multiple Difficulties]|r " .. tostring(HasMultipleDifficulties(dungeon)))
end

_G.TestMultiDifficultyDisplay = TestMultiDifficultyDisplay -- Expose for debugging

-- Add escape key functionality to close the journal
table.insert(UISpecialFrames, "DungeonJournalFrame")

-- Combined filtering function for both search and category
-- ʕ •ᴥ•ʔ✿ Unified function to filter and sort dungeons ✿ʕ•ᴥ•ʔ
function FilterAndSortDungeons()
    -- ʕ •ᴥ•ʔ✿ Refresh attunement cache to sort with up-to-date data ✿ʕ •ᴥ•ʔ
    if InvalidateDungeonAttunementCache then
        InvalidateDungeonAttunementCache()
    end
    local query = dungeonSearchBox:GetText():lower()
    local selectedCategory = Journal_charDB.selectedCategory or "All"
    local selectedDifficulty = Journal_charDB.dungeonListDifficultyFilter or "all"
    local filtered = {}

    -- First, filter dungeons by search, category, and difficulty
    for _, btn in ipairs(dungeonButtons) do
        local dName = (btn.dungeon.name or ""):lower()
        local dCategory = btn.dungeon.category or "CLASSIC" -- Default to CLASSIC if no category

        -- Check if dungeon matches search query
        local matchesSearch = (query == "" or dName:find(query, 1, true))

        -- Check if dungeon matches category filter
        local matchesCategory = (selectedCategory == "All" or dCategory == selectedCategory)

        -- ʕ •ᴥ•ʔ✿ Check if dungeon matches difficulty filter ✿ʕ•ᴥ•ʔ
        local matchesDifficulty = DungeonHasDifficulty(btn.dungeon, selectedDifficulty)

        if matchesSearch and matchesCategory and matchesDifficulty then
            table.insert(filtered, btn)
        else
            btn:Hide()
        end
    end

    -- Sort logic changes if we are viewing *All* expansions.
    table.sort(filtered, function(a, b)
        local selectedDifficulty = Journal_charDB.dungeonListDifficultyFilter or "all"
        local aAttunablesLeft, aTotalAttunable = CalculateDifficultyAttunablesForFilter(a.dungeon, selectedDifficulty)
        local bAttunablesLeft, bTotalAttunable = CalculateDifficultyAttunablesForFilter(b.dungeon, selectedDifficulty)

        local aPercentage = aTotalAttunable > 0 and (aAttunablesLeft / aTotalAttunable) or 0
        local bPercentage = bTotalAttunable > 0 and (bAttunablesLeft / bTotalAttunable) or 0

        -- If "All" expansions are selected, ignore category order entirely
        if selectedCategory == "All" then
            if math.abs(aPercentage - bPercentage) > 0.001 then
                return aPercentage > bPercentage
            end
            if aTotalAttunable ~= bTotalAttunable then
                return aTotalAttunable > bTotalAttunable
            end
            return (a.dungeon.name or "") < (b.dungeon.name or "")
        end

        -- Otherwise keep category grouping first, then percentage
        local aCat = a.dungeon.category or "CLASSIC"
        local bCat = b.dungeon.category or "CLASSIC"
        local categoryOrder = { CLASSIC = 1, TBC = 2, WOTLK = 3, UNKNOWN = 999 }
        local aOrder = categoryOrder[aCat] or 999
        local bOrder = categoryOrder[bCat] or 999
        if aOrder ~= bOrder then
            return aOrder < bOrder
        end

        if math.abs(aPercentage - bPercentage) > 0.001 then
            return aPercentage > bPercentage
        end
        if aTotalAttunable ~= bTotalAttunable then
            return aTotalAttunable > bTotalAttunable
        end
        return (a.dungeon.name or "") < (b.dungeon.name or "")
    end)

    -- Show and position filtered dungeons
    for index, btn in ipairs(filtered) do
        local col = (index - 1) % numDungeonCols
        local row = math.floor((index - 1) / numDungeonCols)
        local xOff = col * dungeonButtonWidth
        local yOff = -row * dungeonButtonHeight
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOff, yOff)
        btn:Show()
    end

    -- Update grid height based on filtered results
    local totalRows = math.ceil(#filtered / numDungeonCols)
    gridContainer:SetHeight(math.max(totalRows * dungeonButtonHeight, dungeonButtonHeight))

    -- Update dropdown text
    local categoryText = selectedCategory == "All" and "All Expansions" or
                        selectedCategory == "CLASSIC" and "Classic" or
                        selectedCategory == "TBC" and "Burning Crusade" or
                        selectedCategory == "WOTLK" and "Wrath of the Lich King" or
                        "All Expansions"
    UIDropDownMenu_SetText(categoryDropdown, categoryText)
end

-- ʕ •ᴥ•ʔ✿ Keep legacy function for compatibility ✿ʕ•ᴥ•ʔ
function FilterDungeonsByCategory()
    FilterAndSortDungeons()
end

dungeonSearchBox:SetScript("OnTextChanged", function(self, userInput)
    FilterAndSortDungeons()
end)

-- Function to generate attunement report
function GenerateAttunementReport()
    if #dungeonButtons == 0 then return "No dungeons available." end

    local reportData = {}
    local globalUniqueItems = {} -- Track unique items across all dungeons
    local globalAttunedItems = {} -- Track attuned unique items

    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            local byDifficulty, totalAttunablesLeft, totalAttunable = CalculateAllDifficultyAttunables(btn.dungeon)
            local attunementPercentage = 0
            if totalAttunable > 0 then
                attunementPercentage = totalAttunablesLeft / totalAttunable
            end

            -- Collect unique items from all difficulty arrays for global calculation
            local difficulties = {
                { array = btn.dungeon.items },
                { array = btn.dungeon.items_hc },
                { array = btn.dungeon.items_my },
                { array = btn.dungeon.items_10n },
                { array = btn.dungeon.items_10h },
                { array = btn.dungeon.items_25n },
                { array = btn.dungeon.items_25h }
            }

            for _, difficulty in ipairs(difficulties) do
                if difficulty.array then
                    for _, itemID in ipairs(difficulty.array) do
                        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                        if canAttune == 1 then
                            globalUniqueItems[itemID] = true
                            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                            if attuneProgress >= 100 then
                                globalAttunedItems[itemID] = true
                            end
                        end
                    end
                end
            end

            table.insert(reportData, {
                name = btn.dungeon.name or "Unknown",
                attunablesLeft = totalAttunablesLeft,
                totalAttunable = totalAttunable,
                attunementPercentage = attunementPercentage,
                difficultyBreakdown = byDifficulty
            })
        end
    end

    -- Calculate actual unique totals
    local totalUniqueAttunable = 0
    local totalUniqueAttuned = 0

    for itemID, _ in pairs(globalUniqueItems) do
        totalUniqueAttunable = totalUniqueAttunable + 1
        if globalAttunedItems[itemID] then
            totalUniqueAttuned = totalUniqueAttuned + 1
        end
    end

    local totalUniqueLeft = totalUniqueAttunable - totalUniqueAttuned

    -- Sort for report display
    table.sort(reportData, function(a, b)
        if math.abs(a.attunementPercentage - b.attunementPercentage) > 0.001 then
            return a.attunementPercentage > b.attunementPercentage
        end
        if a.totalAttunable ~= b.totalAttunable then
            return a.totalAttunable > b.totalAttunable
        end
        return a.name < b.name
    end)

    return reportData, totalUniqueLeft, totalUniqueAttunable
end

-- Function to print report to chat
function PrintAttunementReport()
    local reportData, totalLeft, totalAttunable = GenerateAttunementReport()
    if type(reportData) == "string" then
        print("|cFFFFD700[DJ Report]|r " .. reportData)
        return
    end

    print("|cFFFFD700=== ATTUNEMENT REPORT ===|r")
    print("|cFF00FF00Overall Progress: " .. (totalAttunable - totalLeft) .. "/" .. totalAttunable .. " items attuned|r")

    for i, data in ipairs(reportData) do
        local percentLeft = data.attunementPercentage * 100
        local color = "|cFF808080" -- Gray default

        if data.totalAttunable == 0 then
            color = "|cFF808080" -- Gray for no items
        elseif data.attunementPercentage == 0 then
            color = "|cFF00FF00" -- Green for complete
        elseif data.attunementPercentage <= 0.5 then
            color = "|cFFFFFF00" -- Yellow for good progress
        elseif data.attunementPercentage < 1 then
            color = "|cFFFF4500" -- Orange-red for needs work
        else
            color = "|cFFCC0000" -- Deep red for not started
        end

        print(color .. i .. ". " .. data.name .. ": " .. data.attunablesLeft .. "/" .. data.totalAttunable .. " left (" .. string.format("%.1f", percentLeft) .. "%)|r")
    end
end

-- Removed duplicate SortDungeonsByAttunement function (now defined earlier)

-- Function to show/hide the journal
function ShowJournal()
    if DungeonJournalFrame then
        DungeonJournalFrame:Show()

        -- ʕ •ᴥ•ʔ✿ Refresh bag scanner when opening journal ✿ʕ •ᴥ•ʔ
        if _G.TheJournal_UIBagScanner and _G.TheJournal_UIBagScanner.RefreshBagScan then
            _G.TheJournal_UIBagScanner.RefreshBagScan()
        end

        -- ʕ •ᴥ•ʔ✿ Invalidate attunement cache when opening journal ✿ʕ •ᴥ•ʔ
        if _G.TheJournal_UIBagScanner and _G.TheJournal_UIBagScanner.InvalidateAttunementCache then
            _G.TheJournal_UIBagScanner.InvalidateAttunementCache()
        end

        -- ʕ •ᴥ•ʔ✿ Refresh bounty frames when opening journal ✿ʕ •ᴥ•ʔ
        if _G.BountySystem and _G.BountySystem.RefreshAllBountyFrames then
            _G.BountySystem.RefreshAllBountyFrames()
        end

        -- Use a timer to ensure UI state is fully loaded before sorting
        C_Timer.After(0.1, function()
            -- Sort dungeons immediately when showing
            RefreshAllAttunableText()
            SortDungeonsByAttunement()
            -- Apply any active filters
            FilterDungeonsByCategory()
        end)
    end
end

function HideJournal()
    if DungeonJournalFrame then
        DungeonJournalFrame:Hide()

        -- ʕ •ᴥ•ʔ✿ Clean up bounty frames when journal closes ✿ʕ •ᴥ•ʔ
        if _G.BountySystem and _G.BountySystem.CleanupAllBountyFrames then
            _G.BountySystem.CleanupAllBountyFrames()
        end
    end
end

-- Update the keybind function to use the new functions
function ToggleJournal()
    if DungeonJournalFrame:IsShown() then
        HideJournal()
    else
        ShowJournal()
    end
end

-- Make functions globally accessible
_G.ShowJournal = ShowJournal
_G.HideJournal = HideJournal
_G.ToggleJournal = ToggleJournal
_G.ProcessBOETooltip = ProcessBOETooltip

-- ʕ •ᴥ•ʔ✿ Friends Leaderboard System
local UIFriendsLeaderboard = _G.TheJournal_UIFriendsLeaderboard

-- ʕ •ᴥ•ʔ✿ BOE Tooltip Enhancement System
local UIBOETooltipEnhancement = _G.TheJournal_UIBOETooltipEnhancement

-- ʕ •ᴥ•ʔ✿ Friends Frame Creation ✿ʕ•ᴥ•ʔ
local friendsFrame = CreateFrame("Frame", "AttunementFriendsFrame", DungeonJournalFrame)
friendsFrame:SetSize(250, 400)
friendsFrame:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPLEFT", -10, -20)
friendsFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 32, edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
friendsFrame:SetBackdropColor(0.1, 0.1, 0.2, 0.8)
friendsFrame:SetBackdropBorderColor(0.4, 0.4, 0.6, 1)
friendsFrame:EnableMouse(true)
friendsFrame:Hide()

local friendsTitle = friendsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
friendsTitle:SetPoint("TOP", friendsFrame, "TOP", 0, -8)
friendsTitle:SetText("|cFFFFD700Attunement Leaderboard|r")

-- ʕ •ᴥ•ʔ✿ Create toggle button for friends frame in top left of main journal ✿ʕ•ᴥ•ʔ
local friendsToggleButton = CreateFrame("Button", "DJ_FriendsToggleButton", DungeonJournalFrame)
friendsToggleButton:SetSize(44, 44)
friendsToggleButton:SetPoint("TOPLEFT", DungeonJournalFrame, "TOPLEFT", 5, -5)
friendsToggleButton:SetFrameLevel((DungeonJournalFrame:GetFrameLevel() or 0) + 20)

-- ʕ •ᴥ•ʔ✿ Use same strata as journal frame to ensure visibility ✿ʕ•ᴥ•ʔ
friendsToggleButton:SetFrameStrata("FULLSCREEN_DIALOG")

-- ʕ ◕ᴥ◕ ʔ✿ Add background to make button more visible ✿ʕ ◕ᴥ◕ ʔ

local toggleIcon = friendsToggleButton:CreateTexture(nil, "ARTWORK")
toggleIcon:SetSize(44, 44)
toggleIcon:SetPoint("CENTER", friendsToggleButton, "CENTER")
toggleIcon:SetTexture("Interface\\Icons\\Achievement_GuildPerk_EverybodysFriend") -- fake text so its invisible prob better wa to do dis
toggleIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

-- ʕ •ᴥ•ʔ✿ Store icon as button property for external access ✿ʕ•ᴥ•ʔ
friendsToggleButton.toggleIcon = toggleIcon

local toggleHighlight = friendsToggleButton:CreateTexture(nil, "HIGHLIGHT")
toggleHighlight:SetSize(44, 44)
toggleHighlight:SetPoint("CENTER", friendsToggleButton, "CENTER")
toggleHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
toggleHighlight:SetBlendMode("ADD")

friendsToggleButton:SetScript("OnClick", function()
    if friendsFrame:IsShown() then
        friendsFrame:Hide()
        toggleIcon:SetDesaturated(true)
    else
        friendsFrame:Show()
        toggleIcon:SetDesaturated(false)
        -- ʕ •ᴥ•ʔ✿ Update display when showing ✿ʕ•ᴥ•ʔ
        if _G.UpdateAttunementFriendsDisplay then
            _G.UpdateAttunementFriendsDisplay()
        end
    end
end)

friendsToggleButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFFFFD700Friends Leaderboard|r")
    GameTooltip:AddLine("Click to show/hide the attunement leaderboard", 1, 1, 1)
    GameTooltip:Show()
end)

friendsToggleButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- ʕ •ᴥ•ʔ✿ Refresh button with custom icon design ✿ʕ•ᴥ•ʔ
local refreshButton = CreateFrame("Button", nil, friendsFrame)
refreshButton:SetSize(20, 20)
refreshButton:SetPoint("TOPRIGHT", friendsFrame, "TOPRIGHT", -8, -8)

local refreshIcon = refreshButton:CreateTexture(nil, "ARTWORK")
refreshIcon:SetSize(16, 16)
refreshIcon:SetPoint("CENTER", refreshButton, "CENTER")
refreshIcon:SetTexture("Interface\\Icons\\Ability_Druid_Cyclone")
refreshIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local refreshHighlight = refreshButton:CreateTexture(nil, "HIGHLIGHT")
refreshHighlight:SetSize(20, 20)
refreshHighlight:SetPoint("CENTER", refreshButton, "CENTER")
refreshHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
refreshHighlight:SetBlendMode("ADD")

refreshButton:SetScript("OnClick", function()
    if _G.RequestAttunementData then
        _G.RequestAttunementData()
    end
    if _G.SendAttunementData then
        _G.SendAttunementData()
    end
end)

refreshButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("|cFFFFD700Refresh Leaderboard|r")
    GameTooltip:AddLine("Click to request fresh data from friends", 1, 1, 1)
    GameTooltip:Show()
end)

refreshButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- ʕ •ᴥ•ʔ✿ Scroll frame for friends list with proper scrolling ✿ʕ•ᴥ•ʔ
local scrollFrame = CreateFrame("ScrollFrame", "FriendsAttunementScrollFrame", friendsFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", friendsFrame, "TOPLEFT", 10, -35)
scrollFrame:SetPoint("BOTTOMRIGHT", friendsFrame, "BOTTOMRIGHT", -30, 10)

-- ʕ ◕ᴥ◕ ʔ✿ Enable mouse wheel scrolling ✿ʕ ◕ᴥ◕ ʔ
scrollFrame:EnableMouseWheel(true)
scrollFrame:SetScript("OnMouseWheel", function(self, delta)
    local current = self:GetVerticalScroll()
    local maxScroll = self:GetVerticalScrollRange()
    local newScroll = current - (delta * 20)

    if newScroll < 0 then
        newScroll = 0
    elseif newScroll > maxScroll then
        newScroll = maxScroll
    end

    self:SetVerticalScroll(newScroll)
end)

local scrollChild = CreateFrame("Frame", nil, scrollFrame)
scrollChild:SetSize(210, 1) -- Width will be set properly, height will grow
scrollFrame:SetScrollChild(scrollChild)

-- ʕ •ᴥ•ʔ✿ Export scrollChild globally for UIFriendsManager ✿ʕ•ᴥ•ʔ
_G.scrollChild = scrollChild

-- Table to store friend entry frames
local friendEntries = {}

local function GetClassColor(classId)
    if not classId or type(classId) ~= "number" then
        return "|cFFFFFFFF"
    end

    if _G.CustomGetClassColor then
        local r, g, b, string = _G.CustomGetClassColor(classId)
        return string
    end
    return "|cFFFFFFFF"
end


-- ʕ •ᴥ•ʔ✿ Function to create a friend entry frame ✿ʕ•ᴥ•ʔ
local function CreateFriendEntry(index)
    local entry = CreateFrame("Frame", nil, scrollChild)
    entry:SetSize(210, 50)

    -- ʕ ◕ᴥ◕ ʔ✿ Rank text ✿ʕ ◕ᴥ◕ ʔ
    entry.rankText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    entry.rankText:SetPoint("TOPLEFT", entry, "TOPLEFT", 2, -2)
    entry.rankText:SetWidth(20)
    entry.rankText:SetJustifyH("LEFT")

    -- ʕ ● ᴥ ●ʔ✿ Player name text ✿ʕ ● ᴥ ●ʔ
    entry.nameText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    entry.nameText:SetPoint("TOPLEFT", entry, "TOPLEFT", 25, -5)
    entry.nameText:SetWidth(120)
    entry.nameText:SetJustifyH("LEFT")

    -- ʕノ•ᴥ•ʔノ✿ Percentage text ✿ʕノ•ᴥ•ʔノ
    entry.percentageText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    entry.percentageText:SetPoint("TOPRIGHT", entry, "TOPRIGHT", -5, -5)
    entry.percentageText:SetWidth(60)
    entry.percentageText:SetJustifyH("RIGHT")

    -- ＼ʕ •ᴥ•ʔ／✿ Progress text ✿＼ʕ •ᴥ•ʔ／
    entry.progressText = entry:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    entry.progressText:SetPoint("TOPLEFT", entry.nameText, "BOTTOMLEFT", 0, -2)
    entry.progressText:SetWidth(180)
    entry.progressText:SetJustifyH("LEFT")

    -- ʕ •ᴥ•ʔ✿ Dungeons/quest text ✿ʕ•ᴥ•ʔ
    entry.dungeonsText = entry:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    entry.dungeonsText:SetPoint("TOPLEFT", entry.progressText, "BOTTOMLEFT", 0, -2)
    entry.dungeonsText:SetWidth(200)
    entry.dungeonsText:SetJustifyH("LEFT")

    -- ʕ ◕ᴥ◕ ʔ✿ Crown icon for first place ✿ʕ ◕ᴥ◕ ʔ
    entry.crownIcon = entry:CreateTexture(nil, "OVERLAY")
    entry.crownIcon:SetSize(24, 24)
    entry.crownIcon:SetPoint("RIGHT", entry.nameText, "RIGHT", 64, -24)
    entry.crownIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    entry.crownIcon:Hide()

    -- ʕ ● ᴥ ●ʔ✿ Quest item button and icon in native position ✿ʕ ● ᴥ ●ʔ
    entry.questItemButton = CreateFrame("Button", nil, entry)
    entry.questItemButton:SetSize(16, 16)
    entry.questItemButton:SetPoint("TOPLEFT", entry.nameText, "BOTTOMLEFT", -22, 0)
    entry.questItemButton:Hide()
    entry.questItemButton:RegisterForClicks("LeftButtonUp")

    -- Enable shift-click to chat link
    entry.questItemButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        end
    end)

    entry.questItemIcon = entry.questItemButton:CreateTexture(nil, "ARTWORK")
    entry.questItemIcon:SetSize(16, 16)
    entry.questItemIcon:SetPoint("CENTER", entry.questItemButton, "CENTER")

    entry.questItemButton:SetScript("OnEnter", function(self)
        if self.itemLink then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:Show()
        end
    end)

    entry.questItemButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    -- ʕノ•ᴥ•ʔノ✿ Mouse interactions ✿ʕノ•ᴥ•ʔノ
    entry:EnableMouse(true)
    entry:SetScript("OnEnter", function(self)
        if not self.playerData then return end
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("|cFFFFD700" .. self.playerData.playerName .. "|r")

        if self.playerData.isPlayer then
            GameTooltip:AddLine("|cFF00FF00You|r", 1, 1, 1)
        elseif self.playerData.lastSeen then
            GameTooltip:AddLine("|cFF888888Last seen: " .. self.playerData.lastSeen .. "|r", 1, 1, 1)
        end

        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Progress: " .. self.playerData.attuned .. "/" .. self.playerData.total .. " (" .. self.playerData.percentage .. "%)", 1, 1, 1)

        -- ＼ʕ •ᴥ•ʔ／✿ Show journal points ✿＼ʕ •ᴥ•ʔ／
        local journalPoints = 0
        if self.playerData.isPlayer then
            journalPoints = Journal_charDB.journalPoints or 0
        else
            journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[self.playerData.playerName] or 0
        end
        if journalPoints > 0 then
            GameTooltip:AddLine("Journal Points: " .. journalPoints, 1, 1, 0)
        end

        -- ʕ •ᴥ•ʔ✿ Show top dungeons needed ✿ʕ•ᴥ•ʔ
        if self.playerData.dungeonDetails and #self.playerData.dungeonDetails > 0 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFB347Top Dungeons Needed:|r")
            local count = 0
            for i, dungeonData in ipairs(self.playerData.dungeonDetails) do
                if count >= 10 then break end
                if dungeonData.attunablesLeft > 0 then
                    count = count + 1
                    local percentLeft = dungeonData.attunementPercentage * 100
                    local color = "|cFF808080"

                    if dungeonData.attunementPercentage == 0 then
                        color = "|cFF00FF00"
                    elseif dungeonData.attunementPercentage <= 0.5 then
                        color = "|cFFFFFF00"
                    elseif dungeonData.attunementPercentage < 1 then
                        color = "|cFFFF4500"
                    else
                        color = "|cFFCC0000"
                    end

                    GameTooltip:AddDoubleLine(
                        color .. "• " .. dungeonData.name .. "|r",
                        color .. dungeonData.attunablesLeft .. "/" .. dungeonData.totalAttunable .. " (" .. string.format("%.0f", percentLeft) .. "%)|r"
                    )
                end
            end
            if count == 0 and self.playerData.top3Dungeons and #self.playerData.top3Dungeons > 0 then
                for i, dungeonName in ipairs(self.playerData.top3Dungeons) do
                    if i <= 3 then
                        GameTooltip:AddLine("• " .. dungeonName, 1, 1, 0.8)
                    end
                end
            end
        elseif self.playerData.top3Dungeons and #self.playerData.top3Dungeons > 0 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFB347Top Dungeons Needed:|r")
            for i, dungeonName in ipairs(self.playerData.top3Dungeons) do
                if i <= 3 then
                    GameTooltip:AddLine("• " .. dungeonName, 1, 1, 0.8)
                end
            end
        end
        GameTooltip:Show()
    end)

    entry:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    -- ʕ ◕ᴥ◕ ʔ✿ Height update function ✿ʕ ◕ᴥ◕ ʔ
    entry.UpdateHeight = function(self, hasQuestItem, hasJournalPoints)
        local baseHeight = 45
        local extraHeight = 0
        if hasQuestItem or hasJournalPoints then
            extraHeight = extraHeight + 18
        end
        self:SetHeight(baseHeight + extraHeight)
    end

    return entry
end

-- ʕ ● ᴥ ●ʔ✿ Export CreateFriendEntry globally ✿ʕ ● ᴥ ●ʔ
_G.CreateFriendEntry = CreateFriendEntry

-- Function to update the friends display
-- ʕ •ᴥ•ʔ✿ Friends UI handling delegated to UIFriendsManager ✿ʕ•ᴥ•ʔ
local UIFriendsManager = _G.TheJournal_UIFriendsManager

if UIFriendsManager then
    UIFriendsManager.UpdateAttunementFriendsDisplay()
end

-- ʕ •ᴥ•ʔ✿ Debounce mechanism to prevent spam updates ✿ʕ•ᴥ•ʔ
local lastUpdateTime = 0
local UPDATE_THROTTLE = 1.0 -- Only update once per second max

-- ʕ •ᴥ•ʔ✿ Main function to update the friends display ✿ʕ•ᴥ•ʔ
function UpdateAttunementFriendsDisplay()
    -- ʕ ◕ᴥ◕ ʔ✿ Throttle updates to prevent spam during scrolling ✿ʕ ◕ᴥ◕ ʔ
    local currentTime = GetTime()
    if currentTime - lastUpdateTime < UPDATE_THROTTLE then
        return -- Skip this update, too soon since last one
    end
    lastUpdateTime = currentTime

    -- ʕ ● ᴥ ●ʔ✿ Ensure we have our own data first ✿ʕ ● ᴥ ●ʔ
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
    end

    -- ʕ ● ᴥ ●ʔ✿ Debug: Check if we have any friends data ✿ʕ ● ᴥ ●ʔ
    local totalFriends = 0
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA or {}) do
        totalFriends = totalFriends + 1
    end

    if totalFriends == 0 then
        -- ʕ •ᴥ•ʔ✿ No friends data available. Adding self silently ✿ʕ •ᴥ•ʔ
        if _G.AddSelfToFriendsData then
            _G.AddSelfToFriendsData()
        end
        -- Recount after adding self
        totalFriends = 0
        for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA or {}) do
            totalFriends = totalFriends + 1
        end
        -- ʕ •ᴥ•ʔ✿ After adding self, total friends: " .. totalFriends .. " silently ✿ʕ •ᴥ•ʔ
    end

    -- ʕノ•ᴥ•ʔノ✿ Ensure player data is in global friends data ✿ʕノ•ᴥ•ʔノ
    local playerName = UnitName("player")
    if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
        if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
            _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
        end
    end

    -- ＼ʕ •ᴥ•ʔ／✿ Build sorted friends list ✿＼ʕ •ᴥ•ʔ／
    local sortedFriends = {}
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA or {}) do
        local journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[playerName] or 0
        table.insert(sortedFriends, {
            playerName = playerName,
            classId = data.classId,
            attuned = data.attuned,
            total = data.total,
            percentage = data.percentage,
            missingBOE = data.missingBOE,
            top3Dungeons = data.top3Dungeons,
            lastSeen = data.lastSeen,
            lastSeenTime = data.lastSeenTime,
            timestamp = data.timestamp,
            isPlayer = data.isPlayer,
            journalPoints = journalPoints,
            questItemID = data.questItemID,
            dungeonDetails = data.dungeonDetails
        })
    end

    -- ʕ •ᴥ•ʔ✿ Sort by percentage descending ✿ʕ•ᴥ•ʔ
    table.sort(sortedFriends, function(a, b)
        if a.percentage ~= b.percentage then
            return a.percentage > b.percentage
        end
        return a.playerName < b.playerName
    end)

    -- ʕ •ᴥ•ʔ✿ Removed debug spam - only log when data actually changes ✿ʕ•ᴥ•ʔ
    -- print("|cFFFFD700[DJ Friends]|r Displaying " .. #sortedFriends .. " friends in leaderboard")

    -- ʕ ◕ᴥ◕ ʔ✿ Create/update friend entries ✿ʕ ◕ᴥ◕ ʔ
    local currentYOffset = 0
    for i = 1, math.max(#sortedFriends, #friendEntries) do
        if i <= #sortedFriends then
            if not friendEntries[i] then
                friendEntries[i] = CreateFriendEntry(i)
                if not friendEntries[i] then
                    -- ʕ •ᴥ•ʔ✿ Failed to create friend entry " .. i .. " silently ✿ʕ •ᴥ•ʔ
                    return
                end
            end

            local entry = friendEntries[i]
            local friendData = sortedFriends[i]

            entry:ClearAllPoints()
            entry:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, -currentYOffset)

            entry.playerData = friendData

            -- ʕ ● ᴥ ●ʔ✿ Set rank color and text ✿ʕ ● ᴥ ●ʔ
            local rankColor = "|cFF888888"
            if i == 1 then rankColor = "|cFFFFD700"
            elseif i == 2 then rankColor = "|cFFC0C0C0"
            elseif i == 3 then rankColor = "|cFFCD7F32"
            end
            entry.rankText:SetText(rankColor .. "#" .. i .. "|r")

            -- ʕノ•ᴥ•ʔノ✿ Set player name with class color ✿ʕノ•ᴥ•ʔノ
            local classColor = GetClassColor(friendData.classId)
            local nameText = friendData.playerName
            if friendData.isPlayer then
                nameText = nameText .. " (You)"
            end

            if i == 1 and #sortedFriends > 1 then
                entry.crownIcon:Show()
            else
                entry.crownIcon:Hide()
            end
            entry.nameText:SetText(classColor .. nameText .. "|r")

            -- ＼ʕ •ᴥ•ʔ／✿ Set percentage color based on performance ✿＼ʕ •ᴥ•ʔ／
            local percentageColor = "|cFFFF4500"
            if i == 1 and #sortedFriends > 1 then
                percentageColor = "|cFFFFD700"
            elseif friendData.percentage >= 90 then
                percentageColor = "|cFF00FF00"
            elseif friendData.percentage >= 75 then
                percentageColor = "|cFF7FFF00"
            elseif friendData.percentage >= 50 then
                percentageColor = "|cFFFFFF00"
            elseif friendData.percentage >= 25 then
                percentageColor = "|cFFFF8000"
            end
            entry.percentageText:SetText(percentageColor .. friendData.percentage .. "%|r")

            entry.progressText:SetText("|cFF888888" .. friendData.attuned .. "/" .. friendData.total .. " items attuned|r")

            -- ʕ •ᴥ•ʔ✿ Handle quest item display ✿ʕ•ᴥ•ʔ
            local journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[friendData.playerName] or 0
            local questText = ""

            if friendData.questItemID and friendData.questItemID > 0 then
                local itemName, itemLink, quality, _, _, _, _, _, _, iTexture
                if _G.GetItemInfoCustom then
                    itemName, itemLink, quality, _, _, _, _, _, _, iTexture = _G.GetItemInfoCustom(friendData.questItemID)
                else
                    itemName, itemLink, quality, _, _, _, _, _, _, iTexture = GetItemInfo(friendData.questItemID)
                end

                if itemName then
                    local qualityColor = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
                    questText = qualityColor.hex .. itemName .. "|r"

                    entry.questItemIcon:SetTexture(iTexture or "Interface\\Icons\\INV_Misc_QuestionMark")
                    entry.questItemButton.itemLink = itemLink
                    entry.questItemButton:Show()
                else
                    questText = "|cFFFFFFFFItem " .. friendData.questItemID .. "|r"
                    entry.questItemIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
                    entry.questItemButton.itemLink = "item:" .. friendData.questItemID
                    entry.questItemButton:Show()
                end

                if journalPoints > 0 then
                    questText = questText .. " \n|cFFFFD700Journal Points: " .. journalPoints .. "|r"
                end
            else
                entry.questItemButton:Hide()
                entry.questItemButton.itemLink = nil

                if journalPoints > 0 then
                    questText = "|cFFFFD700Journal Points: " .. journalPoints .. "|r"
                else
                    questText = "|cFF888888No active quest|r"
                end
            end

            entry.dungeonsText:SetText(questText)

            local hasQuestItem = (friendData.questItemID and friendData.questItemID > 0)
            local hasJournalPoints = (journalPoints > 0)
            entry:UpdateHeight(hasQuestItem, hasJournalPoints)

            currentYOffset = currentYOffset + entry:GetHeight() + 3

            entry:Show()
        else
            if friendEntries[i] then
                friendEntries[i]:Hide()
            end
        end
    end

    local contentHeight = math.max(1, currentYOffset)
    scrollChild:SetHeight(contentHeight)
end

-- ʕ ◕ᴥ◕ ʔ✿ Force update function for when new data arrives ✿ʕ ◕ᴥ◕ ʔ
function ForceUpdateAttunementFriendsDisplay()
    lastUpdateTime = 0 -- Reset throttle
    UpdateAttunementFriendsDisplay()
end

-- Auto-refresh the display when data changes
local function OnFriendsDataUpdate()
    if friendsFrame:IsShown() then
        ForceUpdateAttunementFriendsDisplay() -- ʕ •ᴥ•ʔ✿ Force update when data actually changes ✿ʕ•ᴥ•ʔ
    end
    -- Only save when data actually changes, not on every display update
    local UIQuestManager = GetUIQuestManager()
    if UIQuestManager then
        UIQuestManager.DebouncedSave()
    end
end

-- Comprehensive tooltip for the friends frame showing detailed attunement reports
friendsFrame:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFFFFD700Detailed Attunement Report|r")
    GameTooltip:AddLine(" ")

    -- Get our own detailed report first
    local myReportData, myTotalLeft, myTotalAttunable = GenerateAttunementReport()
    if type(myReportData) ~= "string" then
        local myOverallPercent = 0
        if myTotalAttunable > 0 then
            myOverallPercent = ((myTotalAttunable - myTotalLeft) / myTotalAttunable) * 100
        end

        GameTooltip:AddLine("|cFF00FF00Your Progress: " .. (myTotalAttunable - myTotalLeft) .. "/" .. myTotalAttunable .. " (" .. string.format("%.1f", myOverallPercent) .. "%)|r")

        -- Show journal points
        local journalPoints = Journal_charDB.journalPoints or 0
        if journalPoints > 0 then
            GameTooltip:AddLine("Journal Points: " .. journalPoints, 1, 1, 0)
        end

        GameTooltip:AddLine(" ")

        -- Show your top 10 dungeons needing attention
        local myCount = 0
        for i, data in ipairs(myReportData) do
            if myCount >= 10 then break end
            if data.totalAttunable > 0 and data.attunablesLeft > 0 then
                myCount = myCount + 1
                local percentLeft = data.attunementPercentage * 100
                local color = "|cFF808080"

                if data.attunementPercentage == 0 then
                    color = "|cFF00FF00" -- Complete
                elseif data.attunementPercentage <= 0.5 then
                    color = "|cFFFFFF00" -- Good progress
                elseif data.attunementPercentage < 1 then
                    color = "|cFFFF4500" -- Needs work
                else
                    color = "|cFFCC0000" -- Not started
                end

                GameTooltip:AddDoubleLine(
                    color .. "• " .. data.name .. "|r",
                    color .. data.attunablesLeft .. "/" .. data.totalAttunable .. " (" .. string.format("%.0f", percentLeft) .. "%)|r"
                )
        end
    end
end

    -- Show friends summary
    local friendsData = {}
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        if not data.isPlayer then -- Don't include ourselves again
            table.insert(friendsData, {
                name = playerName,
                classId = data.classId,
                percentage = data.percentage,
                attuned = data.attuned,
                total = data.total,
                dungeonDetails = data.dungeonDetails,
                top3Dungeons = data.top3Dungeons
            })
    end
end

    -- Sort friends by percentage (highest first)
    table.sort(friendsData, function(a, b)
        if a.percentage ~= b.percentage then
            return a.percentage > b.percentage
        end
        return a.name < b.name
    end)

    if #friendsData > 0 then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cFF87CEEBFriends Progress Summary:|r")
        GameTooltip:AddLine(" ")

        -- Show top 3 friends with their progress
        for i = 1, math.min(3, #friendsData) do
            local friend = friendsData[i]
            local classColor = GetClassColor(friend.classId)
            local percentageColor = "|cFFFF4500" -- Red default

            if friend.percentage >= 90 then
                percentageColor = "|cFF00FF00" -- Green
            elseif friend.percentage >= 75 then
                percentageColor = "|cFF7FFF00" -- Light green
            elseif friend.percentage >= 50 then
                percentageColor = "|cFFFFFF00" -- Yellow
            elseif friend.percentage >= 25 then
                percentageColor = "|cFFFF8000" -- Orange
            end

            GameTooltip:AddDoubleLine(
                classColor .. friend.name .. "|r",
                percentageColor .. friend.percentage .. "% (" .. friend.attuned .. "/" .. friend.total .. ")|r"
            )

            -- Show their top dungeons needed (limit to 3 per friend)
            if friend.dungeonDetails and #friend.dungeonDetails > 0 then
                local dungeonCount = 0
                for j, dungeonData in ipairs(friend.dungeonDetails) do
                    if dungeonCount >= 3 then break end
                    if dungeonData.attunablesLeft > 0 then
                        dungeonCount = dungeonCount + 1
                        local dungeonPercentLeft = dungeonData.attunementPercentage * 100
                        local dungeonColor = "|cFF808080"

                        if dungeonData.attunementPercentage <= 0.5 then
                            dungeonColor = "|cFFFFFF00" -- Good progress
                        elseif dungeonData.attunementPercentage < 1 then
                            dungeonColor = "|cFFFF4500" -- Needs work
                        else
                            dungeonColor = "|cFFCC0000" -- Not started
                        end

                        GameTooltip:AddDoubleLine(
                            "  " .. dungeonColor .. dungeonData.name .. "|r",
                            dungeonColor .. dungeonData.attunablesLeft .. "/" .. dungeonData.totalAttunable .. "|r"
                        )
                    end
                end
            elseif friend.top3Dungeons and #friend.top3Dungeons > 0 then
                -- Fallback to old format
                for j = 1, math.min(3, #friend.top3Dungeons) do
                    GameTooltip:AddLine("  |cFFFFB347• " .. friend.top3Dungeons[j] .. "|r")
                end
            end

            if i < math.min(3, #friendsData) then
                GameTooltip:AddLine(" ")
        end
    end

        if #friendsData > 3 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFF888888... and " .. (#friendsData - 3) .. " more friends|r")
            end
        else
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("|cFF888888No friends data available|r")
        GameTooltip:AddLine("|cFF888888Click refresh to request data|r")
    end

    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cFF87CEEBHover over individual entries for full details|r")
    GameTooltip:Show()
end)

friendsFrame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- ʕ •ᴥ•ʔ✿ Position friends frame based on current view ✿ʕ•ᴥ•ʔ
local function PositionFriendsFrame()
    if not friendsFrame or not friendsFrame:IsShown() then return end

    friendsFrame:ClearAllPoints()

    -- ʕ ◕ᴥ◕ ʔ✿ Check if we're in preview or detail view ✿ʕ ◕ᴥ◕ ʔ
    local isPreviewShown = _G.previewFrame and _G.previewFrame:IsShown()
    local isDetailShown = _G.dungeonDetailFrame and _G.dungeonDetailFrame:IsShown()

    if isPreviewShown and not isDetailShown then
        -- ʕ ● ᴥ ●ʔ✿ Position for preview view - to the LEFT of preview frame ✿ʕ ● ᴥ ●ʔ
        friendsFrame:SetPoint("TOPRIGHT", _G.previewFrame, "TOPLEFT", -10, -20)
        friendsFrame:SetHeight(380)
    else
        -- ʕノ•ᴥ•ʔノ✿ Position for detail view or default ✿ʕノ•ᴥ•ʔノ
        friendsFrame:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPLEFT", -10, -20)
        friendsFrame:SetHeight(400)
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Auto-send our data when the frame is shown ✿＼ʕ •ᴥ•ʔ／
friendsFrame:SetScript("OnShow", function()
    -- ʕ •ᴥ•ʔ✿ Position based on current view ✿ʕ•ᴥ•ʔ
    if _G.PositionFriendsFrame then
        _G.PositionFriendsFrame()
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Prevent unnecessary updates during pagination ✿ʕ ◕ᴥ◕ ʔ
    if not friendsFrame.isPaginationUpdate then
        -- ʕ ● ᴥ ●ʔ✿ Update display from cache first ✿ʕ ● ᴥ ●ʔ
        UpdateAttunementFriendsDisplay()

        -- ʕノ•ᴥ•ʔノ✿ Only request fresh data if we haven't done so recently ✿ʕノ•ᴥ•ʔノ
        if not friendsFrame.lastRequest or (GetTime() - friendsFrame.lastRequest) > 30 then
            friendsFrame.lastRequest = GetTime()
            RequestAttunementData()
            SendAttunementData()

            -- ＼ʕ •ᴥ•ʔ／✿ Update once after a reasonable delay ✿＼ʕ •ᴥ•ʔ／
            C_Timer.After(5, function()
                if friendsFrame:IsShown() then
                    ForceUpdateAttunementFriendsDisplay() -- ʕ •ᴥ•ʔ✿ Force update for network data ✿ʕ•ᴥ•ʔ
                end
            end)
        end
    end

    -- ʕ •ᴥ•ʔ✿ Reset the pagination flag ✿ʕ•ᴥ•ʔ
    friendsFrame.isPaginationUpdate = false
end)

-- ʕ •ᴥ•ʔ✿ Manage friends frame and quest icons when switching between views ✿ʕ•ᴥ•ʔ
local originalLoadDungeonDetail = _G.LoadDungeonDetail
_G.LoadDungeonDetail = function(dungeon, isPagination)
    -- ʕ ◕ᴥ◕ ʔ✿ Only reposition friends frame if it's currently shown ✿ʕ ◕ᴥ◕ ʔ
    if friendsFrame and friendsFrame:IsShown() then
        -- ʕ ● ᴥ ●ʔ✿ Set flag to prevent friends update during pagination ✿ʕ ● ᴥ ●ʔ
        if isPagination then
            friendsFrame.isPaginationUpdate = true
        end

        -- ʕノ•ᴥ•ʔノ✿ Use positioning function for consistent placement ✿ʕノ•ᴥ•ʔノ
        C_Timer.After(0.1, function()
            if _G.PositionFriendsFrame then
                _G.PositionFriendsFrame()
            end
        end)
    end

    if questPopoutFrame then
        questPopoutFrame:Hide()
    end

    -- ʕ •ᴥ•ʔ✿ Only show quest icons when actually in dungeon detail view ✿ʕ•ᴥ•ʔ
    local result = originalLoadDungeonDetail(dungeon, isPagination)

    -- ʕ ◕ᴥ◕ ʔ✿ Use a timer to ensure the dungeon detail frame is properly shown before showing quest icons ✿ʕ ◕ᴥ◕ ʔ
    C_Timer.After(0.1, function()
        local isDungeonDetailShown = _G.dungeonDetailFrame and _G.dungeonDetailFrame:IsShown()

        if isDungeonDetailShown then
            -- ʕ ● ᴥ ●ʔ✿ Show quest icons only when in dungeon detail view ✿ʕ ● ᴥ ●ʔ
            if _G.randomQuestIcon then
                _G.randomQuestIcon:Show()
            end
            if _G.previewQuestIcon then
                _G.previewQuestIcon:Hide() -- Hide preview icon in dungeon detail
            end
            
            -- ʕ •ᴥ•ʔ✿ Update quest display (consolidated from UIQuestManager hook) ✿ʕ•ᴥ•ʔ
            if _G.TheJournal_UIQuestManager and _G.TheJournal_UIQuestManager.UpdateCurrentQuestDisplay then
                _G.TheJournal_UIQuestManager.UpdateCurrentQuestDisplay()
            end
        else
            -- ʕノ•ᴥ•ʔノ✿ Hide quest icons if not in dungeon detail ✿ʕノ•ᴥ•ʔノ
            if _G.randomQuestIcon then
                _G.randomQuestIcon:Hide()
            end
            if _G.previewQuestIcon then
                _G.previewQuestIcon:Show() -- Show preview icon when not in detail
            end
        end
    end)

    return result
end

-- ʕ •ᴥ•ʔ✿ Expose functions globally ✿ʕ•ᴥ•ʔ
_G.UpdateAttunementFriendsDisplay = UpdateAttunementFriendsDisplay
_G.ForceUpdateAttunementFriendsDisplay = ForceUpdateAttunementFriendsDisplay
_G.AttunementFriendsFrame = friendsFrame
_G.PositionFriendsFrame = PositionFriendsFrame

-- ʕ •ᴥ•ʔ✿ Initialize friends display immediately with cached data ✿ʕ•ᴥ•ʔ
local function InitializeFriendsDisplay()
    -- ʕ ◕ᴥ◕ ʔ✿ Add ourselves to the friends data immediately ✿ʕ ◕ᴥ◕ ʔ
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
    end

    -- ʕ ● ᴥ ●ʔ✿ Update display with current cache using local function ✿ʕ ● ᴥ ●ʔ
    ForceUpdateAttunementFriendsDisplay() -- ʕ •ᴥ•ʔ✿ Force update during initialization ✿ʕ•ᴥ•ʔ

    -- ʕノ•ᴥ•ʔノ✿ Also request fresh data from online friends ✿ʕノ•ᴥ•ʔノ
    if _G.RequestAttunementData then
        _G.RequestAttunementData()
    end
    if _G.SendAttunementData then
        _G.SendAttunementData()
    end

    DebugPrint("Loaded friends leaderboard from cache")
end

-- Schedule initialization after core addon systems are loaded
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- ʕ •ᴥ•ʔ✿ Increased delay to ensure all modules are loaded ✿ʕ•ᴥ•ʔ
        C_Timer.After(2, function()
            -- ʕ ◕ᴥ◕ ʔ✿ Initialize friends system directly ✿ʕ ◕ᴥ◕ ʔ
            InitializeFriendsDisplay()
            -- ʕ •ᴥ•ʔ✿ Friends leaderboard initialized silently ✿ʕ •ᴥ•ʔ

            -- ʕ •ᴥ•ʔ✿ Initialize quest system ✿ʕ•ᴥ•ʔ
            local UIQuestManager = _G.TheJournal_UIQuestManager
            if UIQuestManager and UIQuestManager.InitializeUI then
                UIQuestManager.InitializeUI()
                if UIQuestManager.UpdateCurrentQuestDisplay then
                    UIQuestManager.UpdateCurrentQuestDisplay()
                end
                if UIQuestManager.HookExistingFunctions then
                    UIQuestManager.HookExistingFunctions()
                end
                -- ʕ •ᴥ•ʔ✿ Quest system initialized silently ✿ʕ •ᴥ•ʔ
            else
                -- ʕ •ᴥ•ʔ✿ UIQuestManager not available silently ✿ʕ •ᴥ•ʔ
            end

            -- Initial sort after login
            RefreshAllAttunableText()
            FilterAndSortDungeons()

            -- ʕ •ᴥ•ʔ✿ Features loaded silently ✿ʕ •ᴥ•ʔ
        end)
    end
end)

-- Show on load and set toggle icon active
friendsFrame:Show()
if friendsToggleButton and friendsToggleButton.toggleIcon then
    friendsToggleButton.toggleIcon:SetDesaturated(false)
end

-- Ensure when preview frame is active, keep friends frame on the LEFT of it
if previewFrame then
    friendsFrame:ClearAllPoints()
    friendsFrame:SetPoint("TOPRIGHT", previewFrame, "TOPLEFT", -10, -20)
end

-- Category filter dropdown
local categoryDropdown = CreateFrame("Frame", "DJ_CategoryDropdown", previewFrame, "UIDropDownMenuTemplate")
categoryDropdown:SetPoint("CENTER", previewFrame, "CENTER", 80, 185)

-- ʕ •ᴥ•ʔ✿ Category 2.0: Enhanced Dungeon List Filtering System ✿ʕ•ᴥ•ʔ
local dungeonDifficultyFilterButton = CreateFrame("Button", "DJ_DungeonDifficultyFilter", previewFrame, "UIPanelButtonTemplate")
dungeonDifficultyFilterButton:SetSize(24, 24)
dungeonDifficultyFilterButton:SetPoint("TOPRIGHT", previewFrame, "TOPRIGHT", -50, -20)
dungeonDifficultyFilterButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")



-- ʕ •ᴥ•ʔ✿ Dungeon List Difficulty Filter Options (function moved to earlier location) ✿ʕ•ᴥ•ʔ

-- ʕ •ᴥ•ʔ✿ Difficulty filter variables moved to earlier location ✿ʕ•ᴥ•ʔ

-- ʕ •ᴥ•ʔ✿ Initialize Dungeon List Difficulty Filter ✿ʕ•ᴥ•ʔ
function InitializeDungeonListDifficultyFilter()
    -- Refresh options first
    dungeonListDifficultyOptions = GetDungeonListDifficultyOptions()

    local currentFilter = Journal_charDB.dungeonListDifficultyFilter or "all"

    -- Default to first option
    currentDungeonListDifficultyIndex = 1

    for i, option in ipairs(dungeonListDifficultyOptions) do
        if option.state == currentFilter then
            currentDungeonListDifficultyIndex = i
            break
        end
    end

    -- Bounds check
    if currentDungeonListDifficultyIndex > #dungeonListDifficultyOptions or currentDungeonListDifficultyIndex < 1 then
        currentDungeonListDifficultyIndex = 1
    end

    -- Safety check for empty options
    if #dungeonListDifficultyOptions == 0 then
        dungeonListDifficultyOptions = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
        currentDungeonListDifficultyIndex = 1
    end

    -- Update button appearance
    local opt = dungeonListDifficultyOptions[currentDungeonListDifficultyIndex]
    dungeonDifficultyFilterButton:SetNormalTexture(opt.icon)
    local tex = dungeonDifficultyFilterButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end

    Journal_charDB.dungeonListDifficultyFilter = opt.state
end

-- ʕ •ᴥ•ʔ✿ Update Dungeon List Difficulty Filter Button ✿ʕ•ᴥ•ʔ
function UpdateDungeonListDifficultyFilterButton()
    -- Refresh options in case dungeons have changed
    dungeonListDifficultyOptions = GetDungeonListDifficultyOptions()

    -- Bounds check and reset index if needed
    if currentDungeonListDifficultyIndex > #dungeonListDifficultyOptions or currentDungeonListDifficultyIndex < 1 then
        currentDungeonListDifficultyIndex = 1
    end

    -- Safety check for empty options
    if #dungeonListDifficultyOptions == 0 then
        dungeonListDifficultyOptions = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
        currentDungeonListDifficultyIndex = 1
    end

    local opt = dungeonListDifficultyOptions[currentDungeonListDifficultyIndex]
    dungeonDifficultyFilterButton:SetNormalTexture(opt.icon)
    local tex = dungeonDifficultyFilterButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    dungeonDifficultyFilterButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")

    Journal_charDB.dungeonListDifficultyFilter = opt.state
end

-- ʕ •ᴥ•ʔ✿ Dungeon List Difficulty Filter Click Handler ✿ʕ•ᴥ•ʔ
-- ʕ •ᴥ•ʔ✿ Handle difficulty filter button click ✿ʕ•ᴥ•ʔ
function OnDungeonListDifficultyFilterClick(button)
    -- Robust button detection with fallback
    if not button then
        -- Check if we can detect the current mouse button state
        if IsMouseButtonDown("RightButton") then
            button = "RightButton"
        else
            button = "LeftButton"  -- Default fallback
        end
    end

    -- Store tooltip state before making changes
    local tooltipWasShown = GameTooltip:IsShown() and GameTooltip:GetOwner() == dungeonDifficultyFilterButton

    -- Refresh options in case dungeons have changed
    dungeonListDifficultyOptions = GetDungeonListDifficultyOptions()

    -- Safety check for empty options
    if #dungeonListDifficultyOptions == 0 then
        dungeonListDifficultyOptions = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
        currentDungeonListDifficultyIndex = 1
    end

    -- Bounds check before changing index
    if currentDungeonListDifficultyIndex > #dungeonListDifficultyOptions or currentDungeonListDifficultyIndex < 1 then
        currentDungeonListDifficultyIndex = 1
    end

    -- Handle right-click to go backwards, left-click (or default) to go forwards
    if button == "RightButton" then
        currentDungeonListDifficultyIndex = currentDungeonListDifficultyIndex - 1
        if currentDungeonListDifficultyIndex < 1 then
            currentDungeonListDifficultyIndex = #dungeonListDifficultyOptions
        end
    else
        currentDungeonListDifficultyIndex = currentDungeonListDifficultyIndex + 1
        if currentDungeonListDifficultyIndex > #dungeonListDifficultyOptions then
            currentDungeonListDifficultyIndex = 1
        end
    end

    UpdateDungeonListDifficultyFilterButton()
    FilterAndSortDungeons()

    -- ʕ •ᴥ•ʔ✿ Update attunement text to reflect new difficulty filter ✿ʕ•ᴥ•ʔ
    RefreshAllAttunableText()

    -- Restore tooltip if it was shown before the click
    if tooltipWasShown then
        ShowDungeonListDifficultyFilterTooltip(dungeonDifficultyFilterButton)
    end
end

-- ʕ •ᴥ•ʔ✿ Dungeon List Difficulty Filter Tooltip ʿ•ᴥ•ʔ
function ShowDungeonListDifficultyFilterTooltip(button)
    -- Refresh options in case dungeons have changed
    dungeonListDifficultyOptions = GetDungeonListDifficultyOptions()

    -- Bounds check
    if currentDungeonListDifficultyIndex > #dungeonListDifficultyOptions or currentDungeonListDifficultyIndex < 1 then
        currentDungeonListDifficultyIndex = 1
    end

    -- Safety check for empty options
    if #dungeonListDifficultyOptions == 0 then
        dungeonListDifficultyOptions = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
        currentDungeonListDifficultyIndex = 1
    end

    local opt = dungeonListDifficultyOptions[currentDungeonListDifficultyIndex]
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:SetText("|cFFFF6600" .. "Difficulty Filter: " .. opt.text .. "|r")

    -- ʕ •ᴥ•ʔ✿ Show all available difficulty options with counts ✿ʕ•ᴥ•ʔ
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cFF87CEEBAvailable Filters:|r")

    for i, option in ipairs(dungeonListDifficultyOptions) do
        local color = (i == currentDungeonListDifficultyIndex) and "|cFF00FF00" or "|cFFFFFFFF"
        local marker = (i == currentDungeonListDifficultyIndex) and "- " or "  "

        -- Count is already included in the option text from GetDungeonListDifficultyOptions
        GameTooltip:AddLine(color .. marker .. option.text .. "|r")
    end

    -- Add hint about right-click functionality
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cFFFFD700Left-click: Next filter|r")
    GameTooltip:AddLine("|cFFFFD700Right-click: Previous filter|r")

    GameTooltip:Show()
end

dungeonDifficultyFilterButton:SetScript("OnClick", function(self, mouseButton)
    OnDungeonListDifficultyFilterClick(mouseButton)
end)
dungeonDifficultyFilterButton:SetScript("OnEnter", function(self) ShowDungeonListDifficultyFilterTooltip(self) end)
    dungeonDifficultyFilterButton:SetScript("OnLeave", function(self) 
        -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only hide tooltip if it belongs to this button ✿ʕ•ᴥ•ʔ
        if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
            GameTooltip:Hide() 
        end
    end)

-- ʕ •ᴥ•ʔ✿ Dungeon List Refresh Button ✿ʕ•ᴥ•ʔ
local dungeonListRefreshButton = CreateFrame("Button", "DJ_DungeonListRefresh", previewFrame, "UIPanelButtonTemplate")
dungeonListRefreshButton:SetSize(24, 24)
dungeonListRefreshButton:SetPoint("TOPRIGHT", previewFrame, "TOPRIGHT", -20, -20)
dungeonListRefreshButton:SetNormalTexture("Interface\\Icons\\INV_Misc_EngGizmos_30")
dungeonListRefreshButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")



-- ʕ •ᴥ•ʔ✿ Refresh Button Click Handler ✿ʕ•ᴥ•ʔ
function OnDungeonListRefreshClick()
    -- ʕ •ᴥ•ʔ✿ Use comprehensive cache clearing from UIBagScanner ✿ʕ•ᴥ•ʔ
    if _G.UIBagScanner and _G.UIBagScanner.InvalidateAttunementCache then
        _G.UIBagScanner.InvalidateAttunementCache()
    else
        -- Fallback to manual cache clearing if UIBagScanner not available
        if InvalidateDungeonAttunementCache then
            InvalidateDungeonAttunementCache()
        end

        -- Clear item caches
        if preparedItemsCache then
            wipe(preparedItemsCache)
        end

        -- Clear attunement caches
        if uiCache and uiCache.dungeonAttunement then
            wipe(uiCache.dungeonAttunement)
        end
        if uiCache and uiCache.dungeonAttunementLastUpdate then
            wipe(uiCache.dungeonAttunementLastUpdate)
        end

        -- Clear smart cache for attunement data
        if smartCache then
            smartCache.attunement = {}
            smartCache.forge = {}
        end
    end

    -- ʕ •ᴥ•ʔ✿ Immediately refresh all attunement text on dungeon buttons ✿ʕ•ᴥ•ʔ
    if RefreshAllAttunableText then
        RefreshAllAttunableText()
    end

    -- Refresh the dungeon list
    FilterAndSortDungeons()

    -- ʕ •ᴥ•ʔ✿ Immediately refresh current dungeon view if open ✿ʕ•ᴥ•ʔ
    if _G.currentDungeon and _G.LoadDungeonDetail then
        LoadDungeonDetail(_G.currentDungeon)
    end

    -- Show feedback
    print("|cFF87CEEB[TheJournal]|r Dungeon list refreshed!")
end

-- ʕ •ᴥ•ʔ✿ Refresh Button Tooltip ✿ʕ•ᴥ•ʔ
function ShowDungeonListRefreshTooltip(button)
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:SetText("|cFFFF6600" .. "Refresh|r")
    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("Click to refresh the dungeon list", 1, 1, 1)
    GameTooltip:AddLine("Clears all caches and reloads fresh data", 1, 1, 1)
    GameTooltip:Show()
end

dungeonListRefreshButton:SetScript("OnClick", OnDungeonListRefreshClick)
dungeonListRefreshButton:SetScript("OnEnter", function(self) ShowDungeonListRefreshTooltip(self) end)
    dungeonListRefreshButton:SetScript("OnLeave", function(self) 
        -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only hide tooltip if it belongs to this button ✿ʕ•ᴥ•ʔ
        if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
            GameTooltip:Hide() 
        end
    end)

-- ʕ •ᴥ•ʔ✿ Check if dungeon has specific difficulty ✿ʕ•ᴥ•ʔ
function DungeonHasDifficulty(dungeon, difficulty)
    if not dungeon then return false end

    if difficulty == "all" then
        return true
    elseif difficulty == "zones" then
        -- Zones are dungeons that don't have levelreq or have levelreq <= 1
        return (not dungeon.levelreq or dungeon.levelreq <= 1) and (dungeon.items and #dungeon.items > 0)
    elseif difficulty == "raids" then
        -- Check if this is a raid (has raid difficulties or is categorized as raid)
        return (dungeon.raid == true) or
               (dungeon.items_10n and #dungeon.items_10n > 0) or
               (dungeon.items_10h and #dungeon.items_10h > 0) or
               (dungeon.items_25n and #dungeon.items_25n > 0) or
               (dungeon.items_25h and #dungeon.items_25h > 0) or
               (dungeon.name and (dungeon.name:find("Raid") or dungeon.name:find("Temple") or
                                 dungeon.name:find("Sanctum") or dungeon.name:find("Citadel") or
                                 dungeon.name:find("Onyxia") or dungeon.name:find("Molten Core") or
                                 dungeon.name:find("Blackwing") or dungeon.name:find("Naxxramas")))
    elseif difficulty == "normal" then
        -- For Classic/TBC: Normal Dungeons (has regular items but not raid difficulties)
        return (dungeon.levelreq and dungeon.levelreq > 1) and (dungeon.items and #dungeon.items > 0) and not DungeonHasDifficulty(dungeon, "raids")
    elseif difficulty == "heroic" then
        return (dungeon.items_hc and #dungeon.items_hc > 0) or false
    elseif difficulty == "mythic" then
        return (dungeon.items_my and #dungeon.items_my > 0) or false
    elseif difficulty == "10n" then
        return (dungeon.items_10n and #dungeon.items_10n > 0) or false
    elseif difficulty == "10h" then
        return (dungeon.items_10h and #dungeon.items_10h > 0) or false
    elseif difficulty == "25n" then
        return (dungeon.items_25n and #dungeon.items_25n > 0) or false
    elseif difficulty == "25h" then
        return (dungeon.items_25h and #dungeon.items_25h > 0) or false
    end

    return false
end

-- Initialize the dungeon list difficulty filter
InitializeDungeonListDifficultyFilter()

-- Initialize dropdown settings
Journal_charDB.selectedCategory = Journal_charDB.selectedCategory or "All"
