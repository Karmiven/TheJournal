-- local mp_versions = {}
_G.Journal = _G.Journal or {}
_G.Journal.djDungeons = _G.Journal.djDungeons or {}
local itemdir = "Interface\\Addons\\TheJournal\\Assets\\Magister Kalendris.blp"

table.insert(Journal.djDungeons, {
    name = "Violet Hold",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-VioletHold.blp",
    bosses = {
        {
            bossID = 31134,
            name   = "Cyanigosa",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                icon        = "Interface\\Icons\\spell_arcane_portalironforge",
                name        = "Arcane Vacuum",
                description = "Summons all nearby enemy targets to the location of the caster.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 3,
              },
              {
                icon        = "Interface\\Icons\\spell_frost_icestorm",
                name        = "Blizzard",
                description = "Calls down a blizzard that lasts 8 sec., inflicting 3000 Frost damage every 2 sec. and slowing the movement speed of all enemies in a selected area by 40%.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 3,
              },
              {
                icon        = "Interface\\Icons\\spell_arcane_blast",
                name        = "Uncontrollable Energy",
                description = "A torrent of Arcane energy is released, dealing 7125 to 7875 Arcane damage to enemies in front of caster. Enemy targets also take 2000 Arcane damage every 3 sec. for 15 sec.",
                duration    = 0,
                casttime    = 2,
                cooldown    = 0,
              },
            },
        },
        {
            bossID = 29315,
            name   = "Erekem",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_nature_bloodlust",
                    name        = "Bloodlust",
                    description = "Increases melee, ranged, and spell casting speed by 35% for all party members.  Lasts 20 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_strength",
                    name        = "Break Bonds",
                    description = "Breaks all nearby friends within 20 yards out of snares, crowd-control and stunning effects.",
                    duration    = 0,
                    casttime    = 2.5,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_healingwavegreater",
                    name        = "Chain Heal",
                    description = "Infuses a wounded ally with healing energy that spreads to another nearby ally. The spell affects up to 3 targets.",
                    duration    = 0,
                    casttime    = 1,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_skinofearth",
                    name        = "Earth Shield",
                    description = "Protects the target with an earthen shield, causing melee attacks to heal the shielded target.  This effect can only occur once every few seconds.  20 charges.  Lasts 2 min.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_earthshock",
                    name        = "Earth Shock",
                    description = "Shocks an enemy with concussive force, inflicting Nature damage and interrupting the spell being cast for 2 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },

            },
        },
        {
            bossID = 29313,
            name   = "Ichoron",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_nature_crystalball",
                    name        = "Protective Bubble",
                    description = "Shields the caster in a bubble of water, reducing damage taken by 99%.  Each attack or spell hit against the caster will remove one charge.  Lasts until cancelled or until 35 charges are used.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  }
            },
        },
        {
            bossID = 29312,
            name   = "Lavanthor",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_fire_volcano",
                    name        = "Cauterizing Flames",
                    description = "Inflicts 3238 to 3762 Fire damage to nearby enemies and increases the Fire damage it takes by 35% for 3 min.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0,
                  }
            },
        },
        {
            bossID = 29316,
            name   = "Moragg",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_painspike",
                    name        = "Ray of Pain",
                    description = "Inflicts 2000 Shadow damage to an enemy and leaves it wounded, reducing the effectiveness of any healing by 15% for 5 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_arcane_arcanetorrent",
                    name        = "Optic Link",
                    description = "Channels a beam of dark energy at the target, causing Shadow damage over 12 sec. This damage is dealt slowly at first, and builds up as the channel reaches its full duration.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\ability_creature_poison_02",
                    name        = "Corrosive Saliva",
                    description = "Lick the enemy, covering it in saliva that eats away 5% of its armor per application.  Stacks up to 20 times.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_shadow_destructivesoul",
                    name        = "Ray of Suffering",
                    description = "Deals Shadow damage to a single target over time.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
        },
        {
            bossID = 29266,
            name   = "Xevozz",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_arcane_arcanetorrent",
                    name        = "Summon Ethereal Sphere",
                    description = "Summons an Ethereal Sphere to aid the caster in battle.",
                    duration    = 0,
                    casttime    = 2.5,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_arcane_arcane04",
                    name        = "Arcane Buffet",
                    description = "Inflicts 1758 to 2042 Arcane damage to an enemy and increases the Arcane damage it takes by 300 for 20 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_arcane_arcane04",
                    name        = "Arcane Barrage Volley",
                    description = "Launches missiles at enemies, causing 3608 to 4192 Arcane damage.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
        },
        {
            bossID = 29314,
            name   = "Zuramat the Obliterator",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                icon        = "Interface\\Icons\\spell_shadow_mindtwisting",
                name        = "Void Shift",
                description = "Violently shifts the target into the void, dealing 1600 Shadow damage per second. At the end of this effect, the target is fully shifted into the void and is able to see hidden void creatures.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 0,
              },
              {
                icon        = "Interface\\Icons\\spell_shadow_summonvoidwalker",
                name        = "Summon Void Sentry",
                description = "Summons a Void Sentry.",
                duration    = 0,
                casttime    = 1,
                cooldown    = 0,
              },
              {
                icon        = "Interface\\Icons\\spell_shadow_gathershadows",
                name        = "Shroud of Darkness",
                description = "Surrounds the caster in a shroud of darkness. Whenever the caster is damaged, healing received by the attacker is reduced by 30% for 10 sec.",
                duration    = 0,
                casttime    = 2,
                cooldown    = 0,
              },
            },
        },
    },
    versions = mp_versions,
    items = { 35642,35643,35644,35645,35646,35647,35649,35650,35651,35652,35653,35654,37861,37862,37867,37868,37869,37870,37871,37872,37873,37874,37875,37876,37883,37884,37886,37889,37890,43353,43358,43363,43375,43382,43387,43401,43402,43403,43404,43405,43406,43407,43408,43409,43410,43500,60127,62565,62566,62567,62568,62569,62570,62571,62572,62573,62574,62575,62576,62577,62578,62579,62580,62581,62582,62583,62584,62585,62586,62587,62588,62589,62590,62591,62592,62593,62594,62595,62596,62597,62598,62599,62600,62601,62602,62603,62604,63064,63065,63066,63067,63068,63069,63070,63071,63072,63073,63074,63075,63076,63077,63078,63079,63080,63081,63082,63083,63084,63085,63086,63087,63088,63089,63090,63091,63092,63093,63094,63095,63096,63097,63098,63099,63100,63101,63102,63103,63104,63105,63106,63107,63108,63109,63110,63111,63112,63113,63114,63115,63116,63117,63118,63229,63230,63231,63232,63233,63234,63235,63236,63237,63238,63239,63240,63241,63242,63243,63244,63245,63246,63247,63248,63249,63250,63251,63252,63253,63254,63255,63256,63257,63258,63259,63260,63261,63262,63263,63264,63265,63266,63267,63268,63269,63270,63271,63272,63273,63274,63275,63276,63277,63278,63279,63280,63281,63282,63283,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590 },
})

table.insert(Journal.djDungeons, {
    name = "Naxxramas",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Naxxramas.blp",
    bosses = {
        {
            bossID = 15956,
            name   = "Anub'Rekhan",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_backstab",
                    name        = "|cffF0E68CImpale|r",
                    description = "Spikes pierce the floor and then rise up, dealing |cffB222225688 to 7312 Physical damage|r and knocking up enemy targets in a line away from the caster.\n\nTips:\n• |cff87CEEBMove Sideways:|r Always move perpendicular to Anub'Rekhan to avoid being hit by the spikes.\n• |cff87CEEBAvoid Knock-up:|r Prioritize avoiding this to prevent interruptions or delays.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 15, -- Corrected from 3, based on description
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_insectswarm",
                    name        = "|cff90EE90Locust Swarm|r",
                    description = "Anub'Rekhan releases a locust swarm, slowing his movement by |cff87CEEB25%|r and damaging all nearby enemies. Nearby enemies are |cffff0000unable to attack or cast spells|r.\n\nTips:\n• |cff87CEEBCreate Distance:|r Move away from Anub'Rekhan when he casts this to avoid the silence and damage.",
                    duration    = 15, -- Assuming duration of effect, not explicit in original
                    casttime    = 3,
                    cooldown    = 90, -- Corrected from 20, based on description
                },
            },
        },
        {
            bossID = 15953,
            name   = "Grand Widow Faerlina",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_unholyfrenzy",
                    name        = "|cffC04000Frenzy|r",
                    description = "Grand Widow Faerlina's primal rage! Increases her |cff87CEEBattack speed by 50%|r and |cffF0E68CPhysical damage by 150|r for 30 min. If not dispelled, she will attempt to reapply it every minute.\n\nTips:\n• |cffF0E68CDPS Check:|r This is a direct test of your damage output and ability to manage mechanics.\n• |cffF0E68CRemove Enrage:|r Bring a |cffADD8E6Worshipper|r near Faerlina. Defeat the Worshipper when she casts |cffADD8E6Widow's Embrace|r to remove her Frenzy.\n• |cffF0E68CSustain Damage:|r Be ready for high incoming damage if Frenzy is active. Use defensive cooldowns and healing to sustain yourself.",
                    duration    = 30 * 60, -- 30 minutes
                    casttime    = 0,
                    cooldown    = 60,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_incinerate",
                    name        = "|cffFFA500Rain of Fire|r",
                    description = "Grand Widow Faerlina calls down a volley of fire, dealing |cffFFA500Fire damage|r in an area on the ground. Casts every |cff87CEEB8-18 seconds|r.\n\nTips:\n• |cff87CEEBMove Out:|r Always move out of the visual effect on the ground to avoid continuous damage.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_corrosivebreath",
                    name        = "|cff90EE90Poison Bolt Volley|r",
                    description = "Grand Widow Faerlina hurls a volley of poisonous bolts at her current target, dealing |cff90EE90Poison damage|r. Casts every |cff87CEEB7-15 seconds|r.\n\nTips:\n• |cff87CEEBSustain Healing:|r Be prepared for consistent incoming damage from this spell.\n• |cff87CEEBMitigation:|r Use any available defensive cooldowns or damage reduction abilities to lessen the impact of these bolts.\n• |cff87CEEBCleanse (If Possible):|r If you have a dispel for Poison effects, use it immediately to remove any lingering debuffs.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 15952,
            name   = "Maexxna",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_unholyfrenzy",
                    name        = "|cffC04000Frenzy|r",
                    description = "Increases the caster's attack speed by |cff87CEEB50%|r and the |cffF0E68CPhysical damage|r it deals by |cffF0E68C75%|r for |cff87CEEB10 min|r.\n\nTips:\n• |cffF0E68CBurst Damage:|r This is a soft enrage. Be ready with high burst damage to finish her off quickly.\n• |cffF0E68CDefensive Cooldowns:|r Expect significantly increased incoming damage and use powerful defensives.",
                    duration    = 10 * 60, -- 10 minutes
                    casttime    = 0,
                    cooldown    = 0, -- Cast at health %
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_acid_01",
                    name        = "|cff90EE90Poison Shock|r",
                    description = "Inflicts |cff90EE904550 to 5850 Nature damage|r to nearby enemies in front of the caster.\n\nTips:\n• |cff87CEEBDodge the Cone:|r Move out of Maexxna's frontal cone to avoid taking damage.\n• |cff87CEEBStay Behind:|r Always try to position yourself behind the boss if possible.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\ability_creature_poison_03",
                    name        = "|cff9400D3Necrotic Poison|r",
                    description = "Reduces healing by |cff87CEEB90%|r for |cff87CEEB30 sec|r.\n\nTips:\n• |cffF0E68CDispel Priority:|r This is a priority dispellable debuff if your class has access to it.\n• |cffF0E68CPre-emptive Healing:|r If you cannot dispel, use strong healing-over-time effects before the debuff is applied.",
                    duration    = 30, -- Based on description
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_web",
                    name        = "|cff8B4513Web Spray|r",
                    description = "Web sprays out everywhere, |cffff0000stunning|r all nearby enemies for |cff87CEEB6 sec|r and dealing |cff90EE905225 to 5775 Nature damage|r.\n\nTips:\n• |cff87CEEBBreak Free:|r Use abilities that remove stun effects, if available.",
                    duration    = 6, -- Based on description
                    casttime    = 0,
                    cooldown    = 40,
                },
            },
        },
    
        -- === Plague Quarter ===
        {
            bossID = 15954,
            name   = "Noth the Plaguebringer",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_cripple",
                    name        = "|cff9ACD32Cripple|r",
                    description = "Increases the time between an enemy's attacks by |cff87CEEB100%|r and its movement by |cff87CEEB50%|r, in addition to reducing its Strength by |cff87CEEB50%|r. Lasts |cff87CEEB15 sec|r.\n\nTips:\n• |cffF0E68CDispel Priority:|r This is a priority dispellable debuff if your class has access to it.\n• |cffF0E68CMaintain Mobility:|r If you cannot dispel, use abilities to increase movement speed or become immune to movement impairments.",
                    duration    = 15, -- Based on description
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
        {
            bossID = 15936,
            name   = "Heigan the Unclean",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_misc_discoball_01",
                    name        = "|cffADD8E6Heigan's Dance|r",
                    description = "This boss features the infamous dancing mechanic where players will need to move quickly around the room to avoid explosions of toxic sludge.\n\nTips:\n• |cffF0E68CLearn the Pattern:|r Master the movement pattern for each phase to safely navigate the room.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 16011,
            name   = "Loatheb",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_creature_disease_05",
                    name        = "|cff40E0D0Necrotic Aura|r",
                    description = "A wave of necrotic energy fills the room, completely |cffff0000preventing all healing effects|r for |cff87CEEB17 sec|r.\n\nTips:\n• |cffF0E68CPrepare Defensives:|r Anticipate this ability and use strong damage reduction or shield abilities before it hits.\n• |cffF0E68CBurst Damage:|r This is a prime window to use offensive cooldowns as no healing can occur.",
                    duration    = 17, -- Based on description
                    casttime    = 0,
                    cooldown    = 20,
                },
                {
                    icon        = "Interface\\Icons\\inv_mushroom_09",
                    name        = "|cff90EE90Summon Spore|r",
                    description = "Summons a Spore that lasts for |cff87CEEB1.50 min|r.\n\nTips:\n• |cff87CEEBKill Spores:|r Prioritize killing the spawned spores.\n• |cffF0E68CBenefit from Pool:|r Stand in the pool left by a defeated spore to gain |cffF0E68CFungal Creep|r, increasing critical hit chance and removing threat generation.",
                    duration    = 90, -- 1.50 min in seconds
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_regeneration_02",
                    name        = "|cffF0E68CFungal Creep|r",
                    description = "Increases the |cff87CEEBcritical hit chance|r of the target by |cff87CEEB50%|r. Spells and abilities also |cff90EE90cease causing threat|r.\n\nTips:\n• |cff87CEEBMaximize DPS:|r This is your window to unleash maximum damage without worrying about threat.\n• |cff87CEEBCoordinate:|r Ensure you are in the correct position to gain the buff from a killed spore.",
                    duration    = 0, -- Buff duration not specified, but effect is clear
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
    
        -- === Construct Quarter ===
        {
            bossID = 16028,
            name   = "Patchwerk",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_unholyfrenzy",
                    name        = "|cffC04000Frenzy|r",
                    description = "Increases the caster's attack speed by |cff87CEEB40%|r and the |cffF0E68CPhysical damage|r it deals by |cffF0E68C25%|r for |cff87CEEB5 min|r.\n\nTips:\n• |cffF0E68CFinal Burn:|r This is a soft enrage. Be ready with high burst damage to finish him quickly.",
                    duration    = 5 * 60, -- 5 minutes
                    casttime    = 0,
                    cooldown    = 0, -- Cast at health %
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_unholyfrenzy",
                    name        = "|cffC04000Berserk|r",
                    description = "Increases the caster's attack and movement speeds by |cff87CEEB150%|r and all damage it deals by |cffC04000500%|r for |cff87CEEB5 min|r. Also grants immunity to Taunt effects.\n\nTips:\n• |cffB2222CHard Enrage:|r This means a wipe unless Patchwerk is defeated very quickly.\n• |cffB2222CAbsolute Finality:|r Do not expect to survive for long if this cast completes.",
                    duration    = 5 * 60, -- 5 minutes
                    casttime    = 0,
                    cooldown    = 360, -- 360 seconds
                },
            },
        },
        {
            bossID = 15931,
            name   = "Grobbulus",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_nature_abolishmagic",
                    name        = "|cff90EE90Poison Cloud|r",
                    description = "A poison cloud appears which grows in area over |cff87CEEB1.25 min|r.\n\nTips:\n• |cff87CEEBControl Movement:|r Grobbulus leaves these clouds as he moves. Position him carefully to control where they spawn.\n• |cff87CEEBAvoid Standing In:|r Do not stand in the growing poison clouds as they deal heavy Nature damage.",
                    duration    = 75, -- 1.25 min in seconds
                    casttime    = 0,
                    cooldown    = 8,
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_corrosivebreath",
                    name        = "|cff90EE90Slime Spray|r",
                    description = "Slime sprays out, dealing |cff90EE9011875 to 13125 Nature damage|r to enemies in front of Grobbulus. Enemies hit by Slime Spray |cffADD8E6summon a Fallout Slime|r.\n\nTips:\n• |cffB2222CDodge the Spray:|r Always move out of Grobbulus's frontal cone to avoid both the damage and summoning additional adds.\n• |cffB2222CManage Adds:|r If Fallout Slimes are summoned, prioritize eliminating them quickly.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
        {
            bossID = 15932,
            name   = "Gluth",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_corpseexplode",
                    name        = "|cffFFA500Zombie Party!|r",
                    description = "Gluth summons |cff87CEEB2-3 zombies|r every |cff87CEEB15 seconds|r. These zombies, upon reaching Gluth, will be consumed by him, |cff90EE90healing Gluth by 5%|r of his maximum health.\n\nTips:\n• |cff87CEEBIntercept Zombies:|r Prevent zombies from reaching Gluth by killing them before they get to him.\n• |cff87CEEBArea Damage:|r Use AoE abilities to quickly clear multiple zombies per wave.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 15, -- Based on description
                },
                {
                    icon        = "Interface\\Icons\\inv_misc_food_18",
                    name        = "|cffDC143CDecimate|r",
                    description = "Reduce the current health of all nearby units to |cff87CEEB5%|r of their maximum health. Cast every |cff87CEEB100 seconds|r.\n\nTips:\n• |cffF0E68CPrepare Healing:|r Be prepared for a strong healing requirement or defensive cooldowns after this ability to recover from reduced health.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 100, -- Based on description
                },
                {
                    icon        = "Interface\\Icons\\ability_criticalstrike",
                    name        = "|cffB22222Mortal Wound|r",
                    description = "A punishing blow strikes the target, reducing the effectiveness of healing spells by |cff87CEEB10%|r. Cast every |cff87CEEB10 seconds|r.\n\nTips:\n• |cff87CEEBIncreased Healing:|r Be prepared to use stronger healing spells or increased healing output to counter the reduction.\n• |cff87CEEBCleanse (If Possible):|r If the ability is a debuff, remove it if your class has a dispel.",
                    duration    = 0, -- Assumed duration if it's a debuff
                    casttime    = 0,
                    cooldown    = 10, -- Based on description
                },
            },
        },
        {
            bossID = 15928,
            name   = "Thaddius",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_stealth",
                    name        = "|cff87CEEBOne Shot Consideration|r",
                    description = "If you are able to one-shot this target, ensure you are in combat with the final add before the Phase Two transition, or Thaddius will fail to phase.\n\nTips:\n• |cffF0E68CEngagement Timing:|r Ensure combat has started with the last add before dealing the killing blow.\n• |cffF0E68CPhase Skip Risk:|r Skipping the mechanic too quickly can lead to a soft-lock, requiring a reset.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 10,
                },
                {
                    icon        = "Interface\\Icons\\spell_lightning_lightningbolt01",
                    name        = "|cffADD8E6Ball Lightning|r",
                    description = "Inflicts |cffADD8E617500 to 22500 Nature damage|r to the enemy target.\n\nTips:\n• |cffF0E68CHeavy Single Target:|r Be prepared for high single-target Nature damage.\n• |cffF0E68CDefensive Cooldowns:|r Use personal defensives to mitigate the incoming burst.",
                    duration    = 0,
                    casttime    = 1,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
    
        -- === Military Quarter ===
        {
            bossID = 16061,
            name   = "Instructor Razuvious",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_warrior_rampage",
                    name        = "|cffB22222Disrupting Shout|r",
                    description = "Scream fiercely, dealing |cffB222224275 to 4725 Physical damage|r to nearby enemies.\n\nTips:\n• |cff87CEEBAoE Damage:|r Be prepared for periodic AoE damage. Use minor defensives or healing as needed.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\inv_weapon_shortblade_12",
                    name        = "|cff8B4513Jagged Knife|r",
                    description = "Hurls a dagger at an enemy, inflicting |cffB222225088 to 5912 Physical damage|r immediately and |cffB222222000 damage|r every 1 sec for |cff87CEEB5 sec|r.\n\nTips:\n• |cffF0E68CHeal Through DoT:|r Be ready for a burst of initial damage followed by a strong bleed effect.\n• |cffF0E68CDispel (If Possible):|r If the bleed is a debuff, try to dispel it if your class allows.",
                    duration    = 5, -- Based on description
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
        {
            bossID = 16060,
            name   = "Gothik the Harvester",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_misc_discoball_01",
                    name        = "|cffDDA0DDPatience is Key|r",
                    description = "You must survive all |cff87CEEB23 waves|r of Gothik's minions before he becomes attackable. Waves consist of |cffADD8E6 Trainees|r, |cffF0E68C Knights|r, and |cffB22222 Riders|r, each with unique abilities.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBPrioritize Targets:|r Focus fire on |cffADD8E6 Living Trainees|r first to quickly reduce incoming |cffADD8E6 Death Plague|r damage. Then, deal with |cffF0E68C Living Knights|r to prevent stacking |cffF0E68C Shadow Mark|r. Save |cffB22222 Living Riders|r for last unless their AoE becomes overwhelming.\n• |cff87CEEBUtilize Cooldowns Wisely:|r Save defensive cooldowns for waves with multiple Knights or Riders, or when you anticipate heavy incoming damage. Offensive cooldowns should be staggered to ensure you have burst for tougher waves or saved for Gothik.\n• |cff87CEEBMovement is Key:|r Don't stand still! Dodge incoming Shadow Bolts and other detrimental effects.\n• |cff87CEEBSelf-Sufficiency:|r Utilize all your healing, mitigation, and crowd control abilities. Dispel |cffADD8E6 Death Plague|r or |cffF0E68C Shadow Mark|r if your class allows.\n• |cff87CEEBArena Awareness:|r Keep an eye on add spawn points from the three gates on the Living side.\n• |cff87CEEBNo Rush:|r This fight is timed. Focus on consistent damage and survival.\n• |cff87CEEBGothik's Descent:|r Once the final wave is spawned, Gothik will descend and become your primary target. Be ready!",
                    duration    = 0,
                    casttime    = 1,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 16065,
            name   = "Lady Blaumeux",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_mindtwisting",
                    name        = "|cffADD8E6Mark of Blaumeux|r",
                    description = "Inflicts |cff9400D3Shadow damage|r on all nearby enemies and leaves a mark. The damage inflicted is |cff87CEEBincreased by the number of mark stacks|r on the enemy.\n\nTips:\n• |cffF0E68CManage Stacks:|r High stacks of this mark can be lethal. Monitor your debuffs.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_icestorm",
                    name        = "|cff4B0082Void Zone|r",
                    description = "Summon a Void Zone that deals |cff9400D3Shadow damage|r to enemies that stand within it.\n\nTips:\n• |cff87CEEBMove Out:|r Avoid standing in these shadowy areas on the ground to prevent continuous damage.",
                    duration    = 0, -- Duration of the zone, not explicit in original
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_shadowbolt",
                    name        = "|cff9400D3Shadow Bolt|r",
                    description = "Hurls a bolt of dark magic at an enemy, inflicting |cff9400D3Shadow damage|r.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_shadowbolt",
                    name        = "|cff9400D3Unyielding Pain|r",
                    description = "Dark magic lashes out at every enemy, inflicting |cff9400D35655 to 6345 Shadow damage|r. Cast when no targets are in melee range.\n\nTips:\n• |cffF0E68CStay Engaged:|r This spell is a punishment for not being in melee range. Ensure you are in melee to avoid it.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
        {
            bossID = 16064,
            name   = "Thane Korth'azz",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_metamorphosis",
                    name        = "|cffADD8E6Mark of Korth'azz|r",
                    description = "Inflicts |cffF5DEB3Holy damage|r on all nearby enemies and leaves a mark. The damage inflicted is |cff87CEEBincreased by the number of mark stacks|r on the enemy.\n\nTips:\n• |cffF0E68CManage Stacks:|r High stacks of this mark can be lethal. Monitor your debuffs.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_fireball02",
                    name        = "|cffFFA500Meteor|r",
                    description = "Deals |cffFFA500Fire damage|r divided up evenly among all affected targets.\n\nTips:\n• |cff87CEEBDamage Mitigation:|r This damage is split. Be prepared for the portion you receive.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
        {
            bossID = 30549, -- Baron Rivendare is part of the Four Horsemen in Military Quarter
            name   = "Baron Rivendare",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_soulleech_3",
                    name        = "|cffADD8E6Mark of Rivendare|r",
                    description = "Inflicts |cff9400D3Shadow damage|r on all nearby enemies and leaves a mark. The damage inflicted is |cff87CEEBincreased by the number of mark stacks|r on the enemy.\n\nTips:\n• |cffF0E68CManage Stacks:|r Be aware of your stack count, as high stacks can lead to lethal damage.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_shadowfury",
                    name        = "|cff9400D3Unholy Shadow|r",
                    description = "Shadowy energy lashes out, inflicting |cff9400D32160 to 2640 Shadow damage|r and a further |cff9400D3600 damage|r every 1 sec for |cff87CEEB8 sec|r.\n\nTips:\n• |cff87CEEBSustain Healing:|r Be prepared for consistent incoming Shadow damage over time.\n• |cff87CEEBDefensive Cooldowns:|r Use personal defensive abilities to mitigate the ongoing damage.",
                    duration    = 8, -- Based on description
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown, just cast
                },
            },
        },
        {
            bossID = 16063,
            name   = "Sir Zeliek",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_soulleech_2",
                    name        = "|cffADD8E6Mark of Zeliek|r",
                    description = "Inflicts |cffF5DEB3Holy damage|r on all nearby enemies and leaves a mark. The damage inflicted is |cff87CEEBincreased by the number of mark stacks|r on the enemy.\n\nTips:\n• |cffF0E68CManage Stacks:|r High stacks will become very painful due to increased damage.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_siphonmana",
                    name        = "|cffF5DEB3Holy Wrath|r",
                    description = "Sends bolts of holy power in all directions, causing |cffF5DEB3900 to 1100 Holy damage|r to the target and other nearby enemy targets, increasing by |cff87CEEB50%|r between each jump.\n\nTips:\n• |cff87CEEBMaintain Distance:|r The damage increases with each jump, so distance can help reduce total damage.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_holy_searinglight",
                    name        = "|cffF5DEB3Holy Bolt|r",
                    description = "Hurls a bolt of light magic at an enemy, inflicting |cffF5DEB3Holy damage|r.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_holy_searinglight",
                    name        = "|cffF5DEB3Condemnation|r",
                    description = "Light magic lashes out at every enemy, inflicting |cffF5DEB35655 to 6345 Holy damage|r.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
            },
        },
    
        -- === Frostwyrm Lair ===
        {
            bossID = 15989,
            name   = "Sapphiron",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_warrior_cleave",
                    name        = "|cffB22222Cleave|r",
                    description = "Inflicts normal damage plus |cffB2222250 Physical damage|r to an enemy and its nearest allies, affecting up to |cff87CEEB10 targets|r.\n\nTips:\n• |cffF0E68CFace Away:|r If possible, avoid standing in front of Sapphiron to minimize damage taken.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_frostshock",
                    name        = "|cffADD8E6Frost Aura|r",
                    description = "Deals |cffADD8E61600 Frost damage|r every |cff87CEEB2 sec|r to all nearby enemies.",
                    duration    = 0, -- Constant aura
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_freezingbreath",
                    name        = "|cffADD8E6Summon Blizzard|r",
                    description = "Summons a Blizzard at the location of a nearby enemy.\n\nTips:\n• |cffF0E68CMove Out:|r Quickly move out of the Blizzard effect on the ground to avoid damage.",
                    duration    = 0, -- Duration of the Blizzard itself
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\inv_misc_monsterscales_05",
                    name        = "|cff8B4513Tail Sweep|r",
                    description = "Inflicts |cffB222221500 to 2500 damage|r on enemies in a cone behind the caster, |cffff0000knocking them back|r.\n\nTips:\n• |cffF0E68CAvoid Behind:|r Do not stand directly behind Sapphiron to avoid this knockback and damage.\n• |cffF0E68CPrevent Disorientation:|r Being knocked back can interrupt casts or delay movement.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_arcticwinds",
                    name        = "|cffADD8E6Frost Breath|r",
                    description = "Inflicts |cffADD8E6112500 to 187500 Frost damage|r to all nearby enemies. This is a significant |cff87CEEBFrost Resistance check|r.\n\nTips:\n• |cffF0E68CIncrease Frost Resistance:|r Maximize your Frost Resistance gear or buffs.\n• |cffF0E68CPersonal Defensives:|r Use strong personal defensive cooldowns to mitigate the massive damage. You cannot line of sight this ability.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0, -- Original implies no specific cooldown
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_glacier",
                    name        = "|cff87CEEBIcebolt|r", -- Corrected space here
                    description = "Encases the target in a solid block of ice, |cffff0000stunning|r the target and dealing |cff87CEEB7125 to 7875 Frost damage|r to the target and nearby enemies.\n\nTips:\n• |cffF0E68CBreak Ice/Defensive:|r If hit, break out of the ice or use strong personal defensives.",
                    duration    = 0, -- Duration of stun not specified, but effect is clear
                    casttime    = 0,
                    cooldown    = 45,
                },
            },
        },
        {
            bossID = 15990,
            name   = "Kel'Thuzad",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_nightofthedead",
                    name        = "|cff808080Phase One: Minion Onslaught|r",
                    description = "Upon engagement, Kel'Thuzad remains |cffADD8E6immune and passive|r on his platform, channeling his dark power. This phase lasts for |cff87CEEB3 minutes and 48 seconds (228 seconds)|r before Dungeon Speedup Buff.\n\nDuring this time, you must survive relentless waves of his minions:\n• |cffADD8E6Soldiers of the Frozen Wastes|r: Regular melee attackers.\n• |cffF0E68CUnstoppable Abominations|r: Large, hard-hitting foes.\n• |cffADD8E6Soul Weavers|r: Casters with various abilities.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBPrioritize Adds:|r Focus on controlling and eliminating the incoming waves to reduce pressure.\n• |cff87CEEBManage Spawns:|r Adds will spawn from various points around the arena, including initial large groups. Be ready for them.\n• |cff87CEPBConserve Resources:|r Since Kel'Thuzad himself is immune, use your cooldowns judiciously to clear waves efficiently while saving some for Phase Two.",
                    duration    = 228, -- Based on description
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_frostbolt02",
                    name        = "|cffADD8E6Frostbolt|r",
                    description = "Kel'Thuzad hurls a bolt of ice at his current target, dealing |cffADD8E6Frost damage|r. This is one of his primary attacks. Casts every |cff87CEEB2-10 seconds|r.\n\nTips:\n• |cff87CEEBFreedom/Dispel:|r Use abilities that grant movement freedom or remove movement impairing effects if targeted.\n• |cff87CEEBStay Mobile:|r Be prepared for constant incoming damage and potential slows.",
                    duration    = 4, -- Based on description
                    casttime    = 0,
                    cooldown    = 8,
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_frostbolt02",
                    name        = "|cffADD8E6Frost Bolt (Multi)|r",
                    description = "Kel'Thuzad unleashes a volley of icy bolts, striking multiple targets for |cffADD8E6Frost damage|r. Casts every |cff87CEEB15-30 seconds|r.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_creepingplague",
                    name        = "|cff9400D3Shadow Fissure|r",
                    description = "Kel'Thuzad creates a volatile fissure on the ground that erupts after a short delay, dealing |cff9400D3Shadow damage|r to anyone caught in the explosion. Casts every |cff87CEEB25 seconds|r.\n\nTips:\n• |cffF0E68CMove Immediately:|r Always move out of the dark void zones on the ground as soon as they appear.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 25,
                },
                {
                    icon        = "Interface\\Icons\\spell_arcane_blast",
                    name        = "|cffF0E68CDetonate Mana|r",
                    description = "Kel'Thuzad targets a random mana-using player. After a short delay, their mana detonates, dealing |cffF0E68CArcane damage|r based on mana consumed and potentially damaging nearby players. Casts every |cff87CEEB30 seconds|r.\n\nTips:\n• |cffF0E68CMana Management:|r Be mindful of your mana pool, as a larger mana pool can lead to higher damage on detonation.",
                    duration    = 0, -- The detonation is instant after delay
                    casttime    = 0,
                    cooldown    = 30, -- Based on description
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_frostnova",
                    name        = "|cffADD8E6Frost Blast|r",
                    description = "Kel'Thuzad blasts a random player, freezing them solid and dealing heavy |cff87CEEBFrost damage|r over time. This effect can spread to nearby players. Casts every |cff87CEEB45 seconds|r.\n\nTips:\n• |cffF0E68CBreak Free/Immunity:|r Use abilities that grant immunity to Frost damage or break CC if targeted.\n• |cffF0E68CDon't Spread:|r If afflicted, move away from any other targets to prevent it from jumping.",
                    duration    = 0, -- Duration of freeze effect, not explicitly in original.
                    casttime    = 0,
                    cooldown    = 45,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_lifedrain",
                    name        = "|cff9400D3Chains of Kel'Thuzad|r",
                    description = "Kel'Thuzad chains up to |cff87CEEB3 random players|r, pulling them towards him and disabling their movement. This effect deals minor |cff9400D3Shadow damage|r. Casts every |cff87CEEB90 seconds|r in 25-man difficulty.\n\nTips:\n• |cffF0E68CBreak Free/Immunity:|r Use abilities that break movement impairments or provide immunity to CC.",
                    duration    = 0, -- Duration of chain effect not explicitly in original
                    casttime    = 0,
                    cooldown    = 90,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_painandsuffering",
                    name        = "|cffC04000Berserk|r",
                    description = "After |cff87CEEB15 minutes|r, Kel'Thuzad enters a state of |cffC04000Berserk|r, drastically increasing his damage output and attack speed. This is an enrage timer.\n\nTips:\n• |cffB2222CHard Enrage:|r This is a hard enrage. You must defeat Kel'Thuzad before this point.\n• |cffB2222CBurn Cooldowns:|r Save major offensive cooldowns for the final minutes to maximize damage.",
                    duration    = 5 * 60, -- 5 minutes
                    casttime    = 0,
                    cooldown    = 15 * 60, -- 15 minutes
                },
            },
        },
    },
    items = {39139,39140,39141,39146,39188,39189,39190,39191,39192,39193,39194,39195,39196,39197,39198,39199,39200,39215,39216,39217,39221,39224,39225,39226,39228,39229,39230,39231,39232,39233,39234,39235,39236,39237,39239,39240,39241,39242,39243,39244,39245,39246,39247,39248,39249,39250,39251,39252,39254,39255,39256,39257,39258,39259,39260,39261,39262,39267,39270,39271,39272,39273,39274,39275,39276,39277,39278,39279,39280,39281,39282,39283,39284,39285,39291,39292,39293,39294,39295,39296,39297,39298,39299,39306,39307,39308,39309,39310,39311,39344,39345,39369,39379,39386,39388,39389,39390,39391,39392,39393,39394,39395,39396,39397,39398,39399,39401,39403,39404,39405,39407,39408,39409,39415,39416,39417,39419,39420,39421,39422,39423,39424,39425,39426,39701,39702,39703,39704,39706,39712,39714,39716,39717,39718,39719,39720,39721,39722,39723,39724,39725,39726,39727,39729,39730,39731,39732,39733,39734,39735,39756,39758,39759,39760,39761,39762,39763,39764,39765,39766,39767,39768,40060,40061,40062,40063,40064,40065,40069,40071,40074,40075,40080,40107,40108,40184,40185,40186,40187,40188,40189,40190,40192,40193,40196,40197,40198,40200,40201,40203,40204,40205,40206,40208,40209,40210,40233,40234,40235,40236,40237,40238,40239,40240,40241,40242,40243,40244,40245,40246,40247,40249,40250,40251,40252,40253,40254,40255,40256,40257,40258,40259,40260,40261,40262,40263,40264,40265,40266,40269,40270,40271,40272,40273,40274,40275,40277,40278,40279,40280,40281,40282,40283,40284,40285,40286,40287,40288,40289,40294,40296,40297,40298,40299,40300,40301,40302,40303,40304,40305,40306,40315,40316,40317,40318,40319,40320,40323,40324,40325,40326,40327,40328,40329,40330,40331,40332,40333,40334,40335,40336,40338,40339,40340,40341,40343,40344,40345,40346,40347,40348,40349,40350,40351,40352,40362,40363,40365,40366,40367,40368,40369,40370,40371,40372,40373,40374,40375,40376,40377,40378,40379,40380,40381,40382,40383,40384,40385,40386,40387,40388,40395,40396,40398,40399,40400,40401,40402,40403,40405,40602},
})

table.insert(Journal.djDungeons, {
    name = "Deadmines",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Deadmines.blp",
    bosses = {
        {
            bossID = 639,
            spells = {},
            name = "Edwin VanCleef",
            flat = itemdir,
        },
        {
            bossID = 644,
            spells = {},
            name = "Rhahk'Zor",
            flat = itemdir,
        },
        {
            bossID = 645,
            spells = {},
            name = "Cookie",
            flat = itemdir,
        },
        {
            bossID = 646,
            spells = {},
            name = "Mr. Smite",
            flat = itemdir,
        },
        {
            bossID = 647,
            spells = {},
            name = "Captain Greenskin",
            flat = itemdir,
        },
        {
            bossID = 1763,
            spells = {},
            name = "Gilnid",
            flat = itemdir,
        },
        {
            bossID = 3586,
            spells = {},
            name = "Miner Johnson",
            rare = true,
            flat = itemdir,
        }
    },
    items = {789,790,827,872,886,890,911,920,935,1076,1077,1121,1156,1214,1218,1220,1296,1299,1300,1391,1405,1406,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1738,1739,1740,1741,1742,1743,1744,1745,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1803,1804,1805,1806,1807,1808,1809,1810,1928,1929,1930,1934,1936,1937,1943,1944,1945,1951,1958,1959,2013,2034,2059,2072,2073,2078,2079,2166,2167,2168,2169,2175,2194,2216,2217,2221,2222,2227,2232,2233,2236,2566,2632,2879,2911,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3019,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3193,3195,3196,3198,3199,3202,3204,3205,3207,3211,3212,3227,3302,3304,3305,3306,3307,3308,3309,3310,3311,3313,3314,3315,3376,3377,3380,3381,3429,3569,3643,3645,3647,3651,3652,3653,3654,3655,3656,3740,3902,4036,4290,4567,4568,4569,4570,4571,4575,4660,4661,4676,4678,4681,4687,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4713,4714,4715,4788,4949,4998,4999,5001,5110,5187,5191,5192,5193,5194,5195,5196,5197,5199,5200,5201,5202,5443,5444,5967,6378,6379,6380,6381,6382,6383,6394,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6580,6581,6582,6583,6584,6585,6586,6587,6588,6591,6593,6600,6602,6604,6608,7230,7554,7558,7608,8350,8748,9747,9748,9749,9756,9757,9763,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9792,9793,9794,9795,9796,9799,9801,9802,9803,9804,9805,9806,9807,9810,9811,9812,9813,9814,9815,9816,9817,9818,10287,10399,10400,10401,10402,10403,10405,10407,11965,11967,11968,11981,11982,11983,11993,11994,12006,12007,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,14025,14096,14097,14109,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14127,14129,14133,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14179,14185,14188,14364,14365,14366,14367,14369,14370,14371,14373,14374,14375,14376,14377,14378,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14571,14572,14573,14574,14580,14722,14723,14724,14725,14726,14727,14729,14730,14742,14743,14745,14746,14747,14748,14749,14752,15011,15012,15013,15014,15016,15017,15018,15019,15110,15111,15112,15113,15115,15116,15117,15118,15120,15122,15124,15210,15211,15212,15222,15223,15224,15230,15241,15248,15249,15259,15268,15269,15300,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15329,15330,15331,15332,15333,15334,15336,15340,15348,15485,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15523,15526,15527,15528,15532,15891,15893,15894,15912,15926,15927,15933,15945,15946,15970,15971,15972,15974}
})

table.insert(Journal.djDungeons, {
    name = "Shadowfang Keep",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ShadowfangKeep.blp",
    bosses = {
        {
            bossID = 3872,
            name = "Deathsworn Captain", 
            rare = true,
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Ability_Warrior_OffensiveStance",
                    name = "Battle Stance",
                    description = "Assumes a battle stance that increases damage dealt.",
                    duration = 0,
                    cooldown = 0,
                },
                {
                    icon = "Interface\\Icons\\Ability_Warrior_Cleave",
                    name = "Cleave",
                    description = "A sweeping frontal attack that strikes multiple enemies.",
                    duration = 0,
                    cooldown = 12,
                },
                {
                    icon = "Interface\\Icons\\Ability_Shockwave",
                    name = "Hamstring",
                    description = "Maims the enemy, reducing movement speed by 50%.",
                    duration = 15,
                    cooldown = 20,
                }
            },
        },
        {
            bossID = 3914,
            name = "Rethilgore",
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\spell_shadow_lifedrain02",
                    name = "Soul Drain",
                    description = "Immobilizes an enemy for 10 sec. and drains 35 health, transferring it to the caster.",
                    duration = 10,
                    casttime = 2,
                    cooldown = 0,
                }
            },
        },
        {
            bossID = 4274,
            name = "Fenrus the Devourer", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Spell_Nature_CorrosiveBreath",
                    name = "Toxic Saliva",
                    description = "Inflicts nature damage over time to a random target.",
                    duration = 10,
                    cooldown = 30,
                }
            },
        },
        {
            bossID = 3886,
            name = "Razorclaw the Butcher", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Spell_Shadow_SiphonMana",
                    name = "Butcher Drain",
                    description = "Drains life from the target, healing the caster for the amount drained.",
                    duration = 0,
                    cooldown = 5,
                }
            },
        },
        {
            bossID = 4279,
            name = "Odo the Blindwatcher", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Ability_BullRush",
                    name = "Howling Rage",
                    description = "Increases physical damage dealt by 10 and size by 15% for 5 minutes.",
                    duration = 300,
                    cooldown = 0,
                }
            },
        },
        {
            bossID = 4278,
            name = "Commander Springvale", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Spell_Holy_SealOfMight",
                    name = "Hammer of Justice",
                    description = "Stuns the target for 6 seconds.",
                    duration = 6,
                    cooldown = 60,
                },
                {
                    icon = "Interface\\Icons\\Spell_Holy_HolyBolt",
                    name = "Holy Light",
                    description = "Heals an ally for a large amount of health.",
                    duration = 0,
                    cooldown = 20,
                }
            },
        },
        {
            bossID = 3887,
            name = "Baron Silverlaine", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\spell_shadow_gathershadows",
                    name = "Veil of Shadow",
                    description = "Reduces healing effects for an enemy by 75% for 15 sec.",
                    duration = 15,
                    cooldown = 0,
                },
            },
        },
        {
            bossID = 3927,
            name = "Wolf Master Nandos", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Ability_Hunter_BeastCall",
                    name = "Call Bleak Worg",
                    description = "Summons 1 Bleak Worg to aid the caster in battle for 4 minutes.",
                    duration = 240,
                    cooldown = 0,
                },
                {
                    icon = "Interface\\Icons\\Ability_Hunter_BeastCall",
                    name = "Call Slavering Worg",
                    description = "Summons 1 Slavering Worg to aid the caster in battle for 4 minutes.",
                    duration = 240,
                    cooldown = 0,
                },
                {
                    icon = "Interface\\Icons\\Ability_Hunter_BeastCall",
                    name = "Call Lupine Horror",
                    description = "Summons 1 Lupine Horror to aid the caster in battle for 4 minutes.",
                    duration = 240,
                    cooldown = 0,
                }
            },
        },
        {
            bossID = 4275,
            name = "Archmage Arugal", 
            flat = itemdir,
            spells = {
                {
                    icon = "Interface\\Icons\\Spell_Lightning_LightningBolt01",
                    name = "Thundershock",
                    description = "Inflicts 64 to 86 Nature damage to nearby enemies, stunning them for 5 sec.",
                    duration = 5,
                    cooldown = 0,
                },
                {
                    icon = "Interface\\Icons\\Spell_Shadow_ShadowBolt",
                    name = "Void Bolt",
                    description = "Sends a bolt of dark magic at an enemy, inflicting 925 to 1075 Shadow damage.",
                    duration = 0,
                    casttime = 4,
                    cooldown = 0,
                }
            },
        }
    },
    items = {789, 790, 827, 886, 890, 897, 911, 920, 935, 1076, 1077, 1121, 1214, 1218, 1220, 1292, 1296, 1299, 1300, 1351, 1391, 1405, 1406, 1440, 1446, 1448, 1455, 1457, 1458, 1459, 1460, 1461, 1462, 1469, 1473, 1483, 1484, 1489, 1738, 1739, 1740, 1741, 1742, 1743, 1744, 1745, 1746, 1747, 1748, 1749, 1750, 1751, 1752, 1753, 1764, 1766, 1767, 1768, 1769, 1770, 1772, 1774, 1775, 1776, 1777, 1778, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 1796, 1797, 1798, 1799, 1800, 1801, 1802, 1928, 1929, 1934, 1935, 1936, 1943, 1944, 1945, 1958, 1959, 1974, 2011, 2013, 2017, 2034, 2059, 2072, 2077, 2078, 2079, 2166, 2167, 2168, 2175, 2194, 2216, 2217, 2219, 2220, 2227, 2232, 2233, 2236, 2292, 2566, 2800, 2807, 2819, 2879, 2911, 2969, 2970, 2973, 2974, 2977, 2981, 2982, 2983, 2984, 2985, 2986, 2987, 2988, 2989, 2990, 2991, 2992, 3021, 3045, 3047, 3048, 3049, 3055, 3056, 3057, 3058, 3065, 3066, 3067, 3069, 3184, 3191, 3193, 3195, 3196, 3198, 3199, 3201, 3202, 3204, 3205, 3206, 3211, 3212, 3227, 3230, 3305, 3306, 3309, 3310, 3313, 3315, 3376, 3377, 3378, 3379, 3429, 3569, 3645, 3647, 3655, 3656, 3740, 3748, 4036, 4049, 4290, 4567, 4568, 4571, 4575, 4661, 4676, 4694, 4695, 4697, 4698, 4699, 4700, 4701, 4705, 4706, 4707, 4708, 4709, 4710, 4711, 4712, 4713, 4714, 4715, 4788, 4949, 4998, 4999, 5001, 5254, 5943, 6226, 6314, 6318, 6319, 6320, 6321, 6323, 6324, 6340, 6341, 6378, 6379, 6380, 6381, 6382, 6383, 6387, 6392, 6393, 6394, 6395, 6397, 6398, 6528, 6531, 6536, 6538, 6539, 6540, 6541, 6545, 6546, 6547, 6548, 6551, 6552, 6553, 6554, 6557, 6559, 6560, 6561, 6562, 6563, 6564, 6565, 6566, 6567, 6568, 6569, 6570, 6571, 6572, 6573, 6574, 6575, 6576, 6577, 6578, 6579, 6580, 6581, 6582, 6583, 6584, 6585, 6586, 6587, 6588, 6590, 6591, 6592, 6593, 6594, 6595, 6596, 6597, 6598, 6599, 6600, 6601, 6602, 6604, 6605, 6608, 6611, 6612, 6613, 6614, 6615, 6633, 6641, 6642, 682, 7415, 7554, 7558, 7608, 9766, 9767, 9768, 9769, 9770, 9771, 9772, 9773, 9774, 9775, 9776, 9777, 9778, 9779, 9780, 9781, 9782, 9783, 9784, 9785, 9786, 9787, 9788, 9789, 9790, 9791, 9792, 9793, 9794, 9795, 9796, 9797, 9798, 9799, 9800, 9801, 9802, 9803, 9804, 9805, 9806, 9807, 9808, 9809, 9810, 9811, 9812, 9813, 9814, 9815, 9816, 9817, 9818, 9822, 9829, 9831, 9838, 10287, 10405, 10407, 11965, 11967, 11968, 11969, 11981, 11982, 11983, 11984, 11993, 11994, 11995, 12006, 12007, 12008, 12052, 12053, 12054, 12975, 12976, 12977, 12978, 12979, 12982, 12983, 12985, 12987, 12988, 12989, 12990, 12994, 12996, 12997, 12998, 12999, 13010, 13011, 13012, 13041, 14025, 14096, 14109, 14114, 14117, 14119, 14120, 14121, 14122, 14123, 14124, 14125, 14127, 14129, 14131, 14133, 14158, 14159, 14160, 14161, 14162, 14163, 14164, 14165, 14166, 14167, 14168, 14170, 14171, 14172, 14173, 14174, 14175, 14176, 14177, 14179, 14181, 14182, 14185, 14186, 14187, 14188, 14194, 14195, 14364, 14366, 14367, 14369, 14370, 14371, 14372, 14373, 14374, 14375, 14376, 14377, 14378, 14379, 14380, 14400, 14402, 14559, 14560, 14561, 14562, 14563, 14564, 14565, 14566, 14567, 14568, 14569, 14570, 14571, 14572, 14573, 14574, 14578, 14580, 14582, 14722, 14723, 14724, 14725, 14726, 14727, 14729, 14730, 14742, 14743, 14744, 14745, 14746, 14747, 14748, 14749, 14750, 14752, 14754, 14755, 14756, 15012, 15014, 15016, 15017, 15018, 15110, 15111, 15112, 15113, 15114, 15115, 15116, 15117, 15118, 15120, 15121, 15122, 15123, 15124, 15125, 15126, 15132, 15210, 15211, 15212, 15222, 15223, 15224, 15230, 15241, 15248, 15249, 15259, 15268, 15269, 15304, 15305, 15306, 15307, 15308, 15310, 15311, 15312, 15329, 15330, 15331, 15332, 15333, 15334, 15336, 15337, 15338, 15340, 15347, 15348, 15487, 15488, 15489, 15493, 15494, 15497, 15498, 15499, 15500, 15501, 15502, 15503, 15504, 15506, 15507, 15508, 15509, 15510, 15511, 15512, 15513, 15514, 15515, 15516, 15517, 15519, 15520, 15521, 15522, 15523, 15525, 15526, 15527, 15528, 15529, 15532, 15535, 15537, 15547, 15891, 15893, 15894, 15912, 15926, 15927, 15945, 15946, 15947, 15971, 15972, 15974, 51804, 51805, 51806, 51807, 51808},
    })

table.insert(Journal.djDungeons, {
    name = "Ulduar",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Ulduar.blp",
    bosses = {
        {
            bossID = 29266,
            spells = {},
            name = "Xevozz",
            flat = itemdir,
        }
    },
    items = {33365,33370,33379,33403,36035,36043,36051,36052,36059,36267,36268,36270,36271,36272,36273,36274,36296,36394,37760,37761,37771,37781,37794,45086,45106,45107,45108,45109,45110,45111,45112,45113,45115,45116,45117,45118,45119,45132,45133,45134,45135,45136,45137,45138,45139,45140,45141,45142,45143,45146,45147,45148,45149,45150,45151,45157,45158,45161,45162,45164,45165,45166,45167,45168,45170,45171,45185,45186,45187,45193,45224,45225,45226,45227,45228,45232,45233,45234,45235,45236,45237,45238,45239,45240,45241,45242,45243,45244,45245,45246,45247,45248,45249,45250,45251,45252,45253,45256,45257,45258,45259,45260,45261,45262,45263,45264,45265,45266,45267,45268,45269,45271,45272,45273,45274,45275,45282,45283,45284,45285,45286,45287,45288,45289,45291,45292,45293,45294,45295,45296,45297,45298,45299,45300,45301,45302,45303,45304,45305,45306,45307,45308,45309,45310,45311,45312,45313,45314,45315,45316,45317,45318,45319,45320,45321,45322,45324,45325,45326,45327,45329,45330,45331,45332,45333,45334,45378,45418,45423,45434,45435,45437,45438,45439,45440,45441,45442,45443,45444,45445,45446,45447,45448,45449,45450,45451,45452,45453,45454,45456,45457,45458,45459,45460,45461,45462,45463,45466,45467,45468,45469,45470,45471,45472,45473,45474,45479,45480,45481,45482,45483,45484,45485,45486,45487,45488,45489,45490,45491,45492,45493,45494,45495,45496,45497,45498,45501,45502,45503,45504,45505,45507,45508,45511,45512,45513,45514,45515,45516,45517,45518,45519,45520,45521,45522,45523,45524,45525,45527,45529,45530,45531,45532,45533,45534,45535,45536,45537,45538,45539,45540,45541,45542,45543,45544,45547,45548,45549,45570,45587,45594,45599,45605,45607,45609,45610,45611,45612,45613,45615,45616,45617,45619,45620,45663,45665,45675,45676,45677,45679,45680,45682,45685,45686,45687,45694,45695,45696,45697,45698,45699,45700,45701,45702,45703,45704,45707,45708,45709,45711,45712,45713,45832,45864,45865,45866,45867,45868,45869,45870,45871,45872,45873,45874,45876,45877,45886,45887,45888,45892,45893,45894,45895,45927,45928,45929,45930,45931,45933,45934,45935,45936,45940,45941,45943,45945,45946,45947,45972,45973,45974,45975,45976,45982,45988,45989,45990,45993,45996,45997,46008,46009,46010,46011,46012,46013,46014,46015,46016,46017,46018,46019,46021,46022,46024,46025,46028,46030,46031,46032,46033,46034,46035,46036,46037,46038,46039,46040,46041,46042,46043,46044,46045,46046,46047,46048,46049,46050,46051,46067,46068,46095,46096,46097,46312,46340,46341,46342,46343,46344,46345,46346,46347,46350,46351},
})

table.insert(Journal.djDungeons, {
    name = "Ruby Sanctum",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RubySanctum.blp",
    bosses = {
        {
            bossID = 29266,
            spells = {},
            name = "Xevozz",
            flat = itemdir,
        }
    },
    items = {33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,36051,36052,36053,36054,36055,36056,36057,36058,36059,36060,36061,36062,36063,36064,36065,36066,36163,36164,36165,36166,36167,36168,36169,36170,36171,36172,36173,36174,36175,36176,36177,36178,36275,36276,36277,36278,36279,36280,36281,36282,36283,36284,36285,36286,36287,36288,36289,36290,36387,36388,36389,36390,36391,36392,36393,36394,36395,36396,36397,36398,36399,36400,36401,36402,36415,36416,36429,36430,36443,36444,36457,36458,36471,36472,36485,36486,36499,36500,36513,36514,36527,36528,36541,36542,36555,36556,36569,36570,36583,36584,36597,36598,36611,36612,36625,36626,36639,36640,36653,36654,36667,36668,36681,36682,36695,36696,36709,36710,36723,36724,53103,53110,53111,53112,53113,53114,53115,53116,53117,53118,53119,53121,53125,53126,53127,53129,53132,53133,53134,53486,53487,53488,53489,53490,54556,54557,54558,54559,54560,54561,54562,54563,54564,54565,54566,54567,54569,54571,54572,54573,54576,54577,54578,54579,54580,54581,54582,54583,54584,54585,54586,54587,54588,54589,54590,54591}
})

table.insert(Journal.djDungeons, {
    name = "Trial of the Crusader",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TrialoftheCrusader.blp",
    bosses = {
        {
            bossID = 29266,
            spells = {},
            name = "Xevozz",
            flat = itemdir,
        }
    },
    items = {46958, 46959, 46960, 46961, 46962, 46963, 46964, 46965, 46966, 46967, 46968, 46969, 46970, 46971, 46972, 46973, 46974, 46975, 46976, 46977, 46979, 46980, 46985, 46986, 46988, 46989, 46990, 46991, 46992, 46993, 46994, 46995, 46996, 46997, 46999, 47000, 47001, 47002, 47003, 47004, 47041, 47042, 47043, 47051, 47052, 47053, 47054, 47055, 47056, 47057, 47059, 47060, 47061, 47062, 47063, 47064, 47066, 47067, 47068, 47069, 47070, 47071, 47072, 47073, 47074, 47075, 47076, 47077, 47078, 47079, 47080, 47081, 47082, 47083, 47084, 47085, 47086, 47087, 47088, 47089, 47090, 47092, 47093, 47094, 47095, 47096, 47097, 47098, 47099, 47104, 47105, 47106, 47107, 47108, 47109, 47110, 47111, 47112, 47113, 47114, 47115, 47116, 47121, 47126, 47129, 47130, 47131, 47132, 47133, 47138, 47139, 47140, 47141, 47142, 47143, 47144, 47145, 47146, 47147, 47148, 47149, 47150, 47151, 47152, 47153, 47154, 47155, 47156, 47157, 47182, 47183, 47184, 47186, 47187, 47188, 47189, 47190, 47191, 47192, 47193, 47194, 47195, 47203, 47204, 47205, 47206, 47207, 47208, 47209, 47223, 47224, 47225, 47233, 47234, 47235, 47236, 47237, 47238, 47239, 47240, 47251, 47252, 47253, 47254, 47255, 47256, 47257, 47258, 47259, 47260, 47261, 47262, 47263, 47264, 47265, 47266, 47267, 47268, 47269, 47270, 47271, 47272, 47273, 47274, 47275, 47276, 47277, 47278, 47279, 47280, 47281, 47282, 47283, 47284, 47285, 47286, 47287, 47288, 47289, 47290, 47291, 47292, 47293, 47294, 47295, 47296, 47297, 47298, 47299, 47300, 47301, 47302, 47303, 47304, 47305, 47306, 47307, 47308, 47309, 47310, 47311, 47312, 47313, 47314, 47315, 47316, 47317, 47318, 47319, 47320, 47321, 47322, 47323, 47324, 47325, 47326, 47327, 47328, 47329, 47330, 47412, 47413, 47414, 47415, 47416, 47417, 47418, 47419, 47420, 47421, 47422, 47423, 47424, 47425, 47426, 47427, 47428, 47429, 47430, 47431, 47432, 47433, 47434, 47435, 47436, 47437, 47438, 47439, 47440, 47441, 47442, 47443, 47444, 47445, 47446, 47447, 47448, 47449, 47450, 47451, 47452, 47453, 47454, 47455, 47456, 47457, 47458, 47459, 47460, 47461, 47462, 47463, 47464, 47465, 47466, 47467, 47468, 47469, 47470, 47471, 47472, 47473, 47474, 47475, 47476, 47477, 47478, 47479, 47480, 47481, 47482, 47483, 47484, 47485, 47486, 47487, 47489, 47490, 47491, 47492, 47506, 47513, 47515, 47516, 47517, 47518, 47519, 47520, 47521, 47523, 47524, 47525, 47526, 47528, 47545, 47546, 47547, 47548, 47549, 47550, 47551, 47552, 47553, 47554, 47578, 47607, 47608, 47609, 47610, 47611, 47612, 47613, 47614, 47615, 47616, 47617, 47618, 47619, 47620, 47621, 47663, 47669, 47676, 47679, 47680, 47683, 47700, 47703, 47711, 47717, 47718, 47719, 47720, 47721, 47724, 47725, 47726, 47727, 47728, 47736, 47737, 47738, 47739, 47740, 47741, 47742, 47743, 47744, 47745, 47746, 47747, 47808, 47809, 47810, 47811, 47812, 47813, 47814, 47815, 47816, 47829, 47830, 47832, 47834, 47835, 47836, 47837, 47838, 47849, 47850, 47851, 47852, 47853, 47854, 47855, 47856, 47857, 47858, 47859, 47860, 47861, 47862, 47863, 47864, 47865, 47866, 47867, 47868, 47869, 47870, 47871, 47872, 47873, 47874, 47875, 47876, 47877, 47878, 47879, 47880, 47881, 47882, 47883, 47884, 47885, 47886, 47887, 47888, 47889, 47890, 47891, 47892, 47893, 47894, 47895, 47896, 47897, 47898, 47899, 47900, 47901, 47902, 47903, 47904, 47905, 47906, 47907, 47908, 47909, 47910, 47911, 47913, 47915, 47916, 47917, 47918, 47919, 47920, 47921, 47922, 47923, 47924, 47925, 47926, 47927, 47928, 47929, 47930, 47931, 47932, 47933, 47934, 47935, 47937, 47938, 47939, 47940, 47941, 47942, 47943, 47944, 47945, 47946, 47947, 47948, 47949, 47950, 47951, 47952, 47953, 47954, 47955, 47956, 47957, 47958, 47959, 47960, 47961, 47962, 47963, 47964, 47965, 47966, 47967, 47968, 47969, 47970, 47971, 47972, 47973, 47974, 47975, 47976, 47977, 47978, 47979, 47988, 47989, 47990, 47991, 47992, 47993, 47994, 47995, 47996, 47997, 47998, 47999, 48000, 48001, 48002, 48003, 48004, 48005, 48006, 48007, 48008, 48009, 48010, 48011, 48012, 48013, 48014, 48015, 48016, 48017, 48018, 48019, 48020, 48021, 48022, 48023, 48024, 48025, 48026, 48027, 48028, 48030, 48032, 48034, 48036, 48038, 48039, 48040, 48041, 48042, 48043, 48044, 48045, 48046, 48047, 48048, 48049, 48050, 48051, 48052, 48053, 48054, 48055, 48056, 48666, 48667, 48668, 48669, 48670, 48671, 48672, 48673, 48674, 48675, 48693, 48695, 48697, 48699, 48701, 48703, 48705, 48708, 48709, 48710, 48711, 48712, 48713, 48714, 49231, 49232, 49233, 49234, 49235, 49236, 49237, 49238}
})

table.insert(Journal.djDungeons, {
    name = "Obsidian Sanctum",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ObsidianSanctum.blp",
    bosses = {
        {
            bossID = 29266,
            spells = {},
            name = "Xevozz",
            flat = itemdir,
        }
    },
    items = {33369,33381,33384,33417,33433,36043,36044,36049,36050,36053,36055,36058,36063,36158,36165,36171,36273,36276,36385,36391,36394,36399,36416,36443,36554,36681,36682,36696,40426,40427,40428,40429,40433,40437,40438,40439,40446,40451,40453,40455,43988,43989,43990,43991,43992,43993,43994,43995,43996,43998,44000,44002,44003,44004,44005,44006,44007,44008,44011},
})

table.insert(Journal.djDungeons, {
    name = "Icecream Citadel",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-IcecrownCitadel.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {33364, 33365, 33366, 33367, 33368, 33369, 33370, 33371, 33379, 33380, 33381, 33382, 33383, 33384, 33385, 33397, 33398, 33399, 33400, 33401, 33402, 33403, 33412, 33413, 33414, 33415, 33416, 33417, 33419, 33433, 33434, 33435, 36035, 36036, 36037, 36038, 36039, 36040, 36041, 36042, 36043, 36044, 36045, 36046, 36047, 36048, 36049, 36050, 36051, 36052, 36053, 36054, 36055, 36056, 36057, 36058, 36147, 36148, 36149, 36150, 36151, 36152, 36153, 36154, 36155, 36156, 36157, 36158, 36159, 36160, 36161, 36162, 36163, 36164, 36165, 36166, 36167, 36168, 36169, 36170, 36259, 36260, 36261, 36262, 36263, 36264, 36265, 36266, 36267, 36268, 36269, 36270, 36271, 36272, 36273, 36274, 36275, 36276, 36277, 36278, 36279, 36280, 36281, 36282, 36371, 36372, 36373, 36374, 36375, 36376, 36377, 36378, 36379, 36380, 36381, 36382, 36383, 36384, 36385, 36386, 36387, 36388, 36389, 36390, 36391, 36392, 36393, 36394, 36413, 36414, 36415, 36427, 36428, 36429, 36441, 36442, 36443, 36455, 36456, 36457, 36469, 36470, 36471, 36483, 36484, 36485, 36497, 36498, 36499, 36511, 36512, 36513, 36525, 36526, 36527, 36539, 36540, 36541, 36553, 36554, 36555, 36567, 36568, 36569, 36581, 36582, 36583, 36595, 36596, 36597, 36609, 36610, 36611, 36623, 36624, 36625, 36637, 36638, 36639, 36651, 36652, 36653, 36665, 36666, 36667, 36679, 36680, 36681, 36693, 36694, 36695, 36707, 36708, 36709, 36721, 36722, 36723, 37760, 37761, 37770, 37771, 37780, 37781, 37792, 37793, 37794, 37822, 37824, 37835, 40790, 40791, 40792, 40810, 40811, 40812, 40829, 40830, 40831, 40850, 40851, 40852, 40870, 40871, 40872, 40910, 40928, 40934, 40940, 40964, 40994, 40995, 41002, 41008, 41014, 41020, 41028, 41034, 41039, 41045, 41082, 41088, 41138, 41144, 41152, 41158, 41200, 41206, 41212, 41218, 41276, 41282, 41288, 41294, 41299, 41305, 41311, 41317, 41322, 41328, 41651, 41656, 41662, 41668, 41673, 41679, 41684, 41716, 41768, 41774, 41855, 41860, 41865, 41870, 41875, 41916, 41922, 41928, 41935, 41941, 41947, 41954, 41960, 41966, 41972, 41994, 41999, 42006, 42012, 42018, 44308, 44309, 44310, 44311, 44312, 44313, 49623, 49888, 49919, 49949, 49950, 49951, 49952, 49960, 49964, 49967, 49968, 49975, 49976, 49977, 49978, 49979, 49980, 49981, 49982, 49983, 49985, 49986, 49987, 49988, 49989, 49990, 49991, 49992, 49993, 49994, 49995, 49996, 49997, 50012, 50014, 50015, 50016, 50019, 50020, 50021, 50022, 50023, 50024, 50025, 50026, 50027, 50028, 50030, 50032, 50033, 50034, 50035, 50036, 50037, 50038, 50040, 50041, 50042, 50056, 50059, 50060, 50061, 50062, 50063, 50064, 50065, 50067, 50068, 50069, 50070, 50071, 50072, 50073, 50074, 50075, 50078, 50079, 50080, 50081, 50082, 50087, 50088, 50089, 50090, 50094, 50095, 50096, 50097, 50098, 50105, 50106, 50107, 50108, 50109, 50113, 50114, 50115, 50116, 50117, 50118, 50170, 50171, 50172, 50173, 50174, 50175, 50176, 50177, 50178, 50179, 50180, 50181, 50182, 50184, 50240, 50241, 50242, 50243, 50244, 50275, 50276, 50277, 50278, 50279, 50324, 50325, 50326, 50327, 50328, 50333, 50339, 50341, 50342, 50343, 50344, 50346, 50348, 50351, 50353, 50354, 50355, 50356, 50357, 50358, 50360, 50361, 50362, 50363, 50364, 50365, 50375, 50376, 50377, 50378, 50384, 50386, 50387, 50388, 50391, 50392, 50393, 50394, 50396, 50397, 50398, 50399, 50400, 50401, 50402, 50403, 50404, 50412, 50413, 50414, 50415, 50421, 50423, 50424, 50425, 50426, 50427, 50428, 50429, 50444, 50447, 50449, 50450, 50451, 50452, 50453, 50466, 50467, 50468, 50469, 50470, 50474, 50603, 50604, 50605, 50606, 50607, 50608, 50609, 50610, 50611, 50612, 50613, 50614, 50615, 50616, 50617, 50633, 50635, 50636, 50638, 50639, 50640, 50641, 50642, 50643, 50644, 50645, 50646, 50647, 50648, 50649, 50650, 50651, 50652, 50668, 50670, 50671, 50672, 50673, 50674, 50675, 50676, 50677, 50678, 50679, 50680, 50681, 50682, 50684, 50685, 50686, 50687, 50688, 50689, 50690, 50691, 50692, 50693, 50694, 50695, 50696, 50697, 50698, 50699, 50700, 50701, 50702, 50703, 50704, 50705, 50706, 50707, 50708, 50709, 50710, 50711, 50712, 50713, 50714, 50715, 50716, 50717, 50718, 50719, 50720, 50721, 50722, 50723, 50724, 50725, 50726, 50727, 50728, 50729, 50730, 50731, 50732, 50733, 50734, 50735, 50736, 50737, 50738, 50759, 50760, 50761, 50762, 50763, 50764, 50765, 50766, 50767, 50768, 50769, 50771, 50772, 50773, 50774, 50775, 50776, 50777, 50778, 50779, 50780, 50781, 50782, 50783, 50784, 50785, 50786, 50798, 50799, 50800, 50801, 50802, 50803, 50804, 50805, 50806, 50807, 50808, 50809, 50810, 50811, 50812, 50819, 50820, 50821, 50822, 50823, 50824, 50825, 50826, 50827, 50828, 50830, 50831, 50832, 50833, 50834, 50835, 50836, 50837, 50838, 50839, 50841, 50842, 50843, 50844, 50845, 50846, 50847, 50848, 50849, 50850, 50852, 50853, 50854, 50855, 50856, 50857, 50858, 50859, 50860, 50861, 50862, 50863, 50864, 50865, 50866, 50867, 50868, 50869, 50965, 50966, 50967, 50968, 50969, 50970, 50971, 50972, 50973, 50974, 50975, 50976, 50977, 50978, 50979, 50980, 50981, 50982, 50983, 50984, 50985, 50986, 50987, 50988, 50989, 50990, 50991, 50992, 50993, 50994, 50995, 50996, 50997, 50998, 50999, 51000, 51001, 51002, 51003, 51004, 51005, 51006, 51007, 51008, 51009, 51010, 51011, 51012, 51013, 51014, 51015, 51016, 51017, 51018, 51019, 51020, 51021, 51022, 51023, 51024, 51025, 51125, 51126, 51127, 51128, 51129, 51130, 51131, 51132, 51133, 51134, 51135, 51136, 51137, 51138, 51139, 51140, 51141, 51142, 51143, 51144, 51145, 51146, 51147, 51148, 51149, 51150, 51151, 51152, 51153, 51154, 51155, 51156, 51157, 51158, 51159, 51160, 51161, 51162, 51163, 51164, 51165, 51166, 51167, 51168, 51169, 51170, 51171, 51172, 51173, 51174, 51175, 51176, 51177, 51178, 51179, 51180, 51181, 51182, 51183, 51184, 51185, 51186, 51187, 51188, 51189, 51190, 51191, 51192, 51193, 51194, 51195, 51196, 51197, 51198, 51199, 51200, 51201, 51202, 51203, 51204, 51205, 51206, 51207, 51208, 51209, 51210, 51211, 51212, 51213, 51214, 51215, 51216, 51217, 51218, 51219, 51220, 51221, 51222, 51223, 51224, 51225, 51226, 51227, 51228, 51229, 51230, 51231, 51232, 51233, 51234, 51235, 51236, 51237, 51238, 51239, 51240, 51241, 51242, 51243, 51244, 51246, 51247, 51248, 51249, 51250, 51251, 51252, 51253, 51254, 51255, 51256, 51257, 51258, 51259, 51260, 51261, 51262, 51263, 51264, 51265, 51266, 51267, 51268, 51269, 51270, 51271, 51272, 51273, 51274, 51275, 51276, 51277, 51278, 51279, 51280, 51281, 51282, 51283, 51284, 51285, 51286, 51287, 51288, 51289, 51290, 51291, 51292, 51293, 51294, 51295, 51296, 51297, 51298, 51299, 51300, 51301, 51302, 51303, 51304, 51305, 51306, 51307, 51308, 51309, 51310, 51311, 51312, 51313, 51314, 51325, 51326, 51379, 51380, 51381, 51382, 51383, 51384, 51385, 51386, 51387, 51548, 51550, 51551, 51552, 51553, 51554, 51555, 51556, 51779, 51782, 51783, 51784, 51785, 51786, 51787, 51788, 51789, 51790, 51791, 51792, 51795, 51796, 51797, 51798, 51799, 51800, 51801, 51803, 51811, 51812, 51813, 51814, 51815, 51816, 51817, 51818, 51819, 51820, 51821, 51822, 51835, 51836, 51837, 51838, 51839, 51840, 51841, 51842, 51843, 51844, 51845, 51846, 51847, 51848, 51849, 51850, 51851, 51852, 51853, 51854, 51855, 51856, 51857, 51858, 51859, 51860, 51861, 51862, 51863, 51864, 51865, 51866, 51867, 51868, 51869, 51870, 51871, 51872, 51873, 51874, 51875, 51876, 51877, 51878, 51879, 51880, 51881, 51882, 51883, 51884, 51885, 51886, 51887, 51888, 51889, 51890, 51891, 51892, 51893, 51894, 51895, 51896, 51897, 51898, 51899, 51900, 51901, 51902, 51903, 51904, 51905, 51917, 51918, 51919, 51920, 51921, 51922, 51923, 51924, 51925, 51926, 51927, 51928, 51929, 51930, 51931, 51932, 51933, 51934, 51935, 51936, 51937, 51938, 51939, 51940, 51941, 51942, 51943, 51944, 51945, 51946, 51947, 52569, 52570, 52571, 52572}
})

table.insert(Journal.djDungeons,{
    name = "Onyxia's Lair",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Onyxia.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {49298,49299,49302,49303,49304,49305,49306,49307,49308,49309,49310,49315,49316,49317,49318,49319,49320,49321,49323,49324,49325,49326,49327,49328,49329,49330,49331,49332,49333,49463,49464,49466,49467,49468,49469,49470,49471,49472,49473,49474,49475,49476,49478,49479,49480,49481,49482,49483,49484,49485,49486,49487,49488,49489,49490,49491,49492,49493,49494,49495,49496,49498,49499},
})

table.insert(Journal.djDungeons, {
    name = "Eye of Eternity",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-EyeofEternity.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {40194,40474,40475,40486,40488,40489,40491,40497,40511,40519,40526,40531,40532,40539,40541,40543,40549,40555,40558,40560,40561,40562,40564,40566,40588,40589,40590,40591,40592,40594},
})
table.insert(Journal.djDungeons, {
    name = "Vault of Archavon",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-VaultofArchavon.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {33365, 33366, 33367, 33368, 33369, 33370, 33371, 33379, 33380, 33381, 33382, 33383, 33384, 33385, 33397, 33398, 33399, 33400, 33401, 33402, 33403, 33412, 33413, 33414, 33415, 33416, 33417, 33419, 33433, 33434, 33435, 33436, 36035, 36036, 36037, 36038, 36039, 36040, 36041, 36042, 36043, 36044, 36045, 36046, 36047, 36048, 36049, 36050, 36051, 36052, 36053, 36054, 36055, 36056, 36057, 36058, 36147, 36148, 36149, 36150, 36151, 36152, 36153, 36154, 36155, 36156, 36157, 36158, 36159, 36160, 36161, 36162, 36163, 36164, 36165, 36166, 36167, 36168, 36169, 36170, 36259, 36260, 36261, 36262, 36263, 36264, 36265, 36266, 36267, 36268, 36269, 36270, 36271, 36272, 36273, 36274, 36275, 36276, 36277, 36278, 36279, 36280, 36281, 36282, 36371, 36372, 36373, 36374, 36375, 36376, 36377, 36378, 36379, 36380, 36381, 36382, 36383, 36384, 36385, 36386, 36387, 36388, 36389, 36390, 36391, 36392, 36393, 36394, 36413, 36414, 36415, 36427, 36428, 36429, 36441, 36442, 36443, 36455, 36456, 36457, 36469, 36470, 36471, 36483, 36484, 36485, 36497, 36498, 36499, 36511, 36512, 36513, 36525, 36526, 36527, 36539, 36540, 36541, 36553, 36554, 36555, 36567, 36568, 36569, 36581, 36582, 36583, 36595, 36596, 36597, 36609, 36610, 36611, 36623, 36624, 36625, 36637, 36638, 36639, 36651, 36652, 36653, 36665, 36666, 36667, 36679, 36680, 36681, 36693, 36694, 36695, 36707, 36708, 36709, 36721, 36722, 36723, 39492, 39493, 39495, 39497, 39498, 39500, 39515, 39517, 39519, 39523, 39528, 39530, 39538, 39539, 39543, 39544, 39546, 39547, 39554, 39555, 39557, 39558, 39560, 39564, 39579, 39580, 39582, 39588, 39589, 39591, 39592, 39593, 39595, 39597, 39606, 39607, 39609, 39611, 39612, 39617, 39618, 39620, 39622, 39623, 39624, 39626, 39629, 39630, 39632, 39633, 39634, 39636, 39638, 39639, 39641, 40415, 40417, 40418, 40420, 40422, 40423, 40445, 40448, 40449, 40454, 40457, 40458, 40460, 40462, 40463, 40466, 40468, 40469, 40471, 40472, 40493, 40495, 40496, 40500, 40503, 40504, 40506, 40508, 40509, 40512, 40514, 40515, 40517, 40520, 40522, 40523, 40525, 40527, 40529, 40544, 40545, 40547, 40550, 40552, 40556, 40559, 40563, 40567, 40569, 40570, 40572, 40574, 40575, 40577, 40579, 40580, 40583, 40781, 40782, 40783, 40784, 40785, 40786, 40801, 40802, 40803, 40804, 40805, 40806, 40807, 40808, 40809, 40810, 40811, 40812, 40840, 40841, 40842, 40844, 40845, 40846, 40847, 40849, 40850, 40851, 40852, 40879, 40880, 40881, 40882, 40883, 40884, 40888, 40889, 40890, 40904, 40905, 40925, 40926, 40927, 40928, 40937, 40938, 40939, 40940, 40974, 40975, 40976, 40977, 40978, 40979, 40982, 40983, 40984, 40988, 40989, 40990, 40991, 40999, 41000, 41001, 41002, 41005, 41006, 41007, 41008, 41025, 41026, 41027, 41028, 41031, 41032, 41033, 41034, 41048, 41051, 41052, 41054, 41055, 41056, 41059, 41060, 41061, 41064, 41065, 41066, 41069, 41070, 41071, 41074, 41075, 41076, 41080, 41085, 41086, 41135, 41136, 41137, 41138, 41141, 41142, 41143, 41144, 41162, 41198, 41199, 41200, 41203, 41204, 41205, 41206, 41224, 41225, 41226, 41229, 41230, 41231, 41234, 41235, 41236, 41284, 41286, 41287, 41288, 41291, 41292, 41293, 41294, 41296, 41297, 41298, 41299, 41302, 41303, 41304, 41305, 41308, 41309, 41314, 41315, 41616, 41617, 41618, 41620, 41621, 41622, 41624, 41625, 41626, 41629, 41630, 41631, 41634, 41635, 41636, 41639, 41640, 41641, 41649, 41653, 41654, 41655, 41656, 41659, 41660, 41665, 41666, 41667, 41668, 41765, 41766, 41767, 41768, 41771, 41772, 41773, 41774, 41831, 41832, 41833, 41835, 41836, 41837, 41839, 41840, 41841, 41848, 41857, 41858, 41862, 41863, 41864, 41865, 41872, 41873, 41874, 41875, 41880, 41881, 41882, 41884, 41885, 41886, 41892, 41893, 41894, 41897, 41898, 41899, 41902, 41903, 41904, 41908, 41909, 41910, 41919, 41920, 41925, 41926, 41927, 41928, 41938, 41939, 41940, 41941, 41950, 41951, 41957, 41958, 41959, 41960, 41969, 41970, 41971, 41972, 41997, 42001, 42003, 42004, 42005, 42006, 42015, 42016, 42017, 42018, 42028, 42029, 42030, 42031, 42032, 42033, 42034, 42035, 42036, 42037, 42038, 42039, 42040, 42041, 42042, 42043, 42044, 42045, 42046, 42047, 42062, 42063, 42064, 42065, 42066, 42067, 42068, 42069, 42070, 42071, 42072, 42073, 42074, 42075, 42076, 42077, 42078, 42079, 42080, 42081, 42082, 42114, 42115, 42116, 42117, 42118, 42119, 45337, 45338, 45341, 45343, 45345, 45347, 45351, 45353, 45355, 45357, 45360, 45362, 45367, 45370, 45371, 45376, 45379, 45383, 45384, 45387, 45388, 45392, 45394, 45397, 45399, 45401, 45403, 45406, 45409, 45414, 45416, 45419, 45420, 45426, 45427, 45430, 45432, 46113, 46116, 46119, 46121, 46124, 46126, 46131, 46132, 46133, 46135, 46139, 46142, 46144, 46148, 46150, 46153, 46155, 46158, 46160, 46163, 46164, 46169, 46170, 46174, 46176, 46179, 46181, 46183, 46185, 46188, 46189, 46192, 46195, 46199, 46200, 46202, 46207, 46208, 46210, 46373, 46374, 47750, 47752, 47753, 47755, 47770, 47772, 47773, 47775, 47780, 47782, 47783, 47785, 47800, 47802, 47803, 47805, 47980, 47982, 47983, 47985, 48064, 48066, 48067, 48069, 48072, 48074, 48077, 48079, 48094, 48096, 48097, 48099, 48130, 48132, 48133, 48135, 48150, 48152, 48153, 48155, 48160, 48162, 48163, 48165, 48180, 48182, 48183, 48185, 48190, 48192, 48193, 48195, 48210, 48212, 48213, 48215, 48220, 48222, 48224, 48226, 48239, 48241, 48244, 48246, 48252, 48254, 48256, 48258, 48271, 48273, 48276, 48278, 48282, 48284, 48286, 48288, 48296, 48298, 48301, 48303, 48312, 48314, 48317, 48319, 48332, 48334, 48337, 48339, 48342, 48344, 48347, 48349, 48362, 48364, 48367, 48369, 48373, 48375, 48377, 48379, 48387, 48389, 48392, 48394, 48445, 48446, 48449, 48452, 48457, 48459, 48462, 48464, 48476, 48480, 48482, 48484, 48497, 48499, 48502, 48504, 48533, 48537, 48539, 48541, 48554, 48556, 48559, 48561, 48568, 48574, 48576, 48578, 48591, 48593, 48596, 48598, 48603, 48605, 48608, 48610, 48623, 48625, 48628, 48630, 48633, 48635, 48638, 48640, 48653, 48655, 48658, 48660, 50079, 50081, 50088, 50090, 50095, 50097, 50107, 50109, 50114, 50116, 50240, 50242, 50275, 50277, 50325, 50327, 50391, 50393, 50766, 50769, 50820, 50822, 50825, 50827, 50831, 50833, 50836, 50838, 50842, 50844, 50847, 50849, 50854, 50856, 50861, 50863, 50866, 50868, 51126, 51128, 51131, 51132, 51136, 51138, 51142, 51144, 51146, 51148, 51152, 51154, 51157, 51159, 51161, 51163, 51168, 51169, 51171, 51172, 51177, 51179, 51181, 51183, 51186, 51188, 51191, 51193, 51196, 51198, 51201, 51203, 51207, 51209, 51211, 51213, 51216, 51217, 51327, 51328, 51329, 51330, 51331, 51332, 51333, 51334, 51335, 51336, 51340, 51341, 51342, 51343, 51344, 51345, 51346, 51347, 51348, 51349, 51350, 51351, 51352, 51353, 51354, 51355, 51356, 51357, 51358, 51359, 51360, 51361, 51362, 51363, 51364, 51365, 51366, 51367, 51368, 51369, 51370, 51371, 51372, 51373, 51374, 51375, 51376, 51414, 51416, 51420, 51422, 51426, 51428, 51434, 51436, 51459, 51461, 51464, 51466, 51469, 51471, 51475, 51477, 51483, 51485, 51488, 51490, 51493, 51495, 51498, 51500, 51504, 51506, 51510, 51512, 51537, 51539, 51542, 51544},
})

table.insert(Journal.djDungeons,{
    name = "Utgarde Pinnacle",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-UtgardePinnacle.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {33365, 33366, 33367, 33368, 33369, 33370, 33371, 33379, 33380, 33381, 33382, 33383, 33384, 33385, 33397, 33398, 33399, 33400, 33401, 33402, 33403, 33412, 33413, 33414, 33415, 33416, 33417, 33419, 33433, 33434, 33435, 33436, 36019, 36020, 36021, 36022, 36023, 36024, 36025, 36026, 36027, 36028, 36029, 36030, 36031, 36032, 36033, 36034, 36035, 36036, 36037, 36038, 36039, 36040, 36041, 36042, 36043, 36044, 36045, 36046, 36047, 36048, 36049, 36050, 36051, 36052, 36053, 36054, 36055, 36056, 36057, 36058, 36131, 36132, 36133, 36134, 36135, 36136, 36137, 36138, 36139, 36140, 36141, 36142, 36143, 36144, 36145, 36146, 36147, 36148, 36149, 36150, 36151, 36152, 36153, 36154, 36155, 36156, 36157, 36158, 36159, 36160, 36161, 36162, 36163, 36164, 36165, 36166, 36167, 36168, 36169, 36170, 36243, 36244, 36245, 36246, 36247, 36248, 36249, 36250, 36251, 36252, 36253, 36254, 36255, 36256, 36257, 36258, 36259, 36260, 36261, 36262, 36263, 36264, 36265, 36266, 36267, 36268, 36269, 36270, 36271, 36272, 36273, 36274, 36275, 36276, 36277, 36278, 36279, 36280, 36281, 36282, 36355, 36356, 36357, 36358, 36359, 36360, 36361, 36362, 36363, 36364, 36365, 36366, 36367, 36368, 36369, 36370, 36371, 36372, 36373, 36374, 36375, 36376, 36377, 36378, 36379, 36380, 36381, 36382, 36383, 36384, 36385, 36386, 36387, 36388, 36389, 36390, 36391, 36392, 36393, 36394, 36411, 36412, 36413, 36414, 36415, 36425, 36426, 36427, 36428, 36429, 36439, 36440, 36441, 36442, 36443, 36453, 36455, 36456, 36457, 36467, 36468, 36469, 36470, 36471, 36481, 36482, 36483, 36484, 36485, 36495, 36496, 36497, 36498, 36499, 36509, 36510, 36511, 36512, 36513, 36523, 36524, 36525, 36526, 36527, 36537, 36538, 36539, 36540, 36541, 36551, 36552, 36553, 36554, 36555, 36565, 36566, 36567, 36568, 36569, 36579, 36580, 36581, 36582, 36583, 36593, 36594, 36595, 36596, 36597, 36607, 36608, 36609, 36610, 36611, 36621, 36622, 36623, 36624, 36625, 36635, 36636, 36637, 36638, 36639, 36649, 36650, 36651, 36652, 36653, 36663, 36664, 36665, 36666, 36667, 36677, 36678, 36679, 36680, 36681, 36691, 36692, 36693, 36694, 36695, 36705, 36706, 36707, 36708, 36709, 36719, 36720, 36721, 36722, 36723, 37037, 37038, 37040, 37043, 37048, 37050, 37051, 37052, 37053, 37055, 37056, 37057, 37058, 37060, 37061, 37062, 37064, 37065, 37066, 37067, 37068, 37069, 37070, 37367, 37368, 37369, 37370, 37371, 37373, 37374, 37376, 37377, 37379, 37384, 37389, 37390, 37395, 37397, 37398, 37401, 37407, 37408, 37409, 37587, 37590, 44404, 44405, 44406, 44407, 44408, 44409, 44410, 44411, 44412, 62245, 62246, 62247, 62248, 62249, 62250, 62251, 62252, 62253, 62254, 62255, 62256, 62257, 62258, 62259, 62260, 62261, 62262, 62263, 62264, 62265, 62266, 62267, 62268, 62269, 62270, 62271, 62272, 62273, 62274, 62275, 62276, 62277, 62278, 62279, 62280, 62281, 62282, 62283, 62284, 63174, 63175, 63176, 63177, 63178, 63179, 63180, 63181, 63182, 63183, 63184, 63185, 63186, 63187, 63188, 63189, 63190, 63191, 63192, 63193, 63194, 63195, 63196, 63197, 63198, 63199, 63200, 63201, 63202, 63203, 63204, 63205, 63206, 63207, 63208, 63209, 63210, 63211, 63212, 63213, 63214, 63215, 63216, 63217, 63218, 63219, 63220, 63221, 63222, 63223, 63224, 63225, 63226, 63227, 63228, 63486, 63487, 63488, 63489, 63490, 63491, 63492, 63493, 63494, 63495, 63496, 63497, 63498, 63499, 63500, 63501, 63502, 63503, 63504, 63505, 63506, 63507, 63508, 63509, 63510, 63511, 63512, 63513, 63514, 63515, 63516, 63517, 63518, 63519, 63520, 63521, 63522, 63523, 63524, 63525, 63526, 63527, 63528, 63529, 63530, 63531, 63532, 63533, 63534, 63535, 63536, 63537, 63538, 63539, 63540, 63542, 63543, 63544, 63546, 63547, 63548, 63549, 63550, 63553, 63554, 63555, 63556, 63557, 63558, 63559, 63560, 63561, 63562, 63563, 63564, 63565, 63566, 63567, 63568, 3569, 63570, 63571, 63572, 63573, 63574, 63575, 63576, 63577, 63578, 63579, 63580, 63581, 63582, 63583, 63584, 63585, 63586, 63587, 63588, 63589, 63590}
})

table.insert(Journal.djDungeons,{
    name = "Ahn'kahet: The Old Kingdom",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-AhnkahetTheOldKingdom.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {21524,35606,35607,35608,35609,35610,35611,35612,35613,35614,35615,35616,37591,37592,37593,37594,37595,37612,37613,37614,37615,37616,37617,37618,37619,37620,37622,37623,37624,37625,43277,43278,43279,43280,43281,43282,43283,43284,43285,43286,43287,62605,62606,62607,62608,62609,62610,62611,62612,62613,62614,62615,62616,62617,62618,62619,62620,62621,62622,62623,62624,62625,62626,62627,62628,62629,62630,62631,62632,62633,62634,62635,62636,62637,62638,62639,62640,63229,63230,63231,63232,63233,63234,63235,63236,63237,63238,63239,63240,63241,63242,63243,63244,63245,63246,63247,63248,63249,63250,63251,63252,63253,63254,63255,63256,63257,63258,63259,63260,63261,63262,63263,63264,63265,63266,63267,63268,63269,63270,63271,63272,63273,63274,63275,63276,63277,63278,63279,63280,63281,63282,63283,63318,63319,63320,63321,63322,63323,63324,63325,63326,63327,63328,63329,63330,63331,63332,63333,63334,63335,63336,63337,63338,63339,63340,63341,63342,63364,63365,63366,63367,63368,63369,63370,63371,63372,63373,63374,63375,63376,63377,63378,63379,63380,63381,63382,63383,63384,63385,63386,63387,63388,63389,63390,63391,63392,63393,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons,{
    name = "Utgarde Keep",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-UtgardeKeep.blp",
    bosses = {
        {
            bossID = 23954,
            spells = {},
            name = "Ingvar the Plunderer",
            flat = itemdir,
        }
    },
    items = {33358,33359,33360,33361,33362,33363,33364,33372,33373,33374,33375,33376,33377,33378,33390,33391,33392,33393,33394,33395,33396,33404,33405,33406,33407,33408,33409,33410,33437,33438,33439,33440,35570,35571,35572,35573,35574,35575,35576,35577,35578,35579,35580,35955,35956,35957,35958,35959,35960,35961,35962,35963,35964,35965,35966,35967,35968,35969,35970,35971,35972,35973,35974,35975,35976,35977,35978,36067,36068,36069,36070,36071,36072,36073,36074,36075,36076,36077,36078,36079,36080,36081,36082,36083,36084,36085,36086,36087,36088,36089,36090,36179,36180,36181,36182,36183,36184,36185,36186,36187,36188,36189,36190,36191,36192,36193,36194,36195,36196,36197,36198,36199,36200,36201,36202,36291,36292,36293,36294,36295,36296,36297,36298,36299,36300,36301,36302,36303,36304,36305,36306,36307,36308,36309,36310,36311,36312,36313,36314,36403,36404,36405,36417,36418,36419,36431,36432,36433,36445,36446,36447,36459,36460,36461,36473,36474,36475,36487,36488,36489,36501,36502,36503,36515,36516,36517,36529,36530,36531,36543,36544,36545,36557,36558,36559,36571,36572,36573,36585,36586,36587,36599,36600,36601,36613,36614,36615,36627,36628,36629,36641,36642,36643,36655,36656,36657,36669,36670,36671,36683,36684,36685,36697,36698,36699,36711,36712,36713,37177,37178,37179,37180,37181,37182,37183,37184,37186,37188,37189,37190,37191,37192,37193,37194,37196,37197,37290,38218,38219,38220,44400,44401,44402,44403,62220,62221,62222,62223,62224,62225,62226,62227,62228,62229,62230,62231,62232,62233,62234,62235,62236,62237,62238,62239,62240,62241,62242,62243,62244,63174,63175,63176,63177,63178,63179,63180,63181,63182,63183,63184,63185,63186,63187,63188,63189,63190,63191,63192,63193,63194,63195,63196,63197,63198,63199,63200,63201,63202,63203,63204,63205,63206,63207,63208,63209,63210,63211,63212,63213,63214,63215,63216,63217,63218,63219,63220,63221,63222,63223,63224,63225,63226,63227,63228,63284,63285,63286,63287,63288,63289,63290,63291,63292,63293,63294,63295,63296,63297,63298,63299,63300,63301,63302,63303,63304,63305,63306,63307,63308,63309,63310,63311,63312,63313,63314,63315,63316,63317,63343,63344,63345,63346,63347,63348,63349,63350,63351,63352,63353,63354,63355,63356,63357,63358,63359,63360,63361,63362,63363,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons,{
    name = "Gundrak",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Gundrak.blp",
    bosses = {
        {
            bossID = 23954,
            spells = {},
        }
    },
    items = {33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,35583,35584,35585,35587,35588,35589,35590,35591,35592,35593,35594,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36410,36411,36412,36413,36424,36425,36426,36427,36438,36439,36440,36441,36452,36453,36455,36466,36467,36468,36469,36480,36481,36482,36483,36494,36495,36496,36497,36508,36509,36510,36511,36522,36523,36524,36525,36536,36537,36538,36539,36550,36551,36552,36553,36564,36565,36566,36567,36578,36579,36580,36581,36592,36593,36594,36595,36606,36607,36608,36609,36620,36621,36622,36623,36634,36635,36636,36637,36648,36649,36650,36651,36662,36663,36664,36665,36676,36677,36678,36679,36690,36691,36692,36693,36704,36705,36706,36707,36718,36719,36720,36721,37626,37627,37628,37629,37630,37631,37632,37633,37634,37635,37636,37637,37638,37639,37640,37641,37642,37643,37644,37645,37646,37647,37648,37809,43305,43306,43309,43310,43311,43312,43313,62529,62530,62531,62532,62533,62534,62535,62536,62537,62538,62539,62540,62541,62542,62543,62544,62545,62546,62547,62548,62549,62550,62551,62552,62553,62554,62555,62556,62557,62558,62559,62560,62561,62562,62563,62564,63064,63065,63066,63067,63068,63069,63070,63071,63072,63073,63074,63075,63076,63077,63078,63079,63080,63081,63082,63083,63084,63085,63086,63087,63088,63089,63090,63091,63092,63093,63094,63095,63096,63097,63098,63099,63100,63101,63102,63103,63104,63105,63106,63107,63108,63109,63110,63111,63112,63113,63114,63115,63116,63117,63118,63119,63120,63121,63122,63123,63124,63125,63126,63127,63128,63129,63130,63131,63132,63133,63134,63135,63136,63137,63138,63139,63140,63141,63142,63143,63144,63145,63146,63147,63148,63149,63150,63151,63152,63153,63154,63155,63156,63157,63158,63159,63160,63161,63162,63163,63164,63165,63166,63167,63168,63169,63170,63171,63172,63173,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons,{
    name = "Halls of Stone",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HallsofStone.blp",
    bosses = {
        {
            bossID = 23954,
            spells = {},
        }
    },
    items = {33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,35670,35672,35673,35675,35676,35677,35678,35679,35680,35681,35682,35683,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36410,36411,36412,36413,36424,36425,36426,36427,36438,36439,36440,36441,36452,36453,36455,36466,36467,36468,36469,36480,36481,36482,36483,36494,36495,36496,36497,36508,36509,36510,36511,36522,36523,36524,36525,36536,36537,36538,36539,36550,36551,36552,36553,36564,36565,36566,36567,36578,36579,36580,36581,36592,36593,36594,36595,36606,36607,36608,36609,36620,36621,36622,36623,36634,36635,36636,36637,36648,36649,36650,36651,36662,36663,36664,36665,36676,36677,36678,36679,36690,36691,36692,36693,36704,36705,36706,36707,36718,36719,36720,36721,36997,36999,37000,37650,37651,37652,37653,37654,37655,37656,37657,37658,37660,37666,37667,37668,37669,37670,37671,37672,37673,38611,38613,38614,38615,38616,38617,38618,44370,44371,44372,44373,62401,62402,62403,62404,62405,62406,62407,62408,62409,62410,62411,62412,62413,62414,62415,62416,62417,62418,62419,62420,62421,62422,62423,62424,62425,62426,62427,62428,62429,62430,62431,63010,63011,63012,63013,63014,63015,63016,63017,63018,63019,63020,63021,63022,63023,63024,63025,63026,63027,63028,63029,63030,63031,63032,63033,63034,63035,63036,63037,63038,63039,63040,63041,63042,63043,63044,63045,63046,63047,63048,63049,63050,63051,63052,63053,63054,63055,63056,63057,63058,63059,63060,63061,63062,63063,63119,63120,63121,63122,63123,63124,63125,63126,63127,63128,63129,63130,63131,63132,63133,63134,63135,63136,63137,63138,63139,63140,63141,63142,63143,63144,63145,63146,63147,63148,63149,63150,63151,63152,63153,63154,63155,63156,63157,63158,63159,63160,63161,63162,63163,63164,63165,63166,63167,63168,63169,63170,63171,63172,63173,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons,{
    name = "Halls of Lightning",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HallsofLightning.blp",
    bosses = {
        {
            bossID = 23954,
            spells = {},
        }
    },
    items = {36979,36980,36981,36982,36983,36984,36985,36986,36988,36989,36991,36992,36993,36994,36995,36996,36997,36999,37000,37814,37818,37825,37826,37840,37841,37842,37843,37844,37845,37846,37847,37848,37849,37850,37851,37852,37853,37854,37855,37856,37857,37858,39534,39535,39536,39657,62489,62490,62491,62492,62493,62494,62495,62496,62497,62498,62499,62500,62501,62502,62503,62504,62505,62506,62507,62508,62509,62510,62511,62512,62513,62514,62515,62516,62517,62518,62519,62520,62521,62522,62523,62524,62525,62526,62527,62528,62845,62846,62847,62848,62849,62850,62851,62852,62853,62854,62855,62856,62857,62858,62859,62860,62861,62862,62863,62864,62865,62866,62867,62868,62869,62870,62871,62872,62873,62874,62875,62876,62877,62878,62879,62880,62881,62882,62883,62884,62885,62886,62887,62888,62889,62890,62891,62892,62893,62894,62895,62896,62897,62898,62899,63010,63011,63012,63013,63014,63015,63016,63017,63018,63019,63020,63021,63022,63023,63024,63025,63026,63027,63028,63029,63030,63031,63032,63033,63034,63035,63036,63037,63038,63039,63040,63041,63042,63043,63044,63045,63046,63047,63048,63049,63050,63051,63052,63053,63054,63055,63056,63057,63058,63059,63060,63061,63062,63063,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons,{
    name = "Trial of the Champion",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TrialOfTheChampion.blp",
    bosses = {
        {
            bossID = 23954,
            spells = {},
        }
    },
    items = {47170,47171,47172,47173,47174,47175,47176,47177,47178,47181,47185,47197,47199,47200,47201,47202,47210,47211,47212,47213,47214,47215,47216,47217,47218,47219,47220,47221,47222,47226,47227,47228,47230,47231,47232,47243,47244,47245,47248,47249,47250,47493,47494,47495,47496,47497,47498,47500,47501,47502,47503,47504,47508,47509,47510,47511,47512,47514,47522,47527,47529,47560,47561,47562,47563,47564,47565,47566,47567,47568,47569,49682,62677,62678,62679,62680,62681,62682,62683,62684,62685,62686,62687,62688,62689,62690,62691,62692,62693,62694,62695,62696,62697,62698,62699,62700,62701,62702,62703,62704,62705,62706,62707,62708,62709,62710,62711,62712,62713,62714,62715,62716,62717,62718,62719,62720,62721,62722,62723,62724,62725,62726,62727,62728,62729,62730,62731,62732,62733,62734,62735,62736,62737,62738,62739,62740,62741,62742,62743,62744,62745,62746,62747,62748,62845,62846,62847,62848,62849,62850,62851,62852,62853,62854,62855,62856,62857,62858,62859,62860,62861,62862,62863,62864,62865,62866,62867,62868,62869,62870,62871,62872,62873,62874,62875,62876,62877,62878,62879,62880,62881,62882,62883,62884,62885,62886,62887,62888,62889,62890,62891,62892,62893,62894,62895,62896,62897,62898,62899,62900,62901,62902,62903,62904,62905,62906,62907,62908,62909,62910,62911,62912,62913,62914,62915,62916,62917,62918,62919,62920,62921,62922,62923,62924,62925,62926,62927,62928,62929,62930,62931,62932,62933,62934,62935,62936,62937,62938,62939,62940,62941,62942,62943,62944,62945,62946,62947,62948,62949,62950,62951,62952,62953,62954,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons, {
    name = "Azjol-Nerub", -- UI-EJ-DUNGEONBUTTON-VaultofArchavon
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-AzjolNerub.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {35655,35656,35657,35658,35659,35660,35661,35662,35663,37216,37217,37218,37219,37220,37221,37222,37230,37232,37235,37236,37237,37238,37240,37241,37242,37243,37624,37625,62464,62465,62466,62467,62468,62469,62470,62471,62472,62473,62474,62475,62476,62477,62478,62479,62480,62481,62482,62483,62484,62485,62486,62487,62488,63318,63319,63320,63321,63322,63323,63324,63325,63326,63327,63328,63329,63330,63331,63332,63333,63334,63335,63336,63337,63338,63339,63340,63341,63342,63364,63365,63366,63367,63368,63369,63370,63371,63372,63373,63374,63375,63376,63377,63378,63379,63380,63381,63382,63383,63384,63385,63386,63387,63388,63389,63390,63391,63392,63393,63429,63430,63431,63432,63433,63434,63435,63436,63437,63438,63439,63440,63441,63442,63443,63444,63445,63446,63447,63448,63449,63450,63451,63452,63453,63454,63455,63456,63457,63477,63478,63479,63480,63481,63482,63483,63484,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons, {
    name = "Drak'Tharon Keep", -- UI-EJ-DUNGEONBUTTON-VaultofArchavon
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-DrakTharonKeep.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {33358,33359,33360,33361,33362,33363,33364,33365,33366,33367,33368,33369,33370,33371,33372,33373,33374,33375,33376,33377,33378,33379,33380,33381,33382,33383,33384,33385,33390,33391,33392,33393,33394,33395,33396,33397,33398,33399,33400,33401,33402,33403,33404,33405,33406,33407,33408,33409,33410,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,33437,33438,33439,33440,35618,35619,35620,35630,35631,35632,35633,35634,35635,35636,35637,35638,35639,35640,35641,35979,35980,35981,35982,35983,35984,35985,35986,35987,35988,35989,35990,35991,35992,35993,35994,35995,35996,35997,35998,35999,36000,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36091,36092,36093,36094,36095,36096,36097,36098,36099,36100,36101,36102,36103,36104,36105,36106,36107,36108,36109,36110,36111,36112,36113,36114,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36203,36204,36205,36206,36207,36208,36209,36210,36211,36212,36213,36214,36215,36216,36217,36218,36219,36220,36221,36222,36223,36224,36225,36226,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36315,36316,36317,36318,36319,36320,36321,36322,36323,36324,36325,36326,36327,36328,36329,36330,36331,36332,36333,36334,36335,36336,36337,36338,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36406,36407,36408,36409,36410,36411,36420,36421,36422,36423,36424,36425,36434,36435,36436,36437,36438,36439,36448,36449,36450,36451,36452,36453,36462,36463,36464,36465,36466,36467,36476,36478,36479,36480,36481,36490,36492,36493,36494,36495,36504,36506,36507,36508,36509,36518,36520,36521,36522,36523,36532,36534,36535,36536,36537,36546,36548,36549,36550,36551,36560,36562,36563,36564,36565,36574,36576,36577,36578,36579,36588,36590,36591,36592,36593,36602,36604,36605,36606,36607,36616,36618,36619,36620,36621,36630,36632,36633,36634,36635,36644,36646,36647,36648,36649,36658,36660,36661,36662,36663,36672,36674,36675,36676,36677,36686,36688,36689,36690,36691,36700,36702,36703,36704,36705,36714,36716,36717,36718,36719,37712,37714,37715,37717,37718,37721,37722,37723,37724,37725,37726,37732,37733,37734,37735,37757,37784,37788,37791,37798,37799,37800,37801,40490,62432,62433,62434,62435,62436,62437,62438,62439,62440,62441,62442,62443,62444,62445,62446,62447,62448,62449,62450,62451,62452,62453,62454,62455,62456,62457,62458,62459,62460,62461,62462,62463,63064,63065,63066,63067,63068,63069,63070,63071,63072,63073,63074,63075,63076,63077,63078,63079,63080,63081,63082,63083,63084,63085,63086,63087,63088,63089,63090,63091,63092,63093,63094,63095,63096,63097,63098,63099,63100,63101,63102,63103,63104,63105,63106,63107,63108,63109,63110,63111,63112,63113,63114,63115,63116,63117,63118,63119,63120,63121,63122,63123,63124,63125,63126,63127,63128,63129,63130,63131,63132,63133,63134,63135,63136,63137,63138,63139,63140,63141,63142,63143,63144,63145,63146,63147,63148,63149,63150,63151,63152,63153,63154,63155,63156,63157,63158,63159,63160,63161,63162,63163,63164,63165,63166,63167,63168,63169,63170,63171,63172,63173,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons, {
    name = "Halls of Reflection", -- UI-EJ-DUNGEONBUTTON-VaultofArchavon
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HallsofReflection.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {33364,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36413,36414,36415,36427,36428,36429,36441,36442,36443,36455,36456,36457,36469,36470,36471,36483,36484,36485,36497,36498,36499,36511,36512,36513,36525,36526,36527,36539,36540,36541,36553,36554,36555,36567,36568,36569,36581,36582,36583,36595,36596,36597,36609,36610,36611,36623,36624,36625,36637,36638,36639,36651,36652,36653,36665,36666,36667,36679,36680,36681,36693,36694,36695,36707,36708,36709,36721,36722,36723,37760,37761,37770,37771,37780,37781,37792,37793,37794,37822,37824,37835,44308,44309,44310,44311,44312,44313,49827,49828,49829,49830,49831,49832,49833,49834,49835,49836,49837,49838,49852,49853,49854,49855,50290,50291,50292,50293,50294,50295,50296,50297,50298,50299,50300,50315,50318,50319,62797,62798,62799,62800,62801,62802,62803,62804,62805,62806,62807,62808,62809,62810,62811,62812,62813,62814,62815,62816,62817,62818,62819,62820,62955,62956,62957,62958,62959,62960,62961,62962,62963,62964,62965,62966,62967,62968,62969,62970,62971,62972,62973,62974,62975,62976,62977,62978,62979,62980,62981,62982,62983,62984,62985,62986,62987,62988,62989,62990,62991,62992,62993,62994,62995,62996,62997,62998,62999,63000,63001,63002,63003,63004,63005,63006,63007,63008,63009,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590,63591,63592,63593,63594,63595,63596,63597,63598,63599,63600,63601,63602,63603,63604,63605,63606,63607,63608,63609,63610,63611,63612,63613,63614,63615,63616,63617,63618,63619,63620,63621,63622,63623,63624,63625,63626,63627,63628,63629,63630,63631,63632,63633,63634,63635,63636,63637,63638,63639,63640,63641,63642,63643,63644,63645},
})

table.insert(Journal.djDungeons, {
    name = "Pit of Saron",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-PitofSaron.blp",
    bosses = {
        {
            bossID = 36476,
            name = "Ick",
            flat = itemdir,
        }
    },
    items = {33364,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36413,36414,36415,36427,36428,36429,36441,36442,36443,36455,36456,36457,36469,36470,36471,36483,36484,36485,36497,36498,36499,36511,36512,36513,36525,36526,36527,36539,36540,36541,36553,36554,36555,36567,36568,36569,36581,36582,36583,36595,36596,36597,36609,36610,36611,36623,36624,36625,36637,36638,36639,36651,36652,36653,36665,36666,36667,36679,36680,36681,36693,36694,36695,36707,36708,36709,36721,36722,36723,37760,37761,37770,37771,37780,37781,37792,37793,37794,37822,37824,37835,44308,44309,44310,44311,44312,44313,49801,49802,49803,49804,49805,49806,49807,49808,49809,49810,49811,49812,49813,49816,49817,49818,49819,49820,49821,49822,49823,49824,49825,49826,49852,49853,49854,49855,50227,50228,50229,50230,50233,50234,50235,50259,50262,50263,50264,50265,50266,50267,50268,50269,50270,50271,50272,50273,50283,50284,50285,50286,50315,50318,50319,62749,62750,62751,62752,62753,62754,62755,62756,62757,62758,62759,62760,62761,62762,62763,62764,62765,62766,62767,62768,62769,62770,62771,62772,62773,62774,62775,62776,62777,62778,62779,62780,62781,62782,62783,62784,62785,62786,62787,62788,62789,62790,62791,62792,62793,62794,62795,62796,62955,62956,62957,62958,62959,62960,62961,62962,62963,62964,62965,62966,62967,62968,62969,62970,62971,62972,62973,62974,62975,62976,62977,62978,62979,62980,62981,62982,62983,62984,62985,62986,62987,62988,62989,62990,62991,62992,62993,62994,62995,62996,62997,62998,62999,63000,63001,63002,63003,63004,63005,63006,63007,63008,63009,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590,63591,63592,63593,63594,63595,63596,63597,63598,63599,63600,63601,63602,63603,63604,63605,63606,63607,63608,63609,63610,63611,63612,63613,63614,63615,63616,63617,63618,63619,63620,63621,63622,63623,63624,63625,63626,63627,63628,63629,63630,63631,63632,63633,63634,63635,63636,63637,63638,63639,63640,63641,63642,63643,63644,63645},
})

table.insert(Journal.djDungeons, {
    name = "Ragefire Chasm",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RagefireChasm.blp",
    bosses = {
        {
            bossID = 11517,
            spells = {},
            name = "Oggleflint",
            flat = itemdir,
        },
        {
            bossID = 11520,
            spells = {},
            name = "Taragaman the Hungerer",
            flat = itemdir,
        },
        {
            bossID = 11518,
            spells = {},
            name = "Jergosh the Invoker",
            flat = itemdir,
        },
        {
            bossID = 11519,
            spells = {},
            name = "Bazzalan",
            flat = itemdir,
        },
        
    },
    items = {727,826,827,1211,1214,1218,1220,1287,1296,1300,1391,1394,1405,1440,1446,1448,1460,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1764,1766,1767,1768,1769,1770,1787,1788,1789,1790,1791,1792,1793,1794,1926,1928,1929,1934,1936,1943,1944,1945,1958,1959,2073,2075,2078,2079,2088,2140,2166,2167,2168,2214,2215,2216,2217,2632,2957,2958,2961,2962,2965,2966,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3184,3192,3193,3195,3196,3205,3207,3211,3213,3279,3282,3283,3284,3286,3287,3288,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3374,3375,3376,3377,3643,3644,3645,3649,3651,3652,3653,3654,3655,4290,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4676,4677,4678,4680,4681,4683,4686,4687,4689,4690,4692,4693,4695,4697,4699,4701,4767,4768,4771,4788,4949,6266,6267,6268,6269,6336,6337,6378,6379,6380,6511,6512,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6556,6557,6558,6559,6560,6561,6562,6563,6564,6575,6581,6583,6585,7108,7554,7608,8178,9743,9746,9747,9748,9749,9753,9756,9757,9758,9759,9760,9762,9763,9764,9765,9768,9770,9775,9776,9777,9778,9779,9780,9783,9784,9785,9786,9787,9788,9789,9790,11965,11981,12052,12053,14025,14090,14091,14094,14096,14097,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14129,14131,14147,14148,14149,14150,14151,14160,14161,14164,14166,14167,14168,14173,14174,14364,14365,14366,14367,14370,14559,14560,14561,14563,14564,14565,14571,14722,14723,14724,14725,14726,14727,14729,14745,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15110,15111,15112,15114,15210,15222,15248,15268,15298,15300,15301,15303,15304,15305,15306,15307,15308,15309,15310,15312,15452,15453,15477,15479,15480,15481,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15497,15498,15499,15501,15502,15506,15507,15508,15509,15510,15893,15925,15926,15932,15933,15944,15945,15969,15970,15971},
})

table.insert(Journal.djDungeons, {
    name = "Wailing Caverns",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-WailingCaverns.blp",
    bosses = {
        {
            bossID = 5912,
            spells = {},
            name = "Deviate Faerie Dragon",
            flat = itemdir,
        },
        {
            bossID = 3653,
            spells = {},
            name = "Kresh",
            flat = itemdir,
        },
        {
            bossID = 3654,
            spells = {},
            name = "Mutanus the Devourer",
            flat = itemdir,
        },
        {
            bossID = 3669,
            spells = {},
            name = "Lord Cobrahn",
            flat = itemdir,
        },
        {
            bossID = 3670,
            spells = {},
            name = "Lord Pythas",
            flat = itemdir,
        },
        {
            bossID = 3671,
            spells = {},
            name = "Lady Anacondra",
            flat = itemdir,
        },
        {
            bossID = 3673,
            spells = {},
            name = "Lord Serpentis",
            flat = itemdir,
        },
        {
            bossID = 3674,
            spells = {},
            name = "Skum",
            flat = itemdir,
        },
        {
            bossID = 5775,
            spells = {},
            name = "Verdan the Everliving",
            flat = itemdir,
        }
    },
    items = {236,237,238,239,789,790,827,886,890,911,920,935,1076,1077,1121,1214,1218,1220,1296,1299,1300,1391,1405,1406,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1849,1850,1928,1929,1934,1936,1943,1944,1945,1958,1959,2013,2034,2059,2072,2073,2078,2079,2166,2167,2168,2175,2194,2216,2217,2219,2220,2227,2232,2233,2236,2300,2303,2308,2309,2310,2314,2315,2316,2566,2632,2879,2911,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3193,3195,3196,3198,3199,3202,3204,3205,3207,3211,3212,3227,3302,3304,3305,3306,3307,3308,3309,3310,3311,3313,3314,3315,3376,3377,3378,3379,3429,3569,3643,3645,3647,3651,3652,3653,3654,3655,3656,3719,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4036,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4290,4567,4568,4569,4570,4571,4575,4661,4676,4678,4681,4687,4693,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4713,4714,4715,4788,4949,4998,4999,5001,5110,5404,5422,5423,5425,5739,5961,5962,5964,5966,5970,6378,6379,6380,6381,6382,6383,6394,6447,6448,6449,6459,6460,6461,6463,6465,6473,6480,6481,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6580,6581,6582,6583,6584,6585,6586,6587,6591,6593,6600,6602,6604,6608,6627,6629,6630,6631,6632,7281,7282,7285,7348,7374,7377,7378,7387,7554,7558,7608,8175,8176,8185,8189,8191,8193,8197,8198,8746,8747,9747,9748,9749,9756,9757,9763,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9792,9793,9794,9795,9796,9799,9801,9802,9803,9804,9805,9806,9807,9810,9811,9812,9813,9814,9815,9816,9817,9818,10287,10407,10410,10411,10412,10413,11965,11967,11968,11981,11982,11983,11993,11994,12006,12007,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13245,14025,14096,14097,14109,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14171,14172,14173,14174,14175,14176,14177,14179,14185,14188,14364,14365,14366,14367,14368,14369,14370,14371,14373,14374,14375,14376,14377,14378,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14571,14572,14573,14574,14580,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14745,14746,14747,14748,14749,14752,15011,15012,15013,15014,15016,15017,15018,15019,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15122,15124,15210,15211,15212,15222,15223,15224,15230,15241,15248,15249,15259,15268,15269,15300,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15340,15348,15485,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15523,15526,15527,15528,15532,15891,15893,15894,15912,15926,15927,15933,15945,15946,15970,15971,15972,15974},
})

table.insert(Journal.djDungeons, {
    name = "The Stockade",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheStockade.blp",
    bosses = {
        {
            bossID = 1663,
            spells = {},
            name = "Dextren Ward",
            flat = itemdir,
        },
        {
            bossID = 1666,
            spells = {},
            name = "Kam Deepfury",
            flat = itemdir,
        },
        {
            bossID = 1696,
            spells = {},
            name = "Targorr the Dread",
            flat = itemdir,
        },
        {
            bossID = 1716,
            spells = {},
            name = "Bazil Thredd",
            flat = itemdir,
        },
        {
            bossID = 1717,
            spells = {},
            name = "Hamhock",
            flat = itemdir,
        },
        {
            bossID = 1720,
            spells = {},
            name = "Bruegal Ironknuckle",
            flat = itemdir,
        }
    },
    items = {720,789,790,791,827,886,890,897,911,920,935,1076,1077,1121,1214,1218,1220,1296,1299,1300,1351,1391,1405,1406,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1717,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1928,1929,1934,1936,1943,1944,1945,1958,1959,1997,1998,2011,2013,2017,2034,2059,2072,2077,2078,2079,2080,2166,2167,2168,2175,2194,2219,2220,2221,2222,2227,2232,2233,2236,2278,2280,2566,2721,2800,2819,2877,2878,2879,2911,2912,2941,2969,2970,2973,2974,2977,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3193,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3210,3211,3212,3227,3228,3305,3306,3309,3310,3313,3315,3341,3378,3379,3380,3381,3429,3569,3645,3647,3655,3656,3740,4036,4037,4039,4040,4049,4051,4052,4054,4055,4064,4066,4072,4075,4076,4077,4290,4567,4568,4571,4575,4661,4676,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4788,4949,4998,4999,5001,5002,5755,6378,6379,6380,6381,6382,6383,6386,6387,6388,6393,6394,6395,6396,6397,6398,6399,6403,6404,6406,6407,6408,6409,6410,6528,6531,6536,6538,6539,6540,6541,6545,6546,6547,6548,6551,6552,6553,6554,6557,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,7330,7331,7353,7354,7356,7357,7366,7367,7368,7369,7406,7407,7408,7409,7412,7413,7414,7415,7417,7418,7419,7420,7421,7422,7423,7424,7436,7460,7554,7558,7608,7609,8748,9405,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9821,9822,9824,9825,9826,9827,9829,9830,9831,9833,9834,9835,9836,9837,9838,9841,9842,9843,9845,9846,9847,9853,9855,9857,9860,9861,9865,9867,9868,9869,10287,10289,10404,10405,10406,10407,10408,10409,11965,11967,11968,11969,11970,11981,11982,11983,11984,11985,11993,11994,11995,11996,12006,12007,12008,12009,12019,12028,12029,12039,12047,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13048,13049,13079,13087,13094,13097,13099,13106,13114,13127,13131,14025,14096,14109,14114,14117,14119,14120,14121,14122,14123,14124,14125,14127,14129,14131,14133,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14170,14171,14172,14173,14174,14175,14176,14177,14179,14181,14182,14185,14186,14187,14188,14189,14194,14195,14196,14199,14200,14201,14203,14205,14206,14209,14210,14211,14212,14214,14219,14221,14364,14366,14367,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14400,14401,14402,14404,14405,14408,14409,14411,14414,14416,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14580,14581,14582,14583,14584,14585,14587,14590,14593,14722,14723,14724,14725,14726,14727,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14759,14761,14763,14764,15012,15014,15016,15017,15018,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15130,15131,15132,15133,15137,15139,15140,15142,15143,15147,15148,15210,15211,15212,15222,15223,15224,15225,15230,15232,15241,15242,15248,15249,15250,15259,15268,15269,15304,15305,15306,15307,15308,15310,15311,15312,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15346,15347,15348,15349,15350,15352,15354,15355,15357,15358,15487,15488,15489,15493,15494,15497,15498,15499,15500,15501,15502,15503,15504,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15532,15535,15536,15537,15540,15541,15542,15543,15544,15547,15548,15550,15551,15553,15554,15555,15556,15560,15566,15568,15571,15579,15891,15892,15893,15894,15912,15926,15927,15934,15935,15945,15946,15947,15962,15971,15972,15974},
})

table.insert(Journal.djDungeons, {
    name = "Gnomeregan",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Gnomeregan.blp",
    bosses = {
        {
            bossID = 7800,
            spells = {},
            name = "Mekgineer Thermaplugg",
            flat = itemdir,
        },
        {
            bossID = 6231,
            spells = {},
            name = "Mechanical Menagerie",
            flat = itemdir,
        },
        {
            bossID = 7361,
            spells = {},
            name = "Grubbis",
            flat = itemdir,
        }
    },
    items = {720,789,790,791,863,886,890,897,911,920,1076,1077,1121,1218,1220,1296,1299,1300,1351,1406,1448,1455,1457,1458,1459,1460,1461,1462,1522,1523,1717,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1934,1990,1993,1996,1997,1998,2011,2013,2017,2034,2059,2072,2077,2080,2166,2167,2168,2175,2194,2219,2220,2221,2222,2227,2232,2233,2236,2278,2566,2621,2721,2800,2819,2877,2878,2879,2911,2912,2981,2982,2985,2986,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3193,3197,3198,3199,3201,3202,3203,3204,3206,3210,3212,3227,3341,3345,3378,3379,3380,3381,3429,3569,3647,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4036,4037,4038,4039,4040,4049,4051,4052,4054,4055,4057,4059,4064,4065,4066,4072,4074,4075,4076,4077,4568,4661,4694,4697,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4726,4732,4788,4949,4998,4999,5001,5002,5009,5755,6381,6382,6383,6386,6387,6388,6393,6394,6395,6396,6397,6398,6399,6402,6403,6404,6405,6406,6407,6408,6409,6410,6413,6417,6418,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,7111,7330,7331,7353,7354,7356,7357,7366,7367,7368,7369,7406,7407,7408,7409,7412,7413,7414,7415,7417,7418,7419,7420,7421,7422,7423,7424,7433,7434,7436,7437,7438,7443,7444,7446,7447,7448,7457,7458,7460,7461,7462,7554,7558,7608,7609,8746,8747,8748,9362,9405,9444,9445,9447,9448,9449,9450,9452,9454,9455,9457,9458,9459,9461,9488,9489,9490,9491,9492,9508,9509,9510,9535,9536,9766,9767,9768,9769,9770,9771,9772,9773,9774,9776,9778,9780,9781,9782,9783,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9821,9822,9824,9825,9826,9827,9829,9830,9831,9833,9834,9835,9836,9837,9838,9841,9842,9843,9845,9846,9847,9848,9849,9850,9851,9853,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9867,9868,9869,9870,9871,9872,9873,10287,10289,10298,10299,10404,10405,10406,10407,10408,10409,11965,11967,11968,11969,11970,11971,11981,11982,11983,11984,11985,11993,11994,11995,11996,12006,12007,12008,12009,12010,12019,12020,12028,12029,12039,12047,12052,12053,12054,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13048,13049,13079,13087,13094,13097,13099,13106,13114,13127,13131,14120,14121,14124,14125,14126,14127,14129,14133,14157,14158,14159,14162,14163,14164,14165,14168,14170,14171,14172,14173,14175,14176,14177,14179,14181,14182,14185,14186,14187,14188,14189,14194,14195,14196,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14217,14218,14219,14221,14222,14226,14229,14235,14369,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14400,14401,14402,14404,14405,14408,14409,14411,14412,14414,14415,14416,14562,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14593,14594,14607,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14759,14761,14762,14763,14764,14766,15018,15110,15111,15112,15113,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15130,15131,15132,15133,15134,15137,15139,15140,15142,15143,15144,15145,15147,15148,15149,15150,15151,15153,15211,15212,15213,15223,15224,15225,15226,15230,15232,15241,15242,15243,15248,15249,15250,15259,15269,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15346,15347,15348,15349,15350,15352,15354,15355,15356,15357,15358,15361,15364,15488,15498,15500,15502,15503,15504,15505,15506,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15532,15535,15536,15537,15540,15541,15542,15543,15544,15546,15547,15548,15550,15551,15552,15553,15554,15555,15556,15557,15558,15560,15561,15562,15563,15566,15568,15570,15571,15575,15577,15579,15590,15594,15891,15892,15893,15894,15912,15927,15929,15934,15935,15946,15947,15962,15971,15972,15974,15976,15977},
})

table.insert(Journal.djDungeons, {
    name = "Razorfen Kraul",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RazorfenKraul.blp",
    bosses = {
        {
            bossID = 4421,
            spells = {},
            name = "Charlga Razorflank",
            flat = itemdir,
        },
        {
            bossID = 4420,
            spells = {},
            name = "Overlord Ramtusk",
            flat = itemdir,
        },
        {
            bossID = 4422,
            spells = {},
            name = "Agathelos the Raging",
            flat = itemdir,
        }
    },
    items = {720,776,789,790,791,863,886,890,897,911,920,1076,1077,1121,1299,1351,1406,1455,1457,1458,1459,1461,1462,1488,1522,1523,1717,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1975,1976,1978,1990,1993,1996,1997,1998,2011,2013,2017,2034,2039,2059,2072,2077,2080,2175,2194,2219,2220,2221,2222,2227,2232,2233,2236,2264,2278,2549,2566,2621,2800,2816,2819,2878,2879,2911,2981,2985,2989,2990,2991,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3185,3186,3193,3197,3198,3199,3201,3202,3203,3204,3206,3210,3212,3227,3341,3345,3378,3379,3380,3381,3429,3569,3647,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4036,4037,4038,4039,4040,4049,4051,4052,4054,4055,4057,4059,4064,4065,4066,4072,4074,4075,4076,4077,4438,4568,4661,4694,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4726,4732,4998,4999,5001,5002,5009,5755,6381,6382,6383,6386,6387,6388,6393,6394,6395,6396,6397,6398,6399,6402,6403,6404,6405,6406,6407,6408,6409,6410,6413,6417,6418,6561,6562,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6576,6577,6578,6579,6580,6581,6582,6583,6584,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6679,6681,6682,6685,6686,6687,6688,6689,6690,6691,6692,6693,6694,6695,6696,6697,6748,6749,6750,6751,6752,7111,7330,7331,7353,7354,7356,7357,7366,7367,7368,7369,7406,7407,7408,7409,7412,7413,7414,7415,7417,7418,7419,7420,7421,7422,7423,7424,7433,7434,7436,7437,7438,7443,7444,7446,7447,7448,7457,7458,7460,7461,7462,7554,7558,7608,7609,8746,8747,8748,9766,9767,9769,9771,9772,9773,9774,9778,9781,9782,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9821,9822,9824,9825,9826,9827,9829,9830,9831,9833,9834,9835,9836,9837,9838,9841,9842,9843,9845,9846,9847,9848,9849,9850,9851,9853,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9867,9868,9869,9870,9871,9872,9873,10287,10289,10404,10405,10406,10407,10408,10409,11967,11968,11969,11970,11971,11982,11983,11984,11985,11993,11994,11995,11996,12006,12007,12008,12009,12010,12019,12020,12028,12029,12039,12047,12052,12053,12054,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13048,13049,13079,13094,13097,13099,13106,13114,13131,14126,14127,14133,14157,14158,14159,14162,14163,14165,14170,14171,14172,14175,14176,14177,14179,14181,14182,14185,14186,14187,14188,14189,14194,14195,14196,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14217,14218,14219,14221,14222,14226,14229,14235,14369,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14400,14401,14402,14404,14405,14408,14409,14411,14412,14414,14415,14416,14562,14566,14567,14568,14569,14570,14572,14573,14574,14578,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14593,14594,14607,14730,14742,14743,14744,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14759,14761,14762,14763,14764,14766,15113,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15130,15131,15132,15133,15134,15137,15139,15140,15142,15143,15144,15145,15147,15148,15149,15150,15151,15153,15211,15212,15213,15223,15224,15225,15226,15230,15232,15241,15242,15243,15249,15250,15259,15269,15311,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15346,15347,15348,15349,15350,15352,15354,15355,15356,15357,15358,15361,15364,15500,15503,15504,15505,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15532,15535,15536,15537,15540,15541,15542,15543,15544,15546,15547,15548,15550,15551,15552,15553,15554,15555,15556,15557,15558,15560,15561,15562,15563,15566,15568,15570,15571,15575,15577,15579,15590,15594,15891,15892,15894,15912,15927,15929,15934,15935,15946,15947,15962,15972,15974,15976,15977},
})

table.insert(Journal.djDungeons, {
    name = "Razorfen Downs",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RazorfenDowns.blp",
    bosses = {
        {
            bossID = 7355,
            spells = {},
            name = "Tuten'kash",
            flat = itemdir,
        },
        {
            bossID = 7354,
            spells = {},
            name = "Mordresh Fire Eye",
            flat = itemdir,
        },
        {
            bossID = 7356,
            spells = {},
            name = "Plaguemaw the Rotting",
            flat = itemdir,
        }
    },
    items = {720,789,790,791,863,864,865,866,867,868,873,890,897,936,1121,1204,1207,1280,1351,1521,1522,1523,1613,1624,1625,1640,1659,1664,1714,1715,1716,1717,1718,1722,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1980,1988,1990,1993,1996,1997,1998,2011,2017,2059,2072,2077,2080,2194,2219,2220,2221,2222,2236,2276,2277,2278,2565,2620,2621,2623,2624,2721,2800,2802,2815,2819,2877,2878,2879,2911,2912,2951,2981,2985,2989,2990,2991,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3185,3186,3187,3193,3197,3198,3199,3201,3202,3203,3206,3210,3212,3341,3345,3378,3379,3380,3381,3430,3647,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4083,4087,4568,4614,4661,4694,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4734,4735,4736,4737,4738,4998,4999,5001,5002,5003,5007,5009,5011,5215,5216,5608,5624,5755,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6428,6429,6431,6432,6433,6561,6562,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6576,6577,6578,6579,6580,6581,6582,6583,6584,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,7110,7111,7112,7330,7331,7332,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7522,7524,7525,7533,7534,7544,7545,7552,7555,7556,7558,7608,7609,7610,8120,8137,8139,8140,8141,8142,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8746,8747,8748,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9385,9395,9405,9434,9435,9778,9781,9782,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9906,9907,9908,9909,9910,9912,9915,9916,9917,9918,9919,9920,9921,9923,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9959,9966,9967,9968,9969,9970,9971,9972,9973,10088,10089,10094,10288,10289,10404,10405,10406,10407,10408,10409,10570,10571,10572,10573,10574,10578,10581,10582,10583,10584,10710,10758,10760,10762,10763,10764,10765,10766,10767,10768,10769,10770,10771,10774,10775,10776,10777,11967,11968,11969,11970,11971,11972,11973,11982,11983,11984,11985,11986,11987,11993,11994,11995,11996,11997,11998,12006,12007,12008,12009,12010,12011,12012,12019,12020,12022,12023,12028,12029,12030,12031,12039,12040,12042,12047,12052,12053,12054,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13025,13026,13029,13031,13033,13034,13038,13041,13042,13045,13048,13049,13058,13064,13071,13079,13081,13084,13087,13088,13093,13094,13095,13097,13099,13100,13103,13105,13106,13108,13110,13114,13115,13117,13119,13121,13124,13127,13129,13131,13132,13138,13145,13199,14170,14171,14172,14175,14181,14182,14186,14187,14189,14194,14195,14196,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14238,14239,14240,14241,14242,14243,14245,14246,14247,14248,14250,14251,14252,14253,14255,14257,14258,14260,14261,14262,14270,14372,14379,14380,14397,14398,14400,14401,14402,14404,14405,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14428,14429,14430,14431,14432,14435,14570,14578,14581,14582,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14652,14654,14656,14744,14750,14751,14753,14754,14755,14756,14757,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14781,14782,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14838,14839,14841,14895,14896,14897,14898,14899,14900,14901,14902,14903,14905,14906,14909,14910,14940,14941,14942,14943,14944,14945,14946,14956,15121,15123,15125,15126,15130,15131,15132,15133,15134,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15165,15166,15168,15169,15211,15212,15213,15214,15215,15223,15224,15225,15226,15230,15231,15232,15233,15234,15241,15242,15243,15244,15249,15250,15251,15259,15260,15261,15269,15287,15337,15338,15339,15346,15347,15349,15350,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15374,15375,15377,15382,15522,15525,15529,15535,15536,15537,15540,15541,15542,15543,15544,15546,15547,15548,15550,15551,15552,15553,15554,15555,15556,15557,15558,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15602,15603,15605,15606,15607,15608,15610,15611,15612,15613,15614,15617,15624,15892,15912,15918,15927,15928,15929,15934,15935,15947,15962,15963,15964,15976,15977,15978,15979,15990},
})

table.insert(Journal.djDungeons, {
    name = "Scarlet Monastery",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ScarletMonastery.blp",
    bosses = {
        {
            bossID = 3975,
            spells = {},
            name = "Herod",
            flat = itemdir,
        },
        {
            bossID = 4542,
            spells = {},
            name = "High Inquisitor Fairbanks",
            flat = itemdir,
        },
        {
            bossID = 3977,
            spells = {},
            name = "High Inquisitor Whitemane",
            flat = itemdir,
        },
        {
            bossID = 3976,
            spells = {},
            name = "Scarlet Commander Mograine",
            flat = itemdir,
        }
    },
    items = {720,789,790,791,863,864,865,866,867,868,873,886,890,897,936,1077,1121,1204,1207,1280,1351,1521,1522,1523,1613,1624,1625,1640,1659,1664,1717,1739,1744,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1768,1769,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1789,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1980,1988,1990,1992,1993,1996,1997,1998,2011,2013,2017,2059,2072,2077,2080,2194,2219,2220,2221,2222,2227,2233,2236,2262,2276,2277,2278,2565,2566,2620,2621,2623,2624,2721,2800,2819,2877,2878,2879,2911,2912,2951,2981,2985,2989,2990,2991,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3185,3186,3187,3193,3197,3198,3199,3201,3202,3203,3204,3206,3210,3212,3341,3345,3378,3379,3380,3381,3430,3569,3647,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4083,4087,4568,4614,4643,4661,4694,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4734,4735,4736,4737,4738,4998,4999,5001,5002,5003,5007,5009,5011,5215,5216,5608,5624,5755,5819,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6428,6429,6431,6432,6433,6561,6562,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6576,6577,6578,6579,6580,6581,6582,6583,6584,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,7110,7111,7112,7330,7331,7332,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7522,7524,7525,7527,7533,7534,7544,7545,7552,7555,7556,7557,7558,7608,7609,7610,7683,7684,7685,7686,7687,7688,7689,7690,7691,7709,7710,7711,7712,7713,7714,7718,7719,7720,7721,7722,7723,7724,7726,7727,7728,7731,7736,7750,7751,7752,7754,7755,7756,7757,7758,7759,7760,7761,7786,7787,8106,8113,8119,8120,8126,8131,8132,8133,8134,8137,8139,8140,8141,8142,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8226,8247,8248,8253,8255,8257,8259,8266,8274,8282,8746,8747,8748,9285,9286,9287,9288,9289,9290,9291,9292,9382,9385,9395,9405,9435,9769,9772,9773,9774,9778,9781,9782,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9906,9907,9908,9909,9910,9912,9915,9916,9917,9918,9919,9920,9921,9923,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9940,9942,9953,9954,9955,9957,9958,9959,9966,9967,9968,9969,9970,9971,9972,9973,10058,10059,10061,10062,10063,10068,10072,10075,10080,10081,10082,10083,10088,10089,10094,10129,10130,10131,10132,10134,10185,10191,10194,10208,10209,10239,10243,10287,10288,10289,10328,10329,10330,10331,10332,10333,10404,10405,10406,10407,10408,10409,11967,11968,11969,11970,11971,11972,11973,11982,11983,11984,11985,11986,11987,11989,11993,11994,11995,11996,11997,11998,12001,12006,12007,12008,12009,12010,12011,12012,12019,12020,12022,12023,12024,12028,12029,12030,12031,12039,12040,12042,12044,12047,12052,12053,12054,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13025,13031,13033,13041,13045,13048,13049,13079,13081,13084,13087,13093,13094,13097,13099,13103,13105,13106,13108,13110,13114,13119,13121,13124,13127,13129,13131,14158,14163,14170,14171,14172,14175,14176,14177,14178,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14238,14239,14240,14241,14242,14243,14245,14246,14247,14248,14250,14251,14252,14253,14255,14257,14258,14260,14261,14262,14265,14267,14270,14274,14278,14282,14285,14286,14289,14290,14291,14294,14372,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14428,14429,14430,14431,14432,14435,14441,14450,14570,14573,14574,14578,14579,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14654,14656,14662,14666,14669,14744,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14781,14782,14792,14793,14794,14797,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14838,14839,14841,14846,14848,14851,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14909,14910,14912,14920,14923,14940,14941,14942,14943,14944,14945,14946,14948,14952,14954,14956,14957,14960,15116,15118,15120,15121,15123,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15165,15166,15168,15169,15171,15174,15175,15176,15182,15183,15211,15212,15213,15214,15215,15216,15223,15224,15225,15226,15230,15231,15232,15233,15234,15241,15242,15243,15244,15245,15249,15250,15251,15259,15260,15261,15263,15269,15279,15287,15291,15323,15332,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15374,15375,15377,15381,15382,15384,15387,15514,15516,15518,15520,15521,15522,15523,15524,15525,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15602,15603,15605,15606,15607,15608,15610,15611,15612,15613,15614,15617,15621,15622,15623,15624,15627,15637,15639,15641,15649,15652,15891,15892,15912,15918,15927,15928,15929,15934,15935,15937,15947,15962,15963,15964,15973,15974,15975,15976,15977,15978,15979,15982,15990,19507,19508,19509,34227,49121,49123,49124},
})

table.insert(Journal.djDungeons, {
    name = "Uldaman",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Uldaman.blp",
    bosses = {
        {
            bossID = 2748,
            spells = {},
            name = "Archaedas",
            flat = itemdir,
        },
        {
            bossID = 6906,
            spells = {},
            name = "Baelog",
            flat = itemdir,
        },
        {
            bossID = 6907,
            spells = {},
            name = "Eric \"The Swift\"",
            flat = itemdir,
        },
        {
            bossID = 6908,
            spells = {},
            name = "Olaf",
            flat = itemdir,
        }
    },
    items = {727,863,864,866,867,868,873,936,940,943,1169,1204,1207,1280,1447,1521,1522,1523,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1722,1754,1755,1756,1757,1758,1759,1760,1761,1780,1782,1783,1784,1785,1786,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1988,1990,1993,1994,1996,1997,1998,2080,2100,2140,2221,2222,2276,2277,2565,2620,2621,2623,2624,2721,2802,2815,2877,2912,2951,2957,2958,2961,2962,2965,2966,3020,3185,3187,3197,3208,3341,3345,3380,3381,3430,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3936,3937,3938,3939,3940,3941,3942,3943,3961,3962,3963,3964,3965,3966,3967,3968,3986,3989,4000,4001,4002,4003,4004,4005,4006,4007,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4065,4066,4067,4068,4069,4070,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4561,4562,4614,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,5009,5011,5215,5216,5608,5624,5755,6396,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6511,6609,6610,6616,7108,7111,7112,7113,7330,7331,7332,7353,7354,7357,7366,7367,7368,7369,7406,7407,7408,7409,7412,7413,7414,7417,7418,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7609,7610,7611,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8178,8194,8196,8199,8247,8248,8253,8255,8257,8259,8266,8273,8274,8276,8277,8278,8279,8280,8281,8282,8746,8747,8748,8749,8750,8751,9285,9286,9287,9288,9289,9290,9291,9292,9359,9375,9378,9382,9383,9384,9385,9387,9388,9389,9390,9391,9392,9393,9394,9395,9396,9397,9398,9400,9401,9403,9404,9405,9406,9407,9408,9409,9410,9411,9413,9414,9415,9416,9419,9420,9422,9424,9426,9427,9428,9429,9430,9431,9432,9433,9434,9435,9465,9626,9627,9819,9824,9825,9826,9830,9833,9834,9835,9836,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9945,9947,9948,9949,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,10058,10059,10060,10061,10062,10063,10066,10067,10068,10069,10071,10072,10075,10076,10079,10080,10081,10082,10083,10086,10087,10088,10089,10090,10091,10092,10094,10127,10129,10130,10131,10132,10134,10185,10191,10194,10201,10202,10205,10206,10207,10208,10209,10239,10243,10289,10406,10408,10409,11118,11310,11311,11970,11971,11972,11973,11974,11975,11985,11986,11987,11988,11989,11996,11997,11998,11999,12001,12009,12010,12011,12012,12013,12019,12020,12022,12023,12024,12028,12029,12030,12031,12032,12039,12040,12042,12043,12044,13018,13021,13025,13026,13029,13033,13034,13038,13039,13042,13043,13045,13055,13058,13064,13068,13071,13074,13076,13081,13082,13084,13087,13088,13089,13093,13095,13100,13102,13103,13105,13108,13109,13110,13112,13115,13117,13119,13121,13124,13127,13128,13129,13132,13134,13138,13145,13199,14090,14091,14094,14189,14196,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14276,14278,14279,14280,14282,14285,14286,14289,14290,14291,14292,14294,14397,14398,14401,14404,14405,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14438,14439,14440,14441,14442,14443,14446,14450,14549,14551,14581,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14665,14666,14669,14751,14753,14757,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14791,14792,14793,14794,14797,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14846,14847,14848,14851,14853,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14917,14918,14920,14921,14923,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14960,14965,15009,15010,15130,15131,15133,15134,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15171,15172,15173,15174,15175,15176,15177,15178,15182,15183,15213,15214,15215,15216,15225,15226,15227,15232,15233,15234,15235,15243,15244,15245,15250,15251,15252,15260,15261,15262,15263,15270,15279,15287,15291,15323,15339,15346,15349,15350,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15392,15477,15479,15536,15540,15541,15542,15543,15544,15546,15548,15550,15551,15552,15553,15554,15555,15556,15557,15558,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15632,15635,15636,15637,15638,15639,15641,15643,15649,15652,15892,15918,15925,15929,15934,15935,15937,15962,15963,15964,15965,15969,15976,15977,15978,15979,15980,15981,15982,15990},
})

table.insert(Journal.djDungeons, {
    name = "Zul'Farrak",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ZulFarrak.blp",
    bosses = {
        {
            bossID = 7267,
            spells = {},
            name = "Chief Ukorz Sandscalp",
            flat = itemdir,
        },
        {
            bossID = 7271,
            spells = {},
            name = "Witch Doctor Zum'rah",
            flat = itemdir,
        },
        {
            bossID = 7272,
            spells = {},
            name = "Theka the Martyr",
            flat = itemdir,
        }
    },
    items = {866,867,868,873,940,943,1169,1204,1447,1521,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1722,1754,1755,1756,1757,1758,1759,1760,1761,1780,1782,1783,1784,1785,1786,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1994,2040,2100,2221,2222,2564,2623,2624,2802,2815,3187,3208,3380,3381,3430,3936,3937,3938,3939,3940,3941,3942,3943,3961,3962,3963,3964,3965,3966,3967,3968,3986,3989,4000,4001,4002,4003,4004,4005,4006,4007,4044,4045,4046,4047,4058,4060,4061,4062,4063,4068,4069,4070,4079,4080,4082,4083,4084,4087,4088,4089,4091,4725,4733,4734,4735,4736,4737,4738,5011,5215,5216,5608,6411,6415,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6440,7112,7113,7332,7429,7430,7439,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8247,8248,8253,8255,8257,8259,8266,8273,8274,8276,8277,8278,8279,8280,8281,8282,8748,8749,8750,8751,9243,9285,9286,9287,9288,9289,9290,9291,9292,9359,9379,9433,9434,9469,9470,9473,9474,9476,9479,9480,9481,9482,9483,9484,9512,9640,9641,9874,9876,9878,9880,9881,9882,9883,9884,9885,9887,9889,9892,9893,9894,9895,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9945,9947,9948,9949,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,10058,10059,10060,10061,10062,10063,10066,10067,10068,10069,10071,10072,10075,10076,10079,10080,10081,10082,10083,10086,10087,10088,10089,10090,10091,10092,10094,10127,10129,10130,10131,10132,10134,10185,10191,10194,10201,10202,10205,10206,10207,10208,10209,10239,10243,11972,11973,11974,11975,11987,11988,11989,11998,11999,12001,12011,12012,12013,12022,12023,12024,12031,12032,12042,12043,12044,12470,12471,13009,13018,13021,13026,13029,13030,13034,13038,13039,13042,13043,13046,13055,13058,13064,13065,13066,13068,13071,13074,13076,13082,13085,13088,13089,13095,13100,13102,13109,13112,13115,13117,13125,13128,13132,13134,13138,13139,13145,13199,14216,14220,14225,14228,14230,14233,14234,14237,14238,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14276,14278,14279,14280,14282,14285,14286,14289,14290,14291,14292,14294,14417,14421,14422,14423,14424,14425,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14438,14439,14440,14441,14442,14443,14446,14450,14549,14551,14591,14592,14598,14599,14600,14601,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14665,14666,14669,14768,14769,14770,14772,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14791,14792,14793,14794,14797,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14846,14847,14848,14851,14853,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14917,14918,14920,14921,14923,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14960,14965,15152,15156,15157,15158,15159,15161,15162,15163,15164,15165,15166,15167,15168,15169,15171,15172,15173,15174,15175,15176,15177,15178,15182,15183,15214,15215,15216,15227,15234,15235,15244,15245,15251,15252,15261,15262,15263,15270,15279,15287,15291,15323,15359,15363,15366,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15392,15567,15569,15574,15578,15580,15582,15583,15584,15589,15591,15592,15593,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15632,15635,15636,15637,15638,15639,15641,15643,15649,15652,15937,15964,15965,15978,15979,15980,15981,15982,18082,18083},
})

table.insert(Journal.djDungeons, {
    name = "Maraudon",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Maraudon.blp",
    bosses = {
        {
            bossID = 13596,
            spells = {},
            name = "Rotgrip",
            flat = itemdir,
        },
        {
            bossID = 12236,
            spells = {},
            name = "Lord Vyletongue",
            flat = itemdir,
        },
        {
            bossID = 12225,
            spells = {},
            name = "Celebras the Cursed",
            flat = itemdir,
        },
        {
            bossID = 13282,
            spells = {},
            name = "Noxxion",
            flat = itemdir,
        },
        {
            bossID = 12201,
            spells = {},
            name = "Princess Theradras",
            flat = itemdir,
        }
    },
    items = {866,867,868,873,936,940,942,943,1169,1204,1207,1315,1447,1521,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1722,1979,1980,1981,1994,2100,2276,2564,2623,2624,2802,2815,3187,3208,3430,3936,3937,3938,3939,3940,3941,3942,3943,3961,3962,3963,3964,3965,3966,3967,3968,3986,3989,4000,4001,4002,4003,4004,4005,4006,4007,4041,4042,4044,4045,4046,4047,4058,4060,4061,4062,4063,4067,4068,4069,4070,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4614,4725,4729,4731,4733,4734,4735,4736,4737,4738,5011,5215,5216,5266,5608,6411,6412,6415,6420,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,7112,7113,7332,7429,7430,7431,7439,7440,7454,7455,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8246,8247,8248,8249,8250,8251,8253,8254,8255,8256,8257,8259,8260,8261,8262,8263,8264,8266,8267,8268,8269,8270,8272,8273,8274,8276,8277,8278,8279,8280,8281,8282,8286,8297,8311,8314,8315,8316,8317,8319,8749,8750,8751,9285,9286,9287,9288,9289,9290,9291,9292,9359,9433,9434,9874,9875,9876,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9891,9892,9893,9894,9895,9896,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10096,10098,10099,10103,10107,10108,10109,10110,10120,10122,10126,10127,10128,10129,10130,10131,10132,10133,10134,10165,10166,10167,10171,10172,10173,10174,10175,10176,10179,10180,10183,10184,10185,10186,10187,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10231,10238,10239,10240,10241,10242,10243,10244,10245,10278,11972,11973,11974,11975,11976,11977,11986,11987,11988,11989,11990,11998,11999,12001,12002,12011,12012,12013,12014,12022,12023,12024,12025,12030,12031,12032,12034,12042,12043,12044,12055,13008,13009,13014,13018,13021,13025,13026,13027,13029,13030,13034,13038,13039,13042,13043,13046,13052,13055,13058,13059,13064,13065,13066,13068,13071,13073,13074,13076,13081,13082,13085,13088,13089,13093,13095,13100,13102,13103,13109,13112,13115,13117,13119,13121,13125,13126,13128,13129,13132,13134,13138,13139,13144,13145,13199,14216,14220,14224,14225,14228,14230,14232,14233,14234,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14285,14286,14289,14290,14291,14292,14293,14294,14295,14296,14299,14300,14301,14304,14311,14313,14321,14407,14413,14417,14418,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14450,14451,14452,14454,14549,14551,14591,14592,14598,14599,14600,14601,14602,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14672,14673,14674,14760,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14801,14802,14803,14807,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14855,14856,14857,14861,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14926,14927,14928,14929,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14959,14960,14961,14962,14963,14965,14968,14974,15146,15152,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15180,15181,15182,15183,15184,15186,15187,15190,15214,15215,15216,15217,15227,15228,15229,15233,15234,15235,15236,15237,15244,15245,15251,15252,15253,15254,15261,15262,15263,15270,15274,15275,15279,15280,15287,15291,15294,15295,15323,15359,15362,15363,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15392,15393,15394,15395,15425,15427,15567,15569,15572,15574,15576,15578,15580,15582,15583,15584,15589,15591,15592,15593,15595,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15641,15642,15643,15644,15645,15646,15647,15649,15652,15653,15654,15656,15659,15661,15694,15936,15937,15963,15964,15965,15966,15978,15979,15980,15981,15982,15983,15990,17007,17707,17710,17711,17713,17714,17715,17717,17718,17719,17728,17732,17734,17736,17737,17739,17740,17741,17742,17744,17745,17746,17748,17749,17750,17751,17754,17755,17767},
})

table.insert(Journal.djDungeons, {
    name = "Sunken Temple",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SunkenTemple.blp",
    bosses = {
        {
            bossID = 5709,
            spells = {},
            name = "Shade of Eranikus",
            flat = itemdir,
        },
        {
            bossID = 8443,
            spells = {},
            name = "Avatar of Hakkar",
            flat = itemdir,
        },
        {
            bossID = 5708,
            spells = {},
            name = "Spawn of Hakkar",
            flat = itemdir,
        }
    },
    items = {812,866,867,868,940,942,943,1169,1315,1447,1521,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1718,1720,1722,1979,1980,1981,1994,2100,2564,2623,2624,2802,2815,3075,3187,3208,3430,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4044,4045,4046,4047,4058,4060,4061,4062,4063,4068,4069,4070,4079,4080,4082,4083,4084,4087,4088,4089,4091,4725,4733,4734,4735,4736,4737,4738,5011,5215,5216,5266,5608,6411,6415,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,7112,7113,7332,7429,7430,7439,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8246,8247,8248,8249,8250,8251,8253,8254,8255,8256,8257,8259,8260,8261,8262,8263,8264,8266,8267,8268,8269,8270,8272,8273,8274,8276,8277,8278,8279,8280,8281,8282,8286,8288,8292,8297,8299,8301,8302,8305,8306,8311,8314,8315,8316,8317,8319,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9433,9874,9876,9878,9880,9881,9882,9883,9884,9885,9887,9889,9892,9893,9894,9895,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10096,10098,10099,10101,10102,10103,10104,10107,10108,10109,10110,10112,10118,10120,10122,10126,10127,10128,10129,10130,10131,10132,10133,10134,10138,10145,10148,10159,10164,10165,10166,10167,10171,10172,10173,10174,10175,10176,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10211,10213,10214,10216,10221,10222,10223,10225,10231,10232,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10278,10279,10280,10281,10362,10364,10365,10369,10371,10372,10374,10377,10381,10624,10629,10630,10631,10632,10633,10634,10783,10784,10785,10786,10787,10788,10795,10796,10798,10799,10800,10801,10802,10803,10804,10805,10806,10807,10808,10828,10829,10833,10835,10836,10837,10838,10842,10843,10844,10845,10846,11972,11973,11974,11975,11976,11977,11978,11987,11988,11989,11990,11991,11998,11999,12001,12002,12004,12011,12012,12013,12014,12022,12023,12024,12025,12026,12031,12032,12034,12042,12043,12044,12055,12243,12462,12463,12464,12465,12466,13008,13009,13014,13018,13021,13026,13027,13029,13030,13039,13043,13046,13052,13055,13058,13059,13064,13065,13066,13071,13073,13074,13076,13082,13085,13089,13095,13100,13102,13109,13112,13115,13117,13125,13126,13128,13132,13134,13138,13139,13144,13145,14216,14220,14225,14228,14230,14233,14234,14237,14238,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14285,14286,14289,14290,14291,14292,14293,14294,14295,14296,14299,14300,14301,14304,14307,14310,14311,14313,14314,14315,14316,14319,14321,14327,14331,14417,14421,14422,14423,14424,14425,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14450,14451,14452,14453,14454,14455,14457,14549,14551,14552,14591,14592,14598,14599,14600,14601,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14672,14673,14674,14676,14677,14682,14683,14768,14769,14770,14772,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14807,14808,14810,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14861,14864,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14926,14927,14928,14929,14932,14933,14937,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14959,14960,14961,14962,14963,14965,14968,14969,14970,14974,14983,15152,15156,15157,15158,15159,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15180,15181,15182,15183,15184,15186,15187,15190,15214,15215,15216,15217,15219,15227,15228,15229,15234,15235,15236,15237,15238,15244,15245,15251,15252,15253,15254,15256,15261,15262,15263,15265,15270,15272,15274,15275,15276,15279,15280,15287,15291,15294,15295,15323,15359,15363,15366,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15392,15393,15394,15395,15425,15426,15427,15429,15431,15432,15567,15569,15574,15578,15580,15582,15583,15584,15589,15591,15592,15593,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15641,15642,15643,15644,15645,15646,15647,15649,15652,15653,15654,15656,15658,15659,15661,15666,15668,15673,15681,15693,15694,15890,15936,15937,15938,15939,15964,15965,15966,15967,15978,15979,15980,15981,15982,15983,17007,18339,18672,18674},
})

table.insert(Journal.djDungeons, {
    name = "Dire Maul",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-DireMaul.blp",
    bosses = {
        {
            bossID = 11489,
            spells = {},
            name = "Tendris Warpwood",
            flat = itemdir,
        },
        {
            bossID = 11490,
            spells = {},
            name = "Alzzin the Wildshaper",
            flat = itemdir,
        },
        {
            bossID = 14326,
            spells = {},
            name = "Guard Mol'dar",
            flat = itemdir,
        },
        {
            bossID = 14321,
            spells = {},
            name = "Guard Fengus",
            flat = itemdir,
        },
        {
            bossID = 14322,
            spells = {},
            name = "Guard Slip'kik",
            flat = itemdir,
        },
        {
            bossID = 11496,
            spells = {},
            name = "Immol'thar",
            flat = itemdir,
        },
        {
            bossID = 11501,
            spells = {},
            name = "King Gordok",
            flat = itemdir,
        }
    },
    items = {812,866,867,868,940,942,943,1169,1315,1447,1521,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1718,1720,1722,1979,1980,1981,1994,2100,2564,2623,2624,2802,2815,3075,3187,3208,3430,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4044,4045,4046,4047,4058,4060,4061,4062,4063,4068,4069,4070,4079,4080,4082,4083,4084,4087,4088,4089,4091,4725,4733,4734,4735,4736,4737,4738,5011,5215,5216,5266,5608,6411,6415,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,7112,7113,7332,7429,7430,7439,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8246,8247,8248,8249,8250,8251,8253,8254,8255,8256,8257,8259,8260,8261,8262,8263,8264,8266,8267,8268,8269,8270,8272,8273,8274,8276,8277,8278,8279,8280,8281,8282,8286,8288,8292,8297,8299,8301,8302,8305,8306,8311,8314,8315,8316,8317,8319,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9433,9874,9876,9878,9880,9881,9882,9883,9884,9885,9887,9889,9892,9893,9894,9895,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10096,10098,10099,10101,10102,10103,10104,10107,10108,10109,10110,10112,10118,10120,10122,10126,10127,10128,10129,10130,10131,10132,10133,10134,10138,10145,10148,10159,10164,10165,10166,10167,10171,10172,10173,10174,10175,10176,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10211,10213,10214,10216,10221,10222,10223,10225,10231,10232,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10278,10279,10280,10281,10362,10364,10365,10369,10371,10372,10374,10377,10381,10624,10629,10630,10631,10632,10633,10634,10783,10784,10785,10786,10787,10788,10795,10796,10798,10799,10800,10801,10802,10803,10804,10805,10806,10807,10808,10828,10829,10833,10835,10836,10837,10838,10842,10843,10844,10845,10846,11972,11973,11974,11975,11976,11977,11978,11987,11988,11989,11990,11991,11998,11999,12001,12002,12004,12011,12012,12013,12014,12022,12023,12024,12025,12026,12031,12032,12034,12042,12043,12044,12055,12243,12462,12463,12464,12465,12466,13008,13009,13014,13018,13021,13026,13027,13029,13030,13039,13043,13046,13052,13055,13058,13059,13064,13065,13066,13071,13073,13074,13076,13082,13085,13089,13095,13100,13102,13109,13112,13115,13117,13125,13126,13128,13132,13134,13138,13139,13144,13145,14216,14220,14225,14228,14230,14233,14234,14237,14238,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14285,14286,14289,14290,14291,14292,14293,14294,14295,14296,14299,14300,14301,14304,14307,14310,14311,14313,14314,14315,14316,14319,14321,14327,14331,14417,14421,14422,14423,14424,14425,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14450,14451,14452,14453,14454,14455,14457,14549,14551,14552,14591,14592,14598,14599,14600,14601,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14672,14673,14674,14676,14677,14682,14683,14768,14769,14770,14772,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14807,14808,14810,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14861,14864,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14926,14927,14928,14929,14932,14933,14937,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14959,14960,14961,14962,14963,14965,14968,14969,14970,14974,14983,15152,15156,15157,15158,15159,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15180,15181,15182,15183,15184,15186,15187,15190,15214,15215,15216,15217,15219,15227,15228,15229,15234,15235,15236,15237,15238,15244,15245,15251,15252,15253,15254,15256,15261,15262,15263,15265,15270,15272,15274,15275,15276,15279,15280,15287,15291,15294,15295,15323,15359,15363,15366,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15392,15393,15394,15395,15425,15426,15427,15429,15431,15432,15567,15569,15574,15578,15580,15582,15583,15584,15589,15591,15592,15593,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15641,15642,15643,15644,15645,15646,15647,15649,15652,15653,15654,15656,15658,15659,15661,15666,15668,15673,15681,15693,15694,15890,15936,15937,15938,15939,15964,15965,15966,15967,15978,15979,15980,15981,15982,15983,17007,18339,18672,18674},
})

table.insert(Journal.djDungeons, {
    name = "Stratholme",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Stratholme.blp",
    bosses = {
        {
            bossID = 10440,
            spells = {},
            name = "Baron Rivendare",
            flat = itemdir,
        },
        {
            bossID = 10516,
            spells = {},
            name = "The Unforgiven",
            flat = itemdir,
        },
        {
            bossID = 11082,
            spells = {},
            name = "Stratholme Courier",
            flat = itemdir,
        },
        {
            bossID = 10811,
            spells = {},
            name = "Archivist Galford",
            flat = itemdir,
        },
        {
            bossID = 10813,
            spells = {},
            name = "Balnazzar",
            flat = itemdir,
        }
    },
    items = {812,833,866,942,944,1168,1203,1443,1607,1608,1624,1639,1640,1721,1994,2243,2244,2245,2246,2624,2801,3075,3207,3208,3475,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4045,4047,4061,4062,4063,4069,4080,4082,4084,4088,4089,4696,4733,4734,4736,4738,5216,5266,5267,6424,6426,6427,6428,6430,6431,6433,7113,7470,7471,7473,7478,7479,7481,7482,7487,7488,7490,7491,7496,7517,7518,7519,7520,7521,7523,7525,7526,7527,7528,7529,7530,7531,7532,7535,7536,7537,7538,7539,7540,7541,7542,7543,7546,7553,7557,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8138,8143,8194,8196,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9874,9882,9883,9884,9887,9893,9897,9899,9903,9905,9908,9909,9911,9913,9914,9919,9922,9923,9924,9926,9927,9928,9930,9931,9933,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9960,9961,9962,9963,9964,9965,9966,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10090,10091,10092,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11973,11974,11975,11976,11977,11978,11979,11980,11987,11988,11989,11990,11991,11992,11998,11999,12001,12002,12004,12005,12012,12013,12014,12015,12016,12017,12024,12025,12026,12027,12032,12034,12035,12036,12042,12043,12044,12045,12046,12048,12055,12056,12057,12058,12103,13000,13001,13002,13003,13004,13006,13007,13008,13013,13014,13015,13022,13023,13027,13028,13036,13040,13047,13052,13056,13059,13067,13070,13072,13073,13075,13077,13083,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13126,13130,13133,13135,13144,13340,13344,13345,13346,13349,13353,13358,13359,13360,13368,13369,13372,13373,13374,13375,13376,13378,13380,13381,13383,13384,13385,13386,13387,13388,13389,13390,13391,13392,13394,13395,13396,13397,13400,13402,13403,13404,13405,13409,13505,13524,13525,13526,13527,13528,13529,13530,13531,13532,13533,13534,13535,13537,13538,13539,13954,14230,14234,14237,14242,14243,14244,14249,14250,14253,14254,14259,14261,14263,14264,14265,14266,14267,14268,14269,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14421,14424,14427,14429,14430,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14552,14553,14554,14555,14558,14599,14605,14653,14655,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14769,14774,14775,14776,14779,14780,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14825,14835,14840,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14907,14908,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14947,14948,14949,14950,14951,14952,14953,14954,14955,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15156,15159,15161,15163,15164,15165,15167,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15216,15217,15218,15219,15220,15221,15227,15228,15229,15235,15236,15237,15238,15239,15240,15244,15245,15246,15247,15251,15252,15253,15254,15255,15256,15257,15258,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15363,15369,15372,15373,15375,15376,15377,15378,15379,15380,15381,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15591,15592,15593,15597,15600,15601,15604,15605,15609,15610,15611,15613,15615,15616,15618,15619,15620,15621,15622,15623,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15965,15966,15967,15968,15979,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15991,16668,16671,16675,16678,16681,16682,16685,16687,16691,16692,16694,16697,16699,16702,16704,16708,16709,16710,16714,16716,16717,16719,16722,16723,16724,16725,16728,16732,16736,16737,17044,17045,17061,18339,18343,18672,18674,18679,18716,18717,18718,18720,18721,18722,18723,18725,18726,18727,18728,18729,18730,18734,18735,18736,18737,18738,18739,18740,18741,18742,18743,18744,18745,21995,22000,22001,22003,22007,22008,22016,22017,22061,22064,22067,22068,22072,22073,22076,22082,22084,22085,22087,22092,22093,22096,22100,22101,22107,22111,22112,22301,22327,22328,22329,22334,22403,22404,22405,22406,22407,22408,22409,22410,22411,22412,24222},
})

table.insert(Journal.djDungeons, {
    name = "Scholomance",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Scholomance.blp",
    bosses = {
        {
            bossID = 1853,
            spells = {},
            name = "Darkmaster Gandling",
            flat = itemdir,
        },
        {
            bossID = 10506,
            spells = {},
            name = "Kirtonos the Herald",
            flat = itemdir,
        },
        {
            bossID = 11261,
            spells = {},
            name = "Doctor Theolen Krastinov",
            flat = itemdir,
        },
        {
            bossID = 10503,
            spells = {},
            name = "Jandice Barov",
            flat = itemdir,
        },
        {
            bossID = 16118,
            spells = {},
            name = "Kormok",
            flat = itemdir,
        }
    },
    items = {812,833,944,1168,1203,1443,1607,1721,1738,1739,1740,1741,1742,1743,1744,1745,1764,1766,1767,1768,1769,1770,1787,1788,1789,1790,1791,1792,1793,1794,2216,2217,2243,2244,2245,2246,3075,3376,3377,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5267,8080,8081,8082,8083,8084,8085,8086,8245,8246,8249,8250,8251,8252,8254,8256,8258,8260,8261,8262,8263,8264,8265,8267,8268,8269,8270,8271,8272,8275,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9943,9944,9946,9950,9974,10057,10064,10065,10070,10073,10074,10077,10078,10084,10085,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10133,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10186,10187,10188,10189,10190,10192,10193,10195,10196,10197,10198,10199,10200,10203,10204,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10240,10241,10242,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11976,11977,11978,11979,11980,11990,11991,11992,12002,12004,12005,12014,12015,12016,12017,12025,12026,12027,12034,12035,12036,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13013,13015,13022,13023,13028,13036,13040,13047,13056,13067,13070,13072,13075,13077,13083,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13130,13133,13135,13314,13398,13937,13938,13944,13951,13955,13956,13957,13960,13964,13967,13969,14275,14277,14281,14283,14284,14287,14288,14293,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14340,14437,14444,14445,14447,14448,14449,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14502,14503,14522,14525,14528,14536,14537,14538,14539,14545,14548,14552,14553,14554,14555,14558,14577,14611,14612,14614,14615,14616,14620,14621,14622,14623,14624,14626,14629,14631,14632,14633,14636,14637,14638,14640,14641,14664,14667,14668,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14789,14790,14795,14796,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14844,14849,14850,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14915,14916,14919,14922,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14959,14961,14962,14963,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15170,15179,15180,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15221,15228,15229,15236,15237,15238,15239,15240,15246,15247,15253,15254,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15280,15281,15282,15283,15288,15289,15294,15295,15296,15324,15325,15388,15389,15390,15391,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15631,15633,15634,15640,15642,15644,15645,15646,15647,15648,15650,15651,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15938,15939,15940,15941,15942,15943,15966,15967,15968,15983,15984,15985,15986,15987,15988,15989,15991,16667,16671,16677,16684,16685,16686,16689,16693,16698,16701,16702,16705,16707,16710,16711,16714,16716,16720,16722,16727,16731,16734,18339,18343,18672,18674,18679,18680,18681,18682,18683,18684,18686,18689,18690,18691,18692,18693,18694,18695,18696,18697,18698,18699,18700,18701,18702,18759,18760,18761,22303,22326,22331,22332,22333,22394,22433,24222},
})

table.insert(Journal.djDungeons, {
    name = "Ahn'Qiraj Temple",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TempleofAhnQiraj.blp",
    bosses = {
        {
            bossID = 16601,
            spells = {},
            name = "The Prophet Skeram",
            flat = itemdir,
            },
            {
                bossID = 16602,
                spells = {},
                name = "Battleguard Sartura",
                flat = itemdir,
            },
            {
                bossID = 16603,
                spells = {},
                name = "Fankriss the Unyielding",
                flat = itemdir,
            },
            {
                bossID = 16604,
                spells = {},
            }
    },
    items = {944,1168,1443,2243,2245,2246,2801,3475,4696,5267,8245,8251,8252,8258,8261,8262,8265,8267,8268,8269,8270,8271,8272,8275,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8312,8313,8317,8318,8319,8320,9402,10057,10065,10070,10093,10095,10096,10097,10099,10100,10101,10102,10103,10104,10105,10106,10107,10109,10110,10111,10112,10113,10118,10119,10121,10122,10123,10124,10125,10126,10128,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10175,10176,10177,10178,10179,10181,10182,10183,10187,10188,10189,10193,10195,10199,10204,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10240,10244,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11977,11978,11979,11980,11990,11991,11992,12002,12004,12005,12015,12016,12017,12025,12026,12027,12035,12036,12045,12046,12048,12056,12057,12058,13000,13001,13002,13004,13006,13007,13015,13023,13028,13047,13070,13072,13075,13083,13096,13101,13107,13113,13116,13123,13133,13135,14283,14284,14287,14288,14293,14295,14297,14298,14299,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14437,14445,14449,14452,14453,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14553,14554,14555,14664,14670,14671,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14789,14790,14798,14799,14800,14802,14803,14804,14805,14806,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14844,14852,14854,14855,14856,14857,14858,14859,14860,14862,14863,14864,14865,14866,14867,14868,14869,14924,14925,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14961,14962,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15179,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15221,15229,15237,15238,15239,15240,15246,15247,15254,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15275,15276,15278,15281,15282,15283,15288,15289,15295,15296,15324,15325,15390,15391,15394,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15640,15645,15646,15648,15650,15651,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15938,15939,15940,15941,15942,15943,15966,15967,15968,15984,15985,15986,15987,15988,15989,15991,18339,18343,18672,18674,18679,21126,21128,21134,21242,21244,21268,21269,21272,21273,21275,21329,21330,21331,21332,21333,21334,21335,21336,21337,21338,21343,21344,21345,21346,21347,21348,21349,21350,21351,21352,21353,21354,21355,21356,21357,21359,21360,21361,21362,21364,21365,21366,21367,21368,21370,21372,21373,21374,21375,21376,21387,21388,21389,21390,21391,21581,21582,21583,21585,21586,21596,21597,21598,21599,21600,21601,21602,21603,21604,21605,21606,21607,21608,21609,21610,21611,21615,21616,21617,21618,21619,21620,21621,21622,21623,21624,21626,21627,21635,21639,21645,21648,21650,21651,21652,21663,21664,21665,21666,21667,21668,21669,21671,21672,21673,21674,21675,21676,21677,21678,21679,21680,21681,21682,21683,21684,21686,21687,21688,21689,21690,21691,21692,21693,21694,21695,21696,21697,21698,21699,21700,21701,21702,21703,21704,21705,21706,21707,21708,21709,21710,21712,21814,21836,21837,21838,21839,21856,21888,21889,22730,22731,22732,23557},
})


-- =============================================================================
-- THE BURNING CRUSADE DUNGEONS
-- =============================================================================

table.insert(Journal.djDungeons, {
    name = "Hellfire Ramparts",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HellfireCitadel.blp",
    bosses = {
        {
            bossID = 17306,
            spells = {},
            name = "Watchkeeper Gargolmar",
            flat = itemdir,
        },
        {
            bossID = 17308,
            spells = {},
            name = "Omor the Unscarred",
            flat = itemdir,
        },
        {
            bossID = 17537,
            spells = {},
            name = "Vazruden",
            flat = itemdir,
        }
    },
    items = {24020,24021,24022,24023,24024,24044,24045,24046,24063,24064,24069,24073,24083,24090,24091,24094,24096,24150,24151,24154,24155,24575,24576,24577,24578,24580,24582,24583,24584,24585,24586,24587,24588,24589,24590,24591,24592,24593,24594,24595,24596,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24693,24694,24695,24696,24697,24698,24699,24700,24701,24702,24703,24704,24705,24706,24707,24708,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24806,24807,24808,24809,24810,24811,24812,24813,24814,24815,24816,24817,24818,24819,24820,24821,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24918,24919,24920,24921,24922,24923,24924,24925,24926,24927,24928,24929,24930,24931,24932,24933,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25030,25031,25032,25033,25034,25041,25042,25044,25045,25046,25047,25048,25055,25056,25058,25059,25060,25061,25062,25069,25070,25072,25073,25074,25075,25076,25083,25084,25086,25087,25088,25089,25090,25097,25098,25100,25101,25102,25103,25104,25111,25112,25114,25115,25116,25117,25118,25125,25126,25128,25129,25130,25131,25132,25139,25140,25142,25143,25144,25146,25153,25154,25156,25157,25158,25160,25167,25168,25170,25171,25172,25174,25181,25182,25184,25185,25186,25187,25188,25195,25196,25198,25199,25200,25201,25202,25209,25210,25212,25213,25214,25215,25216,25223,25224,25226,25227,25228,25229,25230,25237,25238,25240,25241,25242,25243,25244,25251,25252,25254,25255,25256,25257,25258,25265,25266,25268,25269,25270,25271,25272,25279,25280,25282,25283,25284,25286,25293,25294,25296,25297,25298,25299,25300,25307,25308,25310,25311,25312,25313,25314,25321,25322,25324,25325,25326,25327,25328,25335,25336,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,27447,27448,27449,27450,27451,27452,27453,27454,27455,27456,27457,27458,27459,27460,27461,27462,27463,27464,27465,27466,27467,27476,27477,27478,27539,27895,27906,28531,28532,28533,28534,28535,28542,28543,29238,29264,29346,32077,60275,60276,60277,60278,60279,60280,60281,60282,60283,60284,60285,60286,60287,60288,60289,60290,60291,60292,60293,60294,60295,60296,60297,60298,60299,60300,60301,60302,60303,60304,60305,61173,61174,61175,61176,61177,61178,61179,61180,61181,61182,61183,61184,61185,61186,61187,61188,61189,61190,61191,61192,61193,61194,61195,61196,61197,61198,61199,61200,61201,61202,61203,61204,61205,61206,61207,61208,61209,61210,61211,61212,61213,61214,61215,61216,61217,61218,61219,61220,61221,61222,61223,61224,61225,61226,61227,61228,61229,61230,61231,61232,61233,61234,61235,61236,61237,61238,61239,61240,61241,61242,61243,61244,61245,61246,61247,61248,61249,61250,61251,61252,61253,61254,61255,61256,61257,61258,61259,61260,61261,61262,61263,61264,61265,61266,61267,61268,61269,61270,61271,61272,61273,61274,61275,61276,61277,61278,61279,61280,61281,61282,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62113,62114,62115,62116,62117,62118,62119,62120,62121,62122,62123,62124,62125,62126,62127,62128,62129,62130,62131,62132,62133},
})

table.insert(Journal.djDungeons, {
    name = "The Blood Furnace",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HellfireRaid.blp",
    bosses = {
        {
            bossID = 17377,
            spells = {},
            name = "Keli'dan the Breaker",
            flat = itemdir,
        },
        {
            bossID = 17381,
            spells = {},
            name = "The Maker",
            flat = itemdir,
        },
        {
            bossID = 17380,
            spells = {},
            name = "Broggok",
            flat = itemdir,
        }
    },
    items = {24384,24385,24387,24388,24389,24390,24391,24392,24393,24394,24395,24396,24397,24398,24575,24576,24577,24578,24580,24582,24583,24584,24585,24586,24587,24588,24589,24590,24591,24592,24593,24594,24595,24596,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24693,24694,24695,24696,24697,24698,24699,24700,24701,24702,24703,24704,24705,24706,24707,24708,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24806,24807,24808,24809,24810,24811,24812,24813,24814,24815,24816,24817,24818,24819,24820,24821,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24918,24919,24920,24921,24922,24923,24924,24925,24926,24927,24928,24929,24930,24931,24932,24933,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25030,25031,25032,25033,25034,25039,25040,25041,25042,25043,25044,25045,25046,25047,25048,25053,25054,25055,25056,25057,25058,25059,25060,25061,25062,25067,25068,25069,25070,25071,25072,25073,25074,25075,25076,25081,25082,25083,25084,25085,25086,25087,25088,25089,25090,25095,25096,25097,25098,25099,25100,25101,25102,25103,25104,25109,25110,25111,25112,25113,25114,25115,25116,25117,25118,25123,25124,25125,25126,25127,25128,25129,25130,25131,25132,25137,25138,25139,25140,25141,25142,25143,25144,25146,25151,25152,25153,25154,25155,25156,25157,25158,25160,25165,25166,25167,25168,25169,25170,25171,25172,25174,25179,25180,25181,25182,25183,25184,25185,25186,25187,25188,25193,25194,25195,25196,25197,25198,25199,25200,25201,25202,25207,25208,25209,25210,25211,25212,25213,25214,25215,25216,25221,25222,25223,25224,25225,25226,25227,25228,25229,25230,25235,25236,25237,25238,25239,25240,25241,25242,25243,25244,25249,25250,25251,25252,25253,25254,25255,25256,25257,25258,25263,25264,25265,25266,25267,25268,25269,25270,25271,25272,25277,25278,25279,25280,25281,25282,25283,25284,25286,25291,25292,25293,25294,25295,25296,25297,25298,25299,25300,25305,25306,25307,25308,25309,25310,25311,25312,25313,25314,25319,25320,25321,25322,25323,25324,25325,25326,25327,25328,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,27483,27485,27487,27488,27489,27490,27491,27492,27494,27495,27497,27505,27506,27507,27512,27514,27522,27788,27848,28121,28264,28531,28532,28533,28534,28535,28540,28541,28542,28543,28544,29239,29245,29347,31125,31126,31127,31131,31133,31134,31136,31137,31138,31139,31140,31142,31143,31145,31147,31148,31149,31150,31151,31152,31153,31173,31175,31178,32080,61118,61119,61120,61121,61122,61123,61124,61125,61126,61127,61128,61129,61130,61131,61132,61133,61134,61135,61136,61137,61138,61139,61140,61141,61142,61143,61144,61145,61146,61147,61148,61149,61150,61151,61152,61153,61154,61155,61156,61157,61158,61159,61160,61161,61162,61163,61164,61165,61166,61167,61168,61169,61170,61171,61172,61173,61174,61177,61178,61187,61188,61189,61190,61192,61194,61196,61198,61200,61202,61204,61206,61208,61212,61216,61217,61218,61219,61220,61224,61230,61231,61232,61233,61234,61235,61236,61237,61245,61247,61248,61249,61251,61253,61254,61255,61256,61257,61258,61259,61260,61261,61269,61271,61272,61273,61274,61275,61276,61281,61282,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61339,61340,61341,61342,61343,61344,61345,61346,61347,61348,61349,61350,61351,61352,61353,61354,61355,61356,61357,61358,61359,61360,61361,61362,61363,61364,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62134,62135,62136,62137,62138,62139,62140,62141,62142,62143,62144,62145,62146,62147,62148},
})

table.insert(Journal.djDungeons, {
    name = "The Slave Pens",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir.blp",
    bosses = {
        {
            bossID = 17941,
            spells = {},
            name = "Mennu the Betrayer",
            flat = itemdir,
        },
        {
            bossID = 17991,
            spells = {},
            name = "Rokmar the Crackler",
            flat = itemdir,
        },
        {
            bossID = 17942,
            spells = {},
            name = "Quagmirran",
            flat = itemdir,
        }
    },
    items = {24356,24357,24359,24360,24361,24362,24363,24364,24365,24366,24376,24378,24379,24380,24381,24576,24577,24578,24580,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25032,25033,25034,25035,25036,25039,25040,25041,25042,25043,25046,25047,25048,25049,25050,25053,25054,25055,25056,25057,25060,25061,25062,25063,25064,25067,25068,25069,25070,25071,25074,25075,25076,25077,25078,25081,25082,25083,25084,25085,25088,25089,25090,25091,25092,25095,25096,25097,25098,25099,25102,25103,25104,25105,25106,25109,25110,25111,25112,25113,25116,25117,25118,25119,25120,25123,25124,25125,25126,25127,25130,25131,25132,25133,25134,25137,25138,25139,25140,25141,25144,25146,25147,25148,25151,25152,25153,25154,25155,25158,25160,25161,25162,25165,25166,25167,25168,25169,25172,25174,25175,25176,25179,25180,25181,25182,25183,25186,25187,25188,25189,25190,25193,25194,25195,25196,25197,25200,25201,25202,25203,25204,25207,25208,25209,25210,25211,25214,25215,25216,25218,25221,25222,25223,25224,25225,25228,25229,25230,25231,25232,25235,25236,25237,25238,25239,25242,25243,25244,25245,25246,25249,25250,25251,25252,25253,25256,25257,25258,25259,25260,25263,25264,25265,25266,25267,25270,25271,25272,25273,25274,25277,25278,25279,25280,25281,25284,25286,25287,25288,25291,25292,25293,25294,25295,25298,25299,25300,25301,25302,25305,25306,25307,25308,25309,25312,25313,25314,25315,25316,25319,25320,25321,25322,25323,25326,25327,25328,25329,25330,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,27541,27542,27543,27545,27546,27547,27548,27549,27550,27551,27672,27673,27683,27712,27713,27714,27740,27741,27742,27796,27800,28124,28337,28533,28534,28535,28536,28537,28540,28541,28542,28543,28544,29242,29349,30538,31190,31284,31285,31286,31287,31288,31289,31291,31292,31293,31294,31295,31297,31299,32078,61012,61013,61014,61015,61016,61017,61018,61019,61020,61021,61022,61023,61024,61025,61026,61027,61028,61029,61030,61031,61032,61033,61034,61035,61036,61037,61038,61039,61040,61041,61042,61043,61044,61045,61046,61047,61048,61049,61050,61051,61052,61053,61054,61055,61056,61057,61058,61059,61060,61061,61062,61063,61064,61065,61066,61067,61068,61069,61070,61071,61072,61073,61074,61075,61076,61077,61078,61079,61080,61081,61082,61083,61084,61085,61086,61087,61088,61089,61090,61091,61092,61093,61094,61095,61096,61097,61098,61099,61100,61101,61102,61103,61104,61105,61106,61107,61108,61109,61110,61111,61112,61113,61114,61115,61116,61117,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61365,61366,61367,61368,61369,61370,61371,61372,61373,61374,61375,61376,61377,61378,61379,61380,61381,61382,61383,61384,61385,61386,61387,61388,61389,61390,61391,61392,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62149,62150,62151,62152,62153,62154,62155,62156,62157,62158,62159,62160,62161,62162,62163},
})

table.insert(Journal.djDungeons, {
    name = "The Underbog",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir.blp",
    bosses = {
        {
            bossID = 17770,
            spells = {},
            name = "Hungarfen",
            flat = itemdir,
        },
        {
            bossID = 17826,
            spells = {},
            name = "Ghaz'an",
            flat = itemdir,
        },
        {
            bossID = 17827,
            spells = {},
            name = "Swamplord Musel'ek",
            flat = itemdir,
        },
        {
            bossID = 17771,
            spells = {},
            name = "The Black Stalker",
            flat = itemdir,
        }
    },
    items = {24450,24451,24452,24453,24454,24455,24456,24457,24458,24459,24460,24461,24462,24463,24464,24465,24466,24481,24576,24577,24578,24580,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25032,25033,25034,25035,25036,25039,25040,25041,25042,25043,25046,25047,25048,25049,25050,25053,25054,25055,25056,25057,25060,25061,25062,25063,25064,25067,25068,25069,25070,25071,25074,25075,25076,25077,25078,25081,25082,25083,25084,25085,25088,25089,25090,25091,25092,25095,25096,25097,25098,25099,25102,25103,25104,25105,25106,25109,25110,25111,25112,25113,25116,25117,25118,25119,25120,25123,25124,25125,25126,25127,25130,25131,25132,25133,25134,25137,25138,25139,25140,25141,25144,25146,25147,25148,25151,25152,25153,25154,25155,25158,25160,25161,25162,25165,25166,25167,25168,25169,25172,25174,25175,25176,25179,25180,25181,25182,25183,25186,25187,25188,25189,25190,25193,25194,25195,25196,25197,25200,25201,25202,25203,25204,25207,25208,25209,25210,25211,25214,25215,25216,25218,25221,25222,25223,25224,25225,25228,25229,25230,25231,25232,25235,25236,25237,25238,25239,25242,25243,25244,25245,25246,25249,25250,25251,25252,25253,25256,25257,25258,25259,25260,25263,25264,25265,25266,25267,25270,25271,25272,25273,25274,25277,25278,25279,25280,25281,25284,25286,25287,25288,25291,25292,25293,25294,25295,25298,25299,25300,25301,25302,25305,25306,25307,25308,25309,25312,25313,25314,25315,25316,25319,25320,25321,25322,25323,25326,25327,25328,25329,25330,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,27631,27743,27745,27746,27747,27748,27755,27757,27758,27759,27760,27761,27762,27763,27764,27765,27766,27767,27768,27769,27770,27771,27772,27773,27779,27780,27781,27896,27907,27938,28533,28534,28535,28536,28537,28540,28541,28542,28543,28544,29265,29350,30541,31143,31145,31147,31149,31150,31151,31152,31153,31173,31175,31178,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,32081,60171,60172,60173,60174,60175,60176,60177,60178,60179,60180,60181,60182,60183,60184,60185,60186,60187,60188,60189,60190,60191,60192,60193,60194,60195,60196,60197,60198,60199,60200,60201,60202,60203,60204,60903,60904,60908,60910,60912,60914,60916,60918,60920,60922,60924,60926,60928,60930,60932,60934,60936,60938,60940,60943,60944,60946,60948,60950,60953,60958,60967,60968,60969,60970,60971,60972,60973,60974,60980,60981,60982,60983,60987,60988,60989,60990,60991,60992,60993,60994,60995,61003,61004,61005,61007,61009,61010,61011,61012,61013,61014,61015,61016,61017,61019,61021,61027,61028,61029,61030,61031,61034,61036,61045,61046,61047,61048,61049,61050,61051,61058,61061,61062,61063,61065,61067,61069,61071,61073,61075,61077,61078,61080,61082,61085,61086,61088,61097,61098,61099,61100,61101,61102,61103,61104,61105,61107,61108,61109,61111,61113,61115,61117,61283,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62164,62165,62166,62167,62168,62169,62170,62171,62172,62173,62174,62175,62176,62177,62178,62179,62180,62181,62182,62183},
})

table.insert(Journal.djDungeons, {
    name = "Mana-Tombs",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TempestKeep.blp",
    bosses = {
        {
            bossID = 18341,
            spells = {},
            name = "Pandemonius",
            flat = itemdir,
        },
        {
            bossID = 18343,
            spells = {},
            name = "Tavarok",
            flat = itemdir,
        },
        {
            bossID = 22930,
            spells = {},
            name = "Yor",
            flat = itemdir,
        },
        {
            bossID = 18344,
            spells = {},
            name = "Nexus-Prince Shaffar",
            flat = itemdir,
        }
    },
    items = {8303,8313,10139,10141,10142,10150,10152,10153,10160,10162,10163,10215,10218,10220,10227,10247,10248,10250,10251,10253,10255,10257,10259,10260,10261,10263,10265,10268,10269,10270,10272,10274,10366,10368,10378,10382,10385,10386,10388,10390,11992,12005,12027,12036,14318,14322,14326,14329,14333,14334,14335,14460,14461,14462,14463,14681,14685,14686,14687,14809,14814,14815,14816,14817,14862,14866,14867,14931,14978,14980,14981,15193,15195,15220,15246,15257,15267,15273,15296,15435,15438,15440,15441,15669,15675,15678,15682,15685,15686,15887,15940,15988,15991,24576,24577,24578,24580,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25033,25034,25035,25036,25037,25038,25039,25040,25041,25042,25043,25047,25048,25049,25050,25051,25052,25053,25054,25055,25056,25057,25061,25062,25063,25064,25065,25066,25067,25068,25069,25070,25071,25075,25076,25077,25078,25079,25080,25081,25082,25083,25084,25085,25089,25090,25091,25092,25093,25094,25095,25096,25097,25098,25099,25103,25104,25105,25106,25107,25108,25109,25110,25111,25112,25113,25117,25118,25119,25120,25121,25122,25123,25124,25125,25126,25127,25131,25132,25133,25134,25135,25136,25137,25138,25139,25140,25141,25146,25147,25148,25149,25150,25151,25152,25153,25154,25155,25160,25161,25162,25163,25164,25165,25166,25167,25168,25169,25174,25175,25176,25177,25178,25179,25180,25181,25182,25183,25187,25188,25189,25190,25191,25192,25193,25194,25195,25196,25197,25201,25202,25203,25204,25205,25206,25207,25208,25209,25210,25211,25215,25216,25217,25218,25219,25220,25221,25222,25223,25224,25225,25229,25230,25231,25232,25233,25234,25235,25236,25237,25238,25239,25243,25244,25245,25246,25247,25248,25249,25250,25251,25252,25253,25257,25258,25259,25260,25261,25262,25263,25264,25265,25266,25267,25271,25272,25273,25274,25275,25276,25277,25278,25279,25280,25281,25286,25287,25288,25289,25290,25291,25292,25293,25294,25295,25299,25300,25301,25302,25303,25304,25305,25306,25307,25308,25309,25313,25314,25315,25316,25317,25318,25319,25320,25321,25322,25323,25327,25328,25329,25330,25331,25332,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25939,25941,25942,25943,25944,25945,25946,25947,25950,25952,25953,25954,25955,25956,25957,25962,27798,27813,27814,27816,27817,27818,27821,27822,27823,27824,27825,27826,27827,27828,27829,27831,27835,27837,27840,27842,27843,27844,28166,28400,28534,28535,28536,28537,28538,28539,28540,28541,28542,28543,28544,29240,29352,30535,31180,31186,31187,31190,31193,31196,31200,31202,31204,31222,31226,31230,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31291,31292,31293,31294,31295,31297,31299,31554,31562,31570,31578,31919,31920,31921,31922,31923,31924,32082,60205,60206,60207,60208,60209,60210,60211,60212,60213,60214,60215,60216,60217,60218,60219,60220,60221,60222,60223,60224,60225,60226,60227,60228,60229,60230,60231,60233,60234,60235,60236,60237,60238,60239,60240,60241,60242,60243,60523,60524,60525,60526,60527,60528,60529,60530,60539,60540,60541,60546,60547,60548,60549,60550,60551,60552,60553,60557,60562,60563,60564,60565,60566,60567,60568,60569,60571,60572,60573,60575,60577,60579,60581,60583,60585,60587,60589,60591,60593,60595,60597,60599,60601,60610,60612,60613,60614,60616,60618,60620,60622,60624,60626,60739,60740,60741,60749,60750,60751,60752,60754,60755,60756,60757,60759,60761,60763,60765,60767,60768,60769,60770,60771,60772,60780,60781,60782,60783,60784,60785,60787,60789,60790,60792,60794,60796,60798,60800,60802,60804,60805,60806,60808,60810,60812,60814,60816,60818,60821,60824,60826,60827,60828,60829,60833,60835,60838,60846,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62195,62196,62197,62198,62199,62200,62201,62202,62203,62204,62205,62206,62207,62208,62209,62210,62211,62212},
})

table.insert(Journal.djDungeons, {
    name = "Auchenai Crypts",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Auchindoun",
    bosses = {
        {
            bossID = 18371,
            spells = {},
            name = "Shirrak the Dead Watcher",
            flat = itemdir,
        },
        {
            bossID = 18373,
            spells = {},
            name = "Exarch Maladaar",
            flat = itemdir,
        }
    },
    items = {24576,24577,24578,24580,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25035,25036,25037,25038,25039,25040,25041,25042,25043,25049,25050,25051,25052,25053,25054,25055,25056,25057,25063,25064,25065,25066,25067,25068,25069,25070,25071,25077,25078,25079,25080,25081,25082,25083,25084,25085,25091,25092,25093,25094,25095,25096,25097,25098,25099,25105,25106,25107,25108,25109,25110,25111,25112,25113,25119,25120,25121,25122,25123,25124,25125,25126,25127,25133,25134,25135,25136,25137,25138,25139,25140,25141,25147,25148,25149,25150,25151,25152,25153,25154,25155,25161,25162,25163,25164,25165,25166,25167,25168,25169,25175,25176,25177,25178,25179,25180,25181,25182,25183,25189,25190,25191,25192,25193,25194,25195,25196,25197,25203,25204,25205,25206,25207,25208,25209,25210,25211,25218,25219,25220,25221,25222,25223,25224,25225,25231,25232,25233,25234,25235,25236,25237,25238,25239,25245,25246,25247,25248,25249,25250,25251,25252,25253,25259,25260,25261,25262,25263,25264,25265,25266,25267,25273,25274,25275,25276,25277,25278,25279,25280,25281,25287,25288,25289,25290,25291,25292,25293,25294,25295,25301,25302,25303,25304,25305,25306,25307,25308,25309,25315,25316,25317,25318,25319,25320,25321,25322,25323,25329,25330,25331,25332,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25964,26055,27408,27409,27410,27411,27412,27413,27414,27415,27416,27493,27523,27797,27845,27846,27847,27865,27866,27867,27869,27870,27871,27872,27876,27877,27878,27937,28268,28536,28537,28538,28539,28540,28541,28542,28543,28544,29244,29257,29354,31180,31186,31187,31190,31193,31196,31200,31202,31204,31222,31226,31230,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,60424,60425,60426,60427,60428,60429,60430,60431,60432,60433,60434,60435,60436,60437,60438,60512,60513,60514,60515,60516,60517,60738,60742,60743,60744,60745,60746,60747,60748,60753,60758,60760,60762,60764,60766,60773,60774,60775,60776,60777,60778,60779,60786,60788,60791,60793,60795,60797,60799,60801,60803,60807,60809,60811,60813,60815,60817,60819,60820,60822,60823,60825,60830,60831,60832,60834,60836,60837,60839,60840,60841,60842,60843,60844,60845,60847,60905,60906,60907,60909,60911,60913,60915,60917,60919,60921,60923,60925,60927,60929,60931,60933,60935,60937,60939,60941,60942,60945,60947,60949,60951,60952,60954,60955,60956,60957,60959,60960,60961,60962,60963,60964,60965,60966,60975,60976,60977,60978,60979,60984,60985,60986,60996,60997,60998,60999,61000,61001,61002,61006,61008,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62184,62185,62186,62187,62188,62189,62190,62191,62192,62193,62194},
})

table.insert(Journal.djDungeons, {
    name = "Blackfathom Depths",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackfathomDeeps",
    bosses = {
        {
            bossID = 4887,
            spells = {},
            name = "Ghamoo-ra",
            flat = itemdir,
        },
        {
            bossID = 6243,
            spells = {},
            name = "Gelihast",
            flat = itemdir,
        }
    },
    items = {789,790,827,886,888,890,897,911,920,935,1076,1077,1121,1155,1214,1218,1220,1296,1299,1300,1351,1391,1405,1406,1440,1446,1448,1454,1455,1457,1458,1459,1460,1461,1462,1469,1473,1486,1491,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1928,1929,1934,1936,1943,1944,1945,1958,1959,2011,2013,2017,2034,2059,2072,2077,2078,2079,2143,2166,2167,2168,2175,2194,2216,2217,2219,2220,2221,2222,2227,2232,2233,2236,2271,2566,2567,2800,2819,2879,2911,2969,2970,2973,2974,2977,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3078,3184,3193,3195,3196,3198,3199,3201,3202,3204,3205,3206,3211,3212,3227,3305,3306,3309,3310,3313,3315,3376,3377,3378,3379,3380,3381,3413,3414,3415,3416,3417,3429,3569,3645,3647,3655,3656,3740,4036,4049,4290,4567,4568,4571,4575,4661,4676,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4788,4949,4998,4999,5001,6378,6379,6380,6381,6382,6383,6387,6393,6394,6395,6397,6398,6528,6531,6536,6538,6539,6540,6541,6545,6546,6547,6548,6551,6552,6553,6554,6557,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6604,6605,6608,6611,6612,6613,6614,6615,6901,6902,6903,6905,6906,6907,6908,6910,6911,7001,7002,7415,7554,7558,7608,8748,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9822,9829,9831,9838,10287,10405,11121,11965,11967,11968,11969,11981,11982,11983,11984,11993,11994,11995,12006,12007,12008,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13010,13011,13012,13041,14025,14096,14109,14114,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14179,14181,14182,14185,14186,14187,14188,14194,14195,14364,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14400,14402,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14580,14582,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14752,14754,14755,14756,15012,15014,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15132,15210,15211,15212,15222,15223,15224,15230,15241,15248,15249,15259,15268,15269,15304,15305,15306,15307,15308,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15340,15347,15348,15487,15488,15489,15493,15494,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15532,15535,15537,15547,15891,15893,15894,15912,15926,15927,15945,15946,15947,15971,15972,15974},
})

table.insert(Journal.djDungeons, {
    name = "Sethekk Halls",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Auchindoun",
    bosses = {
        {
            bossID = 18472,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_arcane_arcane03",
                    name        = "Arcane Shock",
                    description = "Shocks an enemy with concussive force, then inflicts additional Arcane damage every 3 sec. for 12 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_flameshock",
                    name        = "Flame Shock",
                    description = "Instantly burns an enemy, then inflicts additional Fire damage every 3 sec. for 12 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_chainlightning",
                    name        = "Chain Lightning",
                    description = "Strikes an enemy with a lightning bolt that arcs to another nearby enemy. The spell affects up to 3 targets, causing Nature damage to each.",
                    duration    = 0,
                    casttime    = 3,
                    cooldown    = 6,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_shadow_curseofachimonde",
                    name        = "Shadow Shock",
                    description = "Shocks an enemy with concussive force, then inflicts additional Shadow damage every 3 sec. for 12 sec.",
                    duration    = 12,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                
            },
            name = "Darkweaver Syth",
            flat = itemdir,
        },
        {
            bossID = 23035,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_auraofdarkness",
                    name        = "Paralyzing Screech",
                    description = "Stuns all nearby enemies for 6 sec.",
                    duration    = 0,
                    casttime    = 5,
                    cooldown    = 10,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_cyclone",
                    name        = "Cyclone of Feathers",
                    description = "Invulnerable, but unable to act.",
                    duration    = 6,
                    casttime    = 2.5,
                    cooldown    = 5,
                  },
                  {
                    icon        = "Interface\\Icons\\ability_hunter_pet_bat",
                    name        = "Dive",
                    description = "Charges a distant enemy, inflicting normal damage plus 0, then fears all nearby targets.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
            name = "Anzu",
            flat = itemdir,
        },
        {
            bossID = 18473,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_holy_divineintervention",
                    name        = "Arcane Bubble",
                    description = "Immune to all attacks and spells.Cannot attack. Lasts 8 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_polymorph",
                    name        = "Polymorph",
                    description = "Transforms an enemy into a sheep, forcing it to wander around for up to 6 sec. While wandering, the sheep cannot attack or cast spells. Any damage will transform the target back into its normal form. Only one target can be polymorphed at a time. Only works on beasts, dragons, giants, humanoids, and critters.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_nature_wispsplode",
                    name        = "Arcane Explosion",
                    description = "Sends out a blast wave of magic, inflicting Arcane damage to nearby enemies.",
                    duration    = 0,
                    casttime    = 5,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_arcane_starfire",
                    name        = "Arcane Volley",
                    description = "Hurl magical bolts at nearby enemies, inflicting Arcane damage.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
              },
            name = "Talon King Ikiss",
            flat = itemdir,
        }
    },
    items = {24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25037,25038,25039,25040,25041,25042,25043,25051,25052,25053,25054,25055,25056,25057,25065,25066,25067,25068,25069,25070,25071,25079,25080,25081,25082,25083,25084,25085,25093,25094,25095,25096,25097,25098,25099,25107,25108,25109,25110,25111,25112,25113,25121,25122,25123,25124,25125,25126,25127,25135,25136,25137,25138,25139,25140,25141,25149,25150,25151,25152,25153,25154,25155,25163,25164,25165,25166,25167,25168,25169,25177,25178,25179,25180,25181,25182,25183,25191,25192,25193,25194,25195,25196,25197,25205,25206,25207,25208,25209,25210,25211,25219,25220,25221,25222,25223,25224,25225,25233,25234,25235,25236,25237,25238,25239,25247,25248,25249,25250,25251,25252,25253,25261,25262,25263,25264,25265,25266,25267,25275,25276,25277,25278,25279,25280,25281,25289,25290,25291,25292,25293,25294,25295,25303,25304,25305,25306,25307,25308,25309,25317,25318,25319,25320,25321,25322,25323,25331,25332,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27776,27838,27875,27914,27915,27916,27918,27919,27925,27936,27946,27948,27980,27981,27985,27986,28538,28539,28540,28541,28542,28543,28544,29249,29259,29355,31190,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,32073,32769,32778,32779,32780,32781,60398,60399,60400,60401,60402,60403,60404,60405,60406,60407,60408,60409,60410,60411,60412,60413,60414,60415,60416,60417,60418,60419,60420,60421,60422,60423,60738,60739,60740,60741,60742,60743,60744,60745,60746,60747,60748,60749,60750,60751,60752,60753,60754,60755,60756,60757,60758,60759,60760,60761,60762,60763,60764,60765,60766,60767,60768,60769,60770,60771,60772,60773,60774,60775,60776,60777,60778,60779,60780,60781,60782,60783,60784,60785,60786,60787,60788,60789,60790,60791,60792,60793,60794,60795,60796,60797,60798,60799,60800,60801,60802,60803,60804,60805,60806,60807,60808,60809,60810,60811,60812,60813,60814,60815,60816,60817,60818,60819,60820,60821,60822,60823,60824,60825,60826,60827,60828,60829,60830,60831,60832,60833,60834,60835,60836,60837,60838,60839,60840,60841,60842,60843,60844,60845,60846,60847,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "Shadow Labyrinth",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Auchindoun",
    bosses = {
        {
            bossID = 18731,
            spells = {},
            name = "Ambassador Hellmaw",
            flat = itemdir,
        },
        {
            bossID = 18732,
            spells = {},
            name = "Blackheart the Inciter",
            flat = itemdir,
        },
        {
            bossID = 18708,
            spells = {},
            name = "Murmur",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27468,27775,27778,27803,27884,27885,27887,27888,27889,27890,27891,27892,27893,27897,27898,27902,27903,27905,27908,27909,27910,27912,27913,28134,28167,28170,28171,28174,28176,28177,28178,28179,28230,28232,28540,28541,28542,28543,28544,29261,29353,29357,30532,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,60337,60338,60339,60340,60341,60342,60343,60344,60345,60346,60347,60348,60349,60350,60351,60352,60353,60354,60355,60356,60357,60358,60359,60360,60361,60362,60363,60364,60365,60366,60367,60368,60369,60518,60519,60520,60521,60522,60523,60524,60525,60526,60527,60528,60529,60530,60531,60532,60533,60534,60535,60536,60537,60538,60539,60540,60541,60542,60543,60544,60545,60546,60547,60548,60549,60550,60551,60552,60553,60554,60555,60556,60557,60558,60559,60560,60561,60562,60563,60564,60565,60566,60567,60568,60569,60570,60571,60572,60573,60574,60575,60576,60577,60578,60579,60580,60581,60582,60583,60584,60585,60586,60587,60588,60589,60590,60591,60592,60593,60594,60595,60596,60597,60598,60599,60600,60601,60602,60603,60604,60605,60606,60607,60608,60609,60610,60611,60612,60613,60614,60615,60616,60617,60618,60619,60620,60621,60622,60623,60624,60625,60626,60627,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "The Steamvault",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir.blp",
    bosses = {
        {
            bossID = 17797,
            spells = {},
            name = "Hydromancer Thespia",
            flat = itemdir,
        },
        {
            bossID = 17796,
            spells = {},
            name = "Mekgineer Steamrigger",
            flat = itemdir,
        },
        {
            bossID = 17798,
            spells = {},
            name = "Warlord Kalithresh",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25039,25040,25041,25042,25053,25054,25055,25056,25067,25068,25069,25070,25081,25082,25083,25084,25095,25096,25097,25098,25109,25110,25111,25112,25123,25124,25125,25126,25137,25138,25139,25140,25151,25152,25153,25154,25165,25166,25167,25168,25179,25180,25181,25182,25193,25194,25195,25196,25207,25208,25209,25210,25221,25222,25223,25224,25235,25236,25237,25238,25249,25250,25251,25252,25263,25264,25265,25266,25277,25278,25279,25280,25291,25292,25293,25294,25305,25306,25307,25308,25319,25320,25321,25322,25333,25334,25335,25336,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27475,27508,27510,27737,27738,27783,27784,27787,27789,27790,27791,27792,27793,27794,27795,27799,27801,27804,27805,27806,27874,28203,28540,28541,28542,28543,29243,29351,29463,30543,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,60903,60904,60905,60906,60907,60908,60909,60910,60911,60912,60913,60914,60915,60916,60917,60918,60919,60920,60921,60922,60923,60924,60925,60926,60927,60928,60929,60930,60931,60932,60933,60934,60935,60936,60937,60938,60939,60940,60941,60942,60943,60944,60945,60946,60947,60948,60949,60950,60951,60952,60953,60954,60955,60956,60957,60958,60959,60960,60961,60962,60963,60964,60965,60966,60967,60968,60969,60970,60971,60972,60973,60974,60975,60976,60977,60978,60979,60980,60981,60982,60983,60984,60985,60986,60987,60988,60989,60990,60991,60992,60993,60994,60995,60996,60997,60998,60999,61000,61001,61002,61003,61004,61005,61006,61007,61008,61009,61010,61011,61283,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61424,61425,61426,61427,61428,61429,61430,61431,61432,61433,61434,61435,61436,61437,61438,61439,61440,61441,61442,61443,61444,61445,61446,61447,61448,61449,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "The Botanica",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TempestKeep.blp",
    bosses = {
        {
            bossID = 17975,
            spells = {},
            name = "Commander Sarannis",
            flat = itemdir,
        },
        {
            bossID = 17976,
            spells = {},
            name = "High Botanist Freywinn",
            flat = itemdir,
        },
        {
            bossID = 17978,
            spells = {},
            name = "Thorngrin the Tender",
            flat = itemdir,
        },
        {
            bossID = 17977,
            spells = {},
            name = "Laj",
            flat = itemdir,
        },
        {
            bossID = 17980,
            spells = {},
            name = "Warp Splinter",
            flat = itemdir,
        }
    },
    items = {24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25037,25038,25039,25040,25041,25042,25043,25051,25052,25053,25054,25055,25056,25057,25065,25066,25067,25068,25069,25070,25071,25079,25080,25081,25082,25083,25084,25085,25093,25094,25095,25096,25097,25098,25099,25107,25108,25109,25110,25111,25112,25113,25121,25122,25123,25124,25125,25126,25127,25135,25136,25137,25138,25139,25140,25141,25149,25150,25151,25152,25153,25154,25155,25163,25164,25165,25166,25167,25168,25169,25177,25178,25179,25180,25181,25182,25183,25191,25192,25193,25194,25195,25196,25197,25205,25206,25207,25208,25209,25210,25211,25219,25220,25221,25222,25223,25224,25225,25233,25234,25235,25236,25237,25238,25239,25247,25248,25249,25250,25251,25252,25253,25261,25262,25263,25264,25265,25266,25267,25275,25276,25277,25278,25279,25280,25281,25289,25290,25291,25292,25293,25294,25295,25303,25304,25305,25306,25307,25308,25309,25317,25318,25319,25320,25321,25322,25323,25331,25332,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27739,28228,28229,28301,28304,28306,28315,28316,28317,28318,28321,28322,28323,28324,28325,28327,28328,28338,28339,28340,28341,28342,28343,28345,28347,28348,28349,28350,28367,28371,28538,28539,28540,28541,28542,28543,28544,29258,29262,29359,31190,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,32072,60439,60440,60441,60442,60443,60444,60445,60446,60447,60448,60449,60450,60451,60452,60453,60454,60455,60456,60457,60458,60459,60460,60461,60462,60463,60464,60465,60466,60467,60468,60469,60470,60471,60472,60473,60474,60475,60630,60632,60634,60636,60638,60640,60642,60644,60646,60648,60650,60652,60654,60658,60659,60660,60661,60662,60663,60664,60665,60667,60668,60669,60671,60673,60675,60677,60679,60684,60685,60686,60687,60688,60689,60698,60699,60700,60701,60702,60703,60704,60705,60707,60708,60711,60722,60723,60724,60725,60726,60727,60728,60735,60737,60848,60849,60850,60851,60852,60853,60854,60855,60856,60857,60858,60859,60860,60861,60862,60863,60864,60865,60866,60867,60868,60869,60870,60871,60872,60873,60874,60875,60876,60877,60878,60879,60880,60881,60882,60883,60884,60885,60886,60887,60888,60889,60890,60891,60892,60893,60894,60895,60896,60897,60898,60899,60900,60901,60902,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "The Mechanar",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TempestKeep.blp",
    bosses = {
        {
            bossID = 19219,
            spells = {},
            name = "Mechano-Lord Capacitus",
            flat = itemdir,
        },
        {
            bossID = 19218,
            spells = {},
            name = "Nethermancer Sepethrea",
            flat = itemdir,
        },
        {
            bossID = 19220,
            spells = {},
            name = "Pathaleon the Calculator",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27899,28202,28204,28249,28250,28251,28252,28253,28254,28255,28256,28257,28258,28259,28260,28262,28263,28265,28266,28267,28269,28275,28278,28285,28286,28288,28540,28541,28542,28543,28544,29251,29362,30533,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,32076,60128,60129,60130,60131,60132,60133,60134,60135,60136,60137,60138,60139,60140,60141,60142,60143,60144,60145,60146,60147,60148,60149,60150,60151,60152,60153,60154,60155,60156,60157,60158,60628,60629,60630,60631,60632,60633,60634,60635,60636,60637,60638,60639,60640,60641,60642,60643,60644,60645,60646,60647,60648,60649,60650,60651,60652,60653,60654,60655,60656,60657,60658,60659,60660,60661,60662,60663,60664,60665,60666,60667,60668,60669,60670,60671,60672,60673,60674,60675,60676,60677,60678,60679,60680,60681,60682,60683,60684,60685,60686,60687,60688,60689,60690,60691,60692,60693,60694,60695,60696,60697,60698,60699,60700,60701,60702,60703,60704,60705,60706,60707,60708,60709,60710,60711,60712,60713,60714,60715,60716,60717,60718,60719,60720,60721,60722,60723,60724,60725,60726,60727,60728,60729,60730,60731,60732,60733,60734,60735,60736,60737,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "The Arcatraz",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TempestKeep.blp",
    bosses = {
        {
            bossID = 20870,
            spells = {},
            name = "Zereketh the Unbound",
            flat = itemdir,
        },
        {
            bossID = 20886,
            spells = {},
            name = "Wrath-Scryer Soccothrates",
            flat = itemdir,
        },
        {
            bossID = 20885,
            spells = {},
            name = "Dalliah the Doomsayer",
            flat = itemdir,
        },
        {
            bossID = 20912,
            spells = {},
            name = "Harbinger Skyriss",
            flat = itemdir,
        }
    },
    items = {24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25037,25038,25039,25040,25041,25042,25043,25051,25052,25053,25054,25055,25056,25057,25065,25066,25067,25068,25069,25070,25071,25079,25080,25081,25082,25083,25084,25085,25093,25094,25095,25096,25097,25098,25099,25107,25108,25109,25110,25111,25112,25113,25121,25122,25123,25124,25125,25126,25127,25135,25136,25137,25138,25139,25140,25141,25149,25150,25151,25152,25153,25154,25155,25163,25164,25165,25166,25167,25168,25169,25177,25178,25179,25180,25181,25182,25183,25191,25192,25193,25194,25195,25196,25197,25205,25206,25207,25208,25209,25210,25211,25219,25220,25221,25222,25223,25224,25225,25233,25234,25235,25236,25237,25238,25239,25247,25248,25249,25250,25251,25252,25253,25261,25262,25263,25264,25265,25266,25267,25275,25276,25277,25278,25279,25280,25281,25289,25290,25291,25292,25293,25294,25295,25303,25304,25305,25306,25307,25308,25309,25317,25318,25319,25320,25321,25322,25323,25331,25332,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28205,28231,28373,28374,28375,28384,28386,28387,28390,28391,28392,28393,28394,28396,28397,28398,28403,28406,28407,28412,28413,28414,28415,28416,28418,28419,28538,28539,28540,28541,28542,28543,28544,29241,29248,29252,29360,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,60306,60307,60308,60309,60310,60311,60312,60313,60314,60315,60316,60317,60318,60319,60320,60321,60322,60323,60324,60325,60326,60327,60328,60329,60330,60331,60332,60333,60334,60335,60336,60630,60632,60634,60636,60638,60640,60642,60644,60646,60648,60650,60652,60654,60658,60659,60660,60661,60662,60663,60664,60665,60667,60668,60669,60671,60673,60675,60677,60679,60684,60685,60686,60687,60688,60689,60698,60699,60700,60701,60702,60703,60704,60705,60707,60708,60711,60722,60723,60724,60725,60726,60727,60728,60735,60737,60848,60849,60850,60851,60852,60853,60854,60855,60856,60857,60858,60859,60860,60861,60862,60863,60864,60865,60866,60867,60868,60869,60870,60871,60872,60873,60874,60875,60876,60877,60878,60879,60880,60881,60882,60883,60884,60885,60886,60887,60888,60889,60890,60891,60892,60893,60894,60895,60896,60897,60898,60899,60900,60901,60902,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "Old Hillsbrad Foothills",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheCullingOfStratholme.blp",
    bosses = {
        {
            bossID = 17848,
            spells = {},
            name = "Lieutenant Drake",
            flat = itemdir,
        },
        {
            bossID = 17862,
            spells = {},
            name = "Captain Skarloc",
            flat = itemdir,
        },
        {
            bossID = 17879,
            spells = {},
            name = "Epoch Hunter",
            flat = itemdir,
        }
    },
    items = {39,44,52,56,57,720,789,790,791,865,886,890,911,920,935,1076,1077,1121,1395,1396,1406,1455,1459,1461,1462,1717,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,2011,2013,2034,2059,2072,2077,2194,2219,2220,2221,2222,2227,2232,2233,2236,2278,2566,2800,2819,2878,2879,2911,2981,2982,2985,2986,2988,2989,2990,2991,2992,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3186,3193,3198,3199,3201,3202,3203,3204,3206,3210,3211,3212,3378,3379,3380,3381,3429,3569,3647,3655,3656,3740,4035,4036,4037,4048,4049,4050,4051,4064,4071,4072,4073,4568,4575,4661,4694,4697,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4998,4999,5001,5002,5003,5007,6098,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6397,6398,6399,6400,6536,6538,6552,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6611,6612,6613,6614,6615,6617,7110,7355,7356,7370,7410,7411,7415,7416,7419,7554,7558,7608,8748,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9780,9781,9782,9783,9784,9787,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9820,9821,9822,9823,9827,9828,9829,9831,9832,9837,9838,9839,9840,10287,10288,10404,10405,10407,11965,11967,11968,11969,11981,11982,11983,11984,11993,11994,11995,12006,12007,12008,12047,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13048,13049,13079,13094,13097,13099,13106,13114,13131,14120,14121,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14190,14191,14192,14193,14194,14195,14197,14198,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14399,14400,14402,14403,14406,14560,14562,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14582,14608,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14752,14754,14755,14756,14758,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15132,15135,15136,15211,15212,15222,15223,15224,15230,15231,15241,15242,15248,15249,15259,15269,15307,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15340,15341,15342,15343,15344,15345,15347,15348,15351,15488,15496,15497,15498,15500,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15537,15538,15539,15545,15547,15549,15559,15891,15893,15894,15912,15927,15928,15946,15947,15971,15972,15973,15974,15975,23321,24576,24577,24578,24580,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25035,25036,25037,25038,25039,25040,25041,25042,25049,25050,25051,25052,25053,25054,25055,25056,25063,25064,25065,25066,25067,25068,25069,25070,25077,25078,25079,25080,25081,25082,25083,25084,25091,25092,25093,25094,25095,25096,25097,25098,25105,25106,25107,25108,25109,25110,25111,25112,25119,25120,25121,25122,25123,25124,25125,25126,25133,25134,25135,25136,25137,25138,25139,25140,25147,25148,25149,25150,25151,25152,25153,25154,25161,25162,25163,25164,25165,25166,25167,25168,25175,25176,25177,25178,25179,25180,25181,25182,25189,25190,25191,25192,25193,25194,25195,25196,25203,25204,25205,25206,25207,25208,25209,25210,25217,25218,25219,25220,25221,25222,25223,25224,25231,25232,25233,25234,25235,25236,25237,25238,25245,25246,25247,25248,25249,25250,25251,25252,25259,25260,25261,25262,25263,25264,25265,25266,25273,25274,25275,25276,25277,25278,25279,25280,25287,25288,25289,25290,25291,25292,25293,25294,25301,25302,25303,25304,25305,25306,25307,25308,25315,25316,25317,25318,25319,25320,25321,25322,25329,25330,25331,25332,25333,25334,25335,25336,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,27417,27418,27420,27423,27424,27426,27427,27428,27430,27431,27432,27433,27434,27436,27440,27904,27911,28191,28210,28211,28212,28213,28214,28215,28216,28217,28218,28219,28220,28221,28222,28223,28224,28225,28226,28227,28233,28344,28401,28536,28537,28538,28539,28540,28541,28542,28543,29246,29250,29316,29317,29318,29319,30534,30536,31180,31186,31187,31193,31196,31200,31202,31204,31222,31226,31230,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,38506,60476,60477,60478,60479,60480,60481,60482,60483,60484,60485,60486,60487,60488,60489,60490,60491,60492,60493,60494,60495,60496,60497,60498,60499,60500,60501,60502,60503,60504,60505,60506,60507,60508,60509,60510,60511,60518,60519,60520,60521,60522,60531,60532,60533,60534,60535,60536,60537,60538,60542,60543,60544,60545,60554,60555,60556,60558,60559,60560,60561,60570,60574,60576,60578,60580,60582,60584,60586,60588,60590,60592,60594,60596,60598,60600,60602,60603,60604,60605,60606,60607,60608,60609,60611,60615,60617,60619,60621,60623,60625,60627,60628,60629,60631,60633,60635,60637,60639,60641,60643,60645,60647,60649,60651,60653,60655,60656,60657,60666,60670,60672,60674,60676,60678,60680,60681,60682,60683,60690,60691,60692,60693,60694,60695,60696,60697,60706,60709,60710,60712,60713,60714,60715,60716,60717,60718,60719,60720,60721,60729,60730,60731,60732,60733,60734,60736,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510,62213,62214,62215,62216,62217,62218,62219},
})

table.insert(Journal.djDungeons, {
    name = "The Black Morass",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-CavernsOfTime.blp",
    bosses = {
        {
            bossID = 17880,
            spells = {},
            name = "Temporus",
            flat = itemdir,
        },
        {
            bossID = 17881,
            spells = {},
            name = "Aeonus",
            flat = itemdir,
        }
    },
    items = {24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25037,25038,25039,25040,25051,25052,25053,25054,25065,25066,25067,25068,25079,25080,25081,25082,25093,25094,25095,25096,25107,25108,25109,25110,25121,25122,25123,25124,25135,25136,25137,25138,25149,25150,25151,25152,25163,25164,25165,25166,25177,25178,25179,25180,25191,25192,25193,25194,25205,25206,25207,25208,25219,25220,25221,25222,25233,25234,25235,25236,25247,25248,25249,25250,25261,25262,25263,25264,25275,25276,25277,25278,25289,25290,25291,25292,25303,25304,25305,25306,25317,25318,25319,25320,25331,25332,25333,25334,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27509,27839,27873,27977,27987,27988,27993,27994,27995,27996,28033,28034,28184,28185,28186,28187,28188,28189,28190,28192,28193,28194,28206,28207,28538,28539,28540,28541,29247,29253,29320,29321,29322,29323,29356,30531,31190,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31291,31292,31293,31294,31295,31297,31299,60370,60371,60372,60373,60374,60375,60376,60377,60378,60379,60380,60381,60382,60383,60384,60385,60386,60387,60388,60389,60390,60391,60392,60393,60394,60395,60396,60397,60628,60629,60630,60631,60632,60633,60634,60635,60636,60637,60638,60639,60640,60641,60642,60643,60644,60645,60646,60647,60648,60649,60650,60651,60652,60653,60654,60655,60656,60657,60658,60659,60660,60661,60662,60663,60664,60665,60666,60667,60668,60669,60670,60671,60672,60673,60674,60675,60676,60677,60678,60679,60680,60681,60682,60683,60684,60685,60686,60687,60688,60689,60690,60691,60692,60693,60694,60695,60696,60697,60698,60699,60700,60701,60702,60703,60704,60705,60706,60707,60708,60709,60710,60711,60712,60713,60714,60715,60716,60717,60718,60719,60720,60721,60722,60723,60724,60725,60726,60727,60728,60729,60730,60731,60732,60733,60734,60735,60736,60737,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

table.insert(Journal.djDungeons, {
    name = "Shattered Halls",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HellfireCitadel.blp",
    bosses = {
        {
            bossID = 16808,
            flat = itemdir,
            name = "Warchief Kargath Bladefist",
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25039,25040,25041,25042,25053,25054,25055,25056,25067,25068,25069,25070,25081,25082,25083,25084,25095,25096,25097,25098,25109,25110,25111,25112,25123,25124,25125,25126,25137,25138,25139,25140,25151,25152,25153,25154,25165,25166,25167,25168,25179,25180,25181,25182,25193,25194,25195,25196,25207,25208,25209,25210,25221,25222,25223,25224,25235,25236,25237,25238,25249,25250,25251,25252,25263,25264,25265,25266,25277,25278,25279,25280,25291,25292,25293,25294,25305,25306,25307,25308,25319,25320,25321,25322,25333,25334,25335,25336,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,27474,27517,27519,27520,27521,27524,27525,27526,27527,27528,27529,27531,27533,27534,27535,27536,27537,27538,27540,27802,27868,28540,28541,28542,28543,29254,29255,29263,30705,30707,30708,30709,30710,31190,31284,31285,31286,31287,31288,31289,31291,31292,31293,31294,31295,31297,31299,61018,61020,61022,61023,61024,61025,61026,61032,61033,61035,61037,61038,61039,61040,61041,61042,61043,61044,61052,61053,61054,61055,61056,61057,61059,61060,61064,61066,61068,61070,61072,61074,61076,61079,61081,61083,61084,61087,61089,61090,61091,61092,61093,61094,61095,61096,61106,61110,61112,61114,61116,61118,61119,61120,61121,61122,61123,61124,61125,61126,61127,61128,61129,61130,61131,61132,61133,61134,61135,61136,61137,61138,61139,61140,61141,61142,61143,61144,61145,61146,61147,61148,61149,61150,61151,61152,61153,61154,61155,61156,61157,61158,61159,61160,61161,61162,61163,61164,61165,61166,61167,61168,61169,61170,61171,61172,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61393,61394,61395,61396,61397,61398,61399,61400,61401,61402,61403,61404,61405,61406,61407,61408,61409,61410,61411,61412,61413,61414,61415,61416,61417,61418,61419,61420,61421,61422,61423,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510}
})

table.insert(Journal.djDungeons, {
    name = "Blackrock Spire",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackrockSpire.blp",
    bosses = {
        {
            bossID = 9568,
            flat = itemdir,
            name = "Overlord Wyrmthalak",
        }
    },
    items = {812,833,863,897,942,944,1168,1203,1315,1351,1443,1521,1522,1523,1607,1608,1613,1639,1721,1979,1990,1993,1994,1996,2017,2077,2243,2244,2245,2246,2564,2621,2801,2819,3075,3187,3201,3206,3208,3345,3430,3475,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4038,4046,4049,4057,4059,4062,4065,4069,4074,4080,4082,4083,4084,4088,4089,4696,4711,4712,4726,4732,4733,4737,5009,5216,5266,5267,6387,6393,6395,6397,6398,6402,6405,6413,6417,6418,6423,6425,6427,6429,6430,6590,6592,6594,6595,6596,6597,6598,6599,6601,6605,6611,6612,6613,6614,6615,7111,7113,7332,7415,7433,7434,7437,7438,7443,7444,7446,7447,7448,7457,7458,7461,7462,7468,7469,7477,7486,7495,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7557,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9402,9791,9797,9798,9800,9808,9809,9822,9829,9831,9838,9848,9849,9850,9851,9856,9858,9859,9862,9863,9864,9870,9871,9872,9873,9905,9906,9907,9910,9911,9912,9913,9914,9915,9916,9917,9918,9920,9921,9922,9923,9924,9925,9928,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11969,11971,11974,11975,11976,11977,11978,11979,11980,11984,11988,11989,11990,11991,11992,11995,11999,12001,12002,12004,12005,12008,12010,12012,12013,12014,12015,12016,12017,12020,12023,12024,12025,12026,12027,12031,12032,12034,12035,12036,12043,12044,12045,12046,12048,12055,12056,12057,12058,12587,12589,12602,12603,12604,12605,12606,12608,12609,12626,12634,12637,12651,12653,12905,12926,12927,12929,12930,12935,12936,12939,12940,12952,12953,12960,12963,12964,12965,12966,12967,12968,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13022,13023,13027,13028,13030,13036,13040,13046,13047,13052,13056,13059,13065,13066,13067,13070,13072,13073,13075,13077,13083,13085,13091,13096,13098,13101,13107,13111,13113,13116,13118,13120,13122,13123,13125,13126,13130,13133,13135,13139,13141,13142,13144,13161,13162,13163,13166,13167,13168,13169,13170,13177,13178,13179,13181,13182,13184,13185,13203,13204,13205,13206,13208,13210,13211,13212,13244,13252,13253,13255,13257,13258,13259,13260,13261,13282,13283,13284,13371,13498,13502,14181,14182,14186,14187,14194,14195,14202,14204,14207,14208,14213,14215,14217,14218,14222,14226,14229,14235,14237,14244,14246,14247,14249,14252,14254,14257,14258,14259,14260,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14372,14379,14380,14400,14402,14412,14415,14417,14425,14427,14428,14431,14432,14433,14434,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14552,14553,14554,14555,14558,14570,14578,14582,14588,14589,14594,14601,14604,14607,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14744,14750,14754,14755,14756,14762,14766,14768,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14821,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14895,14896,14897,14898,14899,14900,14901,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15121,15123,15125,15126,15132,15134,15144,15145,15149,15150,15151,15153,15162,15164,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15213,15215,15216,15217,15218,15219,15220,15221,15226,15227,15228,15229,15235,15236,15237,15238,15239,15240,15243,15245,15246,15247,15252,15253,15254,15255,15256,15257,15258,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15337,15338,15347,15356,15361,15364,15370,15373,15374,15376,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15522,15525,15529,15535,15537,15546,15547,15552,15557,15558,15561,15562,15563,15570,15575,15577,15590,15594,15599,15601,15602,15604,15607,15608,15609,15612,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15858,15859,15887,15890,15929,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15947,15964,15965,15966,15967,15968,15976,15977,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15991,16666,16669,16670,16672,16673,16674,16676,16679,16680,16681,16683,16685,16688,16690,16695,16696,16700,16703,16706,16710,16712,16713,16715,16716,16717,16718,16721,16726,16729,16730,16733,16735,16736,17007,18047,18048,18102,18103,18104,18339,18343,18672,18674,18679,22225,22231,22232,22247,22253,22267,22269,22302,22306,22311,22313,22319,22322,22325,22335,22336,22337,22339,22340,22342,22343,24222,28972}
})

table.insert(Journal.djDungeons, {
    name = "Blackrock Depths",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackrockDepths.blp",
    bosses = {
        {
            bossID = 9018,
            flat = itemdir,
            name = "High Interrogator Gerstahn",
        }
    },
    items = {812,833,940,942,943,1168,1169,1203,1315,1447,1607,1608,1639,1720,1721,1979,1994,2100,2244,2245,2246,2564,3075,3208,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4069,4082,4084,4088,4089,4091,4696,4733,5266,6427,6430,7113,7517,7518,7519,7520,7521,7523,7526,7527,7528,7529,7530,7531,7532,7535,7536,7537,7538,7539,7540,7541,7542,7543,7546,7553,7557,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8138,8143,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8304,8305,8306,8307,8308,8309,8310,8311,8312,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9433,9905,9911,9913,9914,9922,9924,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9960,9961,9962,9963,9964,9965,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10090,10091,10092,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10136,10137,10138,10140,10144,10145,10146,10147,10148,10149,10154,10155,10156,10159,10161,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10216,10217,10219,10221,10222,10223,10224,10225,10226,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10249,10256,10258,10267,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10369,10370,10371,10372,10373,10374,10375,10376,10377,10379,10380,10381,10383,10387,10391,11623,11624,11625,11626,11627,11628,11629,11631,11632,11633,11634,11662,11665,11669,11675,11677,11678,11679,11685,11686,11702,11703,11722,11726,11728,11729,11730,11731,11735,11745,11746,11747,11748,11749,11750,11755,11764,11765,11766,11767,11782,11783,11784,11785,11786,11787,11802,11803,11805,11807,11808,11810,11812,11814,11815,11816,11819,11820,11821,11822,11823,11824,11832,11839,11841,11842,11866,11921,11922,11923,11924,11925,11926,11927,11928,11929,11930,11931,11932,11933,11934,11935,11945,11946,11962,11974,11975,11976,11977,11978,11979,11988,11989,11990,11991,11999,12001,12002,12004,12013,12014,12015,12016,12024,12025,12026,12032,12034,12035,12043,12044,12045,12046,12055,12056,12057,12527,12532,12535,12542,12543,12544,12545,12546,12547,12548,12549,12550,12551,12552,12553,12554,12555,12556,12557,12793,13002,13003,13004,13007,13008,13009,13013,13014,13018,13021,13022,13027,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13059,13065,13066,13067,13070,13073,13074,13076,13077,13082,13085,13089,13091,13101,13102,13109,13111,13112,13118,13120,13122,13125,13126,13128,13130,13134,13135,13139,13144,14237,14244,14249,14254,14259,14263,14264,14265,14266,14267,14268,14269,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14319,14320,14321,14323,14324,14325,14327,14330,14331,14337,14427,14433,14434,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14457,14458,14459,14465,14551,14552,14653,14655,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14682,14683,14684,14688,14779,14780,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14810,14813,14835,14840,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14863,14864,14865,14868,14869,14904,14907,14908,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14932,14933,14934,14935,14936,14937,14938,14939,14947,14948,14949,14950,14951,14952,14953,14954,14955,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14976,14977,14983,15119,15164,15167,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15194,15216,15217,15218,15219,15227,15228,15229,15235,15236,15237,15238,15239,15245,15252,15253,15254,15255,15256,15262,15263,15264,15265,15266,15270,15271,15272,15274,15275,15276,15278,15279,15280,15281,15282,15288,15291,15294,15295,15323,15324,15325,15373,15376,15378,15379,15380,15381,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15436,15437,15601,15604,15609,15615,15616,15618,15619,15620,15621,15622,15623,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15670,15671,15672,15673,15674,15676,15677,15679,15681,15683,15693,15694,15890,15930,15931,15936,15937,15938,15939,15943,15965,15966,15967,15980,15981,15982,15983,15984,15985,15986,15987,17007,18043,18044,18339,18343,18672,18674,18679,22204,22205,22207,22208,22212,22223,22234,22240,22241,22242,22245,22254,22255,22256,22257,22266,22270,22271,22275,22305,22317,22318,22330,24222,49074,49076,49078,49080,49116,49118}
})

table.insert(Journal.djDungeons, {
    name = "Magisters' Terrace",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-MagistersTerrace.blp",
    bosses = {
        {
            bossID = 24723,
            spells = {},
            name = "Selin Fireheart",
            flat = itemdir,
        },
        {
            bossID = 24744,
            spells = {},
            name = "Vexallus",
            flat = itemdir,
        },
        {
            bossID = 24664,
            spells = {},
            name = "Priestess Delrissa",
            flat = itemdir,
        },
        {
            bossID = 24553,
            spells = {},
            name = "Kael'thas Sunstrider",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28540,28541,28542,28543,28544,31190,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,34470,34471,34472,34473,34601,34602,34603,34604,34605,34606,34607,34608,34609,34610,34611,34612,34613,34614,34615,34616,34625,34697,34698,34699,34700,34701,34702,34703,34704,34705,34706,34707,34708,34783,34788,34789,34790,34791,34792,34793,34794,34795,34796,34797,34798,34799,34807,34808,34809,34810,60630,60632,60634,60636,60638,60640,60642,60644,60646,60648,60650,60652,60654,60658,60659,60660,60661,60662,60663,60664,60665,60667,60668,60669,60671,60673,60675,60677,60679,60684,60685,60686,60687,60688,60689,60698,60699,60700,60701,60702,60703,60704,60705,60707,60708,60711,60722,60723,60724,60725,60726,60727,60728,60735,60737,60848,60849,60850,60851,60852,60853,60854,60855,60856,60857,60858,60859,60860,60861,60862,60863,60864,60865,60866,60867,60868,60869,60870,60871,60872,60873,60874,60875,60876,60877,60878,60879,60880,60881,60882,60883,60884,60885,60886,60887,60888,60889,60890,60891,60892,60893,60894,60895,60896,60897,60898,60899,60900,60901,60902,61284,61285,61286,61287,61288,61289,61290,61291,61292,61293,61294,61295,61296,61297,61298,61299,61300,61301,61302,61303,61304,61305,61306,61307,61308,61309,61310,61311,61312,61313,61314,61315,61316,61317,61318,61319,61320,61321,61322,61323,61324,61325,61326,61327,61328,61329,61330,61331,61332,61333,61334,61335,61336,61337,61338,61450,61451,61452,61453,61454,61455,61456,61457,61458,61459,61460,61461,61462,61463,61464,61465,61466,61467,61468,61469,61470,61471,61472,61473,61474,61475,61476,61477,61478,61479,61480,61481,61482,61483,61484,61485,61486,61487,61488,61489,61490,61491,61492,61493,61494,61495,61496,61497,61498,61499,61500,61501,61502,61503,61504,61505,61506,61507,61508,61509,61510},
})

-- =============================================================================
-- WRATH OF THE LICH KING
-- =============================================================================

table.insert(Journal.djDungeons, {
    name = "The Oculus",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheOculus.blp",
    bosses = {
        {
            bossID = 27447,
            spells = {},
            name = "Drakos the Interrogator",
            flat = itemdir,
        },
        {
            bossID = 27655,
            spells = {},
            name = "Varos Cloudstrider",
            flat = itemdir,
        },
        {
            bossID = 27656,
            spells = {},
            name = "Mage-Lord Urom",
            flat = itemdir,
        },
        {
            bossID = 27658,
            spells = {},
            name = "Ley-Guardian Eregos",
            flat = itemdir,
        }
    },
    items = {21525,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36412,36413,36414,36415,36426,36427,36428,36429,36440,36441,36442,36443,36455,36456,36457,36468,36469,36470,36471,36482,36483,36484,36485,36496,36497,36498,36499,36510,36511,36512,36513,36524,36525,36526,36527,36538,36539,36540,36541,36552,36553,36554,36555,36566,36567,36568,36569,36580,36581,36582,36583,36594,36595,36596,36597,36608,36609,36610,36611,36622,36623,36624,36625,36636,36637,36638,36639,36650,36651,36652,36653,36664,36665,36666,36667,36678,36679,36680,36681,36692,36693,36694,36695,36706,36707,36708,36709,36720,36721,36722,36723,36943,36944,36945,36946,36947,36948,36949,36950,36951,36952,36953,36954,36961,36962,36969,36971,36972,36973,36974,36975,36976,36977,36978,37195,37255,37256,37257,37258,37260,37261,37262,37263,37264,37288,37289,37291,37292,37293,37294,37360,37361,37362,37363,37364,37365,37366,62321,62322,62323,62324,62325,62326,62327,62328,62329,62330,62331,62332,62333,62334,62335,62336,62337,62338,62339,62340,62341,62342,62343,62344,62385,62386,62387,62388,62389,62390,62391,62392,62393,62394,62395,62396,62397,62398,62399,62400,63394,63395,63396,63397,63398,63399,63400,63401,63402,63403,63404,63405,63406,63407,63408,63409,63410,63411,63412,63413,63414,63415,63416,63417,63418,63419,63420,63421,63422,63423,63424,63425,63426,63427,63428,63429,63430,63431,63432,63433,63434,63435,63436,63437,63438,63439,63440,63441,63442,63443,63444,63445,63446,63447,63448,63449,63450,63451,63452,63453,63454,63455,63456,63457,63458,63459,63460,63461,63462,63463,63464,63465,63466,63467,63468,63469,63470,63471,63472,63473,63474,63475,63476,63477,63478,63479,63480,63481,63482,63483,63484,63485,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons, {
    name = "The Nexus",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheNexus.blp",
    bosses = {
        {
            bossID = 26723,
            spells = {},
            name = "Keristrasza",
            flat = itemdir,
        },
        {
            bossID = 26731,
            spells = {},
            name = "Grand Magus Telestra",
            flat = itemdir,
        },
        {
            bossID = 26728,
            spells = {},
            name = "Anomalus",
            flat = itemdir,
        },
        {
            bossID = 26729,
            spells = {},
            name = "Ormorok the Tree-Shaper",
            flat = itemdir,
        }
    },
    items = {21524,33358,33359,33360,33361,33362,33363,33364,33372,33373,33374,33375,33376,33377,33378,33390,33391,33392,33393,33394,33395,33396,33404,33405,33406,33407,33408,33409,33410,33437,33438,33439,33440,35595,35596,35597,35598,35599,35600,35601,35602,35603,35604,35605,35617,35963,35964,35965,35966,35967,35968,35969,35970,36075,36076,36077,36078,36079,36080,36081,36082,36187,36188,36189,36190,36191,36192,36193,36194,36299,36300,36301,36302,36303,36304,36305,36306,36404,36418,36432,36446,36460,36474,36488,36502,36516,36530,36544,36558,36572,36586,36600,36614,36628,36642,36656,36670,36684,36698,36712,37134,37135,37138,37139,37141,37144,37149,37150,37151,37152,37153,37155,37162,37165,37166,37167,37169,37170,37171,37172,37364,37365,37366,37728,37729,37730,37731,62285,62286,62287,62288,62289,62290,62291,62292,62293,62294,62295,62296,62297,62298,62299,62300,62301,62302,62303,62304,62305,62306,62307,62308,62309,62310,62311,62312,62313,62314,62315,62316,62317,62318,62319,62320,63394,63395,63396,63397,63398,63399,63400,63401,63402,63403,63404,63405,63406,63407,63408,63409,63410,63411,63412,63413,63414,63415,63416,63417,63418,63419,63420,63421,63422,63423,63424,63425,63426,63427,63428,63458,63459,63460,63461,63462,63463,63464,63465,63466,63467,63468,63469,63470,63471,63472,63473,63474,63475,63476,63485,63486,63487,63488,63489,63490,63491,63492,63493,63494,63495,63496,63497,63498,63499,63500,63501,63502,63503,63504,63505,63506,63507,63508,63509,63510,63511,63512,63513,63514,63515,63516,63517,63518,63519,63520,63521,63522,63523,63524,63525,63526,63527,63528,63529,63530,63531,63532,63533,63534,63535,63536,63537,63538,63539,63540,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons, {
    name = "The Culling of Stratholme",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheCullingOfStratholme.blp",
    bosses = {
        {
            bossID = 26533,
            spells = {},
            name = "Meathook",
            flat = itemdir,
        },
        {
            bossID = 26530,
            spells = {},
            name = "Salramm the Fleshcrafter",
            flat = itemdir,
        },
        {
            bossID = 26532,
            spells = {},
            name = "Chrono-Lord Epoch",
            flat = itemdir,
        },
        {
            bossID = 26531,
            spells = {},
            name = "Mal'Ganis",
            flat = itemdir,
        }
    },
    items = {2446,17192,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,36043,36044,36045,36046,36047,36048,36049,36050,36155,36156,36157,36158,36159,36160,36161,36162,36267,36268,36269,36270,36271,36272,36273,36274,36379,36380,36381,36382,36383,36384,36385,36386,36414,36428,36442,36456,36470,36484,36498,36512,36526,36540,36554,36568,36582,36596,36610,36624,36638,36652,36666,36680,36694,36708,36722,37079,37081,37082,37083,37084,37086,37088,37095,37096,37099,37105,37106,37107,37108,37110,37111,37112,37113,37114,37115,37116,37117,37675,37678,37679,37680,37681,37682,37683,37684,37685,37686,37687,37688,37689,37690,37691,37692,37693,37694,37695,37696,43085,62345,62346,62347,62348,62349,62350,62351,62352,62353,62354,62355,62356,62357,62358,62359,62360,62361,62362,62363,62364,62365,62366,62367,62368,62369,62370,62371,62372,62373,62374,62375,62376,62377,62378,62379,62380,62381,62382,62383,62384,63010,63011,63012,63013,63014,63015,63016,63017,63018,63019,63020,63021,63022,63023,63024,63025,63026,63027,63028,63029,63030,63031,63032,63033,63034,63035,63036,63037,63038,63039,63040,63041,63042,63043,63044,63045,63046,63047,63048,63049,63050,63051,63052,63053,63054,63055,63056,63057,63058,63059,63060,63061,63062,63063,63119,63120,63121,63122,63123,63124,63125,63126,63127,63128,63129,63130,63131,63132,63133,63134,63135,63136,63137,63138,63139,63140,63141,63142,63143,63144,63145,63146,63147,63148,63149,63150,63151,63152,63153,63154,63155,63156,63157,63158,63159,63160,63161,63162,63163,63164,63165,63166,63167,63168,63169,63170,63171,63172,63173,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

table.insert(Journal.djDungeons, {
    name = "The Forge of Souls",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TheForgeofSouls.blp",
    bosses = {
        {
            bossID = 36497,
            spells = {},
            name = "Bronjahm",
            flat = itemdir,
        },
        {
            bossID = 36502,
            spells = {},
            name = "Devourer of Souls",
            flat = itemdir,
        }
    },
    items = {33364,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36413,36414,36415,36427,36428,36429,36441,36442,36443,36455,36456,36457,36469,36470,36471,36483,36484,36485,36497,36498,36499,36511,36512,36513,36525,36526,36527,36539,36540,36541,36553,36554,36555,36567,36568,36569,36581,36582,36583,36595,36596,36597,36609,36610,36611,36623,36624,36625,36637,36638,36639,36651,36652,36653,36665,36666,36667,36679,36680,36681,36693,36694,36695,36707,36708,36709,36721,36722,36723,37760,37761,37770,37771,37780,37781,37792,37793,37794,37822,37824,37835,44308,44309,44310,44311,44312,44313,49783,49784,49785,49786,49787,49788,49789,49790,49791,49792,49793,49794,49795,49796,49797,49798,49799,49800,49852,49853,49854,49855,50169,50191,50193,50194,50196,50197,50198,50203,50206,50207,50208,50209,50210,50211,50212,50213,50214,50215,50315,50318,50319,62641,62642,62643,62644,62645,62646,62647,62648,62649,62650,62651,62652,62653,62654,62655,62656,62657,62658,62659,62660,62661,62662,62663,62664,62665,62666,62667,62668,62669,62670,62671,62672,62673,62674,62675,62676,62900,62901,62902,62903,62904,62905,62906,62907,62908,62909,62910,62911,62912,62913,62914,62915,62916,62917,62918,62919,62920,62921,62922,62923,62924,62925,62926,62927,62928,62929,62930,62931,62932,62933,62934,62935,62936,62937,62938,62939,62940,62941,62942,62943,62944,62945,62946,62947,62948,62949,62950,62951,62952,62953,62954,62955,62956,62957,62958,62959,62960,62961,62962,62963,62964,62965,62966,62967,62968,62969,62970,62971,62972,62973,62974,62975,62976,62977,62978,62979,62980,62981,62982,62983,62984,62985,62986,62987,62988,62989,62990,62991,62992,62993,62994,62995,62996,62997,62998,62999,63000,63001,63002,63003,63004,63005,63006,63007,63008,63009,63542,63543,63544,63546,63547,63548,63549,63550,63553,63554,63555,63556,63557,63558,63559,63560,63561,63562,63563,63564,63565,63566,63567,63568,63569,63570,63571,63572,63573,63574,63575,63576,63577,63578,63579,63580,63581,63582,63583,63584,63585,63586,63587,63588,63589,63590},
})

-- =============================================================================
-- VANILLA RAIDS
-- =============================================================================

table.insert(Journal.djDungeons, {
    name = "Molten Core",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-MoltenCore.blp",
    bosses = {
        {
            bossID = 11502,
            spells = {},
            name = "Ragnaros",
            flat = itemdir,
        },
        {
            bossID = 12018,
            spells = {},
            name = "Majordomo Executus",
            flat = itemdir,
        },
        {
            bossID = 12056,
            spells = {},
            name = "Baron Geddon",
            flat = itemdir,
        },
        {
            bossID = 11988,
            spells = {},
            name = "Golemagg the Incinerator",
            flat = itemdir,
        },
        {
            bossID = 12057,
            spells = {},
            name = "Garr",
            flat = itemdir,
        },
        {
            bossID = 12264,
            spells = {},
            name = "Shazzrah",
            flat = itemdir,
        },
        {
            bossID = 11982,
            spells = {},
            name = "Magmadar",
            flat = itemdir,
        },
        {
            bossID = 12098,
            spells = {},
            name = "Sulfuron Harbinger",
            flat = itemdir,
        },
        {
            bossID = 12259,
            spells = {},
            name = "Gehennas",
            flat = itemdir,
        },
        {
            bossID = 11665,
            spells = {},
            name = "Lava Annihilator",
            flat = itemdir,
        }
    },
    items = {944,1168,1203,1443,2243,2245,2246,2564,2801,3475,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5266,5267,8080,8081,8082,8083,8084,8085,8086,8245,8246,8249,8250,8252,8254,8256,8258,8260,8263,8264,8265,8271,8275,8283,8284,8285,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8318,8320,8749,8750,8751,8752,8753,8754,8755,9402,9943,9944,9946,9950,9974,10064,10073,10074,10077,10078,10084,10085,10095,10097,10098,10100,10101,10102,10104,10105,10106,10108,10111,10112,10113,10118,10119,10120,10121,10123,10124,10125,10133,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10168,10169,10170,10173,10174,10177,10178,10180,10181,10182,10184,10186,10188,10190,10192,10196,10197,10198,10200,10203,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10232,10233,10234,10235,10236,10237,10238,10241,10242,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11976,11978,11979,11980,11991,11992,12004,12005,12014,12015,12016,12017,12026,12027,12034,12035,12036,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13015,13023,13028,13030,13036,13040,13047,13066,13067,13070,13072,13073,13075,13077,13083,13085,13091,13096,13101,13107,13111,13113,13116,13118,13120,13123,13125,13126,13130,13133,13135,13144,14275,14277,14281,14284,14287,14288,14296,14297,14298,14300,14301,14302,14303,14305,14306,14307,14308,14309,14310,14312,14314,14315,14316,14317,14318,14319,14320,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14444,14447,14448,14449,14451,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14553,14554,14555,14558,14667,14668,14670,14671,14672,14673,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14795,14796,14798,14799,14800,14801,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14849,14850,14854,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14915,14916,14919,14922,14924,14925,14926,14927,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14959,14963,14964,14966,14967,14969,14970,14971,14972,14973,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15170,15179,15180,15185,15188,15189,15191,15192,15193,15194,15195,15218,15219,15220,15221,15228,15236,15238,15239,15240,15246,15247,15253,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15274,15276,15278,15280,15281,15282,15283,15288,15289,15294,15296,15324,15325,15388,15389,15390,15391,15393,15395,15426,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15631,15633,15634,15640,15642,15644,15647,15648,15650,15651,15653,15655,15657,15658,15660,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15887,15890,15930,15931,15938,15939,15940,15941,15942,15943,15967,15968,15983,15984,15985,15986,15987,15988,15989,15991,16795,16796,16797,16798,16799,16800,16801,16802,16803,16804,16805,16806,16807,16808,16809,16810,16811,16812,16813,16814,16815,16816,16817,16819,16820,16821,16822,16823,16824,16825,16826,16827,16828,16829,16830,16831,16833,16834,16835,16836,16837,16838,16839,16840,16841,16842,16843,16844,16845,16846,16847,16848,16849,16850,16851,16852,16853,16854,16855,16856,16857,16858,16859,16860,16861,16862,16863,16864,16865,16866,16867,16868,16901,16909,16915,16922,16930,16938,16946,16954,16962,17063,17065,17066,17069,17072,17073,17076,17077,17082,17102,17103,17104,17105,17106,17107,17109,17110,18203,18339,18343,18672,18674,18679,18803,18805,18806,18808,18809,18810,18811,18812,18814,18817,18821,18822,18823,18824,18829,18832,18842,18861,18870,18872,18875,18878,18879,19136,19137,19138,19139,19140,19142,19143,19144,19145,19146,19147},
})

table.insert(Journal.djDungeons, {
    name = "Blackwing Lair",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackwingLair.blp",
    bosses = {
        {
            bossID = 11583,
            spells = {},
            name = "Nefarian",
            flat = itemdir,
        },
        {
            bossID = 14020,
            spells = {},
            name = "Chromaggus",
            flat = itemdir,
        },
        {
            bossID = 12435,
            spells = {},
            name = "Razorgore the Untamed",
            flat = itemdir,
        },
        {
            bossID = 13020,
            spells = {},
            name = "Vaelastrasz the Corrupt",
            flat = itemdir,
        },
        {
            bossID = 12017,
            spells = {},
            name = "Broodlord Lashlayer",
            flat = itemdir,
        },
        {
            bossID = 11983,
            spells = {},
            name = "Firemaw",
            flat = itemdir,
        },
        {
            bossID = 14601,
            spells = {},
            name = "Ebonroc",
            flat = itemdir,
        },
        {
            bossID = 11981,
            spells = {},
            name = "Flamegor",
            flat = itemdir,
        }
    },
    items = {944,1168,1203,1443,2243,2245,2246,2564,2801,3475,4696,5266,5267,8245,8252,8258,8265,8271,8275,8283,8284,8285,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8312,8313,8318,8320,9402,10095,10097,10100,10101,10102,10104,10105,10106,10111,10112,10113,10118,10119,10121,10123,10124,10125,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10168,10169,10170,10177,10178,10181,10182,10188,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10232,10233,10234,10235,10236,10237,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11978,11979,11980,11991,11992,12004,12005,12015,12016,12017,12026,12027,12035,12036,12045,12046,12048,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13015,13023,13028,13030,13036,13040,13046,13047,13065,13066,13067,13070,13072,13073,13075,13077,13083,13085,13091,13096,13101,13107,13111,13113,13116,13118,13120,13123,13125,13126,13130,13133,13135,13139,13144,14284,14287,14288,14297,14298,14302,14303,14305,14306,14307,14308,14309,14310,14312,14314,14315,14316,14317,14318,14319,14320,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14449,14453,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14553,14554,14555,14670,14671,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14798,14799,14800,14804,14805,14806,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14854,14858,14859,14860,14862,14863,14864,14865,14866,14867,14868,14869,14924,14925,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14964,14966,14967,14969,14970,14971,14972,14973,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15179,15185,15188,15189,15191,15192,15193,15194,15195,15218,15219,15220,15221,15229,15238,15239,15240,15246,15247,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15276,15278,15281,15282,15283,15288,15289,15296,15324,15325,15390,15391,15426,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15640,15648,15650,15651,15655,15657,15658,15660,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15887,15890,15930,15931,15938,15939,15940,15941,15942,15943,15967,15968,15984,15985,15986,15987,15988,15989,15991,16818,16832,16897,16898,16899,16900,16902,16903,16904,16905,16906,16907,16908,16910,16911,16912,16913,16914,16916,16917,16918,16919,16920,16921,16923,16924,16925,16926,16927,16928,16929,16931,16932,16933,16934,16935,16936,16937,16939,16940,16941,16942,16943,16944,16945,16947,16948,16949,16950,16951,16952,16953,16955,16956,16957,16958,16959,16960,16961,16963,16964,16965,16966,18339,18343,18672,18674,18679,19334,19335,19346,19347,19348,19349,19350,19351,19352,19353,19354,19355,19356,19357,19358,19360,19361,19362,19363,19364,19365,19367,19368,19369,19370,19371,19372,19373,19374,19375,19376,19377,19378,19379,19380,19381,19382,19385,19386,19387,19388,19389,19390,19391,19392,19393,19394,19395,19396,19397,19398,19399,19400,19401,19402,19403,19405,19406,19407,19430,19431,19432,19433,19434,19435,19436,19437,19438,19439,21529,21530},
})


table.insert(Journal.djDungeons, {
    name = "Zul'Gurub",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ZulGurub.blp",
    bosses = {
        {
            bossID = 14834,
            spells = {},
            name = "Hakkar the Soulflayer",
            flat = itemdir,
        },
        {
            bossID = 14507,
            spells = {},
            name = "High Priest Venoxis",
            flat = itemdir,
        },
        {
            bossID = 14517,
            spells = {},
            name = "High Priestess Jeklik",
            flat = itemdir,
        },
        {
            bossID = 14510,
            spells = {},
            name = "High Priestess Mar'li",
            flat = itemdir,
        },
        {
            bossID = 14509,
            spells = {},
            name = "High Priest Thekal",
            flat = itemdir,
        },
        {
            bossID = 14887,
            spells = {},
            name = "Ysondre",
            flat = itemdir,
        },
        {
            bossID = 11382,
            spells = {},
            name = "Bloodlord Mandokir",
            flat = itemdir,
        },
        {
            bossID = 15084,
            spells = {},
            name = "Renataki",
            flat = itemdir,
        },
        {
            bossID = 15082,
            spells = {},
            name = "Gri'lek",
            flat = itemdir,
        },
        {
            bossID = 15083,
            spells = {},
            name = "Hazza'rah",
            flat = itemdir,
        }
    },
    items = {944,1168,1203,1443,1607,1721,2243,2245,2246,2801,3475,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5267,8080,8081,8082,8083,8084,8085,8086,8245,8246,8249,8250,8251,8252,8254,8256,8258,8260,8261,8262,8263,8264,8265,8267,8268,8269,8270,8271,8272,8275,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9943,9944,9946,9950,9974,10057,10064,10065,10070,10073,10074,10077,10078,10084,10085,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10133,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10186,10187,10188,10189,10190,10192,10193,10195,10196,10197,10198,10199,10200,10203,10204,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10240,10241,10242,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11976,11977,11978,11979,11980,11990,11991,11992,12002,12004,12005,12014,12015,12016,12017,12025,12026,12027,12034,12035,12036,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13004,13006,13007,13015,13022,13023,13028,13047,13067,13070,13072,13075,13083,13096,13101,13107,13111,13113,13116,13120,13122,13123,13133,13135,14275,14277,14281,14283,14284,14287,14288,14293,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14437,14444,14445,14447,14448,14449,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14553,14554,14555,14558,14664,14667,14668,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14789,14790,14795,14796,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14844,14849,14850,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14915,14916,14919,14922,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14959,14961,14962,14963,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15170,15179,15180,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15221,15228,15229,15236,15237,15238,15239,15240,15246,15247,15253,15254,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15280,15281,15282,15283,15288,15289,15294,15295,15296,15324,15325,15388,15389,15390,15391,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15631,15633,15634,15640,15642,15644,15645,15646,15647,15648,15650,15651,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15938,15939,15940,15941,15942,15943,15966,15967,15968,15983,15984,15985,15986,15987,15988,15989,15991,18339,18343,18672,18674,18679,19853,19854,19855,19856,19857,19859,19861,19862,19863,19864,19865,19866,19867,19869,19870,19871,19873,19876,19877,19878,19884,19885,19886,19887,19888,19889,19890,19891,19892,19893,19894,19895,19896,19897,19898,19899,19900,19901,19903,19904,19905,19906,19907,19908,19909,19912,19913,19915,19919,19920,19921,19922,19923,19925,19927,19928,19929,19944,19945,19946,19964,19965,19967,19968,19993,20032,20038,20257,20258,20259,20260,20261,20262,20263,20264,20265,20266,22711,22712,22713,22714,22715,22716,22718,22720,22721,22722},
})

table.insert(Journal.djDungeons, {
    name = "Ruins of Ahn'Qiraj",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RuinsofAhnQiraj.blp",
    bosses = {
        {
            bossID = 15348,
            spells = {},
            name = "Kurinnaxx",
            flat = itemdir,
        },
        {
            bossID = 15341,
            spells = {},
            name = "General Rajaxx",
            flat = itemdir,
        },
        {
            bossID = 15340,
            spells = {},
            name = "Moam",
            flat = itemdir,
        },
        {
            bossID = 15370,
            spells = {},
            name = "Buru the Gorger",
            flat = itemdir,
        },
        {
            bossID = 15369,
            spells = {},
            name = "Ayamiss the Hunter",
            flat = itemdir,
        },
        {
            bossID = 15339,
            spells = {},
            name = "Ossirian the Unscarred",
            flat = itemdir,
        }
    },
    items = {812,833,942,944,1168,1203,1443,1607,1639,1721,2243,2244,2245,2246,3075,3208,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4089,4696,5267,7528,7536,7537,7538,7539,7553,8080,8081,8082,8083,8084,8085,8086,8111,8112,8115,8122,8123,8124,8125,8128,8129,8130,8245,8246,8249,8250,8251,8252,8254,8256,8258,8260,8261,8262,8263,8264,8265,8267,8268,8269,8270,8271,8272,8275,8279,8280,8281,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9905,9913,9914,9924,9936,9937,9938,9939,9941,9943,9944,9945,9946,9947,9948,9949,9950,9952,9962,9963,9964,9965,9974,10057,10060,10064,10065,10066,10067,10069,10070,10071,10073,10074,10076,10077,10078,10079,10084,10085,10086,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10133,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10186,10187,10188,10189,10190,10192,10193,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10240,10241,10242,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11975,11976,11977,11978,11979,11980,11990,11991,11992,12002,12004,12005,12013,12014,12015,12016,12017,12025,12026,12027,12032,12034,12035,12036,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13013,13015,13022,13023,13028,13036,13040,13047,13056,13067,13070,13072,13075,13077,13083,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13130,13133,13135,14263,14264,14271,14273,14275,14277,14279,14280,14281,14283,14284,14287,14288,14292,14293,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14427,14434,14437,14438,14442,14443,14444,14445,14446,14447,14448,14449,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14552,14553,14554,14555,14655,14658,14661,14663,14664,14665,14667,14668,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14779,14780,14785,14788,14789,14790,14791,14795,14796,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14835,14842,14844,14847,14849,14850,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14907,14908,14913,14915,14916,14917,14919,14921,14922,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14953,14958,14959,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15167,15170,15177,15179,15180,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15221,15227,15228,15229,15235,15236,15237,15238,15239,15240,15246,15247,15252,15253,15254,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15280,15281,15282,15283,15288,15289,15294,15295,15296,15324,15325,15379,15383,15385,15386,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15619,15628,15629,15630,15631,15633,15634,15635,15636,15638,15640,15642,15643,15644,15645,15646,15647,15648,15650,15651,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15938,15939,15940,15941,15942,15943,15965,15966,15967,15968,15983,15984,15985,15986,15987,15988,15989,15991,18339,18343,18672,18674,18679,21452,21453,21454,21455,21456,21457,21458,21459,21460,21461,21462,21463,21464,21466,21467,21468,21469,21470,21471,21472,21474,21475,21476,21477,21478,21479,21480,21481,21482,21483,21484,21485,21486,21487,21489,21490,21491,21492,21493,21494,21495,21496,21497,21498,21499,21500,21501,21502,21503,21504,21505,21506,21507,21715,21800,21801,21802,21803,21804,21805,21806,21809,21810,24222},
})

-- =============================================================================
-- THE BURNING CRUSADE RAIDS
-- =============================================================================

table.insert(Journal.djDungeons, {
    name = "Karazhan",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Karazhan.blp",
    bosses = {
        {
            bossID = 15691,
            spells = {},
            name = "Prince Malchezaar",
            flat = itemdir,
        },
        {
            bossID = 16524,
            spells = {},
            name = "Shade of Aran",
            flat = itemdir,
        },
        {
            bossID = 15689,
            spells = {},
            name = "Terestian Illhoof",
            flat = itemdir,
        },
        {
            bossID = 16457,
            spells = {},
            name = "Maiden of Virtue",
            flat = itemdir,
        },
        {
            bossID = 15688,
            spells = {},
            name = "Moroes",
            flat = itemdir,
        },
        {
            bossID = 28194,
            spells = {},
            name = "Attumen the Huntsman",
            flat = itemdir,
        },
        {
            bossID = 15687,
            spells = {},
            name = "Opera Event",
            flat = itemdir,
        },
        {
            bossID = 15690,
            spells = {},
            name = "Curator",
            flat = itemdir,
        },
        {
            bossID = 17225,
            spells = {},
            name = "Nightbane",
            flat = itemdir,
        },
        {
            bossID = 16152,
            spells = {},
            name = "Netherspite",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28453,28454,28477,28502,28503,28504,28505,28506,28507,28508,28509,28510,28511,28512,28514,28515,28516,28517,28518,28519,28520,28521,28522,28524,28525,28528,28529,28530,28540,28541,28542,28543,28544,28545,28565,28566,28567,28569,28570,28572,28573,28578,28579,28581,28582,28583,28584,28585,28586,28587,28588,28589,28590,28591,28593,28594,28597,28599,28600,28601,28602,28603,28604,28606,28608,28609,28610,28611,28612,28621,28631,28633,28647,28649,28652,28653,28654,28655,28656,28657,28658,28659,28660,28661,28662,28663,28666,28669,28670,28671,28672,28673,28674,28675,28726,28727,28728,28729,28730,28731,28732,28733,28734,28735,28740,28741,28742,28743,28744,28745,28746,28747,28748,28749,28750,28751,28752,28753,28754,28755,28756,28757,28762,28763,28764,28765,28766,28767,28768,28770,28771,28772,28773,30641,30642,30643,30644,30666,30667,30668,30673,30674,30675,30676,30677,30678,30680,30681,30682,30683,30684,30685,30686,30687,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343},
})

table.insert(Journal.djDungeons, {
    name = "Gruul's Lair",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-GruulsLair.blp",
    bosses = {
        {
            bossID = 19044,
            spells = {},
            name = "Gruul the Dragonkiller",
            flat = itemdir,
        },
        {
            bossID = 18831,
            spells = {},
            name = "High King Maulgar",
            flat = itemdir,
        }
    },
    items = {24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25041,25042,25043,25055,25056,25057,25069,25070,25071,25083,25084,25085,25097,25098,25099,25111,25112,25113,25125,25126,25127,25139,25140,25141,25153,25154,25155,25167,25168,25169,25181,25182,25183,25195,25196,25197,25209,25210,25211,25223,25224,25225,25237,25238,25239,25251,25252,25253,25265,25266,25267,25279,25280,25281,25293,25294,25295,25307,25308,25309,25321,25322,25323,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28542,28543,28544,28794,28795,28796,28797,28799,28800,28801,28802,28803,28804,28810,28822,28823,28824,28825,28826,28827,28828,28830,31290,31298,31303,31304,31305,31306,31308},
})

table.insert(Journal.djDungeons, {
    name = "Magtheridon's Lair",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-MagtheridonsLair.blp",
    bosses = {
        {
            bossID = 17257,
            spells = {},
            name = "Magtheridon",
            flat = itemdir,
        }
    },
    items = {28775,28776,28777,28778,28779,28780,28781,28782,28783,28789,28790,28791,28792,28793,29458},
})

table.insert(Journal.djDungeons, {
    name = "Serpentshrine Cavern",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-CoilfangReservoir.blp",
    bosses = {
        {
            bossID = 21212,
            spells = {},
            name = "Lady Vashj",
            flat = itemdir,
        },
        {
            bossID = 21216,
            spells = {},
            name = "Hydross the Unstable",
            flat = itemdir,
        },
        {
            bossID = 21217,
            spells = {},
            name = "The Lurker Below",
            flat = itemdir,
        },
        {
            bossID = 21215,
            spells = {},
            name = "Leotheras the Blind",
            flat = itemdir,
        },
        {
            bossID = 21214,
            spells = {},
            name = "Fathom-Lord Karathress",
            flat = itemdir,
        },
        {
            bossID = 21213,
            spells = {},
            name = "Morogrim Tidewalker",
            flat = itemdir,
        }
    },
    items = {24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25041,25042,25043,25055,25056,25057,25069,25070,25071,25083,25084,25085,25097,25098,25099,25111,25112,25113,25125,25126,25127,25139,25140,25141,25153,25154,25155,25167,25168,25169,25181,25182,25183,25195,25196,25197,25209,25210,25211,25223,25224,25225,25237,25238,25239,25251,25252,25253,25265,25266,25267,25279,25280,25281,25293,25294,25295,25307,25308,25309,25321,25322,25323,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28542,28543,28544,30008,30021,30022,30025,30027,30047,30048,30049,30050,30052,30053,30054,30055,30056,30057,30058,30059,30060,30061,30062,30064,30065,30066,30067,30068,30075,30079,30080,30081,30082,30083,30084,30085,30090,30091,30092,30095,30096,30097,30098,30099,30100,30101,30102,30103,30104,30105,30106,30107,30108,30109,30110,30111,30112,30620,30626,30627,30629,30665,30720,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,32516,33054,33055,33058},
})

table.insert(Journal.djDungeons, {
    name = "Tempest Keep: The Eye",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TempestKeep.blp",
    bosses = {
        {
            bossID = 19622,
            spells = {},
            name = "Kael'thas Sunstrider",
            flat = itemdir,
        },
        {
            bossID = 19516,
            spells = {},
            name = "Void Reaver",
            flat = itemdir,
        },
        {
            bossID = 19514,
            spells = {},
            name = "Al'ar",
            flat = itemdir,
        },
        {
            bossID = 18805,
            spells = {},
            name = "High Astromancer Solarian",
            flat = itemdir,
        }
    },
    items = {24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25035,25036,25039,25040,25041,25042,25043,25049,25050,25053,25054,25055,25056,25057,25063,25064,25067,25068,25069,25070,25071,25077,25078,25081,25082,25083,25084,25085,25091,25092,25095,25096,25097,25098,25099,25105,25106,25109,25110,25111,25112,25113,25119,25120,25123,25124,25125,25126,25127,25133,25134,25137,25138,25139,25140,25141,25147,25148,25151,25152,25153,25154,25155,25161,25162,25165,25166,25167,25168,25169,25175,25176,25179,25180,25181,25182,25183,25189,25190,25193,25194,25195,25196,25197,25203,25204,25207,25208,25209,25210,25211,25218,25221,25222,25223,25224,25225,25231,25232,25235,25236,25237,25238,25239,25245,25246,25249,25250,25251,25252,25253,25259,25260,25263,25264,25265,25266,25267,25273,25274,25277,25278,25279,25280,25281,25287,25288,25291,25292,25293,25294,25295,25301,25302,25305,25306,25307,25308,25309,25315,25316,25319,25320,25321,25322,25323,25329,25330,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28536,28537,28540,28541,28542,28543,28544,29918,29920,29921,29922,29923,29924,29925,29947,29948,29949,29950,29951,29962,29965,29966,29972,29976,29977,29981,29982,29983,29984,29985,29986,29987,29988,29989,29990,29991,29992,29993,29994,29995,29996,29997,29998,30007,30015,30017,30018,30020,30024,30026,30028,30029,30030,30311,30312,30313,30314,30316,30317,30318,30446,30450,30619,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,32267,32515,32944},
})

table.insert(Journal.djDungeons, {
    name = "Hyjal Summit",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-CavernsOfTime.blp",
    bosses = {
        {
            bossID = 17968,
            spells = {},
            name = "Archimonde",
            flat = itemdir,
        },
        {
            bossID = 17767,
            spells = {},
            name = "Rage Winterchill",
            flat = itemdir,
        },
        {
            bossID = 17808,
            spells = {},
            name = "Anetheron",
            flat = itemdir,
        },
        {
            bossID = 17888,
            spells = {},
            name = "Kaz'rogal",
            flat = itemdir,
        },
        {
            bossID = 17842,
            spells = {},
            name = "Azgalor",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28540,28541,28542,28543,28544,30861,30862,30863,30864,30865,30866,30868,30869,30870,30871,30872,30873,30874,30878,30879,30880,30881,30882,30883,30884,30885,30886,30887,30888,30889,30891,30892,30893,30894,30895,30896,30897,30898,30899,30900,30901,30902,30903,30904,30905,30906,30907,30908,30909,30910,30911,30912,30913,30914,30915,30916,30917,30918,30919,30969,30970,30972,30974,30975,30976,30977,30978,30979,30980,30982,30983,30985,30987,30988,30989,30990,30991,30992,30993,30994,30995,30996,30997,30998,31001,31003,31004,31005,31006,31007,31008,31011,31012,31014,31015,31016,31017,31018,31019,31020,31021,31022,31023,31024,31026,31027,31028,31029,31030,31032,31034,31035,31037,31039,31040,31041,31042,31043,31044,31045,31046,31047,31048,31049,31050,31051,31052,31053,31054,31055,31056,31057,31058,31059,31060,31061,31063,31064,31065,31066,31067,31068,31069,31070,32589,32590,32591,32592,32609,32945,32946,34009,34010},
})

table.insert(Journal.djDungeons, {
    name = "Black Temple",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlackTemple.blp",
    bosses = {
        {
            bossID = 22917,
            spells = {},
            name = "Illidan Stormrage",
            flat = itemdir,
        },
        {
            bossID = 22887,
            spells = {},
            name = "High Warlord Naj'entus",
            flat = itemdir,
        },
        {
            bossID = 22898,
            spells = {},
            name = "Supremus",
            flat = itemdir,
        },
        {
            bossID = 22841,
            spells = {},
            name = "Shade of Akama",
            flat = itemdir,
        },
        {
            bossID = 22871,
            spells = {},
            name = "Teron Gorefiend",
            flat = itemdir,
        },
        {
            bossID = 22948,
            spells = {},
            name = "Gurtogg Bloodboil",
            flat = itemdir,
        },
        {
            bossID = 23426,
            spells = {},
            name = "Reliquary of Souls",
            flat = itemdir,
        },
        {
            bossID = 22949,
            spells = {},
            name = "Mother Shahraz",
            flat = itemdir,
        },
        {
            bossID = 23420,
            spells = {},
            name = "The Illidari Council",
            flat = itemdir,
        }
    },
    items = {24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28540,28541,28542,28543,28544,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,32232,32234,32235,32236,32237,32238,32239,32240,32241,32242,32243,32245,32247,32248,32250,32251,32252,32253,32254,32255,32256,32258,32259,32260,32261,32262,32263,32264,32265,32266,32268,32269,32270,32271,32273,32275,32276,32278,32279,32280,32323,32324,32325,32326,32327,32328,32329,32331,32332,32333,32334,32335,32336,32337,32338,32339,32340,32341,32342,32343,32344,32345,32346,32347,32348,32349,32350,32351,32352,32353,32354,32361,32362,32363,32365,32366,32367,32369,32370,32373,32374,32375,32376,32377,32471,32483,32496,32497,32500,32501,32505,32510,32512,32513,32517,32518,32519,32521,32524,32525,32526,32527,32528,32589,32590,32591,32592,32593,32606,32608,32609,32757,32837,32838,32943,34011,34012},
})

table.insert(Journal.djDungeons, {
    name = "Zul'Aman",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ZulAman.blp",
    bosses = {
        {
            bossID = 23574,
            spells = {},
            name = "Akil'zon",
            flat = itemdir,
        },
        {
            bossID = 23576,
            spells = {},
            name = "Nalorakk",
            flat = itemdir,
        },
        {
            bossID = 23578,
            spells = {},
            name = "Jan'alai",
            flat = itemdir,
        },
        {
            bossID = 23577,
            spells = {},
            name = "Halazzi",
            flat = itemdir,
        },
        {
            bossID = 24239,
            spells = {},
            name = "Hex Lord Malacrass",
            flat = itemdir,
        },
        {
            bossID = 23863,
            spells = {},
            name = "Zul'jin",
            flat = itemdir,
        }
    },
    items = {3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,8080,8081,8082,8083,8084,8085,8086,8749,8750,8751,8752,8753,8754,8755,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28540,28541,28542,28543,28544,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,33191,33203,33206,33211,33214,33215,33216,33281,33283,33285,33286,33293,33297,33298,33299,33300,33303,33317,33322,33326,33327,33328,33329,33332,33354,33356,33357,33388,33389,33421,33432,33446,33453,33463,33464,33465,33466,33467,33468,33469,33471,33473,33474,33476,33478,33479,33480,33481,33483,33489,33490,33491,33492,33493,33494,33495,33496,33497,33498,33499,33500,33533,33590,33591,33592,33640,33805,33828,33829,33830,33831,33971},
})

table.insert(Journal.djDungeons, {
    name = "Sunwell Plateau",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SunwellPlateau.blp",
    bosses = {
        {
            bossID = 25315,
            spells = {},
            name = "Kil'jaeden",
            flat = itemdir,
        },
        {
            bossID = 25038,
            spells = {},
            name = "Felmyst",
            flat = itemdir,
        },
        {
            bossID = 25166,
            spells = {},
            name = "Grand Warlock Alythess",
            flat = itemdir,
        },
        {
            bossID = 25165,
            spells = {},
            name = "Lady Sacrolash",
            flat = itemdir,
        },
        {
            bossID = 24892,
            spells = {},
            name = "Sathrovarr the Corruptor",
            flat = itemdir,
        },
        {
            bossID = 25840,
            spells = {},
            name = "Entropius",
            flat = itemdir,
        },
        {
            bossID = 24850,
            spells = {},
            name = "Kalecgos",
            flat = itemdir,
        },
        {
            bossID = 25319,
            spells = {},
            name = "M'uru",
            flat = itemdir,
        }
    },
    items = {24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25041,25042,25043,25055,25056,25057,25069,25070,25071,25083,25084,25085,25097,25098,25099,25111,25112,25113,25125,25126,25127,25139,25140,25141,25153,25154,25155,25167,25168,25169,25181,25182,25183,25195,25196,25197,25209,25210,25211,25223,25224,25225,25237,25238,25239,25251,25252,25253,25265,25266,25267,25279,25280,25281,25293,25294,25295,25307,25308,25309,25321,25322,25323,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28542,28543,28544,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,34164,34165,34166,34167,34168,34169,34170,34176,34177,34178,34179,34180,34181,34182,34183,34184,34185,34186,34188,34189,34190,34192,34193,34194,34195,34196,34197,34198,34199,34202,34203,34204,34205,34206,34208,34210,34211,34213,34214,34215,34216,34228,34229,34230,34231,34232,34233,34234,34240,34241,34242,34243,34244,34245,34247,34329,34331,34332,34333,34334,34335,34336,34337,34339,34340,34341,34342,34343,34344,34345,34346,34347,34348,34349,34350,34351,34352,34427,34428,34429,34430,35282,35283,35284,35733},
})

table.insert(Journal.djDungeons, {
    name = "Shattrath",
    category = "TBC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Shattrath.blp",
    bosses = {
        {
            bossID = 18525,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_holy_championsbond",
                    name        = "Badge of Justice Vendor",
                    description = "G'eras sells a massive amount of Badge of Justice Gear. He is located in the middle of the shattath city.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
            name = "G'eras",
            flat = itemdir,
        },
        {
            bossID = 21432,
            spells = {},
            name = "Almaador",
            flat = itemdir,
        },
        {
            bossID = 25967,
            spells = {
                {
                icon        = "Interface\\Icons\\spell_arcane_portalorgrimmar",
                name        = "Portal: Caverns of Time",
                description = "Has a portal to the Caverns of Time. Talk to the NPC to get the portal.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 0,
              },
            },
            name = "Zephyr",
            flat = itemdir,
        },
        {
            bossID = 18756,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_misc_shadowegg",
                    name        = "Bottomless Bag",
                    description = "24 Slot Bag for 3,000g",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
            name = "Haris Pilton",
            flat = itemdir,
        },
        {
            bossID = 21655,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_misc_book_11",
                    name        = "Lower City Quartermaster",
                    description = "Reputation Vendor for the Lower City",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
            name = "Nakodu",
            flat = itemdir,
        },
    },
    items = {2300,2303,2308,2309,2310,2314,2315,2316,2568,2569,2578,2580,2582,2583,2584,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3719,3835,3836,3842,3844,3848,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6350,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7281,7282,7285,7348,7374,7377,7378,7387,7918,7919,7920,7922,7930,7931,7933,7938,7939,7941,7945,7956,7957,7958,7963,8175,8176,8185,8189,8191,8193,8197,8198,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,12251,12252,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15995,15999,16008,20818,20820,20821,20823,20826,20827,20828,20832,20907,20909,20955,20960,20961,20964,21748,21755,21764,21765,21767,21768,21775,21779,21790,21791,21849,21850,21851,21852,21853,21932,21933,21934,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,23563,23564,23565,23742,24074,24075,24076,24077,24078,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25037,25038,25039,25040,25051,25052,25053,25054,25065,25066,25067,25068,25079,25080,25081,25082,25093,25094,25095,25096,25107,25108,25109,25110,25121,25122,25123,25124,25135,25136,25137,25138,25149,25150,25151,25152,25163,25164,25165,25166,25177,25178,25179,25180,25191,25192,25193,25194,25205,25206,25207,25208,25219,25220,25221,25222,25233,25234,25235,25236,25247,25248,25249,25250,25261,25262,25263,25264,25275,25276,25277,25278,25289,25290,25291,25292,25303,25304,25305,25306,25317,25318,25319,25320,25331,25332,25333,25334,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,25438,25439,25654,25655,25656,25657,25659,25660,25661,25662,25668,25669,25670,25671,25673,25674,25675,25676,25926,25927,25928,25978,28425,28426,28427,28428,28429,28430,28431,28432,28433,28434,28435,28436,28438,28439,28440,28441,28442,28483,28484,28485,28538,28539,28540,28541,28963,28964,28966,28967,28968,29011,29012,29015,29016,29017,29019,29020,29021,29022,29023,29028,29029,29030,29031,29032,29033,29034,29035,29036,29037,29038,29039,29040,29042,29043,29044,29045,29046,29047,29048,29049,29050,29053,29054,29055,29056,29057,29058,29059,29060,29061,29062,29063,29064,29065,29066,29067,29068,29069,29070,29071,29072,29073,29074,29075,29076,29077,29078,29079,29080,29081,29082,29083,29084,29085,29086,29087,29088,29089,29090,29091,29092,29093,29094,29095,29096,29097,29098,29099,29100,29123,29124,29125,29126,29127,29128,29129,29130,29131,29132,29133,29134,29157,29158,29159,29160,29175,29176,29177,29179,29180,29201,29202,29203,29204,29266,29267,29268,29269,29270,29271,29272,29273,29274,29275,29367,29368,29369,29370,29373,29374,29375,29376,29379,29381,29382,29383,29384,29385,29386,29387,30069,30070,30071,30072,30073,30074,30076,30077,30086,30087,30088,30089,30093,30113,30114,30115,30116,30117,30118,30119,30120,30121,30122,30123,30124,30125,30126,30127,30129,30130,30131,30132,30133,30134,30135,30136,30137,30138,30139,30140,30141,30142,30143,30144,30145,30146,30148,30149,30150,30151,30152,30153,30154,30159,30160,30161,30162,30163,30164,30165,30166,30167,30168,30169,30170,30171,30172,30173,30185,30189,30190,30192,30194,30196,30205,30206,30207,30210,30211,30212,30213,30214,30215,30216,30217,30219,30220,30221,30222,30223,30228,30229,30230,30231,30232,30233,30234,30235,30368,30369,30370,30371,30372,30373,30374,30375,30419,30420,30421,30422,30761,30762,30763,30764,30766,30767,30768,30769,30770,30772,30773,30774,30776,30778,30779,30780,30804,30830,30832,30834,30835,30836,30841,30859,30860,31080,31460,31461,31462,31464,31465,31724,31726,31727,31746,31747,31748,31749,32083,32084,32085,32086,32087,32088,32089,32090,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32508,32756,32772,32774,32776,33192,33207,33222,33279,33280,33287,33291,33296,33304,33324,33325,33331,33333,33334,33386,33484,33501,33512,33513,33514,33515,33516,33517,33518,33519,33520,33522,33523,33524,33527,33528,33529,33530,33531,33532,33534,33535,33536,33537,33538,33539,33540,33552,33557,33559,33566,33577,33578,33579,33580,33582,33583,33584,33585,33586,33587,33588,33589,33593,33810,33832,33965,33970,33972,33973,33974,34049,34050,34162,34163,34887,34888,34889,34890,34891,34892,34893,34894,34895,34896,34898,34900,34901,34902,34903,34904,34905,34906,34910,34911,34912,34914,34916,34917,34918,34919,34921,34922,34923,34924,34925,34926,34927,34928,34929,34930,34931,34932,34933,34934,34935,34936,34937,34938,34939,34940,34941,34942,34943,34944,34945,34946,34947,34949,34950,34951,34952,34985,34986,34987,34988,34989,34990,34991,34992,34993,34994,34995,34996,34997,34998,34999,35000,35001,35002,35003,35004,35005,35006,35007,35008,35009,35010,35011,35012,35013,35014,35015,35016,35017,35018,35022,35023,35024,35025,35026,35037,35038,35047,35053,35054,35055,35056,35057,35058,35064,35065,35071,35072,35073,35074,35075,35076,35082,35083,35084,35085,35086,35087,35093,35094,35095,35096,35097,35098,35099,35100,35101,35102,35103,35107,35108,35109,35110,35111,35112,35113,35114,35115,35321,35324,35326,35330,35331,35333,35335,35340,35341,35344,35345,35357,35359,35361,35362,35368,35370,35373,35375,35378,35380,35381,35382,35388,35389,35391,35395,35404,35405,35407,35411,35412,35416,36737,41186,41187,41188,41189,41190,43515,43654,43655,43656,43657,43660,43661,43663,43664,43666,43667,45626,45627,45631},
})

--[[
table.insert(Journal.djDungeons, {
    name = "Vault of Archavon", -- UI-EJ-DUNGEONBUTTON-VaultofArchavon
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-UI-EJ-DUNGEONBUTTON-VaultofArchavon.blp",
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {},
})
--]]