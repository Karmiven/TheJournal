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

-- ʕ •ᴥ•ʔ✿ Mythic Filter Options ✿ʕ•ᴥ•ʔ
local mythicFilterOptions = {
    { state = "all", text = "All Difficulties", icon = "Interface\\Icons\\INV_Misc_Gem_01" },
    { state = "mythic", text = "Mythic Only", icon = "Interface\\Icons\\INV_Misc_Gem_Emerald_01" },
    { state = "nonmythic", text = "Non-Mythic", icon = "Interface\\Icons\\INV_Misc_Gem_Ruby_01" }
}

local currentMythicIndex = 1

function UILayoutManager.InitializeMythicFilter()
    -- Find current index based on saved setting
    if Journal_charDB.itemFilters.mythicFilter == "mythic" then
        currentMythicIndex = 2
    elseif Journal_charDB.itemFilters.mythicFilter == "nonmythic" then
        currentMythicIndex = 3
    else
        currentMythicIndex = 1
    end
end

function UILayoutManager.UpdateMythicFilterButton(button)
    local opt = mythicFilterOptions[currentMythicIndex]
    button:SetNormalTexture(opt.icon)
    local tex = button:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    Journal_charDB.itemFilters.mythicFilter = opt.state
end

function UILayoutManager.OnMythicFilterClick(button, InvalidateItemsCache, LoadDungeonDetail)
    -- Store tooltip state before making changes
    local tooltipWasShown = GameTooltip:IsShown() and GameTooltip:GetOwner() == button
    
    currentMythicIndex = currentMythicIndex + 1
    if currentMythicIndex > #mythicFilterOptions then
        currentMythicIndex = 1
    end
    UILayoutManager.UpdateMythicFilterButton(button)
    -- Reset warning flag when filter changes
    _G.mythicFilterWarningShown = false
    
    -- Invalidate cache when filter changes
    InvalidateItemsCache()
    
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
    
    -- Restore tooltip if it was shown before the click
    if tooltipWasShown then
        local opt = mythicFilterOptions[currentMythicIndex]
        GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
        GameTooltip:ClearLines()
        GameTooltip:SetText("|cFFFF6600" .. "Mythic Filter: " .. opt.text .. "|r")
        GameTooltip:AddLine("All Difficulties: Show all items", 1, 1, 1)
        GameTooltip:AddLine("Mythic Only: Show only mythic items", 1, 1, 1)
        GameTooltip:AddLine("Non-Mythic: Show only non-mythic items", 1, 1, 1)
        GameTooltip:Show()
    end
end

function UILayoutManager.OnMythicFilterEnter(button)
    local opt = mythicFilterOptions[currentMythicIndex]
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFFFF6600" .. "Mythic Filter: " .. opt.text .. "|r")
    GameTooltip:AddLine("All Difficulties: Show all items", 1, 1, 1)
    GameTooltip:AddLine("Mythic Only: Show only mythic items", 1, 1, 1)
    GameTooltip:AddLine("Non-Mythic: Show only non-mythic items", 1, 1, 1)
    GameTooltip:Show()
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
    UILayoutManager.InitializeMythicFilter()
end

-- ʕ •ᴥ•ʔ✿ Make globally accessible ✿ʕ•ᴥ•ʔ
_G.TheJournal_UILayoutManager = UILayoutManager
