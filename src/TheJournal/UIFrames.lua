-- ##################################################################
-- # UIFrames.lua
-- ##################################################################
-- Define binding headers
BINDING_HEADER_THEJOURNAL = "The Journal"
BINDING_NAME_TOGGLEJOURNAL = "Toggle Dungeon Journal"

-- Create a custom tooltip for affix display to avoid conflicts
local AffixTooltip = CreateFrame("GameTooltip", "DJ_AffixTooltip", UIParent, "GameTooltipTemplate")

-- Persistent drop rate cache to avoid recalculating on every page change
local dropRateCache = {}

-- Function to get cached drop rate for an item
local function GetCachedDropRate(itemId, dungeonName)
    local cacheKey = (dungeonName or "unknown") .. "_" .. itemId
    
    if dropRateCache[cacheKey] ~= nil then
        return dropRateCache[cacheKey]
    end
    
    -- Calculate and cache the drop rate
    local dropRate = 0
    if _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
        local bestSource = _G.ItemLocAPI:GetBestSource(itemId, dungeonName)
        dropRate = bestSource and bestSource.chance or 0
    end
    
    dropRateCache[cacheKey] = dropRate
    return dropRate
end

-- Function to clear drop rate cache for a specific dungeon (call when switching dungeons)
local function ClearDungeonDropRateCache(dungeonName)
    if not dungeonName then return end
    
    for cacheKey, _ in pairs(dropRateCache) do
        if cacheKey:find(dungeonName .. "_", 1, true) == 1 then
            dropRateCache[cacheKey] = nil
        end
    end
end

-- Custom tooltip positioning function
local function GameTooltip_SetDefaultAnchor(tooltip, parent)      
    tooltip:SetOwner(parent, "ANCHOR_NONE")
    tooltip:ClearAllPoints()
    tooltip:SetPoint("TOPLEFT", dungeonDetailFrame, "TOPRIGHT", 60, 0)
    tooltip.default = 1
end

-- Bounty system configuration
local BOUNTY_ICON = {
    SIZE = 16,
    TEXTURE = 'Interface/MoneyFrame/UI-GoldIcon',
}

-- Helper function to extract item ID from item link
local function GetItemIDFromLink(itemLink)
    if not itemLink then return nil end
    local itemID = string.match(itemLink, "item:(%d+)")
    return tonumber(itemID)
end

-- Check if an item is bountied
local function IsItemBountied(itemId)
    if not itemId or not _G.GetCustomGameData then return false end
    local bountiedValue = _G.GetCustomGameData(31, itemId)
    return (bountiedValue or 0) > 0
end

-- Set bounty icon on a frame, positioned relative to an icon
local function SetFrameBounty(frame, itemLink, iconFrame)
    local bountyFrameName = (frame:GetName() or "UnnamedFrame") .. '_Bounty'
    local bountyFrame = _G[bountyFrameName]
    local itemId = GetItemIDFromLink(itemLink)

    if itemId and IsItemBountied(itemId) then
        if not bountyFrame then
            bountyFrame = CreateFrame('Frame', bountyFrameName, frame)
            bountyFrame:SetWidth(BOUNTY_ICON.SIZE)
            bountyFrame:SetHeight(BOUNTY_ICON.SIZE)
            bountyFrame:SetFrameLevel(frame:GetFrameLevel() + 1)
            bountyFrame.texture = bountyFrame:CreateTexture(nil, 'OVERLAY')
            bountyFrame.texture:SetAllPoints()
            bountyFrame.texture:SetTexture(BOUNTY_ICON.TEXTURE)
        end
        bountyFrame:SetParent(frame)
        -- Position relative to the icon frame instead of the button frame
        local targetFrame = iconFrame or frame
        bountyFrame:SetPoint('TOPRIGHT', targetFrame, 'TOPRIGHT', -2, -2)
        bountyFrame:Show()
    elseif bountyFrame then
        bountyFrame:Hide()
    end
end

-- Custom affix names for each dungeon
local DUNGEON_AFFIX_NAMES = {
    ["Hellfire Ramparts"] = "Scorched Earth",
    ["The Blood Furnace"] = "Shadow Dancer",
    ["Shattered Halls"] = "Blood Frenzy",
    ["The Mechanar"] = "Lightning Rod",
    ["The Botanica"] = "Thorn in Your Side",
    ["The Arcatraz"] = "Stay Close",
    ["Mana-Tombs"] = "Mana Burn",
    ["Sethekk Halls"] = "Cursed Luck",
    ["Shadow Labyrinth"] = "What Goes Around",
    ["Auchenai Crypts"] = "Healing Touch",
    ["The Slave Pens"] = "Chained Up",
    ["The Steamvault"] = "Pressure Cooker",
    ["The Underbog"] = "Contagion",
    ["Old Hillsbrad Foothills"] = "Temporal Flux",
    ["The Black Morass"] = "Escalation",
    ["Magisters' Terrace"] = "Speed Demon",
    ["Stratholme"] = "Zombie Bomber",
    ["The Nexus"] = "High Risk High Reward",
    ["The Oculus"] = "Frozen Flight",
    ["Utgarde Keep"] = "Phoenix Rising",
    ["Utgarde Pinnacle"] = "Elemental Ward",
    ["Gundrak"] = "House Rules",
    ["Drak'Tharon Keep"] = "Shadow Links",
    ["Halls of Lightning"] = "Static Shock",
    ["Halls of Stone"] = "Stand Your Ground",
    ["Azjol-Nerub"] = "Sticky Situation",
    ["Ahn'kahet: The Old Kingdom"] = "Mind Games",
    ["Violet Hold"] = "Double Trouble",
    ["The Forge of Souls"] = "Spirit Guide",
    ["Pit of Saron"] = "Ice Ice Baby",
    ["Halls of Reflection"] = "Phantom Menace",
    ["Trial of the Champion"] = "Battle Scars"
}

-- Custom affix dataset for dungeons
-- Thank you so much Anthaney <3 for the affixes writeup!
local DUNGEON_AFFIXES = {
    ["Hellfire Ramparts"] = "Burning ground. |cFFFF6600Felfire|r - Stacking |cFFFF4500fire damage|r when standing in it.",
    ["The Blood Furnace"] = "Shadow Pools. |cFF9966CCPool of Shadow|r - Taking |cFF9966CCshadow damage|r when standing in it. Also |cFF00FF00increasing damage done|r.",
    ["Shattered Halls"] = "Killing an enemy grants you |cFFFF6600Enrage|r - |cFFFFFF00100%|r more |cFFFF4500damage taken|r and |cFF00FF00dealt|r.",
    ["The Mechanar"] = "Killing an enemy shoots |cFF66CCFFchain lightning|r at you.",
    ["The Botanica"] = "Enemies have |cFFFF6600thorns|r. Occurs every |cFFFFFF003|r seconds.",
    ["The Arcatraz"] = "|cFF66CCFFPower Core|r will be placed doing |cFF00FF00nature damage|r. Moving out of range of it |cFFFF4500increases|r it's damage dealt to you.",
    ["Mana-Tombs"] = "Being in combat gives |cFF9966CCMana Poisoning|r - |cFFFF4500Reduced health and mana|r until you kill a boss.",
    ["Sethekk Halls"] = "You get a |cFF9966CCrandom curse|r every |cFFFFFF0030|r seconds. Random curses could be anything.",
    ["Shadow Labyrinth"] = "|cFFFFFF0050%|r of the damage dealt to an enemy is |cFFFF4500reflect|r to you as a dot called |cFF9966CCShadow Wound|r.",
    ["Auchenai Crypts"] = "Overtime you will get |cFF9966CCSoul Sickness|r. You deal |cFFFFFF005%|r |cFFFF4500reduce damage|r per stack. |cFF00FF00Healing|r reduces the stacks.",
    ["The Slave Pens"] = "Entering Combat |cFF9966CCchains|r you. |cFFFF4500Immobalizing|r you for |cFFFFFF006|r seconds.",
    ["The Steamvault"] = "Every |cFFFFFF0060|r seconds you will get |cFFFF6600Steam overload|r. When expires, take |cFFFF4500fire damage|r and get |cFFFF4500knocked up|r.",
    ["The Underbog"] = "When in combat you will get |cFF9966CCSpore Disease|r. |cFF00FF00Nature dot|r that may |cFFFF4500spread|r to allies.",
    ["Old Hillsbrad Foothills"] = "You have a debuff called |cFF66CCFFFlow of time|r. Standing still |cFFFF4500reduces stacks|r causing at |cFFFFFF00zero|r to |cFFFF4500stun|r you. Moving |cFF00FF00increases stacks|r causing at |cFFFFFF00100|r to |cFFFF4500reduce attack speed|r by |cFFFFFF0070%|r.",
    ["The Black Morass"] = "In combat take |cFFFFFF001%|r |cFFFF4500increased damage|r every |cFFFFFF003|r seconds. Out of combat |cFF00FF00remove stacks|r every |cFFFFFF002|r seconds.",
    ["Magisters' Terrace"] = "You have |cFFFFFF00100%|r |cFF00FF00increase casting speed|r. But every cast gives you |cFF9966CCMagical Backlash|r causing a |cFFFF4500stacking debuff|r that when expires you take |cFF66CCFFarcane damage|r.",
    ["Stratholme"] = "|cFFFF4500Exploding zombie|r chases you. When it explodes it deals |cFFFF4500massive shadow damage|r.",
    ["The Nexus"] = "Being close to the |cFF66CCFFAnomaly boss|r gives you a |cFFFF4500stacking debuff|r. |cFF00FF00Increases magic done|r and |cFFFF4500taken|r by up to |cFFFFFF00100%|r.",
    ["The Oculus"] = "Giving you the ability to |cFF66CCFFfly|r. Sort of like Priest levitate mobility perk but you take |cFF66CCFFfrost damage|r everytime you're in the air.",
    ["Utgarde Keep"] = "When enemies fall below |cFFFFFF0050%|r, they |cFF00FF00heal back to full|r. |cFF00FF00Healing Reduction|r talents/spells work on it.",
    ["Utgarde Pinnacle"] = "Enemies have |cFFFFFF007|r |cFF66CCFFblessings|r. One for each element and physical. Doing one of those elements |cFF00FF00removes the buff|r making them |cFFFF4500take more damage|r.",
    ["Gundrak"] = "There is |cFFFFFF004|r different debuffs for each area. |cFF9966CCSladran room|r is |cFF00FF00poison damage|r. |cFF9966CCDrakkari Colossus room|r is |cFFFF4500reduce health|r. |cFF9966CCMoorabi room|r is |cFFFF4500reduce attack speed|r. |cFF9966CCGaldarah room|r is |cFFFFFF0050%|r |cFFFF4500damage taken|r every |cFFFFFF008|r seconds.",
    ["Drak'Tharon Keep"] = "Each enemy thats killed drop a |cFF9966CCshadow orb|r on the ground. When |cFFFFFF002|r or more are active it |cFF66CCFFlinks|r. Walking in between the link does |cFF9966CCshadow damage|r.",
    ["Halls of Lightning"] = "Moving in combat deals |cFF66CCFFlightning damage|r to you.",
    ["Halls of Stone"] = "Standing still gives you |cFF9966CCStoneform|r in combat. |cFF00FF00Stacking buff|r that |cFF00FF00increases damage you do|r and |cFF00FF00reduces damage you take|r.",
    ["Azjol-Nerub"] = "In combat if you move you will get |cFF9966CCSticky Webs|r. Giving you |cFFFF4500reduce movement speed|r. Stacking up to |cFFFFFF005|r.",
    ["Ahn'kahet: The Old Kingdom"] = "In combat you will be given a |cFF66CCFFrandom prompt|r. It will either be an emote or an ability you have. Doing said ability gives you |cFF9966CCInsanity|r. |cFF00FF00Increase damage dealt|r and |cFFFF4500taken|r stacking up to |cFFFFFF00100|r. Failing a prompt |cFF00FF00reduces your stacks|r by |cFFFFFF0010|r.",
    ["Violet Hold"] = "Instead of fighting |cFFFFFF001|r boss at wave |cFFFFFF006|r and |cFFFFFF0012|r, you instead fight |cFFFFFF002|r.",
    ["The Forge of Souls"] = "In combat |cFF9966CCVile Spirits|r will attack you. Causing |cFF66CCFFarcane damage|r if not |cFF00FF00moved away|r from them.",
    ["Pit of Saron"] = "In combat |cFF66CCFFIcicles|r fall from the sky. Dealing |cFF66CCFFfrost damage|r and |cFFFF4500knocking you back|r. Same mechanic as the gauntlet when heading towards Tyrannus.",
    ["Halls of Reflection"] = "In combat a |cFF9966CCghost|r will follow you. Getting hit by the ghost |cFFFF4500blows it up|r and you take |cFF9966CCshadow damage|r.",
    ["Trial of the Champion"] = "After every boss is defeated, get a |cFFFF4500stacking bleed debuff|r."
}

local tempschedule = {}

local DungeonJournalFrame = CreateFrame("Frame", "DungeonJournalFrame", UIParent)
DungeonJournalFrame:SetSize(585, 430)
DungeonJournalFrame:SetPoint("CENTER")
DungeonJournalFrame:SetClampedToScreen(true)
DungeonJournalFrame:EnableMouse(true)
DungeonJournalFrame:SetMovable(true)

DungeonJournalFrame:RegisterForDrag("LeftButton", "RightButton")
DungeonJournalFrame:SetScript("OnDragStart", function(self, button)
    if button == "LeftButton" or button == "RightButton" then
        self:StartMoving()
    end
end)
DungeonJournalFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

DungeonJournalFrame.BackgroundTexture = DungeonJournalFrame:CreateTexture(nil, "BACKGROUND")
DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_base.blp")
DungeonJournalFrame.BackgroundTexture:SetTexCoord(0, 0.751, 0, 0.589)
DungeonJournalFrame.BackgroundTexture:SetAllPoints(DungeonJournalFrame)
DungeonJournalFrame:Hide()

local mainCloseButton = CreateFrame("Button", nil, DungeonJournalFrame, "UIPanelCloseButton")
mainCloseButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", 4, -4)
mainCloseButton:SetSize(25, 25)

_G.itemButtonCache              = _G.itemButtonCache or {}
_G.lastBossNavDungeon           = _G.lastBossNavDungeon or nil
_G.currentDungeon               = _G.currentDungeon or nil

local dungeonData               = _G.Journal and _G.Journal.djDungeons or {}

Journal_charDB.viewAllItems        = Journal_charDB.viewAllItems or false
Journal_charDB.currentItemPage     = Journal_charDB.currentItemPage or 1
Journal_charDB.currentVersionIndex = Journal_charDB.currentVersionIndex or 1
Journal_charDB.itemSearchQuery     = Journal_charDB.itemSearchQuery or ""

DJ_Settings.filterType          = DJ_Settings.filterType or "All"
DJ_Settings.onlyEquipable       = DJ_Settings.onlyEquipable or false
DJ_Settings.attuneFilter        = DJ_Settings.attuneFilter or "All"

local searchTooltip             = CreateFrame("GameTooltip", "DJ_ItemSearchTooltip", nil, "GameTooltipTemplate")
searchTooltip:SetOwner(UIParent, "ANCHOR_NONE")

local MAX_ITEMS_PER_PAGE = 16
local NUM_COLS           = 2
local displayedItems     = {}
local totalPages         = 1

-- Removed toggleEquippableButton - no longer needed with attunement system

local filterTypeButton = CreateFrame("Button", nil, DungeonJournalFrame)
filterTypeButton:SetSize(24, 24)
filterTypeButton:SetPoint("RIGHT", mainCloseButton, "LEFT", 5, -25)
filterTypeButton:SetFrameStrata("DIALOG")
filterTypeButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function UpdateFilterTooltipText(button)
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == button then
        GameTooltip:ClearLines()
        GameTooltip:SetPoint("BOTTOM", button, "TOP", 0, 0)
        GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
        GameTooltip:Show()
    end
end

filterTypeButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self)
    GameTooltip:ClearLines()
    GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
    GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
    GameTooltip:Show()
end)


filterTypeButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- Show/hide functions will be defined after all buttons are created

local previewFrame = CreateFrame("Frame", "DungeonJournalPreviewFrame", DungeonJournalFrame)
previewFrame:SetSize(585, 430)
previewFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
previewFrame:Show()

local titleText = previewFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", previewFrame, "TOP", 0, 0)
titleText:SetText("Adventurer's Journal")

local scrollFrame = CreateFrame("ScrollFrame", "DungeonGridScrollFrame", previewFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetSize(585, math.floor(430 * 0.82))
scrollFrame:SetPoint("TOP", titleText, "BOTTOM", 20, -38)

local scrollBar = _G[scrollFrame:GetName() .. "ScrollBar"]
if scrollBar then
    scrollBar:SetWidth(8)
    scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -70, 0)
    scrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -70, 0)
    local thumb = _G[scrollFrame:GetName() .. "ScrollBarThumbTexture"]
    if thumb then
        thumb:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
        thumb:SetVertexColor(0.6, 0.6, 0.6)
    end
end

local gridContainer       = CreateFrame("Frame", "DungeonGridContainer", scrollFrame)
local numDungeonCols      = 3
local dungeonButtonWidth  = 180
local dungeonButtonHeight = 90
gridContainer:SetSize(numDungeonCols * dungeonButtonWidth, 1)
scrollFrame:SetScrollChild(gridContainer)

dungeonDetailFrame = CreateFrame("Frame", "DungeonDetailFrame", DungeonJournalFrame)
dungeonDetailFrame:SetSize(456, 336)
dungeonDetailFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
dungeonDetailFrame:Hide()

local dungeonTitleText = dungeonDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
dungeonTitleText:SetPoint("TOP", dungeonDetailFrame, "TOP", 0, 0)

local dungeonDescScrollFrame = CreateFrame("ScrollFrame", "DungeonDescScrollFrame", dungeonDetailFrame,
    "UIPanelScrollFrameTemplate")
dungeonDescScrollFrame:SetSize(192, 240)
dungeonDescScrollFrame:SetPoint("TOPLEFT", dungeonDetailFrame, "TOPLEFT", 10, -40)
dungeonDescScrollFrame:EnableMouseWheel(true)
dungeonDescScrollFrame:SetScript("OnMouseWheel", function(self, delta)
    local cur = self:GetVerticalScroll()
    local new = cur - delta * 20
    if new < 0 then new = 0 end
    local maxScroll = self:GetVerticalScrollRange() or 0
    if new > maxScroll then new = maxScroll end
    self:SetVerticalScroll(new)
end)
local descScrollBar = _G["DungeonDescScrollFrameScrollBar"]
if descScrollBar then
    descScrollBar:Hide()
    descScrollBar.Show = function() end
end

local itemsListFrame = CreateFrame("Frame", "DungeonItemsListFrame", dungeonDetailFrame)
itemsListFrame:SetSize(400, 340)
itemsListFrame:SetPoint("TOPRIGHT", dungeonDetailFrame, "TOPRIGHT", 90, -60)

local itemsListContainer = CreateFrame("Frame", "ItemsListContainer", itemsListFrame)
itemsListContainer:SetSize(400, 340)
itemsListContainer:SetPoint("TOPLEFT", itemsListFrame, "TOPLEFT")

local pageNavigationFrame = CreateFrame("Frame", "DJ_ItemPageNavFrame", itemsListFrame)
pageNavigationFrame:SetSize(400, 25)
pageNavigationFrame:SetPoint("BOTTOM", itemsListFrame, "BOTTOM", 0, 0)

-- Move search box to top right area
local itemSearchBox = CreateFrame("EditBox", "DJ_ItemSearchBox", DungeonJournalFrame, "InputBoxTemplate")
itemSearchBox:SetSize(120, 20)
itemSearchBox:SetAutoFocus(false)
itemSearchBox:SetPoint("RIGHT", filterTypeButton, "LEFT", -10, 0)
itemSearchBox:SetFrameStrata("DIALOG")
itemSearchBox:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)
itemSearchBox:SetText(Journal_charDB.itemSearchQuery or "")
itemSearchBox:SetScript("OnTextChanged", function(self, userInput)
    Journal_charDB.itemSearchQuery = self:GetText() or ""
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
end)

-- Initialize filter settings (safe initialization)
if not Journal_charDB.itemFilters then
    Journal_charDB.itemFilters = {
        searchType = "items", -- "items", "bosses"
        maxSources = 0, -- maximum number of sources (0 = show all)
        showRareDrops = true, -- show items with < 5% droprate
        showCommonDrops = true -- show items with >= 5% droprate
    }
end

-- Create new icon-based filter controls positioned nicely in top right

-- Source Count Filter Icon Button (3 states: All, 1 source, >1 source)
local sourceCountOptions = {
    { state = 0, text = "All Items", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllSources.blp" },
    { state = 1, text = "1 Source", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\1Source.blp" },
    { state = 999, text = ">1 Source", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\MoreThan1Source.blp" }
}

local currentSourceIndex = 1
-- Find current index based on saved setting
if Journal_charDB.itemFilters.maxSources == 1 then
    currentSourceIndex = 2
elseif Journal_charDB.itemFilters.maxSources == 999 then
    currentSourceIndex = 3
else
    currentSourceIndex = 1
end

local sourceCountButton = CreateFrame("Button", nil, DungeonJournalFrame)
sourceCountButton:SetSize(24, 24)
sourceCountButton:SetPoint("RIGHT", itemSearchBox, "LEFT", -10, 0)
sourceCountButton:SetFrameStrata("DIALOG")
sourceCountButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function UpdateSourceCountButton()
    local opt = sourceCountOptions[currentSourceIndex]
    sourceCountButton:SetNormalTexture(opt.icon)
    local tex = sourceCountButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    sourceCountButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    Journal_charDB.itemFilters.maxSources = opt.state
end

UpdateSourceCountButton()

sourceCountButton:SetScript("OnClick", function(self)
    currentSourceIndex = currentSourceIndex + 1
    if currentSourceIndex > #sourceCountOptions then
        currentSourceIndex = 1
    end
    UpdateSourceCountButton()
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
    
    -- Update tooltip if it's currently shown
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
        local opt = sourceCountOptions[currentSourceIndex]
        GameTooltip:ClearLines()
        GameTooltip:SetText("|cFF87CEEB" .. "Source Count Filter: " .. opt.text .. "|r")
        GameTooltip:AddLine("All Items: Show all items", 1, 1, 1)
        GameTooltip:AddLine("1 Source: Show items with only 1 drop source", 1, 1, 1)
        GameTooltip:AddLine(">1 Source: Show items with multiple sources", 1, 1, 1)
        GameTooltip:Show()
    end
end)

sourceCountButton:SetScript("OnEnter", function(self)
    local opt = sourceCountOptions[currentSourceIndex]
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    GameTooltip:SetText("|cFF87CEEB" .. "Source Count Filter: " .. opt.text .. "|r")
    GameTooltip:AddLine("All Items: Show all items", 1, 1, 1)
    GameTooltip:AddLine("1 Source: Show items with only 1 drop source", 1, 1, 1)
    GameTooltip:AddLine(">1 Source: Show items with multiple sources", 1, 1, 1)
    GameTooltip:Show()
end)

sourceCountButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Mythic Filter Icon Button (3 states: All, Mythic Only, Non-Mythic Only)
local mythicFilterOptions = {
    { state = "all", text = "All Difficulties", icon = "Interface\\Icons\\INV_Misc_Gem_01" },
    { state = "mythic", text = "Mythic Only", icon = "Interface\\Icons\\INV_Misc_Gem_Emerald_01" },
    { state = "nonmythic", text = "Non-Mythic", icon = "Interface\\Icons\\INV_Misc_Gem_Ruby_01" }
}

local currentMythicIndex = 1
-- Find current index based on saved setting
if Journal_charDB.itemFilters.mythicFilter == "mythic" then
    currentMythicIndex = 2
elseif Journal_charDB.itemFilters.mythicFilter == "nonmythic" then
    currentMythicIndex = 3
else
    currentMythicIndex = 1
end

local mythicFilterButton = CreateFrame("Button", nil, DungeonJournalFrame)
mythicFilterButton:SetSize(24, 24)
mythicFilterButton:SetPoint("RIGHT", sourceCountButton, "LEFT", -5, 0)
mythicFilterButton:SetFrameStrata("DIALOG")
mythicFilterButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function UpdateMythicFilterButton()
    local opt = mythicFilterOptions[currentMythicIndex]
    mythicFilterButton:SetNormalTexture(opt.icon)
    local tex = mythicFilterButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    mythicFilterButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
    Journal_charDB.itemFilters.mythicFilter = opt.state
end

UpdateMythicFilterButton()

mythicFilterButton:SetScript("OnClick", function(self)
    currentMythicIndex = currentMythicIndex + 1
    if currentMythicIndex > #mythicFilterOptions then
        currentMythicIndex = 1
    end
    UpdateMythicFilterButton()
    -- Reset warning flag when filter changes
    _G.mythicFilterWarningShown = false
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
    
    -- Update tooltip if it's currently shown
    if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
        local opt = mythicFilterOptions[currentMythicIndex]
        GameTooltip:ClearLines()
        GameTooltip:SetText("|cFFFF6600" .. "Mythic Filter: " .. opt.text .. "|r")
        GameTooltip:AddLine("All Difficulties: Show all items", 1, 1, 1)
        GameTooltip:AddLine("Mythic Only: Show only mythic items", 1, 1, 1)
        GameTooltip:AddLine("Non-Mythic: Show only non-mythic items", 1, 1, 1)
        GameTooltip:Show()
    end
end)

mythicFilterButton:SetScript("OnEnter", function(self)
    local opt = mythicFilterOptions[currentMythicIndex]
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    GameTooltip:SetText("|cFFFF6600" .. "Mythic Filter: " .. opt.text .. "|r")
    GameTooltip:AddLine("All Difficulties: Show all items", 1, 1, 1)
    GameTooltip:AddLine("Mythic Only: Show only mythic items", 1, 1, 1)
    GameTooltip:AddLine("Non-Mythic: Show only non-mythic items", 1, 1, 1)
    GameTooltip:Show()
end)

mythicFilterButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Define show/hide functions now that all buttons are created
local function HideDungeonInteriorUI()
    filterTypeButton:Hide()
    sourceCountButton:Hide()
    mythicFilterButton:Hide()
    itemSearchBox:Hide()
end

local function ShowDungeonInteriorUI()
    filterTypeButton:Show()
    sourceCountButton:Show()
    mythicFilterButton:Show()
    itemSearchBox:Show()
end

-- Removed dropdown controls - now using streamlined icon buttons

local prevPageButton = CreateFrame("Button", nil, pageNavigationFrame, "UIPanelButtonTemplate")
prevPageButton:SetSize(25, 20)
prevPageButton:SetText("<")

local pageText = pageNavigationFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
pageText:SetPoint("CENTER", pageNavigationFrame, "CENTER", -30, 0)
pageText:SetText("Page 1/1")

local nextPageButton = CreateFrame("Button", nil, pageNavigationFrame, "UIPanelButtonTemplate")
nextPageButton:SetSize(25, 20)
nextPageButton:SetText(">")

-- Center the navigation: prev button to left of text, next button to right of text
prevPageButton:SetPoint("RIGHT", pageText, "LEFT", -5, 0)
nextPageButton:SetPoint("LEFT", pageText, "RIGHT", 5, 0)

local function UpdatePage(offset)
    Journal_charDB.currentItemPage = Journal_charDB.currentItemPage + offset
    if Journal_charDB.currentItemPage < 1 then
        Journal_charDB.currentItemPage = totalPages
    elseif Journal_charDB.currentItemPage > totalPages then
        Journal_charDB.currentItemPage = 1
    end
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end
end

prevPageButton:SetScript("OnClick", function() UpdatePage(-1) end)
nextPageButton:SetScript("OnClick", function() UpdatePage(1) end)

itemsListFrame:EnableMouseWheel(true)
itemsListFrame:SetScript("OnMouseWheel", function(self, delta)
    if delta > 0 then
        UpdatePage(-1)
    else
        UpdatePage(1)
    end
end)

local backButton = CreateFrame("Button", nil, DungeonJournalFrame)
backButton:SetSize(20, 20)
backButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", -12, -9)

local backFont = backButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
backFont:SetText("<  ")
backFont:SetPoint("CENTER", backButton, "CENTER", 0, 3)

local backTex = backButton:CreateTexture(nil, "BACKGROUND")
backTex:SetAllPoints(backButton)
backTex:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
backTex:SetBlendMode("ADD")

local backHighlightTexture = backButton:CreateTexture(nil, "HIGHLIGHT")
backHighlightTexture:SetAllPoints(backButton)
backHighlightTexture:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
backHighlightTexture:SetBlendMode("ADD")

backButton:SetScript("OnClick", function()
    if dungeonDetailFrame:IsShown() then
        -- Restore the main interface background when returning to preview
        DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_base.blp")
        dungeonDetailFrame:Hide()
        previewFrame:Show()
        HideDungeonInteriorUI()
        -- Refresh attuneable text when returning to main screen
        RefreshAllAttunableText()
        -- Sort dungeons by attunement progress
        SortDungeonsByAttunement()
    elseif previewFrame:IsShown() then
        if RuneCollection then RuneCollection:Show() end
        HideJournal()
    end
end)

local function AcquireItemButton(dIndex, iIndex)
    _G.itemButtonCache[dIndex] = _G.itemButtonCache[dIndex] or {}
    if _G.itemButtonCache[dIndex][iIndex] then
        return _G.itemButtonCache[dIndex][iIndex]
    end

    local btnName = "DJ_ItemButton_" .. dIndex .. "_" .. iIndex
    local btn = CreateFrame("Button", btnName, itemsListContainer)
    btn:SetSize(180, 40)

    local iconTex = btn:CreateTexture(nil, "ARTWORK")
    iconTex:SetSize(30, 30)
    iconTex:SetPoint("LEFT", btn, "LEFT", 2, 5)
    btn.iconTex = iconTex

    local itemText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    itemText:SetPoint("TOPLEFT", iconTex, "TOPRIGHT", 4, 0)
    itemText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    itemText:SetJustifyH("LEFT")
    btn.itemText = itemText

    local dropLocationText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    dropLocationText:SetPoint("TOPLEFT", itemText, "BOTTOMLEFT", 0, -2)
    dropLocationText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    dropLocationText:SetJustifyH("LEFT")
    btn.dropLocationText = dropLocationText

    local favIcon = btn:CreateTexture(nil, "OVERLAY")
    favIcon:SetSize(24, 24)
    favIcon:SetPoint("TOPLEFT", iconTex, "TOPLEFT", -8, 8)
    favIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    favIcon:Hide()
    btn.favoriteIcon = favIcon

    btn:RegisterForClicks("LeftButtonUp")
    btn:SetScript("OnEnter", function(self)
        if self.itemLink then
            GameTooltip_SetDefaultAnchor(GameTooltip, self)
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:Show()
        end
    end)
    btn:SetScript("OnLeave", function(self) 
        GameTooltip:Hide() 
    end)

    btn:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        elseif button == "LeftButton" and IsControlKeyDown() then
            local base = self.baseItemID
            if Journal_charDB.favorites[base] then
                Journal_charDB.favorites[base] = nil
            else
                Journal_charDB.favorites[base] = true
            end
            if _G.currentDungeon then
                LoadDungeonDetail(_G.currentDungeon)
            end
        end
    end)

    _G.itemButtonCache[dIndex][iIndex] = btn
    return btn
end

local function HideAllItemButtons()
    for dIdx, itemTbl in pairs(_G.itemButtonCache) do
        for _, btn in pairs(itemTbl) do
            btn:Hide()
        end
    end
end

-- Simplified caching function - only cache current dungeon, no batch processing
local function HandleUncachedItem(itemID, dungeon)
    if dungeon and dungeon.name and not tempschedule[dungeon.name] then
        tempschedule[dungeon.name] = true
        C_Timer.After(0.5, function()
            -- Simple pre-cache only for current dungeon
            if dungeon.items then
                for _, id in ipairs(dungeon.items) do
                    CacheItem(id)
                end
            end
            if _G.currentDungeon and _G.currentDungeon.name == dungeon.name then
                LoadDungeonDetail(_G.currentDungeon)
            end
        end)
    end
end

-- Removed UpdateToggleEquippableButtonText and toggleEquippableButton logic

local filterTypeOptions = {
    { state = "All",     icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllItems.blp" },
    { state = "Attunable", icon ="Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AttunableItems.blp" },
    { state = "Attuned", icon = "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AttunedItems.blp" }
}

local currentFilterIndex = 1
for i, v in ipairs(filterTypeOptions) do
    if v.state == DJ_Settings.filterType then
        currentFilterIndex = i
        break
    end
end

local function UpdateFilterTypeButton()
    local opt = filterTypeOptions[currentFilterIndex]
    filterTypeButton:SetNormalTexture(opt.icon)
    local tex = filterTypeButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(24, 24)
    end
    filterTypeButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")

    DJ_Settings.filterType = opt.state
end

UpdateFilterTypeButton()

filterTypeButton:SetScript("OnClick", function(self)
    currentFilterIndex = currentFilterIndex + 1
    if currentFilterIndex > #filterTypeOptions then
        currentFilterIndex = 1
    end
    UpdateFilterTypeButton()
    Journal_charDB.currentItemPage = 1
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon)
    end

    if C_Timer and C_Timer.After then
        C_Timer.After(0.1, function()
            if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
                GameTooltip:ClearLines()
                GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
                GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
                GameTooltip:Show()
            end
        end)
    else
        -- Fallback: Update immediately if no timer available.
        -- Only update if the tooltip is still owned by this button
        if GameTooltip:GetOwner() == self then
            GameTooltip:ClearLines()
            GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 0)
            GameTooltip:AddLine("|cFFFFD700" .. "Filter Mode: " .. (DJ_Settings.filterType or "All") .. "|r")
            GameTooltip:Show()
        end
    end
end)

local function ToggleAll(list, boolMap)
    local allOn = true
    for _, val in ipairs(list) do
        if not boolMap[val] then
            allOn = false
            break
        end
    end
    for _, val in ipairs(list) do
        boolMap[val] = not allOn
    end
end

local function GetVersionModifierForDungeon(dungeon, versionIndex)
    if dungeon.versions and dungeon.versions[versionIndex] then
        return dungeon.versions[versionIndex].modifier or 0
    elseif dungeon.versions and #dungeon.versions > 0 then
        return dungeon.versions[#dungeon.versions].modifier or 0
    end
    return 0
end

local function FindDungeonByName(dName)
    for _, d in ipairs(dungeonData or {}) do
        if d.name == dName then
            return d
        end
    end
end

function PassesFilterIcon(iType, iSubType, eLoc, filterIcon)
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

local function PrepareItemsToShow(dungeon)
    local itemsToShow = {}
    local final = {}
    local filterIcon = DJ_Settings.filterType or "All"

    -- Get items list (static or dynamic)
    local itemList = _G.GetDynamicDungeonItems and _G.GetDynamicDungeonItems(dungeon) or dungeon.items or {}

    -- First pass: Convert item IDs to item info objects
    for _, itemID in ipairs(itemList) do
        local itemLink = "item:" .. itemID
        local iName, _, iQuality, _, _, iType, iSubType, _, eLoc
        
        -- Use GetItemInfoCustom if available, fallback to GetItemInfo
        if _G.GetItemInfoCustom then
            iName, _, iQuality, _, _, iType, iSubType, _, eLoc = _G.GetItemInfoCustom(itemID)
        else
            iName, _, iQuality, _, _, iType, iSubType, _, eLoc = GetItemInfo(itemID)
        end
        
        -- Skip if item info isn't loaded yet
        if not iName then
            HandleUncachedItem(itemID, dungeon)
            iName = tostring(itemID)
        end

        local info = {
            baseID = itemID,
            itemLink = itemLink,
            isSpecial = false,
            index = #itemsToShow + 1
        }

        local shouldAdd = true
        
        -- Check attunement status filtering first
        if filterIcon == "Attunable" then
            -- Show items that can be attuned and have progress < 100%
            local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            shouldAdd = (canAttune == 1) and (attuneProgress < 100)
        elseif filterIcon == "Attuned" then
            -- Show only fully attuned items
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            shouldAdd = (attuneProgress >= 100)
        end
        
        -- Apply equipment-specific filtering if enabled
        if shouldAdd and DJ_Settings.onlyEquipable and iName then
            local currentClass = GetCurrentClass()
            
            -- Check armor slot filtering
            if iType == "Armor" then
                local allowedSlots = Journal_charDB.allowedArmorSlots or {}
                local equipSlot = _G.ConvertInvTypeToSlot and _G.ConvertInvTypeToSlot(eLoc)
                if equipSlot and not allowedSlots[equipSlot] then
                    shouldAdd = false
                end
                
                -- Check armor type filtering
                if shouldAdd then
                    local allowedArmorTypes = Journal_charDB.allowedArmorType and Journal_charDB.allowedArmorType[currentClass] or {}
                    if #allowedArmorTypes > 0 and not _G.IsInList(allowedArmorTypes, iSubType) then
                        shouldAdd = false
                    end
                end
            elseif iType == "Weapon" then
                -- Check weapon type filtering
                local allowedWeaponTypes = Journal_charDB.allowedWeaponType and Journal_charDB.allowedWeaponType[currentClass] or {}
                if #allowedWeaponTypes > 0 then
                    local normalizedSubType = iSubType
                    if iSubType == "Staves" then
                        normalizedSubType = "Staff"
                    end
                    if not _G.IsInList(allowedWeaponTypes, normalizedSubType) then
                        shouldAdd = false
                    end
                end
            end
        end
        
        if shouldAdd then
            table.insert(itemsToShow, info)
        end
    end

    -- Add special items if they exist
    if dungeon.specialItems and not DJ_Settings.onlyEquipable then
        for i, spID in ipairs(dungeon.specialItems) do
            local itemLink = "item:" .. spID
            local info = {
                baseID = spID,
                itemLink = itemLink,
                isSpecial = true,
                index = #itemsToShow + 1,
                drop = dungeon.specialDrop and dungeon.specialDrop[i]
            }
            table.insert(itemsToShow, info)
        end
    end

    -- Sort items: special items first, then favorites, then by attunement status
    table.sort(itemsToShow, function(a, b)
        -- Special items first
        if a.isSpecial and not b.isSpecial then return true end
        if not a.isSpecial and b.isSpecial then return false end

        -- Then favorites
        local aFav = Journal_charDB.favorites[a.baseID] or false
        local bFav = Journal_charDB.favorites[b.baseID] or false
        if aFav and not bFav then return true end
        if not aFav and bFav then return false end

        -- Check attunement status for both items
        local aProgress = _G.GetItemLinkAttuneProgress and _G.GetItemLinkAttuneProgress(a.itemLink) or 0
        local bProgress = _G.GetItemLinkAttuneProgress and _G.GetItemLinkAttuneProgress(b.itemLink) or 0
        local aAttuned = aProgress >= 100
        local bAttuned = bProgress >= 100
        local aInProgress = aProgress > 0 and aProgress < 100
        local bInProgress = bProgress > 0 and bProgress < 100

        -- Determine sorting groups: 1=Attuned, 2=Non-attuned, 3=In-progress
        local aGroup = aAttuned and 1 or (aInProgress and 3 or 2)
        local bGroup = bAttuned and 1 or (bInProgress and 3 or 2)
        
        -- First sort by group priority
        if aGroup ~= bGroup then
            return aGroup < bGroup -- Lower group number comes first
        end
        
        -- Within the same group, apply specific sorting
        if aGroup == 1 then
            -- Both attuned: sort by forge level (higher forge level first)
            local aForge = _G.GetItemAttuneForge and _G.GetItemAttuneForge(a.baseID) or 0
            local bForge = _G.GetItemAttuneForge and _G.GetItemAttuneForge(b.baseID) or 0
            if aForge ~= bForge then
                return aForge > bForge -- Higher forge level first
            end
        elseif aGroup == 2 then
            -- Both non-attuned: sort by drop rate (highest to lowest)
            local currentDungeon = _G.currentDungeon
            local dungeonName = currentDungeon and currentDungeon.name
            local aDropRate = GetCachedDropRate(a.baseID, dungeonName)
            local bDropRate = GetCachedDropRate(b.baseID, dungeonName)
            
            if aDropRate ~= bDropRate then
                return aDropRate > bDropRate -- Higher drop rate first
            end
        elseif aGroup == 3 then
            -- Both in progress: sort by progress percentage (higher progress first)
            if aProgress ~= bProgress then
                return aProgress > bProgress
            end
        end

        -- Finally by index
        return a.index < b.index
    end)

    return itemsToShow
end

local function DisplayItemsList(dungeon, versionIndex, itemsToShow)
    wipe(displayedItems)
    local query = (Journal_charDB.itemSearchQuery or ""):lower()
    
    -- Initialize filters if not already initialized
    if not Journal_charDB.itemFilters then
        Journal_charDB.itemFilters = {
            searchType = "items", -- "items", "bosses"
            maxSources = 0, -- maximum number of sources (0 = show all)
            showRareDrops = true, -- show items with < 5% droprate
            showCommonDrops = true, -- show items with >= 5% droprate
            mythicFilter = "all" -- "all", "mythic", "nonmythic"
        }
    end
    
    -- Migrate old mythicOnly setting to new mythicFilter
    if Journal_charDB.itemFilters.mythicOnly ~= nil then
        if Journal_charDB.itemFilters.mythicOnly then
            Journal_charDB.itemFilters.mythicFilter = "mythic"
        else
            Journal_charDB.itemFilters.mythicFilter = "all"
        end
        Journal_charDB.itemFilters.mythicOnly = nil -- Remove old setting
    end
    
    -- Add mythicFilter field if missing from existing filters
    if Journal_charDB.itemFilters.mythicFilter == nil then
        Journal_charDB.itemFilters.mythicFilter = "all"
    end
    
    local filters = Journal_charDB.itemFilters
    
    -- Handle different search types and filtering  
    if query ~= "" or filters.maxSources > 0 or filters.mythicFilter ~= "all" then
        -- Filtering is active
        local filtered = {}
        
        -- Boss search mode
        if filters.searchType == "bosses" and query ~= "" then
            -- Find items that drop from bosses matching the search query
            if dungeon.bosses and ItemLocIsLoaded and ItemLocIsLoaded() then
                for _, boss in ipairs(dungeon.bosses) do
                    if boss.name and boss.bossID and boss.name:lower():find(query, 1, true) then
                        -- Get items from this boss
                        local count = ItemLocGetObjCount and ItemLocGetObjCount(1, boss.bossID) or 0
                        if count and count > 0 then
                            for i = 1, count do
                                local srcType, itemId, chance, dropsPerThousand = ItemLocGetObjAt(1, boss.bossID, i)
                                if itemId then
                                    -- Apply source count and drop rate filters
                                    local sourceCount = ItemLocGetSourceCount and ItemLocGetSourceCount(itemId) or 0
                                    local bestChance = chance or 0
                                    
                                    -- Check max sources filter (0 means show all, 999 means >1 source)
                                    local passesSourceFilter = true
                                    if filters.maxSources == 1 then
                                        passesSourceFilter = (sourceCount == 1)
                                    elseif filters.maxSources == 999 then
                                        passesSourceFilter = (sourceCount > 1)
                                    end
                                    -- 0 means show all, so no additional filtering needed
                                    
                                    if passesSourceFilter then
                                        -- Simplified - show all items (removed drop rate filtering)
                                        local showItem = true
                                        
                                        if showItem then
                                            -- Apply mythic filter
                                            local passesMythicFilter = true
                                            if filters.mythicFilter ~= "all" and _G.GetItemTagsCustom then
                                                local itemTags1, itemTags2 = _G.GetItemTagsCustom(itemId)
                                                local isMythicItem = itemTags1 and bit.band(itemTags1, 0x80) ~= 0 -- Check for 128 bit (Mythic)
                                                
                                                if filters.mythicFilter == "mythic" and not isMythicItem then
                                                    passesMythicFilter = false
                                                elseif filters.mythicFilter == "nonmythic" and isMythicItem then
                                                    passesMythicFilter = false
                                                end
                                            end
                                            
                                            if passesMythicFilter then
                                                table.insert(filtered, {
                                                    baseID = itemId,
                                                    itemLink = "item:" .. itemId,
                                                    isSpecial = false,
                                                    index = #filtered + 1,
                                                    fromBoss = boss.name
                                                })
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            -- Normal item search with filtering
            for _, info in ipairs(itemsToShow) do
                local adjID = info.isSpecial and info.baseID or info.baseID
                local shouldInclude = true
                
                -- Apply max source count filter (0 means show all, 999 means >1 source)
                if filters.maxSources ~= 0 and ItemLocGetSourceCount then
                    local sourceCount = ItemLocGetSourceCount(adjID) or 0
                    if filters.maxSources == 1 then
                        if sourceCount ~= 1 then
                            shouldInclude = false
                        end
                    elseif filters.maxSources == 999 then
                        if sourceCount <= 1 then
                            shouldInclude = false
                        end
                    end
                end
                
                -- Apply mythic filter
                if shouldInclude and filters.mythicFilter ~= "all" and _G.GetItemTagsCustom then
                    local itemTags1, itemTags2 = _G.GetItemTagsCustom(adjID)
                    local isMythicItem = itemTags1 and bit.band(itemTags1, 0x80) ~= 0 -- Check for 128 bit (Mythic)
                    
                                            -- Mythic filtering logic
                    
                    if filters.mythicFilter == "mythic" and not isMythicItem then
                        shouldInclude = false
                    elseif filters.mythicFilter == "nonmythic" and isMythicItem then
                        shouldInclude = false
                    end
                end
                
                -- Removed drop rate filters - using streamlined interface
                
                -- Apply text search for items
                if shouldInclude and query ~= "" and filters.searchType == "items" then
                    local iName
                    if _G.GetItemInfoCustom then
                        iName = _G.GetItemInfoCustom(adjID) or ""
                    else
                        iName = GetItemInfo(adjID) or ""
                    end
                    local nameLower = iName:lower()
                    searchTooltip:ClearLines()
                    searchTooltip:SetHyperlink("item:" .. adjID)
                    local tooltipText = ""
                    for lineIndex = 1, searchTooltip:NumLines() do
                        local leftLine  = _G["DJ_ItemSearchTooltipTextLeft" .. lineIndex]
                        local rightLine = _G["DJ_ItemSearchTooltipTextRight" .. lineIndex]
                        local lt        = leftLine and leftLine:GetText() or ""
                        local rt        = rightLine and rightLine:GetText() or ""
                        tooltipText     = tooltipText .. lt:lower() .. "\n" .. rt:lower() .. "\n"
                    end
                    if not (nameLower:find(query, 1, true) or tooltipText:find(query, 1, true)) then
                        shouldInclude = false
                    end
                end
                
                if shouldInclude then
                    table.insert(filtered, info)
                end
            end
        end
        itemsToShow = filtered
    end

    for _, v in ipairs(itemsToShow) do
        table.insert(displayedItems, v)
    end

    totalPages = math.ceil(#displayedItems / MAX_ITEMS_PER_PAGE)
    if totalPages < 1 then
        totalPages = 1
    end
    if Journal_charDB.currentItemPage > totalPages then
        Journal_charDB.currentItemPage = totalPages
    end
    pageText:SetText(("Page %d/%d"):format(Journal_charDB.currentItemPage, totalPages))

    HideAllItemButtons()
    if #displayedItems == 0 then
        local noItemsLabel = AcquireItemButton(dungeon.index or 9999, 99999)
        noItemsLabel:ClearAllPoints()
        noItemsLabel:SetPoint("TOPLEFT", itemsListContainer, "TOPLEFT", 5, -5)
        noItemsLabel.iconTex:SetTexture("")
        noItemsLabel.itemText:SetText(
            DJ_Settings.onlyEquipable and "No equippable items available" or "No items available"
        )
        noItemsLabel.dropLocationText:SetText("")
        noItemsLabel.favoriteIcon:Hide()
        noItemsLabel:Show()
        itemsListContainer:SetHeight(40)
        return
    end

    local startIndex = (Journal_charDB.currentItemPage - 1) * MAX_ITEMS_PER_PAGE + 1
    local endIndex   = math.min(startIndex + MAX_ITEMS_PER_PAGE - 1, #displayedItems)
    local shownItems = 0

    for idx = startIndex, endIndex do
        local info = displayedItems[idx]
        shownItems = shownItems + 1
        local adjID = info.isSpecial and info.baseID or info.baseID
        local iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture
        
        -- Use GetItemInfoCustom if available, fallback to GetItemInfo
        if _G.GetItemInfoCustom then
            iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture = _G.GetItemInfoCustom(adjID)
        else
            iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iTexture = GetItemInfo(adjID)
        end
        
        if not iName then
            HandleUncachedItem(adjID, dungeon)
            iName = tostring(adjID)
            iLink = "item:" .. adjID
        end
        local color = ITEM_QUALITY_COLORS[iQuality or 1] or ITEM_QUALITY_COLORS[1]

        -- Create button first
        local btn = AcquireItemButton(dungeon.index or 9999, shownItems)
        if not btn then
            print("Failed to create button for item", shownItems)
            return
        end

        -- Get attunement and forge status
        local attuneProgress = _G.GetItemLinkAttuneProgress and _G.GetItemLinkAttuneProgress(iLink) or 0
        local attuneText = ""
        local attuneColor = {1, 1, 1} -- Default white
        local forgeLevel = 0
        
        -- Try different methods to get forge level
        if _G.GetItemAttuneForge then
            forgeLevel = _G.GetItemAttuneForge(adjID) or 0
        elseif _G.GetItemLinkTitanforge then
            forgeLevel = _G.GetItemLinkTitanforge(iLink) or 0
        end
        
        local forgeText = ""
        -- Set forge text based on level
        if forgeLevel == 1 then
            forgeText = "Titanforged"
        elseif forgeLevel == 2 then
            forgeText = "Warforged"
        elseif forgeLevel == 3 then
            forgeText = "Lightforged"
        end
        
        if attuneProgress > 0 then
            if attuneProgress >= 100 then
                attuneText = "Attuned"
                -- Set color based on forge level
                if forgeLevel == 1 then -- Titanforged
                    attuneColor = {0.5, 0.8, 1} -- Light Blue
                elseif forgeLevel == 2 then -- Warforged
                    attuneColor = {1, 0.5, 0.5} -- Light Red
                elseif forgeLevel == 3 then -- Lightforged
                    attuneColor = {1, 1, 0.5} -- Yellow
                else
                    attuneColor = {1, 1, 1} -- White for normal
                end
            else
                attuneText = "Attune in Progress - " .. string.format("%.2f", attuneProgress) .. "%"
                attuneColor = {0.5, 0.5, 0.5} -- Gray for in-progress
            end
        end

        -- Create status text
        local statusText = ""
        local statusColor = ""
        
        -- Convert color table to color string
        local function ColorTableToString(color)
            return string.format("|cFF%02X%02X%02X", color[1] * 255, color[2] * 255, color[3] * 255)
        end

        -- Get ItemLoc drop location info if available
        local dropLocationText = ""
        if _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
            dropLocationText = _G.ItemLocAPI:GetItemDropLocationText(adjID, _G.currentDungeon and _G.currentDungeon.name)
            -- Special formatting for Vault of Archavon
            if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" and dropLocationText ~= "" then
                -- Parse the drop location text to extract boss name and percentage
                local bossName, percentage = dropLocationText:match("^(.+) %- (.+)$")
                if bossName and percentage then
                    -- Truncate boss name to 17 characters
                    if string.len(bossName) > 17 then
                        bossName = string.sub(bossName, 1, 17)
                    end
                    dropLocationText = bossName .. "\n" .. percentage
                end
            end
        end

        if attuneText ~= "" then
            -- For attuned items: "Attuned - Lightforged" or just "Attuned"
            statusText = attuneText
            if forgeText ~= "" then
                statusText = statusText .. " - " .. forgeText
            end
            -- NO drop location for attuned items (too cluttered)
            statusColor = ColorTableToString(attuneColor)
        else
            -- For not attuned items: show droprate and drop source
            local droprateText = ""
            local dropSourceText = ""
            
            -- Try to get droprate when ItemLoc is available
            if ItemLocIsLoaded and ItemLocIsLoaded() and ItemLocGetSourceCount then
                local count = ItemLocGetSourceCount(adjID)
                if count and count > 0 then
                    local bestChance = 0
                    local bestSource = nil
                    
                    -- Find the best (highest chance) source
                    for i = 1, count do
                        local srcType, objType, objId, chance, dropsPerThousand, objName, zoneName, spawnedCount = ItemLocGetSourceAt(adjID, i)
                        if chance and chance > bestChance then
                            bestChance = chance
                            bestSource = objName
                        end
                    end
                    
                    if bestChance > 0 then
                        -- Check if droprate is 101 (quest/vendor flag) or >= 100
                        if bestChance >= 100 then
                            -- For Vault of Archavon, don't show quest/vendor sources at all
                            if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" then
                                droprateText = "" -- Hide completely
                            else
                                droprateText = "Quest/Vendor"
                            end
                        else
                            droprateText = string.format("%.2f%%", bestChance)
                        end
                        dropSourceText = bestSource or "Unknown"
                    end
                end
            elseif _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
                -- Fallback to wrapper if available
                local bestSource = _G.ItemLocAPI:GetBestSource(adjID, _G.currentDungeon and _G.currentDungeon.name)
                if bestSource and bestSource.chance and bestSource.chance > 0 then
                    -- Check if droprate is 101 (quest/vendor flag) or >= 100
                    if bestSource.chance >= 100 then
                        -- For Vault of Archavon, don't show quest/vendor sources at all
                        if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" then
                            droprateText = "" -- Hide completely
                        else
                            droprateText = "Quest/Vendor"
                        end
                    else
                        droprateText = string.format("%.2f%%", bestSource.chance)
                    end
                    dropSourceText = bestSource.sourceName or "Unknown"
                end
            end
            
            -- Build status text based on what info we have
            if info.fromBoss then
                -- Boss search results
                if droprateText ~= "" then
                    statusText = "From: " .. info.fromBoss .. "\n" .. droprateText
                else
                    statusText = "From: " .. info.fromBoss
                end
            elseif droprateText ~= "" then
                -- Show source and droprate
                if dropSourceText ~= "" and dropSourceText ~= "Unknown" then
                    local bossName = dropSourceText
                    -- For Vault of Archavon, truncate boss name to 17 characters max
                    if _G.currentDungeon and _G.currentDungeon.name == "Vault of Archavon" then
                        if string.len(bossName) > 17 then
                            bossName = string.sub(bossName, 1, 17)
                        end
                    end
                    statusText = bossName .. "\n" .. droprateText
                else
                    statusText = droprateText
                end
            elseif dropLocationText ~= "" and dropLocationText ~= "Unknown source" then
                -- Fallback to basic drop location if no droprate
                statusText = dropLocationText
            else
                -- Last fallback
                statusText = forgeText ~= "" and forgeText or "Unknown Source"
            end
            statusColor = "|cFFFFFFFF" -- Default white
        end

        -- Set button properties
        btn.iconTex:SetTexture(iTexture or "Interface\\Addons\\TheJournal\\Assets\\FilterIcons\\AllItems.blp")
        btn.itemText:SetText(color.hex .. iName .. "|r")
        btn.dropLocationText:SetText(statusColor .. statusText .. "|r")
        btn.dropLocationText:SetTextColor(1, 1, 1) 
        btn.dropLocationText:SetFont("Fonts\\FRIZQT__.TTF", 12, "NONE")
        
        btn.itemID = info.baseID
        btn.itemLink = iLink
        btn.baseItemID = info.baseID

        if Journal_charDB.favorites[info.baseID] then
            btn.favoriteIcon:Show()
        else
            btn.favoriteIcon:Hide()
        end

        -- Add bounty icon if item is bountied (positioned on the item icon)
        SetFrameBounty(btn, iLink, btn.iconTex)

        local col = (shownItems - 1) % NUM_COLS
        local row = math.floor((shownItems - 1) / NUM_COLS)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", itemsListContainer, "TOPLEFT", col * 185, -row * 40)
        btn:Show()

        -- Debug print to verify forge level and text
        -- print("Item:", iName, "Forge Level:", forgeLevel, "Forge Text:", forgeText, "Status Text:", statusText, "Link:", iLink)
    end

    local displayedCount = endIndex - startIndex + 1
    local rowCount       = math.ceil(displayedCount / NUM_COLS)
    itemsListContainer:SetHeight(rowCount * 40 + 10)
end

function LoadDungeonDetail(dungeon)
    if not dungeon then return end

    if not Journal_charDB.recacheScheduled then
        Journal_charDB.recacheScheduled = {}
    end

    local currentTime = GetTime()
    if Journal_charDB.viewAllItems then
        local forceRecache = false
        if not Journal_charDB.lastRecacheTime or (currentTime - Journal_charDB.lastRecacheTime) > 5 then
            forceRecache = true
        end
        if forceRecache then
            for _, d in ipairs(_G.dungeonData or {}) do
                if d.name then
                    Journal_charDB.recacheScheduled[d.name] = nil
                    if PreCacheDungeonVersion then
                        PreCacheDungeonVersion(d, nil, true)
                    end
                end
            end
            Journal_charDB.lastRecacheTime = currentTime
        end
    else
        if dungeon.name then
            Journal_charDB.recacheScheduled[dungeon.name] = nil
        end
        if PreCacheDungeonVersion then
            PreCacheDungeonVersion(dungeon, nil, true)
        end
    end

    if ShowBoss then
        ShowBoss(dungeon)
    end
    HideAllItemButtons()
    _G.currentDungeon = dungeon
    
    -- Clear drop rate cache only when switching to a different dungeon
    if _G.lastLoadedDungeon ~= dungeon.name then
        ClearDungeonDropRateCache(_G.lastLoadedDungeon)
        _G.lastLoadedDungeon = dungeon.name
    end
    
    DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_open.blp")
    previewFrame:Hide()
    dungeonDetailFrame:Show()
    ShowDungeonInteriorUI()

    local titleTextStr = dungeon.name or "Unknown Dungeon"
    dungeonTitleText:SetText(titleTextStr)

    -- Add book icon if dungeon has affix data
    if not dungeonDetailFrame.bookIcon and DUNGEON_AFFIXES[dungeon.name] then
        local bookIcon = dungeonDetailFrame:CreateTexture(nil, "OVERLAY")
        bookIcon:SetSize(24, 24)
        bookIcon:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 15)
        bookIcon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
        bookIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9) -- Crop the texture for better appearance
        dungeonDetailFrame.bookIcon = bookIcon
        
        -- Add highlight texture
        local bookHighlight = dungeonDetailFrame:CreateTexture(nil, "HIGHLIGHT")
        bookHighlight:SetSize(24, 24)
        bookHighlight:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 15)
        bookHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
        bookHighlight:SetBlendMode("ADD")
        bookHighlight:Hide()
        dungeonDetailFrame.bookHighlight = bookHighlight
        
        -- Create invisible frame for mouse interaction
        local bookFrame = CreateFrame("Frame", nil, dungeonDetailFrame)
        bookFrame:SetSize(24, 24)
        bookFrame:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 45)
        bookFrame:SetFrameLevel((dungeonDetailFrame:GetFrameLevel() or 0) + 10)
        bookFrame:EnableMouse(true)
        dungeonDetailFrame.bookFrame = bookFrame
        dungeonDetailFrame.currentDungeon = dungeon
        
        bookFrame:SetScript("OnEnter", function(self)
            
            -- Show highlight
            if dungeonDetailFrame.bookHighlight then
                dungeonDetailFrame.bookHighlight:Show()
            end
            
            -- Create custom tooltip with affix description using our dedicated tooltip
            AffixTooltip:SetOwner(self, "ANCHOR_NONE")
            AffixTooltip:ClearAllPoints()
            AffixTooltip:ClearLines()
            
            local dungeonName = dungeonDetailFrame.currentDungeon and dungeonDetailFrame.currentDungeon.name
            local affixText = DUNGEON_AFFIXES[dungeonName]
            local affixName = DUNGEON_AFFIX_NAMES[dungeonName]
            
            if affixText then
                -- Set title with custom affix name
                local title = affixName and ("|cFFFFD700" .. affixName .. "|r") or "|cFFFFD700Dungeon Affix|r"
                AffixTooltip:SetText(title, 1, 1, 1, 1, true)
                AffixTooltip:AddLine(" ") -- Empty line for spacing
                AffixTooltip:AddLine(affixText, 1, 1, 1, true) -- White text with word wrap
            else
                AffixTooltip:SetText("|cFFFFD700Dungeon Affix|r", 1, 1, 1)
                AffixTooltip:AddLine("No affix information available", 0.8, 0.8, 0.8)
            end
            
            -- Position tooltip to the left of the book icon
            AffixTooltip:SetPoint("TOPRIGHT", self, "TOPLEFT", -5, 0)
            AffixTooltip:Show()
        end)
        
        bookFrame:SetScript("OnLeave", function(self)
            -- Hide highlight
            if dungeonDetailFrame.bookHighlight then
                dungeonDetailFrame.bookHighlight:Hide()
            end
            AffixTooltip:Hide()
        end)
    elseif dungeonDetailFrame.bookIcon then
        -- Show/hide and update spell based on current dungeon
        if DUNGEON_AFFIXES[dungeon.name] then
            dungeonDetailFrame.bookIcon:Show()
            dungeonDetailFrame.bookFrame:Show()
            dungeonDetailFrame.currentDungeon = dungeon
            -- Update position in case Val_modelFrame is now available
            dungeonDetailFrame.bookIcon:ClearAllPoints()
            dungeonDetailFrame.bookIcon:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 25)
            dungeonDetailFrame.bookFrame:ClearAllPoints()
            dungeonDetailFrame.bookFrame:SetPoint("BOTTOMLEFT", _G.Val_modelFrame or dungeonDetailFrame, "BOTTOMLEFT", 15, 25)
        else
            dungeonDetailFrame.bookIcon:Hide()
            dungeonDetailFrame.bookFrame:Hide()
        end
    end

    local items = PrepareItemsToShow(dungeon)
    DisplayItemsList(dungeon, nil, items)

    if _G.lastBossNavDungeon ~= dungeon and CreateBossNavigation then
        CreateBossNavigation(dungeonDetailFrame, dungeon)
        _G.lastBossNavDungeon = dungeon
    end
end

local dungeonSearchBox = CreateFrame("EditBox", "DJ_SearchEditBox", previewFrame, "InputBoxTemplate")
dungeonSearchBox:SetSize(150, 20)
dungeonSearchBox:SetPoint("CENTER", previewFrame, "CENTER", 0, 185)
dungeonSearchBox:SetAutoFocus(false)

local dungeonButtons = {}

-- Function to calculate attunable items for a dungeon
local function CalculateDungeonAttunables(dungeon)
    if not dungeon or not dungeon.items then
        return 0, 0
    end
    
    local totalAttunable = 0
    local attunablesLeft = 0
    
    for _, itemID in ipairs(dungeon.items) do
        local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
        if canAttune == 1 then
            totalAttunable = totalAttunable + 1
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
            if attuneProgress < 100 then
                attunablesLeft = attunablesLeft + 1
            end
        end
    end
    
    return attunablesLeft, totalAttunable
end

-- Function to update attuneable text on a button
local function UpdateAttunableText(btn, dungeon)
    if not btn.attunableText then
        return
    end
    
    local attunablesLeft, totalAttunable = CalculateDungeonAttunables(dungeon)
    
    if totalAttunable > 0 then
        -- Calculate percentage of items attuned
        -- Color logic based on items left to attune
        -- 0 items left = clear green (100% attuned)
        -- Some items left but < 50% = yellow
        -- > 50% items left = red  
        -- 100% items left = deep red (0% attuned)
        local function GetColorForAttunement(attunablesLeft, totalAttunable)
            if totalAttunable == 0 then
                return 0.5, 0.5, 0.5 -- Gray for no attunable items
            end
            
            local percentageLeft = attunablesLeft / totalAttunable
            
            if percentageLeft == 0 then
                -- 100% attuned - clear green
                return 0, 1, 0
            elseif percentageLeft <= 0.5 then
                -- Less than 50% left to attune - yellow
                return 1, 1, 0
            elseif percentageLeft < 1 then
                -- More than 50% left to attune - red
                return 1, 0.3, 0
            else
                -- 100% left to attune (0% attuned) - deep red
                return 0.8, 0, 0
            end
        end
        
        local r, g, b = GetColorForAttunement(attunablesLeft, totalAttunable)
        local color = string.format("|cFF%02X%02X%02X", r * 255, g * 255, b * 255)
        
        btn.attunableText:SetText(color .. attunablesLeft .. "/" .. totalAttunable .. " Attunable|r")
        btn.attunableText:Show()
    else
        btn.attunableText:Hide()
    end
end

-- Function to refresh all attuneable text on dungeon buttons
function RefreshAllAttunableText()
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            UpdateAttunableText(btn, btn.dungeon)
        end
    end
end

-- Function to sort dungeon buttons by attunement percentage
function SortDungeonsByAttunement()
    if #dungeonButtons == 0 then return end
    
    -- Create array with buttons and their attunement data
    local buttonData = {}
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            local attunablesLeft, totalAttunable = CalculateDungeonAttunables(btn.dungeon)
            local attunementPercentage = 0
            if totalAttunable > 0 then
                attunementPercentage = attunablesLeft / totalAttunable
            end
            
            table.insert(buttonData, {
                button = btn,
                dungeon = btn.dungeon,
                attunablesLeft = attunablesLeft,
                totalAttunable = totalAttunable,
                attunementPercentage = attunementPercentage
            })
        end
    end
    
    -- Sort by attunement percentage (highest percentage of missing items first)
    table.sort(buttonData, function(a, b)
        if math.abs(a.attunementPercentage - b.attunementPercentage) > 0.001 then
            return a.attunementPercentage > b.attunementPercentage
        end
        -- If same percentage, sort by total attunable items (more items first)
        if a.totalAttunable ~= b.totalAttunable then
            return a.totalAttunable > b.totalAttunable
        end
        -- Finally, sort by dungeon name for consistency
        return (a.dungeon.name or "") < (b.dungeon.name or "")
    end)
    
    -- Reposition buttons based on new order
    for i, data in ipairs(buttonData) do
        local btn = data.button
        local col = (i - 1) % numDungeonCols
        local row = math.floor((i - 1) / numDungeonCols)
        local xOffset = col * dungeonButtonWidth
        local yOffset = -row * dungeonButtonHeight
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOffset, yOffset)
    end
    
    -- Update grid height
    local totalRows = math.ceil(#buttonData / numDungeonCols)
    gridContainer:SetHeight(totalRows * dungeonButtonHeight)
end

function UpdateDungeonNames()
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.btnText and btn.dungeon then
            local newText = (Journal_charDB.showDungeonName and btn.dungeon.name or "")
            btn.btnText:SetText(newText)
        end
    end
    -- Also refresh attuneable text when updating dungeon names
    RefreshAllAttunableText()
    -- Sort dungeons by attunement progress
    SortDungeonsByAttunement()
end

do
    local count = #dungeonData
    if count > 0 then
        local rows = math.ceil(count / numDungeonCols)
        gridContainer:SetHeight(rows * dungeonButtonHeight)
    end

    -- Create buttons in original order - will be sorted later when data is available
    for i, d in ipairs(dungeonData) do
        local btn = CreateFrame("Button", nil, gridContainer)
        btn:SetSize(dungeonButtonWidth, dungeonButtonHeight)
        btn:SetNormalTexture("")
        btn:SetPushedTexture("")
        btn:SetHighlightTexture("")

        local tex = btn:CreateTexture(nil, "BACKGROUND")
        tex:SetAllPoints(btn)
        tex:SetTexture(d.icon)
        tex:SetTexCoord(0, 0.6, 0, 0.6)
        btn.tex = tex

        local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        btnText:SetPoint("BOTTOM", btn, "BOTTOM", 0, 20)
        btnText:SetText(d.name)
        btn.btnText = btnText

        btn.dungeon = d
        local col = (i - 1) % numDungeonCols
        local row = math.floor((i - 1) / numDungeonCols)
        local xOffset = col * dungeonButtonWidth
        local yOffset = -row * dungeonButtonHeight
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOffset, yOffset)

        btn:SetScript("OnClick", function()
            if PreCacheDungeonVersion then
                PreCacheDungeonVersion(d)
            end
            LoadDungeonDetail(d)
        end)

        btn:SetScript("OnEnter", function(self)
            -- Pre-cache items on hover for better performance
            if d.items and not tempschedule[d.name] then
                tempschedule[d.name] = true
                C_Timer.After(0.1, function()
                    for i = 1, math.min(20, #d.items) do -- Pre-cache first 20 items
                        CacheItem(d.items[i])
                    end
                end)
            end
            
            self.tex:SetVertexColor(0.7, 0.7, 0.7)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -5)
            GameTooltip:SetText(d.name)
            GameTooltip:Show()
        end)

        btn:SetScript("OnLeave", function(self)
            self.tex:SetVertexColor(1, 1, 1)
            GameTooltip:Hide()
        end)

        -- Add attuneable items text
        local attunableText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        attunableText:SetPoint("BOTTOM", btn, "BOTTOM", 0, 8)
        attunableText:SetTextColor(1, 1, 1)
        btn.attunableText = attunableText

        -- Update the attuneable text for this dungeon
        UpdateAttunableText(btn, d)

        table.insert(dungeonButtons, btn)
    end
    
    -- Calculate attuneable text for all dungeons after buttons are created
    C_Timer.After(0.5, function()
        RefreshAllAttunableText()
        SortDungeonsByAttunement()
    end)
end

HideDungeonInteriorUI()
previewFrame:Show()

-- Refresh attuneable text when preview frame is shown
RefreshAllAttunableText()

-- Create small paper report button next to back button
local reportButton = CreateFrame("Button", nil, DungeonJournalFrame)
reportButton:SetSize(20, 20)
reportButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", -35, -9)

-- Create button background
local reportBg = reportButton:CreateTexture(nil, "BACKGROUND")
reportBg:SetAllPoints(reportButton)
reportBg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
reportBg:SetTexCoord(0, 0.625, 0, 0.6875)

-- Create button icon
local reportIcon = reportButton:CreateTexture(nil, "ARTWORK")
reportIcon:SetSize(16, 16)
reportIcon:SetPoint("CENTER", reportButton, "CENTER")
reportIcon:SetTexture("Interface\\Icons\\INV_Scroll_08")

-- Create highlight texture
local reportHighlight = reportButton:CreateTexture(nil, "HIGHLIGHT")
reportHighlight:SetAllPoints(reportButton)
reportHighlight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
reportHighlight:SetTexCoord(0, 0.625, 0, 0.6875)
reportHighlight:SetBlendMode("ADD")

-- Button functionality
reportButton:SetScript("OnClick", function()
    PrintAttunementReport()
end)

reportButton:SetScript("OnEnter", function(self)
    local reportData, totalLeft, totalAttunable = GenerateAttunementReport()
    if type(reportData) == "string" then
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:SetText("|cFFFFD700Attunement Report|r")
        GameTooltip:AddLine(reportData, 1, 1, 1)
        GameTooltip:Show()
        return
    end
    
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
    GameTooltip:SetText("|cFFFFD700Attunement Report|r")
    GameTooltip:AddLine(" ")
    
    -- Overall progress with progress bar effect
    local overallPercent = 0
    if totalAttunable > 0 then
        overallPercent = ((totalAttunable - totalLeft) / totalAttunable) * 100
    end
    GameTooltip:AddLine("|cFF00FF00Overall: " .. (totalAttunable - totalLeft) .. "/" .. totalAttunable .. " (" .. string.format("%.1f", overallPercent) .. "%)|r")
    GameTooltip:AddLine(" ")
    
    -- Show top 5 dungeons needing attention
    local count = 0
    for i, data in ipairs(reportData) do
        if count >= 20 then break end
        if data.totalAttunable > 0 then
            count = count + 1
            local percentLeft = data.attunementPercentage * 100
            local color = "|cFF808080"
            local status = "No Items"
            
            if data.totalAttunable == 0 then
                color = "|cFF808080"
                status = "No Items"
            elseif data.attunementPercentage == 0 then
                color = "|cFF00FF00"
                status = "Complete"
            elseif data.attunementPercentage <= 0.5 then
                color = "|cFFFFFF00"
                status = "Good Progress"
            elseif data.attunementPercentage < 1 then
                color = "|cFFFF4500"
                status = "Needs Work"
            else
                color = "|cFFCC0000"
                status = "Not Started"
            end
            
            GameTooltip:AddDoubleLine(
                color .. data.name .. "|r",
                color .. data.attunablesLeft .. "/" .. data.totalAttunable .. " (" .. string.format("%.0f", percentLeft) .. "%)|r"
            )
        end
    end

    GameTooltip:AddLine(" ")
    GameTooltip:AddLine("|cFF87CEEBClick to print full report to chat|r")
    GameTooltip:AddLine("|cFF87CEEBOr use: /dj report|r")
    GameTooltip:Show()
end)

reportButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Slash command
SLASH_DJREPORT1 = "/dj"
SlashCmdList["DJREPORT"] = function(msg)
    msg = string.lower(string.trim(msg or ""))
    if msg == "report" then
        PrintAttunementReport()
    elseif msg:find("^mythic ") then
        local itemID = tonumber(msg:match("mythic (%d+)"))
        print("|cFFFFD700[DJ Debug]|r System Status:")
        print("  GetItemTagsCustom available: " .. tostring(_G.GetItemTagsCustom ~= nil))
        
        if itemID and _G.GetItemTagsCustom then
            local itemTags1, itemTags2 = _G.GetItemTagsCustom(itemID)
            if itemTags1 then
                local isMythic = bit.band(itemTags1, 0x80) ~= 0
                print("|cFFFFD700[DJ Debug]|r Item " .. itemID .. ":")
                print("  Raw tags1: " .. tostring(itemTags1))
                print("  Raw tags2: " .. tostring(itemTags2 or "nil"))
                print("  Tags1 binary: " .. string.format("0x%X", itemTags1))
                print("  Is Mythic (0x80): " .. tostring(isMythic))
                print("  Bit check result: " .. tostring(bit.band(itemTags1, 0x80)))
                
                -- Test other common bits on first tag value
                local bits = {0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, 0x100, 0x200}
                for _, bitval in ipairs(bits) do
                    local hasbit = bit.band(itemTags1, bitval) ~= 0
                    if hasbit then
                        print("  Has bit " .. string.format("0x%X", bitval) .. ": true")
                    end
                end
            else
                print("|cFFFFD700[DJ Debug]|r Item " .. itemID .. " has no tags or GetItemTagsCustom returned nil")
            end
        else
            print("|cFFFFD700[DJ Debug]|r Usage: /dj mythic <itemID>")
            if not itemID then
                print("  Please provide a valid item ID")
            elseif not _G.GetItemTagsCustom then
                print("  GetItemTagsCustom is not available")
            end
        end
    elseif msg == "" then
        -- Open the dungeon journal
        if DungeonJournalFrame then
            if DungeonJournalFrame:IsShown() then
                DungeonJournalFrame:Hide()
            else
                DungeonJournalFrame:Show()
            end
        end
    else
        print("|cFFFFD700[Dungeon Journal]|r Available commands:")
        print("|cFF87CEEB/dj|r - Toggle Dungeon Journal")
        print("|cFF87CEEB/tj|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/j|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/ej|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/dj report|r - Show attunement progress report")
    end
end

-- Additional command registrations for shortcuts
SLASH_DJ2 = "/tj"
SLASH_DJ3 = "/j"
SLASH_DJ4 = "/ej"
SlashCmdList["DJ"] = function(msg)
    if msg == "report" then
        PrintAttunementReport()
    elseif msg == "" then
        if DungeonJournalFrame:IsShown() then
            HideJournal()
        else
            ShowJournal()
        end
    else
        print("|cFFFFD700[Dungeon Journal]|r Available commands:")
        print("|cFF87CEEB/dj|r - Toggle Dungeon Journal")
        print("|cFF87CEEB/tj|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/j|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/ej|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/dj report|r - Show attunement progress report")
    end
end

-- Create the keybind function
function ToggleJournal()
    if DungeonJournalFrame:IsShown() then
        HideJournal()
    else
        ShowJournal()
    end
end

_G.DungeonJournalFrame = DungeonJournalFrame
_G.LoadDungeonDetail   = LoadDungeonDetail
_G.UpdateDungeonNames  = UpdateDungeonNames
_G.RefreshAllAttunableText = RefreshAllAttunableText
_G.PrintAttunementReport = PrintAttunementReport

-- Add escape key functionality to close the journal
table.insert(UISpecialFrames, "DungeonJournalFrame")

dungeonSearchBox:SetScript("OnTextChanged", function(self, userInput)
    local query = self:GetText():lower()
    local filtered = {}
    for _, btn in ipairs(dungeonButtons) do
        local dName = (btn.dungeon.name or ""):lower()
        if query == "" or dName:find(query, 1, true) then
            btn:Show()
            table.insert(filtered, btn)
        else
            btn:Hide()
        end
    end
    for index, btn in ipairs(filtered) do
        local col = (index - 1) % numDungeonCols
        local row = math.floor((index - 1) / numDungeonCols)
        local xOff = col * dungeonButtonWidth
        local yOff = -row * dungeonButtonHeight
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOff, yOff)
    end
end)

-- Function to generate attunement report
function GenerateAttunementReport()
    if #dungeonButtons == 0 then return "No dungeons available." end
    
    local reportData = {}
    local globalUniqueItems = {} -- Track unique items across all dungeons
    local globalAttunedItems = {} -- Track attuned unique items
    
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.dungeon then
            local attunablesLeft, dungeonTotal = CalculateDungeonAttunables(btn.dungeon)
            local attunementPercentage = 0
            if dungeonTotal > 0 then
                attunementPercentage = attunablesLeft / dungeonTotal
            end
            
            -- Collect unique items from this dungeon for global calculation
            if btn.dungeon.items then
                for _, itemID in ipairs(btn.dungeon.items) do
                    local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
                    if canAttune == 1 then
                        globalUniqueItems[itemID] = true
                        local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
                        if attuneProgress >= 100 then
                            globalAttunedItems[itemID] = true
                        end
                    end
                end
            end
            
            table.insert(reportData, {
                name = btn.dungeon.name or "Unknown",
                attunablesLeft = attunablesLeft,
                totalAttunable = dungeonTotal,
                attunementPercentage = attunementPercentage
            })
        end
    end
    
    -- Calculate actual unique totals
    local totalUniqueAttunable = 0
    local totalUniqueAttuned = 0
    
    for itemID, _ in pairs(globalUniqueItems) do
        totalUniqueAttunable = totalUniqueAttunable + 1
        if globalAttunedItems[itemID] then
            totalUniqueAttuned = totalUniqueAttuned + 1
        end
    end
    
    local totalUniqueLeft = totalUniqueAttunable - totalUniqueAttuned
    
    -- Sort for report display
    table.sort(reportData, function(a, b)
        if math.abs(a.attunementPercentage - b.attunementPercentage) > 0.001 then
            return a.attunementPercentage > b.attunementPercentage
        end
        if a.totalAttunable ~= b.totalAttunable then
            return a.totalAttunable > b.totalAttunable
        end
        return a.name < b.name
    end)
    
    return reportData, totalUniqueLeft, totalUniqueAttunable
end

-- Function to print report to chat
function PrintAttunementReport()
    local reportData, totalLeft, totalAttunable = GenerateAttunementReport()
    if type(reportData) == "string" then
        print("|cFFFFD700[DJ Report]|r " .. reportData)
        return
    end
    
    print("|cFFFFD700=== ATTUNEMENT REPORT ===|r")
    print("|cFF00FF00Overall Progress: " .. (totalAttunable - totalLeft) .. "/" .. totalAttunable .. " items attuned|r")
    
    for i, data in ipairs(reportData) do
        local percentLeft = data.attunementPercentage * 100
        local color = "|cFF808080" -- Gray default
        
        if data.totalAttunable == 0 then
            color = "|cFF808080" -- Gray for no items
        elseif data.attunementPercentage == 0 then
            color = "|cFF00FF00" -- Green for complete
        elseif data.attunementPercentage <= 0.5 then
            color = "|cFFFFFF00" -- Yellow for good progress
        elseif data.attunementPercentage < 1 then
            color = "|cFFFF4500" -- Orange-red for needs work
        else
            color = "|cFFCC0000" -- Deep red for not started
        end
        
        print(color .. i .. ". " .. data.name .. ": " .. data.attunablesLeft .. "/" .. data.totalAttunable .. " left (" .. string.format("%.1f", percentLeft) .. "%)|r")
    end
end

-- Removed duplicate SortDungeonsByAttunement function (now defined earlier)

-- Function to show/hide the journal
function ShowJournal()
    if DungeonJournalFrame then
        DungeonJournalFrame:Show()
        -- Sort dungeons immediately when showing
        RefreshAllAttunableText()
        SortDungeonsByAttunement()
    end
end

function HideJournal()
    if DungeonJournalFrame then
        DungeonJournalFrame:Hide()
    end
end

-- Update the slash command to use the new functions
SlashCmdList["DJ"] = function(msg)
    if msg == "report" then
        PrintAttunementReport()
    elseif msg == "" then
        if DungeonJournalFrame:IsShown() then
            HideJournal()
        else
            ShowJournal()
        end
    else
        print("|cFFFFD700[Dungeon Journal]|r Available commands:")
        print("|cFF87CEEB/dj|r - Toggle Dungeon Journal")
        print("|cFF87CEEB/tj|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/j|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/ej|r - Toggle Dungeon Journal (shortcut)")
        print("|cFF87CEEB/dj report|r - Show attunement progress report")
    end
end

-- Update the back button to use the new functions
backButton:SetScript("OnClick", function()
    if dungeonDetailFrame:IsShown() then
        -- Restore the main interface background when returning to preview
        DungeonJournalFrame.BackgroundTexture:SetTexture("Interface\\AddOns\\TheJournal\\Assets\\interface_base.blp")
        dungeonDetailFrame:Hide()
        previewFrame:Show()
        HideDungeonInteriorUI()
        -- Refresh attuneable text and sort when returning to main screen
        RefreshAllAttunableText()
        SortDungeonsByAttunement()
    elseif previewFrame:IsShown() then
        if RuneCollection then RuneCollection:Show() end
        HideJournal()
    end
end)

-- Update the keybind function to use the new functions
function ToggleJournal()
    if DungeonJournalFrame:IsShown() then
        HideJournal()
    else
        ShowJournal()
    end
end

-- Make functions globally accessible
_G.ShowJournal = ShowJournal
_G.HideJournal = HideJournal
_G.ToggleJournal = ToggleJournal
