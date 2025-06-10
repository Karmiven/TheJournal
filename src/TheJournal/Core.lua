local debug = true
_G.debug = false-- Make debug available globally
Journal_charDB = Journal_charDB or {}

local settings = Journal_charDB
--------------------------------------------------------------------
-- INITIALIZATION ON ADDON LOAD
--------------------------------------------------------------------
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == "TheJournal" then
        -- Initialize character-specific settings
        settings.showDungeonName = (settings.showDungeonName == nil) and true or settings.showDungeonName
        settings.hasAlreadyCached = settings.hasAlreadyCached or false
        settings.cached = settings.cached or {}
        settings.recacheScheduled = settings.recacheScheduled or {}
        settings.favorites = settings.favorites or {}
        settings.filterType = settings.filterType or "All"
        settings.leveledBoss = settings.leveledBoss or {}
        settings.activeFilters = settings.activeFilters or {}
        settings.levelUpClickCount = settings.levelUpClickCount or {}
        
        -- Initialize ItemLoc integration setting
        if settings.useItemLocData == nil then
            settings.useItemLocData = true -- Default to enabled
        end

        -- Default armor and weapon types, plus armor slots
        local localizedClass, englishClass = UnitClass("player")
        if not settings.allowedArmorType then
            settings.allowedArmorType = {
                WARRIOR     = { "Plate", "Mail", "Leather" },
                DEATHKNIGHT = { "Plate", "Mail", "Leather" },
                PALADIN     = { "Plate", "Mail", "Leather", "Cloth" },
                HUNTER      = { "Mail", "Leather" },
                ROGUE       = { "Leather" },
                PRIEST      = { "Cloth" },
                MAGE        = { "Cloth" },
                WARLOCK     = { "Cloth" },
                DRUID       = { "Leather", "Cloth" },
                SHAMAN      = { "Mail", "Leather", "Cloth" },
            }
        end

        if not settings.allowedWeaponType then
            settings.allowedWeaponType = {
                WARRIOR     = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms", "Shield" },
                DEATHKNIGHT = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms" },
                PALADIN     = { "One-Handed Maces", "One-Handed Swords", "Two-Handed Maces", "Two-Handed Swords",
                    "Daggers", "Fist Weapons", "Staves", "Shield" },
                HUNTER      = { "Bows", "Guns", "Crossbows", "Daggers", "One-Handed Swords", "One-Handed Axes", "Fist Weapons" },
                ROGUE       = { "Daggers", "Fist Weapons", "One-Handed Swords", "One-Handed Axes" },
                PRIEST      = { "Daggers", "Staves", "Wands", "One-Handed Maces" },
                MAGE        = { "Daggers", "Staves", "Wands", "One-Handed Swords", "Two-Handed Swords", "Shield" },
                WARLOCK     = { "Daggers", "Staves", "Wands", "One-Handed Swords" },
                DRUID       = { "Daggers", "Fist Weapons", "Staves", "One-Handed Maces" },
                SHAMAN      = { "One-Handed Axes", "One-Handed Maces", "Two-Handed Maces", "Staves", "Daggers", "Fist Weapons", "Shield" },
            }
        end

        if not settings.allowedArmorSlots then
            settings.allowedArmorSlots = {
                Head     = true,
                Neck     = true,
                Shoulder = true,
                Back     = true,
                Chest    = true,
                Wrist    = true,
                Hands    = true,
                Waist    = true,
                Legs     = true,
                Feet     = true,
                Finger   = true,
                Trinket  = true,
            }
        end
        --[[
        local key1, key2 = GetBindingKey("Journal_charDB_TOGGLERUNE")
        if not key1 and not key2 then
            SetBinding("G", "Journal_charDB_TOGGLERUNE")
            SaveBindings(GetCurrentBindingSet())
        end
        --]]
    end
end)


-- Globals / saved variables
-- Put these in _G if you want other files to reference them easily
_G.Journal_charDB = _G.Journal_charDB or {}
_G.Journal_charDB.favorites = _G.Journal_charDB.favorites or {} -- itemID -> true if favorited
_G.Journal_charDB.currentVersionIndex = _G.Journal_charDB.currentVersionIndex or 1
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false }

-- If needed as globals elsewhere:
_G.lastBossNavDungeon = _G.lastBossNavDungeon or nil
_G.currentBossIndex = _G.currentBossIndex or 1

-- Access the global table of dungeons
local dungeonData = _G.Journal and _G.Journal.djDungeons or {}
_G.dungeonData = dungeonData -- If you need to reference it outside
print("|cff66ccff[DJ_Debug]|r # of dungeons in _G.Journal.djDungeons =", #dungeonData)

-- Frame for loading, events, etc.
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
end)

-- Slash command to toggle
SLASH_DJ1 = "/dj"
SlashCmdList["DJ"] = function(msg)
    if DungeonJournalFrame then
        DungeonJournalFrame:Show()
        debugPrint("DungeonJournalFrame is nil!")
    end
end

-- Slash command to recache
SLASH_DJRECACHE1 = "/djcache"
SlashCmdList["DJRECACHE"] = function(msg)
    debugPrint("/djcache => resetting caches.")
    Journal_charDB.cached = {}
end
SLASH_DJWIPE = "/djwipe"
SlashCmdList["DJWIPE"] = function(msg)
    debugPrint("/djwipe => resetting caches.")
    _G.Journal_charDB = {}
end

-- Slash command to test ItemLoc integration
SLASH_DJITEMLOC1 = "/djitemloc"
SlashCmdList["DJITEMLOC"] = function(msg)
    local itemID = tonumber(msg)
    if not itemID then
        print("|cff66ccff[DJ ItemLoc]|r Usage: /djitemloc <itemID>")
        print("|cff66ccff[DJ ItemLoc]|r Example: /djitemloc 39139")
        return
    end
    
    -- Check if ItemLoc functions exist
    if not ItemLocIsLoaded then
        print("|cff66ccff[DJ ItemLoc]|r ItemLoc functions not available (server doesn't support them)")
        return
    end
    
    local version = ItemLocIsLoaded()
    if not version then
        print("|cff66ccff[DJ ItemLoc]|r ItemLoc database not loaded (version:", tostring(version) .. ")")
        return
    end
    
    print("|cff66ccff[DJ ItemLoc]|r ItemLoc database version:", version)
    
    if not _G.ItemLocAPI then
        print("|cff66ccff[DJ ItemLoc]|r ItemLocAPI wrapper not loaded")
        return
    end
    
    if not _G.ItemLocAPI:IsLoaded() then
        print("|cff66ccff[DJ ItemLoc]|r ItemLocAPI reports database not loaded")
        return
    end
    
    -- Test the API
    local count = ItemLocGetSourceCount(itemID)
    print("|cff66ccff[DJ ItemLoc]|r Raw API - Source count for item", itemID .. ":", tostring(count))
    
    if count and count > 0 then
        for i = 1, math.min(count, 3) do
            local srcType, objType, objId, chance, dropsPerThousand, objName, zoneName, spawnedCount = ItemLocGetSourceAt(itemID, i)
            print("|cff66ccff[DJ ItemLoc]|r Source", i .. ":", objName or "Unknown", "- Chance:", tostring(chance) .. "%")
        end
    end
    
    -- Test wrapper
    local bestSource = _G.ItemLocAPI:GetBestSource(itemID)
    if bestSource then
        print("|cff66ccff[DJ ItemLoc]|r Best source:", bestSource.objName or "Unknown", "- Chance:", tostring(bestSource.chance) .. "%")
    else
        print("|cff66ccff[DJ ItemLoc]|r No best source found")
    end
    
    _G.ItemLocAPI:DebugPrintSources(itemID)
end

-- Slash command to search for boss drops
SLASH_DJBOSS1 = "/djboss"
SlashCmdList["DJBOSS"] = function(msg)
    if not msg or msg == "" then
        print("|cff66ccff[DJ Boss]|r Usage: /djboss <boss_name_or_id>")
        print("|cff66ccff[DJ Boss]|r Examples:")
        print("|cff66ccff[DJ Boss]|r   /djboss Kel'Thuzad")
        print("|cff66ccff[DJ Boss]|r   /djboss 15990")
        return
    end
    
    -- Check if ItemLoc functions exist
    if not ItemLocIsLoaded or not ItemLocIsLoaded() then
        print("|cff66ccff[DJ Boss]|r ItemLoc database not available")
        return
    end
    
    local bossId = tonumber(msg)
    local bossName = msg
    
    -- If not a number, try to find boss ID by name
    if not bossId then
        bossId = FindBossIdByName(bossName)
        if not bossId then
            print("|cff66ccff[DJ Boss]|r Boss not found:", bossName)
            print("|cff66ccff[DJ Boss]|r Try using the boss ID instead, or check spelling")
            return
        end
    end
    
    ShowBossDrops(bossId, bossName)
end

-- Function to find boss ID by name from dungeon data
function FindBossIdByName(searchName)
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
                        print("|cff66ccff[DJ Boss]|r Found boss:", boss.name, "ID:", boss.bossID, "in", dungeon.name)
                        return boss.bossID
                    end
                end
            end
        end
    end
    
    return nil
end

-- Function to display drops from a specific boss
function ShowBossDrops(bossId, bossName)
    if not ItemLocGetObjCount then
        print("|cff66ccff[DJ Boss]|r ItemLoc functions not available")
        return
    end
    
    -- Get items that drop from this boss (creature type = 1)
    local count = ItemLocGetObjCount(1, bossId)
    if not count or count == 0 then
        print("|cff66ccff[DJ Boss]|r No drops found for boss ID:", bossId)
        return
    end
    
    print("|cff66ccff[DJ Boss]|r" .. string.rep("=", 50))
    print("|cff66ccff[DJ Boss]|r Drops from:", bossName or ("Boss ID " .. bossId))
    print("|cff66ccff[DJ Boss]|r Total items:", count)
    print("|cff66ccff[DJ Boss]|r" .. string.rep("=", 50))
    
    local items = {}
    
    -- Collect all items
    for i = 1, count do
        local srcType, itemId, chance, dropsPerThousand = ItemLocGetObjAt(1, bossId, i)
        if itemId then
            table.insert(items, {
                itemId = itemId,
                chance = chance or 0,
                dropsPerThousand = dropsPerThousand or 0
            })
        end
    end
    
    -- Sort by drop chance (highest first)
    table.sort(items, function(a, b)
        return (a.chance or 0) > (b.chance or 0)
    end)
    
    -- Display items
    for i, item in ipairs(items) do
        local itemName, itemLink, quality = GetItemInfo(item.itemId)
        if not itemName then
            itemName = "Item " .. item.itemId
            itemLink = "|cffffffff[" .. itemName .. "]|r"
        end
        
        local qualityColor = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
        local chanceText = item.chance > 0 and string.format("%.2f%%", item.chance) or "Unknown%"
        
        print(string.format("|cff66ccff[DJ Boss]|r %d. %s%s|r - %s", 
            i, qualityColor.hex, itemName, chanceText))
    end
    
    print("|cff66ccff[DJ Boss]|r" .. string.rep("=", 50))
end
