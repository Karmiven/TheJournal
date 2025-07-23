-- ##################################################################
-- # UTILITY FUNCTIONS
-- ##################################################################

if not C_Timer then
    C_Timer = {}
    function C_Timer.After(delay, func)
        local f = CreateFrame("Frame")
        f.elapsed = 0
        f:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = self.elapsed + elapsed
            if self.elapsed >= delay then
                self:SetScript("OnUpdate", nil)
                func()
            end
        end)
    end

    function C_Timer.NewTicker(delay, func, iterations)
        local f = CreateFrame("Frame")
        f.elapsed = 0
        f.count = 0
        f.maxIterations = iterations or nil -- nil means infinite
        f:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = self.elapsed + elapsed
            if self.elapsed >= delay then
                self.elapsed = 0
                self.count = self.count + 1
                func()
                if self.maxIterations and self.count >= self.maxIterations then
                    self:SetScript("OnUpdate", nil)
                end
            end
        end)
        -- Return an object with Cancel method
        return {
            Cancel = function()
                f:SetScript("OnUpdate", nil)
            end
        }
    end
end

-- ʕ •ᴥ•ʔ✿ Cross-version texture color compatibility ✿ʕ •ᴥ•ʔ
local function SetTextureColor(texture, r, g, b, a)
    if texture.SetColorTexture then
        texture:SetColorTexture(r, g, b, a)
    else
        texture:SetTexture(r, g, b, a)
    end
end

local function IsInList(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

local function GetCurrentClass()
    local _, englishClass = UnitClass("player")
    return englishClass
end

local function NormalizeItemType(itemType, itemSubType, equipLoc)
    -- If item is "Armor" but actually a shield/off-hand, force them to be "Weapon" with a matching subType.
    if itemType == "Armor" then
        if itemSubType == "Shields" then
            itemType = "Weapon"
            itemSubType = "Shield" -- user must have "Shield" in allowedWeaponType
        elseif equipLoc == "INVTYPE_HOLDABLE" and itemSubType == "Miscellaneous" then
            itemType = "Weapon"
            itemSubType = "Off-hand" -- user must have "Off-hand" in allowedWeaponType
        end
    end

    -- If itemType=="Weapon" and subType=="Daggers", user must have "Daggers" in allowedWeaponType
    -- If you have more cases (e.g. "Wands"), unify them similarly.

    return itemType, itemSubType
end

-- Always include base: Cloth, Leather, Mail, Plate
local function GetAllArmorTypes()
    local baseArmor = { "Cloth", "Leather", "Mail", "Plate" }
    local union, seen = {}, {}

    for _, armorType in ipairs(baseArmor) do
        seen[armorType] = true
        table.insert(union, armorType)
    end

    if Journal_charDB.allowedArmorType then
        for className, armorList in pairs(Journal_charDB.allowedArmorType) do
            if armorList then
                for _, t in ipairs(armorList) do
                    if not seen[t] then
                        seen[t] = true
                        table.insert(union, t)
                    end
                end
            end
        end
    end

    table.sort(union)
    return union
end

local function GetAllWeaponTypes()
    local union, seen = {}, {}
    local currentClass = GetCurrentClass()
    local weaponTypes = Journal_charDB.allowedWeaponType and Journal_charDB.allowedWeaponType[currentClass] or {}
    for _, t in ipairs(weaponTypes) do
        if not seen[t] then
            seen[t] = true
            table.insert(union, t)
        end
    end
    table.sort(union)
    return union
end

function IsItemEquippableByClass(itemID, filterIcon)
    local itemName, link, quality, _, _, itemType, itemSubType, _, equipLoc = GetItemInfo(itemID)
    if not itemName then
        -- debugPrint("IsItemEquippableByClass:", itemID, "not cached => false")
        return false
    end

    local cClass       = GetCurrentClass()
    local armorTypes   = Journal_charDB.allowedArmorType and Journal_charDB.allowedArmorType[cClass] or {}
    local weaponTypes  = Journal_charDB.allowedWeaponType and Journal_charDB.allowedWeaponType[cClass] or {}
    local allowedSlots = Journal_charDB.allowedArmorSlots or {}

    -- If no filters are set, pass the item.
    if (#armorTypes == 0) and (#weaponTypes == 0) then
        return true
    end

    -- Define a mapping for equip slots.
    local slotMap = {
        INVTYPE_HEAD     = "Head",
        INVTYPE_NECK     = "Neck",
        INVTYPE_SHOULDER = "Shoulder",
        INVTYPE_CLOAK    = "Back",
        INVTYPE_CHEST    = "Chest",
        INVTYPE_BODY     = "Shirt",
        INVTYPE_TABARD   = "Tabard",
        INVTYPE_WRIST    = "Wrist",
        INVTYPE_HAND     = "Hands",
        INVTYPE_WAIST    = "Waist",
        INVTYPE_LEGS     = "Legs",
        INVTYPE_FEET     = "Feet",
        INVTYPE_FINGER   = "Finger",
        INVTYPE_TRINKET  = "Trinket",
    }
    local slotKey = slotMap[equipLoc or ""]

    -- Define slots that should ignore armor type filtering.
    local ignoreArmorTypeSlots = {
        Neck = true,
        Finger = true,
        Trinket = true,
        Back = true
    }

    -- If filtering by Weapons only, run only the weapon logic.
    if filterIcon == "Weapons" then
        if itemType == "Weapon" then
            return _G.IsInList(weaponTypes, itemSubType)
        elseif itemType == "Armor" and (itemSubType == "Shields" or equipLoc == "INVTYPE_HOLDABLE") then
            for _, wType in ipairs(weaponTypes) do
                if (itemSubType == "Shields" and wType == "Shield") or
                    (equipLoc == "INVTYPE_HOLDABLE" and wType == "Off-hand") then
                    return true
                end
            end
            return false
        else
            return false
        end
    end

    -- If filtering by Armor only, run only armor logic.
    if filterIcon == "Armor" then
        if itemType ~= "Armor" then
            return false
        end
        if slotKey and ignoreArmorTypeSlots[slotKey] then
            return allowedSlots[slotKey] == true
        end
        if #armorTypes > 0 then
            local foundType = false
            for _, t in ipairs(armorTypes) do
                if t == itemSubType then
                    foundType = true
                    break
                end
            end
            if not foundType then
                return false
            end
        end
        if slotKey then
            return allowedSlots[slotKey] == true
        end
        return false
    end

    -- If filterIcon is "All", check based on item type:
    if filterIcon == "All" then
        if itemType == "Armor" then
            if slotKey and ignoreArmorTypeSlots[slotKey] then
                return allowedSlots[slotKey] == true
            else
                if #armorTypes > 0 then
                    local foundType = false
                    for _, t in ipairs(armorTypes) do
                        if t == itemSubType then
                            foundType = true
                            break
                        end
                    end
                    if not foundType then
                        return false
                    end
                end
                if slotKey then
                    return allowedSlots[slotKey] == true
                end
                return false
            end
        elseif itemType == "Weapon" then
            if #weaponTypes == 0 then
                return true
            end
            return _G.IsInList(weaponTypes, itemSubType)
        else
            return true
        end
    end

    return true
end

local cacheQueue = cacheQueue or {}

local function ProcessCacheQueue()

end

local function CacheItem(itemID)
    local numID = tonumber(itemID) -- jic
    local iName = GetItemInfo(itemID)
    if not iName then iName = GetItemInfoCustom(itemID) end
    local iName = GetItemInfoCustom(itemID)
end



local function PreCacheDungeonVersion(dungeon, version, force)
    if not dungeon or not dungeon.items then
        return
    end
    Journal_charDB.cached = Journal_charDB.cached or {}
    local key = dungeon.name .. (version and ("_" .. (version.name or "default")) or "_default")
    if not force and Journal_charDB.cached[key] then
        return
    end
    Journal_charDB.cached[key] = true

    local mod = 0
    if version then
        mod = version.modifier or 0
    end

    for _, id in ipairs(dungeon.items) do
        if type(id) == "number" then
            local itemID = id + mod
            pcall(function() CacheItem(itemID) end)
        end
    end
end



local function ClearSpellFrames()
    -- Clear spell frames from the spell container
    if _G.dungeonDetailFrame and _G.dungeonDetailFrame.bossNav and _G.dungeonDetailFrame.bossNav.spellContainer then
        local spellContainer = _G.dungeonDetailFrame.bossNav.spellContainer

        -- Get all children frames
        local children = { spellContainer:GetChildren() }

        -- Properly clean up each child frame
        for i = 1, #children do
            local child = children[i]
            if child then
                -- Clear all points and scripts first
                child:ClearAllPoints()
                child:SetScript("OnEnter", nil)
                child:SetScript("OnLeave", nil)
                child:EnableMouse(false)

                -- Hide and remove from parent
                child:Hide()
                child:SetParent(nil)

                -- Clear the texture references to prevent memory leaks
                local regions = { child:GetRegions() }
                for j = 1, #regions do
                    local region = regions[j]
                    if region and region.SetTexture then
                        region:SetTexture(nil)
                    end
                end
            end
        end

        -- Clear the container itself
        spellContainer:Hide()
        spellContainer:SetSize(1, 1)
    end

    -- Also clear any orphaned global spell frames by name pattern
    for i = 1, 20 do  -- Assume max 20 spell frames
        local frameName = "DJ_SpellIcon" .. i
        local frame = _G[frameName]
        if frame then
            frame:ClearAllPoints()
            frame:SetScript("OnEnter", nil)
            frame:SetScript("OnLeave", nil)
            frame:EnableMouse(false)
            frame:Hide()
            frame:SetParent(nil)
            _G[frameName] = nil
        end
    end

    -- Hide tooltip if it's still showing
    if GameTooltip:IsShown() then
        GameTooltip:Hide()
    end
end

_G.IsInList                = IsInList
_G.GetCurrentClass         = GetCurrentClass
_G.GetAllArmorTypes        = GetAllArmorTypes
_G.GetAllWeaponTypes       = GetAllWeaponTypes
_G.IsItemEquippableByClass = IsItemEquippableByClass
_G.CacheItem               = CacheItem
_G.PreCacheDungeonVersion  = PreCacheDungeonVersion
_G.ClearSpellFrames        = ClearSpellFrames

function HasItemInfoCached(itemID)
    local itemName, link, quality, _, _, itemType, itemSubType, _, equipLoc

    -- Use GetItemInfoCustom if available, fallback to GetItemInfo
    if _G.GetItemInfoCustom then
        itemName, link, quality, _, _, itemType, itemSubType, _, equipLoc = _G.GetItemInfoCustom(itemID)
    else
        itemName, link, quality, _, _, itemType, itemSubType, _, equipLoc = GetItemInfo(itemID)
    end

    return itemName ~= nil
end

-- ##################################################################
-- # ITEMLOC INTEGRATION UTILITIES
-- ##################################################################

-- Get enhanced item list for a dungeon using ItemLoc data when available
local function GetDynamicDungeonItems(dungeon)
    if not dungeon then
        return {}
    end

    -- Check if ItemLoc integration is enabled in settings
    local useItemLoc = Journal_charDB.useItemLocData
    if useItemLoc == nil then
        useItemLoc = true -- Default to enabled
    end

    -- If ItemLoc is available and enabled, try to get dynamic items
    if useItemLoc and _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
        local dynamicItems = _G.ItemLocAPI:GetDungeonItems(dungeon)
        if dynamicItems and #dynamicItems > 0 then
            --debugPrint("Using dynamic ItemLoc data for", dungeon.name, "- found", #dynamicItems, "items")
            return dynamicItems
        end
    end

    -- Fallback to static item list
    if dungeon.items then
        --debugPrint("Using static item list for", dungeon.name, "- found", #dungeon.items, "items")
        return dungeon.items
    end

    return {}
end

-- Check if an item has known sources in ItemLoc
local function HasItemLocSources(itemID)
    if not _G.ItemLocAPI or not _G.ItemLocAPI:IsLoaded() then
        return false
    end

    local count = _G.ItemLocAPI:GetSourceCount(itemID)
    return count and count > 0
end

-- Get a summary of where an item drops using ItemLoc
local function GetItemLocationSummary(itemID, maxSources)
    if not _G.ItemLocAPI or not _G.ItemLocAPI:IsLoaded() then
        return "ItemLoc not loaded"
    end

    return _G.ItemLocAPI:GetSourceSummary(itemID, maxSources)
end

-- Check if an item drops in the current zone
local function IsItemInCurrentZone(itemID)
    if not _G.ItemLocAPI or not _G.ItemLocAPI:IsLoaded() then
        return false
    end

    return _G.ItemLocAPI:HasSourceInCurrentZone(itemID)
end

-- Export new functions to global namespace
_G.GetDynamicDungeonItems = GetDynamicDungeonItems
_G.HasItemLocSources = HasItemLocSources
_G.GetItemLocationSummary = GetItemLocationSummary
_G.IsItemInCurrentZone = IsItemInCurrentZone
_G.SetTextureColor = SetTextureColor

-- ʕ •ᴥ•ʔ✿ COLOR UTILITY FUNCTIONS ✿ ʕ •ᴥ•ʔ
-- Provides lightweight, muted color accents for spell tooltips. Accents are only applied when the string contains no pre-existing WoW color codes.
local DAMAGE_COLOR_MAP = {
    Arcane   = "A6CAE2", -- light blue
    Fire     = "E8B0A0", -- soft orange
    Frost    = "A0E0E8", -- teal-cy
    Shadow   = "C8A0D8", -- muted purple
    Nature   = "A8D8A0", -- pale green
    Holy     = "FFF2A8", -- soft yellow
    Physical = "D8C8B8", -- beige
    Poison   = "A8C8A0", -- mossy green
}

-- Helper: true if the string already includes a WoW color escape sequence.
local function _HasColorCode(str)
    return str and str:find("|cff", 1, true) ~= nil
end

-- Highlight numeric values (damage, duration, percentages) with a gentle gold tint.
local function _AccentNumbers(text)
    if _HasColorCode(text) then return text end
    return text:gsub("(%d+%%?)", "|cffE5D8A8%1|r")
end

-- Infer dominant damage school from the description, then colorize the spell name accordingly.
local function ColorizeSpellName(name, description)
    if _HasColorCode(name) then return name end
    local lowerDesc = (description or ""):lower()
    local chosenHex
    for school, hex in pairs(DAMAGE_COLOR_MAP) do
        if lowerDesc:find(school:lower()) then
            chosenHex = hex
            break
        end
    end
    if not chosenHex then return name end
    return string.format("|cff%s%s|r", chosenHex, name)
end

-- Public wrapper that safely colorizes a description (numbers only, avoids double-processing).
local function ColorizeDescription(desc)
    return _AccentNumbers(desc)
end

-- Expose to the Journal namespace for easy access by other modules.
_G.Journal                = _G.Journal or {}
_G.Journal.ColorizeSpellName  = ColorizeSpellName
_G.Journal.ColorizeDescription = ColorizeDescription
