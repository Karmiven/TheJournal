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

-- ʕ •ᴥ•ʔ✿ Bounty frame registry to handle anonymous buttons ✿ʕ •ᴥ•ʔ
local bountyFrameRegistry = {}
local bountyFrameCounter = 0

-- ʕ ● ᴥ ●ʔ✿ Helper function to extract item ID from item link ✿ʕ ● ᴥ ●ʔ
local function GetItemIDFromLink(itemLink)
    if not itemLink then return nil end
    local itemID = string.match(itemLink, "item:(%d+)")
    return tonumber(itemID)
end

-- ʕノ•ᴥ•ʔノ✿ Check if an item is bountied ✿ʕノ•ᴥ•ʔノ
local function IsItemBountied(itemId)
    if not itemId then 
        return false 
    end
    
    if not _G.GetCustomGameData then 
        return false 
    end
    
    local bountiedValue = _G.GetCustomGameData(31, itemId)
    return (bountiedValue or 0) > 0
end

-- ＼ʕ •ᴥ•ʔ／✿ Set bounty icon on a frame ✿＼ʕ •ᴥ•ʔ／
function BountySystem.SetFrameBounty(frame, itemLink, iconFrame)
    -- ʕ •ᴥ•ʔ✿ Only run bounty system when journal is open ✿ʕ •ᴥ•ʔ
    if not _G.DungeonJournalFrame or not _G.DungeonJournalFrame:IsShown() then
        return
    end

    -- ʕ •ᴥ•ʔ✿ Validate inputs ✿ʕ •ᴥ•ʔ
    if not frame or not itemLink then 
        return 
    end

    local itemId = GetItemIDFromLink(itemLink)
    if not itemId then
        return
    end

    -- ʕ •ᴥ•ʔ✿ Get or create bounty frame using registry ✿ʕ •ᴥ•ʔ
    local bountyFrame = bountyFrameRegistry[frame]
    local isBountied = IsItemBountied(itemId)

    if itemId and isBountied then
        if not bountyFrame then
            bountyFrameCounter = bountyFrameCounter + 1
            local bountyFrameName = "DJ_BountyFrame_" .. bountyFrameCounter
            bountyFrame = CreateFrame('Frame', bountyFrameName, frame)
            bountyFrame:SetWidth(BOUNTY_ICON.SIZE)
            bountyFrame:SetHeight(BOUNTY_ICON.SIZE)
            bountyFrame:SetFrameLevel((frame:GetFrameLevel() or 200) + 2)
            bountyFrame.texture = bountyFrame:CreateTexture(nil, 'OVERLAY')
            bountyFrame.texture:SetAllPoints()
            bountyFrame.texture:SetTexture(BOUNTY_ICON.TEXTURE)
            
            -- ʕ •ᴥ•ʔ✿ Store in registry ✿ʕ •ᴥ•ʔ
            bountyFrameRegistry[frame] = bountyFrame
        end
        
        bountyFrame:SetParent(frame)
        local targetFrame = iconFrame or frame
        bountyFrame:ClearAllPoints()
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

-- ʕ •ᴥ•ʔ✿ Debug function to list all bountied items ✿ʕ •ᴥ•ʔ
function BountySystem.ListBountiedItems()
    if not _G.GetCustomGameData then
        print("BountySystem: GetCustomGameData function not available")
        return
    end
    
    local foundItems = {}
    
    -- ʕ •ᴥ•ʔ✿ Check items from current dungeon instead of scanning all items ✿ʕ •ᴥ•ʔ
    if _G.currentDungeon and _G.currentDungeon.items then
        for _, item in ipairs(_G.currentDungeon.items) do
            local itemId = item.itemID or item.baseID
            if itemId then
                local bountiedValue = _G.GetCustomGameData(31, itemId)
                if (bountiedValue or 0) > 0 then
                    table.insert(foundItems, itemId)
                    local itemName = GetItemInfo(itemId) or "Unknown Item"
                end
            end
        end
    end
    
    return foundItems
end

-- ʕ •ᴥ•ʔ✿ Debug function to test bounty on specific item ✿ʕ •ᴥ•ʔ
function BountySystem.TestBounty(itemId)
    local isBountied = IsItemBountied(itemId)
    local itemName = GetItemInfo(itemId) or "Unknown Item"
    return isBountied
end

-- ʕ •ᴥ•ʔ✿ Clean up bounty frame when button is released ✿ʕ •ᴥ•ʔ
function BountySystem.CleanupBountyFrame(frame)
    if bountyFrameRegistry[frame] then
        bountyFrameRegistry[frame]:Hide()
        bountyFrameRegistry[frame] = nil
    end
end

-- ʕ •ᴥ•ʔ✿ Clean up all bounty frames when journal closes ✿ʕ •ᴥ•ʔ
function BountySystem.CleanupAllBountyFrames()
    for frame, bountyFrame in pairs(bountyFrameRegistry) do
        if bountyFrame then
            bountyFrame:Hide()
        end
    end
    -- ʕ •ᴥ•ʔ✿ Keep frames in registry for reuse but hide them ✿ʕ •ᴥ•ʔ
end

-- ʕ •ᴥ•ʔ✿ Refresh all bounty frames when journal opens ✿ʕ •ᴥ•ʔ
function BountySystem.RefreshAllBountyFrames()
    if not _G.DungeonJournalFrame or not _G.DungeonJournalFrame:IsShown() then
        return
    end
    
    for frame, bountyFrame in pairs(bountyFrameRegistry) do
        if bountyFrame and frame.itemLink then
            -- ʕ •ᴥ•ʔ✿ Re-check bounty status and show if appropriate ✿ʕ •ᴥ•ʔ
            BountySystem.SetFrameBounty(frame, frame.itemLink, frame.iconTex)
        end
    end
end
-- ＼ʕ •ᴥ•ʔ／✿ Export global functions ✿＼ʕ •ᴥ•ʔ／
_G.BountySystem = BountySystem

-- ʕᴥ•ʔ Auto-initialize ✿ʕᴥ•ʔ


