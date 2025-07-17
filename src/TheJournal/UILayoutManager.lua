-- ##################################################################
-- # UILayoutManager.lua - UI Layout and Filter Management
-- # ʕ •ᴥ•ʔ✿ Specialized UI Component Management ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UILayoutManager = {}

-- ʕ •ᴥ•ʔ✿ Cache frequently used functions ✿ʕ•ᴥ•ʔ
local GetTime = GetTime

-- ʕ •ᴥ•ʔ✿ Filter Type Management ✿ʕ•ᴥ•ʔ
function UILayoutManager.UpdateFilterTooltipText(button)
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == button then
        GameTooltip:ClearLines()
        GameTooltip:SetPoint("BOTTOM", button, "TOP", 0, 0)
        GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
        GameTooltip:Show()
    end
end

-- ʕ •ᴥ•ʔ✿ Source Count Filter Options ✿ʕ•ᴥ•ʔ
local sourceCountOptions = {
    { state = 0, text = "All Items", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllSources.blp" },
    { state = 1, text = "1 Source", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\1Source.blp" },
    { state = 999, text = ">1 Source", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\MoreThan1Source.blp" }
}

local currentSourceIndex = 1

function UILayoutManager.InitializeSourceFilter()
    -- Find current index based on saved setting
    if Journal_charDB.itemFilters.maxSources == 1 then
        currentSourceIndex = 2
    elseif Journal_charDB.itemFilters.maxSources == 999 then
        currentSourceIndex = 3
    else
        currentSourceIndex = 1
    end
end

function UILayoutManager.UpdateSourceCountButton(button)
    local opt = sourceCountOptions[currentSourceIndex]
    button:SetNormalTexture(opt.icon)
    local tex = button:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    Journal_charDB.itemFilters.maxSources = opt.state
end

function UILayoutManager.OnSourceCountClick(button, InvalidateItemsCache, LoadDungeonDetail)
    -- Store tooltip state before making changes
    local tooltipWasShown = GameTooltip:IsShown() and GameTooltip:GetOwner() == button

    currentSourceIndex = currentSourceIndex + 1
    if currentSourceIndex > #sourceCountOptions then
        currentSourceIndex = 1
    end
    UILayoutManager.UpdateSourceCountButton(button)

    -- Invalidate cache when filter changes
    InvalidateItemsCache()

    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end

    -- Restore tooltip if it was shown before the click
    if tooltipWasShown then
        local opt = sourceCountOptions[currentSourceIndex]
        GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        GameTooltip:SetText("|cFF87CEEB" .. "Source Count Filter: " .. opt.text .. "|r")
        GameTooltip:AddLine("All Items: Show all items", 1, 1, 1)
        GameTooltip:AddLine("1 Source: Show items with only 1 drop source", 1, 1, 1)
        GameTooltip:AddLine(">1 Source: Show items with multiple sources", 1, 1, 1)
        GameTooltip:Show()
    end
end

function UILayoutManager.OnSourceCountEnter(button)
    local opt = sourceCountOptions[currentSourceIndex]
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFF87CEEB" .. "Source Count Filter: " .. opt.text .. "|r")
    GameTooltip:AddLine("All Items: Show all items", 1, 1, 1)
    GameTooltip:AddLine("1 Source: Show items with only 1 drop source", 1, 1, 1)
    GameTooltip:AddLine(">1 Source: Show items with multiple sources", 1, 1, 1)
    GameTooltip:Show()
end

-- ʕ •ᴥ•ʔ✿ Difficulty Filter Options - Dynamic based on expansion and counts ✿ʕ•ᴥ•ʔ
local function GetDifficultyFilterOptions()
    -- Count dungeons per difficulty type for current category filter
    local selectedCategory = _G.Journal_charDB and _G.Journal_charDB.selectedCategory or "All"
    local counts = {
        all = 0,
        zones = 0,
        normal = 0,
        heroic = 0,
        mythic = 0,
        raids = 0,
        ["10n"] = 0,
        ["10h"] = 0,
        ["25n"] = 0,
        ["25h"] = 0
    }

    -- Count available dungeons per difficulty type for selected category
    if _G.dungeonButtons and #_G.dungeonButtons > 0 then
        for _, btn in ipairs(_G.dungeonButtons) do
            if btn.dungeon then
                -- Apply category filter
                local dCategory = btn.dungeon.category or "CLASSIC"
                local matchesCategory = (selectedCategory == "All" or dCategory == selectedCategory)

                if matchesCategory then
                    counts.all = counts.all + 1

                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "zones") then
                        counts.zones = counts.zones + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "normal") then
                        counts.normal = counts.normal + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "heroic") then
                        counts.heroic = counts.heroic + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "mythic") then
                        counts.mythic = counts.mythic + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "raids") then
                        counts.raids = counts.raids + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "10n") then
                        counts["10n"] = counts["10n"] + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "10h") then
                        counts["10h"] = counts["10h"] + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "25n") then
                        counts["25n"] = counts["25n"] + 1
                    end
                    if _G.DungeonHasDifficulty and _G.DungeonHasDifficulty(btn.dungeon, "25h") then
                        counts["25h"] = counts["25h"] + 1
                    end
                end
            end
        end
    end

    -- Build options list, only including difficulties with dungeons
    local options = {}

    -- Always include "All" if there are any dungeons
    if counts.all > 0 then
        table.insert(options, { state = "all", text = "All (" .. counts.all .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_01" })
    end

    -- Only include options that have dungeons
    if counts.zones > 0 then
        table.insert(options, { state = "zones", text = "Zones (" .. counts.zones .. ")", icon = "Interface\\Icons\\INV_Misc_Map_01" })
    end
    if counts.normal > 0 then
        table.insert(options, { state = "normal", text = "Normal Dungeons (" .. counts.normal .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Sapphire_01" })
    end
    if counts.heroic > 0 then
        table.insert(options, { state = "heroic", text = "Heroic Dungeons (" .. counts.heroic .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Ruby_01" })
    end
    if counts.mythic > 0 then
        table.insert(options, { state = "mythic", text = "Mythic Dungeons (" .. counts.mythic .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Emerald_01" })
    end
    if counts.raids > 0 then
        table.insert(options, { state = "raids", text = "Raids (" .. counts.raids .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Topaz_01" })
    end
    if counts["10n"] > 0 then
        table.insert(options, { state = "10n", text = "10-Man Normal (" .. counts["10n"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_01" })
    end
    if counts["10h"] > 0 then
        table.insert(options, { state = "10h", text = "10-Man Heroic (" .. counts["10h"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_02" })
    end
    if counts["25n"] > 0 then
        table.insert(options, { state = "25n", text = "25-Man Normal (" .. counts["25n"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Pearl_01" })
    end
    if counts["25h"] > 0 then
        table.insert(options, { state = "25h", text = "25-Man Heroic (" .. counts["25h"] .. ")", icon = "Interface\\Icons\\INV_Misc_Gem_Pearl_02" })
    end

    -- Fallback: if no options available, provide at least "All"
    if #options == 0 then
        options = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
    end

    return options
end

-- ʕ •ᴥ•ʔ✿ Static Difficulty Filter Options for DungeonDetail context ✿ʕ•ᴥ•ʔ
local staticDifficultyFilterOptions = {
    { state = "all", text = "All Difficulties", icon = "Interface\\Icons\\INV_Misc_Gem_01" },
    { state = "normal", text = "Normal", icon = "Interface\\Icons\\INV_Misc_Gem_Sapphire_01" },
    { state = "heroic", text = "Heroic", icon = "Interface\\Icons\\INV_Misc_Gem_Ruby_01" },
    { state = "mythic", text = "Mythic", icon = "Interface\\Icons\\INV_Misc_Gem_Emerald_01" },
    { state = "10n", text = "10-Man Normal", icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_01" },
    { state = "10h", text = "10-Man Heroic", icon = "Interface\\Icons\\INV_Misc_Gem_Amethyst_02" },
    { state = "25n", text = "25-Man Normal", icon = "Interface\\Icons\\INV_Misc_Gem_Topaz_01" },
    { state = "25h", text = "25-Man Heroic", icon = "Interface\\Icons\\INV_Misc_Gem_Topaz_02" }
}

-- ʕ •ᴥ•ʔ✿ Context-aware difficulty options selector ✿ʕ•ᴥ•ʔ
local function GetContextAwareDifficultyOptions()
    -- ʕ •ᴥ•ʔ✿ DEBUG: Show context detection ✿ʕ•ᴥ•ʔ
    print("DEBUG: GetContextAwareDifficultyOptions called")
    print("DEBUG: _G.currentDungeon exists:", _G.currentDungeon ~= nil)
    if _G.currentDungeon then
        print("DEBUG: Current dungeon:", _G.currentDungeon.name or "unknown")
    end

    -- If we're viewing a specific dungeon (DungeonDetail context), use filtered static options
    if _G.currentDungeon then
        local filteredOptions = {}

        -- Always include "All" as first option
        table.insert(filteredOptions, staticDifficultyFilterOptions[1]) -- "all"

        -- Get available difficulties for current dungeon
        if _G.GetAvailableDifficulties then
            local availableDifficulties = _G.GetAvailableDifficulties(_G.currentDungeon)
            print("DEBUG: Available difficulties for " .. (_G.currentDungeon.name or "unknown") .. ":", table.concat(availableDifficulties, ", "))

            -- Add only difficulties that are available for this dungeon
            for _, difficulty in ipairs(availableDifficulties) do
                for _, staticOption in ipairs(staticDifficultyFilterOptions) do
                    if staticOption.state == difficulty and staticOption.state ~= "all" then
                        table.insert(filteredOptions, staticOption)
                        break
                    end
                end
            end
        else
            -- Fallback: use all static options if GetAvailableDifficulties not available
            filteredOptions = staticDifficultyFilterOptions
        end

        print("DEBUG: Using filtered difficulty options, count:", #filteredOptions)
        return filteredOptions
    else
        -- If we're in grid preview, use dynamic options
        local dynamicOptions = GetDifficultyFilterOptions()
        print("DEBUG: Using dynamic difficulty options, count:", #dynamicOptions)
        return dynamicOptions
    end
end

local difficultyFilterOptions = {{ state = "all", text = "All", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}

local currentDifficultyIndex = 1

function UILayoutManager.InitializeDifficultyFilter()
    -- Refresh options first
    difficultyFilterOptions = GetContextAwareDifficultyOptions()

    -- Find current index based on saved setting - support old mythicFilter migration
    local currentFilter = "all"
    if Journal_charDB.itemFilters then
        -- Migration from old mythicFilter
        if Journal_charDB.itemFilters.mythicFilter then
            if Journal_charDB.itemFilters.mythicFilter == "mythic" then
                currentFilter = "mythic"
            elseif Journal_charDB.itemFilters.mythicFilter == "nonmythic" then
                currentFilter = "normal"
            else
                currentFilter = "all"
            end
            Journal_charDB.itemFilters.difficultyFilter = currentFilter
            Journal_charDB.itemFilters.mythicFilter = nil -- Remove old setting
        else
            currentFilter = Journal_charDB.itemFilters.difficultyFilter or "all"
        end
    end

    -- Find index for current filter
    currentDifficultyIndex = 1 -- Default to first option
    for i, option in ipairs(difficultyFilterOptions) do
        if option.state == currentFilter then
            currentDifficultyIndex = i
            break
        end
    end

    -- Bounds check
    if currentDifficultyIndex > #difficultyFilterOptions or currentDifficultyIndex < 1 then
        currentDifficultyIndex = 1
    end
end

-- Legacy function name for compatibility
function UILayoutManager.InitializeMythicFilter()
    UILayoutManager.InitializeDifficultyFilter()
end

function UILayoutManager.UpdateDifficultyFilterButton(button)
    -- Refresh options first
    difficultyFilterOptions = GetContextAwareDifficultyOptions()

    -- Safety check for empty options
    if #difficultyFilterOptions == 0 then
        difficultyFilterOptions = {{ state = "all", text = "All (0)", icon = "Interface\\Icons\\INV_Misc_Gem_01" }}
        currentDifficultyIndex = 1
    else
        -- ʕ •ᴥ•ʔ✿ Only preserve filter choice when initializing, not when actively clicking ✿ʕ•ᴥ•ʔ
        -- Simple bounds check without overriding user's active selection
        if currentDifficultyIndex > #difficultyFilterOptions or currentDifficultyIndex < 1 then
            -- Try to find saved filter first, then fall back to index 1
            local savedFilter = Journal_charDB.itemFilters and Journal_charDB.itemFilters.difficultyFilter or "all"
            local foundIndex = nil

            for i, option in ipairs(difficultyFilterOptions) do
                if option.state == savedFilter then
                    foundIndex = i
                    break
                end
            end

            currentDifficultyIndex = foundIndex or 1
        end
    end

    local opt = difficultyFilterOptions[currentDifficultyIndex]

    -- ʕ •ᴥ•ʔ✿ DEBUG: Verify texture update ✿ʕ•ᴥ•ʔ
    print("DEBUG: UpdateDifficultyFilterButton - Setting texture to:", opt.icon)
    print("DEBUG: UpdateDifficultyFilterButton - Filter text:", opt.text)

    button:SetNormalTexture(opt.icon)
    local tex = button:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
        print("DEBUG: UpdateDifficultyFilterButton - Texture set successfully")
    else
        print("DEBUG: UpdateDifficultyFilterButton - WARNING: Could not get texture")
    end
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")

    -- Initialize itemFilters if needed
    if not Journal_charDB.itemFilters then
        Journal_charDB.itemFilters = {}
    end
    -- Only update DB if it doesn't already match (avoid redundant saves)
    if Journal_charDB.itemFilters.difficultyFilter ~= opt.state then
        Journal_charDB.itemFilters.difficultyFilter = opt.state
        print("DEBUG: UpdateDifficultyFilterButton - Updated DB filter to:", opt.state)
    else
        print("DEBUG: UpdateDifficultyFilterButton - DB filter already correct:", opt.state)
    end
end

-- Legacy function name for compatibility
function UILayoutManager.UpdateMythicFilterButton(button)
    UILayoutManager.UpdateDifficultyFilterButton(button)
end

function UILayoutManager.OnDifficultyFilterClick(button, InvalidateItemsCache, LoadDungeonDetail)
    -- ʕ •ᴥ•ʔ✿ DEBUG: Verify click handler is called ✿ʕ•ᴥ•ʔ
    print("DEBUG: OnDifficultyFilterClick called")

    -- Store tooltip state before making changes
    local tooltipWasShown = GameTooltip:IsShown() and GameTooltip:GetOwner() == button

    -- Refresh difficulty options in case dungeons have changed
    difficultyFilterOptions = GetContextAwareDifficultyOptions()

    -- ʕ •ᴥ•ʔ✿ DEBUG: Show current options ✿ʕ•ᴥ•ʔ
    print("DEBUG: Current options count:", #difficultyFilterOptions)
    print("DEBUG: Current index:", currentDifficultyIndex)
    if difficultyFilterOptions[currentDifficultyIndex] then
        print("DEBUG: Current filter:", difficultyFilterOptions[currentDifficultyIndex].state)
    end

    -- Safety check for current index
    if currentDifficultyIndex > #difficultyFilterOptions or currentDifficultyIndex < 1 then
        currentDifficultyIndex = 1
    end

    -- ʕ •ᴥ•ʔ✿ Different logic for DungeonDetail vs Grid context ✿ʕ•ᴥ•ʔ
    if _G.currentDungeon then
        -- ʕ •ᴥ•ʔ✿ DungeonDetail context: Simple cycling through all options ✿ʕ•ᴥ•ʔ
        print("DEBUG: DungeonDetail context - cycling from", currentDifficultyIndex)
        currentDifficultyIndex = currentDifficultyIndex + 1
        if currentDifficultyIndex > #difficultyFilterOptions then
            currentDifficultyIndex = 1
        end
        print("DEBUG: New index after cycling:", currentDifficultyIndex)
    else
        -- ʕ •ᴥ•ʔ✿ Grid context: Smart filtering for available difficulties ✿ʕ•ᴥ•ʔ
        local availableDifficulties = {}
        for _, opt in ipairs(difficultyFilterOptions) do
            table.insert(availableDifficulties, opt.state)
        end

        -- Find next available difficulty
        local currentState = difficultyFilterOptions[currentDifficultyIndex].state
        local nextIndex = nil

        for i = 1, #availableDifficulties do
            if availableDifficulties[i] == currentState then
                local nextDifficulty = availableDifficulties[i + 1] or availableDifficulties[1]
                for j, opt in ipairs(difficultyFilterOptions) do
                    if opt.state == nextDifficulty then
                        nextIndex = j
                        break
                    end
                end
                break
            end
        end

        if nextIndex then
            currentDifficultyIndex = nextIndex
        else
            -- Fallback to normal cycling
            currentDifficultyIndex = currentDifficultyIndex + 1
            if currentDifficultyIndex > #difficultyFilterOptions then
                currentDifficultyIndex = 1
            end
        end
    end

    -- Final safety check
    if currentDifficultyIndex > #difficultyFilterOptions or currentDifficultyIndex < 1 then
        currentDifficultyIndex = 1
    end

    -- ʕ •ᴥ•ʔ✿ DEBUG: Show final state ✿ʕ•ᴥ•ʔ
    print("DEBUG: Final index:", currentDifficultyIndex)
    if difficultyFilterOptions[currentDifficultyIndex] then
        print("DEBUG: Final filter:", difficultyFilterOptions[currentDifficultyIndex].state)
    end

    -- ʕ •ᴥ•ʔ✿ Save filter to database BEFORE updating button ✿ʕ•ᴥ•ʔ
    if not Journal_charDB.itemFilters then
        Journal_charDB.itemFilters = {}
    end
    Journal_charDB.itemFilters.difficultyFilter = difficultyFilterOptions[currentDifficultyIndex].state
    print("DEBUG: Saved new filter to DB before button update:", difficultyFilterOptions[currentDifficultyIndex].state)

    UILayoutManager.UpdateDifficultyFilterButton(button)

    -- Invalidate cache when filter changes
    InvalidateItemsCache()

    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end

    -- Restore tooltip if it was shown before the click
    if tooltipWasShown then
        -- Use a timer to ensure tooltip shows correctly after changes
        if C_Timer and C_Timer.After then
            C_Timer.After(0.05, function()
                UILayoutManager.ShowDifficultyFilterTooltip(button)
            end)
        else
            UILayoutManager.ShowDifficultyFilterTooltip(button)
        end
    end
end

-- Legacy function name for compatibility
function UILayoutManager.OnMythicFilterClick(button, InvalidateItemsCache, LoadDungeonDetail)
    -- ʕ •ᴥ•ʔ✿ DEBUG: Verify legacy function is called ✿ʕ•ᴥ•ʔ
    print("DEBUG: OnMythicFilterClick called (legacy wrapper)")
    UILayoutManager.OnDifficultyFilterClick(button, InvalidateItemsCache, LoadDungeonDetail)
end

function UILayoutManager.ShowDifficultyFilterTooltip(button)
    local opt = difficultyFilterOptions[currentDifficultyIndex]
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    GameTooltip:SetText("|cFFFF6600" .. "Difficulty Filter: " .. opt.text .. "|r")

    -- ʕ •ᴥ•ʔ✿ Show available difficulties for current dungeon ✿ʕ•ᴥ•ʔ
    if _G.currentDungeon and _G.GetAvailableDifficulties then
        local availableDifficulties = _G.GetAvailableDifficulties(_G.currentDungeon)
        if #availableDifficulties > 1 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFF87CEEB" .. _G.currentDungeon.name .. " Available Difficulties:|r")
            for _, diff in ipairs(availableDifficulties) do
                for _, filterOpt in ipairs(difficultyFilterOptions) do
                    if filterOpt.state == diff then
                        local color = (diff == opt.state) and "|cFF00FF00" or "|cFFFFFFFF"
                        GameTooltip:AddLine(color .. "• " .. filterOpt.text .. "|r")
                        break
                    end
                end
            end
        else
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFF888888This dungeon only has one difficulty|r")
        end
    else
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Click to cycle through difficulty filters", 1, 1, 1)
    end

    GameTooltip:Show()
end

function UILayoutManager.OnDifficultyFilterEnter(button)
    UILayoutManager.ShowDifficultyFilterTooltip(button)
end

-- Legacy function name for compatibility
function UILayoutManager.OnMythicFilterEnter(button)
    UILayoutManager.OnDifficultyFilterEnter(button)
end

-- ʕ •ᴥ•ʔ✿ UI Show/Hide Management ✿ʕ•ᴥ•ʔ
function UILayoutManager.HideDungeonInteriorUI(filterTypeButton, sourceCountButton, mythicFilterButton, itemSearchBox)
    filterTypeButton:Hide()
    sourceCountButton:Hide()
    mythicFilterButton:Hide()
    itemSearchBox:Hide()
end

function UILayoutManager.ShowDungeonInteriorUI(filterTypeButton, sourceCountButton, mythicFilterButton, itemSearchBox)
    filterTypeButton:Show()
    sourceCountButton:Show()
    mythicFilterButton:Show()
    itemSearchBox:Show()
end

-- ʕ •ᴥ•ʔ✿ Page Navigation Management ✿ʕ•ᴥ•ʔ
function UILayoutManager.UpdatePage(offset, totalPages, MAX_ITEMS_PER_PAGE, currentDungeon, preparedItemsCache, GetCacheKey, DisplayItemsList, LoadDungeonDetail)
    -- Only update if we have valid pages
    if totalPages <= 1 then
        return
    end

    Journal_charDB.currentItemPage = Journal_charDB.currentItemPage + offset

    -- Wrap around pages
    if Journal_charDB.currentItemPage < 1 then
        Journal_charDB.currentItemPage = totalPages
    elseif Journal_charDB.currentItemPage > totalPages then
        Journal_charDB.currentItemPage = 1
    end

    -- Only update the display instead of reloading everything
    if currentDungeon then
        -- Use cached items to avoid re-sorting
        local cacheKey = GetCacheKey(currentDungeon)
        local cachedItems = cacheKey and preparedItemsCache[cacheKey]

        if cachedItems then
            -- Update display with cached items (much faster)
            DisplayItemsList(currentDungeon, nil, cachedItems)
        else
            -- Fall back to full reload if cache is empty - mark as pagination to prevent friends update
            LoadDungeonDetail(currentDungeon, true)
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Scrollbar Styling ✿ʕ•ᴥ•ʔ
function UILayoutManager.StyleScrollbar(scrollFrame)
    local scrollBar = _G[scrollFrame:GetName() .. "ScrollBar"]
    if scrollBar then
        scrollBar:SetWidth(8)
        scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -70, 0)
        scrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -70, 0)

        -- Create custom white 8x8 texture for the scrollbar track (WotLK 3.3.5a compatible)
        local trackTexture = scrollBar:CreateTexture(nil, "BACKGROUND")
        trackTexture:SetAllPoints(scrollBar)
        trackTexture:SetTexture("Interface\\Buttons\\WHITE8X8") -- Use built-in white texture
        trackTexture:SetVertexColor(1, 1, 1, 0.3) -- White with 30% opacity

        -- Style the thumb (draggable part) with red color
        local thumb = _G[scrollFrame:GetName() .. "ScrollBarThumbTexture"]
        if thumb then
            thumb:SetTexture("Interface\\Buttons\\WHITE8X8") -- Use built-in white texture
            thumb:SetVertexColor(0.8, 0.2, 0.2, 0.9) -- Red color (204, 51, 51) with 90% opacity
            thumb:SetSize(8, 20) -- Make thumb more sleek
        end

        -- Hide the default up/down buttons for cleaner look
        local upButton = _G[scrollFrame:GetName() .. "ScrollBarScrollUpButton"]
        local downButton = _G[scrollFrame:GetName() .. "ScrollBarScrollDownButton"]
        if upButton then upButton:Hide() end
        if downButton then downButton:Hide() end

        -- Adjust thumb position since we hid the buttons
        if thumb then
            thumb:ClearAllPoints()
            thumb:SetPoint("TOP", scrollBar, "TOP", 0, 0)
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Initialize All Systems ✿ʕ•ᴥ•ʔ
function UILayoutManager.Initialize()
    UILayoutManager.InitializeSourceFilter()
    UILayoutManager.InitializeDifficultyFilter()

    -- Update difficulty options when dungeons are available
    if _G.dungeonButtons and #_G.dungeonButtons > 0 then
        difficultyFilterOptions = GetContextAwareDifficultyOptions()
    end
end

-- ʕ •ᴥ•ʔ✿ Make globally accessible ✿ʕ•ᴥ•ʔ
_G.TheJournal_UILayoutManager = UILayoutManager
