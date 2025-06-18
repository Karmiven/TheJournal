local ADDON_NAME = ...
Journal_charDB = Journal_charDB or {}

local settings = Journal_charDB or {}
--------------------------------------------------------------------
-- CONFIG PANEL SETUP (Stand-alone, not in Interface Options)
--------------------------------------------------------------------
local configPanel = CreateFrame("Frame", "Journal_charDB_ConfigPanel", UIParent)
configPanel:SetSize(500, 400)
configPanel:SetPoint("CENTER")
configPanel:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
configPanel:SetBackdropColor(0, 0, 0, 1)
configPanel:EnableMouse(true)
configPanel:SetMovable(true)
configPanel:EnableKeyboard(true)
configPanel:SetScript("OnMouseDown", function(self) self:StartMoving() end)
configPanel:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
configPanel:Hide() -- Hidden by default

-- Title text
local titleText = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", configPanel, "TOP", 0, -20)
titleText:SetText("Dungeon Journal Options")

-- Close Button (upper-right corner)
local closeButton = CreateFrame("Button", nil, configPanel, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", configPanel, "TOPRIGHT", -5, -5)

-- "Show Dungeon Name" Option
local showDungeonNameLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
showDungeonNameLabel:SetPoint("TOPLEFT", configPanel, "TOPLEFT", 20, -60)
showDungeonNameLabel:SetText("Show Dungeon Name: " .. (settings.showDungeonName and "Enabled" or "Disabled"))

local showDungeonNameCheckbox = CreateFrame("CheckButton", "Journal_charDB_ShowDungeonName_CheckButton", configPanel,
    "InterfaceOptionsCheckButtonTemplate")
showDungeonNameCheckbox:SetPoint("LEFT", showDungeonNameLabel, "RIGHT", 10, 0)
showDungeonNameCheckbox:SetText("")
showDungeonNameCheckbox:SetChecked(settings.showDungeonName)
showDungeonNameCheckbox:SetScript("OnClick", function(self)
    settings.showDungeonName = self:GetChecked()
    local status = settings.showDungeonName and "Enabled" or "Disabled"
    showDungeonNameLabel:SetText("Show Dungeon Name: " .. status)
    print("Show Dungeon Name is now", status)
end)

-- "Use ItemLoc Database" Option
local useItemLocLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
useItemLocLabel:SetPoint("TOPLEFT", showDungeonNameLabel, "BOTTOMLEFT", 0, -30)
-- Initialize setting if not set
if settings.useItemLocData == nil then
    settings.useItemLocData = true -- Default to enabled
end
useItemLocLabel:SetText("Use ItemLoc Database: " .. (settings.useItemLocData and "Enabled" or "Disabled"))

local useItemLocCheckbox = CreateFrame("CheckButton", "Journal_charDB_UseItemLoc_CheckButton", configPanel,
    "InterfaceOptionsCheckButtonTemplate")
useItemLocCheckbox:SetPoint("LEFT", useItemLocLabel, "RIGHT", 10, 0)
useItemLocCheckbox:SetText("")
useItemLocCheckbox:SetChecked(settings.useItemLocData)
useItemLocCheckbox:SetScript("OnClick", function(self)
    settings.useItemLocData = self:GetChecked()
    local status = settings.useItemLocData and "Enabled" or "Disabled"
    useItemLocLabel:SetText("Use ItemLoc Database: " .. status)
    print("ItemLoc Database integration is now", status)
    print("Reload the interface or re-open dungeons to see changes")
end)

-- Recache instructions and button (placed below the ItemLoc option)
local recacheLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
recacheLabel:SetPoint("TOPLEFT", useItemLocLabel, "BOTTOMLEFT", 0, -30)
recacheLabel:SetText("Re-cache Data: Press the button below to reset cached data.")

local recacheButton = CreateFrame("Button", "Journal_charDB_RecacheButton", configPanel, "UIPanelButtonTemplate")
recacheButton:SetPoint("TOP", recacheLabel, "BOTTOM", 0, -10)
recacheButton:SetSize(140, 25)
recacheButton:SetText("Reset Cache")
recacheButton:SetScript("OnClick", function()
    settings.hasAlreadyCached = false
    settings.cached = {} -- clear the cached table
    print("Cache has been reset.")
end)


--------------------------------------------------------------------
-- TOGGLE CONFIG PANEL FUNCTION
--------------------------------------------------------------------
function Journal_charDB_ToggleConfig()
    if Journal_charDB_ConfigPanel:IsShown() then
        Journal_charDB_ConfigPanel:Hide()
    else
        Journal_charDB_ConfigPanel:Show()
    end
end

_G.Journal_charDB_ToggleConfig = Journal_charDB_ToggleConfig

SLASH_VDJ1 = "/djc"
SlashCmdList["DJC"] = function(msg)
    if _G.Journal_charDB_ToggleConfig then
        _G.Journal_charDB_ToggleConfig()
    end
end
