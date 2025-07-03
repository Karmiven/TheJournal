-- ##################################################################
-- # UIFriendsFrame.lua - Friends Attunement Frame and Leaderboard
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Friends Attunement Frame Module ✿ʕ•ᴥ•ʔ

local FriendsFrame = {}

-- ʕ ◕ᴥ◕ ʔ✿ Create Friends Attunement frame in the main UI ✿ʕ ◕ᴥ◕ ʔ
local parentFrame = DungeonJournalFrame or UIParent -- Fallback if DungeonJournalFrame is nil
local friendsFrame = CreateFrame("Frame", "AttunementFriendsFrame", parentFrame)
friendsFrame:SetSize(250, 400)
friendsFrame:SetPoint("TOPRIGHT", parentFrame, "TOPLEFT", -10, -20)
friendsFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 32, edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
friendsFrame:SetBackdropColor(0.1, 0.1, 0.2, 0.8)
friendsFrame:SetBackdropBorderColor(0.4, 0.4, 0.6, 1)
friendsFrame:EnableMouse(true)

-- ʕ ● ᴥ ●ʔ✿ Frame title ✿ʕ ● ᴥ ●ʔ
local friendsTitle = friendsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
friendsTitle:SetPoint("TOP", friendsFrame, "TOP", 0, -8)
friendsTitle:SetText("|cFFFFD700Attunement Leaderboard|r")

-- ʕノ•ᴥ•ʔノ✿ Toggle button creation disabled - handled in UIFrames.lua ✿ʕノ•ᴥ•ʔノ
--[[
local friendsToggleButton = CreateFrame("Button", "DJ_FriendsToggleButton", parentFrame)
friendsToggleButton:SetSize(44, 44)
friendsToggleButton:SetPoint("TOPLEFT", parentFrame, "TOPLEFT", 0, 0)
friendsToggleButton:SetFrameLevel(parentFrame:GetFrameLevel() + 10)

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
--]]

-- ＼ʕ •ᴥ•ʔ／✿ Refresh button with custom icon design ✿＼ʕ •ᴥ•ʔ／
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

-- ʕ •ᴥ•ʔ✿ Scroll frame for friends list ✿ʕ •ᴥ•ʔ
local scrollFrame = CreateFrame("ScrollFrame", "FriendsAttunementScrollFrame", friendsFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", friendsFrame, "TOPLEFT", 10, -35)
scrollFrame:SetPoint("BOTTOMRIGHT", friendsFrame, "BOTTOMRIGHT", -30, 10)

local scrollChild = CreateFrame("Frame", nil, scrollFrame)
scrollChild:SetSize(210, 1)
scrollFrame:SetScrollChild(scrollChild)

-- ʕ ◕ᴥ◕ ʔ✿ Table to store friend entry frames ✿ʕ ◕ᴥ◕ ʔ
local friendEntries = {}

-- ʕ ● ᴥ ●ʔ✿ Function to convert vector color to WoW color string format ✿ʕ ● ᴥ ●ʔ
local function VectorToColorString(r, g, b)
    r = math.max(0, math.min(1, r or 1))
    g = math.max(0, math.min(1, g or 1))
    b = math.max(0, math.min(1, b or 1))
    
    local rHex = string.format("%02x", math.floor(r * 255))
    local gHex = string.format("%02x", math.floor(g * 255))
    local bHex = string.format("%02x", math.floor(b * 255))
    return "|cFF" .. rHex .. gHex .. bHex
end

-- ʕノ•ᴥ•ʔノ✿ Dynamic class color function ✿ʕノ•ᴥ•ʔノ
local function GetClassColor(classId)
    if not classId or type(classId) ~= "number" then 
        return "|cFFFFFFFF" 
    end
    
    if _G.CustomGetClassColor then
        local r, g, b = _G.CustomGetClassColor(classId)
        if r and g and b then
            return VectorToColorString(r, g, b)
        end
    end
    
    return "|cFFFFFFFF"
end

-- ＼ʕ •ᴥ•ʔ／✿ Function to create a friend entry frame ✿＼ʕ •ᴥ•ʔ／
local function CreateFriendEntry(index)
    local entry = CreateFrame("Frame", nil, scrollChild)
    entry:SetSize(210, 50)
    
    entry.rankText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    entry.rankText:SetPoint("TOPLEFT", entry, "TOPLEFT", 2, -2)
    entry.rankText:SetWidth(20)
    entry.rankText:SetJustifyH("LEFT")
    
    entry.nameText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    entry.nameText:SetPoint("TOPLEFT", entry, "TOPLEFT", 25, -5)
    entry.nameText:SetWidth(120)
    entry.nameText:SetJustifyH("LEFT")
    
    entry.percentageText = entry:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    entry.percentageText:SetPoint("TOPRIGHT", entry, "TOPRIGHT", -5, -5)
    entry.percentageText:SetWidth(60)
    entry.percentageText:SetJustifyH("RIGHT")
    
    entry.progressText = entry:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    entry.progressText:SetPoint("TOPLEFT", entry.nameText, "BOTTOMLEFT", 0, -2)
    entry.progressText:SetWidth(180)
    entry.progressText:SetJustifyH("LEFT")
    
    entry.dungeonsText = entry:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    entry.dungeonsText:SetPoint("TOPLEFT", entry.progressText, "BOTTOMLEFT", 0, -2)
    entry.dungeonsText:SetWidth(200)
    entry.dungeonsText:SetJustifyH("LEFT")
    
    entry.timeText = entry:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    entry.timeText:SetPoint("BOTTOMRIGHT", entry, "BOTTOMRIGHT", -5, 2)
    entry.timeText:SetWidth(60)
    entry.timeText:SetJustifyH("RIGHT")
    entry.timeText:Hide()
    
    entry.crownIcon = entry:CreateTexture(nil, "OVERLAY")
    entry.crownIcon:SetSize(24, 24)
    entry.crownIcon:SetPoint("RIGHT", entry.nameText, "RIGHT", 64, -24)
    entry.crownIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    entry.crownIcon:Hide()

    entry.questItemButton = CreateFrame("Button", nil, entry)
    entry.questItemButton:SetSize(16, 16)
    entry.questItemButton:SetPoint("TOPLEFT", entry.nameText, "BOTTOMLEFT", -22, 0)
    entry.questItemButton:RegisterForClicks("LeftButtonUp")
    entry.questItemButton:Hide()
    
    entry.questItemIcon = entry.questItemButton:CreateTexture(nil, "ARTWORK")
    entry.questItemIcon:SetSize(16, 16)
    entry.questItemIcon:SetPoint("CENTER", entry.questItemButton, "CENTER")
    entry.questItemIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    
    FriendsFrame.SetupEntryTooltips(entry)
    
    entry.UpdateHeight = function(self, hasQuestItem, hasJournalPoints)
        local baseHeight = 45
        local extraHeight = 0
        
        if hasQuestItem or hasJournalPoints then
            extraHeight = extraHeight + 18
        end
        
        self:SetHeight(baseHeight + extraHeight)
    end
    
    return entry
end

-- ʕ •ᴥ•ʔ✿ Setup entry tooltips ✿ʕ •ᴥ•ʔ
function FriendsFrame.SetupEntryTooltips(entry)
    entry.questItemButton:SetScript("OnEnter", function(self)
        if self.itemLink then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:Show()
        end
    end)
    
    entry.questItemButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
    
    entry.questItemButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        end
    end)
    
    entry:EnableMouse(true)
    entry:SetScript("OnEnter", function(self)
        if not self.playerData then return end
        
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("|cFFFFD700" .. self.playerData.playerName .. "|r")
        
        if self.playerData.isPlayer then
            GameTooltip:AddLine("|cFF00FF00You|r", 1, 1, 1)
        elseif self.playerData.lastSeen then
            GameTooltip:AddLine("|cFF888888Last seen: " .. self.playerData.lastSeen .. "|r", 1, 1, 1)
        end
        
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Progress: " .. self.playerData.attuned .. "/" .. self.playerData.total .. " (" .. self.playerData.percentage .. "%)", 1, 1, 1)
        
        local journalPoints = 0
        if self.playerData.isPlayer then
            journalPoints = Journal_charDB.journalPoints or 0
        else
            journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[self.playerData.playerName] or 0
        end
        
        if journalPoints > 0 then
            GameTooltip:AddLine("Journal Points: " .. journalPoints, 1, 1, 0)
        end
        
        GameTooltip:Show()
    end)
    
    entry:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
end

-- ʕ ◕ᴥ◕ ʔ✿ Function to update the friends display ✿ʕ ◕ᴥ◕ ʔ
-- ʕ ● ᴥ ●ʔ✿ DISABLED: UIFrames.lua handles friend display to prevent duplication ✿ʕ ● ᴥ ●ʔ
function FriendsFrame.UpdateAttunementFriendsDisplay()
    -- ʕノ•ᴥ•ʔノ✿ Delegate to global function to prevent duplicate entries ✿ʕノ•ᴥ•ʔノ
    if _G.UpdateAttunementFriendsDisplay then
        return _G.UpdateAttunementFriendsDisplay()
    end
    
    print("|cFFFF0000[DJ Friends Frame]|r Global UpdateAttunementFriendsDisplay not available!")
end

--[[ ʕ •ᴥ•ʔ✿ DISABLED TO PREVENT DUPLICATE QUEST ICONS ✿ʕ•ᴥ•ʔ
function FriendsFrame.UpdateAttunementFriendsDisplay_DISABLED()
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
    end
    
    local playerName = UnitName("player")
    if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
        if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
            _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
        end
    end
    
    local sortedFriends = {}
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        local journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[playerName] or 0
        table.insert(sortedFriends, {
            playerName = playerName,
            classId = data.classId,
            attuned = data.attuned,
            total = data.total,
            percentage = data.percentage,
            missingBOE = data.missingBOE,
            top3Dungeons = data.top3Dungeons,
            lastSeen = data.lastSeen,
            lastSeenTime = data.lastSeenTime,
            timestamp = data.timestamp,
            isPlayer = data.isPlayer,
            journalPoints = journalPoints,
            questItemID = data.questItemID
        })
    end
    
    table.sort(sortedFriends, function(a, b)
        if a.percentage ~= b.percentage then
            return a.percentage > b.percentage
        end
        return a.playerName < b.playerName
    end)
    
    local currentYOffset = 0
    for i = 1, math.max(#sortedFriends, #friendEntries) do
        if i <= #sortedFriends then
            if not friendEntries[i] then
                friendEntries[i] = CreateFriendEntry(i)
            end
            
            local entry = friendEntries[i]
            local friendData = sortedFriends[i]
            
            entry:ClearAllPoints()
            entry:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, -currentYOffset)
            
            entry.playerData = friendData
            
            local rankColor = "|cFF888888"
            if i == 1 then rankColor = "|cFFFFD700"
            elseif i == 2 then rankColor = "|cFFC0C0C0"
            elseif i == 3 then rankColor = "|cFFCD7F32"
            end
            entry.rankText:SetText(rankColor .. "#" .. i .. "|r")
            
            local classColor = GetClassColor(friendData.classId)
            local nameText = friendData.playerName
            if friendData.isPlayer then
                nameText = nameText .. " (You)"
            end
            
            if i == 1 and #sortedFriends > 1 then
                entry.crownIcon:Show()
            else
                entry.crownIcon:Hide()
            end
            entry.nameText:SetText(classColor .. nameText .. "|r")

            local percentageColor = "|cFFFF4500"
            if i == 1 and #sortedFriends > 1 then
                percentageColor = "|cFFFFD700"
            elseif friendData.percentage >= 90 then
                percentageColor = "|cFF00FF00"
            elseif friendData.percentage >= 75 then
                percentageColor = "|cFF7FFF00"
            elseif friendData.percentage >= 50 then
                percentageColor = "|cFFFFFF00"
            elseif friendData.percentage >= 25 then
                percentageColor = "|cFFFF8000"
            end
            
            entry.percentageText:SetText(percentageColor .. friendData.percentage .. "%|r")
            entry.progressText:SetText("|cFF888888" .. friendData.attuned .. "/" .. friendData.total .. " items attuned|r")
            
            local journalPoints = _G.FRIENDS_JOURNAL_POINTS and _G.FRIENDS_JOURNAL_POINTS[friendData.playerName] or 0
            local questText = ""
            
            if friendData.questItemID and friendData.questItemID > 0 then
                local itemName, itemLink, quality, _, _, _, _, _, _, iTexture
                if _G.GetItemInfoCustom then
                    itemName, itemLink, quality, _, _, _, _, _, _, iTexture = _G.GetItemInfoCustom(friendData.questItemID)
                else
                    itemName, itemLink, quality, _, _, _, _, _, _, iTexture = GetItemInfo(friendData.questItemID)
                end
                
                if itemName then
                    local qualityColor = ITEM_QUALITY_COLORS[quality or 1] or ITEM_QUALITY_COLORS[1]
                    questText = qualityColor.hex .. itemName .. "|r"
                    
                    entry.questItemIcon:SetTexture(iTexture or "Interface\\Icons\\INV_Misc_QuestionMark")
                    entry.questItemButton.itemLink = itemLink
                    entry.questItemButton:Show()
                else
                    questText = "|cFFFFFFFFItem " .. friendData.questItemID .. "|r"
                    entry.questItemIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
                    entry.questItemButton.itemLink = "item:" .. friendData.questItemID
                    entry.questItemButton:Show()
                end
                
                if journalPoints > 0 then
                    questText = questText .. " \\n|cFFFFD700Journal Points: " .. journalPoints .. "|r"
                end
            else
                entry.questItemButton:Hide()
                entry.questItemButton.itemLink = nil
                
                if journalPoints > 0 then
                    questText = "|cFFFFD700Journal Points: " .. journalPoints .. "|r"
                else
                    questText = "|cFF888888No active quest|r"
                end
            end
            
            entry.dungeonsText:SetText(questText)
            
            local hasQuestItem = (friendData.questItemID and friendData.questItemID > 0)
            local hasJournalPoints = (journalPoints > 0)
            entry:UpdateHeight(hasQuestItem, hasJournalPoints)
            
            currentYOffset = currentYOffset + entry:GetHeight() + 3
            
            entry:Show()
        else
            if friendEntries[i] then
                friendEntries[i]:Hide()
            end
        end
    end
    
    local contentHeight = math.max(1, currentYOffset)
    scrollChild:SetHeight(contentHeight)
end
--]] -- ʕ •ᴥ•ʔ✿ END DISABLED SECTION ✿ʕ•ᴥ•ʔ

-- ʕ ● ᴥ ●ʔ✿ Setup event handlers ✿ʕ ● ᴥ ●ʔ
function FriendsFrame.SetupEventHandlers()
    -- Get the friends toggle button created in UIFrames.lua
    local friendsToggleButton = _G.DJ_FriendsToggleButton
    local toggleIcon = friendsToggleButton and friendsToggleButton.toggleIcon
    
    if friendsToggleButton then
        friendsToggleButton:SetScript("OnClick", function()
            if friendsFrame:IsShown() then
                friendsFrame:Hide()
                if toggleIcon then toggleIcon:SetDesaturated(true) end
            else
                friendsFrame:Show()
                if toggleIcon then toggleIcon:SetDesaturated(false) end
                -- ʕ •ᴥ•ʔ✿ Use global function to ensure compatibility ✿ʕ•ᴥ•ʔ
                if _G.UpdateAttunementFriendsDisplay then
                    _G.UpdateAttunementFriendsDisplay()
                else
                    FriendsFrame.UpdateAttunementFriendsDisplay()
                end
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
    end

    refreshButton:SetScript("OnClick", function()
        if _G.RequestAttunementData then
            _G.RequestAttunementData()
        end
        if _G.SendAttunementData then
            _G.SendAttunementData()
        end
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
end

-- ʕノ•ᴥ•ʔノ✿ Initialize the friends frame ✿ʕノ•ᴥ•ʔノ
function FriendsFrame.Initialize()
    FriendsFrame.SetupEventHandlers()
    
    -- Initialize display immediately with cached data
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
    end
    
    FriendsFrame.UpdateAttunementFriendsDisplay()
    
    if _G.RequestAttunementData then
        _G.RequestAttunementData()
    end
    if _G.SendAttunementData then
        _G.SendAttunementData()
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Disable auto-initialization to prevent conflicts with UIFrames.lua ✿＼ʕ •ᴥ•ʔ／
-- The main UIFrames.lua handles all initialization to avoid conflicts

print("|cFF00FF00[DJ Friends Frame]|r Friends attunement frame loaded!")

-- NOTE: Do not assign this module to a global here to avoid clobbering
-- existing modules (e.g. TheJournal_UIFriendsAttunement). If external
-- access is required, expose specific functions explicitly elsewhere.

_G.AttunementFriendsFrame = friendsFrame
