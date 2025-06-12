-- ##################################################################
-- # BOSS DISPLAY & NAVIGATION
-- ##################################################################
-- This module handles displaying a boss's model, its associated story popup,
-- and provides navigation (left/right) between bosses in a dungeon.
--
-- Note: It assumes that some globals exist (e.g., dungeonDetailFrame, Journal_charDB, debugPrint)
-- and that other modules (Utility.lua, Core.lua) have been loaded.

-- Create a hidden model frame for pre-loading models.
local preloadModelFrame = CreateFrame("PlayerModel", "PreloadModelFrame", UIParent)
preloadModelFrame:Hide()

-- List all boss IDs that you want to preload.
-- (You can iterate over your _G.Journal.djDungeons table and collect the bossID's.)
local bossIDs = {}
for _, dungeon in ipairs(_G.Journal.djDungeons) do
    for _, boss in ipairs(dungeon.bosses) do
        if boss.bossID then
            table.insert(bossIDs, boss.bossID)
        end
    end
end
--[[
doesnt actually work sadge
local preloadIndex = 1
local function PreloadNextBossModel()
    if preloadIndex <= #bossIDs then
        local currentBossID = bossIDs[preloadIndex]
        debugPrint("Preloading model for bossID:", currentBossID)
        preloadModelFrame:SetCreature(currentBossID)
        preloadIndex = preloadIndex + 1
        -- Delay next preload by 0.2 seconds.
        C_Timer.After(0.2, PreloadNextBossModel)
    else
        debugPrint("Finished preloading boss models.")
    end
end

-- Start the preloading process.
PreloadNextBossModel()
--]] --
local BOSS_TRANSFORMS = _G.BOSS_TRANSFORMS or {}

-------------------------------------------------------------------
-- Helper: ApplyBossTransforms
-- Called once the model is loaded to apply custom transforms.
-- Uses bossID as the key for BOSS_TRANSFORMS table
-------------------------------------------------------------------
local function ApplyBossTransforms(frame, bossID)
    local transform = BOSS_TRANSFORMS[bossID]
    if transform then
        frame:SetFacing(transform.facing or 0)
        -- PlayerModel uses param order: (z, x, y)
        frame:SetPosition(transform.z or 0, transform.x or 0, transform.y or 0)
        frame:SetModelScale(transform.scale or 1)  -- Use SetModelScale for actual 3D model scaling
        
        -- Try alternative camera methods for flying mobs (more widely supported)
        if transform.cameraDistance then
            pcall(function() frame:SetCameraDistance(transform.cameraDistance) end)
        end
        if transform.cameraTarget then
            pcall(function() frame:SetCameraTarget(transform.cameraTarget.x or 0, transform.cameraTarget.y or 0, transform.cameraTarget.z or 0) end)
        end
        -- Try SetPitch with error protection in case it's not available
        if transform.pitch then
            pcall(function() frame:SetPitch(transform.pitch) end)
        end
    else
        frame:SetFacing(0)
        frame:SetPosition(0, 0, 0)
        frame:SetModelScale(1)  -- Use SetModelScale for actual 3D model scaling
    end
end

-------------------------------------------------------------------
-- Helper: Setup Model Frame & Story Button
-- Changed to PlayerModel and uses display IDs from _G.NPC_DisplayID_Map
-------------------------------------------------------------------
local function SetupModelFrame(dungeon, bossData, bossKey, bossLeveled)
    -- Changed to "PlayerModel" here:
    modelFrame = modelFrame or CreateFrame("DressUpModel", "Val_modelFrame", dungeonDetailFrame)
    modelFrame:SetSize(200, 400)
    modelFrame:SetPoint("LEFT", dungeonDetailFrame, "CENTER", -290, -70)
    modelFrame:SetFrameStrata("FULLSCREEN") -- Ensure model frame appears above other addons
    modelFrame:EnableMouse(true)
    modelFrame:Show()

    -- Create the Story Button if it doesn't exist
    if not modelFrame.storyButton then
        local btn = CreateFrame("Button", nil, modelFrame, "UIPanelButtonTemplate")
        btn:SetSize(25, 25)
        btn:SetNormalTexture("Interface\\Icons\\INV_Misc_Book_09")
        btn:SetPushedTexture("Interface\\Icons\\INV_Misc_Book_09")
        local nt = btn:GetNormalTexture()
        nt:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        nt:SetAllPoints(btn)
        local pt = btn:GetPushedTexture()
        pt:SetTexCoord(0.06, 0.94, 0.06, 0.94)
        pt:SetAllPoints(btn)
        btn:SetPoint("BOTTOMRIGHT", modelFrame, "BOTTOMRIGHT", -13, 30)
        btn:Hide()
        btn:SetScript("OnClick", function()
            if modelFrame.storyPopup:IsShown() then
                modelFrame.storyPopup:Hide()
            else
                modelFrame.storyPopup:Show()
            end
        end)
        modelFrame.storyButton = btn
    end

    modelFrame:ClearModel()

    -- Set neutral defaults before loading
    modelFrame:SetFacing(0)
    modelFrame:SetPosition(0, 0, 0)
    modelFrame:SetModelScale(1)

    -- Attempt to set creature model with error protection
    if bossData.bossID then
        local success = pcall(function()
            modelFrame:SetCreature(bossData.bossID)
        end)
        if success then
            -- Apply transforms after model is set
            ApplyBossTransforms(modelFrame, bossData.bossID)
        end
    end

    -- Retrieve and set the saved click count for level-up
    modelFrame.levelUpClickCount = (Journal_charDB.levelUpClickCount and Journal_charDB.levelUpClickCount[bossKey]) or 0
    if bossLeveled then
        modelFrame.levelUpClickCount = 75
    end

    return modelFrame
end

-------------------------------------------------------------------
-- Helper: Setup the Story Popup
-------------------------------------------------------------------
local function SetupStoryPopup()
    if not modelFrame.storyPopup then
        local popup = CreateFrame("Frame", "ValaniorDJ_StoryPopup", UIParent)
        popup:SetSize(400, 200)
        popup:SetPoint("CENTER", UIParent, "CENTER")
        popup:SetFrameStrata("DIALOG")
        popup:Hide()
        tinsert(UISpecialFrames, popup:GetName())
        if popup.SetBackdrop then
            popup:SetBackdrop({
                bgFile = "Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Parchment-Horizontal",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 256,
                edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 }
            })
        end
        local closeBtn = CreateFrame("Button", nil, popup, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", popup, "TOPRIGHT", -2, -2)
        closeBtn:SetScript("OnClick", function() popup:Hide() end)
        local fs = popup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", 10, -10)
        fs:SetPoint("RIGHT", -10, 0)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")
        fs:SetSpacing(3)
        fs:SetText("")
        popup.closeBtn = closeBtn
        popup.text = fs
        modelFrame.storyPopup = popup
    end
    return modelFrame.storyPopup
end

-------------------------------------------------------------------
-- Helper: Setup Boss Name Label
-------------------------------------------------------------------
local function SetupBossNameLabel(bossData)
    if not bossNameFontString then
        bossNameFontString = dungeonDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    end
    bossNameFontString:ClearAllPoints()
    bossNameFontString:SetPoint("TOP", dungeonDetailFrame, "TOP", -180, -50)
    bossNameFontString:SetText(bossData.name or "Unknown Boss")
    
    -- Setup rare icon if boss is marked as rare
    if bossData.rare then
        if not dungeonDetailFrame.rareIcon then
            -- Create rare icon frame
            dungeonDetailFrame.rareIcon = CreateFrame("Frame", nil, dungeonDetailFrame)
            dungeonDetailFrame.rareIcon:SetSize(20, 20)
            dungeonDetailFrame.rareIcon:SetFrameLevel(dungeonDetailFrame:GetFrameLevel() + 2)
            
            -- Create icon texture
            dungeonDetailFrame.rareIcon.texture = dungeonDetailFrame.rareIcon:CreateTexture(nil, "OVERLAY")
            dungeonDetailFrame.rareIcon.texture:SetAllPoints()
            dungeonDetailFrame.rareIcon.texture:SetTexture("Interface\\Icons\\INV_Misc_Gem_01") -- Using a gem icon as rare indicator
            
            -- Enable mouse interaction for tooltip
            dungeonDetailFrame.rareIcon:EnableMouse(true)
            dungeonDetailFrame.rareIcon:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
                GameTooltip:SetText("|cFFFFD700Rare NPC|r")
                GameTooltip:AddLine("Not needed for Dungeon Challenge", 1, 1, 1)
                GameTooltip:Show()
            end)
            dungeonDetailFrame.rareIcon:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)
        end
        
        -- Position rare icon to the right of the boss name
        dungeonDetailFrame.rareIcon:ClearAllPoints()
        dungeonDetailFrame.rareIcon:SetPoint("LEFT", bossNameFontString, "RIGHT", 10, 0)
        dungeonDetailFrame.rareIcon:Show()
    else
        -- Hide rare icon if boss is not rare
        if dungeonDetailFrame.rareIcon then
            dungeonDetailFrame.rareIcon:Hide()
        end
    end
    
    return bossNameFontString
end

-------------------------------------------------------------------
-- Helper: Setup Spell Icons Container
-------------------------------------------------------------------
local function SetupSpellIcons(bossData)
    ClearSpellFrames()
    if not dungeonDetailFrame.bossNav or not dungeonDetailFrame.bossNav.spellContainer then
        return
    end
    
    local spellContainer = dungeonDetailFrame.bossNav.spellContainer
    spellContainer:ClearAllPoints()
    
    -- Position spells higher on the model frame
    spellContainer:SetPoint("BOTTOM", modelFrame, "BOTTOM", 0, 35)
    
    if not bossData or not bossData.spells or #bossData.spells == 0 then
        spellContainer:Hide()
        return
    end
    
    -- Calculate dimensions for spell display
    local numSpells = #bossData.spells
    local spellIconSize = 24
    local spacing = 5
    
    -- Determine layout based on number of spells
    local rows = {}
    if numSpells <= 4 then
        -- Single row for 4 or fewer spells
        rows[1] = numSpells
    else
        -- Multiple rows for 5+ spells, stack in sets of 5
        local remaining = numSpells
        local rowIndex = 1
        while remaining > 0 do
            local spellsInRow = math.min(5, remaining)
            rows[rowIndex] = spellsInRow
            remaining = remaining - spellsInRow
            rowIndex = rowIndex + 1
        end
    end
    
    -- Calculate container dimensions
    local maxRowWidth = 0
    for _, spellsInRow in ipairs(rows) do
        local rowWidth = spellsInRow * spellIconSize + (spellsInRow - 1) * spacing
        if rowWidth > maxRowWidth then
            maxRowWidth = rowWidth
        end
    end
    
    local totalHeight = #rows * spellIconSize + (#rows - 1) * spacing
    spellContainer:SetSize(maxRowWidth, totalHeight + 10)
    spellContainer:Show()
    
    -- Create spell icons with proper positioning
    local spellIndex = 1
    for rowIndex, spellsInRow in ipairs(rows) do
        local rowWidth = spellsInRow * spellIconSize + (spellsInRow - 1) * spacing
        local rowStartX = (maxRowWidth - rowWidth) / 2 + 12  -- Center the row
        local rowY = (totalHeight / 2) - ((rowIndex - 1) * (spellIconSize + spacing)) - (spellIconSize / 2)
        
        for colIndex = 1, spellsInRow do
            local spellData = bossData.spells[spellIndex]
            if not spellData then break end
            
            local spellFrame = CreateFrame("Frame", "DJ_SpellIcon" .. spellIndex, spellContainer)
            spellFrame:SetSize(spellIconSize, spellIconSize)
            
            local xOffset = rowStartX + (colIndex - 1) * (spellIconSize + spacing)
            spellFrame:SetPoint("CENTER", spellContainer, "CENTER", xOffset - (maxRowWidth / 2), rowY)
            
            -- Create icon texture
            local iconTexture = spellFrame:CreateTexture(nil, "ARTWORK")
            iconTexture:SetAllPoints()
            iconTexture:SetTexture(spellData.icon or "Interface\\Icons\\INV_Misc_QuestionMark")
            -- Zoom in 10% to hide edges for cleaner look
            iconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
            
            -- Add border
            local border = spellFrame:CreateTexture(nil, "BORDER")
            border:SetAllPoints()
            border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
            
            -- Enable mouse interaction for tooltip
            spellFrame:EnableMouse(true)
            spellFrame:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOP")
                GameTooltip:SetText(spellData.name or "Unknown Spell", 1, 1, 1)
                
                if spellData.description then
                    GameTooltip:AddLine(spellData.description, 1, 0.8, 0, true)
                end
                
                -- Add spell details
                if spellData.duration and spellData.duration > 0 then
                    GameTooltip:AddLine("Duration: " .. spellData.duration .. "s", 0.7, 0.7, 1)
                end
                
                if spellData.cooldown and spellData.cooldown > 0 then
                    GameTooltip:AddLine("Cooldown: " .. spellData.cooldown .. "s", 0.7, 0.7, 1)
                end
                
                if spellData.casttime and spellData.casttime > 0 then
                    GameTooltip:AddLine("Cast time: " .. spellData.casttime .. "s", 0.7, 0.7, 1)
                end
                
                GameTooltip:Show()
            end)
            
            spellFrame:SetScript("OnLeave", function(self)
                GameTooltip:Hide()
            end)
            
            spellIndex = spellIndex + 1
        end
    end
end

-------------------------------------------------------------------
-- Helper: Setup Mouse Handlers for Level Up Logic
-------------------------------------------------------------------
local function SetupMouseHandlers(bossKey, dungeon)
    -- Cache the dungeon data for use in mouse handlers
    modelFrame.cachedDungeon = dungeon
    
    modelFrame:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            self.isDragging = true
            self.dragStartX = GetCursorPosition()
            self.startFacing = self:GetFacing() or 0
        end
    end)

    modelFrame:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            local currentX = GetCursorPosition()
            local dragDist = math.abs(currentX - self.dragStartX)
            self.isDragging = false
            
            -- Handle double-tap detection for .findnpc command
            if dragDist < 5 then
                self:SetSequenceTime(119, 3)
                
                -- Double-tap detection
                local currentTime = GetTime()
                if not self.lastClickTime then
                    self.lastClickTime = 0
                end
                
                local timeSinceLastClick = currentTime - self.lastClickTime
                
                if timeSinceLastClick <= 0.5 then -- Double-tap within 0.5 seconds
                    -- Get the current boss data to access the boss name from cached dungeon
                    local cachedDungeon = self.cachedDungeon
                    
                    if cachedDungeon and cachedDungeon.bosses and cachedDungeon.currentBossIndex then
                        local currentBoss = cachedDungeon.bosses[cachedDungeon.currentBossIndex]
                        if currentBoss and currentBoss.name then
                            SendChatMessage(".findnpc " .. currentBoss.name, "SAY")
                        end
                    end
                    self.lastClickTime = 0 -- Reset to prevent triple-tap issues
                else
                    self.lastClickTime = currentTime
                end
            end

            if Journal_charDB.leveledBoss[bossKey] then
                self.storyButton:Show()
            end

            self.levelUpClickCount = (Journal_charDB.levelUpClickCount and Journal_charDB.levelUpClickCount[bossKey]) or 0
            if not Journal_charDB.leveledBoss[bossKey] then
                self.levelUpClickCount = self.levelUpClickCount + 1

                Journal_charDB.levelUpClickCount[bossKey] = self.levelUpClickCount
                if self.levelUpClickCount >= 75 then
                    self:SetSequenceTime(148, 3)
                    Journal_charDB.leveledBoss[bossKey] = true
                    if self.storyButton then
                        self.storyButton:Show()
                    end
                end
            end
        end
    end)

    modelFrame:SetScript("OnUpdate", function(self, elapsed)
        if self.isDragging then
            local currentX = GetCursorPosition()
            local diff = (currentX - self.dragStartX) / 200
            self:SetFacing(self.startFacing - diff)
        end
    end)
end

-------------------------------------------------------------------
-- Keep track of which dungeon/boss is active
-------------------------------------------------------------------
local activeDungeon
local activeBossIndex = 0

-------------------------------------------------------------------
-- Main function to display a boss in the dungeon detail view
-------------------------------------------------------------------
local function ShowBoss(dungeon)
    if not dungeon or not dungeon.bosses or #dungeon.bosses == 0 then
        return
    end

    dungeon.currentBossIndex = dungeon.currentBossIndex or 1
    local index = dungeon.currentBossIndex

    -- Check if we need to update (prevent unnecessary refreshes)
    local bossData = dungeon.bosses[index]
    if not bossData then
        return
    end
    
    -- Only refresh if boss actually changed to reduce distracting flicker
    local needsRefresh = false
    if activeDungeon ~= dungeon or activeBossIndex ~= index then
        needsRefresh = true
    end
    
    -- Update tracking variables
    activeDungeon = dungeon
    activeBossIndex = index
    
    -- Only clear and refresh if needed
    if needsRefresh then
        ClearSpellFrames()
    end

    Journal_charDB.leveledBoss = Journal_charDB.leveledBoss or {}
    Journal_charDB.levelUpClickCount = Journal_charDB.levelUpClickCount or {}

    local bossKey = bossData.bossID or (dungeon.name .. bossData.name)
    local bossLeveled = Journal_charDB.leveledBoss[bossKey] or false

    -- Only do full setup if boss actually changed
    if needsRefresh then
        -- Ensure spell container is properly initialized before setting up spells
        if dungeonDetailFrame.bossNav and dungeonDetailFrame.bossNav.spellContainer then
            dungeonDetailFrame.bossNav.spellContainer:Show()
        end

        SetupModelFrame(dungeon, bossData, bossKey, bossLeveled)
        SetupStoryPopup()
        SetupBossNameLabel(bossData)
        SetupSpellIcons(bossData)  -- This will handle the new layout
        SetupMouseHandlers(bossKey, dungeon)
    else
        -- Just update spell icons and boss name if no full refresh needed
        SetupBossNameLabel(bossData)
        SetupSpellIcons(bossData)
    end

    -- Only update story popup if we did a full refresh
    if needsRefresh and modelFrame.storyPopup then
        local popup = modelFrame.storyPopup
        popup:Hide()

        local story = bossData.story or ""
        popup.text:SetText(story)
        popup.text:SetWidth(popup:GetWidth() - 20)
        local textHeight = popup.text:GetStringHeight()
        local newHeight = textHeight + 30
        popup:SetHeight(newHeight < 200 and 200 or newHeight)
    end

    -- Always update story button visibility based on boss level status
    if modelFrame.storyButton then
        if bossLeveled then
            modelFrame.storyButton:Show()
        else
            modelFrame.storyButton:Hide()
        end
    end
end

-------------------------------------------------------------------
-- Creates the boss navigation frame (with left/right buttons)
-------------------------------------------------------------------
local function CreateBossNavigation(dungeonDetailFrame, dungeon)
    if not dungeon or not dungeon.bosses or #dungeon.bosses == 0 then
        return
    end

    if dungeonDetailFrame.bossNav then
        if dungeonDetailFrame.bossNav.dungeonName ~= dungeon.name then
            dungeonDetailFrame.bossNav:Hide()
            dungeonDetailFrame.bossNav = nil
        end
    end

    local bossNav = dungeonDetailFrame.bossNav
    if not bossNav then
        bossNav = CreateFrame("Frame", "DJ_BossNavFrame", dungeonDetailFrame)
        bossNav:SetAllPoints()

        dungeonDetailFrame.bossNav = bossNav
        bossNav.dungeonName = dungeon.name
        bossNav:SetScript("OnShow", function(self)
            if self.dungeonName ~= dungeon.name then
                self:Hide()
                CreateBossNavigation(dungeonDetailFrame, dungeon)
            end
        end)
    else
        for _, child in ipairs({ bossNav:GetChildren() }) do
            child:Hide()
            child:SetParent(nil)
        end
    end

    bossNav.dungeon = dungeon

    if not bossNav.bossNameFontString then
        bossNav.bossNameFontString = bossNav:CreateFontString("DJ_BossNameFontString", "OVERLAY", "GameFontNormalLarge")
    end
    bossNav.bossNameFontString:ClearAllPoints()
    bossNav.bossNameFontString:SetPoint("TOP", dungeonDetailFrame, "TOP", -180, -50)
    bossNav.bossNameFontString:SetText(" ")

    if not bossNav.spellContainer then
        bossNav.spellContainer = CreateFrame("Frame", "DJ_SpellContainer", dungeonDetailFrame)
        bossNav.spellContainer:SetSize(300, 30)
        bossNav.spellContainer:SetPoint("TOP", bossNav.bossNameFontString, "BOTTOM", 0, -10)
        bossNav.spellContainer:EnableMouse(false)  -- Prevent mouse interference
    else
        -- Clear existing spell frames when recreating
        ClearSpellFrames()
        bossNav.spellContainer:ClearAllPoints()
        bossNav.spellContainer:SetPoint("TOP", bossNav.bossNameFontString, "BOTTOM", 0, -10)
        bossNav.spellContainer:SetSize(300, 30)  -- Reset size
    end
    bossNav.spellContainer:Show()

    if not bossNav.leftButton then
        bossNav.leftButton = CreateFrame("Button", "DJ_BossLeftButton", bossNav, "UIPanelButtonTemplate")
        bossNav.leftButton:SetSize(15, 15)
        bossNav.leftButton:SetText("<")
    end
    if not bossNav.rightButton then
        bossNav.rightButton = CreateFrame("Button", "DJ_BossRightButton", bossNav, "UIPanelButtonTemplate")
        bossNav.rightButton:SetSize(15, 15)
        bossNav.rightButton:SetText(">")
    end

    bossNav.leftButton:SetPoint("BOTTOMRIGHT", bossNav.bossNameFontString, "TOP", -10, 10)
    bossNav.rightButton:SetPoint("BOTTOMLEFT", bossNav.bossNameFontString, "TOP", 10, 10)

    bossNav:EnableMouse(true)
    dungeon.currentBossIndex = dungeon.currentBossIndex or 1

    local function showCurrentBoss()
        ShowBoss(dungeon)
    end

    bossNav.leftButton:SetScript("OnClick", function()
        dungeon.currentBossIndex = dungeon.currentBossIndex - 1
        if dungeon.currentBossIndex < 1 then
            dungeon.currentBossIndex = #dungeon.bosses
        end
        showCurrentBoss()
    end)

    bossNav.rightButton:SetScript("OnClick", function()
        dungeon.currentBossIndex = dungeon.currentBossIndex + 1
        if dungeon.currentBossIndex > #dungeon.bosses then
            dungeon.currentBossIndex = 1
        end
        showCurrentBoss()
    end)

    showCurrentBoss()
end

-------------------------------------------------------------------
-- Expose the main functions globally
-------------------------------------------------------------------
_G.ShowBoss = ShowBoss
_G.CreateBossNavigation = CreateBossNavigation
