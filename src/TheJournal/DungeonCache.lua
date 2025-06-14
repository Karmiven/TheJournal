-- Initialize local cache tables
local dungeonCache = {
    byName = {},      -- name -> dungeon data
    byCategory = {},  -- category -> array of dungeons
    allDungeons = {}, -- array of all dungeons in order
    bossIds = {},     -- bossId -> {dungeon = dungeon, boss = boss}
    initialized = false
}

-- Helper function to add a dungeon to cache
local function CacheDungeon(dungeon)
    if not dungeon or not dungeon.name then return end
    
    -- Cache by name
    dungeonCache.byName[dungeon.name] = dungeon
    
    -- Cache by category
    if dungeon.category then
        if not dungeonCache.byCategory[dungeon.category] then
            dungeonCache.byCategory[dungeon.category] = {}
        end
        table.insert(dungeonCache.byCategory[dungeon.category], dungeon)
    end
    
    -- Cache in all dungeons array
    table.insert(dungeonCache.allDungeons, dungeon)
    
    -- Cache boss IDs
    if dungeon.bosses then
        for _, boss in ipairs(dungeon.bosses) do
            if boss.bossID then
                dungeonCache.bossIds[boss.bossID] = {
                    dungeon = dungeon,
                    boss = boss
                }
            end
        end
    end
end

-- Store reference to original djDungeons for metatable setup
local originalDungeons = nil
local metatableSetup = false

-- Function to initialize cache from Journal.djDungeons
local function InitializeCache()
    if dungeonCache.initialized then return end
    
    -- Clear existing cache tables only (not the initialized flag)
    dungeonCache.byName = {}
    dungeonCache.byCategory = {}
    dungeonCache.allDungeons = {}
    dungeonCache.bossIds = {}
    
    -- Ensure Journal.djDungeons exists
    _G.Journal = _G.Journal or {}
    _G.Journal.djDungeons = _G.Journal.djDungeons or {}
    
    -- Debug: Check how many dungeons are available
    local dungeonCount = #_G.Journal.djDungeons
    print("|cFF00FF00[DJ Cache]|r Found " .. dungeonCount .. " dungeons to cache")
    
    -- Cache all existing dungeons
    for i, dungeon in ipairs(_G.Journal.djDungeons) do
        if dungeon then
            CacheDungeon(dungeon)
        else
            print("|cFFFF0000[DJ Cache]|r Warning: Found nil dungeon at index " .. i)
        end
    end
    
    -- Set up metatable hook after initial caching (only once)
    if not metatableSetup and dungeonCount > 0 then
        originalDungeons = _G.Journal.djDungeons
        _G.Journal.djDungeons = setmetatable({}, {
            __index = originalDungeons,
            __newindex = function(t, k, v)
                originalDungeons[k] = v
                if type(k) == "number" and type(v) == "table" then
                    -- When a new dungeon is added, update the cache
                    CacheDungeon(v)
                    print("|cFF00FF00[DJ Cache]|r Added new dungeon to cache: " .. (v.name or "Unknown"))
                end
            end,
            __len = function(t)
                return #originalDungeons
            end
        })
        metatableSetup = true
        print("|cFF00FF00[DJ Cache]|r Metatable hook installed")
    end
    
    -- Print debug info
    print("|cFF00FF00[DJ Cache]|r Initialized with " .. #dungeonCache.allDungeons .. " dungeons")
    for category, dungeons in pairs(dungeonCache.byCategory) do
        print("|cFF00FF00[DJ Cache]|r Category " .. category .. ": " .. #dungeons .. " dungeons")
    end
    
    dungeonCache.initialized = true
end

-- Helper functions to access cached data
_G.Journal = _G.Journal or {}

function Journal.GetDungeonByName(name)
    if not dungeonCache.initialized then InitializeCache() end
    return dungeonCache.byName[name]
end

function Journal.GetDungeonsByCategory(category)
    if not dungeonCache.initialized then InitializeCache() end
    return dungeonCache.byCategory[category] or {}
end

function Journal.GetAllDungeons()
    if not dungeonCache.initialized then InitializeCache() end
    return dungeonCache.allDungeons
end

function Journal.GetBossByID(bossId)
    if not dungeonCache.initialized then InitializeCache() end
    return dungeonCache.bossIds[bossId]
end

-- Create initialization frame
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED" and addonName == "TheJournal" then
        -- Initialize on addon load
        print("|cFF00FF00[DJ Cache]|r ADDON_LOADED event triggered")
        InitializeCache()
    elseif event == "PLAYER_LOGIN" then
        -- Re-initialize after login to ensure all data is loaded
        print("|cFF00FF00[DJ Cache]|r PLAYER_LOGIN event triggered, re-initializing in 1 second")
        C_Timer.After(1, function()
            InitializeCache()
            -- Unregister events after successful initialization
            self:UnregisterAllEvents()
        end)
    end
end) 