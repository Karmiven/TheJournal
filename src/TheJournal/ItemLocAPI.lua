-- ##################################################################
-- # ITEMLOC API INTEGRATION
-- ##################################################################
-- This module provides wrappers and utilities for the ItemLoc API functions
-- to integrate loot database functionality into TheJournal addon

local ItemLocAPI = {}

-- Cache for loaded state
local isLoaded = nil
local lastLoadCheck = 0
local LOAD_CHECK_INTERVAL = 5 -- Check every 5 seconds

ItemLocAPI.SOURCE_TYPES = {
    CREATURE = 1,
    OBJECT = 2,
    ITEM = 3,
    QUEST = 4,
    VENDOR = 5,
    ZONE_DROP = 6,
    PROFESSION = 7,
    ACHIEVEMENT = 8,
}

-- Sort type constants
ItemLocAPI.SORT_TYPES = {
    NAME = 1,
    LEVEL = 2,
    ZONE = 3,
    CHANCE = 4,
    TYPE = 5,
}

-- List of NPCs to filter out and their lower-level alternatives
local NPC_FILTERS = {
    ["Captain Dirgehammer"] = true,
    ["Doris Volanthius"] = true,
    ["Lieutenant Tristia"] = true,
    ["Sergeant Thunderhorn"] = true
}

-- ##################################################################
-- # CORE API WRAPPER FUNCTIONS
-- ##################################################################

-- Check if the ItemLoc database is loaded
function ItemLocAPI:IsLoaded()
    local time = GetTime()
    if not isLoaded or (time - lastLoadCheck) > LOAD_CHECK_INTERVAL then
        isLoaded = ItemLocIsLoaded()
        lastLoadCheck = time
    end
    return isLoaded
end

-- Get the number of sources for an item
function ItemLocAPI:GetSourceCount(itemId)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocGetSourceCount(itemId)
end

-- Get information about a specific source for an item
function ItemLocAPI:GetSourceAt(itemId, index)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocGetSourceAt(itemId, index)
end

-- Sort sources for an item
function ItemLocAPI:SetSourceSort(itemId, sortType)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocSetSourceSort(itemId, sortType)
end

-- Get the last sort type used for an item
function ItemLocAPI:GetSourceSort(itemId)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocGetSourceSort(itemId)
end

-- Get count of items from a specific source
function ItemLocAPI:GetObjCount(typeId, objId)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocGetObjCount(typeId, objId)
end

-- Get item information from a specific source
function ItemLocAPI:GetObjAt(typeId, objId, index)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocGetObjAt(typeId, objId, index)
end

-- Sort items from a specific source
function ItemLocAPI:SetObjSort(typeId, objId, sortType)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocSetObjSort(typeId, objId, sortType)
end

-- Fix up object ID based on current difficulty
function ItemLocAPI:FixupObjId(objType, objId)
    if not self:IsLoaded() then
        return objId -- Return original if not loaded
    end
    return ItemLocFixupObjId(objType, objId)
end

-- Check if an item can come from a specific zone
function ItemLocAPI:ItemIsInZone(itemId, zoneId)
    if not self:IsLoaded() then
        return nil
    end
    return ItemLocItemIsInZone(itemId, zoneId)
end

-- ##################################################################
-- # UTILITY AND HELPER FUNCTIONS
-- ##################################################################

-- Get all sources for an item in a structured format
function ItemLocAPI:GetAllSources(itemId, dungeonName)
    local count = self:GetSourceCount(itemId)
    if not count or count == 0 then
        return {}
    end
    
    local sources = {}
    local allSources = {}
    for i = 1, count do
        local srcType, objType, objId, chance, dropsPerThousand, objName, zoneName, spawnedCount = self:GetSourceAt(itemId, i)
        if srcType then
            -- Track all sources for fallback
            table.insert(allSources, {
                srcType = srcType,
                objType = objType,
                objId = objId,
                chance = chance,
                dropsPerThousand = dropsPerThousand,
                objName = objName,
                zoneName = zoneName,
                spawnedCount = spawnedCount,
                index = i
            })
            
            local shouldSkip = false
            
            -- AGGRESSIVE FILTERING for Vault of Archavon - only show legitimate boss drops
            if dungeonName == "Vault of Archavon" then
                -- For Vault of Archavon, ONLY exclude sources with 100%+ droprate (quest/vendor)
                if chance and chance >= 100 then
                    shouldSkip = true -- Skip quest/vendor sources (100%+)
                end
            else
                -- Original filtering logic for other dungeons
                -- Exclude ALL vendor sources for Vault of Archavon
                if dungeonName == "Vault of Archavon" and srcType == self.SOURCE_TYPES.VENDOR then
                    shouldSkip = true
                end
                
                if srcType == self.SOURCE_TYPES.CREATURE and NPC_FILTERS[objName] then
                    shouldSkip = true
                end
                if srcType == self.SOURCE_TYPES.CREATURE and (not zoneName or zoneName == "" or zoneName == "Unknown" or zoneName == "?") then
                    shouldSkip = true
                end
                if srcType == self.SOURCE_TYPES.VENDOR and (not zoneName or zoneName == "" or zoneName == "Unknown" or zoneName == "?") then
                    shouldSkip = true
                end
            end
            
            if not shouldSkip then
                table.insert(sources, {
                    srcType = srcType,
                    objType = objType,
                    objId = objId,
                    chance = chance,
                    dropsPerThousand = dropsPerThousand,
                    objName = objName,
                    zoneName = zoneName,
                    spawnedCount = spawnedCount,
                    index = i
                })
            end
        end
    end
    
    -- Sort by chance (highest first) and return
    table.sort(sources, function(a, b)
        return (a.chance or 0) > (b.chance or 0)
    end)
    
    return sources
end

-- Get all items from a specific source in a structured format
function ItemLocAPI:GetAllItemsFromSource(typeId, objId)
    local count = self:GetObjCount(typeId, objId)
    if not count or count == 0 then
        return {}
    end
    
    local items = {}
    for i = 1, count do
        local srcType, itemId, chance, dropsPerThousand = self:GetObjAt(typeId, objId, i)
        if srcType and itemId then
            table.insert(items, {
                srcType = srcType,
                itemId = itemId,
                chance = chance,
                dropsPerThousand = dropsPerThousand,
                index = i
            })
        end
    end
    return items
end

-- Get the best drop source for an item (highest chance)
function ItemLocAPI:GetBestSource(itemId, dungeonName)
    local sources = self:GetAllSources(itemId, dungeonName)
    if not sources or #sources == 0 then
        return nil
    end
    
    -- Sort sources by chance (highest first)
    table.sort(sources, function(a, b)
        return (a.chance or 0) > (b.chance or 0)
    end)
    
    -- Return the highest chance source
    return sources[1]
end

-- Get sources for an item filtered by zone
function ItemLocAPI:GetSourcesByZone(itemId, zoneName, dungeonName)
    local sources = self:GetAllSources(itemId, dungeonName)
    local filteredSources = {}
    
    for _, source in ipairs(sources) do
        if source.zoneName and source.zoneName:lower():find(zoneName:lower()) then
            table.insert(filteredSources, source)
        end
    end
    return filteredSources
end

-- Get a formatted string describing item sources
function ItemLocAPI:GetSourceSummary(itemId, maxSources, dungeonName)
    maxSources = maxSources or 3
    local sources = self:GetAllSources(itemId, dungeonName)
    
    if not sources or #sources == 0 then
        return "No sources found"
    end
    
    local summaries = {}
    local count = math.min(#sources, maxSources)
    
    for i = 1, count do
        local source = sources[i]
        local summary = source.objName or "Unknown"
        if source.zoneName and source.zoneName ~= "" and source.zoneName ~= "Unknown" then
            summary = summary .. " (" .. source.zoneName .. ")"
        end
        if source.chance then
            summary = summary .. " - " .. string.format("%.2f%%", source.chance)
        end
        table.insert(summaries, summary)
    end
    
    local result = table.concat(summaries, ", ")
    if #sources > maxSources then
        result = result .. ", +" .. (#sources - maxSources) .. " more"
    end
    
    return result
end

-- Get source type name from ID
function ItemLocAPI:GetSourceTypeName(srcType)
    local sourceTypes = {
        [1] = "Creature",
        [2] = "Object", 
        [3] = "Item",
        [4] = "Quest",
        [5] = "Vendor",
        [6] = "Zone Drop",
        [7] = "Profession",
        [8] = "Achievement"
    }
    return sourceTypes[srcType] or "Unknown"
end

-- Check if item has any sources in current zone
function ItemLocAPI:HasSourceInCurrentZone(itemId)
    local zoneText = GetZoneText()
    if not zoneText then
        return false
    end
    
    local sources = self:GetSourcesByZone(itemId, zoneText)
    return #sources > 0
end

-- ##################################################################
-- # INTEGRATION WITH THEJOURNAL
-- ##################################################################

-- Get dynamic item list for a dungeon/zone based on bosses
function ItemLocAPI:GetDungeonItems(dungeon)
    if not self:IsLoaded() then
        return dungeon.items or {} -- Fallback to static list
    end
    
    local items = {}
    local itemSet = {} -- To avoid duplicates
    
    -- If dungeon has bosses defined, get items from those bosses
    if dungeon.bosses then
        for _, boss in ipairs(dungeon.bosses) do
            if boss.bossID then
                local bossItems = self:GetAllItemsFromSource(self.SOURCE_TYPES.CREATURE, boss.bossID)
                for _, itemInfo in ipairs(bossItems) do
                    if not itemSet[itemInfo.itemId] then
                        itemSet[itemInfo.itemId] = true
                        table.insert(items, itemInfo.itemId)
                    end
                end
            end
        end
    end
    
    -- If no items found from bosses, fallback to static list
    if #items == 0 and dungeon.items then
        return dungeon.items
    end
    
    return items
end

-- Update drop location text for item buttons using ItemLoc data
function ItemLocAPI:GetItemDropLocationText(itemId, dungeonName)
    if not self:IsLoaded() then
        return "Static data" -- Fallback text
    end
    
    local bestSource = self:GetBestSource(itemId, dungeonName)
    if not bestSource then
        return "Unknown source"
    end
    
    local text = bestSource.objName or "Unknown"
    if bestSource.zoneName then
        text = text .. " (" .. bestSource.zoneName .. ")"
    end
    if bestSource.chance and bestSource.chance > 0 then
        text = text .. " - " .. string.format("%.2f%%", bestSource.chance)
    end
    
    return text
end

-- ##################################################################
-- # BOSS SEARCH FUNCTIONS
-- ##################################################################

-- Get all items that drop from a specific boss/creature
function ItemLocAPI:GetBossDrops(bossId)
    if not self:IsLoaded() then
        return {}
    end
    
    local items = self:GetAllItemsFromSource(self.SOURCE_TYPES.CREATURE, bossId)
    
    -- Sort by drop chance (highest first)
    table.sort(items, function(a, b)
        return (a.chance or 0) > (b.chance or 0)
    end)
    
    return items
end

-- Find boss ID by name from dungeon data
function ItemLocAPI:FindBossIdByName(searchName)
    if not _G.dungeonData then
        return nil
    end
    
    local searchLower = searchName:lower()
    
    for _, dungeon in ipairs(_G.dungeonData) do
        if dungeon.bosses then
            for _, boss in ipairs(dungeon.bosses) do
                if boss.name and boss.bossID then
                    local bossNameLower = boss.name:lower()
                    if bossNameLower:find(searchLower, 1, true) then
                        return boss.bossID, boss.name, dungeon.name
                    end
                end
            end
        end
    end
    
    return nil
end

-- Get formatted boss drops summary
function ItemLocAPI:GetBossDropsSummary(bossId, maxItems)
    maxItems = maxItems or 10
    local items = self:GetBossDrops(bossId)
    
    if not items or #items == 0 then
        return "No drops found"
    end
    
    local summaries = {}
    local count = math.min(#items, maxItems)
    
    for i = 1, count do
        local item = items[i]
        local itemName = GetItemInfo(item.itemId) or ("Item " .. item.itemId)
        local chanceText = item.chance and string.format("%.2f%%", item.chance) or "?%"
        table.insert(summaries, itemName .. " (" .. chanceText .. ")")
    end
    
    local result = table.concat(summaries, ", ")
    if #items > maxItems then
        result = result .. ", +" .. (#items - maxItems) .. " more"
    end
    
    return result
end

-- ##################################################################
-- # DEBUG AND UTILITY FUNCTIONS
-- ##################################################################

-- Debug function to print all sources for an item
function ItemLocAPI:DebugPrintSources(itemId)
    local itemName = GetItemInfo(itemId) or "Unknown Item"
    print("Sources for", itemName, "(" .. itemId .. "):")
    
    if not self:IsLoaded() then
        print("  ItemLoc database not loaded")
        return
    end
    
    local sources = self:GetAllSources(itemId)
    if #sources == 0 then
        print("  No sources found")
        return
    end
    
    for i, source in ipairs(sources) do
        local typeText = self:GetSourceTypeName(source.srcType)
        local chanceText = source.chance and string.format("%.2f%%", source.chance) or "Unknown"
        print(string.format("  %d. [%s] %s (%s) - %s", 
            i, typeText, source.objName or "Unknown", source.zoneName or "Unknown Zone", chanceText))
    end
end

-- Export to global namespace
_G.ItemLocAPI = ItemLocAPI

-- Debug print to confirm loading - always print this
print("|cff66ccff[DJ_Debug]|r ItemLocAPI module loaded successfully")

-- Test if the base functions exist
if ItemLocIsLoaded then
    print("|cff66ccff[DJ_Debug]|r ItemLoc base functions are available")
    local version = ItemLocIsLoaded()
    if version then
        print("|cff66ccff[DJ_Debug]|r ItemLoc database loaded, version:", version)
    else
        print("|cff66ccff[DJ_Debug]|r ItemLoc database not loaded")
    end
else
    print("|cff66ccff[DJ_Debug]|r ItemLoc base functions NOT available")
end 