-- ##################################################################
-- # UIFriends.lua - Friends Data Management and Attunement Tracking
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Friends Management Module ✿ʕ•ᴥ•ʔ

local Friends = {}

-- ʕ ◕ᴥ◕ ʔ✿ Initialize persistent friends data ✿ʕ ◕ᴥ◕ ʔ
Journal_charDB.friendsAttunementData = Journal_charDB.friendsAttunementData or {}
Journal_charDB.friendsJournalPoints = Journal_charDB.friendsJournalPoints or {}

-- Initialize global friends data
if not _G.FRIENDS_ATTUNEMENT_DATA then
    _G.FRIENDS_ATTUNEMENT_DATA = {}
end
if not _G.FRIENDS_JOURNAL_POINTS then
    _G.FRIENDS_JOURNAL_POINTS = {}
end

-- ʕ ● ᴥ ●ʔ✿ Load saved friends data ✿ʕ ● ᴥ ●ʔ
local friendsLoaded = 0
for playerName, data in pairs(Journal_charDB.friendsAttunementData) do
    _G.FRIENDS_ATTUNEMENT_DATA[playerName] = data
    friendsLoaded = friendsLoaded + 1
end

local pointsLoaded = 0
for playerName, points in pairs(Journal_charDB.friendsJournalPoints) do
    _G.FRIENDS_JOURNAL_POINTS[playerName] = points
    pointsLoaded = pointsLoaded + 1
end

-- ʕノ•ᴥ•ʔノ✿ Initialize friends frame and data tracking ✿ʕノ•ᴥ•ʔノ

-- Function to save friends data to saved variables
local function SaveFriendsData()
    Journal_charDB.friendsAttunementData = _G.FRIENDS_ATTUNEMENT_DATA
    Journal_charDB.friendsJournalPoints = _G.FRIENDS_JOURNAL_POINTS
end

-- Function to auto-send our data when frame is shown
local function AutoSendData()
    if _G.AddSelfToFriendsData then
        _G.AddSelfToFriendsData()
        local playerName = UnitName("player")
        if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
            _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
            if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
                _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
            end
            if Journal_charDB then
                SaveFriendsData()
            end
        end
    end
end

-- Call AutoSendData after initial load for leaderboard
C_Timer.After(1, AutoSendData)

-- ʕ ◕ᴥ◕ ʔ✿ Global exports for friends data functions ✿ʕ ◕ᴥ◕ ʔ
_G.SaveFriendsData = SaveFriendsData
_G.AutoSendData = AutoSendData

-- Additional logic to manage friends frame UI
-- Logic should be implemented as needed based on new module requirements

-- ʕノ•ᴥ•ʔノ✿ Auto-initialize ✿ʕノ•ᴥ•ʔノ
-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ

