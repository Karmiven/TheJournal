-- ##################################################################
-- # UIDatabaseInterface.lua
-- # ʕ •ᴥ•ʔ✿ Database Interface System ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIDatabaseInterface = {}

-- ʕ •ᴥ•ʔ✿ Save debounce mechanism ✿ʕ•ᴥ•ʔ
local saveDebounce = {
    timer = nil,
    pending = false,
    lastSave = 0,
    minInterval = 15,
}

-- ʕ •ᴥ•ʔ✿ Initialize database ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.Initialize()
    if not Journal_charDB then
        Journal_charDB = {
            journalPoints = 0,
            friendsJournalPoints = {},
            currentRandomQuest = nil,
            favorites = {},
            config = {},
            cache = {}
        }
    end
    
    if not Journal_globalDB then
        Journal_globalDB = {
            version = "1.0",
            settings = {}
        }
    end
end

-- ʕ •ᴥ•ʔ✿ Save data with debouncing ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.SaveData(immediate)
    local currentTime = GetTime()
    
    if immediate then
        UIDatabaseInterface.ForceSave()
        return
    end
    
    if saveDebounce.timer then
        return
    end
    
    if (currentTime - saveDebounce.lastSave) < saveDebounce.minInterval and not immediate then
        saveDebounce.pending = true
        saveDebounce.timer = C_Timer.After(saveDebounce.minInterval - (currentTime - saveDebounce.lastSave), function()
            saveDebounce.timer = nil
            if saveDebounce.pending then
                UIDatabaseInterface.ForceSave()
            end
        end)
        return
    end
    
    UIDatabaseInterface.ForceSave()
end

-- ʕ •ᴥ•ʔ✿ Force immediate save ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.ForceSave()
    saveDebounce.lastSave = GetTime()
    saveDebounce.pending = false
    
    if saveDebounce.timer then
        saveDebounce.timer:Cancel()
        saveDebounce.timer = nil
    end
    
    if _G.SaveFriendsData then
        _G.SaveFriendsData()
    end
end

-- ʕ •ᴥ•ʔ✿ Get character data ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.GetCharacterData(key)
    if not Journal_charDB then
        UIDatabaseInterface.Initialize()
    end
    return Journal_charDB[key]
end

-- ʕ •ᴥ•ʔ✿ Set character data ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.SetCharacterData(key, value)
    if not Journal_charDB then
        UIDatabaseInterface.Initialize()
    end
    Journal_charDB[key] = value
    UIDatabaseInterface.SaveData()
end

-- ʕ •ᴥ•ʔ✿ Get global data ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.GetGlobalData(key)
    if not Journal_globalDB then
        UIDatabaseInterface.Initialize()
    end
    return Journal_globalDB[key]
end

-- ʕ •ᴥ•ʔ✿ Set global data ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.SetGlobalData(key, value)
    if not Journal_globalDB then
        UIDatabaseInterface.Initialize()
    end
    Journal_globalDB[key] = value
    UIDatabaseInterface.SaveData()
end

-- ʕ •ᴥ•ʔ✿ Friends data management ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.UpdateFriendsData(playerName, data)
    if not Journal_charDB then
        UIDatabaseInterface.Initialize()
    end
    
    if not Journal_charDB.friendsJournalPoints then
        Journal_charDB.friendsJournalPoints = {}
    end
    
    if data.journalPoints then
        Journal_charDB.friendsJournalPoints[playerName] = data.journalPoints
    end
    
    UIDatabaseInterface.SaveData()
end

-- ʕ •ᴥ•ʔ✿ Get friends data ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.GetFriendsData(playerName)
    if not Journal_charDB or not Journal_charDB.friendsJournalPoints then
        return nil
    end
    return Journal_charDB.friendsJournalPoints[playerName]
end

-- ʕ •ᴥ•ʔ✿ Cache management ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.SetCacheData(cacheType, key, value)
    if not Journal_charDB then
        UIDatabaseInterface.Initialize()
    end
    
    if not Journal_charDB.cache then
        Journal_charDB.cache = {}
    end
    
    if not Journal_charDB.cache[cacheType] then
        Journal_charDB.cache[cacheType] = {}
    end
    
    Journal_charDB.cache[cacheType][key] = value
end

function UIDatabaseInterface.GetCacheData(cacheType, key)
    if not Journal_charDB or not Journal_charDB.cache or not Journal_charDB.cache[cacheType] then
        return nil
    end
    return Journal_charDB.cache[cacheType][key]
end

function UIDatabaseInterface.ClearCache(cacheType)
    if Journal_charDB and Journal_charDB.cache and Journal_charDB.cache[cacheType] then
        Journal_charDB.cache[cacheType] = {}
    end
end

-- ʕ •ᴥ•ʔ✿ Data migration utilities ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.MigrateData(oldVersion, newVersion)
    if not Journal_charDB then return end
    
    if oldVersion < "1.0" then
        if Journal_charDB.favorites and type(Journal_charDB.favorites) == "table" then
            for i, fav in ipairs(Journal_charDB.favorites) do
                if type(fav) == "number" then
                    Journal_charDB.favorites[i] = {itemID = fav, timestamp = GetTime()}
                end
            end
        end
    end
    
    Journal_charDB.version = newVersion
    UIDatabaseInterface.SaveData(true)
end

-- ʕ •ᴥ•ʔ✿ Data validation ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.ValidateData()
    local isValid = true
    local errors = {}
    
    if not Journal_charDB then
        table.insert(errors, "Character database is missing")
        isValid = false
    else
        if type(Journal_charDB.journalPoints) ~= "number" then
            Journal_charDB.journalPoints = 0
            table.insert(errors, "Fixed invalid journal points")
        end
        
        if type(Journal_charDB.friendsJournalPoints) ~= "table" then
            Journal_charDB.friendsJournalPoints = {}
            table.insert(errors, "Fixed invalid friends journal points")
        end
    end
    
    return isValid, errors
end

-- ʕ •ᴥ•ʔ✿ Export/Import functionality ✿ʕ•ᴥ•ʔ
function UIDatabaseInterface.ExportData()
    return {
        character = Journal_charDB,
        global = Journal_globalDB
    }
end

function UIDatabaseInterface.ImportData(data)
    if data.character then
        Journal_charDB = data.character
    end
    if data.global then
        Journal_globalDB = data.global
    end
    UIDatabaseInterface.SaveData(true)
end

-- ʕ •ᴥ•ʔ✿ Event handlers for save/load ✿ʕ•ᴥ•ʔ
local logoutFrame = CreateFrame("Frame")
logoutFrame:RegisterEvent("PLAYER_LOGOUT")
logoutFrame:RegisterEvent("ADDON_LOADED")
logoutFrame:SetScript("OnEvent", function(self, event, addonName)
    if event == "PLAYER_LOGOUT" or (event == "ADDON_LOADED" and addonName == "TheJournal") then
        if Journal_charDB then
            UIDatabaseInterface.ForceSave()
        end
    end
end)

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIDatabaseInterface = UIDatabaseInterface

return UIDatabaseInterface
