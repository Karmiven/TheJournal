-- ##################################################################
-- # UIBountySystem.lua - Bounty System Management
-- ##################################################################

-- ʕ •ᴥ•ʔ✿ Bounty System Module ✿ʕ•ᴥ•ʔ

local BountySystem = {}

-- ʕ ◕ᴥ◕ ʔ✿ Bounty system configuration ✿ʕ ◕ᴥ◕ ʔ
local BOUNTY_ICON = {
    SIZE = 16,
    TEXTURE = 'Interface/MoneyFrame/UI-GoldIcon',
}

-- ʕ ● ᴥ ●ʔ✿ Helper function to extract item ID from item link ✿ʕ ● ᴥ ●ʔ
local function GetItemIDFromLink(itemLink)
    if not itemLink then return nil end
    local itemID = string.match(itemLink, "item:(%d+)")
    return tonumber(itemID)
end

-- ʕノ•ᴥ•ʔノ✿ Check if an item is bountied ✿ʕノ•ᴥ•ʔノ
local function IsItemBountied(itemId)
    if not itemId or not _G.GetCustomGameData then return false end
    local bountiedValue = _G.GetCustomGameData(31, itemId)
    return (bountiedValue or 0) > 0
end

-- ＼ʕ •ᴥ•ʔ／✿ Set bounty icon on a frame ✿＼ʕ •ᴥ•ʔ／
function BountySystem.SetFrameBounty(frame, itemLink, iconFrame)
    local bountyFrameName = (frame:GetName() or "UnnamedFrame") .. '_Bounty'
    local bountyFrame = _G[bountyFrameName]
    local itemId = GetItemIDFromLink(itemLink)

    if itemId and IsItemBountied(itemId) then
        if not bountyFrame then
            bountyFrame = CreateFrame('Frame', bountyFrameName, frame)
            bountyFrame:SetWidth(BOUNTY_ICON.SIZE)
            bountyFrame:SetHeight(BOUNTY_ICON.SIZE)
            bountyFrame:SetFrameLevel(frame:GetFrameLevel() + 1)
            bountyFrame.texture = bountyFrame:CreateTexture(nil, 'OVERLAY')
            bountyFrame.texture:SetAllPoints()
            bountyFrame.texture:SetTexture(BOUNTY_ICON.TEXTURE)
        end
        bountyFrame:SetParent(frame)
        local targetFrame = iconFrame or frame
        bountyFrame:SetPoint('TOPRIGHT', targetFrame, 'TOPRIGHT', -2, -2)
        bountyFrame:Show()
    elseif bountyFrame then
        bountyFrame:Hide()
    end
end

-- ʕ •ᴥ•ʔ✿ Custom affix names for each dungeon ✿ʕ •ᴥ•ʔ
local DUNGEON_AFFIX_NAMES = {
    ["Hellfire Ramparts"] = "Scorched Earth",
    ["The Blood Furnace"] = "Shadow Dancer",
    ["Shattered Halls"] = "Blood Frenzy",
    ["The Mechanar"] = "Lightning Rod",
    ["The Botanica"] = "Thorn in Your Side",
    ["The Arcatraz"] = "Stay Close",
    ["Mana-Tombs"] = "Mana Burn",
    ["Sethekk Halls"] = "Cursed Luck",
    ["Shadow Labyrinth"] = "What Goes Around",
    ["Auchenai Crypts"] = "Healing Touch",
    ["The Slave Pens"] = "Chained Up",
    ["The Steamvault"] = "Pressure Cooker",
    ["The Underbog"] = "Contagion",
    ["Old Hillsbrad Foothills"] = "Temporal Flux",
    ["The Black Morass"] = "Escalation",
    ["Magisters' Terrace"] = "Speed Demon",
    ["The Culling of Stratholme"] = "Zombie Bomber",
    ["The Nexus"] = "High Risk High Reward",
    ["The Oculus"] = "Frozen Flight",
    ["Utgarde Keep"] = "Phoenix Rising",
    ["Utgarde Pinnacle"] = "Elemental Ward",
    ["Gundrak"] = "House Rules",
    ["Drak'Tharon Keep"] = "Shadow Links",
    ["Halls of Lightning"] = "Static Shock",
    ["Halls of Stone"] = "Stand Your Ground",
    ["Azjol-Nerub"] = "Sticky Situation",
    ["Ahn'kahet: The Old Kingdom"] = "Mind Games",
    ["Violet Hold"] = "Double Trouble",
    ["The Forge of Souls"] = "Spirit Guide",
    ["Pit of Saron"] = "Ice Ice Baby",
    ["Halls of Reflection"] = "Phantom Menace",
    ["Trial of the Champion"] = "Battle Scars"
}

-- ＼ʕ •ᴥ•ʔ／✿ Export global functions ✿＼ʕ •ᴥ•ʔ／
_G.BountySystem = BountySystem

-- ʕノ•ᴥ•ʔノ✿ Auto-initialize ✿ʕノ•ᴥ•ʔノ
-- ʕ •ᴥ•ʔ✿ Module loaded silently ✿ʕ •ᴥ•ʔ

