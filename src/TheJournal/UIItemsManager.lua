-- ##################################################################
-- # UIItemsManager.lua - Comprehensive Item Management System
-- # ʕ •ᴥ•ʔ✿ Handle all item display and processing ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIItemsManager = {}

-- ʕ •ᴥ•ʔ✿ Cache frequently used functions ✿ʕ•ᴥ•ʔ
local GetTime = GetTime
local GetItemInfo = GetItemInfo
local tonumber = tonumber
local pairs = pairs
local ipairs = ipairs
local table_insert = table.insert
local table_remove = table.remove
local string_match = string.match
local string_find = string.find

-- Ty namira
local function GetBHunterItemEntry()
    return select(1, select(1, select(9, BHunterFrame:GetChildren()):GetChildren()))
end

local function itemEntryEntry()
    local frame = _G["BHunterFrame-Tab2-Item"]
    if frame then
        for i, v in pairs({frame:GetChildren()}) do
            print("Child " .. i .. ": " .. tostring(v))
            print("Type: " .. v:GetObjectType())
        end
    end
    if frame then
        return select(1, frame:GetChildren())
    end
end

local function SetBHunterItemByLink(itemLink)
    if not(BHunterFrame:IsShown()) then return end
    
    local itemEntry = GetBHunterItemEntry()
    if not itemEntry then
        print("|cffFFD700BH Hunter:|r Could not access item slot.")
        return
    end
    
    -- Extract item ID and get item info
    local itemID = CustomExtractItemId(itemLink)
    if not itemID then
        print("|cffFFD700BH Hunter:|r Could not extract item ID from link.")
        return
    end
    
    local itemName, _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(itemID)
    if not itemName or not itemTexture then
        print("|cffFFD700BH Hunter:|r Could not get item info.")
        return
    end
    
    local frame = _G["BHunterFrame-Tab2-ItemIconTexture"]
    if frame then
        -- Set the icon texture
        frame:SetTexture(itemTexture)
    end
    
    local frame = _G["BHunterFrame-Tab2-ItemName"]
	if frame then
		-- Set the item name
		frame:SetText(itemName)
	end

    itemEntry.itemId = itemID
    itemEntry.itemLink = itemLink
    itemEntry.rewardType = "item" 
    itemEntry.hasItem = 1
    itemEntryEntry()
    
    print("|cff00ff00BH Hunter:|r Item set to: " .. itemLink)
end

-- ʕ •ᴥ•ʔ✿ Coordinated Tooltip Positioning (respects TooltipCoordinator) ✿ʕ•ᴥ•ʔ
function UIItemsManager.ForceTooltipPosition(anchorFrame)
    if not anchorFrame or not GameTooltip:IsShown() then return end

    -- ʕ ◕ᴥ◕ ʔ✿ Check if we can control tooltip positioning ✿ʕ ◕ᴥ◕ ʔ
    local TooltipCoordinator = _G.TooltipCoordinator
    if TooltipCoordinator and not TooltipCoordinator.CanControl("UIItemsManager") then
        return -- Another system has higher priority control
    end

    -- ʕ ● ᴥ ●ʔ✿ Request control before repositioning ✿ʕ ● ᴥ ●ʔ
    if TooltipCoordinator then
        TooltipCoordinator.RequestControl("UIItemsManager", 1)
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Create persistent repositioning frame ✿ʕ ◕ᴥ◕ ʔ
    if not _G.DJ_TooltipForcer then
        local forcer = CreateFrame("Frame")
        forcer.anchorFrame = nil
        forcer.isActive = false
        _G.DJ_TooltipForcer = forcer
    end

    local forcer = _G.DJ_TooltipForcer
    forcer.anchorFrame = anchorFrame
    forcer.isActive = true

    -- ʕ ● ᴥ ●ʔ✿ Gentle repositioning function ✿ʕ ● ᴥ ●ʔ
    local function RepositionTooltip()
        if forcer.isActive and forcer.anchorFrame and GameTooltip:IsShown() then
            -- ʕ ◕ᴥ◕ ʔ✿ Don't reposition if another system is controlling ✿ʕ ◕ᴥ◕ ʔ
            if TooltipCoordinator and not TooltipCoordinator.CanControl("UIItemsManager") then
                return
            end
            
            GameTooltip:ClearAllPoints()
            GameTooltip:SetPoint("BOTTOMLEFT", forcer.anchorFrame, "BOTTOMRIGHT", 3, 3)
        end
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Initial positioning ✿ʕ ◕ᴥ◕ ʔ
    RepositionTooltip()

    -- ʕ ● ᴥ ●ʔ✿ Less aggressive repositioning that respects coordination ✿ʕ ● ᴥ ●ʔ
    forcer:SetScript("OnUpdate", function(self, elapsed)
        self.elapsed = (self.elapsed or 0) + elapsed
        if self.elapsed >= 0.1 then -- Check every 100ms (less frequent)
            self.elapsed = 0
            if self.isActive and self.anchorFrame and GameTooltip:IsShown() then
                -- ʕ ◕ᴥ◕ ʔ✿ Only reposition if we still have control ✿ʕ ◕ᴥ◕ ʔ
                if TooltipCoordinator and not TooltipCoordinator.CanControl("UIItemsManager") then
                    return -- Another system has control now
                end
                
                -- ʕ ● ᴥ ●ʔ✿ Force position if it's been moved ✿ʕ ● ᴥ ●ʔ
                local point, relativeTo, relativePoint, xOfs, yOfs = GameTooltip:GetPoint(1)
                if not (point == "BOTTOMLEFT" and relativeTo == self.anchorFrame and relativePoint == "BOTTOMRIGHT" and xOfs == 3 and yOfs == 3) then
                    RepositionTooltip()
                end
            else
                -- ʕ ● ᴥ ●ʔ✿ Stop forcing when conditions not met ✿ʕ ● ᴥ ●ʔ
                self.isActive = false
                self:SetScript("OnUpdate", nil)
            end
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Item Button Management ✿ʕ•ᴥ•ʔ
function UIItemsManager.AcquireItemButton(dIndex, iIndex)
    local btn = GetItemButton()

    -- ʕ •ᴥ•ʔ✿ Get the items list container from global scope ✿ʕ•ᴥ•ʔ
    local itemsListContainer = _G.ItemsListContainer or _G["ItemsListContainer"]
    if itemsListContainer then
        btn:SetParent(itemsListContainer)
    else
        -- Fallback to UIParent if container not found
        btn:SetParent(UIParent)
        -- ʕ •ᴥ•ʔ✿ ItemsListContainer not found, using UIParent as fallback silently ✿ʕ •ᴥ•ʔ
    end

    btn:SetSize(180, 40)

    -- ʕ •ᴥ•ʔ✿ Ensure button appears above all other UI elements ✿ʕ•ᴥ•ʔ
    btn:SetFrameStrata("FULLSCREEN_DIALOG")
    btn:SetFrameLevel(200) -- Very high level to ensure visibility

    -- Store the button in our index-based cache for easy retrieval
    _G.itemButtonCache[dIndex] = _G.itemButtonCache[dIndex] or {}
    _G.itemButtonCache[dIndex][iIndex] = btn

    -- Reuse existing elements from the pooled button, just adjust their properties
    -- The pooled button already has: icon, text, count
    -- We need to adapt them to this button's specific layout

    -- Use the existing icon as iconTex
    btn.iconTex = btn.icon
    btn.iconTex:SetSize(30, 30)
    btn.iconTex:ClearAllPoints()
    btn.iconTex:SetPoint("LEFT", btn, "LEFT", 2, 5)

    -- Use the existing text as itemText
    btn.itemText = btn.text
    btn.itemText:ClearAllPoints()
    btn.itemText:SetPoint("TOPLEFT", btn.iconTex, "TOPRIGHT", 4, 0)
    btn.itemText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    btn.itemText:SetJustifyH("LEFT")

    -- Create dropLocationText if it doesn't exist (this is specific to this button type)
    if not btn.dropLocationText then
        btn.dropLocationText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    end
    btn.dropLocationText:ClearAllPoints()
    btn.dropLocationText:SetPoint("TOPLEFT", btn.itemText, "BOTTOMLEFT", 0, -2)
    btn.dropLocationText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    btn.dropLocationText:SetJustifyH("LEFT")

    -- Create favoriteIcon if it doesn't exist (this is specific to this button type)
    if not btn.favoriteIcon then
        btn.favoriteIcon = btn:CreateTexture(nil, "OVERLAY")
        btn.favoriteIcon:SetSize(24, 24)
        btn.favoriteIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    end
    btn.favoriteIcon:ClearAllPoints()
    btn.favoriteIcon:SetPoint("TOPLEFT", btn.iconTex, "TOPLEFT", -8, 8)
    btn.favoriteIcon:Hide()

    btn:RegisterForClicks("LeftButtonUp")
    btn:SetScript("OnEnter", function(self)
        if self.itemLink then
            -- ʕ •ᴥ•ʔ✿ Always use regular GameTooltip for full addon support ✿ʕ•ᴥ•ʔ
            GameTooltip_SetDefaultAnchor(GameTooltip, self)
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:Show()

            -- ʕ ◕ᴥ◕ ʔ✿ Force aggressive repositioning if quest icon is visible ✿ʕ ◕ᴥ◕ ʔ
            local randomQuestIcon = _G.randomQuestIcon or _G.DJ_RandomQuestIcon or _G["DJ_RandomQuestIcon"]
            if randomQuestIcon and randomQuestIcon:IsShown() then
                UIItemsManager.ForceTooltipPosition(randomQuestIcon)
            end
        end
    end)
    btn:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
        -- ʕ •ᴥ•ʔ✿ Stop coordinated tooltip repositioning ✿ʕ•ᴥ•ʔ
        if _G.DJ_TooltipForcer then
            _G.DJ_TooltipForcer.isActive = false
            _G.DJ_TooltipForcer:SetScript("OnUpdate", nil)
        end
        
        -- ʕ ◕ᴥ◕ ʔ✿ Release tooltip control ✿ʕ ◕ᴥ◕ ʔ
        local TooltipCoordinator = _G.TooltipCoordinator
        if TooltipCoordinator then
            TooltipCoordinator.ReleaseControl("UIItemsManager")
        end
    end)

    btn:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            SetBHunterItemByLink(self.itemLink)
            ChatEdit_InsertLink(self.itemLink)
        elseif button == "LeftButton" and IsAltKeyDown() and self.baseItemID then
            OpenLootDb(self.baseItemID)
        elseif button == "LeftButton" and IsControlKeyDown() then
            local base = self.baseItemID

            -- .coerce ItemLink
            SendChatMessage(".coe ".. self.itemLink, "SAY")
            
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

    return btn
end

function UIItemsManager.HideAllItemButtons()
    for dIdx, itemTbl in pairs(_G.itemButtonCache) do
        for iIdx, btn in pairs(itemTbl) do
            ReleaseItemButton(btn)
            itemTbl[iIdx] = nil  -- Remove from cache
        end
    end
    -- Clear the cache completely
    _G.itemButtonCache = {}
end

-- ʕ •ᴥ•ʔ✿ Item Filtering Logic ✿ʕ•ᴥ•ʔ
function UIItemsManager.PassesFilterIcon(iType, iSubType, eLoc, filterIcon)
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

-- Function to get items from dungeon based on difficulty filter
local function GetItemsForDifficulty(dungeon, difficultyFilter)
    local allItems = {}

    if difficultyFilter == "all" then
        -- Collect from all difficulty arrays
        if dungeon.items then
            for _, itemID in ipairs(dungeon.items) do
                table.insert(allItems, itemID)
            end
        end
        if dungeon.items_hc then
            for _, itemID in ipairs(dungeon.items_hc) do
                table.insert(allItems, itemID)
            end
        end
        if dungeon.items_my then
            for _, itemID in ipairs(dungeon.items_my) do
                table.insert(allItems, itemID)
            end
        end
        if dungeon.items_10n then
            for _, itemID in ipairs(dungeon.items_10n) do
                table.insert(allItems, itemID)
            end
        end
        if dungeon.items_10h then
            for _, itemID in ipairs(dungeon.items_10h) do
                table.insert(allItems, itemID)
            end
        end
        if dungeon.items_25n then
            for _, itemID in ipairs(dungeon.items_25n) do
                table.insert(allItems, itemID)
            end
        end
        if dungeon.items_25h then
            for _, itemID in ipairs(dungeon.items_25h) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "normal" then
        if dungeon.items then
            for _, itemID in ipairs(dungeon.items) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "heroic" then
        if dungeon.items_hc then
            for _, itemID in ipairs(dungeon.items_hc) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "mythic" then
        if dungeon.items_my then
            for _, itemID in ipairs(dungeon.items_my) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "10n" then
        if dungeon.items_10n then
            for _, itemID in ipairs(dungeon.items_10n) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "10h" then
        if dungeon.items_10h then
            for _, itemID in ipairs(dungeon.items_10h) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "25n" then
        if dungeon.items_25n then
            for _, itemID in ipairs(dungeon.items_25n) do
                table.insert(allItems, itemID)
            end
        end
    elseif difficultyFilter == "25h" then
        if dungeon.items_25h then
            for _, itemID in ipairs(dungeon.items_25h) do
                table.insert(allItems, itemID)
            end
        end
    end

    return allItems
end

-- ʕ •ᴥ•ʔ✿ Items Preparation System ✿ʕ•ᴥ•ʔ
function UIItemsManager.PrepareItemsToShow(dungeon, GetCacheKey, preparedItemsCache, GetCachedAttunement, SetCachedAttunement, GetCachedForge, SetCachedForge, GetCachedDropRate, CleanupItemsCache)
    if not dungeon then return {} end

    local cacheKey = GetCacheKey(dungeon)

    if cacheKey and preparedItemsCache[cacheKey] then
        return preparedItemsCache[cacheKey]
    end

    local difficultyFilter = Journal_charDB.itemFilters and Journal_charDB.itemFilters.difficultyFilter or "all"
    local itemsToShow = {}

    -- Get items based on difficulty filter
    local dungeonItems = GetItemsForDifficulty(dungeon, difficultyFilter)

    -- First pass: Convert item IDs to item info objects
    for _, itemID in ipairs(dungeonItems) do
        local itemLink = "item:" .. itemID
        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc

        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfo(itemID)
        if not iName then iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfoCustom(itemID) end
        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfoCustom(itemID)

        local info = {
            baseID = itemID,
            itemLink = itemLink,
            isSpecial = false,
            index = #itemsToShow + 1
        }

        local shouldAdd = true

        -- Get attunement filter
        local filterIcon = DJ_Settings.filterType or "All"

        if filterIcon == "Attunable" then
            -- Show items that can be attuned and have progress < 100%
            -- ʕ •ᴥ•ʔ✿ Always check current status, never use cache for filters ✿ʕ •ᴥ•ʔ
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            shouldAdd = (canAttune == 1) and (attuneProgress < 100)
        elseif filterIcon == "Attuned" then
            -- Show only fully attuned items - use item ID-based function
            -- ʕ •ᴥ•ʔ✿ Always check current status, never use cache for filters ✿ʕ •ᴥ•ʔ
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            shouldAdd = (attuneProgress >= 100)
        end

        if shouldAdd then
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
                progress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(item.baseID) or 0

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
            end

            -- Get drop rate for all items to enable proper sorting across all groups
            dropRate = GetCachedDropRate(item.baseID, dungeonName)





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

    -- Sort items: special items first, then favorites, then by attunement status, then by droprates highest to lowest
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

        -- Within the same group, apply specific secondary sorting
        if aGroup == 1 then
            -- Both attuned: sort by forge level (higher forge level first)
            local aForge = a.cachedForge
            local bForge = b.cachedForge

            if aForge ~= bForge then
                return aForge > bForge -- Higher forge level first (3=Lightforged, 2=Warforged, 1=Titanforged, 0=Normal)
            end
        elseif aGroup == 3 then
            -- Both in progress: sort by progress percentage (higher progress first)
            if a.cachedProgress ~= b.cachedProgress then
                return a.cachedProgress > b.cachedProgress
            end
        end

        -- Final sort criteria: by drop rate (highest to lowest) across all groups
        local aDropRate = a.cachedDropRate or 0
        local bDropRate = b.cachedDropRate or 0



        if aDropRate ~= bDropRate then
            return aDropRate > bDropRate -- Higher drop rate first
        end

        -- Finally by index as last resort
        return a.index < b.index
    end)

    -- Cache the results
    if cacheKey then
        preparedItemsCache[cacheKey] = itemsToShow
        CleanupItemsCache()
    end

    return itemsToShow
end

-- ʕ •ᴥ•ʔ✿ Current Filter Information ✿ʕ•ᴥ•ʔ
function UIItemsManager.GetCurrentFilterInfo()
    local filterInfo = {}

    -- Get attunement filter
    local filterIcon = DJ_Settings.filterType or "All"
    if filterIcon == "Attunable" then
        table.insert(filterInfo, "|cFFFFFF00Attunable|r")
    elseif filterIcon == "Attuned" then
        table.insert(filterInfo, "|cFF00FF00Attuned|r")
    end

    -- Get difficulty filter
    local difficultyFilter = Journal_charDB.itemFilters and Journal_charDB.itemFilters.difficultyFilter or "all"
    if difficultyFilter == "normal" then
        table.insert(filterInfo, "|cFF87CEEBNormal|r")
    elseif difficultyFilter == "heroic" then
        table.insert(filterInfo, "|cFFFF6600Heroic|r")
    elseif difficultyFilter == "mythic" then
        table.insert(filterInfo, "|cFFFF6600Mythic|r")
    elseif difficultyFilter == "10n" then
        table.insert(filterInfo, "|cFF9966CC10N|r")
    elseif difficultyFilter == "10h" then
        table.insert(filterInfo, "|cFF9966CC10H|r")
    elseif difficultyFilter == "25n" then
        table.insert(filterInfo, "|cFFFFB34725N|r")
    elseif difficultyFilter == "25h" then
        table.insert(filterInfo, "|cFFFFB34725H|r")
    end

    -- Get source count filter
    local maxSources = Journal_charDB.itemFilters and Journal_charDB.itemFilters.maxSources or 0
    if maxSources == 1 then
        table.insert(filterInfo, "|cFF87CEEB1 Source|r")
    elseif maxSources == 999 then
        table.insert(filterInfo, "|cFF87CEEB>1 Source|r")
    end

    return table.concat(filterInfo, " • ")
end

-- ʕ •ᴥ•ʔ✿ Update Dungeon Title ✿ʕ•ᴥ•ʔ
function UIItemsManager.UpdateDungeonTitleWithFilters(dungeon, dungeonTitleText)
    if not dungeon or not dungeonTitleText then return end

    local baseName = dungeon.name or "Unknown Dungeon"
    local filterInfo = UIItemsManager.GetCurrentFilterInfo()

    if filterInfo and filterInfo ~= "" then
        dungeonTitleText:SetText(baseName .. " |cFF888888(" .. filterInfo .. ")|r")
    else
        dungeonTitleText:SetText(baseName)
    end
end

-- ʕ •ᴥ•ʔ✿ Make functions accessible ✿ʕ•ᴥ•ʔ
UIItemsManager.GetItemsForDifficulty = GetItemsForDifficulty

-- ʕ •ᴥ•ʔ✿ Make globally accessible ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIItemsManager = UIItemsManager
