-- ##################################################################
-- # BOSS DISPLAY & NAVIGATION
-- ##################################################################
-- This module handles displaying a boss's model, its associated story popup,
-- and provides navigation (left/right) between bosses in a dungeon.
--
-- Note: It assumes that some globals exist (e.g., dungeonDetailFrame, Journal_charDB, debugPrint)
-- and that other modules (Utility.lua, Core.lua) have been loaded.

-- ##################################################################
-- # BOSS TRANSFORM EDITOR TOOL
-- ##################################################################

local transformEditor = {
    frame = nil,
    isActive = false,
    currentBossID = nil,
    currentTransform = {
        facing = 0,
        x = 0,
        y = 0,
        z = 0,
        scale = 1,
        cameraDistance = nil,
        cameraTarget = { x = 0, y = 0, z = 0 },
        pitch = 0
    },
    allTransforms = {}
}

-- Create the transform editor UI
local function CreateTransformEditor()
    if transformEditor.frame then
        return transformEditor.frame
    end
    
    local frame = CreateFrame("Frame", "DJ_TransformEditor", UIParent)
    frame:SetSize(300, 400)
    frame:SetPoint("CENTER", UIParent, "CENTER", 400, 0)
    frame:SetFrameStrata("FULLSCREEN_DIALOG")
    frame:SetFrameLevel(100)
    
    -- Background
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
    
    -- Border (WotLK 3.3.5a compatible)
    local border = frame:CreateTexture(nil, "BORDER")
    border:SetAllPoints()
    border:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Border")
    border:SetTexCoord(0, 1, 0, 1)
    
    -- Title
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -15)
    title:SetText("Boss Transform Editor")
    
    -- Boss ID display
    local bossIDText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    bossIDText:SetPoint("TOP", title, "BOTTOM", 0, -10)
    bossIDText:SetText("Boss ID: None")
    frame.bossIDText = bossIDText
    
    -- Create control sliders (WotLK 3.3.5a compatible - removed unsupported camera controls)
    local controls = {
        { name = "Facing", min = -3.14, max = 3.14, step = 0.1, key = "facing" },
        { name = "X Position", min = -20, max = 20, step = 0.1, key = "x" },
        { name = "Y Position", min = -20, max = 20, step = 0.1, key = "y" },
        { name = "Z Position", min = -20, max = 20, step = 0.1, key = "z" },
        { name = "Scale", min = 0.1, max = 3, step = 0.1, key = "scale" }
    }
    
    frame.sliders = {}
    local yOffset = -60
    
    for i, control in ipairs(controls) do
        -- Label
        local label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        label:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, yOffset)
        label:SetText(control.name)
        
        -- Value display
        local valueText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        valueText:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -20, yOffset)
        valueText:SetText("0.0")
        
        -- Slider
        local slider = CreateFrame("Slider", nil, frame, "OptionsSliderTemplate")
        slider:SetPoint("TOPLEFT", label, "BOTTOMLEFT", 0, -5)
        slider:SetSize(250, 20)
        slider:SetMinMaxValues(control.min, control.max)
        slider:SetValue(0)
        slider:SetValueStep(control.step)
        slider:EnableMouseWheel(true)
        
        -- Store references
        slider.valueText = valueText
        slider.key = control.key
        frame.sliders[control.key] = slider
        
        -- Update function
        local function updateValue()
            local value = slider:GetValue()
            valueText:SetText(string.format("%.2f", value))
            transformEditor.currentTransform[control.key] = value
            transformEditor:ApplyCurrentTransform()
        end
        
        slider:SetScript("OnValueChanged", updateValue)
        slider:SetScript("OnMouseWheel", function(self, delta)
            local newValue = self:GetValue() + (delta * control.step)
            newValue = math.max(control.min, math.min(control.max, newValue))
            self:SetValue(newValue)
        end)
        
        yOffset = yOffset - 40
    end
    
    -- Buttons
    local buttonY = yOffset - 20
    
    -- Reset button
    local resetBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetBtn:SetSize(80, 25)
    resetBtn:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, buttonY)
    resetBtn:SetText("Reset")
    resetBtn:SetScript("OnClick", function()
        transformEditor:ResetTransform()
    end)
    
    -- Save button
    local saveBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    saveBtn:SetSize(80, 25)
    saveBtn:SetPoint("TOP", resetBtn, "TOP", 90, 0)
    saveBtn:SetText("Save")
    saveBtn:SetScript("OnClick", function()
        transformEditor:SaveCurrentTransform()
    end)
    
    -- Export All button
    local exportBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    exportBtn:SetSize(80, 25)
    exportBtn:SetPoint("TOP", saveBtn, "TOP", 90, 0)
    exportBtn:SetText("Export All")
    exportBtn:SetScript("OnClick", function()
        transformEditor:ExportAllTransforms()
    end)
    
    -- Close button
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeBtn:SetSize(260, 25)
    closeBtn:SetPoint("TOP", resetBtn, "BOTTOM", 90, -10)
    closeBtn:SetText("Close Editor")
    closeBtn:SetScript("OnClick", function()
        transformEditor:Hide()
    end)
    
    frame:Hide()
    transformEditor.frame = frame
    return frame
end

-- Transform editor methods
function transformEditor:Show(bossID)
    if not self.frame then
        CreateTransformEditor()
    end
    
    self.currentBossID = bossID
    self.isActive = true
    
    -- Load existing transform if available
    local existing = BOSS_TRANSFORMS[bossID] or {}
    self.currentTransform = {
        facing = existing.facing or 0,
        x = existing.x or 0,
        y = existing.y or 0,
        z = existing.z or 0,
        scale = existing.scale or 1
    }
    
    -- Update UI
    self.frame.bossIDText:SetText("Boss ID: " .. tostring(bossID))
    
    -- Set slider values
    for key, slider in pairs(self.frame.sliders) do
        local value = self.currentTransform[key] or 0
        slider:SetValue(value)
        slider.valueText:SetText(string.format("%.2f", value))
    end
    
    self.frame:Show()
    self:ApplyCurrentTransform()
end

function transformEditor:Hide()
    if self.frame then
        self.frame:Hide()
    end
    self.isActive = false
    self.currentBossID = nil
end

function transformEditor:ApplyCurrentTransform()
    if not self.isActive or not self.currentBossID or not modelFrame then
        return
    end
    
    local transform = self.currentTransform
    
    -- Apply transforms to the model (WotLK 3.3.5a compatible)
    modelFrame:SetFacing(transform.facing)
    modelFrame:SetPosition(transform.z, transform.x, transform.y)
    modelFrame:SetModelScale(transform.scale)
end

function transformEditor:ResetTransform()
    self.currentTransform = {
        facing = 0,
        x = 0,
        y = 0,
        z = 0,
        scale = 1
    }
    
    -- Update sliders
    for key, slider in pairs(self.frame.sliders) do
        local value = self.currentTransform[key] or 0
        slider:SetValue(value)
    end
    
    self:ApplyCurrentTransform()
end

function transformEditor:SaveCurrentTransform()
    if not self.currentBossID then
        print("|cFFFF0000[Transform Editor]|r No boss selected!")
        return
    end
    
    -- Save to global BOSS_TRANSFORMS (WotLK 3.3.5a compatible)
    BOSS_TRANSFORMS[self.currentBossID] = {
        facing = self.currentTransform.facing,
        x = self.currentTransform.x,
        y = self.currentTransform.y,
        z = self.currentTransform.z,
        scale = self.currentTransform.scale
    }
    
    -- Also save to our internal collection
    self.allTransforms[self.currentBossID] = BOSS_TRANSFORMS[self.currentBossID]
    
    print("|cFF00FF00[Transform Editor]|r Saved transform for Boss ID: " .. self.currentBossID)
end

function transformEditor:ExportAllTransforms()
    local output = "BOSS_TRANSFORMS = {\n"
    
    for bossID, transform in pairs(BOSS_TRANSFORMS) do
        output = output .. "    [" .. bossID .. "] = {\n"
        output = output .. "        facing = " .. (transform.facing or 0) .. ",\n"
        output = output .. "        x = " .. (transform.x or 0) .. ",\n"
        output = output .. "        y = " .. (transform.y or 0) .. ",\n"
        output = output .. "        z = " .. (transform.z or 0) .. ",\n"
        output = output .. "        scale = " .. (transform.scale or 1) .. ",\n"
        output = output .. "    },\n"
    end
    
    output = output .. "}"
    
    -- Copy to clipboard using CustomSetClipboard if available
    if CustomSetClipboard then
        CustomSetClipboard(output)
        print("|cFF00FF00[Transform Editor]|r Exported " .. self:CountTransforms() .. " transforms to clipboard!")
        print("|cFFFFD700[Transform Editor]|r Use Ctrl+V to paste the BOSS_TRANSFORMS table")
    else
        print("|cFFFF0000[Transform Editor]|r CustomSetClipboard not available!")
        print("|cFFFFD700[Transform Editor]|r Generated output:")
        print(output)
    end
end

function transformEditor:CountTransforms()
    local count = 0
    for _ in pairs(BOSS_TRANSFORMS) do
        count = count + 1
    end
    return count
end

function transformEditor:UpdateForNewBoss(bossID)
    if not self.isActive or not self.frame then
        return
    end
    
    -- Only update if it's actually a different boss
    if self.currentBossID == bossID then
        return
    end
    
    self.currentBossID = bossID
    
    -- Load existing transform if available
    local existing = BOSS_TRANSFORMS[bossID] or {}
    self.currentTransform = {
        facing = existing.facing or 0,
        x = existing.x or 0,
        y = existing.y or 0,
        z = existing.z or 0,
        scale = existing.scale or 1
    }
    
    -- Update UI
    self.frame.bossIDText:SetText("Boss ID: " .. tostring(bossID))
    
    -- Set slider values
    for key, slider in pairs(self.frame.sliders) do
        local value = self.currentTransform[key] or 0
        slider:SetValue(value)
        slider.valueText:SetText(string.format("%.2f", value))
    end
    
    print("|cFF00FF00[Transform Editor]|r Updated for Boss ID: " .. bossID)
end

-- Add slash command to open transform editor
SLASH_DJTRANSFORM1 = "/djtransform"
SlashCmdList["DJTRANSFORM"] = function()
    if not transformEditor.isActive then
        -- Get current boss ID from the model frame or current dungeon
        local bossID = nil
        if _G.currentDungeon and _G.currentDungeon.bosses and _G.currentDungeon.currentBossIndex then
            local currentBoss = _G.currentDungeon.bosses[_G.currentDungeon.currentBossIndex]
            bossID = currentBoss and currentBoss.bossID
        end
        
        if bossID then
            transformEditor:Show(bossID)
            print("|cFF00FF00[Transform Editor]|r Opening editor for Boss ID: " .. bossID)
            print("|cFFFFD700[Transform Editor]|r Use sliders to adjust model position, rotation, and scale")
            print("|cFFFFD700[Transform Editor]|r Click 'Save' to store transform, 'Export All' to copy to clipboard")
        else
            print("|cFFFF0000[Transform Editor]|r No boss currently displayed! Open a dungeon first.")
        end
    else
        transformEditor:Hide()
        print("|cFFFFD700[Transform Editor]|r Editor closed")
    end
end

-- Create a hidden model frame for pre-loading models.
local preloadModelFrame = CreateFrame("PlayerModel", "PreloadModelFrame", UIParent)
preloadModelFrame:Hide()

-- List all boss IDs that you want to preload.
-- (You can iterate over your _G.Journal.djDungeons table and collect the bossID's.)
local bossIDs = {}

-- ʕ •ᴥ•ʔ✿ Safeguard: Journal table may not be initialized yet ✿ ʕ •ᴥ•ʔ
if _G.Journal and _G.Journal.djDungeons then
    for _, dungeon in ipairs(_G.Journal.djDungeons) do
        for _, boss in ipairs(dungeon.bosses) do
            if boss.bossID then
                table.insert(bossIDs, boss.bossID)
            end
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
        frame:SetModelScale(transform.scale or 1)
    else
        frame:SetFacing(0)
        frame:SetPosition(0, 0, 0)
        frame:SetModelScale(1)
    end
end

-------------------------------------------------------------------
-- Helper: Setup Model Frame & Story Button
-- Changed to PlayerModel and uses display IDs from _G.NPC_DisplayID_Map
-------------------------------------------------------------------
local function SetupModelFrame(dungeon, bossData, bossKey, bossLeveled)
    -- Changed to "PlayerModel" here:
    modelFrame = modelFrame or CreateFrame("DressUpModel", "DJ_BossModel", dungeonDetailFrame)
    modelFrame:SetSize(200, 400)
    modelFrame:SetPoint("LEFT", dungeonDetailFrame, "CENTER", -290, -70)
    modelFrame:SetFrameStrata("FULLSCREEN")
    modelFrame:EnableMouse(true)
    modelFrame:Show()

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
        
        dungeonDetailFrame.rareIcon:ClearAllPoints()
        dungeonDetailFrame.rareIcon:SetPoint("CENTER", bossNameFontString, "CENTER", 0, -30)
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
                -- Apply muted color accents
                local coloredName = (_G.Journal and _G.Journal.ColorizeSpellName) and _G.Journal.ColorizeSpellName(spellData.name or "Unknown Spell", spellData.description) or (spellData.name or "Unknown Spell")
                GameTooltip:SetText(coloredName, 1, 1, 1)

                if spellData.description then
                    local coloredDesc = (_G.Journal and _G.Journal.ColorizeDescription) and _G.Journal.ColorizeDescription(spellData.description) or spellData.description
                    GameTooltip:AddLine(coloredDesc, 1, 0.8, 0, true)
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
        SetupBossNameLabel(bossData)
        SetupSpellIcons(bossData)  -- This will handle the new layout
        SetupMouseHandlers(bossKey, dungeon)
    else
        -- Just update spell icons and boss name if no full refresh needed
        SetupBossNameLabel(bossData)
        SetupSpellIcons(bossData)
    end

    -- Always update story button visibility based on boss level status
    if modelFrame.storyButton then
        if bossLeveled then
            modelFrame.storyButton:Show()
        else
            modelFrame.storyButton:Hide()
        end
    end
    
    -- Update transform editor if it's active
    if transformEditor.isActive and bossData.bossID then
        transformEditor:UpdateForNewBoss(bossData.bossID)
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
        bossNav.spellContainer:EnableMouse(false)  -- Prevent mouse interference
    else
        -- Clear existing spell frames when recreating
        ClearSpellFrames()
        bossNav.spellContainer:ClearAllPoints()
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
