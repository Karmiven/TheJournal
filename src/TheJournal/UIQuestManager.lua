-- ##################################################################
-- # UIQuestManager.lua - Consolidated Quest Management System
-- # ʕ •ᴥ•ʔ✿ Complete quest system with UI and logic ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIQuestManager = {}

-- ʕ •ᴥ•ʔ✿ UI Frame References ✿ʕ•ᴥ•ʔ
local questPopoutFrame = nil
local questItemButton = nil
local questItemIcon = nil
local questItemText = nil
local questSourceText = nil
local questPointsText = nil
local randomQuestIcon = nil
local previewQuestIcon = nil

-- ʕ •ᴥ•ʔ✿ Quest Rolling Configuration ✿ʕ•ᴥ•ʔ
local MAX_ROLL_ATTEMPTS = 100 -- Prevent infinite loops
local ROLL_BATCH_SIZE = 10 -- Check multiple items per attempt

-- ʕ ◕ᴥ◕ ʔ✿ Faction Checking for Quest Items ✿ʕ ◕ᴥ◕ ʔ
local function IsItemFactionCompatible(itemID)
    -- ʕ ● ᴥ ●ʔ✿ Check if item is faction-specific ✿ʕ ● ᴥ ●ʔ
    if not _G.hashFactionItems or not itemID then
        return true -- If no faction data, assume it's compatible
    end

    local itemFaction = _G.hashFactionItems[itemID]
    if not itemFaction then
        return true -- Not faction-specific, so it's compatible
    end

    -- ʕノ•ᴥ•ʔノ✿ Get player's faction ✿ʕノ•ᴥ•ʔノ
    local playerFaction = UnitFactionGroup("player")

    -- ＼ʕ •ᴥ•ʔ／✿ Check compatibility ✿＼ʕ •ᴥ•ʔ／
    if itemFaction == 1 and playerFaction == "Alliance" then
        return true -- Alliance item for Alliance player
    elseif itemFaction == 2 and playerFaction == "Horde" then
        return true -- Horde item for Horde player
    else
        return false -- Faction mismatch
    end
end

-- ʕ ● ᴥ ●ʔ✿ Check if item is valid for quest ✿ʕ ● ᴥ ●ʔ
local function IsItemValidForQuest(itemID)
    if not itemID or itemID <= 0 then
        return false
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Check if item exists and is attunable ✿ʕ ◕ᴥ◕ ʔ
    local canAttune = _G.CanAttuneItemHelper and _G.CanAttuneItemHelper(itemID) or 0
    if canAttune ~= 1 then
        return false
    end

    -- ʕ ● ᴥ ●ʔ✿ Check attunement progress ✿ʕ ● ᴥ ●ʔ
    local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
    if attuneProgress >= 100 then
        return false
    end

    -- ʕノ•ᴥ•ʔノ✿ Check faction compatibility ✿ʕノ•ᴥ•ʔノ
    if not IsItemFactionCompatible(itemID) then
        return false
    end

    -- ʕ ● ᴥ ●ʔ✿ Check if item has sources ✿ʕ ● ᴥ ●ʔ
    local hasSource = false
    if _G.ItemLocAPI and _G.ItemLocAPI:IsLoaded() then
        local bestSource = _G.ItemLocAPI:GetBestSource(itemID)
        hasSource = bestSource and bestSource.chance and bestSource.chance > 0
    elseif _G.ItemLocGetSourceCount then
        local sourceCount = _G.ItemLocGetSourceCount(itemID) or 0
        hasSource = sourceCount > 0
    else
        -- If no source checking available, assume it has sources
        hasSource = true
    end

    return hasSource
end

-- ʕ ● ᴥ ●ʔ✿ Get Random Unattuned Item with Efficient Rolling ✿ʕ ● ᴥ ●ʔ
function UIQuestManager.GetRandomUnattunedItem()
    local attempts = 0
    local checkedItems = {}

    while attempts < MAX_ROLL_ATTEMPTS do
        attempts = attempts + 1

        -- ʕ ◕ᴥ◕ ʔ✿ Generate a batch of random item IDs ✿ʕ ◕ᴥ◕ ʔ
        for i = 1, ROLL_BATCH_SIZE do
            local randomItemID = random(1, MAX_ITEMID)

            -- ʕ ● ᴥ ●ʔ✿ Skip if we've already checked this item ✿ʕ ● ᴥ ●ʔ
            if not checkedItems[randomItemID] then
                checkedItems[randomItemID] = true

                -- ʕノ•ᴥ•ʔノ✿ Check if this item is valid for quest ✿ʕノ•ᴥ•ʔノ
                if IsItemValidForQuest(randomItemID) then
                    -- ʕ ● ᴥ ●ʔ✿ Find the dungeon source for this item ✿ʕ ● ᴥ ●ʔ
                    local sourceName = "Unknown Source"
                    if _G.dungeonData then
                        for _, dungeon in ipairs(_G.dungeonData) do
                            if dungeon.items then
                                for _, itemID in ipairs(dungeon.items) do
                                    if itemID == randomItemID then
                                        sourceName = dungeon.name
                                        break
                                    end
                                end
                                if sourceName ~= "Unknown Source" then
                                    break
                                end
                            end
                        end
                    end

                    return randomItemID, sourceName
                end
            end
        end
    end

    -- ʕ ◕ᴥ◕ ʔ✿ If we couldn't find a valid item, show a message ✿ʕ ◕ᴥ◕ ʔ
    local playerFaction = UnitFactionGroup("player")
    print("|cFFFF8000[Quest Warning]|r Could not find a " .. playerFaction .. "-compatible quest item after " .. (MAX_ROLL_ATTEMPTS * ROLL_BATCH_SIZE) .. " attempts")

    return nil, "No faction-compatible items found"
end

-- ʕノ•ᴥ•ʔノ✿ Start Random Quest ✿ʕノ•ᴥ•ʔノ
function UIQuestManager.StartRandomQuest()
    if Journal_charDB.currentRandomQuest then
        UIQuestManager.CompleteRandomQuest()
    end

    local itemID, sourceName = UIQuestManager.GetRandomUnattunedItem()
    if not itemID then
        print("|cFFFFD700[Random Quest]|r No items available for random quest!")
        if sourceName and sourceName:find("faction-compatible") then
            local playerFaction = UnitFactionGroup("player")
            print("|cFFFF8000[Random Quest]|r Unable to find " .. playerFaction .. "-compatible quest items. Try again later.")
        end
        return nil
    end

    Journal_charDB.currentRandomQuest = {
        itemID = itemID,
        sourceName = sourceName,
        startTime = GetTime(),
        initialProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(itemID) or 0
    }

    local itemName = _G.GetItemInfoCustom and _G.GetItemInfoCustom(itemID) or GetItemInfo(itemID) or ("Item " .. itemID)

    -- ʕ ◕ᴥ◕ ʔ✿ Show faction compatibility info ✿ʕ ◕ᴥ◕ ʔ
    local factionMessage = ""
    if _G.hashFactionItems and _G.hashFactionItems[itemID] then
        local itemFaction = _G.hashFactionItems[itemID]
        local factionName = (itemFaction == 1) and "|cFF0080FFAlliance|r" or "|cFFFF0000Horde|r"
        factionMessage = " |cFF888888(" .. factionName .. " faction)|r"
    end

    print("|cFF00FF00[Random Quest Started]|r Attune " .. itemName .. factionMessage .. "!")
    print("|cFF87CEEB[Random Quest]|r Source: " .. sourceName)

    UIQuestManager.UpdateCurrentQuestDisplay()
    return itemID
end

-- ＼ʕ •ᴥ•ʔ／✿ Complete Random Quest ✿＼ʕ •ᴥ•ʔ／
function UIQuestManager.CompleteRandomQuest()
    if not Journal_charDB.currentRandomQuest then return false end

    local quest = Journal_charDB.currentRandomQuest
    local finalProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
    local initialProgress = quest.initialProgress or 0

    if finalProgress >= 100 then
        local points = (initialProgress < 100) and 10 or 1
        Journal_charDB.journalPoints = (Journal_charDB.journalPoints or 0) + points
        Journal_charDB.currentRandomQuest = nil

        local itemName = _G.GetItemInfoCustom and _G.GetItemInfoCustom(quest.itemID) or GetItemInfo(quest.itemID) or ("Item " .. quest.itemID)
        print("|cFF00FF00[Quest Complete!]|r +" .. points .. " Journal Points for attuning " .. itemName .. "!")
        print("|cFFFFD700[Journal Points]|r Total: " .. Journal_charDB.journalPoints)

        if Journal_charDB.shareQuestCompletion then
            local playerName = UnitName("player")
            local completionMessage = "[DJ Quest Complete] " .. playerName .. " completed random quest: " .. itemName .. " (Total Points: " .. Journal_charDB.journalPoints .. ")"
            SendChatMessage(completionMessage, "GUILD")
        end

        if _G.SendAttunementData then
            _G.SendAttunementData()
        end

        UIQuestManager.UpdateCurrentQuestDisplay()
        return true
    end

    return false
end

-- ʕ •ᴥ•ʔ✿ Initialize Quest UI ✿ʕ•ᴥ•ʔ
function UIQuestManager.InitializeUI()
    if not _G.DungeonJournalFrame then
        -- ʕ •ᴥ•ʔ✿ DungeonJournalFrame not available yet silently ✿ʕ •ᴥ•ʔ
        return
    end

    -- ʕ •ᴥ•ʔ✿ Check if already initialized to prevent duplicates ✿ʕ•ᴥ•ʔ
    if randomQuestIcon then
        -- ʕ •ᴥ•ʔ✿ Quest UI already initialized, skipping silently ✿ʕ •ᴥ•ʔ
        return
    end

    -- ʕ •ᴥ•ʔ✿ Create Random Quest Icon (only show in dungeon detail) ✿ʕ •ᴥ•ʔ
    randomQuestIcon = CreateFrame("Button", "DJ_RandomQuestIcon", _G.DungeonJournalFrame)
    randomQuestIcon:SetSize(24, 24)
    randomQuestIcon:SetPoint("BOTTOMRIGHT", _G.dungeonDetailFrame or _G.DungeonJournalFrame, "BOTTOMRIGHT", 60, -75)
    randomQuestIcon:SetFrameStrata("FULLSCREEN")
    randomQuestIcon:SetFrameLevel(_G.DungeonJournalFrame:GetFrameLevel() + 20)
    randomQuestIcon:Hide() -- Hidden by default, only show in dungeon detail
    
    -- ʕ •ᴥ•ʔ✿ Mark as journal UI element for tooltip forcer identification ✿ʕ•ᴥ•ʔ
    randomQuestIcon.isJournalUIElement = true

    local questIconTexture = randomQuestIcon:CreateTexture(nil, "ARTWORK")
    questIconTexture:SetSize(24, 24)
    questIconTexture:SetPoint("CENTER", randomQuestIcon, "CENTER")
    questIconTexture:SetTexture("Interface\\Icons\\INV_Scroll_03")
    questIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)

    local questIconHighlight = randomQuestIcon:CreateTexture(nil, "HIGHLIGHT")
    questIconHighlight:SetSize(24, 24)
    questIconHighlight:SetPoint("CENTER", randomQuestIcon, "CENTER")
    questIconHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    questIconHighlight:SetBlendMode("ADD")

    randomQuestIcon:RegisterForClicks("LeftButtonUp")

    -- ʕ •ᴥ•ʔ✿ Create Preview Quest Icon (only show in dungeon detail) ✿ʕ •ᴥ•ʔ
    -- ʕ ◕ᴥ◕ ʔ✿ Wait for previewFrame to be available, fallback to DungeonJournalFrame ✿ʕ ◕ᴥ◕ ʔ
    local previewFrame = _G.DungeonDetailFrame

    UIQuestManager.CreatePreviewQuestIcon(previewFrame)

    -- ʕ •ᴥ•ʔ✿ Create Quest Popout Frame ✿ʕ •ᴥ•ʔ
    questPopoutFrame = CreateFrame("Frame", "DJ_QuestPopoutFrame", _G.DungeonJournalFrame)
    questPopoutFrame:SetSize(220, 90)
    questPopoutFrame:SetPoint("TOPLEFT", _G.DungeonJournalFrame, "TOPRIGHT", -220, -425)
    questPopoutFrame:SetFrameStrata("FULLSCREEN")
    questPopoutFrame:SetFrameLevel(15) -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Reasonable level instead of potentially high level ✿ʕ•ᴥ•ʔ
    questPopoutFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
    })
    questPopoutFrame:SetBackdropColor(0.1, 0.1, 0.2, 0.9)
    questPopoutFrame:SetBackdropBorderColor(0.4, 0.4, 0.6, 1)
    questPopoutFrame:EnableMouse(true)
    questPopoutFrame:Hide()

    -- ʕ •ᴥ•ʔ✿ Create Quest Refresh Button ✿ʕ •ᴥ•ʔ
    local questRefreshButton = CreateFrame("Button", "DJ_QuestRefreshButton", questPopoutFrame)
    questRefreshButton:SetSize(20, 20)
    questRefreshButton:SetPoint("TOPRIGHT", questPopoutFrame, "TOPRIGHT", -5, -5)

    local refreshIcon = questRefreshButton:CreateTexture(nil, "ARTWORK")
    refreshIcon:SetSize(16, 16)
    refreshIcon:SetPoint("CENTER", questRefreshButton, "CENTER")
    refreshIcon:SetTexture("Interface\\Icons\\INV_Misc_Dice_01")
    refreshIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

    local refreshHighlight = questRefreshButton:CreateTexture(nil, "HIGHLIGHT")
    refreshHighlight:SetSize(20, 20)
    refreshHighlight:SetPoint("CENTER", questRefreshButton, "CENTER")
    refreshHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    refreshHighlight:SetBlendMode("ADD")

    questRefreshButton:SetScript("OnClick", function()
        if Journal_charDB.currentRandomQuest then
            UIQuestManager.StartRandomQuest() -- Re-roll current quest
        end
    end)

    questRefreshButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("|cFFFFD700Re-roll Quest|r")
        GameTooltip:AddLine("Click to get a new random item quest", 1, 1, 1)
        GameTooltip:Show()
    end)

    questRefreshButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    UIQuestManager.CreateQuestItemButton()
    UIQuestManager.SetupEventHandlers()

    _G.questPopoutFrame = questPopoutFrame
    _G.randomQuestIcon = randomQuestIcon
    _G.previewQuestIcon = previewQuestIcon
end

-- ʕ ● ᴥ ●ʔ✿ Create Quest Item Button ✿ʕ ● ᴥ ●ʔ
function UIQuestManager.CreateQuestItemButton()
    questItemButton = CreateFrame("Button", "DJ_QuestItemButton", questPopoutFrame)
    questItemButton:SetSize(205, 32)
    questItemButton:SetPoint("TOPLEFT", questPopoutFrame, "TOPLEFT", 8, -12)
    questItemButton:EnableMouse(true)

    -- ʕ •ᴥ•ʔ✿ Create quest item icon with proper display ✿ʕ•ᴥ•ʔ
    questItemIcon = questItemButton:CreateTexture(nil, "ARTWORK")
    questItemIcon:SetSize(30, 30)
    questItemIcon:SetPoint("LEFT", questItemButton, "LEFT", 2, 0)
    questItemIcon:SetTexture("Interface\\Icons\\INV_Scroll_03") -- Default icon
    questItemIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9) -- Crop edges permanently
    questItemIcon:Show() -- ʕ ◕ᴥ◕ ʔ✿ Ensure icon is visible ✿ʕ ◕ᴥ◕ ʔ

    questItemText = questItemButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    questItemText:SetPoint("LEFT", questItemIcon, "RIGHT", 5, 0)
    questItemText:SetPoint("RIGHT", questItemButton, "RIGHT", -5, 0)
    questItemText:SetJustifyH("LEFT")
    questItemText:SetWordWrap(true)
    questItemText:SetNonSpaceWrap(true)

    questSourceText = questPopoutFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    questSourceText:SetPoint("TOPLEFT", questItemButton, "BOTTOMLEFT", 5, -2)
    questSourceText:SetPoint("RIGHT", questPopoutFrame, "RIGHT", -10, 0)
    questSourceText:SetJustifyH("LEFT")

    questPointsText = questPopoutFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    questPointsText:SetPoint("TOPLEFT", questSourceText, "BOTTOMLEFT", 0, -8)
    questPointsText:SetText("|cFFFFD700Journal Points: 0|r")

    questItemButton:RegisterForClicks("LeftButtonUp")
    questItemButton.itemLink = nil
    questItemButton.baseItemID = nil

    questItemButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        elseif button == "LeftButton" and IsAltKeyDown() and self.baseItemID then
            if _G.OpenLootDb then
                OpenLootDb(self.baseItemID)
            end
        end
    end)

    questItemButton:SetScript("OnEnter", function(self)
        -- Tooltip
        if self.itemLink then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:Show()
        end
    end)

    questItemButton:SetScript("OnLeave", function(self)
        -- No scale reset needed; icon is permanently cropped
        GameTooltip:Hide()
    end)
end

-- ʕ •ᴥ•ʔ✿ Update Current Quest Display ✿ʕ •ᴥ•ʔ
function UIQuestManager.UpdateCurrentQuestDisplay()
    if not questPointsText then return end

    questPointsText:SetText("|cFFFFD700Journal Points: " .. (Journal_charDB.journalPoints or 0) .. "|r")

    if Journal_charDB.currentRandomQuest then
        local quest = Journal_charDB.currentRandomQuest

        -- Try native API first – it returns the full 10-value tuple when cached
        local itemName, itemLink, iQuality, _, _, _, _, _, _, iTexture = GetItemInfo(quest.itemID)

        -- If not cached yet, fall back to any custom helper just for name/texture
        if not itemName and GetItemInfoCustom then
            itemName, _, iQuality, _, _, _, _, _, _, iTexture = GetItemInfoCustom(quest.itemID)
        end

        -- Guarantee sensible defaults so tooltip and colouring always have data
        if not itemName then
            itemName = "Item " .. quest.itemID
        end
        if not itemLink then
            itemLink = "item:" .. quest.itemID
        end
        if not iQuality then
            iQuality = 1
        end
        if not iTexture or iTexture == "" then
            iTexture = "Interface\\Icons\\INV_Misc_QuestionMark"
        end

        local colorTbl = ITEM_QUALITY_COLORS[iQuality or 1] or ITEM_QUALITY_COLORS[1]
        local colorHex = colorTbl and colorTbl.hex or "|cFFFFFFFF"

        questItemIcon:SetTexture(iTexture)
        questItemIcon:Show()
        questItemText:SetText(colorHex .. itemName .. "|r")
        questSourceText:SetText("|cFF888888Source: " .. quest.sourceName .. "|r")

        questItemButton.itemLink = itemLink
        questItemButton.baseItemID = quest.itemID

        local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
        if attuneProgress >= 100 then
            questSourceText:SetText("|cFF00FF00Quest Complete! Click to claim reward.|r")
        end

        -- NEW: update quest popout border color based on item quality
        if questPopoutFrame and colorTbl then
            questPopoutFrame:SetBackdropBorderColor(colorTbl.r, colorTbl.g, colorTbl.b, 1)
        end
    else
        questItemIcon:SetTexture("Interface\\Icons\\INV_Scroll_03")
        questItemIcon:Show() -- ʕ •ᴥ•ʔ✿ Ensure icon is visible even with no quest ✿ʕ•ᴥ•ʔ
        questItemText:SetText("|cFFFFFFFFNo Active Quest|r")
        questSourceText:SetText("|cFF888888Click to get a random item quest|r")
        questItemButton.itemLink = nil
        questItemButton.baseItemID = nil

        -- NEW: reset border color to default when no active quest
        if questPopoutFrame then
            questPopoutFrame:SetBackdropBorderColor(0.4, 0.4, 0.6, 1)
        end
    end
end

-- ʕノ•ᴥ•ʔノ✿ Toggle Quest Popout ✿ʕノ•ᴥ•ʔノ
function UIQuestManager.ToggleQuestPopout()
    if not questPopoutFrame then return end

    if questPopoutFrame:IsShown() then
        questPopoutFrame:Hide()
    else
        UIQuestManager.UpdateCurrentQuestDisplay()
        questPopoutFrame:Show()
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Setup Event Handlers ✿＼ʕ •ᴥ•ʔ／
function UIQuestManager.SetupEventHandlers()
    questPopoutFrame:SetScript("OnMouseDown", function()
        if Journal_charDB.currentRandomQuest then
            if UIQuestManager.CompleteRandomQuest() then
                UIQuestManager.UpdateCurrentQuestDisplay()
            else
                local quest = Journal_charDB.currentRandomQuest
                local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
                local itemName = _G.GetItemInfoCustom and _G.GetItemInfoCustom(quest.itemID) or GetItemInfo(quest.itemID) or ("Item " .. quest.itemID)
                print("|cFFFFFF00[Random Quest]|r " .. itemName .. " progress: " .. string.format("%.1f", attuneProgress) .. "%")
            end
        else
            UIQuestManager.StartRandomQuest()
            UIQuestManager.UpdateCurrentQuestDisplay()
        end
    end)

    -- ʕ •ᴥ•ʔ✿ Quest icon click handlers with modifier key support ✿ʕ•ᴥ•ʔ
    local function HandleQuestIconClick(self, button)
        if button == "LeftButton" then
            if IsShiftKeyDown() then
                -- Shift+Click: Start new random quest
                UIQuestManager.StartRandomQuest()
                UIQuestManager.UpdateCurrentQuestDisplay()
                if questPopoutFrame:IsShown() then
                    UIQuestManager.UpdateCurrentQuestDisplay()
                end
            elseif IsAltKeyDown() then
                -- Alt+Click: Complete current quest if possible
                if Journal_charDB.currentRandomQuest then
                    if UIQuestManager.CompleteRandomQuest() then
                        UIQuestManager.UpdateCurrentQuestDisplay()
                    end
                end
            else
                -- Normal click: Toggle quest popout
                UIQuestManager.ToggleQuestPopout()
            end
        end
    end

    randomQuestIcon:SetScript("OnClick", HandleQuestIconClick)
    previewQuestIcon:SetScript("OnClick", HandleQuestIconClick)

    -- ʕ •ᴥ•ʔ✿ Enhanced tooltips with modifier key info ✿ʕ•ᴥ•ʔ
    local function ShowQuestIconTooltip(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("|cFFFFD700Random Item Quest|r")
        GameTooltip:AddLine("Click to view your quest progress", 1, 1, 1)
        GameTooltip:AddLine("|cFF87CEEBShift+Click:|r Start new random quest", 0.8, 0.8, 1)
        GameTooltip:AddLine("|cFF87CEEBAlt+Click:|r Complete current quest", 0.8, 0.8, 1)
        GameTooltip:AddLine("Journal Points: " .. (Journal_charDB.journalPoints or 0), 1, 1, 0)

        -- Show current quest info if available
        if Journal_charDB.currentRandomQuest then
            local quest = Journal_charDB.currentRandomQuest
            local itemName = _G.GetItemInfoCustom and _G.GetItemInfoCustom(quest.itemID) or GetItemInfo(quest.itemID) or ("Item " .. quest.itemID)
            local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFFFFD700Current Quest:|r " .. itemName, 1, 1, 1)
            GameTooltip:AddLine("|cFF888888Progress:|r " .. string.format("%.1f", attuneProgress) .. "%", 1, 1, 1)
        end

        GameTooltip:Show()
    end

    randomQuestIcon:SetScript("OnEnter", ShowQuestIconTooltip)
    previewQuestIcon:SetScript("OnEnter", ShowQuestIconTooltip)

    randomQuestIcon:SetScript("OnLeave", function(self) 
        -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only hide tooltip if it belongs to this icon ✿ʕ•ᴥ•ʔ
        if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
            GameTooltip:Hide() 
        end
    end)
    previewQuestIcon:SetScript("OnLeave", function(self) 
        -- ʕ •ᴥ•ʔ✿ CRITICAL FIX: Only hide tooltip if it belongs to this icon ✿ʕ•ᴥ•ʔ
        if GameTooltip:IsShown() and GameTooltip:GetOwner() == self then
            GameTooltip:Hide() 
        end
    end)

    -- ʕ •ᴥ•ʔ✿ Visibility control based on UI state ✿ʕ•ᴥ•ʔ
    local function UpdateQuestIconVisibility()
        -- Only show quest icons when in dungeon detail view
        local isDungeonDetail = _G.dungeonDetailFrame and _G.dungeonDetailFrame:IsShown()

        if randomQuestIcon then
            if isDungeonDetail then
                randomQuestIcon:Show()
            else
                randomQuestIcon:Hide()
            end
        end

        if previewQuestIcon then
            if isDungeonDetail then
                previewQuestIcon:Hide()
            else
                previewQuestIcon:Show()
            end
        end
    end

    -- ʕ •ᴥ•ʔ✿ Auto-check for quest completion ✿ʕ•ᴥ•ʔ
    local questCheckFrame = CreateFrame("Frame")
    questCheckFrame:RegisterEvent("CHAT_MSG_SYSTEM")
    questCheckFrame:SetScript("OnEvent", function(self, event, message)
        if event == "CHAT_MSG_SYSTEM" and message and Journal_charDB.currentRandomQuest then
            if message:find("attuned") or message:find("Attunement") then
                C_Timer.After(1, function()
                    UIQuestManager.CompleteRandomQuest()
                end)
            end
        end
    end)

    -- ʕ •ᴥ•ʔ✿ Initialize quest display on login ✿ʕ•ᴥ•ʔ
    local initFrame = CreateFrame("Frame")
    initFrame:RegisterEvent("PLAYER_LOGIN")
    initFrame:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_LOGIN" then
            C_Timer.After(2, function()
                UIQuestManager.UpdateCurrentQuestDisplay()
                UpdateQuestIconVisibility()
                if Journal_charDB.currentRandomQuest then
                    UIQuestManager.CompleteRandomQuest()
                end
            end)
        end
    end)

    -- ʕ •ᴥ•ʔ✿ Store visibility function globally ✿ʕ•ᴥ•ʔ
    _G.UpdateQuestIconVisibility = UpdateQuestIconVisibility

    -- NEW: refresh quest display once item information becomes available (ensures quality colour & tooltip link)
    local infoListener = CreateFrame("Frame")
    infoListener:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    infoListener:SetScript("OnEvent", function(_, _, receivedItemID, success)
        if success and Journal_charDB.currentRandomQuest and receivedItemID == Journal_charDB.currentRandomQuest.itemID then
            -- Re-draw with full item data now cached
            UIQuestManager.UpdateCurrentQuestDisplay()
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Hook Functions ✿ʕ•ᴥ•ʔ
function UIQuestManager.HookExistingFunctions()
    -- ʕ •ᴥ•ʔ✿ DISABLED: Prevent double-hooking LoadDungeonDetail (already hooked in UIFrames.lua) ✿ʕ•ᴥ•ʔ
    -- This was causing tooltip interference due to chained hooks with timers
    --[[
    local originalLoadDungeonDetail = _G.LoadDungeonDetail
    if originalLoadDungeonDetail then
        _G.LoadDungeonDetail = function(dungeon, isPagination)
            local result = originalLoadDungeonDetail(dungeon, isPagination)

            -- Update quest display after loading dungeon detail
            C_Timer.After(0.1, function()
                UIQuestManager.UpdateCurrentQuestDisplay()

                -- Show only the in-dungeon icon and hide preview icon
                if randomQuestIcon then
                    randomQuestIcon:Show()
                end
                if previewQuestIcon then
                    previewQuestIcon:Hide()
                end
            end)

            return result
        end
    end
    --]]

    -- ʕ •ᴥ•ʔ✿ Hook back button to hide quest icons when leaving dungeon detail ✿ʕ•ᴥ•ʔ
    local originalHideDungeonInteriorUI = _G.HideDungeonInteriorUI
    if originalHideDungeonInteriorUI then
        _G.HideDungeonInteriorUI = function()
            originalHideDungeonInteriorUI()

            -- Hide quest icons when leaving dungeon detail
            if randomQuestIcon then
                randomQuestIcon:Hide()
            end
            if previewQuestIcon then
                previewQuestIcon:Hide()
            end
            if questPopoutFrame then
                questPopoutFrame:Hide()
            end
        end
    end

    -- ʕ •ᴥ•ʔ✿ Hook ShowPreview to hide quest icons ✿ʕ•ᴥ•ʔ
    local originalShowPreview = _G.ShowPreview
    if originalShowPreview then
        _G.ShowPreview = function()
            originalShowPreview()

            -- Hide quest icons when returning to preview
            if randomQuestIcon then
                randomQuestIcon:Hide()
            end
            if previewQuestIcon then
                previewQuestIcon:Show()
            end
            if questPopoutFrame then
                questPopoutFrame:Hide()
            end
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Friends Data Management ✿ʕ•ᴥ•ʔ
function UIQuestManager.SaveFriendsData()
    if not Journal_charDB then return end

    Journal_charDB.friendsAttunementData = Journal_charDB.friendsAttunementData or {}
    Journal_charDB.friendsJournalPoints = Journal_charDB.friendsJournalPoints or {}

    if _G.FRIENDS_ATTUNEMENT_DATA then
        for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
            Journal_charDB.friendsAttunementData[playerName] = data
        end
    end

    if _G.FRIENDS_JOURNAL_POINTS then
        for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
            Journal_charDB.friendsJournalPoints[playerName] = points
        end
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Debounced Save System ✿ʕ ◕ᴥ◕ ʔ
local saveDebounce = {
    timer = nil,
    pending = false,
    lastSave = 0,
    minInterval = 2
}

function UIQuestManager.DebouncedSave()
    if not saveDebounce.pending then
        saveDebounce.pending = true
        saveDebounce.timer = C_Timer.After(1, function()
            if GetTime() - saveDebounce.lastSave >= saveDebounce.minInterval then
                UIQuestManager.SaveFriendsData()
                saveDebounce.lastSave = GetTime()
            end
            saveDebounce.pending = false
        end)
    end
end

-- ʕ •ᴥ•ʔ✿ Initialize the Quest System ✿ʕ•ᴥ•ʔ
function UIQuestManager.Initialize()
    Journal_charDB.journalPoints = Journal_charDB.journalPoints or 0
    Journal_charDB.currentRandomQuest = Journal_charDB.currentRandomQuest or nil

    UIQuestManager.InitializeUI()
    UIQuestManager.HookExistingFunctions()

    -- ʕ •ᴥ•ʔ✿ Quest system loaded silently ✿ʕ •ᴥ•ʔ
end

-- ʕ ● ᴥ ●ʔ✿ Global Functions Export ✿ʕ ● ᴥ ●ʔ
_G.TheJournal_UIQuestManager = UIQuestManager
_G.GetRandomUnattunedItem = UIQuestManager.GetRandomUnattunedItem
_G.StartRandomQuest = UIQuestManager.StartRandomQuest
_G.CompleteRandomQuest = UIQuestManager.CompleteRandomQuest
_G.UpdateCurrentQuestDisplay = UIQuestManager.UpdateCurrentQuestDisplay
_G.ToggleQuestPopout = UIQuestManager.ToggleQuestPopout
_G.SaveFriendsData = UIQuestManager.SaveFriendsData
_G.DebouncedSave = UIQuestManager.DebouncedSave

-- ʕ •ᴥ•ʔ✿ Create Preview Quest Icon Function ✿ʕ •ᴥ•ʔ
function UIQuestManager.CreatePreviewQuestIcon(parentFrame)
    if previewQuestIcon then return end -- Already created

    previewQuestIcon = CreateFrame("Button", "DJ_PreviewQuestIcon", parentFrame)
    previewQuestIcon:SetSize(24, 24)
    previewQuestIcon:SetPoint("BOTTOMRIGHT", parentFrame, "BOTTOMRIGHT", -50, -45)
    previewQuestIcon:SetFrameStrata("FULLSCREEN")
    previewQuestIcon:SetFrameLevel((parentFrame:GetFrameLevel() or 0) + 20)
    previewQuestIcon:Hide() -- Hidden by default, only show in dungeon detail
    
    -- ʕ •ᴥ•ʔ✿ Mark as journal UI element for tooltip forcer identification ✿ʕ•ᴥ•ʔ
    previewQuestIcon.isJournalUIElement = true

    local previewIconTexture = previewQuestIcon:CreateTexture(nil, "ARTWORK")
    previewIconTexture:SetSize(24, 24)
    previewIconTexture:SetPoint("CENTER", previewQuestIcon, "CENTER")
    previewIconTexture:SetTexture("Interface\\Icons\\INV_Scroll_03")
    previewIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)

    local previewIconHighlight = previewQuestIcon:CreateTexture(nil, "HIGHLIGHT")
    previewIconHighlight:SetSize(24, 24)
    previewIconHighlight:SetPoint("CENTER", previewQuestIcon, "CENTER")
    previewIconHighlight:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    previewIconHighlight:SetBlendMode("ADD")

    previewQuestIcon:RegisterForClicks("LeftButtonUp")

    _G.previewQuestIcon = previewQuestIcon
end

return UIQuestManager
