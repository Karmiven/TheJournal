-- ##################################################################
-- # CONSTANTS / CONFIG
-- ##################################################################


BOSS_TRANSFORMS = {
    [14326] = {
        facing = 0,
        x = 0.10000007599592,
        y = 0,
        z = 0,
        scale = 1,
    },
    [22887] = {
        facing = 0,
        x = 0.30000016093254,
        y = 0,
        z = -2.0999999046326,
        scale = 1,
    },
    [11490] = {
        facing = 0,
        x = 0,
        y = -0.49999994039536,
        z = 0.20000007748604,
        scale = 1.7000000476837,
    },
    [15931] = {
        facing = 0,
        x = 0.4,
        y = 2.5,
        z = 0,
        scale = 0.3,
    },
    [16063] = {
        facing = 0,
        x = -0.4,
        y = 1.4,
        z = 0,
        scale = 0.9,
    },
    [15932] = {
        facing = 0,
        x = 0,
        y = 0,
        z = 0,
        scale = 0.80000001192093,
    },
    [16064] = {
        facing = 0,
        x = 0,
        y = 0,
        z = 0,
        scale = 0.6,
    },
    [14321] = {
        facing = 0,
        x = 0.10000007599592,
        y = 0,
        z = 0,
        scale = 1,
    },
    [16011] = {
        facing = 0,
        x = 0.20000007748604,
        y = 1.1000001430511,
        z = 0,
        scale = 0.60000002384186,
    },
    [14322] = {
        facing = 0,
        x = 0.10000007599592,
        y = 0,
        z = 0,
        scale = 1,
    },
    [15989] = {
        facing = 0,
        x = 0,
        y = 6,
        z = 2,
        scale = 0.3,
    },
    [33113] = {
        facing = 0.35999995470047,
        x = -13.300000190735,
        y = 1.8000003099442,
        z = -20,
        scale = 0.80000001192093,
    },
    [22898] = {
        facing = 0,
        x = -0.49999985098839,
        y = 1.700000166893,
        z = -10,
        scale = 1.3999999761581,
    },
    [11501] = {
        facing = 0,
        x = 0.10000007599592,
        y = 0,
        z = 0,
        scale = 1,
    },
    [12201] = {
        facing = 0,
        x = 0,
        y = 0,
        z = 0,
        scale = 0.9,
    },
    [33293] = {
        facing = 0,
        x = 0.30000007152557,
        y = 5,
        z = 0,
        scale = 0.60000002384186,
    },
    [10440] = {
        facing = 0,
        x = -0.49999994039536,
        y = 1.4000000953674,
        z = -0.3999999165535,
        scale = 0.69999998807907,
    },
    [30549] = {
        facing = 0,
        x = -0.5,
        y = 1.3,
        z = 0,
        scale = 0.9,
    },
    [11489] = {
        facing = 0,
        x = 0,
        y = -5,
        z = -2.8999998569489,
        scale = 2,
    },
    [23420] = {
        facing = 0,
        x = 0,
        y = -1.799999833107,
        z = -8.5,
        scale = 1.2000000476837,
    },
}

_G.armorSlotList = {
    "Head", "Neck", "Shoulder", "Back", "Chest", "Wrist", "Hands",
    "Waist", "Legs", "Feet", "Finger", "Trinket",
}

-- Assign slotIcons to _G
_G.slotIcons = {
    Head     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Head",
    Neck     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Neck",
    Shoulder = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Shoulder",
    Back     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest",
    Chest    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest",
    Wrist    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Wrists",
    Hands    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Hands",
    Waist    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Waist",
    Legs     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Legs",
    Feet     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Feet",
    Finger   = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Finger",
    Trinket  = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Trinket",

    Cloth    = "Interface\\Icons\\inv_chest_cloth_26",
    Leather  = "Interface\\Icons\\inv_chest_leather_14",
    Mail     = "Interface\\Icons\\inv_chest_mail_15",
    Plate    = "Interface\\Icons\\inv_chest_plate20",
}

-- Assign weaponTypeList to _G
_G.weaponTypeList = {
    "Staff",
    "Daggers",
    "One-Handed Axes",
    "Two-Handed Axes",
    "One-Handed Maces",
    "Two-Handed Maces",
    "One-Handed Swords",
    "Two-Handed Swords",
    "Polearms",
    "Fist Weapons",
    "Bows",
    "Guns",
    "Crossbows",
    "Shield",
    "Wands",
    "Off-hand",
    "Idols",
    "Totems",
}

-- Assign weaponIcons to _G
_G.weaponIcons = {
    ["Staff"]             = "Interface\\Icons\\INV_Staff_13",
    ["Daggers"]           = "Interface\\Icons\\inv_dagger_01",
    ["One-Handed Axes"]   = "Interface\\Icons\\inv_axe_04",
    ["Two-Handed Axes"]   = "Interface\\Icons\\inv_axe_08",
    ["One-Handed Maces"]  = "Interface\\Icons\\inv_mace_01",
    ["Two-Handed Maces"]  = "Interface\\Icons\\inv_hammer_16",
    ["One-Handed Swords"] = "Interface\\Icons\\inv_sword_04",
    ["Two-Handed Swords"] = "Interface\\Icons\\inv_sword_10",
    ["Polearms"]          = "Interface\\Icons\\inv_spear_07",
    ["Fist Weapons"]      = "Interface\\Icons\\inv_gauntlets_04",
    ["Bows"]              = "Interface\\Icons\\inv_weapon_bow_05",
    ["Guns"]              = "Interface\\Icons\\inv_weapon_rifle_01",
    ["Crossbows"]         = "Interface\\Icons\\inv_weapon_crossbow_01",
    ["Shield"]            = "Interface\\Icons\\inv_shield_06",
    ["Wands"]             = "Interface\\Icons\\inv_wand_02",
    ["Off-hand"]          = "Interface\\Icons\\inv_misc_book_16",
    ["Idols"]             = "Interface\\Icons\\inv_relics_idol",
    ["Totems"]            = "Interface\\Icons\\inv_relics_totem",
}
