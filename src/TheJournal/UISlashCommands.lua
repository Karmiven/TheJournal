-- ##################################################################
-- # UISlashCommands.lua - Slash Command Extensions
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Slash Command Extensions Module ✿ʕ•ᴥ•ʔ

local SlashCommands = {}

-- ʕ ◕ᴥ◕ ʔ✿ Handle points command ✿ʕ ◕ᴥ◕ ʔ
function SlashCommands.HandlePointsCommand()
    print("|cFFFFD700[Journal Points]|r You have " .. (Journal_charDB.journalPoints or 0) .. " Journal Points")
    if Journal_charDB.currentRandomQuest then
        local quest = Journal_charDB.currentRandomQuest
        local itemName = GetItemInfoCustom(quest.itemID) or ("Item " .. quest.itemID)
        local attuneProgress = _G.GetItemAttuneProgress and _G.GetItemAttuneProgress(quest.itemID) or 0
        print("|cFF00FF00[Current Quest]|r " .. itemName .. " (" .. string.format("%.1f", attuneProgress) .. "% progress)")
    else
        print("|cFF87CEEB[Random Quest]|r No active quest. Use the Random Quest button to start one!")
    end
end

-- ʕ ● ᴥ ●ʔ✿ Handle friends debug command ✿ʕ ● ᴥ ●ʔ
function SlashCommands.HandleFriendsDebugCommand()
    print("|cFFFFD700[DJ Debug]|r === FRIENDS DATA DEBUG ===")
    
    -- ʕノ•ᴥ•ʔノ✿ Check FRIENDS_JOURNAL_POINTS ✿ʕノ•ᴥ•ʔノ
    if _G.FRIENDS_JOURNAL_POINTS then
        local count = 0
        for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
            count = count + 1
            print("|cFF00FF00[DJ Debug]|r FRIENDS_JOURNAL_POINTS[" .. playerName .. "] = " .. points)
        end
        print("|cFF00FF00[DJ Debug]|r Total in FRIENDS_JOURNAL_POINTS: " .. count)
    else
        print("|cFFFF0000[DJ Debug]|r FRIENDS_JOURNAL_POINTS is nil!")
    end
    
    -- ＼ʕ •ᴥ•ʔ／✿ Check Journal_charDB.friendsJournalPoints ✿＼ʕ •ᴥ•ʔ／
    if Journal_charDB and Journal_charDB.friendsJournalPoints then
        local count = 0
        for playerName, points in pairs(Journal_charDB.friendsJournalPoints) do
            count = count + 1
            print("|cFF87CEEB[DJ Debug]|r Journal_charDB.friendsJournalPoints[" .. playerName .. "] = " .. points)
        end
        print("|cFF87CEEB[DJ Debug]|r Total in Journal_charDB.friendsJournalPoints: " .. count)
    else
        print("|cFFFF0000[DJ Debug]|r Journal_charDB.friendsJournalPoints is nil!")
    end
    
    -- ʕ •ᴥ•ʔ✿ Check FRIENDS_ATTUNEMENT_DATA ✿ʕ •ᴥ•ʔ
    if _G.FRIENDS_ATTUNEMENT_DATA then
        local count = 0
        for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
            count = count + 1
            local questItemID = data.questItemID or 0
            print("|cFFFFFF00[DJ Debug]|r FRIENDS_ATTUNEMENT_DATA[" .. playerName .. "] questItemID = " .. questItemID)
        end
        print("|cFFFFFF00[DJ Debug]|r Total in FRIENDS_ATTUNEMENT_DATA: " .. count)
    else
        print("|cFFFF0000[DJ Debug]|r FRIENDS_ATTUNEMENT_DATA is nil!")
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Check our own data ✿ʕ ◕ᴥ◕ ʔ
    local playerName = UnitName("player")
    print("|cFF00FF00[DJ Debug]|r Your name: " .. playerName)
    print("|cFF00FF00[DJ Debug]|r Your journal points: " .. (Journal_charDB.journalPoints or 0))
    if Journal_charDB.currentRandomQuest then
        print("|cFF00FF00[DJ Debug]|r Your quest item: " .. (Journal_charDB.currentRandomQuest.itemID or "none"))
    else
        print("|cFF00FF00[DJ Debug]|r Your quest item: none")
    end
    
    print("|cFFFFD700[DJ Debug]|r === END DEBUG ===")
end

-- ʕ ● ᴥ ●ʔ✿ Handle debug toggle command ✿ʕ ● ᴥ ●ʔ
function SlashCommands.HandleDebugCommand()
    DEBUG = not DEBUG
    print("|cFFFFD700[DJ Debug]|r Debug mode " .. (DEBUG and "ENABLED" or "DISABLED"))
end

-- ʕ ◕ᴥ◕ ʔ✿ Handle faction tooltip command ✿ʕ ◕ᴥ◕ ʔ
function SlashCommands.HandleFactionTooltipCommand()
    -- ʕ ● ᴥ ●ʔ✿ Initialize setting if not set ✿ʕ ● ᴥ ●ʔ
    if Journal_charDB.showFactionTooltips == nil then
        Journal_charDB.showFactionTooltips = true
    end
    
    Journal_charDB.showFactionTooltips = not Journal_charDB.showFactionTooltips
    local status = Journal_charDB.showFactionTooltips and "|cFF00FF00enabled|r" or "|cFFFF0000disabled|r"
    print("|cFFFFD700[DJ Faction]|r Faction tooltips " .. status)
end

-- ʕノ•ᴥ•ʔノ✿ Handle scale command ✿ʕノ•ᴥ•ʔノ
function SlashCommands.HandleScaleCommand(scaleValue)
    local scale = tonumber(scaleValue)
    
    if not scale then
        local currentScale = (Journal_charDB.uiScale or 100)
        print("|cFFFFD700[DJ Scale]|r Current UI scale: " .. currentScale .. "%")
        print("|cFFFFD700[DJ Scale]|r Usage: /djscale <number> (e.g., /djscale 75 for 75%)")
        print("|cFFFFD700[DJ Scale]|r Use /dj scalereset to reset to 100% if frames go off-screen")
        return
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Clamp scale between 25% and 200% ✿ʕ ◕ᴥ◕ ʔ
    scale = math.max(25, math.min(200, scale))
    
    -- ʕ ● ᴥ ●ʔ✿ Store scale setting ✿ʕ ● ᴥ ●ʔ
    Journal_charDB.uiScale = scale
    
    -- ＼ʕ •ᴥ•ʔ／✿ Apply scale to all frames ✿＼ʕ •ᴥ•ʔ／
    if _G.DungeonJournalFrame then
        SlashCommands.ApplyScaleToAllFrames(scale)
        local scaleFactor = scale / 100
        print("|cFF00FF00[DJ Scale]|r UI scale set to " .. scale .. "% (" .. string.format("%.2f", scaleFactor) .. "x)")
    else
        print("|cFFFF0000[DJ Scale]|r DungeonJournalFrame not found! Scale will be applied when the addon loads.")
    end
end

-- ʕノ•ᴥ•ʔノ✿ Enhanced slash command handler ✿ʕノ•ᴥ•ʔノ
function SlashCommands.HandleSlashCommand(msg)
    msg = string.lower(string.trim(msg or ""))
    
    -- ʕ ◕ᴥ◕ ʔ✿ Check for scale command with parameter ✿ʕ ◕ᴥ◕ ʔ
    local scaleMatch = msg:match("^scale%s+(.+)")
    if scaleMatch then
        SlashCommands.HandleScaleCommand(scaleMatch)
        return
    end
    
    if msg == "points" then
        SlashCommands.HandlePointsCommand()
    elseif msg == "friendsdebug" then
        SlashCommands.HandleFriendsDebugCommand()
    elseif msg == "debug" then
        SlashCommands.HandleDebugCommand()
    elseif msg == "factiontooltip" then
        SlashCommands.HandleFactionTooltipCommand()
    elseif msg == "scale" then
        SlashCommands.HandleScaleCommand(nil) -- Show current scale
    elseif msg == "scalereset" then
        -- ʕ ◕ᴥ◕ ʔ✿ Reset scale to 100% ✿ʕ ◕ᴥ◕ ʔ
        Journal_charDB.uiScale = 100
        SlashCommands.ApplyScaleToAllFrames(100)
        print("|cFF00FF00[DJ Scale]|r UI scale reset to 100% (normal size)")
    else
        -- ＼ʕ •ᴥ•ʔ／✿ Call original handler for all other commands ✿＼ʕ •ᴥ•ʔ／
        if SlashCommands.originalHandler then
            return SlashCommands.originalHandler(msg)
        end
    end
end

-- ʕ •ᴥ•ʔ✿ Hook existing slash command handler ✿ʕ •ᴥ•ʔ
function SlashCommands.HookSlashHandler()
    SlashCommands.originalHandler = SlashCmdList["DJ"]
    SlashCmdList["DJ"] = SlashCommands.HandleSlashCommand
end

-- ʕ ◕ᴥ◕ ʔ✿ Initialize slash commands ✿ʕ ◕ᴥ◕ ʔ
function SlashCommands.Initialize()
    SlashCommands.HookSlashHandler()
end

-- ʕ ● ᴥ ●ʔ✿ Export global functions ✿ʕ ● ᴥ ●ʔ
_G.SlashCommands = SlashCommands
_G.ApplyScaleToAllFrames = SlashCommands.ApplyScaleToAllFrames

-- ʕ ◕ᴥ◕ ʔ✿ Apply saved scale on initialization ✿ʕ ◕ᴥ◕ ʔ
function SlashCommands.ApplySavedScale()
    local scale = Journal_charDB.uiScale or 100
    if scale ~= 100 and _G.DungeonJournalFrame then
        SlashCommands.ApplyScaleToAllFrames(scale)
    end
end

-- ʕ ● ᴥ ●ʔ✿ Function to reset all frames to default scale ✿ʕ ● ᴥ ●ʔ
function SlashCommands.ResetAllFramesToDefaultScale()
    if _G.DungeonJournalFrame then
        _G.DungeonJournalFrame:SetScale(1.0)
    end
    
    if _G.AttunementFriendsFrame then
        -- Ensure uniform scale is default
        _G.AttunementFriendsFrame:SetScale(1.0)

        -- Restore original dimensions if cached
        if _G.AttunementFriendsFrame.baseWidth and _G.AttunementFriendsFrame.baseHeight then
            _G.AttunementFriendsFrame:SetSize(_G.AttunementFriendsFrame.baseWidth, _G.AttunementFriendsFrame.baseHeight)
        end
    end
    
    if _G.DJ_QuestPopoutFrame then
        _G.DJ_QuestPopoutFrame:SetScale(1.0)
    end
    
    if _G.DJ_TransformEditor then
        _G.DJ_TransformEditor:SetScale(1.0)
    end
end

-- ʕ ● ᴥ ●ʔ✿ Function to apply scale to all frames ✿ʕ ● ᴥ ●ʔ
function SlashCommands.ApplyScaleToAllFrames(scale)
    -- ʕ ◕ᴥ◕ ʔ✿ First reset all frames to default scale to avoid compounding ✿ʕ ◕ᴥ◕ ʔ
    SlashCommands.ResetAllFramesToDefaultScale()
    
    local scaleFactor = scale / 100
    
    if _G.DungeonJournalFrame then
        _G.DungeonJournalFrame:SetScale(scaleFactor)
    end
    
    if _G.AttunementFriendsFrame then
        -- Cache default dimensions once
        if not _G.AttunementFriendsFrame.baseWidth then
            _G.AttunementFriendsFrame.baseWidth  = _G.AttunementFriendsFrame:GetWidth()
            _G.AttunementFriendsFrame.baseHeight = _G.AttunementFriendsFrame:GetHeight()
        end

        -- Apply vertical scaling only: keep width, adjust height
        local baseW   = _G.AttunementFriendsFrame.baseWidth
        local newH    = _G.AttunementFriendsFrame.baseHeight * scaleFactor

        _G.AttunementFriendsFrame:SetScale(1.0) -- prevent proportional scaling
        _G.AttunementFriendsFrame:SetSize(baseW, newH)
    end
    
    -- ʕ ◕ᴥ◕ ʔ✿ Also apply to any quest popout frames ✿ʕ ◕ᴥ◕ ʔ
    if _G.DJ_QuestPopoutFrame then
        _G.DJ_QuestPopoutFrame:SetScale(scaleFactor)
    end
    
    -- ＼ʕ •ᴥ•ʔ／✿ Apply to transform editor if it exists ✿＼ʕ •ᴥ•ʔ／
    if _G.DJ_TransformEditor then
        _G.DJ_TransformEditor:SetScale(scaleFactor)
    end
end

-- ʕノ•ᴥ•ʔノ✿ Register dedicated scale slash command ✿ʕノ•ᴥ•ʔノ
SLASH_DJSCALE1 = "/djscale"
SlashCmdList["DJSCALE"] = function(msg)
    local trimmedMsg = string.trim(msg or "")
    if trimmedMsg == "" then
        SlashCommands.HandleScaleCommand(nil) -- Show current scale
    else
        SlashCommands.HandleScaleCommand(trimmedMsg)
    end
end

-- ʕノ•ᴥ•ʔノ✿ Auto-initialize ✿ʕノ•ᴥ•ʔノ
SlashCommands.Initialize()

-- ʕ ● ᴥ ●ʔ✿ Apply saved scale after a short delay to ensure frames are loaded ✿ʕ ● ᴥ ●ʔ
C_Timer.After(1, function()
    SlashCommands.ApplySavedScale()
end)

-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ
