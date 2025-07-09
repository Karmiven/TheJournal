-- ##################################################################
-- # UIPerformance.lua - Performance Optimizations and Caching
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Performance Optimization Module ✿ʕ•ᴥ•ʔ

local Performance = {}

-- ʕ ◕ᴥ◕ ʔ✿ Cache for UI-specific data ✿ʕ ◕ᴥ◕ ʔ
local uiCache = {
    currentDungeon = nil,
    currentCategory = nil,
    dropRates = {},
    bossFrames = {},
    lastDungeonUpdate = 0,
    dungeonAttunement = {},
    dungeonAttunementLastUpdate = {}
}

-- ʕ ● ᴥ ●ʔ✿ Make caches weak to allow garbage collection ✿ʕ ● ᴥ ●ʔ
setmetatable(uiCache.bossFrames, {__mode = "v"})
setmetatable(uiCache.dungeonAttunement, {__mode = "v"})
setmetatable(uiCache.dungeonAttunementLastUpdate, {__mode = "v"})

-- ʕノ•ᴥ•ʔノ✿ Cache frequently used global functions for better performance ✿ʕノ•ᴥ•ʔノ
local GetTime = GetTime
local GetItemInfo = GetItemInfo
local tonumber = tonumber
local pairs = pairs
local ipairs = ipairs
local table_insert = table.insert
local table_remove = table.remove
local string_match = string.match
local string_find = string.find

-- ＼ʕ •ᴥ•ʔ／✿ Frame pooling for item buttons to improve performance ✿＼ʕ •ᴥ•ʔ／
local itemButtonPool = {}
local activeItemButtons = {}

function Performance.GetItemButton()
    local button = table_remove(itemButtonPool)
    if not button then
        button = CreateFrame("Button", nil, UIParent)
        button:SetNormalTexture("")
        button:SetPushedTexture("")
        button:SetHighlightTexture("")
        
        button.icon = button:CreateTexture(nil, "ARTWORK")
        button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.count = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    end
    
    activeItemButtons[button] = true
    return button
end

function Performance.ReleaseItemButton(button)
    if not button or not activeItemButtons[button] then return end
    
    button:Hide()
    button:ClearAllPoints()
    button:SetParent(UIParent)
    button:SetScript("OnEnter", nil)
    button:SetScript("OnLeave", nil)
    button:SetScript("OnClick", nil)
    
    if button.icon then button.icon:SetTexture(nil) end
    if button.text then button.text:SetText("") end
    if button.count then button.count:SetText("") end
    
    activeItemButtons[button] = nil
    table_insert(itemButtonPool, button)
end

function Performance.ReleaseAllItemButtons()
    for button in pairs(activeItemButtons) do
        Performance.ReleaseItemButton(button)
    end
end

function Performance.GetActiveButtonCount()
    local count = 0
    for _ in pairs(activeItemButtons) do
        count = count + 1
    end
    return count
end

-- ʕ •ᴥ•ʔ✿ Persistent drop rate cache ✿ʕ •ᴥ•ʔ
local dropRateCache = {}
setmetatable(dropRateCache, {__mode = "v"})

-- ʕ ◕ᴥ◕ ʔ✿ Smart global cache for attunement and forge data ✿ʕ ◕ᴥ◕ ʔ
local smartCache = {
    attunement = {},
    forge = {},
    lastUpdate = 0,
    processing = false,
    updateQueue = {}
}

-- ʕ ● ᴥ ●ʔ✿ Save debounce mechanism ✿ʕ ● ᴥ ●ʔ
local saveDebounce = {
    timer = nil,
    pending = false,
    lastSave = 0,
    minInterval = 15,
}

-- ʕノ•ᴥ•ʔノ✿ Optimized dungeon navigation functions ✿ʕノ•ᴥ•ʔノ
function Performance.GetCurrentDungeon()
    if not uiCache.currentDungeon then
        return nil
    end
    return Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(uiCache.currentDungeon)
end

function Performance.GetCurrentCategory()
    if not uiCache.currentCategory then
        return nil
    end
    return Journal.GetDungeonsByCategory(uiCache.currentCategory)
end

function Performance.UpdateDungeonCache(dungeonName)
    if dungeonName == uiCache.currentDungeon and 
       (GetTime() - uiCache.lastDungeonUpdate) < 5 then
        return
    end
    
    uiCache.currentDungeon = dungeonName
    uiCache.lastDungeonUpdate = GetTime()
    
    local dungeon = Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    if dungeon then
        if dungeon.bosses then
            for _, boss in ipairs(dungeon.bosses) do
                if boss.bossID and not uiCache.bossFrames[boss.bossID] then
                    uiCache.bossFrames[boss.bossID] = Performance.CreateBossFrame(boss)
                end
            end
        end
        
        Performance.ClearDungeonDropRateCache(dungeonName)
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Function to get cached drop rate with dungeon cache integration ✿＼ʕ •ᴥ•ʔ／
function Performance.GetCachedDropRate(itemId, dungeonName)
    local cacheKey = (dungeonName or "unknown") .. "_" .. itemId
    
    if dropRateCache[cacheKey] ~= nil then
        return dropRateCache[cacheKey]
    end
    
    local dungeon = dungeonName and Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    
    local dropRate = 0
    if ItemLocAPI:IsLoaded() then
        local bestSource = ItemLocAPI:GetBestSource(itemId, dungeonName)
        dropRate = bestSource and bestSource.chance or 0
        
        if dungeon and bestSource then
            local bossData = Journal.GetBossByID(bestSource.bossID)
            if bossData and bossData.dungeon.name == dungeonName then
                dropRateCache[cacheKey] = dropRate
            end
        end
    end
    
    dropRateCache[cacheKey] = dropRate
    return dropRate
end

-- ʕ •ᴥ•ʔ✿ Initialize smart cache from saved variables ✿ʕ •ᴥ•ʔ
function Performance.InitializeSmartCache()
    if Journal_charDB.smartCache then
        smartCache.attunement = Journal_charDB.smartCache.attunement or {}
        smartCache.forge = Journal_charDB.smartCache.forge or {}
        smartCache.lastUpdate = Journal_charDB.smartCache.lastUpdate or 0
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Function to debounce saves ✿ʕ ◕ᴥ◕ ʔ
function Performance.DebouncedSave()
    if saveDebounce.timer then
        saveDebounce.timer:Cancel()
    end
    
    if not saveDebounce.pending then
        saveDebounce.pending = true
        saveDebounce.timer = C_Timer.After(1, function()
            if GetTime() - saveDebounce.lastSave >= saveDebounce.minInterval then
                if _G.SaveFriendsData then
                    _G.SaveFriendsData()
                end
                saveDebounce.lastSave = GetTime()
            end
            saveDebounce.pending = false
        end)
    end
end

-- ʕ ● ᴥ ●ʔ✿ Function to queue drop rate updates ✿ʕ ● ᴥ ●ʔ
function Performance.QueueDropRateUpdate(itemID, dungeonName)
    local cacheKey = dungeonName .. "_" .. itemID
    if dropRateCache[cacheKey] == nil then
        C_Timer.After(0.1, function()
            Performance.GetCachedDropRate(itemID, dungeonName)
        end)
    end
end

-- ʕノ•ᴥ•ʔノ✿ Clear drop rate cache for a specific dungeon ✿ʕノ•ᴥ•ʔノ
function Performance.ClearDungeonDropRateCache(dungeonName)
    if not dungeonName then return end
    
    local searchPattern = dungeonName .. "_"
    local keysToRemove = {}
    
    for cacheKey, _ in pairs(dropRateCache) do
        if cacheKey:find(searchPattern, 1, true) == 1 then
            keysToRemove[#keysToRemove + 1] = cacheKey
        end
    end
    
    for i = 1, #keysToRemove do
        dropRateCache[keysToRemove[i]] = nil
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Smart cache functions ✿＼ʕ •ᴥ•ʔ／
function Performance.GetCachedAttunement(itemID)
    return smartCache.attunement[itemID]
end

function Performance.GetCachedForge(itemID)
    return smartCache.forge[itemID]
end

function Performance.SetCachedAttunement(itemID, progress)
    smartCache.attunement[itemID] = progress
end

function Performance.SetCachedForge(itemID, forgeLevel)
    smartCache.forge[itemID] = forgeLevel
end

-- ʕ •ᴥ•ʔ✿ Background processing function to update cache in batches ✿ʕ •ᴥ•ʔ
function Performance.ProcessCacheUpdates()
    if smartCache.processing or #smartCache.updateQueue == 0 then
        return
    end
    
    smartCache.processing = true
    local batchSize = 3
    local processed = 0
    local queueLength = #smartCache.updateQueue
    
    local GetItemAttuneProgress = _G.GetItemAttuneProgress
    local GetItemLinkAttuneProgress = _G.GetItemLinkAttuneProgress
    local GetItemAttuneForge = _G.GetItemAttuneForge
    
    while processed < batchSize and queueLength > 0 do
        local itemID = table_remove(smartCache.updateQueue, 1)
        queueLength = queueLength - 1
        
        if smartCache.attunement[itemID] == nil then
            local progress = 0
            if GetItemAttuneProgress then
                progress = GetItemAttuneProgress(itemID) or 0
            elseif GetItemLinkAttuneProgress then
                local itemLink = "item:" .. itemID
                progress = GetItemLinkAttuneProgress(itemLink) or 0
            end
            Performance.SetCachedAttunement(itemID, progress)
            
            if progress >= 100 and smartCache.forge[itemID] == nil then
                local forgeLevel = GetItemAttuneForge and GetItemAttuneForge(itemID) or 0
                Performance.SetCachedForge(itemID, forgeLevel)
            end
        end
        
        processed = processed + 1
    end
    
    smartCache.processing = false
    
    if queueLength > 0 then
        C_Timer.After(0.15, Performance.ProcessCacheUpdates)
    else
        Performance.SaveSmartCache()
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Function to queue items for cache updates ✿ʕ ◕ᴥ◕ ʔ
function Performance.QueueCacheUpdate(itemID)
    if not smartCache.attunement[itemID] then
        table.insert(smartCache.updateQueue, itemID)
        if not smartCache.processing and #smartCache.updateQueue == 1 then
            C_Timer.After(0.1, Performance.ProcessCacheUpdates)
        end
    end
end

-- ʕ ● ᴥ ●ʔ✿ Function to save cache to saved variables ✿ʕ ● ᴥ ●ʔ
function Performance.SaveSmartCache()
    Journal_charDB.smartCache = {
        attunement = smartCache.attunement,
        forge = smartCache.forge,
        lastUpdate = GetTime()
    }
end

-- ʕノ•ᴥ•ʔノ✿ Optimized frame creation functions ✿ʕノ•ᴥ•ʔノ
function Performance.CreateBossFrame(boss)
    if not boss or not boss.bossID then return nil end
    
    if uiCache.bossFrames[boss.bossID] then
        return uiCache.bossFrames[boss.bossID]
    end
    
    local frame = CreateFrame("Frame", nil, UIParent)
    frame.bossID = boss.bossID
    frame.name = boss.name
    frame.loot = boss.loot or {}
    
    uiCache.bossFrames[boss.bossID] = frame
    
    for _, item in ipairs(frame.loot) do
        if item.itemID then
            Performance.QueueDropRateUpdate(item.itemID, uiCache.currentDungeon)
        end
    end
    
    return frame
end

-- ＼ʕ •ᴥ•ʔ／✿ Function to update UI when dungeon changes ✿＼ʕ •ᴥ•ʔ／
function Performance.OnDungeonChanged(dungeonName)
    if not dungeonName then return end
    
    Performance.UpdateDungeonCache(dungeonName)
    
    local dungeon = Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    if not dungeon then return end
    
    if dungeon.category ~= uiCache.currentCategory then
        uiCache.currentCategory = dungeon.category
    end
    
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

-- ʕ •ᴥ•ʔ✿ Function to invalidate cache for a specific item ✿ʕ •ᴥ•ʔ
function Performance.InvalidateItemCache(itemID)
    smartCache.attunement[itemID] = nil
    smartCache.forge[itemID] = nil
end

-- ʕ ◕ᴥ◕ ʔ✿ Debug slash commands ✿ʕ ◕ᴥ◕ ʔ
SLASH_DJPOOL1 = "/djpool"
SlashCmdList["DJPOOL"] = function()
    print("|cFFFFD700[Frame Pool Debug]|r")
    print("  Pool size: " .. #itemButtonPool)
    print("  Active buttons: " .. Performance.GetActiveButtonCount())
    print("  Cache entries: " .. (next(_G.itemButtonCache) and "Has entries" or "Empty"))
end

SLASH_DJCACHE1 = "/djcache"
SlashCmdList["DJCACHE"] = function()
    print("|cFFFFD700[Cache Debug]|r")
    print("  Attunement entries: " .. table.getn(smartCache.attunement))
    print("  Forge entries: " .. table.getn(smartCache.forge))
    print("  Queue length: " .. #smartCache.updateQueue)
    print("  Processing: " .. (smartCache.processing and "Yes" or "No"))
end

-- ʕ ● ᴥ ●ʔ✿ Initialize the performance module ✿ʕ ● ᴥ ●ʔ
function Performance.Initialize()
    Performance.InitializeSmartCache()
end

-- ʕノ•ᴥ•ʔノ✿ Export global functions ✿ʕノ•ᴥ•ʔノ
_G.Performance = Performance
_G.GetItemButton = Performance.GetItemButton
_G.ReleaseItemButton = Performance.ReleaseItemButton
_G.ReleaseAllItemButtons = Performance.ReleaseAllItemButtons
_G.GetCachedDropRate = Performance.GetCachedDropRate
_G.DebouncedSave = Performance.DebouncedSave
_G.InvalidateItemCache = Performance.InvalidateItemCache

-- ＼ʕ •ᴥ•ʔ／✿ Auto-initialize ✿＼ʕ •ᴥ•ʔ／
Performance.Initialize()

-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ
