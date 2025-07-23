-- ##################################################################
-- # UICtrlAltHover.lua - Ctrl+Alt Hover Automation
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Ctrl+Alt Hover Automation Module ✿ʕ•ᴥ•ʔ
--[[
local CtrlAltHover = {}

-- ʕ ◕ᴥ◕ ʔ✿ Module state variables ✿ʕ ◕ᴥ◕ ʔ
local isCtrlPressed = false
local isAltPressed = false
-- ʕ ● ᴥ ●ʔ✿ Simplified state tracking ✿ʕ ● ᴥ ●ʔ
local lastProcessedItem = nil

-- ʕノ•ᴥ•ʔノ✿ Initialize tracking tables ✿ʕノ•ᴥ•ʔノ
if not _G.CTRL_ALT_QUERY_CACHE then
    _G.CTRL_ALT_QUERY_CACHE = {}
end

if not _G.CTRL_ALT_ACTIVE_QUERIES then
    _G.CTRL_ALT_ACTIVE_QUERIES = {}
end

if not _G.CTRL_ALT_SETTINGS then
    _G.CTRL_ALT_SETTINGS = {
        showDetailedTooltips = true
    }
end

-- ʕ •ᴥ•ʔ✿ Visual indicator removed - silent mode only ✿ʕ •ᴥ•ʔ

-- ʕ •ᴥ•ʔ✿ Key state tracking ✿ʕ •ᴥ•ʔ
function CtrlAltHover.UpdateKeyState()
    isCtrlPressed = IsControlKeyDown()
    isAltPressed = IsAltKeyDown()
end

-- ʕ ◕ᴥ◕ ʔ✿ Check if Ctrl+Alt is currently pressed ✿ʕ ◕ᴥ◕ ʔ
function CtrlAltHover.IsCtrlAltPressed()
    return isCtrlPressed and isAltPressed
end

-- ʕ ● ᴥ ●ʔ✿ Get item information from tooltip ✿ʕ ● ᴥ ●ʔ
function CtrlAltHover.GetItemFromTooltip()
    if not GameTooltip:IsVisible() then
        return nil
    end

    local name, link = GameTooltip:GetItem()
    if link then
        local itemID = tonumber(link:match("item:(%d+)"))
        if itemID then
            return {
                itemID = itemID,
                link = link,
                name = name
            }
        end
    end

    -- ʕノ•ᴥ•ʔノ✿ Fallback: check container frames ✿ʕノ•ᴥ•ʔノ
    local mouseoverFrame = GetMouseFocus()
    if mouseoverFrame and mouseoverFrame:GetName() then
        local frameName = mouseoverFrame:GetName()
        if frameName:match("ContainerFrame%d+Item%d+") then
            local bag = mouseoverFrame:GetParent():GetID()
            local slot = mouseoverFrame:GetID()
            local containerLink = GetContainerItemLink(bag, slot)
            if containerLink then
                local itemID = tonumber(containerLink:match("item:(%d+)"))
                if itemID then
                    local itemName = GetItemInfo(itemID)
                    return {
                        itemID = itemID,
                        link = containerLink,
                        name = itemName
                    }
                end
            end
        end
    end

    return nil
end

-- ＼ʕ •ᴥ•ʔ／✿ Check if item is eligible for BOE queries ✿＼ʕ •ᴥ•ʔ／
function CtrlAltHover.IsEligibleForQuery(itemID)
    if not itemID then return false end

    -- ʕ ◕ᴥ◕ ʔ✿ Check if item is BOE ✿ʕ ◕ᴥ◕ ʔ
    local itemName, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemID)
    if not itemName or bindType ~= 2 then
        return false
    end

    -- ʕ ● ᴥ ●ʔ✿ Check if item is attunable ✿ʕ ● ᴥ ●ʔ
    local isAttunable = false
    if _G.IsAttunableBySomeone then
        isAttunable = _G.IsAttunableBySomeone(itemID)
    elseif _G.CanAttuneItemHelper then
        local canAttune = _G.CanAttuneItemHelper(itemID) or 0
        isAttunable = canAttune > 0
    end

    return isAttunable
end

-- ʕ •ᴥ•ʔ✿ Check if we recently queried this item ✿ʕ •ᴥ•ʔ
function CtrlAltHover.ShouldQueryItem(itemID)
    if not itemID then return false end

    local lastQuery = _G.CTRL_ALT_QUERY_CACHE[itemID]
    if lastQuery and (GetTime() - lastQuery) < 30 then
        return false  -- Don't spam queries
    end

    return true
end

-- ʕノ•ᴥ•ʔノ✿ Execute automatic BOE query ✿ʕノ•ᴥ•ʔノ
function CtrlAltHover.ExecuteAutoQuery(itemData)
    if not itemData or not itemData.itemID then return end

    local itemID = itemData.itemID
    local itemLink = itemData.link
    local itemName = itemData.name

    if not CtrlAltHover.IsEligibleForQuery(itemID) then
        return
    end

    if not CtrlAltHover.ShouldQueryItem(itemID) then
        return
    end

    -- ʕ ● ᴥ ●ʔ✿ Execute the query silently ✿ʕ ● ᴥ ●ʔ
    if _G.QueryItemFromFriends and type(_G.QueryItemFromFriends) == "function" then
        _G.QueryItemFromFriends(itemID, itemLink)

        -- ʕ ◕ᴥ◕ ʔ✿ Mark as queried to prevent spam ✿ʕ ◕ᴥ◕ ʔ
        _G.CTRL_ALT_QUERY_CACHE[itemID] = GetTime()

        if _G.debug then
            print("|cFF00FFFF[Ctrl+Alt BOE]|r Silently queried friends about " .. (itemName or ("Item " .. itemID)))
        end
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Update tooltip with query status and responses ✿ʕ ◕ᴥ◕ ʔ
function CtrlAltHover.UpdateTooltipWithQuery(itemID)
    if not GameTooltip:IsVisible() or not itemID then return end

    local queryData = _G.CTRL_ALT_ACTIVE_QUERIES[itemID]
    if not queryData then return end

    local currentTime = GetTime()
    local queryAge = currentTime - queryData.startTime

    -- ʕ ● ᴥ ●ʔ✿ Check if tooltip already has our data with safety checks ✿ʕ ● ᴥ ●ʔ
    local hasCtrlAltData = false
    local tooltipName = GameTooltip:GetName()
    if not tooltipName then
        if _G.debug then
            print("|cFFFF0000[Ctrl+Alt BOE Error]|r GameTooltip has no name")
        end
        return
    end

    local numLines = GameTooltip:NumLines()
    if numLines and numLines > 0 then
        for i = 1, numLines do
            local lineText = _G[tooltipName .. "TextLeft" .. i]
            if lineText and lineText.GetText then
                local text = lineText:GetText()
                if text and (text:find("Ctrl%+Alt Query", 1, true) or text:find("BOE Item - Friend Status", 1, true)) then
                    hasCtrlAltData = true
                    break
                end
            end
        end
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Only add our section if no existing BOE data ✿ʕ ◕ᴥ◕ ʔ
    if not hasCtrlAltData then
        if GameTooltip.AddLine then
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("|cFF00FFFF[Ctrl+Alt Query Results]|r")
        end
    end

    -- ʕノ•ᴥ•ʔノ✿ Show query status or responses ✿ʕノ•ᴥ•ʔノ
    local hasResponses = false
    if _G.ITEM_QUERY_RESPONSES and _G.ITEM_QUERY_RESPONSES[itemID] then
        local responses = _G.ITEM_QUERY_RESPONSES[itemID]
        local friendsWhoNeed = {}
        local friendsWhoNeedAffixes = {}
        local friendsWhoCanUpgrade = {}

        for friendName, response in pairs(responses) do
            if (currentTime - response.timestamp) < 30 then
                hasResponses = true
                if response.needsItem then
                    table.insert(friendsWhoNeed, friendName)
                elseif response.needsAffixesOnly then
                    table.insert(friendsWhoNeedAffixes, friendName)
                elseif response.canUpgrade then
                    local forgeText = ""
                    if response.currentForge == 1 then forgeText = " (Titanforged)"
                    elseif response.currentForge == 2 then forgeText = " (Warforged)"
                    elseif response.currentForge == 3 then forgeText = " (Lightforged)"
                    end
                    table.insert(friendsWhoCanUpgrade, friendName .. forgeText)
                end
            end
        end

        if hasResponses and GameTooltip.AddLine then
            if #friendsWhoNeed > 0 then
                GameTooltip:AddLine("|cFF00FF00Needs Item:|r " .. table.concat(friendsWhoNeed, ", "), 1, 1, 1, true)
            end
            if #friendsWhoNeedAffixes > 0 then
                GameTooltip:AddLine("|cFFFFFF00Affixes Only:|r " .. table.concat(friendsWhoNeedAffixes, ", "), 1, 1, 1, true)
            end
            if #friendsWhoCanUpgrade > 0 then
                GameTooltip:AddLine("|cFFFFFF00Can Upgrade:|r " .. table.concat(friendsWhoCanUpgrade, ", "), 1, 1, 1, true)
            end
            GameTooltip:AddLine("|cFF888888(Auto-queried via addon communication)|r")
        end
    end

    -- ＼ʕ •ᴥ•ʔ／✿ Show waiting status if no responses yet ✿＼ʕ •ᴥ•ʔ／
    if not hasResponses and GameTooltip.AddLine then
        if queryAge < RESPONSE_TIMEOUT then
            local dotsCount = math.floor(queryAge * 2) % 4
            local dots = string.rep(".", dotsCount)
            GameTooltip:AddLine("|cFFFFFF00Waiting for responses" .. dots .. "|r")
        else
            GameTooltip:AddLine("|cFF888888No responses (friends may be offline)|r")
            -- ʕ ◕ᴥ◕ ʔ✿ Clean up old query ✿ʕ ◕ᴥ◕ ʔ
            _G.CTRL_ALT_ACTIVE_QUERIES[itemID] = nil
        end
    end

    if GameTooltip.Show then
        GameTooltip:Show()
    end
end

-- ʕ •ᴥ•ʔ✿ Simplified hover processing - integrate with tooltip directly ✿ʕ •ᴥ•ʔ
function CtrlAltHover.ProcessTooltipWithCtrlAlt()
    if not GameTooltip:IsVisible() then
        lastProcessedItem = nil
        return
    end

    CtrlAltHover.UpdateKeyState()
    if not CtrlAltHover.IsCtrlAltPressed() then
        return
    end

    local currentItem = CtrlAltHover.GetItemFromTooltip()
    if not currentItem then
        return
    end

    -- ʕ ● ᴥ ●ʔ✿ Only process if this is a new item ✿ʕ ● ᴥ ●ʔ
    if lastProcessedItem and lastProcessedItem == currentItem.itemID then
        return
    end

    -- ʕ ◕ᴥ◕ ʔ✿ Execute query and update tooltip ✿ʕ ◕ᴥ◕ ʔ
    if CtrlAltHover.IsEligibleForQuery(currentItem.itemID) and CtrlAltHover.ShouldQueryItem(currentItem.itemID) then
        CtrlAltHover.ExecuteAutoQuery(currentItem)
        lastProcessedItem = currentItem.itemID
    end
end

-- ʕ ◕ᴥ◕ ʔ✿ Simplified update frame ʕ ◕ᴥ◕ ʔ
local updateFrame = CreateFrame("Frame")
updateFrame:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = (self.elapsed or 0) + elapsed
    if self.elapsed < 0.2 then return end
    self.elapsed = 0

    CtrlAltHover.ProcessTooltipWithCtrlAlt()
end)




-- ʕ ● ᴥ ●ʔ✿ Cleanup old queries periodically ✿ʕ ● ᴥ ●ʔ
local function CleanupOldQueries()
    local currentTime = GetTime()
    local cleaned = 0

    for itemID, queryData in pairs(_G.CTRL_ALT_ACTIVE_QUERIES) do
        if (currentTime - queryData.startTime) > (RESPONSE_TIMEOUT + 30) then
            _G.CTRL_ALT_ACTIVE_QUERIES[itemID] = nil
            cleaned = cleaned + 1
        end
    end

    -- ʕノ•ᴥ•ʔノ✿ Also cleanup old cache entries ✿ʕノ•ᴥ•ʔノ
    for itemID, timestamp in pairs(_G.CTRL_ALT_QUERY_CACHE) do
        if (currentTime - timestamp) > 300 then  -- 5 minutes
            _G.CTRL_ALT_QUERY_CACHE[itemID] = nil
            cleaned = cleaned + 1
        end
    end

    if cleaned > 0 and _G.debug then
        print("|cFF00FFFF[Ctrl+Alt BOE]|r Cleaned up " .. cleaned .. " old query records")
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Schedule cleanup every 2 minutes ✿＼ʕ •ᴥ•ʔ／
local cleanupTimer = C_Timer.NewTicker(120, CleanupOldQueries)

-- ʕ •ᴥ•ʔ✿ Debug functions ✿ʕ •ᴥ•ʔ
function CtrlAltHover.GetStatus()
    print("|cFF00FFFF[Ctrl+Alt BOE Status]|r")
    print("Ctrl pressed: " .. tostring(isCtrlPressed))
    print("Alt pressed: " .. tostring(isAltPressed))
    print("Last hovered item: " .. (lastHoveredItem and lastHoveredItem.name or "none"))
    print("Processing hover: " .. tostring(isProcessingHover))

    local activeQueries = 0
    for _ in pairs(_G.CTRL_ALT_ACTIVE_QUERIES) do
        activeQueries = activeQueries + 1
    end
    print("Active queries: " .. activeQueries)

    local cachedQueries = 0
    for _ in pairs(_G.CTRL_ALT_QUERY_CACHE) do
        cachedQueries = cachedQueries + 1
    end
    print("Cached queries: " .. cachedQueries)
end


-- ʕ ● ᴥ ●ʔ✿ Integrate with existing slash command system ✿ʕ ● ᴥ ●ʔ
function CtrlAltHover.IntegrateSlashCommands()
    if _G.SlashCommands then
        -- ʕ ◕ᴥ◕ ʔ✿ Add our commands to the existing SlashCommands module ✿ʕ ◕ᴥ◕ ʔ
        _G.SlashCommands.HandleCtrlAltStatusCommand = function()
            CtrlAltHover.GetStatus()
        end

        _G.SlashCommands.HandleCtrlAltClearCommand = function()
            _G.CTRL_ALT_QUERY_CACHE = {}
            _G.CTRL_ALT_ACTIVE_QUERIES = {}
            print("|cFF00FFFF[Ctrl+Alt BOE]|r Cleared all cached queries")
        end



        _G.SlashCommands.HandleCtrlAltHelpCommand = function()
            print("|cFF00FFFF[Ctrl+Alt BOE Help]|r")
            print("|cFFFFFF00How to use:|r")
            print("1. Hold Ctrl+Alt and hover over any BOE item")
            print("2. Addon will silently query friends automatically")
            print("3. Responses appear in the tooltip in real-time")
            print("4. All communication via silent addon messages")
            print("|cFFFFFF00Commands:|r")
            print("/dj ctrlaltstatus - Show current status")
            print("/dj ctrlaltclear - Clear query cache")
            print("/dj ctrlalthelp - Show this help")
        end

        -- ʕノ•ᴥ•ʔノ✿ Hook into the existing HandleSlashCommand function ✿ʕノ•ᴥ•ʔノ
        local originalHandler = _G.SlashCommands.HandleSlashCommand
        _G.SlashCommands.HandleSlashCommand = function(msg)
            msg = string.lower(string.trim(msg or ""))

            if msg == "ctrlaltstatus" then
                _G.SlashCommands.HandleCtrlAltStatusCommand()
            elseif msg == "ctrlaltclear" then
                _G.SlashCommands.HandleCtrlAltClearCommand()
            elseif msg == "ctrlalthelp" then
                _G.SlashCommands.HandleCtrlAltHelpCommand()
            else
                -- ＼ʕ •ᴥ•ʔ／✿ Call original handler for all other commands ✿＼ʕ •ᴥ•ʔ／
                return originalHandler(msg)
            end
        end
    end
end

-- ʕノ•ᴥ•ʔノ✿ Event handling for key state changes ✿ʕノ•ᴥ•ʔノ
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("MODIFIER_STATE_CHANGED")
eventFrame:SetScript("OnEvent", function(self, event, key, down)
    if event == "MODIFIER_STATE_CHANGED" then
        if key == "LCTRL" or key == "RCTRL" then
            isCtrlPressed = (down == 1)
        elseif key == "LALT" or key == "RALT" then
            isAltPressed = (down == 1)
        end

        -- ＼ʕ •ᴥ•ʔ／✿ Reset state when modifier keys change ✿＼ʕ •ᴥ•ʔ／
        if not CtrlAltHover.IsCtrlAltPressed() then
            lastProcessedItem = nil
        end
    end
end)

-- ʕ ◕ᴥ◕ ʔ✿ Integration with existing tooltip system ʕ ◕ᴥ◕ ʔ
local function EnhanceExistingTooltips()
    -- ʕ ◕ᴥ◕ ʔ✿ Hook GameTooltip:Show to trigger processing ✿ʕ ◕ᴥ◕ ʔ
    if not CtrlAltHover.originalTooltipShow then
        CtrlAltHover.originalTooltipShow = GameTooltip.Show
        GameTooltip.Show = function(self)
            local result = CtrlAltHover.originalTooltipShow(self)

            -- ʕ ● ᴥ ●ʔ✿ Process Ctrl+Alt if keys are pressed ✿ʕ ● ᴥ ●ʔ
            C_Timer.After(0.1, function()
                CtrlAltHover.ProcessTooltipWithCtrlAlt()
            end)

            return result
        end
    end
end

-- ʕノ•ᴥ•ʔノ✿ Initialize the module ✿ʕノ•ᴥ•ʔノ
function CtrlAltHover.Initialize()
    -- ʕ ◕ᴥ◕ ʔ✿ Check dependencies ✿ʕ ◕ᴥ◕ ʔ
    if not GameTooltip then
        print("|cFFFF0000[Ctrl+Alt BOE Error]|r GameTooltip not available - module disabled")
        return
    end

    if not IsControlKeyDown or not IsAltKeyDown then
        print("|cFFFF0000[Ctrl+Alt BOE Error]|r Key detection functions not available - module disabled")
        return
    end

    -- ʕ ● ᴥ ●ʔ✿ Set up tooltip integration ✿ʕ ● ᴥ ●ʔ
    EnhanceExistingTooltips()

    -- ʕノ•ᴥ•ʔノ✿ Integrate slash commands ✿ʕノ•ᴥ•ʔノ
    CtrlAltHover.IntegrateSlashCommands()

    -- ＼ʕ •ᴥ•ʔ／✿ Initial key state check ✿＼ʕ •ᴥ•ʔ／
    CtrlAltHover.UpdateKeyState()

    if _G.debug then
        print("|cFF00FFFF[Ctrl+Alt BOE]|r Module initialized successfully")
        print("Hold Ctrl+Alt and hover over BOE items for silent automatic friend queries!")
        print("Responses will appear in tooltips via addon communication.")
    end
end

-- ＼ʕ •ᴥ•ʔ／✿ Auto-initialize after a short delay with safety checks ✿＼ʕ •ᴥ•ʔ／
if C_Timer and C_Timer.After then
    C_Timer.After(2, function()
        if GameTooltip and _G.QueryItemFromFriends then
            CtrlAltHover.Initialize()
        else
            -- ʕ ◕ᴥ◕ ʔ✿ Retry after longer delay ✿ʕ ◕ᴥ◕ ʔ
            C_Timer.After(5, function()
                CtrlAltHover.Initialize()
            end)
        end
    end)
else
    -- ʕ ● ᴥ ●ʔ✿ Fallback initialization ✿ʕ ● ᴥ ●ʔ
    local initFrame = CreateFrame("Frame")
    initFrame:RegisterEvent("PLAYER_LOGIN")
    initFrame:SetScript("OnEvent", function()
        CtrlAltHover.Initialize()
    end)
end

-- ʕ •ᴥ•ʔ✿ Global exports ✿ʕ •ᴥ•ʔ
_G.CtrlAltHover = CtrlAltHover
_G.TheJournal_CtrlAltHover = CtrlAltHover

-- ʕ •ᴥ•ʔ✿ Module loaded ✿ʕ •ᴥ•ʔ
--]]
