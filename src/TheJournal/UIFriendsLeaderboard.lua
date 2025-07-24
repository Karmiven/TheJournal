-- ##################################################################
-- # UIFriendsLeaderboard.lua
-- # ʕ •ᴥ•ʔ✿ Friends Leaderboard Management ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIFriendsLeaderboard = {}

-- ʕ •ᴥ•ʔ✿ Create Friends Attunement frame ✿ʕ•ᴥ•ʔ
local UIParent = UIParent
local CreateFrame = CreateFrame
local GameTooltip = GameTooltip

local friendsFrame = CreateFrame("Frame", "AttunementFriendsFrame", UIParent)
friendsFrame:SetSize(250, 400)
friendsFrame:SetPoint("TOPRIGHT", UIParent, "TOPLEFT", -10, -20)
friendsFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 32, edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
friendsFrame:SetBackdropColor(0.1, 0.1, 0.2, 0.8)
friendsFrame:SetBackdropBorderColor(0.4, 0.4, 0.6, 1)
friendsFrame:EnableMouse(true)

-- ʕ •ᴥ•ʔ✿ Frame title ✿ʕ•ᴥ•ʔ
local friendsTitle = friendsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
friendsTitle:SetPoint("TOP", friendsFrame, "TOP", 0, -8)
friendsTitle:SetText("|cFFFFD700Attunement Leaderboard|r")

-- ʕ •ᴥ•ʔ✿ Friends toggle button creation disabled - handled in UIFrames.lua ✿ʕ•ᴥ•ʔ
--[[
local friendsToggleButton = CreateFrame("Button", "DJ_FriendsToggleButton", UIParent)
friendsToggleButton:SetSize(44, 44)
friendsToggleButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, 0)
friendsToggleButton:SetFrameLevel(UIParent:GetFrameLevel() + 10)
--]]

--[[
local toggleIcon = friendsToggleButton:CreateTexture(nil, "ARTWORK")
toggleIcon:SetSize(20, 20)
toggleIcon:SetPoint("CENTER", friendsToggleButton, "CENTER")
toggleIcon:SetTexture("")
toggleIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local toggleHighlight = friendsToggleButton:CreateTexture(nil, "HIGHLIGHT")
toggleHighlight:SetSize(24, 24)
toggleHighlight:SetPoint("CENTER", friendsToggleButton, "CENTER")
toggleHighlight:SetTexture("")
toggleHighlight:SetBlendMode("ADD")

friendsToggleButton:SetScript("OnClick", function()
    if friendsFrame:IsShown() then
        friendsFrame:Hide()
        toggleIcon:SetDesaturated(true)
    else
        friendsFrame:Show()
        toggleIcon:SetDesaturated(false)
        UpdateAttunementFriendsDisplay()
    end
end)

friendsToggleButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("|cFFFFD700Friends Leaderboard|r")
    GameTooltip:AddLine("Click to show/hide the attunement leaderboard", 1, 1, 1)
    GameTooltip:Show()
end)

friendsToggleButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)
--]]

-- ʕ •ᴥ•ʔ✿ Refresh button ✿ʕ•ᴥ•ʔ
local refreshButton = CreateFrame("Button", nil, friendsFrame)
refreshButton:SetSize(20, 20)
refreshButton:SetPoint("TOPRIGHT", friendsFrame, "TOPRIGHT", -8, -8)

local refreshIcon = refreshButton:CreateTexture(nil, "ARTWORK")
refreshIcon:SetSize(16, 16)
refreshIcon:SetPoint("CENTER", refreshButton, "CENTER")
refreshIcon:SetTexture("Interface\\Icons\\Ability_Druid_Cyclone")
refreshIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

local refreshHighlight = refreshButton:CreateTexture(nil, "HIGHLIGHT")
refreshHighlight:SetSize(20, 20)
refreshHighlight:SetPoint("CENTER", refreshButton, "CENTER")
refreshHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
refreshHighlight:SetBlendMode("ADD")

refreshButton:SetScript("OnClick", function()
    RequestAttunementData()
    SendAttunementData()
end)

refreshButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("|cFFFFD700Refresh Leaderboard|r")
    GameTooltip:AddLine("Click to request fresh data from friends", 1, 1, 1)
    GameTooltip:Show()
end)

refreshButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

-- Export the module
_G.TheJournal_UIFriendsLeaderboard = UIFriendsLeaderboard

return UIFriendsLeaderboard
