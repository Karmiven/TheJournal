-- ##################################################################
-- # UIInitializationManager.lua - UI Initialization and Event System
-- # ʕ •ᴥ•ʔ✿ Complete UI startup and event management ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIInitializationManager = {}

-- ʕ •ᴥ•ʔ✿ Global References Management ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupGlobalReferences()
    _G.DungeonJournalFrame = _G.DungeonJournalFrame
    _G.LoadDungeonDetail = _G.LoadDungeonDetail
    _G.UpdateDungeonNames = _G.UpdateDungeonNames
    _G.RefreshAllAttunableText = _G.RefreshAllAttunableText
    _G.SortDungeonsByAttunement = _G.SortDungeonsByAttunement
    _G.ShowJournal = _G.ShowJournal
    _G.HideJournal = _G.HideJournal
    _G.ToggleJournal = _G.ToggleJournal
    _G.ProcessBOETooltip = _G.ProcessBOETooltip
    _G.InvalidateItemCache = _G.InvalidateItemCache
    _G.PrintAttunementReport = _G.PrintAttunementReport
    _G.UpdateAttunementFriendsDisplay = _G.UpdateAttunementFriendsDisplay
    _G.AttunementFriendsFrame = _G.AttunementFriendsFrame
end

-- ʕ •ᴥ•ʔ✿ Quest and Report Systems ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupQuestSystem()
    Journal_charDB.journalPoints = Journal_charDB.journalPoints or 0
    Journal_charDB.currentRandomQuest = Journal_charDB.currentRandomQuest or nil
    
    C_Timer.After(0.5, function()
        if _G.TheJournal_UIQuestManager then
            _G.TheJournal_UIQuestManager.Initialize()
        else
            -- ʕ •ᴥ•ʔ✿ UIQuestManager not loaded silently ✿ʕ •ᴥ•ʔ
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Cache Management ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupCacheSystems()
    -- Initialize item button cache
    _G.itemButtonCache = _G.itemButtonCache or {}
    if not getmetatable(_G.itemButtonCache) then
        setmetatable(_G.itemButtonCache, {__mode = "v"})
    end
    
    -- Setup UI cache
    if not uiCache then
        uiCache = {
            dungeonAttunement = {},
            dungeonAttunementLastUpdate = {},
            bossFrames = {},
            currentDungeon = nil
        }
        setmetatable(uiCache.dungeonAttunement, {__mode = "v"})
        setmetatable(uiCache.dungeonAttunementLastUpdate, {__mode = "v"})
    end
    
    -- Setup smart cache
    if not smartCache then
        smartCache = {
            attunement = {},
            forge = {},
            updateQueue = {},
            processing = false,
            lastUpdate = 0
        }
    end
    
    -- Initialize from saved variables
    if Journal_charDB.smartCache then
        smartCache.attunement = Journal_charDB.smartCache.attunement or {}
        smartCache.forge = Journal_charDB.smartCache.forge or {}
        smartCache.lastUpdate = Journal_charDB.smartCache.lastUpdate or 0
    end
end

-- ʕ •ᴥ•ʔ✿ Friends System Initialization ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupFriendsSystem()
    -- Initialize friends data structures
    if not _G.FRIENDS_ATTUNEMENT_DATA then
        _G.FRIENDS_ATTUNEMENT_DATA = {}
    end
    if not _G.FRIENDS_JOURNAL_POINTS then
        _G.FRIENDS_JOURNAL_POINTS = {}
    end
    if not _G.FRIENDS_DATA then
        _G.FRIENDS_DATA = {}
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
    
    return friendsLoaded, pointsLoaded
end

-- ʕ •ᴥ•ʔ✿ Settings and Variables ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupDefaultSettings()
    -- Initialize character database defaults
    Journal_charDB.viewAllItems = Journal_charDB.viewAllItems or false
    Journal_charDB.currentItemPage = Journal_charDB.currentItemPage or 1
    Journal_charDB.currentVersionIndex = Journal_charDB.currentVersionIndex or 1
    Journal_charDB.itemSearchQuery = Journal_charDB.itemSearchQuery or ""
    Journal_charDB.selectedCategory = Journal_charDB.selectedCategory or "All"
    
    -- Initialize DJ_Settings
    _G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false, filterType = "All" }
    DJ_Settings.filterType = DJ_Settings.filterType or "All"
    DJ_Settings.onlyEquipable = DJ_Settings.onlyEquipable or false
    DJ_Settings.attuneFilter = DJ_Settings.attuneFilter or "All"
    
    -- Initialize item filters
    if not Journal_charDB.itemFilters then
        Journal_charDB.itemFilters = {
            searchType = "items",
            maxSources = 0,
            showRareDrops = true,
            showCommonDrops = true,
            mythicFilter = "all"
        }
    end
    
    -- Migrate old mythicOnly setting to new mythicFilter
    if Journal_charDB.itemFilters.mythicOnly ~= nil then
        if Journal_charDB.itemFilters.mythicOnly then
            Journal_charDB.itemFilters.mythicFilter = "mythic"
        else
            Journal_charDB.itemFilters.mythicFilter = "all"
        end
        Journal_charDB.itemFilters.mythicOnly = nil
    end
    
    -- Add mythicFilter field if missing
    if Journal_charDB.itemFilters.mythicFilter == nil then
        Journal_charDB.itemFilters.mythicFilter = "all"
    end
end

-- ʕ •ᴥ•ʔ✿ BOE Enhancement System ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupBOEEnhancement()
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
    if not _G.ORIGINAL_ITEM_LINKS then
        _G.ORIGINAL_ITEM_LINKS = {}
    end
end

-- ʕ •ᴥ•ʔ✿ Event Registration ✿ʕ•ᴥ•ʔ
function UIInitializationManager.RegisterAllEvents()
    -- Smart cache frame for attunement completion messages
    local smartCacheFrame = CreateFrame("Frame")
    smartCacheFrame:RegisterEvent("CHAT_MSG_SYSTEM")
    smartCacheFrame:SetScript("OnEvent", function(self, event, message)
        if event == "CHAT_MSG_SYSTEM" and message then
            if message:find("attuned") or message:find("Attunement") then
                smartCache.lastUpdate = GetTime()
            end
        end
    end)
    
    -- Listen for Journal Points from friends
    local pointsFrame = CreateFrame("Frame")
    pointsFrame:RegisterEvent("CHAT_MSG_ADDON")
    pointsFrame:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
        -- ʕ •ᴥ•ʔ✿ DISABLED: DJ_POINTS removed - using omega-merged messages ✿ʕ•ᴥ•ʔ
        if false and event == "CHAT_MSG_ADDON" and prefix == "DJ_POINTS" then
            local points = tonumber(message)
            if points and points > 0 then
                if not _G.FRIENDS_JOURNAL_POINTS then
                    _G.FRIENDS_JOURNAL_POINTS = {}
                end
                _G.FRIENDS_JOURNAL_POINTS[sender] = points
                
                -- Use UIQuestManager's debounced save
                local UIQuestManager = _G.TheJournal_UIQuestManager
                if UIQuestManager then
                    UIQuestManager.DebouncedSave()
                end
                
                if _G.UpdateAttunementFriendsDisplay then
                    _G.UpdateAttunementFriendsDisplay()
                end
            end
        end
    end)
    
    -- Save friends data on logout/reload
    local logoutFrame = CreateFrame("Frame")
    logoutFrame:RegisterEvent("PLAYER_LOGOUT")
    logoutFrame:RegisterEvent("ADDON_LOADED")
    logoutFrame:SetScript("OnEvent", function(self, event, addonName)
        if event == "PLAYER_LOGOUT" or (event == "ADDON_LOADED" and addonName == "TheJournal") then
            if Journal_charDB then
                local UIQuestManager = _G.TheJournal_UIQuestManager
                if UIQuestManager then
                    UIQuestManager.SaveFriendsData()
                end
            end
        end
    end)
    
    -- Debug initialization frame
    local debugFrame = CreateFrame("Frame")
    debugFrame:RegisterEvent("PLAYER_LOGIN")
    debugFrame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_LOGIN" then
            local timer = CreateFrame("Frame")
            timer:SetScript("OnUpdate", function(timerSelf, elapsed)
                timerSelf.elapsed = (timerSelf.elapsed or 0) + elapsed
                if timerSelf.elapsed >= 2 then
                    timerSelf:SetScript("OnUpdate", nil)
                end
            end)
        end
    end)
    
    -- Main initialization frame
    local initFrame = CreateFrame("Frame")
    initFrame:RegisterEvent("PLAYER_LOGIN")
    initFrame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_LOGIN" then
            C_Timer.After(1, function()
                if _G.RefreshAllAttunableText then
                    _G.RefreshAllAttunableText()
                end
                if _G.SortDungeonsByAttunement then
                    _G.SortDungeonsByAttunement()
                end
                if _G.FilterDungeonsByCategory then
                    _G.FilterDungeonsByCategory()
                end
            end)
        end
    end)
    
    -- Quest initialization frame
    local initQuestFrame = CreateFrame("Frame")
    initQuestFrame:RegisterEvent("PLAYER_LOGIN")
    initQuestFrame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_LOGIN" then
            C_Timer.After(2, function()
                local UIQuestManager = _G.TheJournal_UIQuestManager
                if UIQuestManager then
                    UIQuestManager.UpdateCurrentQuestDisplay()
                    if Journal_charDB.currentRandomQuest then
                        UIQuestManager.CompleteRandomQuest()
                    end
                end
            end)
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ UI Escape Key Support ✿ʕ•ᴥ•ʔ
function UIInitializationManager.SetupEscapeKey()
    table.insert(UISpecialFrames, "DungeonJournalFrame")
end

-- ʕ •ᴥ•ʔ✿ Complete Initialization ✿ʕ •ᴥ•ʔ
function UIInitializationManager.InitializeAll()
    UIInitializationManager.SetupDefaultSettings()
    UIInitializationManager.SetupCacheSystems()
    local friendsLoaded, pointsLoaded = UIInitializationManager.SetupFriendsSystem()
    UIInitializationManager.SetupBOEEnhancement()
    UIInitializationManager.RegisterAllEvents()
    UIInitializationManager.SetupGlobalReferences()
    UIInitializationManager.SetupEscapeKey()
    
    -- Initialize quest system after main UI is ready
    C_Timer.After(1, function()
        UIInitializationManager.SetupQuestSystem()
    end)
    
    -- ʕ •ᴥ•ʔ✿ Features loaded silently ✿ʕ •ᴥ•ʔ
    
    return {
        friendsLoaded = friendsLoaded,
        pointsLoaded = pointsLoaded
    }
end

-- ʕ •ᴥ•ʔ✿ Make globally accessible ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIInitializationManager = UIInitializationManager
