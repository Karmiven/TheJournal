-- ##################################################################
-- # UIFriendsManager.lua - Friends System Handling
-- # ʕ •ᴥ•ʔ✿ Manage UI for Friends Integration ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIFriendsManager = {}

-- ʕ •ᴥ•ʔ✿ Friends entry frames storage ✿ʕ•ᴥ•ʔ
local friendEntries = {}

local function VectorToColorString(r, g, b)
    r = math.max(0, math.min(1, r or 1))
    g = math.max(0, math.min(1, g or 1))
    b = math.max(0, math.min(1, b or 1))
    return "|cFF" .. string.format("%02x", math.floor(r * 255)) .. string.format("%02x", math.floor(g * 255)) .. string.format("%02x", math.floor(b * 255))
end

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

local function CreateFriendEntry(index)
    -- Get references from global scope since they may not be available at module load time
    local scrollChild = _G.FriendsAttunementScrollFrame and _G.FriendsAttunementScrollFrame:GetScrollChild()
    if not scrollChild then
        -- Fallback: try to find it in the global scope
        scrollChild = _G.scrollChild
        if not scrollChild then
            print("|cFFFF0000[DJ Friends]|r Error: scrollChild not found!")
            return nil
        end
    end
    
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
    entry.crownIcon = entry:CreateTexture(nil, "OVERLAY")
    entry.crownIcon:SetSize(24, 24)
    entry.crownIcon:SetPoint("RIGHT", entry.nameText, "RIGHT", 64, -24)
    entry.crownIcon:SetTexture("Interface\\Addons\\TheJournal\\Assets\\ui_jailerstower_defense.blp")
    entry.crownIcon:Hide()
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
        if self.playerData.dungeonDetails and #self.playerData.dungeonDetails > 0 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFB347Top 20 Dungeons Needed:|r")
            local count = 0
            for i, dungeonData in ipairs(self.playerData.dungeonDetails) do
                if count >= 20 then break end
                if dungeonData.attunablesLeft > 0 then
                    count = count + 1
                    local percentLeft = dungeonData.attunementPercentage * 100
                    local color = "|cFF808080"
                    if dungeonData.attunementPercentage == 0 then
                        color = "|cFF00FF00"
                    elseif dungeonData.attunementPercentage <= 0.5 then
                        color = "|cFFFFFF00"
                    elseif dungeonData.attunementPercentage < 1 then
                        color = "|cFFFF4500"
                    else
                        color = "|cFFCC0000"
                    end
                    GameTooltip:AddDoubleLine(
                        color .. "• " .. dungeonData.name .. "|r",
                        color .. dungeonData.attunablesLeft .. "/" .. dungeonData.totalAttunable .. " (" .. string.format("%.0f", percentLeft) .. "%)|r"
                    )
                end
            end
            if count == 0 and self.playerData.top3Dungeons and #self.playerData.top3Dungeons > 0 then
                for i, dungeonName in ipairs(self.playerData.top3Dungeons) do
                    if i <= 3 then
                        GameTooltip:AddLine("• " .. dungeonName, 1, 1, 0.8)
                    end
                end
            end
        elseif self.playerData.top3Dungeons and #self.playerData.top3Dungeons > 0 then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFB347Top Dungeons Needed:|r")
            for i, dungeonName in ipairs(self.playerData.top3Dungeons) do
                if i <= 3 then
                    GameTooltip:AddLine("• " .. dungeonName, 1, 1, 0.8)
                end
            end
        end
        GameTooltip:Show()
    end)
    entry:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
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

function UIFriendsManager.UpdateAttunementFriendsDisplay()
    -- ʕ ● ᴥ ●ʔ✿ DISABLED: UIFrames.lua handles friend display to prevent duplication ✿ʕ ● ᴥ ●ʔ
    -- ʕノ•ᴥ•ʔノ✿ Delegate to global function to prevent duplicate entries ✿ʕノ•ᴥ•ʔノ
    if _G.UpdateAttunementFriendsDisplay then
        return _G.UpdateAttunementFriendsDisplay()
    end
    
    print("|cFFFF0000[DJ Friends Manager]|r Global UpdateAttunementFriendsDisplay not available!")
end

--[[ ʕ •ᴥ•ʔ✿ DISABLED TO PREVENT DUPLICATE QUEST ICONS ✿ʕ•ᴥ•ʔ
function UIFriendsManager.UpdateAttunementFriendsDisplay_DISABLED()
    -- ʕ •ᴥ•ʔ✿ Ensure we have our own data first ✿ʕ•ᴥ•ʔ
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
    end
    
    -- ʕ •ᴥ•ʔ✿ Get scroll child reference ✿ʕ•ᴥ•ʔ
    local scrollChild = _G.FriendsAttunementScrollFrame and _G.FriendsAttunementScrollFrame:GetScrollChild()
    if not scrollChild then
        scrollChild = _G.scrollChild
        if not scrollChild then
            print("|cFFFF0000[DJ Friends]|r Error: scrollChild not found in UpdateAttunementFriendsDisplay!")
            return
        end
    end
    
    -- ʕ •ᴥ•ʔ✿ Debug: Check if we have any friends data ✿ʕ•ᴥ•ʔ
    local totalFriends = 0
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        totalFriends = totalFriends + 1
    end
    
    if totalFriends == 0 then
        -- ʕ •ᴥ•ʔ✿ No friends data available. Adding self silently ✿ʕ •ᴥ•ʔ
        if _G.AddSelfToFriendsData then
            _G.AddSelfToFriendsData()
        end
        -- Recount after adding self
        totalFriends = 0
        for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
            totalFriends = totalFriends + 1
        end
        -- ʕ •ᴥ•ʔ✿ After adding self, total friends: " .. totalFriends .. " silently ✿ʕ •ᴥ•ʔ
    end
    
    -- ʕ •ᴥ•ʔ✿ Ensure player data is in global friends data ✿ʕ•ᴥ•ʔ
    local playerName = UnitName("player")
    if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
        if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
            _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
        end
    end
    
    -- ʕ •ᴥ•ʔ✿ Build sorted friends list ✿ʕ•ᴥ•ʔ
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
    
    -- ʕ •ᴥ•ʔ✿ Sort by percentage descending ✿ʕ•ᴥ•ʔ
    table.sort(sortedFriends, function(a, b)
        if a.percentage ~= b.percentage then
            return a.percentage > b.percentage
        end
        return a.playerName < b.playerName
    end)
    
    print("|cFFFFD700[DJ Friends]|r Displaying " .. #sortedFriends .. " friends in leaderboard")
    
    -- ʕ •ᴥ•ʔ✿ Create/update friend entries ✿ʕ•ᴥ•ʔ
    local currentYOffset = 0
    for i = 1, math.max(#sortedFriends, #friendEntries) do
        if i <= #sortedFriends then
            if not friendEntries[i] then
                friendEntries[i] = CreateFriendEntry(i)
                if not friendEntries[i] then
                    -- ʕ •ᴥ•ʔ✿ Failed to create friend entry " .. i .. " silently ✿ʕ •ᴥ•ʔ
                    return
                end
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
            entry.dungeonsText:SetText("|cFFFFD700Journal Points: " .. journalPoints .. "|r")
            
            local hasQuestItem = (friendData.questItemID and friendData.questItemID > 0)
            entry:UpdateHeight(hasQuestItem, journalPoints > 0)
            
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

-- ʕ •ᴥ•ʔ✿ Don't override global UpdateAttunementFriendsDisplay - handled in UIFrames.lua ✿ʕ•ᴥ•ʔ
-- _G.UpdateAttunementFriendsDisplay = UIFriendsManager.UpdateAttunementFriendsDisplay

-- ʕ •ᴥ•ʔ✿ Export UIFriendsManager to global scope ✿ʕ•ᴥ•ʔ
_G.TheJournal_UIFriendsManager = UIFriendsManager

return UIFriendsManager 

