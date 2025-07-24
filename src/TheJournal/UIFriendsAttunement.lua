-- ##################################################################
-- # UIFriendsAttunement.lua
-- # ʕ •ᴥ•ʔ✿ Friends Attunement Management ✿ʕ•ᴥ•ʔ
-- ##################################################################

local UIFriendsAttunement = {}

-- ʕ •ᴥ•ʔ✿ Initialize global friends data ✿ʕ•ᴥ•ʔ
if not FRIENDS_ATTUNEMENT_DATA then
    FRIENDS_ATTUNEMENT_DATA = {}
end

if not FRIENDS_JOURNAL_POINTS then
    FRIENDS_JOURNAL_POINTS = {}
end

-- ʕ •ᴥ•ʔ✿ Load friends attunement data ✿ʕ•ᴥ•ʔ
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

-- ʕ •ᴥ•ʔ✿ Save friends data ✿ʕ•ᴥ•ʔ
function UIFriendsAttunement.SaveFriendsData()
    -- Initialize tables if they don't exist
    Journal_charDB.friendsAttunementData = Journal_charDB.friendsAttunementData or {}
    Journal_charDB.friendsJournalPoints = Journal_charDB.friendsJournalPoints or {}
    
    -- Initialize global tables if they don't exist
    _G.FRIENDS_ATTUNEMENT_DATA = _G.FRIENDS_ATTUNEMENT_DATA or {}
    _G.FRIENDS_JOURNAL_POINTS = _G.FRIENDS_JOURNAL_POINTS or {}
    
    -- Save attunement data (don't clear existing data, only update)
    for playerName, data in pairs(_G.FRIENDS_ATTUNEMENT_DATA) do
        Journal_charDB.friendsAttunementData[playerName] = data
    end
    
    -- Save journal points data (don't clear existing data, only update)
    for playerName, points in pairs(_G.FRIENDS_JOURNAL_POINTS) do
        Journal_charDB.friendsJournalPoints[playerName] = points
    end
end

-- ʕ •ᴥ•ʔ✿ Add current player to friends data ✿ʕ•ᴥ•ʔ
function UIFriendsAttunement.AddSelfToFriendsData()
    local playerName = UnitName("player")
    if _G.FRIENDS_DATA and _G.FRIENDS_DATA[playerName] then
        _G.FRIENDS_ATTUNEMENT_DATA[playerName] = _G.FRIENDS_DATA[playerName]
        -- Also add journal points
        if Journal_charDB.journalPoints and Journal_charDB.journalPoints > 0 then
            _G.FRIENDS_JOURNAL_POINTS[playerName] = Journal_charDB.journalPoints
        end
        UIFriendsAttunement.SaveFriendsData()
    end
end

-- Export the module
_G.TheJournal_UIFriendsAttunement = UIFriendsAttunement

return UIFriendsAttunement
