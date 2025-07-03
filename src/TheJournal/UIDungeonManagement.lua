-- ##################################################################
-- # UIDungeonManagement.lua
-- # ʕ •ᴥ•ʔ✿ Dungeon Management System ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIDungeonManagement = {}

-- ʕ •ᴥ•ʔ✿ Cache for dungeon-specific data ✿ʕ•ᴥ•ʔ
local dungeonCache = {
    currentDungeon = nil,
    currentCategory = nil,
    dropRates = {},
    bossFrames = {},
    lastDungeonUpdate = 0,
    dungeonAttunement = {},
    dungeonAttunementLastUpdate = {}
}

-- ʕ •ᴥ•ʔ✿ Make caches weak to allow garbage collection ✿ʕ•ᴥ•ʔ
setmetatable(dungeonCache.bossFrames, {__mode = "v"})
setmetatable(dungeonCache.dungeonAttunement, {__mode = "v"})
setmetatable(dungeonCache.dungeonAttunementLastUpdate, {__mode = "v"})

-- ʕ •ᴥ•ʔ✿ Cache frequently used global functions for better performance ✿ʕ•ᴥ•ʔ
local GetTime = GetTime
local pairs = pairs
local ipairs = ipairs

-- ʕ •ᴥ•ʔ✿ Get current dungeon from cache ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.GetCurrentDungeon()
    if not dungeonCache.currentDungeon then
        return nil
    end
    return Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonCache.currentDungeon)
end

-- ʕ •ᴥ•ʔ✿ Get current category from cache ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.GetCurrentCategory()
    if not dungeonCache.currentCategory then
        return nil
    end
    return Journal.GetDungeonsByCategory(dungeonCache.currentCategory)
end

-- ʕ •ᴥ•ʔ✿ Update dungeon cache with new dungeon data ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.UpdateDungeonCache(dungeonName)
    if dungeonName == dungeonCache.currentDungeon and 
       (GetTime() - dungeonCache.lastDungeonUpdate) < 5 then
        return -- Use cached data if recently updated
    end
    
    dungeonCache.currentDungeon = dungeonName
    dungeonCache.lastDungeonUpdate = GetTime()
    
    local dungeon = Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    if dungeon then
        -- Pre-cache boss frames
        if dungeon.bosses then
            for _, boss in ipairs(dungeon.bosses) do
                if boss.bossID and not dungeonCache.bossFrames[boss.bossID] then
                    -- Create and cache boss frame
                    dungeonCache.bossFrames[boss.bossID] = UIDungeonManagement.CreateBossFrame(boss)
                end
            end
        end
        
        -- Clear old drop rates for this dungeon
        UIDungeonManagement.ClearDungeonDropRateCache(dungeonName)
    end
end

-- ʕ •ᴥ•ʔ✿ Create boss frame for caching ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.CreateBossFrame(boss)
    if not boss or not boss.bossID then return nil end
    
    -- Check if frame already exists in cache
    if dungeonCache.bossFrames[boss.bossID] then
        return dungeonCache.bossFrames[boss.bossID]
    end
    
    local frame = CreateFrame("Frame", nil, UIParent)
    frame.bossID = boss.bossID
    frame.name = boss.name
    frame.loot = boss.loot or {}
    
    -- Cache the frame
    dungeonCache.bossFrames[boss.bossID] = frame
    
    -- Pre-cache drop rates for boss loot
    for _, item in ipairs(frame.loot) do
        if item.itemID then
            UIDungeonManagement.QueueDropRateUpdate(item.itemID, dungeonCache.currentDungeon)
        end
    end
    
    return frame
end

-- ʕ •ᴥ•ʔ✿ Get cached drop rate for an item ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.GetCachedDropRate(itemId, dungeonName)
    local cacheKey = (dungeonName or "unknown") .. "_" .. itemId
    
    if dungeonCache.dropRates[cacheKey] ~= nil then
        return dungeonCache.dropRates[cacheKey]
    end
    
    -- Get dungeon data from cache
    local dungeon = dungeonName and Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    
    -- Calculate and cache the drop rate
    local dropRate = 0
    if ItemLocAPI:IsLoaded() then
        local bestSource = ItemLocAPI:GetBestSource(itemId, dungeonName)
        dropRate = bestSource and bestSource.chance or 0
        
        -- If we have dungeon data, verify the source is valid
        if dungeon and bestSource then
            local bossData = Journal.GetBossByID(bestSource.bossID)
            if bossData and bossData.dungeon.name == dungeonName then
                -- Source verified, cache the result
                dungeonCache.dropRates[cacheKey] = dropRate
            end
        end
    end
    
    dungeonCache.dropRates[cacheKey] = dropRate
    return dropRate
end

-- ʕ •ᴥ•ʔ✿ Queue drop rate updates ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.QueueDropRateUpdate(itemID, dungeonName)
    local cacheKey = dungeonName .. "_" .. itemID
    if dungeonCache.dropRates[cacheKey] == nil then
        C_Timer.After(0.1, function()
            UIDungeonManagement.GetCachedDropRate(itemID, dungeonName)
        end)
    end
end

-- ʕ •ᴥ•ʔ✿ Clear drop rate cache for a specific dungeon ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.ClearDungeonDropRateCache(dungeonName)
    if not dungeonName then return end
    
    -- Cache the search pattern to avoid repeated string concatenation
    local searchPattern = dungeonName .. "_"
    local keysToRemove = {}
    
    -- Collect keys to remove first, then remove them
    for cacheKey, _ in pairs(dungeonCache.dropRates) do
        if cacheKey:find(searchPattern, 1, true) == 1 then
            keysToRemove[#keysToRemove + 1] = cacheKey
        end
    end
    
    -- Remove collected keys
    for i = 1, #keysToRemove do
        dungeonCache.dropRates[keysToRemove[i]] = nil
    end
end

-- ʕ •ᴥ•ʔ✿ Function to update UI when dungeon changes ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.OnDungeonChanged(dungeonName)
    if not dungeonName then return end
    
    -- Update dungeon cache
    UIDungeonManagement.UpdateDungeonCache(dungeonName)
    
    -- Get dungeon data from cache
    local dungeon = Journal and Journal.GetDungeonByName and Journal.GetDungeonByName(dungeonName)
    if not dungeon then return end
    
    -- Update category if needed
    if dungeon.category ~= dungeonCache.currentCategory then
        dungeonCache.currentCategory = dungeon.category
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

-- ʕ •ᴥ•ʔ✿ Calculate dungeon attunables with caching ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.CalculateDungeonAttunables(dungeon)
    if not dungeon or not dungeon.items or not dungeon.name then
        return 0, 0
    end
    
    local currentTime = GetTime()
    local cacheKey = dungeon.name
    
    -- Check if we have cached data that's still fresh (cache for 30 seconds)
    local lastUpdate = dungeonCache.dungeonAttunementLastUpdate[cacheKey]
    if lastUpdate and (currentTime - lastUpdate) < 30 and dungeonCache.dungeonAttunement[cacheKey] then
        local cached = dungeonCache.dungeonAttunement[cacheKey]
        return cached.attunablesLeft, cached.totalAttunable
    end
    
    local totalAttunable = 0
    local attunablesLeft = 0
    
    for _, itemID in ipairs(dungeon.items) do
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
        if canAttune == 1 then
            totalAttunable = totalAttunable + 1
            
            -- Use smart cache for attunement progress to avoid expensive API calls
            local attuneProgress = _G.GetCachedAttunement and _G.GetCachedAttunement(itemID)
            if attuneProgress == nil then
                attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                if _G.SetCachedAttunement then
                    _G.SetCachedAttunement(itemID, attuneProgress)
                end
            end
            
            if attuneProgress < 100 then
                attunablesLeft = attunablesLeft + 1
            end
        end
    end
    
    -- Cache the results
    dungeonCache.dungeonAttunement[cacheKey] = {
        attunablesLeft = attunablesLeft,
        totalAttunable = totalAttunable
    }
    dungeonCache.dungeonAttunementLastUpdate[cacheKey] = currentTime
    
    return attunablesLeft, totalAttunable
end

-- ʕ •ᴥ•ʔ✿ Invalidate dungeon attunement cache ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.InvalidateDungeonAttunementCache(dungeonName)
    if dungeonName then
        -- Clear cache for specific dungeon
        dungeonCache.dungeonAttunement[dungeonName] = nil
        dungeonCache.dungeonAttunementLastUpdate[dungeonName] = nil
    else
        -- Clear entire cache
        dungeonCache.dungeonAttunement = {}
        dungeonCache.dungeonAttunementLastUpdate = {}
        -- Recreate weak references
        setmetatable(dungeonCache.dungeonAttunement, {__mode = "v"})
        setmetatable(dungeonCache.dungeonAttunementLastUpdate, {__mode = "v"})
    end
end

-- ʕ •ᴥ•ʔ✿ Find dungeon by name ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.FindDungeonByName(dungeonName)
    local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
    for _, dungeon in ipairs(dungeonData) do
        if dungeon.name == dungeonName then
            return dungeon
        end
    end
    return nil
end

-- ʕ •ᴥ•ʔ✿ Get version modifier for dungeon ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.GetVersionModifierForDungeon(dungeon, versionIndex)
    if dungeon.versions and dungeon.versions[versionIndex] then
        return dungeon.versions[versionIndex].modifier or 0
    elseif dungeon.versions and #dungeon.versions > 0 then
        return dungeon.versions[#dungeon.versions].modifier or 0
    end
    return 0
end

-- ʕ •ᴥ•ʔ✿ Get cache statistics for debugging ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.GetCacheStats()
    local stats = {
        dropRateEntries = 0,
        bossFrameEntries = 0,
        attunementEntries = 0,
        currentDungeon = dungeonCache.currentDungeon,
        currentCategory = dungeonCache.currentCategory,
        lastUpdate = dungeonCache.lastDungeonUpdate
    }
    
    for _ in pairs(dungeonCache.dropRates) do
        stats.dropRateEntries = stats.dropRateEntries + 1
    end
    
    for _ in pairs(dungeonCache.bossFrames) do
        stats.bossFrameEntries = stats.bossFrameEntries + 1
    end
    
    for _ in pairs(dungeonCache.dungeonAttunement) do
        stats.attunementEntries = stats.attunementEntries + 1
    end
    
    return stats
end

-- ʕ •ᴥ•ʔ✿ Clear all caches for testing ✿ʕ•ᴥ•ʔ
function UIDungeonManagement.ClearAllCaches()
    dungeonCache.dropRates = {}
    dungeonCache.bossFrames = {}
    dungeonCache.dungeonAttunement = {}
    dungeonCache.dungeonAttunementLastUpdate = {}
    dungeonCache.currentDungeon = nil
    dungeonCache.currentCategory = nil
    dungeonCache.lastDungeonUpdate = 0
    
    -- Recreate weak references
    setmetatable(dungeonCache.bossFrames, {__mode = "v"})
    setmetatable(dungeonCache.dungeonAttunement, {__mode = "v"})
    setmetatable(dungeonCache.dungeonAttunementLastUpdate, {__mode = "v"})
end

-- ʕ •ᴥ•ʔ✿ Global access ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIDungeonManagement = UIDungeonManagement

return UIDungeonManagement
