-- ##################################################################
-- # UIFrames.lua
-- ##################################################################
-- Define binding headers
BINDING_HEADER_THEJOURNAL = "The Journal"
BINDING_NAME_TOGGLEJOURNAL = "Toggle Dungeon Journal"

-- Cache for UI-specific data
local uiCache = {
    currentDungeon = nil,
    currentCategory = nil,
    dropRates = {},
    bossFrames = {},
    lastDungeonUpdate = 0
}

local AffixTooltip = CreateFrame("GameTooltip", "DJ_AffixTooltip", UIParent, "GameTooltipTemplate")

-- Persistent drop rate cache to avoid recalculating on every page change
local dropRateCache = {}

-- Smart global cache for attunement and forge data
local smartCache = {
    attunement = {}, -- itemID -> progress
    forge = {},      -- itemID -> forgeLevel
    lastUpdate = 0,  -- timestamp of last cache update
    processing = false, -- flag to prevent concurrent processing
    updateQueue = {} -- queue of items to update
}

-- Add save debounce mechanism
local saveDebounce = {
    timer = nil,
    pending = false,
    lastSave = 0,
    minInterval = 10, -- Minimum seconds between saves
}

-- Optimized dungeon navigation functions
local function GetCurrentDungeon()
    if not uiCache.currentDungeon then
        return nil
    end
            return Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(uiCache.currentDungeon)
end

local function GetCurrentCategory()
    if not uiCache.currentCategory then
        return nil
    end
    return Journal.GetDungeonsByCategory(uiCache.currentCategory)
end

local function UpdateDungeonCache(dungeonName)
    if dungeonName == uiCache.currentDungeon and 
       (GetTime() - uiCache.lastDungeonUpdate) < 5 then
        return -- Use cached data if recently updated
    end
    
    uiCache.currentDungeon = dungeonName
    uiCache.lastDungeonUpdate = GetTime()
    
    local dungeon = Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    if dungeon then
        -- Pre-cache boss frames
        if dungeon.bosses then
            for _, boss in ipairs(dungeon.bosses) do
                if boss.bossID and not uiCache.bossFrames[boss.bossID] then
                    -- Create and cache boss frame
                    uiCache.bossFrames[boss.bossID] = CreateBossFrame(boss)
                end
            end
        end
        
        -- Clear old drop rates for this dungeon
        ClearDungeonDropRateCache(dungeonName)
    end
end

-- Function to get cached drop rate for an item with dungeon cache integration
local function GetCachedDropRate(itemId, dungeonName)
    local cacheKey = (dungeonName or "unknown") .. "_" .. itemId
    
    if dropRateCache[cacheKey] ~= nil then
        return dropRateCache[cacheKey]
    end
    
    -- Get dungeon data from cache
    local dungeon = dungeonName and Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    
    -- Calculate and cache the drop rate
    local dropRate = 0
    if _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
        local bestSource = _G.ItemLocAPI:GetBestSource(itemId, dungeonName)
        dropRate = bestSource and bestSource.chance or 0
        
        -- If we have dungeon data, verify the source is valid
        if dungeon and bestSource then
            local bossData = Journal.GetBossByID(bestSource.bossID)
            if bossData and bossData.dungeon.name == dungeonName then
                -- Source verified, cache the result
                dropRateCache[cacheKey] = dropRate
            end
        end
    end
    
    dropRateCache[cacheKey] = dropRate
    return dropRate
end

-- Initialize smart cache from saved variables if available
if Journal_charDB.smartCache then
    smartCache.attunement = Journal_charDB.smartCache.attunement or {}
    smartCache.forge = Journal_charDB.smartCache.forge or {}
    smartCache.lastUpdate = Journal_charDB.smartCache.lastUpdate or 0
end

-- Initialize persistent friends data
Journal_charDB.friendsAttunementData = Journal_charDB.friendsAttunementData or {}
Journal_charDB.friendsJournalPoints = Journal_charDB.friendsJournalPoints or {}

-- Initialize global friends data from saved variables
if not _G.FRIENDS_ATTUNEMENT_DATA then
    _G.FRIENDS_ATTUNEMENT_DATA = {}
end

if not _G.FRIENDS_JOURNAL_POINTS then
    _G.FRIENDS_JOURNAL_POINTS = {}
end

-- Function to debounce saves
local function DebouncedSave()
    if saveDebounce.timer then
        saveDebounce.timer:Cancel()
    end
    
    if not saveDebounce.pending then
        saveDebounce.pending = true
        saveDebounce.timer = C_Timer.NewTimer(1, function()
            if GetTime() - saveDebounce.lastSave >= saveDebounce.minInterval then
                SaveFriendsData()
                saveDebounce.lastSave = GetTime()
            end
            saveDebounce.pending = false
        end)
    end
end

-- Add debug flag
local DEBUG = false

-- Function to print debug messages
local function DebugPrint(...)
    if DEBUG then
        print("|cFF00FF00[DJ Debug]|r", ...)
    end
end

-- Load saved friends data
local friendsLoaded = 0
for playerName, data in pairs(Journal_charDB.friendsAttunementData) do
    _G.FRIENDS_ATTUNEMENT_DATA[playerName] = data
    friendsLoaded = friendsLoaded + 1
end

local pointsLoaded = 0
for playerName, points in pairs(Journal_charDB.friendsJournalPoints) do
    _G.FRIENDS_JOURNAL_POINTS[playerName] = points
    pointsLoaded = pointsLoaded + 1
end

if friendsLoaded > 0 or pointsLoaded > 0 then
    DebugPrint("Loaded " .. friendsLoaded .. " friends with attunement data and " .. pointsLoaded .. " friends with journal points")
end

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
    
    for cacheKey, _ in pairs(dropRateCache) do
        if cacheKey:find(dungeonName .. "_", 1, true) == 1 then
            dropRateCache[cacheKey] = nil
        end
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
    local batchSize = 5 -- Process 5 items per frame to avoid lag
    local processed = 0
    
    while processed < batchSize and #smartCache.updateQueue > 0 do
        local itemID = table.remove(smartCache.updateQueue, 1)
        
        -- Only update if not already cached
        if smartCache.attunement[itemID] == nil then
            local progress = 0
            if _G.GetItemAttuneProgress then
                progress = _G.GetItemAttuneProgress(itemID) or 0
            elseif _G.GetItemLinkAttuneProgress then
                local itemLink = "item:" .. itemID
                progress = _G.GetItemLinkAttuneProgress(itemLink) or 0
            end
            SetCachedAttunement(itemID, progress)
            
            -- Only get forge level if attuned
            if progress >= 100 and smartCache.forge[itemID] == nil then
                local forgeLevel = _G.GetItemAttuneForge and _G.GetItemAttuneForge(itemID) or 0
                SetCachedForge(itemID, forgeLevel)
            end
        end
        
        processed = processed + 1
    end
    
    smartCache.processing = false
    
    -- Continue processing if there are more items
    if #smartCache.updateQueue > 0 then
        C_Timer.After(0.1, ProcessCacheUpdates)
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

-- Function to update UI when dungeon changes
local function OnDungeonChanged(dungeonName)
    if not dungeonName then return end
    
    -- Update dungeon cache
    UpdateDungeonCache(dungeonName)
    
    -- Get dungeon data from cache
    local dungeon = Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    if not dungeon then return end
    
    -- Update category if needed
    if dungeon.category ~= uiCache.currentCategory then
        uiCache.currentCategory = dungeon.category
    end
    
    -- Pre-cache related dungeons in the same category
    local categoryDungeons = Journal and Journal.GetDungeonsByCategory and Journal.GetDungeonsByCategory(dungeon.category)
    if categoryDungeons then
        for _, relatedDungeon in ipairs(categoryDungeons) do
            if relatedDungeon.name ~= dungeonName then
                C_Timer.After(0.5, function()
                    if Journal and Journal.GetDungeonByName then
                        Journal.GetDungeonByName(relatedDungeon.name)
                    end
                end)
            end
        end
    end
end

-- Function to save friends data to saved variables
local function SaveFriendsData()
    -- Initialize tables if they don't exist
    Journal_charDB.friendsAttunementData = Journal_charDB.friendsAttunementData or {}
    Journal_charDB.friendsJournalPoints = Journal_charDB.friendsJournalPoints or {}
    
    -- Initialize global tables if they don't exist
    _G.FRIENDS_ATTUNEMENT_DATA = _G.FRIENDS_ATTUNEMENT_DATA or {}
    _G.FRIENDS_JOURNAL_POINTS = _G.FRIENDS_JOURNAL_POINTS or {}
    
    -- Save attunement data (don't clear existing data, only update)
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        Journal_charDB.friendsAttunementData[playerName] = data
    end
    
    -- Save journal points data (don't clear existing data, only update)
    for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
        Journal_charDB.friendsJournalPoints[playerName] = points
    end
    
    DebugPrint("Saved friends data")
end

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
    if not itemId or not _G.GetCustomGameData then return false end
    local bountiedValue = _G.GetCustomGameData(31, itemId)
    return (bountiedValue or 0) > 0
end

-- Set bounty icon on a frame, positioned relative to an icon
local function SetFrameBounty(frame, itemLink, iconFrame)
    local bountyFrameName = (frame:GetName() or "UnnamedFrame") .. '_Bounty'
    local bountyFrame = _G[bountyFrameName]
    local itemId = GetItemIDFromLink(itemLink)

    if itemId and IsItemBountied(itemId) then
        if not bountyFrame then
            bountyFrame = CreateFrame('Frame', bountyFrameName, frame)
            bountyFrame:SetWidth(BOUNTY_ICON.SIZE)
            bountyFrame:SetHeight(BOUNTY_ICON.SIZE)
            bountyFrame:SetFrameLevel(frame:GetFrameLevel() + 1)
            bountyFrame.texture = bountyFrame:CreateTexture(nil, 'OVERLAY')
            bountyFrame.texture:SetAllPoints()
            bountyFrame.texture:SetTexture(BOUNTY_ICON.TEXTURE)
        end
        bountyFrame:SetParent(frame)
        -- Position relative to the icon frame instead of the button frame
        local targetFrame = iconFrame or frame
        bountyFrame:SetPoint('TOPRIGHT', targetFrame, 'TOPRIGHT', -2, -2)
        bountyFrame:Show()
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
    ["Stratholme"] = "Zombie Bomber",
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
    ["Stratholme"] = "|cFFFF4500Exploding zombie|r chases you. When it explodes it deals |cFFFF4500massive shadow damage|r.",
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

local mainCloseButton = CreateFrame("Button", nil, DungeonJournalFrame, "UIPanelCloseButton")
mainCloseButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", 4, -4)
mainCloseButton:SetSize(25, 25)

_G.itemButtonCache              = _G.itemButtonCache or {}
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

-- Function to invalidate cache when settings change
local function InvalidateItemsCache(dungeonName)
    if dungeonName then
        -- Clear cache for specific dungeon
        for key, _ in pairs(preparedItemsCache) do
            if key:match("^" .. dungeonName .. "_") then
                preparedItemsCache[key] = nil
            end
        end
    else
        -- Clear entire cache
        preparedItemsCache = {}
    end
    lastCacheKey = nil
end

-- Function to clear old cache entries (keep only last 3 dungeons)
local function CleanupItemsCache()
    local cacheCount = 0
    for _ in pairs(preparedItemsCache) do
        cacheCount = cacheCount + 1
    end
    
    if cacheCount > 9 then -- 3 dungeons * ~3 filter combinations each
        -- Clear all but current cache entry
        local currentKey = lastCacheKey
        preparedItemsCache = {}
        if currentKey and preparedItemsCache[currentKey] then
            local currentCache = preparedItemsCache[currentKey]
            preparedItemsCache = { [currentKey] = currentCache }
        end
    end
end

-- Removed toggleEquippableButton - no longer needed with attunement system

local filterTypeButton = CreateFrame("Button", nil, DungeonJournalFrame)
filterTypeButton:SetSize(24, 24)
filterTypeButton:SetPoint("RIGHT", mainCloseButton, "LEFT", 5, -25)
filterTypeButton:SetFrameStrata("FULLSCREEN")
filterTypeButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function UpdateFilterTooltipText(button)
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == button then
        GameTooltip:ClearLines()
        GameTooltip:SetPoint("BOTTOM", button, "TOP", 0, 0)
        GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
        GameTooltip:Show()
    end
end

filterTypeButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self)
    GameTooltip:ClearLines()
    GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
    GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
    GameTooltip:Show()
end)


filterTypeButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- Show/hide functions will be defined after all buttons are created

local previewFrame = CreateFrame("Frame", "DungeonJournalPreviewFrame", DungeonJournalFrame)
previewFrame:SetSize(585, 430)
previewFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
previewFrame:Show()

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
dungeonTitleText:SetPoint("TOP", dungeonDetailFrame, "TOP", 0, 0)

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

local itemsListFrame = CreateFrame("Frame", "DungeonItemsListFrame", dungeonDetailFrame)
itemsListFrame:SetSize(400, 340)
itemsListFrame:SetPoint("TOPRIGHT", dungeonDetailFrame, "TOPRIGHT", 90, -60)

local itemsListContainer = CreateFrame("Frame", "ItemsListContainer", itemsListFrame)
itemsListContainer:SetSize(400, 340)
itemsListContainer:SetPoint("TOPLEFT", itemsListFrame, "TOPLEFT")

local pageNavigationFrame = CreateFrame("Frame", "DJ_ItemPageNavFrame", itemsListFrame)
pageNavigationFrame:SetSize(400, 25)
pageNavigationFrame:SetPoint("BOTTOM", itemsListFrame, "BOTTOM", 0, 0)

-- Move search box to top right area
local itemSearchBox = CreateFrame("EditBox", "DJ_ItemSearchBox", DungeonJournalFrame, "InputBoxTemplate")
itemSearchBox:SetSize(120, 20)
itemSearchBox:SetAutoFocus(false)
itemSearchBox:SetPoint("RIGHT", filterTypeButton, "LEFT", -10, 0)
itemSearchBox:SetFrameStrata("FULLSCREEN")
itemSearchBox:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)
itemSearchBox:SetText(Journal_charDB.itemSearchQuery or "")
itemSearchBox:SetScript("OnTextChanged", function(self, userInput)
    Journal_charDB.itemSearchQuery = self:GetText() or ""
    
    -- Invalidate cache when search query changes
    if _G.currentDungeon then
        InvalidateItemsCache(_G.currentDungeon.name)
        LoadDungeonDetail(_G.currentDungeon)
    end
end)

-- Initialize filter settings (safe initialization)
if not Journal_charDB.itemFilters then
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
if Journal_charDB.itemFilters.maxSources == 1 then
    currentSourceIndex = 2
elseif Journal_charDB.itemFilters.maxSources == 999 then
    currentSourceIndex = 3
else
    currentSourceIndex = 1
end

local sourceCountButton = CreateFrame("Button", nil, DungeonJournalFrame)
sourceCountButton:SetSize(24, 24)
sourceCountButton:SetPoint("RIGHT", itemSearchBox, "LEFT", -10, 0)
sourceCountButton:SetFrameStrata("FULLSCREEN")
sourceCountButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function UpdateSourceCountButton()
    local opt = sourceCountOptions[currentSourceIndex]
    sourceCountButton:SetNormalTexture(opt.icon)
    local tex = sourceCountButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    sourceCountButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    Journal_charDB.itemFilters.maxSources = opt.state
end

UpdateSourceCountButton()

sourceCountButton:SetScript("OnClick", function(self)
    currentSourceIndex = currentSourceIndex + 1
    if currentSourceIndex > #sourceCountOptions then
        currentSourceIndex = 1
    end
    UpdateSourceCountButton()
    
    -- Invalidate cache when filter changes
    InvalidateItemsCache()
    
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
    
    -- Update tooltip if it's currently shown
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
        local opt = sourceCountOptions[currentSourceIndex]
        GameTooltip:ClearLines()
        GameTooltip:SetText("|cFF87CEEB" .. "Source Count Filter: " .. opt.text .. "|r")
        GameTooltip:AddLine("All Items: Show all items", 1, 1, 1)
        GameTooltip:AddLine("1 Source: Show items with only 1 drop source", 1, 1, 1)
        GameTooltip:AddLine(">1 Source: Show items with multiple sources", 1, 1, 1)
        GameTooltip:Show()
    end
end)

sourceCountButton:SetScript("OnEnter", function(self)
    local opt = sourceCountOptions[currentSourceIndex]
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFF87CEEB" .. "Source Count Filter: " .. opt.text .. "|r")
    GameTooltip:AddLine("All Items: Show all items", 1, 1, 1)
    GameTooltip:AddLine("1 Source: Show items with only 1 drop source", 1, 1, 1)
    GameTooltip:AddLine(">1 Source: Show items with multiple sources", 1, 1, 1)
    GameTooltip:Show()
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
if Journal_charDB.itemFilters.mythicFilter == "mythic" then
    currentMythicIndex = 2
elseif Journal_charDB.itemFilters.mythicFilter == "nonmythic" then
    currentMythicIndex = 3
else
    currentMythicIndex = 1
end

local mythicFilterButton = CreateFrame("Button", nil, DungeonJournalFrame)
mythicFilterButton:SetSize(24, 24)
mythicFilterButton:SetPoint("RIGHT", sourceCountButton, "LEFT", -5, 0)
mythicFilterButton:SetFrameStrata("FULLSCREEN")
mythicFilterButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function UpdateMythicFilterButton()
    local opt = mythicFilterOptions[currentMythicIndex]
    mythicFilterButton:SetNormalTexture(opt.icon)
    local tex = mythicFilterButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    mythicFilterButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    Journal_charDB.itemFilters.mythicFilter = opt.state
end

UpdateMythicFilterButton()

mythicFilterButton:SetScript("OnClick", function(self)
    currentMythicIndex = currentMythicIndex + 1
    if currentMythicIndex > #mythicFilterOptions then
        currentMythicIndex = 1
    end
    UpdateMythicFilterButton()
    -- Reset warning flag when filter changes
    _G.mythicFilterWarningShown = false
    
    -- Invalidate cache when filter changes
    InvalidateItemsCache()
    
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
    
    -- Update tooltip if it's currently shown
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
        local opt = mythicFilterOptions[currentMythicIndex]
        GameTooltip:ClearLines()
        GameTooltip:SetText("|cFFFF6600" .. "Mythic Filter: " .. opt.text .. "|r")
        GameTooltip:AddLine("All Difficulties: Show all items", 1, 1, 1)
        GameTooltip:AddLine("Mythic Only: Show only mythic items", 1, 1, 1)
        GameTooltip:AddLine("Non-Mythic: Show only non-mythic items", 1, 1, 1)
        GameTooltip:Show()
    end
end)

mythicFilterButton:SetScript("OnEnter", function(self)
    local opt = mythicFilterOptions[currentMythicIndex]
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFFFF6600" .. "Mythic Filter: " .. opt.text .. "|r")
    GameTooltip:AddLine("All Difficulties: Show all items", 1, 1, 1)
    GameTooltip:AddLine("Mythic Only: Show only mythic items", 1, 1, 1)
    GameTooltip:AddLine("Non-Mythic: Show only non-mythic items", 1, 1, 1)
    GameTooltip:Show()
end)

mythicFilterButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Define show/hide functions now that all buttons are created
local function HideDungeonInteriorUI()
    filterTypeButton:Hide()
    sourceCountButton:Hide()
    mythicFilterButton:Hide()
    itemSearchBox:Hide()
end

local function ShowDungeonInteriorUI()
    filterTypeButton:Show()
    sourceCountButton:Show()
    mythicFilterButton:Show()
    itemSearchBox:Show()
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
            -- Fall back to full reload if cache is empty
            LoadDungeonDetail(_G.currentDungeon)
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
    
        
        -- Hide quest-related UI elements when returning to preview
        if randomQuestIcon then randomQuestIcon:Hide() end
        if previewQuestIcon then previewQuestIcon:Hide() end -- Hide on preview
        if questPopoutFrame then questPopoutFrame:Hide() end
        
        -- Use a timer to ensure UI state is updated before refreshing
        C_Timer.After(0.1, function()
            -- Refresh attuneable text when returning to main screen
            RefreshAllAttunableText()
            -- Sort dungeons by attunement progress
            SortDungeonsByAttunement()
            -- Apply any active filters
            FilterDungeonsByCategory()
        end)
    elseif previewFrame:IsShown() then
        if RuneCollection then RuneCollection:Show() end
        HideJournal()
    end
end)

local function AcquireItemButton(dIndex, iIndex)
    _G.itemButtonCache[dIndex] = _G.itemButtonCache[dIndex] or {}
    if _G.itemButtonCache[dIndex][iIndex] then
        return _G.itemButtonCache[dIndex][iIndex]
    end

    local btnName = "DJ_ItemButton_" .. dIndex .. "_" .. iIndex
    local btn = CreateFrame("Button", btnName, itemsListContainer)
    btn:SetSize(180, 40)

    local iconTex = btn:CreateTexture(nil, "ARTWORK")
    iconTex:SetSize(30, 30)
    iconTex:SetPoint("LEFT", btn, "LEFT", 2, 5)
    btn.iconTex = iconTex

    local itemText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    itemText:SetPoint("TOPLEFT", iconTex, "TOPRIGHT", 4, 0)
    itemText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    itemText:SetJustifyH("LEFT")
    btn.itemText = itemText

    local dropLocationText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    dropLocationText:SetPoint("TOPLEFT", itemText, "BOTTOMLEFT", 0, -2)
    dropLocationText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    dropLocationText:SetJustifyH("LEFT")
    btn.dropLocationText = dropLocationText

    local favIcon = btn:CreateTexture(nil, "OVERLAY")
    favIcon:SetSize(24, 24)
    favIcon:SetPoint("TOPLEFT", iconTex, "TOPLEFT", -8, 8)
    favIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    favIcon:Hide()
    btn.favoriteIcon = favIcon

    btn:RegisterForClicks("LeftButtonUp")
    btn:SetScript("OnEnter", function(self)
        if self.itemLink then
            GameTooltip_SetDefaultAnchor(GameTooltip, self)
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:Show()
        end
    end)
    btn:SetScript("OnLeave", function(self) 
        GameTooltip:Hide() 
    end)

    btn:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        elseif button == "LeftButton" and IsControlKeyDown() then
            local base = self.baseItemID
            if Journal_charDB.favorites[base] then
                Journal_charDB.favorites[base] = nil
            else
                Journal_charDB.favorites[base] = true
            end
            
            -- Invalidate cache when favorites change
            if _G.currentDungeon then
                InvalidateItemsCache(_G.currentDungeon.name)
                LoadDungeonDetail(_G.currentDungeon)
            end
        end
    end)

    _G.itemButtonCache[dIndex][iIndex] = btn
    return btn
end

local function HideAllItemButtons()
    for dIdx, itemTbl in pairs(_G.itemButtonCache) do
        for _, btn in pairs(itemTbl) do
            btn:Hide()
        end
    end
end

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

    if C_Timer and C_Timer.After then
        C_Timer.After(0.1, function()
            if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
                GameTooltip:ClearLines()
                GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
                GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
                GameTooltip:Show()
            end
        end)
    else
        -- Fallback: Update immediately if no timer available.
        -- Only update if the tooltip is still owned by this button
        if GameTooltip:GetOwner() == self then
            GameTooltip:ClearLines()
            GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
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
    -- Check cache first
    local cacheKey = GetCacheKey(dungeon)
    if cacheKey and preparedItemsCache[cacheKey] then
        lastCacheKey = cacheKey
        return preparedItemsCache[cacheKey]
    end
    
    local itemsToShow = {}
    local final = {}
    local filterIcon = DJ_Settings.filterType or "All"

    -- Get items list (static or dynamic)
    local itemList = _G.GetDynamicDungeonItems and _G.GetDynamicDungeonItems(dungeon) or dungeon.items or {}

    -- First pass: Convert item IDs to item info objects
    for _, itemID in ipairs(itemList) do
        local itemLink = "item:" .. itemID
        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc
        
        -- Use GetItemInfoCustom if available, fallback to GetItemInfo
        if _G.GetItemInfoCustom then
            iName, _, iQuality, _, _, iType, iSubType, _, eLoc = _G.GetItemInfoCustom(itemID)
        else
            iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfo(itemID)
        end
        
        -- Skip if item info isn't loaded yet
        if not iName then
            HandleUncachedItem(itemID, dungeon)
            iName = tostring(itemID)
        end

        local info = {
            baseID = itemID,
            itemLink = itemLink,
            isSpecial = false,
            index = #itemsToShow + 1
        }

        local shouldAdd = true
        
        -- Check attunement status filtering first
        if filterIcon == "Attunable" then
            -- Show items that can be attuned and have progress < 100%
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            shouldAdd = (canAttune == 1) and (attuneProgress < 100)
        elseif filterIcon == "Attuned" then
            -- Show only fully attuned items - use item ID-based function
            local attuneProgress = 0
            if _G.GetItemAttuneProgress then
                attuneProgress = _G.GetItemAttuneProgress(itemID) or 0
            elseif _G.GetItemLinkAttuneProgress then
                local itemLink = "item:" .. itemID
                attuneProgress = _G.GetItemLinkAttuneProgress(itemLink) or 0
            end
            shouldAdd = (attuneProgress >= 100)

        end
        
        -- Apply equipment-specific filtering if enabled
        if shouldAdd and DJ_Settings.onlyEquipable and iName then
            local currentClass = GetCurrentClass()
            
            -- Check armor slot filtering
            if iType == "Armor" then
                local allowedSlots = Journal_charDB.allowedArmorSlots or {}
                local equipSlot = _G.ConvertInvTypeToSlot and _G.ConvertInvTypeToSlot(eLoc)
                if equipSlot and not allowedSlots[equipSlot] then
                    shouldAdd = false
                end
                
                -- Check armor type filtering
                if shouldAdd then
                    local allowedArmorTypes = Journal_charDB.allowedArmorType and Journal_charDB.allowedArmorType[currentClass] or {}
                    if #allowedArmorTypes > 0 and not _G.IsInList(allowedArmorTypes, iSubType) then
                        shouldAdd = false
                    end
                end
            elseif iType == "Weapon" then
                -- Check weapon type filtering
                local allowedWeaponTypes = Journal_charDB.allowedWeaponType and Journal_charDB.allowedWeaponType[currentClass] or {}
                if #allowedWeaponTypes > 0 then
                    local normalizedSubType = iSubType
                    if iSubType == "Staves" then
                        normalizedSubType = "Staff"
                    end
                    if not _G.IsInList(allowedWeaponTypes, normalizedSubType) then
                        shouldAdd = false
                    end
                end
            end
        end
        
        if shouldAdd then
            table.insert(itemsToShow, info)
        end
    end

    -- Add special items if they exist
    if dungeon.specialItems and not DJ_Settings.onlyEquipable then
        for i, spID in ipairs(dungeon.specialItems) do
            local itemLink = "item:" .. spID
            local info = {
                baseID = spID,
                itemLink = itemLink,
                isSpecial = true,
                index = #itemsToShow + 1,
                drop = dungeon.specialDrop and dungeon.specialDrop[i]
            }
            table.insert(itemsToShow, info)
        end
    end

    -- Pre-cache attunement data and drop rates directly on items to avoid repeated API calls during sorting
    local currentDungeon = _G.currentDungeon
    local dungeonName = currentDungeon and currentDungeon.name
    
    for i, item in ipairs(itemsToShow) do
        if not item.isSpecial then
            -- Use smart cache for instant results
            local progress = GetCachedAttunement(item.baseID)
            local forge = GetCachedForge(item.baseID)
            local dropRate = 0
            
            if progress == nil then
                -- Not in cache, get immediately for visible items
                if _G.GetItemAttuneProgress then
                    progress = _G.GetItemAttuneProgress(item.baseID) or 0
                elseif _G.GetItemLinkAttuneProgress then
                    local itemLink = "item:" .. item.baseID
                    progress = _G.GetItemLinkAttuneProgress(itemLink) or 0
                else
                    progress = 0
                end
                
                -- Cache the progress immediately
                SetCachedAttunement(item.baseID, progress)
                
                -- Get forge level immediately if attuned
                if progress >= 100 then
                    forge = _G.GetItemAttuneForge and _G.GetItemAttuneForge(item.baseID) or 0
                    SetCachedForge(item.baseID, forge)
                else
                    forge = 0
                end
            else
                -- Use cached values
                if progress >= 100 and forge == nil then
                    -- Attuned but forge not cached, get it immediately
                    forge = _G.GetItemAttuneForge and _G.GetItemAttuneForge(item.baseID) or 0
                    SetCachedForge(item.baseID, forge)
                end
                
                -- Only get drop rate for non-attuned items
                if progress == 0 then
                    dropRate = GetCachedDropRate(item.baseID, dungeonName)
                end
            end
            

            
            -- Store cache data directly on the item
            item.cachedProgress = progress
            item.cachedForge = forge or 0
            item.cachedDropRate = dropRate
            item.cachedAttuned = progress >= 100
            item.cachedInProgress = progress > 0 and progress < 100
            item.cachedNonAttuned = progress == 0
        else
            -- Special items
            item.cachedProgress = 0
            item.cachedForge = 0
            item.cachedDropRate = 0
            item.cachedAttuned = false
            item.cachedInProgress = false
            item.cachedNonAttuned = true
        end
    end

    -- Sort items: special items first, then favorites, then by attunement status
    table.sort(itemsToShow, function(a, b)
        -- Special items first
        if a.isSpecial and not b.isSpecial then return true end
        if not a.isSpecial and b.isSpecial then return false end

        -- Then favorites
        local aFav = Journal_charDB.favorites[a.baseID] or false
        local bFav = Journal_charDB.favorites[b.baseID] or false
        if aFav and not bFav then return true end
        if not aFav and bFav then return false end

        -- Determine sorting groups: 1=Attuned, 2=Non-attuned, 3=In-progress
        local aGroup = a.cachedAttuned and 1 or (a.cachedInProgress and 3 or 2)
        local bGroup = b.cachedAttuned and 1 or (b.cachedInProgress and 3 or 2)
        
        -- First sort by group priority
        if aGroup ~= bGroup then
            return aGroup < bGroup -- Lower group number comes first
        end
        
        -- Within the same group, apply specific sorting
        if aGroup == 1 then
            -- Both attuned: ONLY sort by forge level (higher forge level first)
            local aForge = a.cachedForge
            local bForge = b.cachedForge

            
            if aForge ~= bForge then
                return aForge > bForge -- Higher forge level first (3=Lightforged, 2=Warforged, 1=Titanforged, 0=Normal)
            end
        elseif aGroup == 2 then
            -- Both non-attuned: ONLY sort by drop rate (highest to lowest)
            local aDropRate = a.cachedDropRate
            local bDropRate = b.cachedDropRate
            
            if aDropRate ~= bDropRate then
                return aDropRate > bDropRate -- Higher drop rate first
            end
        elseif aGroup == 3 then
            -- Both in progress: ONLY sort by progress percentage (higher progress first)
            if a.cachedProgress ~= b.cachedProgress then
                return a.cachedProgress > b.cachedProgress
            end
        end

        -- Finally by index
        return a.index < b.index
    end)

    -- Cache the results
    if cacheKey then
        preparedItemsCache[cacheKey] = itemsToShow
        lastCacheKey = cacheKey
        CleanupItemsCache()
    end

    return itemsToShow
end

DisplayItemsList = function(dungeon, versionIndex, itemsToShow)
    wipe(displayedItems)
    local query = (Journal_charDB.itemSearchQuery or ""):lower()
    

    
    -- Initialize filters if not already initialized
    if not Journal_charDB.itemFilters then
        Journal_charDB.itemFilters = {
            searchType = "items", -- "items", "bosses"
            maxSources = 0, -- maximum number of sources (0 = show all)
            showRareDrops = true, -- show items with < 5% droprate
            showCommonDrops = true, -- show items with >= 5% droprate
            mythicFilter = "all" -- "all", "mythic", "nonmythic"
        }
    end
    
    -- Migrate old mythicOnly setting to new mythicFilter
    if Journal_charDB.itemFilters.mythicOnly ~= nil then
        if Journal_charDB.itemFilters.mythicOnly then
            Journal_charDB.itemFilters.mythicFilter = "mythic"
        else
            Journal_charDB.itemFilters.mythicFilter = "all"
        end
        Journal_charDB.itemFilters.mythicOnly = nil -- Remove old setting
    end
    
    -- Add mythicFilter field if missing from existing filters
    if Journal_charDB.itemFilters.mythicFilter == nil then
        Journal_charDB.itemFilters.mythicFilter = "all"
    end
    
    local filters = Journal_charDB.itemFilters
    
    -- Handle different search types and filtering  
    if query ~= "" or filters.maxSources > 0 or filters.mythicFilter ~= "all" then
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
                                            -- Apply mythic filter
                                            local passesMythicFilter = true
                                            if filters.mythicFilter ~= "all" and _G.GetItemTagsCustom then
                                                local itemTags1, itemTags2 = _G.GetItemTagsCustom(itemId)
                                                local isMythicItem = itemTags1 and bit.band(itemTags1, 0x80) ~= 0 -- Check for 128 bit (Mythic)
                                                
                                                if filters.mythicFilter == "mythic" and not isMythicItem then
                                                    passesMythicFilter = false
                                                elseif filters.mythicFilter == "nonmythic" and isMythicItem then
                                                    passesMythicFilter = false
                                                end
                                            end
                                            
                                            if passesMythicFilter then
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
                
                -- Apply mythic filter
                if shouldInclude and filters.mythicFilter ~= "all" and _G.GetItemTagsCustom then
                    local itemTags1, itemTags2 = _G.GetItemTagsCustom(adjID)
                    local isMythicItem = itemTags1 and bit.band(itemTags1, 0x80) ~= 0 -- Check for 128 bit (Mythic)
                    
                                            -- Mythic filtering logic
                    
                    if filters.mythicFilter == "mythic" and not isMythicItem then
                        shouldInclude = false
                    elseif filters.mythicFilter == "nonmythic" and isMythicItem then
                        shouldInclude = false
                    end
                end
                
                -- Removed drop rate filters - using streamlined interface
                
                -- Apply text search for items
                if shouldInclude and query ~= "" and filters.searchType == "items" then
                    local iName
                    if _G.GetItemInfoCustom then
                        iName = _G.GetItemInfoCustom(adjID) or ""
                    else
                        iName = GetItemInfo(adjID) or ""
                    end
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
        if _G.GetItemInfoCustom then
            iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture = _G.GetItemInfoCustom(adjID)
        else
            iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture = GetItemInfo(adjID)
        end
        
        if not iName then
            HandleUncachedItem(adjID, dungeon)
            iName = tostring(adjID)
            iLink = "item:" .. adjID
        end
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

        -- Add bounty icon if item is bountied (positioned on the item icon)
        SetFrameBounty(btn, iLink, btn.iconTex)

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
    end
    
    DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_open.blp")
    previewFrame:Hide()
    dungeonDetailFrame:Show()
    ShowDungeonInteriorUI()

    local titleTextStr = dungeon.name or "Unknown Dungeon"
    dungeonTitleText:SetText(titleTextStr)

    -- Add book icon if dungeon has affix data
    if not dungeonDetailFrame.bookIcon and DUNGEON_AFFIXES[dungeon.name] then
        local bookIcon = dungeonDetailFrame:CreateTexture(nil, "OVERLAY")
        bookIcon:SetSize(24, 24)
        bookIcon:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 15)
        bookIcon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
        bookIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9) -- Crop the texture for better appearance
        dungeonDetailFrame.bookIcon = bookIcon
        
        -- Add highlight texture
        local bookHighlight = dungeonDetailFrame:CreateTexture(nil, "HIGHLIGHT")
        bookHighlight:SetSize(24, 24)
        bookHighlight:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 15)
        bookHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
        bookHighlight:SetBlendMode("ADD")
        bookHighlight:Hide()
        dungeonDetailFrame.bookHighlight = bookHighlight
        
        -- Create invisible frame for mouse interaction
        local bookFrame = CreateFrame("Frame", nil, dungeonDetailFrame)
        bookFrame:SetSize(24, 24)
        bookFrame:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 45)
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
            dungeonDetailFrame.bookIcon:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 25)
            dungeonDetailFrame.bookFrame:ClearAllPoints()
            dungeonDetailFrame.bookFrame:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 25)
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
dungeonSearchBox:SetPoint("CENTER", previewFrame, "CENTER", -80, 185)
dungeonSearchBox:SetAutoFocus(false)

-- Category filter dropdown
local categoryDropdown = CreateFrame("Frame", "DJ_CategoryDropdown", previewFrame, "UIDropDownMenuTemplate")
categoryDropdown:SetPoint("CENTER", previewFrame, "CENTER", 80, 185)

-- Initialize dropdown settings
Journal_charDB.selectedCategory = Journal_charDB.selectedCategory or "All"

local function CategoryDropdown_OnClick(self)
    Journal_charDB.selectedCategory = self.value
    UIDropDownMenu_SetSelectedID(categoryDropdown, self:GetID())
    -- Filter dungeons by category
    FilterDungeonsByCategory()
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

-- Function to calculate attunable items for a dungeon
local function CalculateDungeonAttunables(dungeon)
    if not dungeon or not dungeon.items then
        return 0, 0
    end
    
    local totalAttunable = 0
    local attunablesLeft = 0
    
    for _, itemID in ipairs(dungeon.items) do
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
        if canAttune == 1 then
            totalAttunable = totalAttunable + 1
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            if attuneProgress < 100 then
                attunablesLeft = attunablesLeft + 1
            end
        end
    end
    
    return attunablesLeft, totalAttunable
end

-- Function to update attuneable text on a button
local function UpdateAttunableText(btn, dungeon)
    if not btn.attunableText then
        return
    end
    
    local attunablesLeft, totalAttunable = CalculateDungeonAttunables(dungeon)
    
    if totalAttunable > 0 then
        -- Calculate percentage of items attuned
        -- Color logic based on items left to attune
        -- 0 items left = clear green (100% attuned)
        -- Some items left but < 50% = yellow
        -- > 50% items left = red  
        -- 100% items left = deep red (0% attuned)
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
        
        local r, g, b = GetColorForAttunement(attunablesLeft, totalAttunable)
        local color = string.format("|cFF%02X%02X%02X", r * 255, g * 255, b * 255)
        
        btn.attunableText:SetText(color .. attunablesLeft .. "/" .. totalAttunable .. " Attunable|r")
        btn.attunableText:Show()
    else
        btn.attunableText:Hide()
    end
end

-- Function to refresh all attuneable text on dungeon buttons
function RefreshAllAttunableText()
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            UpdateAttunableText(btn, btn.dungeon)
        end
    end
end

-- Function to sort dungeon buttons by attunement percentage
function SortDungeonsByAttunement()
    if #dungeonButtons == 0 then return end
    
    -- Create array with buttons and their attunement data
    local buttonData = {}
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            local attunablesLeft, totalAttunable = CalculateDungeonAttunables(btn.dungeon)
            local attunementPercentage = 0
            if totalAttunable > 0 then
                attunementPercentage = attunablesLeft / totalAttunable
            end
            
            table.insert(buttonData, {
                button = btn,
                dungeon = btn.dungeon,
                attunablesLeft = attunablesLeft,
                totalAttunable = totalAttunable,
                attunementPercentage = attunementPercentage
            })
        end
    end
    
    -- Sort by category first, then by attunement percentage within each category
    table.sort(buttonData, function(a, b)
        local aCat = a.dungeon.category or "UNKNOWN"
        local bCat = b.dungeon.category or "UNKNOWN"
        
        -- Define category order
        local categoryOrder = { CLASSIC = 1, TBC = 2, WOTLK = 3, UNKNOWN = 999 }
        local aOrder = categoryOrder[aCat] or 999
        local bOrder = categoryOrder[bCat] or 999
        
        -- First sort by category
        if aOrder ~= bOrder then
            return aOrder < bOrder
        end
        
        -- Within same category, sort by attunement percentage (highest percentage of missing items first)
        if math.abs(a.attunementPercentage - b.attunementPercentage) > 0.001 then
            return a.attunementPercentage > b.attunementPercentage
        end
        
        -- If same percentage, sort by total attunable items (more items first)
        if a.totalAttunable ~= b.totalAttunable then
            return a.totalAttunable > b.totalAttunable
        end
        
        -- Finally, sort by dungeon name for consistency
        return (a.dungeon.name or "") < (b.dungeon.name or "")
    end)
    
    -- Reposition buttons based on new order
    for i, data in ipairs(buttonData) do
        local btn = data.button
        local col = (i - 1) % numDungeonCols
        local row = math.floor((i - 1) / numDungeonCols)
        local xOffset = col * dungeonButtonWidth
        local yOffset = -row * dungeonButtonHeight
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOffset, yOffset)
    end
    
    -- Update grid height
    local totalRows = math.ceil(#buttonData / numDungeonCols)
    gridContainer:SetHeight(totalRows * dungeonButtonHeight)
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
            if PreCacheDungeonVersion then
                PreCacheDungeonVersion(d)
            end
            LoadDungeonDetail(d)
        end)

        btn:SetScript("OnEnter", function(self)
            -- Pre-cache items on hover for better performance
            if d.items and not tempschedule[d.name] then
                tempschedule[d.name] = true
                C_Timer.After(0.1, function()
                    for i = 1, math.min(20, #d.items) do -- Pre-cache first 20 items
                        CacheItem(d.items[i])
                    end
                end)
            end
            
            self.tex:SetVertexColor(0.7, 0.7, 0.7)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(d.name)
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
    C_Timer.After(0.5, function()
        RefreshAllAttunableText()
        SortDungeonsByAttunement()
    end)
end

HideDungeonInteriorUI()
previewFrame:Show()

-- Hide quest icons appropriately - preview icon hidden on preview, random icon hidden initially
if previewQuestIcon then
    previewQuestIcon:Hide() -- Hide on preview frame (will show in dungeon detail)
end
if randomQuestIcon then
    randomQuestIcon:Hide() -- Hide initially, only show in dungeon detail
end

-- Show friends frame on initial load with proper preview positioning
if friendsFrame then
    friendsFrame:ClearAllPoints()
    friendsFrame:SetPoint("TOPLEFT", previewFrame, "TOPRIGHT", 10, -20)
    friendsFrame:SetHeight(380)
    friendsFrame:Show()
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
    msg = string.lower(string.trim(msg or ""))
    if msg == "report" then
        PrintAttunementReport()
    elseif msg == "debug" then
        _G.debug = not _G.debug
        print("|cFFFFD700[DJ Debug]|r Debug mode " .. (_G.debug and "ENABLED" or "DISABLED"))
        if _G.debug then
            print("|cFF00FF00[DJ DEBUG]|r Debug test message - this confirms debug is working!")
        end
    elseif msg == "clearcache" then
        if _G.Journal_FriendCache then
            _G.Journal_FriendCache.friends = {}
            -- Don't clear saved friends data, only the temporary cache
            print("|cFFFFD700[DJ Cache]|r Cleared friends cache (persistent data preserved)")
            UpdateAttunementFriendsDisplay()
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
                print("|cFF87CEEB  " .. playerName .. "|r (" .. (data.class or "Unknown") .. ") - " .. (data.percentage or 0) .. "% - " .. age)
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
    msg = string.lower(string.trim(msg or ""))
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
    elseif msg:find("^testboe") then
        print("|cFF00FFFF[Manual BOE DEBUG]|r Processing testboe command with message: " .. tostring(msg))
        
        local originalItemLink = nil
        local itemLink = nil
        local itemName = nil
        local itemID = nil

        -- First, try to extract item ID from any format in the message
        itemID = tonumber(msg:match("item:(%d+)")) or tonumber(msg:match("testboe%s+(%d+)"))
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
                itemID = tonumber(originalItemLink:match("item:(%d+)"))
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
                    itemID = tonumber(foundLink:match("item:(%d+)"))
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
            itemID = tonumber(itemLink:match("item:(%d+)"))
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
_G.PrintAttunementReport = PrintAttunementReport
_G.InvalidateItemCache = InvalidateItemCache -- Expose for external use

-- Add escape key functionality to close the journal
table.insert(UISpecialFrames, "DungeonJournalFrame")

-- Combined filtering function for both search and category
function FilterDungeonsByCategory()
    local query = dungeonSearchBox:GetText():lower()
    local selectedCategory = Journal_charDB.selectedCategory or "All"
    local filtered = {}
    
    for _, btn in ipairs(dungeonButtons) do
        local dName = (btn.dungeon.name or ""):lower()
        local dCategory = btn.dungeon.category or "CLASSIC" -- Default to CLASSIC if no category
        
        -- Check if dungeon matches search query
        local matchesSearch = (query == "" or dName:find(query, 1, true))
        
        -- Check if dungeon matches category filter
        local matchesCategory = (selectedCategory == "All" or dCategory == selectedCategory)
        
        if matchesSearch and matchesCategory then
            btn:Show()
            table.insert(filtered, btn)
        else
            btn:Hide()
        end
    end
    
    -- Reposition visible buttons
    for index, btn in ipairs(filtered) do
        local col = (index - 1) % numDungeonCols
        local row = math.floor((index - 1) / numDungeonCols)
        local xOff = col * dungeonButtonWidth
        local yOff = -row * dungeonButtonHeight
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOff, yOff)
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

dungeonSearchBox:SetScript("OnTextChanged", function(self, userInput)
    FilterDungeonsByCategory()
end)

-- Function to generate attunement report
function GenerateAttunementReport()
    if #dungeonButtons == 0 then return "No dungeons available." end
    
    local reportData = {}
    local globalUniqueItems = {} -- Track unique items across all dungeons
    local globalAttunedItems = {} -- Track attuned unique items
    
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            local attunablesLeft, dungeonTotal = CalculateDungeonAttunables(btn.dungeon)
            local attunementPercentage = 0
            if dungeonTotal > 0 then
                attunementPercentage = attunablesLeft / dungeonTotal
            end
            
            -- Collect unique items from this dungeon for global calculation
            if btn.dungeon.items then
                for _, itemID in ipairs(btn.dungeon.items) do
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
            
            table.insert(reportData, {
                name = btn.dungeon.name or "Unknown",
                attunablesLeft = attunablesLeft,
                totalAttunable = dungeonTotal,
                attunementPercentage = attunementPercentage
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

-- ##################################################################
-- # FRIENDS ATTUNEMENT FRAME
-- ##################################################################

-- Create Friends Attunement frame in the main UI (positioned to the left)
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

-- Frame title
local friendsTitle = friendsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
friendsTitle:SetPoint("TOP", friendsFrame, "TOP", 0, -10)
friendsTitle:SetText("|cFFFFD700Attunement Leaderboard|r")

-- Create toggle button for friends frame in top left of main journal
local friendsToggleButton = CreateFrame("Button", "DJ_FriendsToggleButton", DungeonJournalFrame)
friendsToggleButton:SetSize(24, 24)
friendsToggleButton:SetPoint("TOPLEFT", DungeonJournalFrame, "TOPLEFT", 10, -10)
friendsToggleButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 10)

local toggleIcon = friendsToggleButton:CreateTexture(nil, "ARTWORK")
toggleIcon:SetSize(20, 20)
toggleIcon:SetPoint("CENTER", friendsToggleButton, "CENTER")
toggleIcon:SetTexture("Interface\\Icons\\INV_Misc_GroupLooking")
toggleIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local toggleHighlight = friendsToggleButton:CreateTexture(nil, "HIGHLIGHT")
toggleHighlight:SetSize(24, 24)
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
        -- Update display when showing
        UpdateAttunementFriendsDisplay()
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

-- Create toggle button for friends frame in top left of main journal
local friendsToggleButton = CreateFrame("Button", "DJ_FriendsToggleButton", DungeonJournalFrame)
friendsToggleButton:SetSize(24, 24)
friendsToggleButton:SetPoint("TOPLEFT", DungeonJournalFrame, "TOPLEFT", 10, -10)
friendsToggleButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 10)

local toggleIcon = friendsToggleButton:CreateTexture(nil, "ARTWORK")
toggleIcon:SetSize(20, 20)
toggleIcon:SetPoint("CENTER", friendsToggleButton, "CENTER")
toggleIcon:SetTexture("Interface\\Icons\\INV_Misc_GroupLooking")
toggleIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local toggleHighlight = friendsToggleButton:CreateTexture(nil, "HIGHLIGHT")
toggleHighlight:SetSize(24, 24)
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
        -- Update display when showing
        UpdateAttunementFriendsDisplay()
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

-- Refresh button with custom icon design
local refreshButton = CreateFrame("Button", nil, friendsFrame)
refreshButton:SetSize(24, 24)
refreshButton:SetPoint("TOPRIGHT", friendsFrame, "TOPRIGHT", -10, -35)

local refreshIcon = refreshButton:CreateTexture(nil, "ARTWORK")
refreshIcon:SetSize(20, 20)
refreshIcon:SetPoint("CENTER", refreshButton, "CENTER")
refreshIcon:SetTexture("Interface\\Icons\\Ability_Druid_Cyclone")
refreshIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local refreshHighlight = refreshButton:CreateTexture(nil, "HIGHLIGHT")
refreshHighlight:SetSize(24, 24)
refreshHighlight:SetPoint("CENTER", refreshButton, "CENTER")
refreshHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
refreshHighlight:SetBlendMode("ADD")

refreshButton:SetScript("OnClick", function()
    RequestAttunementData()
    SendAttunementData() -- Also send our own data
    -- Add visual feedback
    refreshIcon:SetRotation(math.pi)
    C_Timer.After(0.5, function()
        refreshIcon:SetRotation(0)
    end)
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

-- Scroll frame for friends list
local scrollFrame = CreateFrame("ScrollFrame", "FriendsAttunementScrollFrame", friendsFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", friendsFrame, "TOPLEFT", 10, -60)
scrollFrame:SetPoint("BOTTOMRIGHT", friendsFrame, "BOTTOMRIGHT", -30, 10)

local scrollChild = CreateFrame("Frame", nil, scrollFrame)
scrollChild:SetSize(210, 1) -- Width will be set properly, height will grow
scrollFrame:SetScrollChild(scrollChild)

-- Table to store friend entry frames
local friendEntries = {}

-- Class color table
local CLASS_COLORS = { -- TODO: his will be replaced with a better method later
    WARRIOR = "|cFFC79C6E",
    PALADIN = "|cFFF58CBA", 
    HUNTER = "|cFFABD473",
    ROGUE = "|cFFFFF569",
    PRIEST = "|cFFFFFFFF",
    DEATHKNIGHT = "|cFFC41F3B",
    SHAMAN = "|cFF0070DE",
    MAGE = "|cFF69CCF0",
    WARLOCK = "|cFF9482C9",
    DRUID = "|cFFFF7D0A"
}

-- Function to create a friend entry frame
local function CreateFriendEntry(index)
    local entry = CreateFrame("Frame", nil, scrollChild)
    entry:SetSize(210, 85)
    entry:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, -(index-1) * 90)
    
    -- Rank number (small, top-left)
    entry.rankText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    entry.rankText:SetPoint("TOPLEFT", entry, "TOPLEFT", 2, -2)
    entry.rankText:SetWidth(20)
    entry.rankText:SetJustifyH("LEFT")
    
    -- Player name with class color
    entry.nameText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    entry.nameText:SetPoint("TOPLEFT", entry, "TOPLEFT", 25, -5)
    entry.nameText:SetWidth(120)
    entry.nameText:SetJustifyH("LEFT")
    
    -- Progress percentage (large, right side)
    entry.percentageText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    entry.percentageText:SetPoint("TOPRIGHT", entry, "TOPRIGHT", -5, -5)
    entry.percentageText:SetWidth(60)
    entry.percentageText:SetJustifyH("RIGHT")
    
    -- Progress detail text
    entry.progressText = entry:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    entry.progressText:SetPoint("TOPLEFT", entry.nameText, "BOTTOMLEFT", 0, -2)
    entry.progressText:SetWidth(180)
    entry.progressText:SetJustifyH("LEFT")
    
    -- Top 3 dungeons needed
    entry.dungeonsText = entry:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    entry.dungeonsText:SetPoint("TOPLEFT", entry.progressText, "BOTTOMLEFT", 0, -2)
    entry.dungeonsText:SetWidth(200)
    entry.dungeonsText:SetJustifyH("LEFT")
    
    -- Time text (small, bottom right)
    entry.timeText = entry:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    entry.timeText:SetPoint("BOTTOMRIGHT", entry, "BOTTOMRIGHT", -5, 2)
    entry.timeText:SetWidth(60)
    entry.timeText:SetJustifyH("RIGHT")
    
    -- Crown icon for leader (16x16, next to name)
    entry.crownIcon = entry:CreateTexture(nil, "OVERLAY")
    entry.crownIcon:SetSize(24, 24)
    entry.crownIcon:SetPoint("RIGHT", entry.nameText, "RIGHT", 64, -24)
    entry.crownIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    entry.crownIcon:Hide() -- Hidden by default

    -- Quest item icon (16x16, positioned under the name)
    entry.questItemButton = CreateFrame("Button", nil, entry)
    entry.questItemButton:SetSize(16, 16)
    entry.questItemButton:SetPoint("TOPLEFT", entry.nameText, "BOTTOMLEFT", -22, 0)
    entry.questItemButton:RegisterForClicks("LeftButtonUp")
    entry.questItemButton:Hide() -- Hidden by default
    
    entry.questItemIcon = entry.questItemButton:CreateTexture(nil, "ARTWORK")
    entry.questItemIcon:SetSize(16, 16)
    entry.questItemIcon:SetPoint("CENTER", entry.questItemButton, "CENTER")
    entry.questItemIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    
    -- Quest item button scripts for hover and shift-click
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
    
    entry.questItemButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        end
    end)
    
    -- Enable mouse for tooltips
    entry:EnableMouse(true)
    entry:SetScript("OnEnter", function(self)
        if not self.playerData then return end
        
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("|cFFFFD700" .. self.playerData.playerName .. "|r")
        
        -- Show last seen info
        if self.playerData.isPlayer then
            GameTooltip:AddLine("|cFF00FF00You|r", 1, 1, 1)
        elseif self.playerData.lastSeen then
            GameTooltip:AddLine("|cFF888888Last seen: " .. self.playerData.lastSeen .. "|r", 1, 1, 1)
        end
        
        -- Show progress details
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Progress: " .. self.playerData.attuned .. "/" .. self.playerData.total .. " (" .. self.playerData.percentage .. "%)", 1, 1, 1)
        
        -- Show detailed dungeon breakdown (top 20 dungeons they need)
        if self.playerData.dungeonDetails and #self.playerData.dungeonDetails > 0 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFB347Top 20 Dungeons Needed:|r")
            local count = 0
            for i, dungeonData in ipairs(self.playerData.dungeonDetails) do
                if count >= 20 then break end
                if dungeonData.attunablesLeft > 0 then
                    count = count + 1
                    local percentLeft = dungeonData.attunementPercentage * 100
                    local color = "|cFF808080"
                    
                    if dungeonData.attunementPercentage == 0 then
                        color = "|cFF00FF00" -- Complete (shouldn't show but just in case)
                    elseif dungeonData.attunementPercentage <= 0.5 then
                        color = "|cFFFFFF00" -- Good progress
                    elseif dungeonData.attunementPercentage < 1 then
                        color = "|cFFFF4500" -- Needs work
                    else
                        color = "|cFFCC0000" -- Not started
                    end
                    
                    GameTooltip:AddDoubleLine(
                        color .. "• " .. dungeonData.name .. "|r",
                        color .. dungeonData.attunablesLeft .. "/" .. dungeonData.totalAttunable .. " (" .. string.format("%.0f", percentLeft) .. "%)|r"
                    )
                end
            end
            
            -- Fallback to old format if no detailed data
            if count == 0 and self.playerData.top3Dungeons and #self.playerData.top3Dungeons > 0 then
                for i, dungeonName in ipairs(self.playerData.top3Dungeons) do
                    if i <= 3 then
                        GameTooltip:AddLine("• " .. dungeonName, 1, 1, 0.8)
                    end
                end
            end
        elseif self.playerData.top3Dungeons and #self.playerData.top3Dungeons > 0 then
            -- Fallback to old format
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFB347Top Dungeons Needed:|r")
            for i, dungeonName in ipairs(self.playerData.top3Dungeons) do
                if i <= 3 then
                    GameTooltip:AddLine("• " .. dungeonName, 1, 1, 0.8)
                end
            end
        end
        
        -- Show missing BOE items if any
        if self.playerData.missingBOE and #self.playerData.missingBOE > 0 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFF00FF00Missing BOE Items:|r")
            
            for i, itemID in ipairs(self.playerData.missingBOE) do
                if i > 5 then -- Limit to 5 items to prevent huge tooltips
                    GameTooltip:AddLine("... and " .. (#self.playerData.missingBOE - 5) .. " more items", 0.7, 0.7, 0.7)
                    break
                end
                
                local itemName, itemLink, quality = GetItemInfo(itemID)
                if itemName then
                    local qualityColor = ITEM_QUALITY_COLORS[quality] or ITEM_QUALITY_COLORS[1]
                    GameTooltip:AddLine("• " .. itemName, qualityColor.r, qualityColor.g, qualityColor.b)
                else
                    GameTooltip:AddLine("• Item " .. itemID, 1, 1, 1)
                end
            end
        end
        
        GameTooltip:Show()
    end)
    
    entry:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    return entry
end

-- Function to update the friends display
function UpdateAttunementFriendsDisplay()
    -- Always add ourselves first to the global friends data
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
    end
    
    -- Ensure our data is in the global friends attunement data
    local playerName = UnitName("player")
    if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
        -- Also add our journal points
        if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
            _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
        end
    end
    
    -- Get friends data and sort by percentage (highest first for leaderboard)
    local sortedFriends = {}
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        local journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[playerName] or 0
        table.insert(sortedFriends, {
            playerName = playerName,
            class = data.class,
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
            questItemID = data.questItemID
        })
    end
    
    -- Sort by percentage descending (highest percentage first) for leaderboard
    table.sort(sortedFriends, function(a, b)
        if a.percentage ~= b.percentage then
            return a.percentage > b.percentage
        end
        return a.playerName < b.playerName
    end)
    
    -- Create or update friend entry frames
    for i = 1, math.max(#sortedFriends, #friendEntries) do
        if i <= #sortedFriends then
            -- Create entry if needed
            if not friendEntries[i] then
                friendEntries[i] = CreateFriendEntry(i)
            end
            
            local entry = friendEntries[i]
            local friendData = sortedFriends[i]
            
            -- Store data for tooltip
            entry.playerData = friendData
            
            -- Set rank number
            local rankColor = "|cFF888888" -- Gray for others
            if i == 1 then rankColor = "|cFFFFD700" -- Gold for 1st
            elseif i == 2 then rankColor = "|cFFC0C0C0" -- Silver for 2nd
            elseif i == 3 then rankColor = "|cFFCD7F32" -- Bronze for 3rd
            end
            entry.rankText:SetText(rankColor .. "#" .. i .. "|r")
            
            -- Set name with class color and highlight if it's the player
            local classColor = CLASS_COLORS[friendData.class] or "|cFFFFFFFF"
            local nameText = friendData.playerName
            if friendData.isPlayer then
                nameText = nameText .. " (You)"
            end
            
            -- Show crown icon for leader instead of text modification
            if i == 1 and #sortedFriends > 1 then
                entry.crownIcon:Show()
            else
                entry.crownIcon:Hide()
            end
            entry.nameText:SetText(classColor .. nameText .. "|r")

            -- Set large percentage display with color coding and first place gold
            local percentageColor = "|cFFFF4500" -- Red for low progress
            if i == 1 and #sortedFriends > 1 then
                percentageColor = "|cFFFFD700" -- Gold for first place
            elseif friendData.percentage >= 90 then
                percentageColor = "|cFF00FF00" -- Green for high progress
            elseif friendData.percentage >= 75 then
                percentageColor = "|cFF7FFF00" -- Light green
            elseif friendData.percentage >= 50 then
                percentageColor = "|cFFFFFF00" -- Yellow for medium progress
            elseif friendData.percentage >= 25 then
                percentageColor = "|cFFFF8000" -- Orange for low-medium progress
            end
            
            entry.percentageText:SetText(percentageColor .. friendData.percentage .. "%|r")
            
            -- Set progress detail
            entry.progressText:SetText("|cFF888888" .. friendData.attuned .. "/" .. friendData.total .. " items attuned|r")
            
            -- Set Quest Item display with icon and Journal Points
            local journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[friendData.playerName] or 0
            local questText = ""
            
            -- Debug output
            if DEBUG then
                print("|cFF00FF00[DJ Debug]|r Player: " .. friendData.playerName .. ", questItemID: " .. (friendData.questItemID or "nil") .. ", journalPoints: " .. journalPoints)
            end
            
            if friendData.questItemID and friendData.questItemID > 0 then
                -- Display quest item using GetItemInfoCustom
                local itemName, itemLink, quality, _, _, _, _, _, _, iTexture
                if _G.GetItemInfoCustom then
                    itemName, itemLink, quality, _, _, _, _, _, _, iTexture = _G.GetItemInfoCustom(friendData.questItemID)
                else
                    itemName, itemLink, quality, _, _, _, _, _, _, iTexture = GetItemInfo(friendData.questItemID)
                end
                
                if itemName then
                    local qualityColor = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
                    questText = qualityColor.hex .. itemName .. "|r"
                    
                    -- Set up the quest item icon
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
                    questText = questText .. " |cFFFFD700(" .. journalPoints .. " pts)|r"
                end
            else
                -- Hide quest item icon when no quest
                entry.questItemButton:Hide()
                entry.questItemButton.itemLink = nil
                
                if journalPoints > 0 then
                    questText = "|cFFFFD700Journal Points: " .. journalPoints .. "|r"
                else
                    questText = "|cFF888888No active quest|r"
                end
            end
            
            entry.dungeonsText:SetText(questText)
            
            -- Set time
            entry.timeText:SetText("|cFF666666" .. friendData.lastSeen .. "|r")
            
            entry:Show()
        else
            -- Hide unused entries
            if friendEntries[i] then
                friendEntries[i]:Hide()
            end
        end
    end
    
    -- Update scroll child height
    local contentHeight = math.max(1, #sortedFriends * 90)
    scrollChild:SetHeight(contentHeight)
end

-- Auto-refresh the display when data changes
local function OnFriendsDataUpdate()
    if friendsFrame:IsShown() then
        UpdateAttunementFriendsDisplay()
    end
    -- Only save when data actually changes, not on every display update
    DebouncedSave()
end

-- Hook the global friends data without triggering save on every display update
local originalUpdateAttunementFriendsDisplay = UpdateAttunementFriendsDisplay
UpdateAttunementFriendsDisplay = function()
    return originalUpdateAttunementFriendsDisplay()
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
                class = data.class,
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
            local classColor = CLASS_COLORS[friend.class] or "|cFFFFFFFF"
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

-- Auto-send our data when the frame is shown
friendsFrame:SetScript("OnShow", function()
    -- Position consistently relative to DungeonJournalFrame for better alignment
    friendsFrame:ClearAllPoints()
    friendsFrame:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPLEFT", -10, -20)
    friendsFrame:SetHeight(400)
    
    -- Update display from cache first
    UpdateAttunementFriendsDisplay()
    
    -- Only request fresh data if we haven't done so recently
    if not friendsFrame.lastRequest or (GetTime() - friendsFrame.lastRequest) > 30 then
        friendsFrame.lastRequest = GetTime()
        RequestAttunementData()
        SendAttunementData()
        
        -- Update once after a reasonable delay
        C_Timer.After(5, function()
            if friendsFrame:IsShown() then
                UpdateAttunementFriendsDisplay()
            end
        end)
    end
end)

-- Manage friends frame and quest icons when switching between views
local originalLoadDungeonDetail = _G.LoadDungeonDetail
_G.LoadDungeonDetail = function(dungeon)
    -- Keep friends frame visible and consistently positioned
    if friendsFrame then
        friendsFrame:ClearAllPoints()
        friendsFrame:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPLEFT", -10, -20)
        friendsFrame:SetHeight(400)
        friendsFrame:Show()
    end
    if questPopoutFrame then
        questPopoutFrame:Hide()
    end
    -- Show preview quest icon when in dungeon detail view
    if previewQuestIcon then
        previewQuestIcon:Show()
    end
    -- Show dungeon quest icon when in dungeon detail view
    if randomQuestIcon then
        randomQuestIcon:Show()
    end
    return originalLoadDungeonDetail(dungeon)
end

-- Expose the update function globally
_G.UpdateAttunementFriendsDisplay = UpdateAttunementFriendsDisplay
_G.AttunementFriendsFrame = friendsFrame

-- Initialize friends display immediately with cached data
local function InitializeFriendsDisplay()
    -- Add ourselves to the friends data immediately
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
end

    -- Update display with current cache
    UpdateAttunementFriendsDisplay()
    
    -- Also request fresh data from online friends
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
        -- Delay slightly to ensure all addon components are loaded
        C_Timer.After(1, InitializeFriendsDisplay)
        end
    end)


-- Report button tooltip with detailed dungeon breakdown
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
    
    -- Show friends summary if available
    local friendCount = 0
    local totalFriendsProgress = 0
    for _, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        if not data.isPlayer then -- Don't count ourselves in friends avg
        friendCount = friendCount + 1
        totalFriendsProgress = totalFriendsProgress + data.percentage
        end
    end
    
    if friendCount > 0 then
        local avgFriendsProgress = totalFriendsProgress / friendCount
        GameTooltip:AddLine("|cFF87CEEB" .. friendCount .. " Friends Avg: " .. string.format("%.1f", avgFriendsProgress) .. "%|r")
    end
    
    GameTooltip:AddLine(" ")
    
    -- Show top 20 dungeons needing attention with color coding
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

reportButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- ##################################################################
-- # ENHANCED BOE TOOLTIP INTEGRATION (More reliable for WotLK)
-- ##################################################################

-- Create a frame to handle tooltip updates for BOE items
local tooltipFrame = CreateFrame("Frame")
tooltipFrame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < 0.1 then return end -- Only check every 0.1 seconds
    self.elapsed = 0
    
    -- Check if GameTooltip is showing an item
    if GameTooltip:IsVisible() then
        local tooltipName = GameTooltip:GetName()
        local line1 = _G[tooltipName .. "TextLeft1"]
        
        if line1 and line1:GetText() then
            -- Try to get item link from various sources
            local itemLink = nil
            
            -- Method 1: Check if we're mousing over a bag item
            local mouseoverFrame = GetMouseFocus()
            if mouseoverFrame and mouseoverFrame:GetName() then
                local frameName = mouseoverFrame:GetName()
                if frameName:match("ContainerFrame%d+Item%d+") then
                    local bag = mouseoverFrame:GetParent():GetID()
                    local slot = mouseoverFrame:GetID()
                    itemLink = GetContainerItemLink(bag, slot)
                end
            end
            
            -- Method 2: Try GetItem (may not work in WotLK)
            if not itemLink then
                local name, link = GameTooltip:GetItem()
                itemLink = link
            end
            
            -- If we have an item link, process it for BOE data
            if itemLink and itemLink:match("^item:") then
                local itemID = tonumber(itemLink:match("item:(%d+)"))
                if itemID and _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
                    -- Check if we already added BOE data to this tooltip
                    local hasBoEData = false
                    for i = 1, GameTooltip:NumLines() do
                        local lineText = _G[tooltipName .. "TextLeft" .. i]
                        if lineText and lineText:GetText() and lineText:GetText():match("BOE Item") then
                            hasBoEData = true
                            break
                        end
                    end
                    
                    if not hasBoEData then
                        ProcessBOETooltip(GameTooltip, itemLink)
                        GameTooltip:Show() -- Refresh the tooltip
                    end
                end
            end
        end
    end
end)

print("|cFFFF0000[DJ INIT]|r Enhanced BOE tooltip integration loaded!")

-- ##################################################################
-- # DEBUG HELPERS FOR BOE TOOLTIP TESTING
-- ##################################################################

-- Debug check for critical functions

-- Run the debug check after a delay to ensure Core.lua has loaded
local debugFrame = CreateFrame("Frame")
debugFrame:RegisterEvent("PLAYER_LOGIN")
debugFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- Check after 2 seconds to ensure everything is loaded
        local timer = CreateFrame("Frame")
        timer:SetScript("OnUpdate", function(timerSelf, elapsed)
            timerSelf.elapsed = (timerSelf.elapsed or 0) + elapsed
            if timerSelf.elapsed >= 2 then
                timerSelf:SetScript("OnUpdate", nil)
            end
        end)
    end
end)

-- Global storage for original item links
_G.ORIGINAL_ITEM_LINKS = _G.ORIGINAL_ITEM_LINKS or {}

-- Hook the slash command handler to capture original text before processing
local originalSlashCmdList = SlashCmdList["DJ"]
SlashCmdList["DJ"] = function(msg)
    -- Check if this is a testboe command and try to capture original item link
    if msg and msg:find("^testboe") then
        local originalLink = msg:match("|c%x+|h%[.-%]|h|r")
        if originalLink then
            local itemID = tonumber(originalLink:match("item:(%d+)"))
            if itemID then
                _G.ORIGINAL_ITEM_LINKS[itemID] = originalLink
                print("|cFF00FF00[BOE Pre-Process]|r Captured original item link for ID " .. itemID)
            end
        end
    end
    
    -- Call the original slash command handler
    return originalSlashCmdList(msg)
end

-- Enhanced item link capture functionality integrated into original testboe command in Core.lua

-- Add a slash command to manually check ITEM_QUERY_RESPONSES
SLASH_DJBOETEST1 = "/djboetest"
SlashCmdList["DJBOETEST"] = function(msg)
    local itemID = tonumber(msg)
    if not itemID then
        print("|cFFFFD700[BOE Debug]|r Usage: /djboetest <itemID>")
        print("|cFFFFD700[BOE Debug]|r Example: /djboetest 19019")
        return
    end
    
    print("|cFFFFD700[BOE Debug]|r Checking responses for item " .. itemID)
    
    if _G.ITEM_QUERY_RESPONSES then
        print("|cFF00FF00[BOE Debug]|r ITEM_QUERY_RESPONSES table exists")
        if _G.ITEM_QUERY_RESPONSES[itemID] then
            print("|cFF00FF00[BOE Debug]|r Found responses for item " .. itemID .. ":")
            for friendName, response in pairs(_G.ITEM_QUERY_RESPONSES[itemID]) do
                local statusParts = {}
                if response.needsItem then table.insert(statusParts, "NEEDS") end
                if response.needsAffixesOnly then table.insert(statusParts, "AFFIXES_ONLY") end
                if response.canUpgrade then table.insert(statusParts, "CAN_UPGRADE") end
                local status = table.concat(statusParts, ", ")
                local age = math.floor(GetTime() - response.timestamp)
                print("|cFF87CEEB[BOE Debug]|r   " .. friendName .. ": " .. status .. " (age: " .. age .. "s)")
            end
        else
            print("|cFFFF0000[BOE Debug]|r No responses found for item " .. itemID)
        end
    else
        print("|cFFFF0000[BOE Debug]|r ITEM_QUERY_RESPONSES table does not exist!")
    end
end

-- Add a slash command to manually inject a test response
SLASH_DJBOEADD1 = "/djboeadd"
SlashCmdList["DJBOEADD"] = function(msg)
    local parts = {}
    for part in msg:gmatch("%S+") do
        table.insert(parts, part)
    end
    
    if #parts < 2 then
        print("|cFFFFD700[BOE Debug]|r Usage: /djboeadd <itemID> <playerName> [needs|affixes|upgrade]")
        print("|cFFFFD700[BOE Debug]|r Example: /djboeadd 19019 TestFriend needs")
        print("|cFFFFD700[BOE Debug]|r This adds a fake response for testing tooltips")
        return
    end
    
    local itemID = tonumber(parts[1])
    local playerName = parts[2]
    local responseType = parts[3] or "needs"
    
    if not itemID then
        print("|cFFFF0000[BOE Debug]|r Invalid item ID: " .. tostring(parts[1]))
        return
    end
    
    -- Initialize if needed
    if not _G.ITEM_QUERY_RESPONSES then
        _G.ITEM_QUERY_RESPONSES = {}
    end
    if not _G.ITEM_QUERY_RESPONSES[itemID] then
        _G.ITEM_QUERY_RESPONSES[itemID] = {}
    end
    
    -- Add the test response
    _G.ITEM_QUERY_RESPONSES[itemID][playerName] = {
        needsItem = (responseType == "needs"),
        needsAffixesOnly = (responseType == "affixes"),
        canUpgrade = (responseType == "upgrade"),
        currentForge = 0,
        timestamp = GetTime()
    }
    
    local itemName = GetItemInfo(itemID) or ("Item " .. itemID)
    print("|cFF00FF00[BOE Debug]|r Added test response for " .. itemName .. " from " .. playerName .. " (" .. responseType .. ")")
    print("|cFF00FF00[BOE Debug]|r Now hover over the item in your bags to test the tooltip!")
end

-- ##################################################################
-- # BOE TOOLTIP ENHANCEMENT
-- ##################################################################

-- Initialize tracking tables
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

-- Clean up old processed responses every 5 minutes to prevent memory buildup
local function CleanupProcessedResponses()
    local currentTime = GetTime()
    local cutoffTime = 300 -- 5 minutes
    local cleaned = 0
    
    for key, _ in pairs(_G.PROCESSED_BOE_RESPONSES) do
        -- Extract timestamp from the end of the key
        local timestamp = tonumber(key:match("_(%d+%.?%d*)$"))
        if timestamp and (currentTime - timestamp) > cutoffTime then
            _G.PROCESSED_BOE_RESPONSES[key] = nil
            cleaned = cleaned + 1
        end
    end
    
    if cleaned > 0 and _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Cleaned up " .. cleaned .. " old BOE response records")
    end
end

-- Schedule cleanup every 5 minutes
local cleanupTimer = C_Timer.NewTicker(300, CleanupProcessedResponses)

-- Enhanced BOE processing function with automatic testing and chat notifications
local function ProcessBOETooltip(tooltip, link)
    if not link or not link:match("^item:") then return end
    
    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then return end
    
    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Processing item ID: " .. itemID)
    end
    
    -- Check if this is a BOE item that's attunable by someone
    local itemName, itemLink, quality, _, _, _, _, _, _, texture, _, _, _, bindType = GetItemInfo(itemID)
    if not itemName then 

        return 
    end
    
    if _G.debug then
        print("|cFF00FF00[DJ DEBUG]|r Item: " .. itemName .. ", BindType: " .. (bindType or "nil"))
    end
    
    if bindType ~= 2 then 

        return 
    end
    
    -- Check if it's generally attunable (with fallbacks)
    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)

    elseif _G.CanAttuneItemHelper then
        -- Fallback: if we can attune it, assume someone can
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0

    end
    
        if not isAttunable then
        return
    end
    
    -- Auto-query friends about this item if we haven't recently
    local lastQueryTime = _G.LAST_BOE_QUERY_TIME[itemID]
    if not lastQueryTime or (GetTime() - lastQueryTime) > 10 then -- Only query every 10 seconds
        if _G.QueryItemFromFriends then
    
            _G.QueryItemFromFriends(itemID, link)
            
            -- Track when we last queried this item
            _G.LAST_BOE_QUERY_TIME[itemID] = GetTime()
            
            -- Show that we're automatically testing (only once per 30 seconds to avoid spam)
            local lastChatTime = _G.LAST_BOE_CHAT_TIME[itemID]
            if not lastChatTime or (GetTime() - lastChatTime) > 30 then
                print("|cFFFFD700[Auto BOE]|r Checking if friends need " .. (itemName or ("Item " .. itemID)))
                _G.LAST_BOE_CHAT_TIME[itemID] = GetTime()
            end
        end
    end
    
    -- Always add BOE section for attunable items
    tooltip:AddLine(" ")
    tooltip:AddLine("|cFFFFD700BOE Item - Friend Status:|r")
    
    -- Check for existing responses and add to tooltip
    local hasResponses = false
    if _G.debug then 
        print("|cFF00FF00[DJ DEBUG]|r Checking responses for item " .. itemID)
        if _G.ITEM_QUERY_RESPONSES[itemID] then
            print("|cFF00FF00[DJ DEBUG]|r Found responses table")
            for friendName, response in pairs(_G.ITEM_QUERY_RESPONSES[itemID]) do
                print("|cFF00FF00[DJ DEBUG]|r Response from " .. friendName .. ": needs=" .. tostring(response.needsItem) .. ", affixes=" .. tostring(response.needsAffixesOnly) .. ", upgrade=" .. tostring(response.canUpgrade))
            end
        else
            print("|cFF00FF00[DJ DEBUG]|r No responses found for item " .. itemID)
        end
    end
    
    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        local responses = _G.ITEM_QUERY_RESPONSES[itemID]
        local friendsWhoNeed = {}
        local friendsWhoNeedAffixes = {}
        local friendsWhoCanUpgrade = {}
        
        -- Get the original full item link that was queried (with all affix/forge information)
        -- ALWAYS prioritize the stored full link from queries over the current link parameter
        local fullItemLink = _G.QUERIED_ITEM_LINKS and _G.QUERIED_ITEM_LINKS[itemID]
        if not fullItemLink then
            -- Fallback to current link if no stored link available
            fullItemLink = link
        end
        
        for friendName, response in pairs(responses) do
             -- Only show recent responses (within last 30 seconds) and only process once per friend per item
             if GetTime() - response.timestamp < 30 then
                                 if response.needsItem then
                     table.insert(friendsWhoNeed, friendName)
                     -- Auto whisper and chat notification for friends who need it (only once per response)
                     local responseKey = itemID .. "_" .. friendName .. "_" .. response.timestamp
                     if not _G.PROCESSED_BOE_RESPONSES[responseKey] then
                         -- Whisper the friend directly with FULL item link (includes affixes/forge level)
                         SendChatMessage("Hey! I have " .. fullItemLink .. " - you need this for attunement right?", "WHISPER", nil, friendName)
                         print("|cFF00FF00[BOE Alert]|r Whispered " .. friendName .. " about " .. itemName)
                         _G.PROCESSED_BOE_RESPONSES[responseKey] = true
                     end
                elseif response.needsAffixesOnly then
                    table.insert(friendsWhoNeedAffixes, friendName)
                                 elseif response.canUpgrade then
                     local forgeText = ""
                     if response.currentForge == 1 then forgeText = " (Titanforged)"
                     elseif response.currentForge == 2 then forgeText = " (Warforged)"
                     elseif response.currentForge == 3 then forgeText = " (Lightforged)"
                     end
                     table.insert(friendsWhoCanUpgrade, friendName .. forgeText)
                     -- Auto whisper for upgrade opportunities (only once per response)
                     local upgradeResponseKey = itemID .. "_" .. friendName .. "_upgrade_" .. response.timestamp
                     if not _G.PROCESSED_BOE_RESPONSES[upgradeResponseKey] then
                         -- Use FULL item link (includes affixes/forge level)
                         SendChatMessage("I have " .. fullItemLink .. " if you want to upgrade your" .. forgeText .. " version", "WHISPER", nil, friendName)
                         print("|cFFFFFF00[BOE Upgrade]|r Whispered " .. friendName .. " about upgrade opportunity")
                         _G.PROCESSED_BOE_RESPONSES[upgradeResponseKey] = true
                     end
                end
            end
        end
        
        -- Add tooltip lines if we have responses
        if #friendsWhoNeed > 0 or #friendsWhoNeedAffixes > 0 or #friendsWhoCanUpgrade > 0 then
            hasResponses = true
            if _G.debug then 
                print("|cFF00FF00[DJ DEBUG]|r Adding tooltip lines - Needs: " .. #friendsWhoNeed .. ", Affixes: " .. #friendsWhoNeedAffixes .. ", Upgrades: " .. #friendsWhoCanUpgrade)
            end
            
            if #friendsWhoNeed > 0 then
                tooltip:AddLine("|cFF00FF00Needs:|r " .. table.concat(friendsWhoNeed, ", "), 1, 1, 1, true)
        
            end
            
            if #friendsWhoNeedAffixes > 0 then
                tooltip:AddLine("|cFFFFFF00Affixes Only:|r " .. table.concat(friendsWhoNeedAffixes, ", "), 1, 1, 1, true)
        
            end
            
            if #friendsWhoCanUpgrade > 0 then
                tooltip:AddLine("|cFFFFFF00Can Upgrade:|r " .. table.concat(friendsWhoCanUpgrade, ", "), 1, 1, 1, true)
        
            end
            
            tooltip:AddLine("|cFF888888(Responses from last 30s)|r")
        end
    end
    
    if not hasResponses then
        tooltip:AddLine("|cFF888888Querying friends... (or no responses yet)|r")
    end
end

-- Enhanced item link capture for GameTooltip (Keep this part)
local originalTooltipSetOwner = GameTooltip.SetOwner
GameTooltip.SetOwner = function(self, owner, ...)
    local result = originalTooltipSetOwner(self, owner, ...)
    
    -- When tooltip appears, try to capture original item links
    if self == GameTooltip then
        local itemName, itemLink = self:GetItem()
        if itemLink then
            local itemID = tonumber(itemLink:match("item:(%d+)"))
            if itemID then
                _G.ORIGINAL_ITEM_LINKS[itemID] = itemLink
                if _G.debug then
                    print("|cFF00FF00[BOE Pre-Process]|r Captured original item link for ID " .. itemID .. " via tooltip")
                end
            end
        end
    end
    
    return result
end

-- ##################################################################
-- # RANDOM ITEM QUEST SYSTEM
-- ##################################################################

-- Initialize Journal Points system
Journal_charDB.journalPoints = Journal_charDB.journalPoints or 0
Journal_charDB.randomQuestCache = Journal_charDB.randomQuestCache or {}
Journal_charDB.currentRandomQuest = Journal_charDB.currentRandomQuest or nil

-- Cache for unattuned items from dungeons for efficient random selection
local unattunedItemsCache = {}
local cacheLastUpdated = 0

-- Function to update the unattuned items cache
local function UpdateUnattunedItemsCache()
    local currentTime = GetTime()
    if currentTime - cacheLastUpdated < 30 then -- Update cache every 30 seconds max
        return
    end
    
    wipe(unattunedItemsCache)
    
    -- Collect unattuned items from all dungeons
    for _, dungeon in ipairs(dungeonData or {}) do
        if dungeon.items then
            for _, itemID in ipairs(dungeon.items) do
                local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                if canAttune == 1 then
                    local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                    if attuneProgress < 100 then
                        -- Check if item has a source
                        local hasSource = false
                        if _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
                            local bestSource = _G.ItemLocAPI:GetBestSource(itemID, dungeon.name)
                            hasSource = bestSource and bestSource.chance and bestSource.chance > 0
                        elseif ItemLocGetSourceCount then
                            local sourceCount = ItemLocGetSourceCount(itemID) or 0
                            hasSource = sourceCount > 0
                        end
                        
                        if hasSource then
                            table.insert(unattunedItemsCache, {
                                itemID = itemID,
                                dungeonName = dungeon.name
                            })
                        end
                    end
                end
            end
        end
    end
    
    cacheLastUpdated = currentTime
    if _G.debug then
        print("|cFF00FF00[Random Quest]|r Updated cache with " .. #unattunedItemsCache .. " unattuned items")
    end
end

-- Function to get a random unattuned item using lazy algorithm
local function GetRandomUnattunedItem()
    -- First try: use cached items for efficiency
    UpdateUnattunedItemsCache()
    
    if #unattunedItemsCache > 0 then
        local randomIndex = math.random(1, #unattunedItemsCache)
        local selectedItem = unattunedItemsCache[randomIndex]
        
        -- Double-check that it's still unattuned
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(selectedItem.itemID) or 0
        local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(selectedItem.itemID) or 0
        
        if canAttune == 1 and attuneProgress < 100 then
            return selectedItem.itemID, selectedItem.dungeonName
        end
    end
    
    -- Fallback: lazy algorithm with random item IDs
    local maxAttempts = 50 -- Prevent infinite loops
    local attempts = 0
    
    while attempts < maxAttempts do
        attempts = attempts + 1
        local randomItemID = math.random(1, 64000)
        
        -- Check if item exists and is attunable by character
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(randomItemID) or 0
        if canAttune == 1 then
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(randomItemID) or 0
            if attuneProgress < 100 then
                -- Check if item has exactly one source
                local sourceCount = 0
                local sourceName = nil
                
                if ItemLocGetSourceCount then
                    sourceCount = ItemLocGetSourceCount(randomItemID) or 0
                    if sourceCount == 1 then
                        -- Get the source name
                        local srcType, objType, objId, chance, dropsPerThousand, objName, zoneName = ItemLocGetSourceAt(randomItemID, 1)
                        sourceName = objName or "Unknown Source"
                    end
                end
                
                if sourceCount == 1 then
                    return randomItemID, sourceName
                end
            end
        end
    end
    
    return nil, nil
end

-- Create small Random Quest icon for dungeon detail frame
local randomQuestIcon = CreateFrame("Button", "DJ_RandomQuestIcon", dungeonDetailFrame)
randomQuestIcon:SetSize(24, 24)
randomQuestIcon:SetPoint("BOTTOMRIGHT", dungeonDetailFrame, "BOTTOMRIGHT", 60, -75)
randomQuestIcon:SetFrameStrata("FULLSCREEN")
randomQuestIcon:SetFrameLevel(dungeonDetailFrame:GetFrameLevel() + 20)

local questIconTexture = randomQuestIcon:CreateTexture(nil, "ARTWORK")
questIconTexture:SetSize(24, 24)
questIconTexture:SetPoint("CENTER", randomQuestIcon, "CENTER")
questIconTexture:SetTexture("Interface\\Icons\\INV_Scroll_03") -- Using scroll icon for now
questIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local questIconHighlight = randomQuestIcon:CreateTexture(nil, "HIGHLIGHT")
questIconHighlight:SetSize(24, 24)
questIconHighlight:SetPoint("CENTER", randomQuestIcon, "CENTER")
questIconHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
questIconHighlight:SetBlendMode("ADD")

-- Create small Random Quest icon for preview frame (main view) - only show in dungeon details
local previewQuestIcon = CreateFrame("Button", "DJ_PreviewQuestIcon", previewFrame)
previewQuestIcon:SetSize(24, 24)
previewQuestIcon:SetPoint("BOTTOMRIGHT", previewFrame, "BOTTOMRIGHT", -50, -45)
previewQuestIcon:SetFrameStrata("FULLSCREEN")
previewQuestIcon:SetFrameLevel(previewFrame:GetFrameLevel() + 20)
previewQuestIcon:Hide() -- Hidden by default

local previewIconTexture = previewQuestIcon:CreateTexture(nil, "ARTWORK")
previewIconTexture:SetSize(24, 24)
previewIconTexture:SetPoint("CENTER", previewQuestIcon, "CENTER")
previewIconTexture:SetTexture("Interface\\Icons\\INV_Scroll_03")
previewIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local previewIconHighlight = previewQuestIcon:CreateTexture(nil, "HIGHLIGHT")
previewIconHighlight:SetSize(24, 24)
previewIconHighlight:SetPoint("CENTER", previewQuestIcon, "CENTER")
previewIconHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
previewIconHighlight:SetBlendMode("ADD")

-- Create Quest Popout Frame
local questPopoutFrame = CreateFrame("Frame", "DJ_QuestPopoutFrame", DungeonJournalFrame)
questPopoutFrame:SetSize(180, 70)
questPopoutFrame:SetPoint("TOPLEFT", DungeonJournalFrame, "TOPRIGHT", -180, -425)
questPopoutFrame:SetFrameStrata("FULLSCREEN")
questPopoutFrame:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 30)
questPopoutFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 32, edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
questPopoutFrame:SetBackdropColor(0.1, 0.1, 0.2, 0.9)
questPopoutFrame:SetBackdropBorderColor(0.4, 0.4, 0.6, 1)
questPopoutFrame:EnableMouse(true)
questPopoutFrame:Hide()

-- Add re-roll button to quest popout frame
local rerollButton = CreateFrame("Button", "DJ_QuestRerollButton", questPopoutFrame)
rerollButton:SetSize(20, 20)
rerollButton:SetPoint("TOPRIGHT", questPopoutFrame, "TOPRIGHT", -5, -5)

local rerollIcon = rerollButton:CreateTexture(nil, "ARTWORK")
rerollIcon:SetSize(16, 16)
rerollIcon:SetPoint("CENTER", rerollButton, "CENTER")
rerollIcon:SetTexture("Interface\\Icons\\INV_Misc_Dice_01")

local rerollHighlight = rerollButton:CreateTexture(nil, "HIGHLIGHT")
rerollHighlight:SetSize(20, 20)
rerollHighlight:SetPoint("CENTER", rerollButton, "CENTER")
rerollHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
rerollHighlight:SetBlendMode("ADD")

-- Add tooltip to re-roll button
rerollButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText("|cFFFFD700Re-roll Quest|r")
    GameTooltip:AddLine("Click to get a new random item quest", 1, 1, 1)
    GameTooltip:Show()
end)

rerollButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- Function to get a random unattuned item (optimized version)
local function GetRandomUnattunedItem()
    local maxAttempts = 100 -- Reduced from previous value to prevent excessive attempts
    local attempts = 0
    
    while attempts < maxAttempts do
        attempts = attempts + 1
        local randomItemID = math.random(1, 64000)
        
        -- Check if item exists and is attunable by character
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(randomItemID) or 0
        if canAttune == 1 then
            -- Check item tags to exclude items with tag 32
            local shouldExclude = false
            if _G.GetItemTagsCustom then
                local itemTags = _G.GetItemTagsCustom(randomItemID)
                if itemTags and bit.band(itemTags, 32) ~= 0 then
                    shouldExclude = true
                end
            end
            
            if not shouldExclude then
                local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(randomItemID) or 0
                if attuneProgress < 100 then
                -- Check if item has exactly one source
                local sourceCount = 0
                local sourceName = nil
                
                if ItemLocGetSourceCount then
                    sourceCount = ItemLocGetSourceCount(randomItemID) or 0
                    if sourceCount == 1 then
                        -- Get the source name
                        local srcType, objType, objId, chance, dropsPerThousand, objName, zoneName = ItemLocGetSourceAt(randomItemID, 1)
                        sourceName = objName or "Unknown Source"
                        return randomItemID, sourceName
                    end
                end
            end
        end -- ???
        end
    end
    
    return nil, nil
end

-- Re-roll button click handler
rerollButton:SetScript("OnClick", function(self)
    if Journal_charDB.currentRandomQuest then
        -- Only allow re-rolling if there's an active quest
        StartRandomQuest()
        UpdateCurrentQuestDisplay()
    end
end)

-- Quest item display in popout (styled like dungeon items) - make it a clickable button
local questItemButton = CreateFrame("Button", "DJ_QuestItemButton", questPopoutFrame)
questItemButton:SetSize(165, 32)
questItemButton:SetPoint("TOPLEFT", questPopoutFrame, "TOPLEFT", 8, -12)

local questItemIcon = questItemButton:CreateTexture(nil, "ARTWORK")
questItemIcon:SetSize(30, 30)
questItemIcon:SetPoint("LEFT", questItemButton, "LEFT", 2, 0)

local questItemText = questItemButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
questItemText:SetPoint("LEFT", questItemIcon, "RIGHT", 5, 0)
questItemText:SetPoint("RIGHT", questItemButton, "RIGHT", -5, 0)
questItemText:SetJustifyH("LEFT")

local questSourceText = questPopoutFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
questSourceText:SetPoint("TOPLEFT", questItemButton, "BOTTOMLEFT", 5, -2)
questSourceText:SetPoint("RIGHT", questPopoutFrame, "RIGHT", -10, 0)
questSourceText:SetJustifyH("LEFT")

local questPointsText = questPopoutFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
questPointsText:SetPoint("TOPLEFT", questSourceText, "BOTTOMLEFT", 0, -8)
questPointsText:SetText("|cFFFFD700Journal Points: 0|r")

-- Add item link functionality and tooltip to quest item button
questItemButton:RegisterForClicks("LeftButtonUp")
questItemButton.itemLink = nil

questItemButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
        ChatEdit_InsertLink(self.itemLink)
    end
end)

questItemButton:SetScript("OnEnter", function(self)
    if self.itemLink then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetHyperlink(self.itemLink)
        GameTooltip:Show()
    end
end)

questItemButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- Function to update the current quest display
local function UpdateCurrentQuestDisplay()
    questPointsText:SetText("|cFFFFD700Journal Points: " .. (Journal_charDB.journalPoints or 0) .. "|r")
    
    if Journal_charDB.currentRandomQuest then
        local quest = Journal_charDB.currentRandomQuest
        local itemName, itemLink, iQuality, _, _, _, _, _, _, iTexture = GetItemInfo(quest.itemID)
        
        if not itemName then
            itemName = "Item " .. quest.itemID
            itemLink = "item:" .. quest.itemID
            iTexture = "Interface\\Icons\\INV_Misc_QuestionMark"
            iQuality = 1
        end
        
        local color = ITEM_QUALITY_COLORS[iQuality or 1] or ITEM_QUALITY_COLORS[1]
        
        questItemIcon:SetTexture(iTexture)
        questItemText:SetText(color.hex .. itemName .. "|r")
        questSourceText:SetText("|cFF888888Source: " .. quest.sourceName .. "|r")
        
        -- Store the item link for click/tooltip functionality
        questItemButton.itemLink = itemLink
        
        -- Check completion status
        local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
        if attuneProgress >= 100 then
            questSourceText:SetText("|cFF00FF00Quest Complete! Click to claim reward.|r")
        end
    else
        questItemIcon:SetTexture("Interface\\Icons\\INV_Scroll_03")
        questItemText:SetText("|cFFFFFFFFNo Active Quest|r")
        questSourceText:SetText("|cFF888888Click to get a random item quest|r")
        
        -- Clear the item link when no quest
        questItemButton.itemLink = nil
    end
end

-- Function to complete the current quest
local function CompleteRandomQuest()
    if not Journal_charDB.currentRandomQuest then return false end
    
    local quest = Journal_charDB.currentRandomQuest
    local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
    
    if attuneProgress >= 100 then
        -- Quest completed! Award points
        Journal_charDB.journalPoints = (Journal_charDB.journalPoints or 0) + 1
        Journal_charDB.currentRandomQuest = nil
        
        local itemName = GetItemInfo(quest.itemID) or ("Item " .. quest.itemID)
        print("|cFF00FF00[Random Quest Complete]|r You attuned " .. itemName .. "! Earned 1 Journal Point!")
        print("|cFFFFD700[Journal Points]|r Total: " .. Journal_charDB.journalPoints)
        
        -- Share quest completion with friends if enabled
        if Journal_charDB.shareQuestCompletion and _G.SendChatMessage then
            local playerName = UnitName("player")
            local completionMessage = "[DJ Quest Complete] " .. playerName .. " completed random quest: " .. itemName .. " (Total Points: " .. Journal_charDB.journalPoints .. ")"
            _G.SendChatMessage(completionMessage, "GUILD")
        end
        
        -- Update and share attunement data with friends
        if _G.SendAttunementData then
            _G.SendAttunementData()
        end
        
        UpdateCurrentQuestDisplay()
        return true
    end
    
    return false
end

-- Function to start a new random quest
local function StartRandomQuest()
    local itemID, sourceName = GetRandomUnattunedItem()
    
    if itemID then
        Journal_charDB.currentRandomQuest = {
            itemID = itemID,
            sourceName = sourceName,
            startTime = GetTime()
        }
        
        local itemName = GetItemInfoCustom(itemID) or ("Item " .. itemID)
        print("|cFFFFD700[Random Quest]|r New quest: Attune " .. itemName)
        print("|cFF87CEEB[Random Quest]|r Source: " .. sourceName)
        
        UpdateCurrentQuestDisplay()
    else
        print("|cFFFF0000[Random Quest]|r Could not find a suitable item. Try again!")
    end
end

-- Quest Popout click handler
questPopoutFrame:SetScript("OnMouseDown", function()
    if Journal_charDB.currentRandomQuest then
        if CompleteRandomQuest() then
            UpdateCurrentQuestDisplay()
        else
            -- Quest not completed yet, show progress
            local quest = Journal_charDB.currentRandomQuest
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
            local itemName = GetItemInfoCustom(quest.itemID) or ("Item " .. quest.itemID)
            print("|cFFFFFF00[Random Quest]|r " .. itemName .. " progress: " .. string.format("%.1f", attuneProgress) .. "%")
        end
    else
        StartRandomQuest()
        UpdateCurrentQuestDisplay()
    end
end)

-- Icon click handlers to show/hide popout
local function ToggleQuestPopout()
    if questPopoutFrame:IsShown() then
        questPopoutFrame:Hide()
    else
        -- Update display before showing
        UpdateCurrentQuestDisplay()
        questPopoutFrame:Show()
    end
end

randomQuestIcon:SetScript("OnClick", ToggleQuestPopout)
previewQuestIcon:SetScript("OnClick", ToggleQuestPopout)

-- Icon tooltips
local function ShowQuestIconTooltip(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:SetText("|cFFFFD700Random Item Quest|r")
    GameTooltip:AddLine("Click to view your quest progress", 1, 1, 1)
    GameTooltip:AddLine("Journal Points: " .. (Journal_charDB.journalPoints or 0), 1, 1, 0)
    GameTooltip:Show()
end

randomQuestIcon:SetScript("OnEnter", ShowQuestIconTooltip)
previewQuestIcon:SetScript("OnEnter", ShowQuestIconTooltip)

randomQuestIcon:SetScript("OnLeave", function() GameTooltip:Hide() end)
previewQuestIcon:SetScript("OnLeave", function() GameTooltip:Hide() end)

-- Initialize the display when the frame is shown
local originalLoadDungeonDetailForQuest = _G.LoadDungeonDetail
_G.LoadDungeonDetail = function(dungeon)
    local result = originalLoadDungeonDetailForQuest(dungeon)
    -- Update quest display when dungeon details are loaded
    C_Timer.After(0.1, UpdateCurrentQuestDisplay)
    -- Show preview quest icon only in dungeon details view
    if previewQuestIcon then
        previewQuestIcon:Show()
    end
    return result
end

-- Hook the preview frame show/hide to control quest icon visibility
local originalShowPreview = ShowPreview
ShowPreview = function()
    if originalShowPreview then
        originalShowPreview()
    end
    -- Hide preview quest icon when returning to main preview
    if previewQuestIcon then
        previewQuestIcon:Hide()
    end
end

-- Auto-check for quest completion when items are attuned
local questCheckFrame = CreateFrame("Frame")
questCheckFrame:RegisterEvent("CHAT_MSG_SYSTEM")
questCheckFrame:SetScript("OnEvent", function(self, event, message)
    if event == "CHAT_MSG_SYSTEM" and message and Journal_charDB.currentRandomQuest then
        -- Check for attunement completion messages
        if message:find("attuned") or message:find("Attunement") then
            C_Timer.After(1, function()
                CompleteRandomQuest()
            end)
        end
    end
end)

-- ##################################################################
-- # ENHANCED FRIEND ATTUNEMENT TOOLTIP
-- ##################################################################

-- Function to check if friends need an item for attunement
local function GetFriendsWhoNeedItem(itemID)
    local friendsWhoNeed = {}
    
    if not _G.FRIENDS_ATTUNEMENT_DATA or not itemID then
        return friendsWhoNeed
    end
    
    -- Check each friend's attunement status for this item
    for playerName, friendData in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        if not friendData.isPlayer then -- Don't include ourselves
            -- Check if this friend can attune this item and hasn't yet
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            if canAttune == 1 then
                -- For friends, we need to check their missing items or assume they need it if it exists in dungeon data
                local needsItem = false
                
                -- Method 1: Check their missing BOE items list
                if friendData.missingBOE and #friendData.missingBOE > 0 then
                    for _, missingItemID in ipairs(friendData.missingBOE) do
                        if missingItemID == itemID then
                            needsItem = true
                            break
                        end
                    end
                end
                
                -- Method 2: If no missing BOE data, check if they have lower overall progress
                -- This is a heuristic - if they have less than 90% progress, they likely need items
                if not needsItem and friendData.percentage and friendData.percentage < 90 then
                    -- Check if this item appears in dungeons they still need
                    if friendData.dungeonDetails then
                        for _, dungeonInfo in ipairs(friendData.dungeonDetails) do
                            if dungeonInfo.attunablesLeft > 0 then
                                -- Find the dungeon and check if this item is in it
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

-- Enhanced ProcessBOETooltip function to include friend attunement status
local originalProcessBOETooltip = ProcessBOETooltip
ProcessBOETooltip = function(tooltip, link)
    -- Call the original function first
    if originalProcessBOETooltip then
        originalProcessBOETooltip(tooltip, link)
    end
    
    -- Add friend attunement check for any item (not just BOE)
    if not link or not link:match("^item:") then return end
    
    local itemID = tonumber(link:match("item:(%d+)"))
    if not itemID then return end
    
    -- Check if any friends need this item for attunement
    local friendsWhoNeed = GetFriendsWhoNeedItem(itemID)
    
    if #friendsWhoNeed > 0 then
        -- Add section for friends who need this item
        tooltip:AddLine(" ")
        tooltip:AddLine("|cFFFFD700Friend Attunement Status:|r")
        tooltip:AddLine("|cFFFF6600Unattuned: " .. table.concat(friendsWhoNeed, ", ") .. "|r", 1, 1, 1, true)
    end
end

-- Hook into the general tooltip system for all items, not just BOE
local function EnhanceTooltipWithFriendStatus(tooltip)
    local name, link = tooltip:GetItem()
    if link then
        ProcessBOETooltip(tooltip, link)
    end
end

-- Hook GameTooltip to show friend status on all item tooltips
local originalGameTooltipShow = GameTooltip.Show
GameTooltip.Show = function(self)
    -- Enhance tooltip before showing
    EnhanceTooltipWithFriendStatus(self)
    return originalGameTooltipShow(self)
end

-- Update Journal Points in friends data when shared
local originalSendAttunementData = _G.SendAttunementData
if originalSendAttunementData then
    _G.SendAttunementData = function()
        -- Include Journal Points in the data we send
        local result = originalSendAttunementData()
        
        -- Save friends data after sending (in case we updated our own data)
        if Journal_charDB then
            SaveFriendsData()
        end
        
        -- Send journal points as part of the message
        if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
            local playerName = UnitName("player")
            local realmName = GetRealmName()
            local fullName = playerName .. "-" .. realmName
            
            SendAddonMessage("DJ_POINTS", tostring(Journal_charDB.journalPoints), "GUILD")
            if IsInGroup() then
                SendAddonMessage("DJ_POINTS", tostring(Journal_charDB.journalPoints), "PARTY")
            end
            if IsInRaid() then
                SendAddonMessage("DJ_POINTS", tostring(Journal_charDB.journalPoints), "RAID")
            end
        end
        
        return result
    end
end

-- Listen for Journal Points from friends
local pointsFrame = CreateFrame("Frame")
pointsFrame:RegisterEvent("CHAT_MSG_ADDON")
pointsFrame:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
    if event == "CHAT_MSG_ADDON" and prefix == "DJ_POINTS" then
        local points = tonumber(message)
        if points and points > 0 then
            -- Store friend's journal points
            if not _G.FRIENDS_JOURNAL_POINTS then
                _G.FRIENDS_JOURNAL_POINTS = {}
            end
            _G.FRIENDS_JOURNAL_POINTS[sender] = points
            
            -- Use debounced save instead of immediate save
            DebouncedSave()
            
            -- Update friends display if it's showing
            if _G.UpdateAttunementFriendsDisplay then
                _G.UpdateAttunementFriendsDisplay()
            end
        end
    end
end)

-- Initialize quest display on login
local initQuestFrame = CreateFrame("Frame")
initQuestFrame:RegisterEvent("PLAYER_LOGIN")
initQuestFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(2, function()
            UpdateCurrentQuestDisplay()
            -- Check if there's a completed quest on login
            if Journal_charDB.currentRandomQuest then
                CompleteRandomQuest()
            end
        end)
    end
end)

print("|cFF00FF00[DJ Features]|r Random Item Quest system and enhanced friend tooltips loaded!")

-- ##################################################################
-- # SLASH COMMAND EXTENSIONS
-- ##################################################################

-- Add journal points commands to existing slash handler
local originalDJSlashHandler = SlashCmdList["DJ"]
SlashCmdList["DJ"] = function(msg)
    msg = string.lower(string.trim(msg or ""))
    
    if msg == "points" then
        print("|cFFFFD700[Journal Points]|r You have " .. (Journal_charDB.journalPoints or 0) .. " Journal Points")
        if Journal_charDB.currentRandomQuest then
            local quest = Journal_charDB.currentRandomQuest
            local itemName = GetItemInfoCustom(quest.itemID) or ("Item " .. quest.itemID)
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
            print("|cFF00FF00[Current Quest]|r " .. itemName .. " (" .. string.format("%.1f", attuneProgress) .. "% progress)")
        else
            print("|cFF87CEEB[Random Quest]|r No active quest. Use the Random Quest button to start one!")
        end
    elseif msg == "friendsdebug" then
        print("|cFFFFD700[DJ Debug]|r === FRIENDS DATA DEBUG ===")
        
        -- Check FRIENDS_JOURNAL_POINTS
        if _G.FRIENDS_JOURNAL_POINTS then
            local count = 0
            for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
                count = count + 1
                print("|cFF00FF00[DJ Debug]|r FRIENDS_JOURNAL_POINTS[" .. playerName .. "] = " .. points)
            end
            print("|cFF00FF00[DJ Debug]|r Total in FRIENDS_JOURNAL_POINTS: " .. count)
        else
            print("|cFFFF0000[DJ Debug]|r FRIENDS_JOURNAL_POINTS is nil!")
        end
        
        -- Check Journal_charDB.friendsJournalPoints
        if Journal_charDB and Journal_charDB.friendsJournalPoints then
            local count = 0
            for playerName, points in pairs(Journal_charDB.friendsJournalPoints) do
                count = count + 1
                print("|cFF87CEEB[DJ Debug]|r Journal_charDB.friendsJournalPoints[" .. playerName .. "] = " .. points)
            end
            print("|cFF87CEEB[DJ Debug]|r Total in Journal_charDB.friendsJournalPoints: " .. count)
        else
            print("|cFFFF0000[DJ Debug]|r Journal_charDB.friendsJournalPoints is nil!")
        end
        
        -- Check FRIENDS_ATTUNEMENT_DATA
        if _G.FRIENDS_ATTUNEMENT_DATA then
            local count = 0
            for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
                count = count + 1
                local questItemID = data.questItemID or 0
                print("|cFFFFFF00[DJ Debug]|r FRIENDS_ATTUNEMENT_DATA[" .. playerName .. "] questItemID = " .. questItemID)
            end
            print("|cFFFFFF00[DJ Debug]|r Total in FRIENDS_ATTUNEMENT_DATA: " .. count)
        else
            print("|cFFFF0000[DJ Debug]|r FRIENDS_ATTUNEMENT_DATA is nil!")
        end
        
        -- Check our own data
        local playerName = UnitName("player")
        print("|cFF00FF00[DJ Debug]|r Your name: " .. playerName)
        print("|cFF00FF00[DJ Debug]|r Your journal points: " .. (Journal_charDB.journalPoints or 0))
        if Journal_charDB.currentRandomQuest then
            print("|cFF00FF00[DJ Debug]|r Your quest item: " .. (Journal_charDB.currentRandomQuest.itemID or "none"))
        else
            print("|cFF00FF00[DJ Debug]|r Your quest item: none")
        end
        
        print("|cFFFFD700[DJ Debug]|r === END DEBUG ===")
    elseif msg == "debug" then
        DEBUG = not DEBUG
        print("|cFFFFD700[DJ Debug]|r Debug mode " .. (DEBUG and "ENABLED" or "DISABLED"))
    else
        -- Call original handler for all other commands
        return originalDJSlashHandler(msg)
    end
end

-- Save friends data on logout/reload
local logoutFrame = CreateFrame("Frame")
logoutFrame:RegisterEvent("PLAYER_LOGOUT")
logoutFrame:RegisterEvent("ADDON_LOADED")
logoutFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "PLAYER_LOGOUT" or (event == "ADDON_LOADED" and addonName == "TheJournal") then
        if Journal_charDB then
            -- Force immediate save on logout/reload
            SaveFriendsData()
        end
    end
end)

-- Global functions for external access
_G.GetRandomUnattunedItem = GetRandomUnattunedItem
_G.StartRandomQuest = StartRandomQuest
_G.CompleteRandomQuest = CompleteRandomQuest
_G.GetFriendsWhoNeedItem = GetFriendsWhoNeedItem
_G.UpdateCurrentQuestDisplay = UpdateCurrentQuestDisplay
_G.SaveFriendsData = SaveFriendsData

-- Also add initialization for when the addon loads
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- Initial sort after login
        C_Timer.After(1, function()
            RefreshAllAttunableText()
            SortDungeonsByAttunement()
            FilterDungeonsByCategory()
        end)
    end
end)

