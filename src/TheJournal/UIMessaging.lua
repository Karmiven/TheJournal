-- ##################################################################
-- # UIMessaging.lua - Addon Communication and Messaging
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Messaging System Module ✿ʕ•ᴥ•ʔ

local Messaging = {}

-- ʕ ◕ᴥ◕ ʔ✿ Initialize messaging frame ✿ʕ ◕ᴥ◕ ʔ
local messageFrame = CreateFrame("Frame")
local pointsFrame = CreateFrame("Frame")

-- ʕ ● ᴥ ●ʔ✿ Hook SendAttunementData to include Journal Points ✿ʕ ● ᴥ ●ʔ
function Messaging.HookSendAttunementData()
    local originalSendAttunementData = _G.SendAttunementData
    if originalSendAttunementData then
        _G.SendAttunementData = function()
            local result = originalSendAttunementData()
            
            -- ʕノ•ᴥ•ʔノ✿ Save friends data after sending ✿ʕノ•ᴥ•ʔノ
            if Journal_charDB then
                SaveFriendsData()
            end
            
            -- ʕ ● ᴥ ●ʔ✿ REMOVED: Journal points now sent via omega-merged network message ✿ʕ ● ᴥ ●ʔ
            -- DJ_POINTS network messages disabled - using unified messaging system
            
            return result
        end
    end
end

-- ʕ •ᴥ•ʔ✿ DISABLED: Journal Points now handled via omega-merged network message ✿ʕ •ᴥ•ʔ
function Messaging.SetupPointsListener()
    -- ʕ ◕ᴥ◕ ʔ✿ DJ_POINTS listener disabled - using unified messaging system ✿ʕ ◕ᴥ◕ ʔ
    -- pointsFrame:RegisterEvent("CHAT_MSG_ADDON")
    -- No longer needed - journal points come via main attunement data
end

-- ＼ʕ •ᴥ•ʔ／✿ Setup logout/reload data saving ✿＼ʕ •ᴥ•ʔ／
function Messaging.SetupDataSaving()
    local logoutFrame = CreateFrame("Frame")
    logoutFrame:RegisterEvent("PLAYER_LOGOUT")
    logoutFrame:RegisterEvent("ADDON_LOADED")
    logoutFrame:SetScript("OnEvent", function(self, event, addonName)
        if event == "PLAYER_LOGOUT" or (event == "ADDON_LOADED" and addonName == "TheJournal") then
            if Journal_charDB then
                SaveFriendsData()
            end
        end
    end)
end

-- ʕ •ᴥ•ʔ✿ Initialize messaging system ✿ʕ •ᴥ•ʔ
function Messaging.Initialize()
    Messaging.HookSendAttunementData()
    -- Messaging.SetupPointsListener() -- ʕ •ᴥ•ʔ✿ Disabled
    Messaging.SetupDataSaving()
end

-- ʕ ◕ᴥ◕ ʔ✿ Export global functions ✿ʕ ◕ᴥ◕ ʔ
_G.Messaging = Messaging

-- ʕ ● ᴥ ●ʔ✿ Auto-initialize ✿ʕ ● ᴥ ●ʔ
Messaging.Initialize()

print("|cFF00FF00[DJ Messaging]|r Communication system loaded!")
