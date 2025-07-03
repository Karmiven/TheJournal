-- ##################################################################
-- # UIConfiguration.lua
-- # ʕ •ᴥ•ʔ✿ Configuration Management System ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIConfiguration = {}

-- ʕ •ᴥ•ʔ✿ Configuration constants and defaults ✿ʕ•ᴥ•ʔ
local CONFIG_DEFAULTS = {
    cacheTimeout = 30,
    sortDebounceInterval = 1,
    saveInterval = 15,
    framePoolSize = 50,
    maxCacheEntries = 1000,
    debugMode = false
}

-- ʕ •ᴥ•ʔ✿ Cache management configuration ✿ʕ•ᴥ•ʔ
local cacheConfig = {
    attunement = {
        timeout = CONFIG_DEFAULTS.cacheTimeout,
        maxEntries = CONFIG_DEFAULTS.maxCacheEntries
    },
    forge = {
        timeout = CONFIG_DEFAULTS.cacheTimeout,
        maxEntries = CONFIG_DEFAULTS.maxCacheEntries
    },
    dropRates = {
        timeout = 300,
        maxEntries = 500
    }
}

-- ʕ •ᴥ•ʔ✿ Initialize configuration system ✿ʕ•ᴥ•ʔ
function UIConfiguration.Initialize()
    if not Journal_charDB then
        Journal_charDB = {}
    end
    
    if not Journal_charDB.config then
        Journal_charDB.config = {}
    end
    
    -- Apply defaults for missing config values
    for key, value in pairs(CONFIG_DEFAULTS) do
        if Journal_charDB.config[key] == nil then
            Journal_charDB.config[key] = value
        end
    end
    
    -- Initialize cache configurations
    if not Journal_charDB.config.cache then
        Journal_charDB.config.cache = cacheConfig
    end
end

-- ʕ •ᴥ•ʔ✿ Configuration getters ✿ʕ•ᴥ•ʔ
function UIConfiguration.GetCacheTimeout()
    return Journal_charDB.config and Journal_charDB.config.cacheTimeout or CONFIG_DEFAULTS.cacheTimeout
end

function UIConfiguration.GetSortDebounceInterval()
    return Journal_charDB.config and Journal_charDB.config.sortDebounceInterval or CONFIG_DEFAULTS.sortDebounceInterval
end

function UIConfiguration.GetSaveInterval()
    return Journal_charDB.config and Journal_charDB.config.saveInterval or CONFIG_DEFAULTS.saveInterval
end

function UIConfiguration.GetFramePoolSize()
    return Journal_charDB.config and Journal_charDB.config.framePoolSize or CONFIG_DEFAULTS.framePoolSize
end

function UIConfiguration.GetMaxCacheEntries()
    return Journal_charDB.config and Journal_charDB.config.maxCacheEntries or CONFIG_DEFAULTS.maxCacheEntries
end

function UIConfiguration.IsDebugMode()
    return Journal_charDB.config and Journal_charDB.config.debugMode or CONFIG_DEFAULTS.debugMode
end

-- ʕ •ᴥ•ʔ✿ Configuration setters ✿ʕ•ᴥ•ʔ
function UIConfiguration.SetCacheTimeout(timeout)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    Journal_charDB.config.cacheTimeout = timeout
end

function UIConfiguration.SetSortDebounceInterval(interval)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    Journal_charDB.config.sortDebounceInterval = interval
end

function UIConfiguration.SetSaveInterval(interval)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    Journal_charDB.config.saveInterval = interval
end

function UIConfiguration.SetFramePoolSize(size)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    Journal_charDB.config.framePoolSize = size
end

function UIConfiguration.SetMaxCacheEntries(max)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    Journal_charDB.config.maxCacheEntries = max
end

function UIConfiguration.SetDebugMode(enabled)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    Journal_charDB.config.debugMode = enabled
    _G.DEBUG = enabled
end

-- ʕ •ᴥ•ʔ✿ Cache configuration management ✿ʕ•ᴥ•ʔ
function UIConfiguration.GetCacheConfig(cacheType)
    if not Journal_charDB.config or not Journal_charDB.config.cache then
        return cacheConfig[cacheType] or {}
    end
    return Journal_charDB.config.cache[cacheType] or cacheConfig[cacheType] or {}
end

function UIConfiguration.SetCacheConfig(cacheType, config)
    if not Journal_charDB.config then UIConfiguration.Initialize() end
    if not Journal_charDB.config.cache then
        Journal_charDB.config.cache = {}
    end
    Journal_charDB.config.cache[cacheType] = config
end

-- ʕ •ᴥ•ʔ✿ Export configuration data ✿ʕ•ᴥ•ʔ
function UIConfiguration.ExportSettings()
    local settings = {}
    if Journal_charDB and Journal_charDB.config then
        for key, value in pairs(Journal_charDB.config) do
            settings[key] = value
        end
    end
    return settings
end

-- ʕ •ᴥ•ʔ✿ Import configuration data ✿ʕ•ᴥ•ʔ
function UIConfiguration.ImportSettings(settings)
    if not Journal_charDB then Journal_charDB = {} end
    if not Journal_charDB.config then Journal_charDB.config = {} end
    
    for key, value in pairs(settings) do
        Journal_charDB.config[key] = value
    end
end

-- ʕ •ᴥ•ʔ✿ Reset to defaults ✿ʕ•ᴥ•ʔ
function UIConfiguration.ResetToDefaults()
    if not Journal_charDB then Journal_charDB = {} end
    Journal_charDB.config = {}
    for key, value in pairs(CONFIG_DEFAULTS) do
        Journal_charDB.config[key] = value
    end
    Journal_charDB.config.cache = {}
    for key, value in pairs(cacheConfig) do
        Journal_charDB.config.cache[key] = value
    end
end

-- ʕ •ᴥ•ʔ✿ Configuration validation ✿ʕ•ᴥ•ʔ
function UIConfiguration.ValidateConfig()
    local errors = {}
    
    if UIConfiguration.GetCacheTimeout() < 1 then
        table.insert(errors, "Cache timeout must be at least 1 second")
    end
    
    if UIConfiguration.GetSaveInterval() < 5 then
        table.insert(errors, "Save interval must be at least 5 seconds")
    end
    
    if UIConfiguration.GetFramePoolSize() < 10 then
        table.insert(errors, "Frame pool size must be at least 10")
    end
    
    return #errors == 0, errors
end

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIConfiguration = UIConfiguration

return UIConfiguration
