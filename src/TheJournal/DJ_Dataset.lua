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
    zoneId = 37397,
    items = {39139,39140,39141,39146,39188,39189,39190,39191,39192,39193,39194,39195,39196,39197,39198,39199,39200,39215,39216,39217,39221,39224,39225,39226,39228,39229,39230,39231,39232,39233,39234,39235,39236,39237,39239,39240,39241,39242,39243,39244,39245,39246,39247,39248,39249,39250,39251,39252,39254,39255,39256,39257,39258,39259,39260,39261,39262,39267,39270,39271,39272,39273,39274,39275,39276,39277,39278,39279,39280,39281,39282,39283,39284,39285,39291,39292,39293,39294,39295,39296,39297,39298,39299,39306,39307,39308,39309,39310,39311,39344,39345,39369,39379,39386,39388,39389,39390,39391,39392,39393,39394,39395,39396,39397,39398,39399,39401,39403,39404,39405,39407,39408,39409,39415,39416,39417,39419,39420,39421,39422,39423,39424,39425,39426,39701,39702,39703,39704,39706,39712,39714,39716,39717,39718,39719,39720,39721,39722,39723,39724,39725,39726,39727,39729,39730,39731,39732,39733,39734,39735,39756,39758,39759,39760,39761,39762,39763,39764,39765,39766,39767,39768,40060,40061,40062,40063,40064,40065,40069,40071,40074,40075,40080,40107,40108,40184,40185,40186,40187,40188,40189,40190,40192,40193,40196,40197,40198,40200,40201,40203,40204,40205,40206,40208,40209,40210,40233,40234,40235,40236,40237,40238,40239,40240,40241,40242,40243,40244,40245,40246,40247,40249,40250,40251,40252,40253,40254,40255,40256,40257,40258,40259,40260,40261,40262,40263,40264,40265,40266,40269,40270,40271,40272,40273,40274,40275,40277,40278,40279,40280,40281,40282,40283,40284,40285,40286,40287,40288,40289,40294,40296,40297,40298,40299,40300,40301,40302,40303,40304,40305,40306,40315,40316,40317,40318,40319,40320,40323,40324,40325,40326,40327,40328,40329,40330,40331,40332,40333,40334,40335,40336,40338,40339,40340,40341,40343,40344,40345,40346,40347,40348,40349,40350,40351,40352,40362,40363,40365,40366,40367,40368,40369,40370,40371,40372,40373,40374,40375,40376,40377,40378,40379,40380,40381,40382,40383,40384,40385,40386,40387,40388,40395,40396,40398,40399,40400,40401,40402,40403,40405,40602},
})

table.insert(Journal.djDungeons, {
    name = "Deadmines",
    category = "CLASSIC",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Deadmines.blp",
    bosses = {
        {
            bossID = 639,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_misc_grouplooking",
                    name        = "VanCleef's Allies",
                    description = "At 50% health, VanCleef summons 2 allies. They will attack the player with the lowest health.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\ability_ghoulfrenzy",
                    name        = "Thrash",
                    description = "Gives the caster 2 extra attacks.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
            name = "Edwin VanCleef",
            flat = itemdir,
        },
        {
            bossID = 644,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_gauntlets_05",
                    name        = "Rhahk'Zor Slam",
                    description = "Inflicts 64 to 86 damage to an enemy, stunning it for 3 sec.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
            },
            name = "Rhahk'Zor",
            flat = itemdir,
        },
        {
            bossID = 645,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_drink_06",
                    name        = "Acid Splash",
                    description = "Inflicts Nature damage to nearby enemies every 5 sec. for 30 sec.",
                    duration    = 0,
                    casttime    = 1,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\spell_holy_heal",
                    name        = "Cookie's Cooking",
                    description = "Heals the caster for 111 to 129.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0,
                  },
            },
            name = "Cookie",
            flat = itemdir,
        },
        {
            bossID = 646,
            spells = {
                {
                icon        = "Interface\\Icons\\ability_warstomp",
                name        = "Smite Stomp",
                description = "At 66% and 33% health, Stuns all enemies within 45 yards for 10 sec.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 0,
              },
              {
                icon        = "Interface\\Icons\\ability_meleedamage",
                name        = "Nimble Reflexes",
                description = "Increases the caster's chance to parry by 75% for 8 sec.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 45,
              },
              {
                icon        = "Interface\\Icons\\ability_meleedamage",
                name        = "Nimble Reflexes",
                description = "Increases the caster's chance to parry by 75% for 8 sec.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 45,
              },
              {
                icon        = "Interface\\Icons\\ability_ghoulfrenzy",
                name        = "Thrash",
                description = "Gives the caster 2 extra attacks.",
                duration    = 0,
                casttime    = 0,
                cooldown    = 0,
              },
            },
            name = "Mr. Smite",
            flat = itemdir,
        },
        {
            bossID = 647,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_warrior_cleave",
                    name        = "Cleave",
                    description = "Inflicts 110% of normal melee damage to an enemy and its nearest ally.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                  },
                  {
                    icon        = "Interface\\Icons\\ability_poisons",
                    name        = "Poisoned Harpoon",
                    description = "Inflicts normal damage plus 30 to an enemy, then an additional 45 Nature damage every 10 sec. for 1 min.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0,
                  },
            },
            name = "Captain Greenskin",
            flat = itemdir,
        },
        {
            bossID = 1763,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_fire_fireball",
                    name        = "Molten Metal",
                    description = "Inflicts Fire damage every 3 sec. to an enemy, increasing the time between its attacks by 54% and its movement by 50% for 15 sec.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 0,
                  },
            },
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
    items = {789, 790, 827, 886, 890, 897, 911, 920, 935, 1076, 1077, 1121, 1214, 1218, 1220, 1292, 1296, 1299, 1300, 1351, 1391, 1405, 1406, 1440, 1446, 1448, 1455, 1457, 1458, 1459, 1460, 1461, 1462, 1469, 1473, 1483, 1484, 1489, 1738, 1739, 1740, 1741, 1742, 1743, 1744, 1745, 1746, 1747, 1748, 1749, 1750, 1751, 1752, 1753, 1764, 1766, 1767, 1768, 1769, 1770, 1772, 1774, 1775, 1776, 1777, 1778, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 1796, 1797, 1798, 1799, 1800, 1801, 1802, 1928, 1929, 1934, 1935, 1936, 1943, 1944, 1945, 1958, 1959, 1974, 2011, 2013, 2017, 2034, 2059, 2072, 2077, 2078, 2079, 2166, 2167, 2168, 2175, 2194, 2216, 2217, 2219, 2220, 2227, 2232, 2233, 2236, 2292, 2566, 2800, 2807, 2819, 2879, 2911, 2969, 2970, 2973, 2974, 2977, 2981, 2982, 2983, 2984, 2985, 2986, 2987, 2988, 2989, 2990, 2991, 2992, 3021, 3045, 3047, 3048, 3049, 3055, 3056, 3057, 3058, 3065, 3066, 3067, 3069, 3184, 3191, 3193, 3195, 3196, 3198, 3199, 3201, 3202, 3204, 3205, 3206, 3211, 3212, 3227, 3230, 3305, 3306, 3309, 3310, 3313, 3315, 3376, 3377, 3378, 3379, 3429, 3569, 3645, 3647, 3655, 3656, 3740, 3748, 4036, 4049, 4290, 4567, 4568, 4571, 4575, 4661, 4676, 4694, 4695, 4697, 4698, 4699, 4700, 4701, 4705, 4706, 4707, 4708, 4709, 4710, 4711, 4712, 4713, 4714, 4715, 4788, 4949, 4998, 4999, 5001, 5254, 5943, 6226, 6314, 6318, 6319, 6320, 6321, 6323, 6324, 6340, 6341, 6378, 6379, 6380, 6381, 6382, 6383, 6387, 6392, 6393, 6394, 6395, 6397, 6398, 6528, 6531, 6536, 6538, 6539, 6540, 6541, 6545, 6546, 6547, 6548, 6551, 6552, 6553, 6554, 6557, 6559, 6560, 6561, 6562, 6563, 6564, 6565, 6566, 6567, 6568, 6569, 6570, 6571, 6572, 6573, 6574, 6575, 6576, 6577, 6578, 6579, 6580, 6581, 6582, 6583, 6584, 6585, 6586, 6587, 6588, 6590, 6591, 6592, 6593, 6594, 6595, 6596, 6597, 6598, 6599, 6600, 6601, 6602, 6604, 6605, 6608, 6611, 6612, 6613, 6614, 6615, 6633, 6641, 6642, 682, 7415, 7554, 7558, 7608, 9766, 9767, 9768, 9769, 9770, 9771, 9772, 9773, 9774, 9775, 9776, 9777, 9778, 9779, 9780, 9781, 9782, 9783, 9784, 9785, 9786, 9787, 9788, 9789, 9790, 9791, 9792, 9793, 9794, 9795, 9796, 9797, 9798, 9799, 9800, 9801, 9802, 9803, 9804, 9805, 9806, 9807, 9808, 9809, 9810, 9811, 9812, 9813, 9814, 9815, 9816, 9817, 9818, 9822, 9829, 9831, 9838, 10287, 10405, 10407, 11965, 11967, 11968, 11969, 11981, 11982, 11983, 11984, 11993, 11994, 11995, 12006, 12007, 12008, 12052, 12053, 12054, 12975, 12976, 12977, 12978, 12979, 12982, 12983, 12985, 12987, 12988, 12989, 12990, 12994, 12996, 12997, 12998, 12999, 13010, 13011, 13012, 13041, 14025, 14096, 14109, 14114, 14117, 14119, 14120, 14121, 14122, 14123, 14124, 14125, 14127, 14129, 14131, 14133, 14158, 14159, 14160, 14161, 14162, 14163, 14164, 14165, 14166, 14167, 14168, 14170, 14171, 14172, 14173, 14174, 14175, 14176, 14177, 14179, 14181, 14182, 14185, 14186, 14187, 14188, 14194, 14195, 14364, 14366, 14367, 14369, 14370, 14371, 14372, 14373, 14374, 14375, 14376, 14377, 14378, 14379, 14380, 14400, 14402, 14559, 14560, 14561, 14562, 14563, 14564, 14565, 14566, 14567, 14568, 14569, 14570, 14571, 14572, 14573, 14574, 14578, 14580, 14582, 14722, 14723, 14724, 14725, 14726, 14727, 14729, 14730, 14742, 14743, 14744, 14745, 14746, 14747, 14748, 14749, 14750, 14752, 14754, 14755, 14756, 15012, 15014, 15016, 15017, 15018, 15110, 15111, 15112, 15113, 15114, 15115, 15116, 15117, 15118, 15120, 15121, 15122, 15123, 15124, 15125, 15126, 15132, 15210, 15211, 15212, 15222, 15223, 15224, 15230, 15241, 15248, 15249, 15259, 15268, 15269, 15304, 15305, 15306, 15307, 15308, 15310, 15311, 15312, 15329, 15330, 15331, 15332, 15333, 15334, 15336, 15337, 15338, 15340, 15347, 15348, 15487, 15488, 15489, 15493, 15494, 15497, 15498, 15499, 15500, 15501, 15502, 15503, 15504, 15506, 15507, 15508, 15509, 15510, 15511, 15512, 15513, 15514, 15515, 15516, 15517, 15519, 15520, 15521, 15522, 15523, 15525, 15526, 15527, 15528, 15529, 15532, 15535, 15537, 15547, 15891, 15893, 15894, 15912, 15926, 15927, 15945, 15946, 15947, 15971, 15972, 15974, 51804, 51805, 51806, 51807, 51808}
})

table.insert(Journal.djDungeons, {
    name = "Ulduar",
    category = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Ulduar.blp",
    bosses = {
        -- === The Siege of Ulduar ===
        {
            bossID = 33113,
            name   = "Flame Leviathan",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_vehicle_liquidpyrite-_blue",
                    name        = "|cffFFA500Blue Pyrite|r",
                    description = "Hop in a Demolisher and ride it to the boss. Once there, pull the boss by killing his guardians and head back to the repair platform to refill your pyrite. After that, send all 10 pyrite barrels at the boss and enjoy the loot.",
                    duration    = 0,
                    casttime    = 2.5,
                    cooldown    = 20,
                },
                {
                    icon        = "Interface\\Icons\\inv_ore_arcanite_01",
                    name        = "|cffF0E68COrbital Defenses (Hard Mode)|r",
                    description = "Before the fight, players can leave up colossal defense towers to activate Hard Mode. Each active tower grants Flame Leviathan a new, dangerous ability and increases its health.\n\n• |cffF0E68CFreya's Ward:|r Summons laser-firing plants.\n• |cffF0E68CHodir's Fury:|r Encases vehicles in blocks of ice.\n• |cffF0E68CMimiron's Inferno:|r Creates lines of intense fire across the arena.\n• |cffF0E68CThorim's Hammer:|r Fires powerful lightning bolts at vehicles.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 33118,
            name   = "Ignis the Furnace Master",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_fire_selfdestruct",
                    name        = "|cffFFA500Flame Jets|r",
                    description = "Ignis spews fire in a wide frontal cone, inflicting |cffFFA5008483 to 9517 Fire damage|r every second for |cff87CEEB5 seconds|r and interrupting spellcasting.\n\n|cffFFFFFFTips:|r\n• |cffB22222Avoid the Cone:|r Immediately move out of the frontal cone area when he begins to cast.\n• |cffF0E68CStay at Sides:|r Position at the boss's sides or rear to completely avoid this ability.",
                    duration    = 5,
                    casttime    = 2,
                    cooldown    = 25,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_immolation",
                    name        = "|cffFFA500Scorch|r",
                    description = "Ignis scorches the ground under his current melee target, creating a fire patch that deals |cffFFA5004713 to 5287 Fire damage|r every second.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBKite the Boss:|r The tank must slowly kite Ignis around the room to avoid standing in the fire patches.",
                    duration    = 60, -- Fire patch duration
                    casttime    = 0,
                    cooldown    = 20,
                },
                {
                    icon        = "Interface\\Icons\\spell_frostresistancetotem_01",
                    name        = "|cffADD8E6Shatter|r",
                    description = "Ignis shatters a |cffF0E68CBrittle|r Iron Construct, dealing |cffFFA50018850 to 21150 Fire damage|r to all players within 10 yards. The shatter also applies a debuff to Ignis, increasing his |cff87CEEBPhysical damage taken by 100%|r for 30 seconds.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CKite Constructs:|r Drag the molten constructs into the water pools to make them Brittle.\n• |cffF0E68CPosition Ignis:|r Move Ignis so his attacks shatter the Brittle constructs to apply the damage vulnerability.",
                    duration    = 30, -- Debuff on Ignis
                    casttime    = 0,
                    cooldown    = 0, -- Mechanic-based
                },
            },
        },
        {
            bossID = 33186,
            name   = "Razorscale",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\inv_spear_06",
                    name        = "|cffF0E68CHarpoon Turrets|r",
                    description = "Four turrets surround the arena. Players must repair them and use them to fire harpoons at Razorscale while she is in the air. |cff87CEEBTwo successful harpoon hits|r will ground her.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBCoordinate Firing:|r Fire both harpoons simultaneously to ground her.\n• |cff87CEEBProtect Operators:|r Adds will spawn and attack turret operators. The raid must protect them.",
                    duration    = 0,
                    casttime    = 5, -- Harpoon cast time
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_blueflamestrike",
                    name        = "|cffFFA500Devouring Flame|r",
                    description = "While in the air, Razorscale breathes a massive wall of blue fire across a large portion of the platform, inflicting |cffFFA50018850 to 21150 Fire damage|r to anyone caught in it.\n\n|cffFFFFFFTips:|r\n• |cffB22222Watch Her Position:|r Pay attention to where Razorscale is flying and move to a safe zone to avoid the breath.",
                    duration    = 0,
                    casttime    = 2.5,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\inv_misc_monsterscales_14",
                    name        = "|cffB22222Wing Buffet|r",
                    description = "While on the ground, Razorscale beats her wings, knocking back all players and interrupting spellcasting for |cff87CEEB2.5 seconds|r.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBPosition Carefully:|r Be mindful of your position to avoid being knocked into adds or fire.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 25,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_blueflamebreath",
                    name        = "|cffFFA500Flame Breath|r",
                    description = "Razorscale breathes fire in a frontal cone, dealing |cffFFA50017672 to 19828 Fire damage|r.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CAvoid the Front:|r Never stand in front of Razorscale during her ground phase unless you are the tank.",
                    duration    = 0,
                    casttime    = 2.5,
                    cooldown    = 15,
                },
            },
        },
        {
            bossID = 33293,
            name   = "XT-002 Deconstructor",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_shaman_earthquake",
                    name        = "|cffB22222Tympanic Tantrum|r",
                    description = "XT-002 smashes the ground in a rage, inflicting |cffB2222210% of max health as Physical damage|r every second for |cff87CEEB8 seconds|r to all players.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CHealing Cooldowns:|r This is a period of intense, unavoidable raid-wide damage. Use healing cooldowns and personal defensives to survive.",
                    duration    = 8,
                    casttime    = 0,
                    cooldown    = 60,
                },
                {
                    icon        = "Interface\\Icons\\inv_ingot_titansteel_dark",
                    name        = "|cff9400D3Gravity Bomb|r",
                    description = "Afflicts a player with a debuff that, after |cff87CEEB9 seconds|r, creates a |cff9400D3Gravity Well|r. The well pulls in nearby players and |cffF0E68CSrap Bots|r, dealing heavy Shadow damage.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBRun Away:|r If you get this debuff, run to the edge of the room to drop the well safely away from the raid.",
                    duration    = 9,
                    casttime    = 0,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\ability_paladin_infusionoflight",
                    name        = "|cffF0E68CLight Bomb|r",
                    description = "Afflicts a player with a debuff that, after |cff87CEEB9 seconds|r, creates a |cffF0E68CLight Well|r. It deals |cffF0E68C3299 to 3701 Nature damage|r to players within 10 yards.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBRun Away:|r Similar to Gravity Bomb, run this debuff away from the raid group.",
                    duration    = 9,
                    casttime    = 0,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\spell_brokenheart",
                    name        = "|cffF0E68CHeart of the Deconstructor (Hard Mode)|r",
                    description = "When XT-002's health is low, his heart becomes exposed. If the heart is destroyed, Hard Mode activates. XT-002 is healed to full, gains |cff87CEEB15% increased health|r and |cff87CEEB30% increased damage|r. He also gains the ability to summon |cff9400D3Void Zones|r and |cffF0E68CLife Sparks|r.\n\n|cffFFFFFFTips:|r\n• |cffB22222DPS Check:|r Hard mode is a significant DPS and healing check. Be prepared for a much tougher fight.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
    
        -- === The Antechamber ===
        {
            bossID = 32867,
            name   = "Steelbreaker", -- Member of Assembly of Iron
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_fire_felimmolation",
                    name        = "|cffFFA500Fusion Punch|r",
                    description = "A powerful punch that inflicts massive |cffFFA500Fire damage|r and applies a debuff that increases Fire damage taken by |cff87CEEB100%|r for |cff87CEEB20 seconds|r. Stacks.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CTank Swap:|r This ability forces a tank swap if Steelbreaker is not the first to be killed.",
                    duration    = 20,
                    casttime    = 0,
                    cooldown    = 15,
                },
                {
                    icon        = "Interface\\Icons\\spell_shaman_staticshock",
                    name        = "|cffF0E68CHigh Voltage|r",
                    description = "A damaging aura that inflicts |cffADD8E6Nature damage|r to all players every |cff87CEEB3 seconds|r.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBSustain Healing:|r This creates constant raid-wide pressure that increases as other council members die.",
                    duration    = 0, -- Aura
                    casttime    = 0,
                    cooldown    = 3,
                },
                 {
                    icon        = "Interface\\Icons\\spell_nature_electricsurge",
                    name        = "|cffADD8E6Overwhelming Power|r",
                    description = "If Steelbreaker is the last one alive (Hard Mode), he gains a buff that increases his damage by |cff87CEEB25%|r and periodically stuns all players with |cffADD8E6Static Disruption|r.\n\n|cffFFFFFFTips:|r\n• |cffB22222Burn Phase:|r This is a race against time. The raid will be taking massive damage and getting stunned. Use all cooldowns to finish him.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 32927,
            name   = "Runemaster Molgeim", -- Member of Assembly of Iron
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_holy_sealofwrath",
                    name        = "|cffADD8E6Rune of Power|r",
                    description = "Summons a blue rune on the ground. Players and council members standing in the rune deal |cff87CEEB50%|r additional damage.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CStand in Rune:|r Maximize your DPS by always standing in the Rune of Power.\n• |cff87CEEBMove Bosses Out:|r The tank must move any council members out of the rune immediately.",
                    duration    = 60,
                    casttime    = 1.5,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_runeblade",
                    name        = "|cffF0E68CShield of Runes|r",
                    description = "Molgeim channels a shield on an ally, absorbing |cff87CEEB50,000 damage|r and healing them for |cff87CEEB150,000|r if the channel completes.\n\n|cffFFFFFFTips:|r\n• |cffB22222Interrupt:|r This is a high-priority interrupt. It must not be allowed to complete.",
                    duration    = 10,
                    casttime    = 0,
                    cooldown    = 45,
                },
            },
        },
        {
            bossID = 32857,
            name   = "Stormcaller Brundir", -- Member of Assembly of Iron
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_lightning_lightningbolt01",
                    name        = "|cffADD8E6Overload|r",
                    description = "After a |cff87CEEB6 second|r channel, Brundir unleashes a massive burst of lightning, dealing |cffADD8E625000 Nature damage|r to anyone within 20 yards.\n\n|cffFFFFFFTips:|r\n• |cffB22222Run Away:|r When he begins channeling, run more than 20 yards away from him to avoid instant death.",
                    duration    = 6, -- Channel time
                    casttime    = 6,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\spell_shaman_lightningshield",
                    name        = "|cffADD8E6Lightning Tendrils|r",
                    description = "Brundir creates multiple patches of lightning on the floor that chase random players, dealing |cffADD8E63000 Nature damage|r per second to those who stand in them.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBAwareness:|r Be aware of your surroundings and constantly move to avoid the lightning patches.",
                    duration    = 20,
                    casttime    = 0,
                    cooldown    = 45,
                },
            },
        },
        {
            bossID = 32930,
            name   = "Kologarn",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_warrior_titansgrip",
                    name        = "|cffB22222Stone Grip|r",
                    description = "Kologarn's Right Arm grabs up to three players, squeezing them for |cffB222226000 Physical damage|r per second until the arm is destroyed. Players inside the grip have their armor reduced by |cff87CEEB100%|r.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CSwitch DPS:|r All damage dealers must immediately switch to the |cffF0E68CRight Arm|r to free the captured players.",
                    duration    = 0, -- Until arm is killed
                    casttime    = 0,
                    cooldown    = 40,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_mindflay",
                    name        = "|cff90EE90Focused Eyebeam|r",
                    description = "Kologarn fires beams from his eyes at a random player, dealing |cff90EE904000 Nature damage|r every second. This damage increases the longer the beam is on a single target.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBShare the Damage:|r Players need to quickly run into the beam's path to split the damage and reset the stacking damage buff.",
                    duration    = 10,
                    casttime    = 0,
                    cooldown    = 25,
                },
                {
                    icon        = "Interface\\Icons\\ability_rogue_sprint",
                    name        = "|cffB22222Sweeping Arm Smash|r",
                    description = "Kologarn sweeps one of his arms across the platform, dealing |cffB2222212000 Physical damage|r to everyone hit and reducing their armor.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBMelee Safety:|r Melee DPS can avoid this by standing on the small ledge near Kologarn's torso.",
                    duration    = 0,
                    casttime    = 2,
                    cooldown    = 20,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_mindsear",
                    name        = "|cffB22222Stone Shout|r",
                    description = "When an arm is destroyed, Kologarn cries out in pain, dealing raid-wide |cffB22222Physical damage|r.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CPrepare for Damage:|r Healers should be ready for this unavoidable burst of raid damage after an arm dies.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 33515,
            name   = "Auriaya",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_summonvoidwalker",
                    name        = "|cff9400D3Sentinel Blast|r",
                    description = "A powerful blast that inflicts |cff9400D330000 Shadow damage|r to a target and anyone within 5 yards.\n\n|cffFFFFFFTips:|r\n• |cffB22222Interrupt:|r This cast MUST be interrupted. Failure to do so will almost certainly kill the tank.",
                    duration    = 0,
                    casttime    = 3,
                    cooldown    = 15,
                },
                {
                    icon        = "Interface\\Icons\\ability_gouge",
                    name        = "|cffF0E68CSonic Screech|r",
                    description = "Auriaya lets out a screech, inflicting |cffB2222210000 Physical damage|r to all players and interrupting spellcasting for |cff87CEEB5 seconds|r.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBStop Casting:|r Watch for the cast bar and stop casting just before it finishes to avoid being locked out.",
                    duration    = 0,
                    casttime    = 1.5,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\ability_druid_feralcharge",
                    name        = "|cffF0E68CFeral Defender|r",
                    description = "Auriaya's most powerful guardian. When active, it will periodically use |cffF0E68CFeral Pounce|r on a random player, stunning them and dealing bleed damage.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBOff-Tank:|r An off-tank must pick up the Feral Defender immediately.\n• |cff87CEEBFocus DPS:|r The raid must prioritize killing the Feral Defender as quickly as possible.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\ability_hunter_beastsoother",
                    name        = "|cffF0E68CNine Lives (Hard Mode)|r",
                    description = "To activate Hard Mode, do NOT kill the Black Tabbies that Auriaya pulls with. Auriaya will periodically revive one Sanctum Sentry, up to nine times, making the fight progressively harder.\n\n|cffFFFFFFTips:|r\n• |cffB22222Add Control:|r Hard mode is all about controlling an increasing number of adds throughout the fight.",
                    duration    = 0,
                    casttime    = 3,
                    cooldown    = 45,
                },
            },
        },
    
        -- === The Keepers of Ulduar ===
        {
            bossID = 32906,
            name   = "Freya",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_holy_sunbeam",
                    name        = "|cffF0E68CSunbeam|r",
                    description = "Summons a beam of sunlight that follows a player, inflicting |cffF0E68C4163 to 4837 Nature damage|r per second to anyone in its path.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBKite the Beam:|r If targeted, move away from the raid and kite the beam so it doesn't hit others.\n• |cff87CEEBUse for Adds:|r The Sunbeam also instantly kills any |cff90EE90Detonating Lashers|r that touch it.",
                    duration    = 10,
                    casttime    = 2,
                    cooldown    = 25,
                },
                {
                    icon        = "Interface\\Icons\\ability_hunter_wildquiver",
                    name        = "|cff90EE90Summon Eonar's Gift|r",
                    description = "Freya summons waves of adds that must be dealt with. The three wave types are:\n• |cffF0E68CStorm Lasher Wave:|r Three lashers that cast Chain Lightning.\n• |cffF0E68CElemental Wave:|r Three elementals that must be killed at the same time or they respawn.\n• |cffF0E68CAncient Conservator Wave:|r One large tree that silences, roots, and heals itself.\n\n|cffFFFFFFTips:|r\n• |cffB22222Add Priority:|r Adds are always the top priority. The entire raid must switch to them immediately.",
                    duration    = 0,
                    casttime    = 3,
                    cooldown    = 60,
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_healingtouch",
                    name        = "|cff90EE90Attuned to Nature|r",
                    description = "Freya and her allies heal for |cff90EE904000 health|r every second while standing in the effect of a helpful mushroom. The mushroom also grants |cffF0E68C+50% damage|r.\n\n|cffFFFFFFTips:|r\n• |cffB22222Kill Mushrooms:|r A player must run over and destroy the helpful mushrooms as soon as they spawn.\n• |cff87CEEBInterrupt Heals:|r The |cffF0E68CAncient Conservator|r add also has a powerful heal that must be interrupted.",
                    duration    = 0, -- Aura
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_nature_sentinal",
                    name        = "|cffF0E68CLight of Eonar (Hard Mode)|r",
                    description = "To activate Hard Mode, the three Elders surrounding the area must be left alive. Each Elder empowers Freya with a unique, powerful buff, making the fight significantly harder.\n\n• |cffF0E68CElder Brightleaf:|r +60% magic damage for Freya and adds.\n• |cffF0E68CElder Ironbranch:|r +50% physical damage for Freya and adds.\n• |cffF0E68CElder Stonebark:|r +75% armor for Freya and adds.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 32845,
            name   = "Hodir",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_frost_frost",
                    name        = "|cffADD8E6Biting Cold|r",
                    description = "A constant pulsing aura that deals |cffADD8E63500 Frost damage|r every |cff87CEEB3 seconds|r and applies a stacking debuff that increases damage taken from this effect and reduces movement speed.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CFind a Fire:|r Freeing friendly NPCs will create |cffF0E68CToasty Fires|r. Standing near one removes the stacking debuff.",
                    duration    = 0, -- Aura
                    casttime    = 0,
                    cooldown    = 3,
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_frozencore",
                    name        = "|cffADD8E6Flash Freeze|r",
                    description = "Hodir attempts to encase everyone in a block of ice. After a |cff87CEEB9 second cast|r, anyone not moving or under a protective buff will be frozen solid.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBKeep Moving:|r Simply moving will prevent you from being frozen.\n• |cff87CEEBUse Buffs:|r The |cffF0E68CStarlight|r buff from a freed NPC also grants immunity to this effect.",
                    duration    = 0,
                    casttime    = 9,
                    cooldown    = 45,
                },
                {
                    icon        = "Interface\\Icons\\spell_frost_iceshard",
                    name        = "|cffADD8E6Icicles|r",
                    description = "Icicles fall from the ceiling at marked locations, dealing |cffADD8E6Frost damage|r. One of these icicles will contain a friendly NPC.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBAvoid Circles:|r Blue circles on the ground indicate where the icicles will land. Move out of them.\n• |cffF0E68CBreak out NPCs:|r The raid must quickly destroy the correct icicle to free the trapped NPC, who will then provide a powerful buff.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 30, -- Approx
                },
                {
                    icon        = "Interface\\Icons\\inv_box_03",
                    name        = "|cffF0E68CRare Cache of Hodir (Hard Mode)|r",
                    description = "To complete Hard Mode, Hodir must be defeated in under |cff87CEEB3 minutes|r. Doing so awards an extra chest with superior loot.\n\n|cffFFFFFFTips:|r\n• |cffB22222Maximize Buffs:|r The key to hard mode is freeing all NPCs as quickly as possible to gain all three raid buffs (|cffF0E68CToasty Fire|r, |cffF0E68CStarlight|r, |cffF0E68CStorm Power|r) and maximize DPS.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 180,
                },
            },
        },
        {
            bossID = 33350,
            name   = "Mimiron",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_golemstormbolt",
                    name        = "|cffADD8E6P1: Plasma Blast|r",
                    description = "Phase 1 (Leviathan MK II): Mimiron charges a powerful blast, dealing |cffADD8E6100,000 Arcane damage|r to his primary target. Has a long, obvious cast time.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CDefensive Cooldown:|r The tank must use a major defensive cooldown to survive.",
                    duration    = 0,
                    casttime    = 4,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\inv_gizmo_rocketlauncher",
                    name        = "|cffFFA500P2: Rocket Strike|r",
                    description = "Phase 2 (VX-001): A rocket flies into the air and targets a location on the ground, marked by a large red circle. Inflicts massive |cffFFA500Fire damage|r on impact.\n\n|cffFFFFFFTips:|r\n• |cffB22222Move Out:|r Immediately run out of the red targeting circle when it appears. It will one-shot anyone caught inside.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 10,
                },
                {
                    icon        = "Interface\\Icons\\ability_mage_netherwindpresence",
                    name        = "|cffF0E68CP3: Magnetic Field|r",
                    description = "Phase 3 (Aerial Command Unit): The tank must pick up a magnetic core, which causes the ACU to follow them. This allows the melee DPS to attack the boss.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBKite Carefully:|r The tank must kite the ACU so that ranged DPS can avoid the mines dropped by Assault Bots.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_selfdestruct",
                    name        = "|cffFFA500P4: Emergency Mode (Hard Mode)|r",
                    description = "Hard Mode is activated by pressing the big red button at the start. This initiates |cffF0E68CEmergency Mode|r. All parts gain |cff87CEEB30%|r extra health and damage, and a constant firestorm engulfs the room, leaving very little safe space by the end of the |cff87CEEB8-minute|r enrage timer.\n\n|cffFFFFFFTips:|r\n• |cffB22222Extreme DPS Check:|r This is one of the hardest DPS checks in the game. All four phases must be executed perfectly and quickly.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 480,
                },
            },
        },
        {
            bossID = 32865,
            name   = "Thorim",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_warrior_secondwind",
                    name        = "|cffF0E68CThe Gauntlet Run|r",
                    description = "The fight begins with one group fighting mobs in the arena while another group runs a gauntlet to reach Thorim's perch. The gauntlet group must defeat several mini-bosses to open the final gate.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBSpeed is Key:|r The gauntlet must be completed quickly to activate Hard Mode.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\ability_thorim_unbalancingstrike",
                    name        = "|cffB22222Unbalancing Strike|r",
                    description = "A mighty blow that deals |cffB22222200% weapon damage|r and applies a stacking debuff that reduces the target's armor by |cff87CEEB20%|r for |cff87CEEB20 seconds|r.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CTank Swap:|r This ability forces a tank swap.",
                    duration    = 20,
                    casttime    = 0,
                    cooldown    = 20,
                },
                {
                    icon        = "Interface\\Icons\\spell_shaman_lightningshield",
                    name        = "|cffADD8E6Lightning Charge|r",
                    description = "Thorim charges himself with lightning, causing his next attack to deal an additional |cffADD8E620000 Nature damage|r. This effect can be dispelled.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CDispel Immediately:|r This is a high-priority magic effect to dispel from Thorim before his next attack lands.",
                    duration    = 30,
                    casttime    = 1,
                    cooldown    = 25,
                },
                 {
                    icon        = "Interface\\Icons\\spell_frost_wisp",
                    name        = "|cffF0E68CSif's Presence (Hard Mode)|r",
                    description = "If the gauntlet is completed quickly, Sif will remain to fight alongside Thorim, activating Hard Mode. She attacks with |cffADD8E6Frostbolts|r and casts |cffADD8E6Frost Nova|r. Thorim also gains |cff87CEEB15%|r increased health and damage.\n\n|cffFFFFFFTips:|r\n• |cffB22222Do Not Attack Sif:|r Sif cannot be targeted. The raid must simply deal with her additional mechanics while killing Thorim.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
    
        -- === Descent into Madness ===
        {
            bossID = 33271,
            name   = "General Vezax",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_antimagicshell",
                    name        = "|cff9400D3Aura of Despair|r",
                    description = "A constant aura that prevents all forms of mana regeneration from normal abilities and consumables. Also reduces melee attack speed by |cff87CEEB20%|r.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CManage Mana:|r The only way to restore mana is by destroying |cff90EE90Saronite Vapors|r and standing in the green gas. However, this buffs Vezax's damage.",
                    duration    = 0, -- Aura
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_shadowcrash",
                    name        = "|cff9400D3Shadow Crash|r",
                    description = "Vezax launches a shadow missile at a ranged player's location. On impact, it deals |cff9400D311310 to 12690 Shadow damage|r and leaves a void zone that increases spell damage but also spell cost.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBMove Away:|r Move away from the targeted location. Do not stand in the resulting black pool.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 15,
                },
                {
                    icon        = "Interface\\Icons\\ability_warlock_curseofshadow",
                    name        = "|cff9400D3Mark of the Faceless|r",
                    description = "Places a curse on a player, causing them to leech |cff87CEEB5000 health|r every second from nearby allies for |cff87CEEB10 seconds|r. Also heals Vezax.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBRun Out:|r The targeted player must quickly run away from the raid to avoid draining their health.",
                    duration    = 10,
                    casttime    = 0,
                    cooldown    = 20,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_mindflay",
                    name        = "|cffF0E68CSaronite Animus (Hard Mode)|r",
                    description = "To activate Hard Mode, do NOT kill any Saronite Vapors. After eight vapors have spawned, they will merge into the |cffF0E68CSaronite Animus|r, a powerful add with a raid-wide shadow DoT. Vezax becomes immune until the Animus is killed.\n\n|cffFFFFFFTips:|r\n• |cffB22222Extreme Healing Check:|r The |cff9400D3Profound Darkness|r aura from the Animus deals massive ticking damage and is a major healing test.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 33288,
            name   = "Yogg-Saron",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\spell_shadow_mindsteal",
                    name        = "|cff9400D3Sanity|r",
                    description = "The central mechanic of the fight. Players start with |cff87CEEB100 Sanity|r. Various abilities from Yogg-Saron and his minions will drain Sanity. Reaching |cff87CEEB0 Sanity|r causes you to be mind-controlled permanently.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CMechanics are Key:|r Avoiding mechanics is the primary way to preserve Sanity. Sanity can be restored by standing near a friendly Keeper.",
                    duration    = 0, -- Resource
                    casttime    = 0,
                    cooldown    = 0,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_demonicempathy",
                    name        = "|cff9400D3P2: Lunatic Gaze|r",
                    description = "During Phase 2 & 3, Yogg-Saron channels a gaze that drains |cff87CEEB4% Sanity|r per second for |cff87CEEB4 seconds|r from any player facing him.\n\n|cffFFFFFFTips:|r\n• |cffB22222Turn Away:|r As soon as he begins to cast, turn your character to face away from Yogg-Saron to avoid all sanity loss.",
                    duration    = 4,
                    casttime    = 2,
                    cooldown    = 30,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_shadetruesight",
                    name        = "|cffF0E68CP2: Enter the Mind|r",
                    description = "During Phase 2, portals open into Yogg-Saron's mind. Players must enter, witness one of three visions, and attack the |cffF0E68CBrain of Yogg-Saron|r. While inside, players must not face the laughing skulls.\n\n|cffFFFFFFTips:|r\n• |cff87CEEBPortal Team:|r A designated group must enter the portals to progress the fight.\n• |cff87CEEBAvoid Illusions:|r Face away from the skulls on the walls to avoid taking heavy damage and losing sanity.",
                    duration    = 60, -- Time inside mind
                    casttime    = 0,
                    cooldown    = 90,
                },
                {
                    icon        = "Interface\\Icons\\ability_rogue_deafening",
                    name        = "|cffB22222P3: Deafening Roar|r",
                    description = "Yogg-Saron roars, dealing |cffB222228000 Physical damage|r and silencing all players for |cff87CEEB4 seconds|r. Reduces Yogg-Saron's damage taken by |cff87CEEB20%|r for each Immortal Guardian still alive.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CKill Guardians:|r All Immortal Guardians must be killed before this cast finishes, otherwise Yogg-Saron will be nearly immune to damage.",
                    duration    = 0,
                    casttime    = 3,
                    cooldown    = 60,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_charm",
                    name        = "|cffF0E68CAlone in the Darkness (Hard Mode)|r",
                    description = "Hard Mode is determined by how many Keepers you ask for help. The hardest version, |cffF0E68CAlone in the Darkness|r, involves fighting him with no Keepers assisting. This makes players unable to replenish Sanity and gives Yogg-Saron powerful abilities, most notably |cff9400D3Empowered Shadows|r which heal him.\n\n|cffFFFFFFTips:|r\n• |cffB22222Absolute Perfection:|r This is considered one of the most difficult encounters ever designed in WoW. It requires flawless execution from every player.",
                    duration    = 0,
                    casttime    = 0,
                    cooldown    = 0,
                },
            },
        },
        {
            bossID = 32871,
            name   = "Algalon the Observer",
            rare   = false,
            flat   = itemdir,
            spells = {
                {
                    icon        = "Interface\\Icons\\ability_warrior_decisivestrike",
                    name        = "|cffADD8E6Phase Punch|r",
                    description = "A powerful punch that deals |cffADD8E69000 Physical damage|r and applies a stacking debuff. At |cff87CEEB5 stacks|r, the target is phased out into the |cff9400D3Celestial Realm|r for |cff87CEEB10 seconds|r, where they will be attacked by adds.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CTank Swap:|r Tanks must taunt off each other at 4 stacks to manage the debuff.",
                    duration    = 45,
                    casttime    = 0,
                    cooldown    = 15,
                },
                {
                    icon        = "Interface\\Icons\\spell_fire_burnout",
                    name        = "|cffFFA500Cosmic Smash|r",
                    description = "Algalon summons a meteor to strike a player's location, dealing massive |cffFFA50045000 Fire damage|r to anyone within 6 yards and leaving a |cff9400D3void zone|r on the ground.\n\n|cffFFFFFFTips:|r\n• |cffB22222Move Out:|r Move out of the targeted red circle. The damage is lethal.",
                    duration    = 0,
                    casttime    = 4,
                    cooldown    = 25,
                },
                {
                    icon        = "Interface\\Icons\\spell_arcane_starfire",
                    name        = "|cffFFA500Big Bang|r",
                    description = "After a long |cff87CEEB8 second|r cast, Algalon unleashes a massive explosion, dealing |cffFFA50076000 to 84000 Fire damage|r to all players.\n\n|cffFFFFFFTips:|r\n• |cffF0E68CEnter Black Holes:|r To survive, pop a defensive, entering a black hole will reset the boss if solo.",
                    duration    = 0,
                    casttime    = 8,
                    cooldown    = 90,
                },
                {
                    icon        = "Interface\\Icons\\spell_shadow_unholyfrenzy",
                    name        = "|cffB22222Berserk|r",
                    description = "After |cff87CEEB6 minutes|r, Algalon will deem the planet unworthy and initiate planetary re-origination, instantly killing the entire raid.\n\n|cffFFFFFFTips:|r\n• |cffB22222Hard Enrage:|r This is an absolute hard enrage timer. The fight must be completed within 6 minutes, making it an intense DPS race from start to finish.",
                    duration    = 0,
                    casttime    = 1,
                    cooldown    = 360,
                },
            },
        },
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
    zoneId = 39561,
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
    --zoneId = 35448,
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

-- ################# VANILLA ZONES ##########
table.insert(Journal.djDungeons, {
    name = "Elwynn Forest", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ElywnnForest.blp", -- placeholder
    bosses = {
        {
            bossID = 472,
            name   = "Fedfennel",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 100,
            name   = "Gruff Swiftbite",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 99,
            name   = "Morgaine the Sly",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 471,
            name   = "Mother Fang",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 79,
            name   = "Narg the Taskmaster",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 61,
            name   = "Thuros Lightfingers",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {60,80,727,792,793,794,795,796,797,798,799,826,843,844,845,846,983,1171,1173,1182,1183,1201,1211,1287,1359,1360,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1394,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1839,1840,1843,1844,1917,1926,2073,2075,2088,2117,2119,2120,2121,2122,2123,2124,2125,2126,2127,2129,2140,2186,2210,2211,2212,2213,2214,2215,2237,2238,2249,2300,2303,2308,2309,2310,2314,2315,2316,2379,2380,2381,2383,2384,2385,2392,2393,2394,2395,2396,2397,2568,2569,2578,2580,2582,2583,2584,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2690,2691,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2971,2972,2975,2976,2978,2979,2980,3000,3070,3192,3200,3207,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3307,3308,3312,3314,3363,3365,3370,3373,3374,3375,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3599,3600,3602,3603,3641,3642,3643,3644,3649,3650,3651,3652,3653,3654,3719,3835,3836,3842,3844,3848,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4561,4562,4564,4566,4569,4570,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4767,4768,4771,4777,4778,4794,4795,4796,4817,4818,5274,5540,5542,5739,5766,5961,5962,5964,5966,6040,6070,6076,6078,6084,6085,6095,6147,6148,6201,6202,6203,6214,6215,6238,6241,6266,6267,6268,6269,6336,6337,6350,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6542,6543,6549,6550,6555,6556,6558,6979,6980,6983,6985,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7109,7281,7282,7285,7348,7350,7351,7374,7377,7378,7387,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8175,8176,8178,8185,8189,8191,8193,8197,8198,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,11191,11192,11475,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14086,14087,14088,14089,14090,14091,14093,14094,14095,14097,14098,14099,14100,14101,14102,14103,14106,14108,14110,14111,14112,14113,14115,14116,14128,14130,14132,14141,14142,14143,14144,14365,15003,15004,15005,15006,15007,15008,15009,15010,15011,15013,15015,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15297,15298,15299,15300,15301,15302,15303,15309,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15490,15491,15492,15495,15895,15925,15932,15933,15944,15969,15970,16605,17184,17186,29201,29202,29203,38513,45626},
})

table.insert(Journal.djDungeons, {
    name = "Westfall", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Westfall.blp", -- placeholder
    bosses = {
        {
            bossID = 520,
            name   = "Brack",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 596,
            name   = "Brainwashed Noble",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 573,
            name   = "Foe Reaper 4000",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 572,
            name   = "Leprithus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 599,
            name   = "Marisa du'Paige",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1424,
            name   = "Master Digger",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 506,
            name   = "Sergeant Brashclaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 519,
            name   = "Slark",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 462,
            name   = "Vultros",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,710,720,727,789,790,816,820,821,826,827,832,843,844,845,846,890,935,1121,1154,1172,1190,1214,1218,1220,1296,1300,1314,1364,1369,1376,1391,1394,1405,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1440,1446,1448,1460,1469,1473,1479,1480,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1557,1561,1566,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1843,1844,1925,1927,1928,1929,1934,1936,1943,1944,1945,1958,1959,2011,2041,2042,2059,2072,2073,2074,2075,2077,2078,2079,2087,2089,2140,2165,2166,2167,2168,2194,2203,2204,2212,2213,2214,2215,2216,2217,2219,2220,2221,2222,2235,2236,2327,2632,2635,2642,2643,2644,2645,2646,2648,2652,2656,2800,2819,2879,2911,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3188,3192,3193,3195,3196,3198,3199,3200,3201,3202,3203,3205,3206,3207,3211,3212,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3344,3365,3370,3373,3374,3375,3376,3377,3378,3379,3380,3381,3511,3578,3597,3598,3641,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3656,3740,4036,4049,4290,4434,4454,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4658,4659,4661,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4788,4789,4949,4998,4999,5001,5110,5944,5971,6087,6094,6179,6180,6205,6266,6267,6268,6269,6336,6337,6378,6379,6380,6381,6382,6383,6387,6393,6394,6395,6397,6398,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6604,6605,6608,6611,6612,6613,6614,6615,7108,7109,7350,7351,7415,7554,7558,7608,8178,8350,8748,9607,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9822,9829,9831,9838,10287,10405,10407,11965,11967,11968,11969,11981,11982,11983,11984,11993,11994,11995,12006,12007,12008,12052,12053,12054,12295,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13031,13041,14025,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14179,14181,14182,14185,14186,14187,14188,14194,14195,14364,14365,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14400,14402,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14580,14582,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14752,14754,14755,14756,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15132,15210,15211,15212,15222,15223,15224,15230,15241,15248,15249,15259,15268,15269,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15340,15347,15348,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15532,15535,15537,15547,15891,15893,15894,15895,15912,15925,15926,15927,15932,15933,15944,15945,15946,15947,15969,15970,15971,15972,15974},
})
table.insert(Journal.djDungeons, {
    name = "Duskwood", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Duskwood.blp", -- placeholder
    bosses = {
        {
            bossID = 771,
            name   = "Commander Felstrom",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 507,
            name   = "Fenros",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 503,
            name   = "Lord Malathrom",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 521,
            name   = "Lupos",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 574,
            name   = "Naraxis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 534,
            name   = "Nefaru",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },

        {
            bossID = 14890,
            name   = "Taerar",
            rare   = false,
            flat   = itemdir,
            spells = {},
        },

    },
    items = {200,201,202,203,720,727,789,790,791,863,864,865,885,886,890,897,911,914,920,935,936,1076,1077,1121,1131,1203,1207,1280,1282,1299,1315,1351,1406,1421,1427,1455,1457,1458,1459,1461,1462,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1522,1523,1547,1639,1717,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1979,1988,1990,1993,1996,1997,1998,2011,2013,2014,2015,2017,2018,2020,2021,2033,2034,2043,2044,2059,2072,2073,2075,2077,2078,2079,2080,2100,2140,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2175,2194,2214,2215,2216,2217,2219,2220,2221,2222,2226,2227,2232,2233,2236,2276,2277,2278,2446,2564,2565,2566,2620,2621,2632,2643,2648,2721,2800,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2877,2878,2879,2902,2906,2911,2912,2951,2953,2954,2957,2958,2961,2962,2964,2965,2966,2967,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3018,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3192,3193,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3207,3210,3211,3212,3213,3227,3306,3310,3313,3315,3341,3345,3360,3374,3375,3376,3377,3378,3379,3380,3381,3429,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3559,3560,3569,3591,3592,3597,3598,3643,3645,3647,3651,3652,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3835,3836,3842,3844,3848,3936,3937,3938,3939,3940,3941,3942,3943,3961,3962,3963,3964,3965,3966,3967,3968,3986,3989,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4038,4039,4040,4041,4042,4043,4048,4049,4050,4051,4052,4054,4055,4057,4059,4064,4065,4066,4067,4071,4072,4073,4074,4075,4076,4077,4078,4368,4385,4448,4462,4464,4465,4476,4477,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4661,4677,4678,4683,4684,4689,4690,4694,4695,4696,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4726,4727,4729,4731,4732,4797,4798,4799,4800,4816,4827,4828,4829,4836,4837,4838,4998,4999,5001,5002,5003,5007,5009,5266,5267,5540,5624,5755,6040,6204,6214,6223,6266,6267,6268,6269,6336,6337,6350,6378,6379,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6412,6413,6416,6417,6418,6419,6420,6421,6422,6506,6507,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6521,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6832,7106,7107,7108,7110,7111,7330,7331,7344,7350,7351,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7431,7432,7433,7434,7435,7436,7437,7438,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7492,7517,7518,7527,7537,7554,7557,7558,7608,7609,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8106,8112,8113,8119,8123,8126,8128,8129,8130,8131,8132,8133,8134,8178,8246,8247,8248,8249,8250,8251,8253,8254,8255,8256,8257,8259,8260,8261,8262,8263,8264,8266,8267,8268,8269,8270,8272,8274,8280,8282,8283,8286,8288,8289,8290,8292,8296,8297,8299,8300,8301,8302,8303,8305,8306,8307,8308,8309,8310,8311,8313,8314,8315,8316,8317,8319,8746,8747,8748,8749,8750,8751,9382,9385,9395,9402,9405,9435,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9875,9877,9879,9886,9890,9891,9896,9898,9936,9939,9940,9941,9942,9943,9944,9946,9948,9950,9952,9953,9954,9955,9957,9958,9964,9965,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10080,10081,10082,10083,10084,10085,10086,10093,10096,10098,10099,10101,10102,10103,10104,10105,10107,10108,10109,10110,10112,10118,10120,10122,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10171,10172,10173,10174,10175,10176,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10203,10204,10205,10207,10208,10209,10210,10211,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10225,10226,10227,10228,10230,10231,10232,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10278,10279,10280,10281,10287,10288,10289,10362,10363,10364,10365,10366,10367,10368,10369,10371,10372,10373,10374,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10404,10405,10406,10407,10408,10409,10500,10502,10503,10504,10508,11265,11965,11967,11968,11969,11970,11971,11975,11976,11977,11978,11979,11980,11981,11982,11983,11984,11985,11986,11989,11990,11991,11992,11993,11994,11995,11996,11997,12001,12002,12004,12005,12006,12007,12008,12009,12010,12013,12014,12016,12017,12019,12020,12024,12025,12026,12027,12028,12029,12030,12034,12036,12039,12040,12044,12046,12047,12048,12052,12053,12054,12055,12057,12058,12247,12249,12259,12405,12406,12408,12409,12410,12414,12773,12775,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13000,13001,13002,13003,13004,13005,13006,13007,13008,13009,13010,13011,13012,13013,13015,13018,13024,13025,13030,13031,13033,13036,13039,13040,13041,13043,13045,13046,13047,13048,13049,13052,13055,13059,13065,13066,13067,13070,13072,13073,13075,13076,13077,13079,13081,13083,13084,13085,13087,13089,13091,13093,13094,13096,13097,13099,13103,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13116,13118,13119,13120,13121,13123,13124,13125,13126,13127,13129,13130,13131,13133,13134,13135,13139,13144,14025,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14217,14218,14219,14221,14222,14223,14224,14226,14229,14231,14232,14235,14236,14239,14265,14267,14271,14274,14275,14277,14278,14279,14281,14282,14283,14285,14286,14289,14290,14291,14292,14293,14294,14295,14296,14299,14300,14301,14303,14304,14306,14307,14308,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14364,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14418,14419,14420,14426,14427,14434,14437,14441,14442,14443,14444,14445,14447,14448,14450,14451,14452,14453,14454,14455,14456,14457,14458,14460,14461,14462,14463,14464,14465,14551,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14593,14594,14595,14596,14602,14607,14608,14655,14658,14661,14662,14664,14666,14667,14668,14669,14670,14672,14673,14674,14676,14677,14680,14681,14682,14683,14684,14685,14686,14687,14688,14722,14723,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14771,14773,14779,14780,14788,14789,14790,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14807,14808,14809,14810,14811,14812,14814,14815,14816,14817,14844,14846,14847,14848,14849,14850,14851,14852,14854,14855,14856,14857,14858,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14912,14913,14915,14916,14919,14920,14921,14922,14923,14926,14927,14928,14929,14931,14932,14933,14935,14936,14937,14948,14952,14953,14954,14957,14959,14960,14961,14962,14963,14965,14966,14968,14969,14970,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15014,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15153,15154,15155,15160,15170,15171,15174,15175,15176,15177,15180,15181,15182,15183,15184,15186,15187,15189,15190,15192,15193,15194,15195,15210,15211,15212,15213,15216,15217,15219,15220,15221,15222,15223,15224,15225,15226,15227,15228,15229,15230,15231,15232,15233,15236,15237,15238,15239,15240,15241,15242,15243,15245,15246,15247,15248,15249,15250,15252,15253,15254,15256,15257,15258,15259,15260,15263,15265,15266,15267,15268,15269,15272,15273,15274,15275,15276,15278,15279,15280,15282,15283,15288,15289,15291,15294,15295,15296,15305,15307,15308,15310,15311,15312,15313,15323,15325,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15360,15361,15362,15364,15365,15367,15368,15381,15384,15385,15387,15388,15389,15392,15393,15394,15395,15425,15426,15427,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15488,15493,15494,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15568,15570,15571,15572,15573,15575,15576,15577,15579,15581,15590,15594,15595,15598,15621,15622,15623,15627,15630,15631,15633,15634,15636,15637,15638,15639,15641,15642,15643,15644,15645,15646,15647,15649,15652,15653,15654,15656,15658,15659,15660,15661,15664,15665,15666,15667,15668,15669,15670,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15891,15892,15893,15894,15912,15918,15925,15926,15927,15928,15929,15931,15932,15933,15934,15935,15936,15937,15938,15939,15940,15941,15942,15943,15945,15946,15947,15962,15963,15965,15966,15967,15968,15971,15972,15973,15974,15975,15976,15977,15982,15983,15986,15987,15988,15989,15990,15991,15995,15999,16008,17007,17192,18339,18343,18672,18674,18679,20577,20579,20580,20581,20582,20615,20616,20617,20618,20619,20631,20632,20633,20634,29201,29202,29203,45631},
})
table.insert(Journal.djDungeons, {
    name = "Redridge Mountains", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-RedridgeMountain.blp", -- placeholder
    bosses = {
        {
            bossID = 14273,
            name   = "Boulderheart",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 616,
            name   = "Chatter",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 584,
            name   = "Kazon",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14271,
            name   = "Ribchaser",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 947,
            name   = "Rohh the Silent",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14269,
            name   = "Seeker Aqualon",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14272,
            name   = "Snarlflare",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14270,
            name   = "Squiddic",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,720,727,789,790,791,886,890,897,911,920,935,1076,1077,1121,1211,1213,1214,1218,1219,1220,1270,1275,1276,1287,1296,1299,1300,1302,1303,1304,1310,1317,1319,1351,1406,1421,1427,1440,1445,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1717,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1849,1850,1852,1853,2011,2013,2017,2034,2058,2059,2072,2073,2075,2077,2078,2079,2140,2156,2158,2159,2160,2175,2194,2214,2215,2216,2217,2219,2220,2221,2222,2227,2232,2233,2236,2278,2445,2566,2632,2643,2648,2800,2819,2878,2879,2910,2911,2957,2958,2961,2962,2964,2965,2966,2967,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3186,3192,3193,3195,3196,3198,3199,3201,3202,3203,3204,3205,3206,3207,3210,3211,3212,3213,3227,3229,3231,3283,3288,3291,3292,3302,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3374,3375,3376,3377,3378,3379,3380,3381,3400,3429,3431,3555,3569,3591,3592,3597,3598,3643,3645,3647,3651,3652,3653,3654,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4036,4037,4049,4051,4064,4072,4446,4447,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4661,4677,4678,4680,4681,4683,4684,4687,4689,4690,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4781,4782,4786,4790,4792,4793,4794,4795,4796,4820,4821,4822,4998,4999,5001,5002,5110,6092,6093,6266,6267,6268,6269,6336,6337,6378,6379,6380,6381,6382,6383,6386,6387,6388,6393,6394,6395,6397,6398,6399,6506,6507,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6611,6612,6613,6614,6615,6617,6970,7108,7350,7351,7356,7415,7419,7554,7558,7608,8178,8746,8747,8748,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9821,9822,9827,9829,9831,9837,9838,10287,10404,10405,10407,11965,11967,11968,11969,11981,11982,11983,11984,11993,11994,11995,12006,12007,12008,12047,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13048,13049,13079,13094,13097,13099,13106,13114,13131,14025,14096,14097,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14191,14194,14195,14197,14364,14365,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14400,14402,14406,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14580,14582,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14752,14754,14755,14756,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15132,15135,15210,15211,15212,15222,15223,15224,15230,15241,15242,15248,15249,15259,15268,15269,15298,15300,15301,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15340,15341,15342,15343,15347,15348,15351,15480,15481,15485,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15531,15532,15535,15537,15538,15539,15545,15547,15891,15893,15894,15912,15925,15926,15927,15932,15933,15945,15946,15947,15970,15971,15972,15973,15974,17188},
})
table.insert(Journal.djDungeons, {
    name = "Stranglethorn Vale", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-StranglethornVale.blp", -- placeholder
    bosses = {
        {
            bossID = 14487,
            name   = "Gluggle",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 11383,
            name   = "High Priestess Hai'watna",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14491,
            name   = "Kurmokk",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2541,
            name   = "Lord Sakrasis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14490,
            name   = "Rippa",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14488,
            name   = "Roloch",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1552,
            name   = "Scale Belly",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14492,
            name   = "Verifonix",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,720,789,790,791,812,863,864,865,866,867,868,873,890,936,940,943,1121,1169,1203,1204,1207,1280,1447,1521,1522,1523,1604,1607,1608,1613,1624,1625,1639,1640,1659,1664,1677,1679,1714,1715,1716,1717,1718,1720,1721,1722,1739,1744,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1768,1769,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1789,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1988,1990,1991,1994,1998,2011,2059,2072,2077,2080,2143,2156,2158,2159,2160,2194,2219,2220,2221,2222,2236,2276,2277,2278,2300,2303,2308,2309,2310,2314,2315,2316,2417,2418,2419,2420,2421,2422,2429,2431,2432,2434,2435,2437,2438,2440,2448,2463,2464,2465,2467,2468,2469,2565,2568,2569,2578,2580,2582,2583,2584,2620,2623,2624,2721,2800,2802,2815,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2877,2878,2879,2911,2912,2951,2955,2981,2982,2985,2986,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3075,3184,3185,3186,3187,3193,3197,3198,3199,3201,3202,3203,3206,3208,3210,3212,3378,3379,3380,3381,3430,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3587,3588,3591,3592,3593,3594,3597,3598,3647,3655,3656,3719,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3835,3836,3842,3844,3848,3889,3890,3891,3892,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3985,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4069,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4107,4108,4109,4112,4113,4114,4115,4117,4118,4119,4120,4121,4122,4123,4124,4125,4126,4128,4129,4130,4131,4132,4133,4134,4135,4136,4137,4138,4139,4140,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4478,4568,4614,4661,4694,4696,4697,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,4777,4778,4998,4999,5001,5002,5003,5007,5009,5011,5028,5029,5215,5216,5266,5540,5542,5608,5624,5739,5755,5766,5961,5962,5964,5966,6040,6214,6238,6241,6350,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6723,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7110,7111,7112,7113,7281,7282,7285,7330,7331,7332,7348,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7374,7377,7378,7387,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7519,7520,7521,7522,7523,7524,7525,7526,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7558,7608,7609,7610,7611,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8080,8081,8082,8083,8084,8085,8086,8107,8108,8109,8110,8111,8112,8114,8115,8116,8117,8118,8120,8121,8122,8123,8124,8125,8127,8128,8129,8130,8132,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8175,8176,8185,8189,8191,8193,8194,8196,8197,8198,8199,8245,8246,8247,8249,8250,8251,8252,8253,8254,8256,8258,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8275,8276,8277,8278,8279,8280,8281,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8304,8305,8306,8307,8308,8309,8310,8311,8312,8314,8315,8316,8317,8318,8319,8320,8345,8349,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9385,9395,9405,9433,9434,9435,9776,9778,9780,9781,9782,9783,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9941,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9954,9956,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10057,10060,10061,10062,10064,10065,10066,10067,10068,10069,10070,10071,10073,10074,10076,10077,10078,10079,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10133,10134,10136,10137,10138,10140,10144,10145,10146,10147,10148,10149,10154,10155,10156,10159,10161,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10210,10211,10212,10213,10214,10216,10217,10219,10221,10222,10223,10224,10225,10226,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10244,10245,10249,10256,10258,10267,10275,10276,10277,10278,10279,10280,10281,10282,10288,10289,10362,10363,10364,10365,10369,10370,10371,10372,10373,10374,10375,10376,10377,10379,10380,10381,10383,10387,10391,10404,10405,10406,10407,10408,10409,10545,10721,10724,10726,11469,11965,11967,11968,11969,11970,11971,11972,11973,11974,11975,11976,11977,11978,11979,11981,11982,11983,11984,11985,11986,11987,11988,11990,11991,11993,11994,11995,11996,11997,11998,11999,12002,12004,12006,12007,12008,12009,12010,12011,12012,12013,12014,12015,12016,12019,12020,12022,12023,12025,12026,12028,12029,12030,12031,12032,12034,12035,12039,12040,12042,12043,12045,12046,12047,12052,12053,12054,12055,12056,12057,12185,12248,12251,12252,12257,12259,12405,12406,12408,12409,12410,12414,12773,12775,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13002,13003,13004,13005,13007,13008,13010,13011,13012,13013,13014,13018,13021,13022,13024,13025,13026,13027,13029,13031,13033,13034,13036,13038,13039,13040,13041,13042,13043,13045,13047,13048,13049,13052,13055,13056,13058,13059,13064,13067,13068,13070,13071,13073,13074,13076,13077,13079,13081,13082,13084,13087,13088,13091,13093,13094,13095,13097,13099,13100,13101,13102,13103,13105,13106,13108,13110,13111,13112,13114,13115,13117,13118,13119,13120,13121,13122,13124,13126,13127,13128,13129,13130,13131,13132,13134,13135,13138,13144,13145,13199,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,14168,14170,14171,14172,14173,14175,14178,14180,14183,14184,14186,14189,14190,14191,14192,14193,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14266,14268,14269,14270,14271,14272,14273,14275,14276,14277,14279,14280,14281,14283,14284,14287,14288,14292,14293,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14319,14320,14321,14323,14324,14325,14327,14330,14331,14337,14379,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14442,14443,14444,14445,14446,14447,14448,14449,14451,14452,14453,14454,14455,14457,14458,14459,14465,14549,14551,14552,14578,14579,14581,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14663,14664,14665,14667,14668,14670,14671,14672,14673,14674,14675,14676,14677,14678,14682,14683,14684,14688,14751,14753,14754,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14795,14796,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14810,14813,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14847,14849,14850,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14863,14864,14865,14868,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14905,14906,14907,14908,14909,14910,14911,14913,14914,14915,14916,14917,14918,14919,14921,14922,14924,14925,14926,14927,14928,14929,14930,14932,14933,14934,14935,14936,14937,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14949,14950,14951,14953,14955,14956,14958,14959,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14976,14977,14983,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15119,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15172,15173,15177,15178,15179,15180,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15194,15211,15212,15213,15214,15215,15216,15217,15218,15219,15223,15224,15225,15226,15227,15228,15229,15230,15231,15232,15233,15234,15235,15236,15237,15238,15239,15241,15242,15243,15244,15248,15249,15250,15251,15252,15253,15254,15255,15256,15259,15260,15261,15262,15264,15265,15266,15269,15270,15271,15272,15274,15275,15276,15278,15279,15280,15281,15282,15287,15288,15291,15294,15295,15324,15325,15337,15339,15341,15342,15343,15344,15345,15346,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15382,15383,15385,15386,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15436,15437,15518,15522,15524,15529,15530,15531,15533,15534,15535,15536,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15624,15625,15626,15628,15629,15630,15631,15632,15633,15634,15635,15636,15638,15640,15642,15643,15644,15645,15646,15647,15648,15650,15651,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15670,15671,15672,15673,15674,15676,15677,15679,15681,15683,15693,15694,15890,15892,15912,15918,15927,15928,15929,15930,15931,15934,15935,15936,15938,15939,15943,15962,15963,15964,15965,15966,15967,15973,15975,15976,15977,15978,15979,15980,15981,15983,15984,15985,15986,15987,15990,17189,17688,18339,18343,18672,18674,18679,18706,18709,18710,18711,18712,19024,19574,19575,19576,19577,19579,19585,19586,19588,19591,19592,19593,19594,19598,19599,19600,19601,19602,19603,19604,19605,19606,19607,19608,19609,19610,19611,19612,19613,19614,19615,19616,19617,19618,19619,19620,19621,19808,19822,19823,19824,19825,19826,19827,19828,19829,19830,19831,19832,19833,19834,19835,19836,19838,19839,19840,19841,19842,19843,19845,19846,19848,19849,19969,19972,20033,20034,20213,20215,20216,20217,23825,23828,23829,23835,24222,29201,29202,29203,29522,29523,29524,29970,29974,45626},
})

table.insert(Journal.djDungeons, {
    name = "Blasted Lands", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BlastedLands.blp", -- placeholder
    bosses = {
        {
            bossID = 8298,
            name   = "Akubar the Seer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8301,
            name   = "Clack the Reaver",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8302,
            name   = "Deatheye",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8304,
            name   = "Dreadscorn",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8303,
            name   = "Grunter",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8297,
            name   = "Magronos the Unyielding",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8296,
            name   = "Mojo the Twisted",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8300,
            name   = "Ravage",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8299,
            name   = "Spiteflayer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,867,868,940,942,943,944,1168,1169,1203,1315,1443,1447,1607,1608,1613,1639,1714,1715,1718,1720,1721,1979,1980,1981,1994,2100,2244,2245,2246,2423,2424,2425,2426,2427,2428,2451,2564,2802,2815,3075,3187,3208,3430,3894,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4046,4062,4069,4080,4082,4083,4084,4088,4089,4091,4696,4733,4737,5216,5266,5267,6423,6425,6427,6429,6430,7113,7332,7468,7469,7477,7486,7495,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7557,7611,8080,8081,8082,8083,8084,8085,8086,8088,8089,8090,8091,8092,8093,8094,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8138,8139,8141,8142,8143,8144,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9286,9359,9402,9433,9434,9905,9906,9907,9910,9911,9912,9913,9914,9915,9916,9917,9918,9920,9921,9922,9923,9924,9925,9928,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9970,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11974,11975,11976,11977,11978,11979,11980,11988,11989,11990,11991,11992,11999,12001,12002,12004,12005,12012,12013,12014,12015,12016,12017,12023,12024,12025,12026,12027,12031,12032,12034,12035,12036,12043,12044,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13018,13021,13022,13023,13026,13027,13028,13029,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13058,13059,13064,13065,13066,13067,13068,13070,13071,13072,13073,13074,13075,13076,13077,13082,13083,13085,13089,13091,13095,13096,13100,13101,13102,13107,13109,13111,13112,13113,13115,13116,13117,13118,13120,13122,13123,13125,13126,13128,13130,13132,13133,13134,13135,13139,13144,14237,14244,14246,14247,14249,14252,14254,14257,14258,14259,14260,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14417,14425,14427,14428,14431,14432,14433,14434,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14549,14551,14552,14553,14601,14604,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14768,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14833,14835,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14944,14945,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15162,15164,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15215,15216,15217,15218,15219,15220,15221,15227,15228,15229,15235,15236,15237,15238,15239,15240,15245,15246,15247,15252,15253,15254,15255,15256,15257,15258,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15370,15373,15374,15376,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15599,15601,15602,15604,15607,15608,15609,15612,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15964,15965,15966,15967,15968,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15991,17007,17190,18339,18343,18602,18672,18674,18679,24222},
})

table.insert(Journal.djDungeons, {
    name = "Swamp of Sorrows", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SwampOfSorrowies.blp", -- placeholder
    bosses = {
        {
            bossID = 14446,
            name   = "Fingat",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14447,
            name   = "Gilmorian",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14445,
            name   = "Lord Captain Wyrmak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 763,
            name   = "Lost One Chieftain",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1106,
            name   = "Lost One Cook",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14448,
            name   = "Molt Thorn",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,863,864,866,867,868,873,936,940,942,943,1169,1203,1204,1207,1315,1447,1521,1607,1608,1613,1625,1639,1640,1714,1715,1716,1718,1720,1721,1722,1979,1980,1981,1988,1990,1994,2080,2100,2276,2277,2423,2424,2425,2426,2427,2428,2435,2437,2438,2440,2451,2470,2471,2472,2473,2474,2475,2564,2565,2721,2802,2815,2877,2912,2951,3020,3185,3187,3197,3208,3430,3587,3588,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3892,3893,3894,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4065,4066,4067,4068,4069,4070,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4614,4717,4718,4720,4721,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,5009,5011,5215,5216,5266,5267,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6828,7111,7112,7113,7330,7331,7332,7353,7354,7357,7367,7368,7369,7407,7408,7409,7413,7414,7417,7418,7420,7421,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7609,7610,7611,8080,8081,8082,8083,8084,8085,8086,8088,8089,8090,8091,8092,8093,8094,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8285,8286,8289,8290,8291,8293,8295,8296,8297,8300,8303,8307,8308,8309,8310,8311,8313,8314,8315,8316,8317,8318,8319,8746,8747,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9385,9395,9402,9405,9433,9434,9435,9678,9679,9680,9682,9819,9825,9826,9833,9835,9836,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10098,10099,10103,10105,10106,10107,10108,10109,10110,10120,10121,10122,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10139,10140,10141,10142,10143,10144,10146,10147,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10160,10161,10162,10163,10165,10166,10167,10168,10170,10171,10172,10173,10174,10175,10176,10177,10179,10180,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10215,10217,10218,10219,10220,10226,10227,10228,10229,10230,10231,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10278,10282,10363,10366,10367,10368,10373,10376,10378,10379,10380,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10624,10629,10631,10632,10634,10659,10778,11970,11971,11972,11973,11974,11975,11976,11977,11979,11980,11985,11986,11987,11988,11989,11990,11992,11996,11997,11998,11999,12001,12002,12005,12009,12010,12011,12012,12013,12014,12016,12017,12020,12022,12023,12024,12025,12027,12029,12030,12031,12032,12034,12036,12039,12040,12042,12043,12044,12045,12046,12048,12055,12056,12057,12058,12253,12254,12255,12256,13000,13001,13006,13008,13009,13014,13015,13018,13021,13022,13023,13025,13026,13027,13028,13029,13030,13033,13034,13038,13039,13042,13043,13045,13046,13052,13055,13058,13059,13064,13065,13066,13067,13068,13071,13072,13073,13074,13075,13076,13081,13082,13083,13084,13085,13087,13088,13089,13093,13095,13096,13100,13102,13103,13105,13107,13108,13109,13110,13111,13112,13113,13115,13116,13117,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13132,13133,13134,13138,13139,13144,13145,13199,14199,14200,14201,14202,14203,14204,14207,14208,14209,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14289,14290,14291,14292,14293,14294,14295,14296,14298,14299,14300,14301,14302,14303,14304,14306,14308,14309,14311,14312,14313,14317,14318,14321,14322,14323,14324,14325,14326,14328,14329,14330,14332,14333,14334,14335,14336,14337,14398,14401,14404,14405,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14450,14451,14452,14454,14456,14458,14460,14461,14462,14463,14464,14465,14549,14551,14581,14584,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14671,14672,14673,14674,14675,14680,14681,14684,14685,14686,14687,14688,14751,14753,14759,14760,14761,14762,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14801,14802,14803,14807,14809,14811,14812,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14855,14856,14857,14860,14861,14862,14863,14865,14866,14867,14868,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14926,14927,14928,14929,14931,14935,14936,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,15119,15130,15133,15134,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15180,15181,15182,15183,15184,15186,15187,15189,15190,15192,15193,15194,15195,15213,15214,15215,15216,15217,15220,15221,15225,15226,15227,15228,15229,15232,15233,15234,15235,15236,15237,15239,15240,15243,15244,15245,15246,15247,15251,15252,15253,15254,15257,15258,15260,15261,15262,15263,15264,15266,15267,15270,15271,15273,15274,15275,15278,15279,15280,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15339,15349,15350,15352,15353,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15427,15428,15430,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15536,15540,15541,15543,15546,15550,15551,15552,15553,15554,15555,15557,15558,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15651,15652,15653,15654,15655,15656,15659,15660,15661,15663,15664,15665,15667,15669,15670,15671,15672,15674,15675,15676,15677,15678,15679,15680,15682,15683,15684,15685,15686,15687,15694,15887,15918,15929,15930,15931,15935,15936,15937,15940,15941,15942,15943,15962,15963,15964,15965,15966,15968,15976,15977,15978,15979,15980,15981,15982,15983,15984,15986,15987,15988,15989,15990,15991,17007,17190,18343,18679,20517,20521},
})

table.insert(Journal.djDungeons, {
    name = "Deadwind Pass", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-DeadwindPass.blp", -- placeholder
    bosses = {

    },
    items = {812,833,944,1168,1203,1443,1607,1721,2243,2244,2245,2246,3075,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5266,5267,8080,8081,8082,8083,8084,8085,8086,8245,8251,8252,8258,8261,8262,8265,8267,8268,8269,8270,8271,8272,8275,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8312,8313,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,10057,10065,10070,10093,10095,10096,10097,10099,10100,10101,10102,10103,10104,10105,10106,10107,10109,10110,10111,10112,10113,10118,10119,10121,10122,10123,10124,10125,10126,10128,10136,10137,10138,10139,10140,10141,10142,10144,10145,10146,10147,10148,10149,10150,10152,10153,10154,10155,10156,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10175,10176,10177,10178,10179,10181,10182,10183,10187,10188,10189,10193,10195,10199,10204,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10240,10244,10247,10248,10249,10250,10251,10253,10255,10256,10257,10258,10259,10260,10261,10263,10265,10267,10268,10269,10270,10272,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10385,10386,10387,10388,10390,10391,11977,11978,11979,11990,11991,11992,12002,12004,12005,12015,12016,12025,12026,12027,12035,12036,12045,12046,12056,12057,13000,13001,13002,13003,13004,13006,13007,13013,13014,13015,13022,13023,13027,13028,13036,13040,13047,13056,13067,13070,13072,13075,13077,13083,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13126,13130,13133,13135,13144,14283,14284,14287,14288,14293,14295,14297,14298,14299,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14329,14330,14331,14333,14334,14335,14337,14437,14445,14449,14452,14453,14455,14457,14458,14459,14460,14461,14462,14463,14465,14552,14553,14554,14555,14664,14670,14671,14674,14675,14676,14677,14678,14681,14682,14683,14684,14685,14686,14687,14688,14789,14790,14798,14799,14800,14802,14803,14804,14805,14806,14808,14809,14810,14813,14814,14815,14816,14817,14844,14852,14854,14855,14856,14857,14858,14859,14860,14862,14863,14864,14865,14866,14867,14868,14869,14924,14925,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14961,14962,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14976,14977,14978,14980,14981,14983,15119,15179,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15229,15237,15238,15239,15246,15254,15255,15256,15257,15264,15265,15266,15267,15271,15272,15273,15275,15276,15278,15281,15282,15288,15295,15296,15324,15325,15390,15391,15394,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15440,15441,15640,15645,15646,15648,15650,15651,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15681,15682,15683,15685,15686,15693,15694,15887,15890,15930,15931,15936,15938,15939,15940,15943,15966,15967,15984,15985,15986,15987,15988,15991,18339,18343,18672,18674,18679,24222,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25037,25038,25039,25040,25041,25042,25051,25052,25053,25054,25055,25056,25065,25066,25067,25068,25069,25070,25079,25080,25081,25082,25083,25084,25093,25094,25095,25096,25097,25098,25107,25108,25109,25110,25111,25112,25121,25122,25123,25124,25125,25126,25135,25136,25137,25138,25139,25140,25149,25150,25151,25152,25153,25154,25163,25164,25165,25166,25167,25168,25177,25178,25179,25180,25181,25182,25191,25192,25193,25194,25195,25196,25205,25206,25207,25208,25209,25210,25219,25220,25221,25222,25223,25224,25233,25234,25235,25236,25237,25238,25247,25248,25249,25250,25251,25252,25261,25262,25263,25264,25265,25266,25275,25276,25277,25278,25279,25280,25289,25290,25291,25292,25293,25294,25303,25304,25305,25306,25307,25308,25317,25318,25319,25320,25321,25322,25331,25332,25333,25334,25335,25336,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28538,28539,28540,28541,28542,28543,29276,29277,29278,29279,29280,29281,29282,29283,29284,29285,29286,29287,29288,29289,29290,29291,31113,31190,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308},
})

table.insert(Journal.djDungeons, {
    name   = "Stormwind City",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Stormwind.blp",
    bosses = {
        {
            bossID = 3581,
            name   = "Sewer Beast",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,791,792,793,794,795,796,797,798,799,837,838,839,840,843,844,845,846,847,848,849,850,865,886,897,911,920,1076,1077,1315,1351,1406,1455,1459,1461,1462,1639,1717,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1839,1840,1843,1844,1845,1846,1849,1850,1852,1853,1893,1979,1998,2011,2013,2017,2034,2036,2037,2072,2077,2080,2100,2141,2142,2143,2144,2145,2146,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2219,2220,2221,2222,2227,2232,2233,2278,2300,2303,2308,2309,2310,2314,2315,2316,2392,2393,2394,2395,2396,2397,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2431,2432,2434,2435,2437,2438,2440,2445,2446,2448,2451,2463,2464,2465,2467,2468,2469,2470,2471,2472,2473,2474,2475,2564,2566,2568,2569,2578,2580,2582,2583,2584,2612,2613,2614,2615,2616,2617,2618,2721,2800,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2877,2878,2912,2933,3020,3045,3047,3048,3049,3055,3056,3057,3058,3066,3067,3069,3185,3186,3201,3202,3204,3206,3210,3212,3341,3378,3379,3380,3381,3429,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3556,3569,3587,3588,3589,3590,3591,3592,3593,3594,3597,3598,3602,3603,3656,3719,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3835,3836,3842,3844,3848,3889,3890,3891,3892,3893,3894,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4040,4048,4049,4050,4051,4055,4064,4071,4072,4073,4075,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4661,4705,4706,4707,4708,4709,4711,4712,4713,4714,4715,4716,4717,4719,4720,4722,4824,4825,4826,4827,4828,4829,4998,4999,5001,5002,5003,5007,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6350,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6403,6406,6407,6408,6409,6410,6566,6567,6568,6569,6584,6587,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6971,6972,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7110,7281,7282,7285,7298,7330,7331,7348,7354,7355,7356,7357,7366,7367,7368,7370,7374,7377,7378,7387,7406,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7419,7420,7421,7422,7423,7424,7460,7508,7509,7511,7517,7518,7527,7537,7557,7558,7606,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8080,8081,8082,8083,8084,8085,8086,8088,8089,8090,8091,8092,8093,8094,8106,8112,8113,8119,8123,8126,8128,8129,8130,8131,8132,8133,8134,8175,8176,8185,8189,8191,8193,8197,8198,8246,8247,8248,8249,8250,8253,8254,8255,8256,8257,8259,8260,8263,8264,8266,8274,8280,8282,8303,8311,8313,8314,8315,8316,8350,8663,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9405,9513,9516,9609,9769,9771,9772,9773,9774,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9847,9853,9857,9860,9865,9867,9936,9939,9940,9941,9942,9943,9944,9946,9948,9950,9952,9953,9954,9955,9957,9958,9964,9965,9974,9998,9999,10001,10002,10003,10004,10019,10021,10023,10024,10026,10027,10028,10031,10041,10042,10044,10046,10047,10058,10059,10060,10061,10062,10063,10064,10066,10067,10068,10069,10071,10072,10073,10074,10075,10076,10077,10078,10080,10081,10082,10083,10084,10085,10086,10098,10108,10120,10127,10129,10130,10131,10132,10133,10134,10135,10139,10141,10142,10143,10150,10151,10152,10153,10157,10158,10160,10162,10163,10173,10174,10180,10184,10185,10186,10190,10191,10192,10194,10196,10197,10198,10200,10203,10205,10207,10208,10209,10215,10218,10220,10227,10238,10239,10241,10242,10243,10245,10246,10247,10248,10250,10251,10252,10253,10254,10255,10257,10259,10260,10261,10262,10263,10264,10265,10266,10268,10269,10270,10271,10272,10273,10274,10287,10288,10289,10366,10367,10368,10378,10382,10384,10385,10386,10388,10389,10390,10404,10406,10408,10409,10500,10502,10503,10504,10508,10747,10748,10823,10824,11968,11969,11970,11975,11976,11980,11983,11984,11989,11992,11994,11995,11996,12001,12005,12007,12008,12009,12013,12014,12017,12019,12024,12027,12028,12034,12036,12039,12044,12047,12048,12054,12055,12058,12259,12405,12406,12408,12409,12410,12414,12584,12773,12775,13008,13009,13010,13011,13012,13018,13024,13030,13039,13041,13043,13046,13048,13049,13052,13055,13059,13065,13066,13073,13076,13079,13085,13087,13089,13094,13097,13099,13106,13109,13112,13114,13125,13127,13131,13134,13139,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14127,14128,14130,14132,14133,14141,14142,14143,14144,14158,14163,14165,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14201,14205,14206,14209,14210,14211,14214,14219,14265,14267,14271,14274,14275,14277,14278,14279,14281,14282,14285,14286,14289,14290,14291,14292,14294,14296,14300,14301,14318,14322,14326,14328,14329,14332,14333,14334,14335,14336,14372,14373,14374,14375,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14409,14414,14416,14427,14434,14441,14442,14443,14444,14447,14448,14450,14451,14454,14456,14460,14461,14462,14463,14464,14551,14566,14570,14572,14573,14574,14578,14579,14580,14581,14582,14583,14585,14587,14608,14655,14658,14661,14662,14666,14667,14668,14669,14672,14673,14680,14681,14685,14686,14687,14742,14744,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14761,14763,14779,14780,14788,14792,14793,14794,14795,14796,14797,14801,14807,14809,14811,14812,14814,14815,14816,14817,14846,14847,14848,14849,14850,14851,14861,14862,14866,14867,14904,14912,14913,14915,14916,14919,14920,14921,14922,14923,14926,14927,14931,14948,14952,14953,14954,14957,14959,14960,14963,14965,14975,14978,14979,14980,14981,14982,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15135,15136,15137,15139,15140,15143,15147,15148,15170,15171,15174,15175,15176,15177,15180,15182,15183,15193,15195,15212,15216,15220,15221,15223,15224,15225,15227,15228,15230,15231,15232,15236,15240,15241,15242,15245,15246,15247,15249,15250,15252,15253,15257,15258,15259,15263,15267,15269,15273,15274,15279,15280,15283,15289,15291,15294,15296,15323,15329,15330,15332,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15354,15355,15381,15384,15385,15387,15388,15389,15392,15393,15395,15435,15438,15439,15440,15441,15442,15500,15511,15512,15513,15514,15515,15516,15517,15518,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15547,15548,15549,15553,15554,15555,15556,15559,15560,15568,15621,15622,15623,15627,15630,15631,15633,15634,15636,15637,15638,15639,15641,15642,15643,15644,15647,15649,15652,15653,15669,15675,15678,15680,15682,15684,15685,15686,15687,15887,15891,15892,15894,15927,15928,15934,15935,15937,15940,15941,15942,15947,15962,15965,15968,15972,15973,15974,15975,15982,15983,15988,15989,15991,15995,15999,16008,16342,16437,16440,16441,16442,16443,16444,16446,16448,16449,16450,16451,16452,16453,16454,16455,16456,16457,16459,16462,16463,16465,16466,16467,16468,16471,16472,16473,16474,16475,16476,16477,16478,16479,16480,16483,16484,16996,16997,16998,17007,17188,17189,17190,17192,17578,17579,17580,17581,17583,17584,17602,17603,17604,17605,17607,17608,18440,18441,18442,18443,18444,18445,18447,18448,18449,18452,18453,18454,18455,18456,18457,18825,18827,18830,18833,18836,18838,18843,18847,18855,18865,18867,18869,18873,18876,19366,19383,19384,23272,23273,23274,23275,23276,23277,23278,23279,23280,23281,23282,23283,23284,23285,23286,23287,23288,23289,23290,23291,23292,23293,23294,23295,23296,23297,23298,23299,23300,23301,23302,23303,23304,23305,23306,23307,23308,23309,23310,23311,23312,23313,23314,23315,23316,23317,23318,23319,23324,23451,23452,23453,23454,23455,23456,25829,28234,28235,28236,28237,28238,28246,28247,28379,28380,28425,28426,28427,28428,28429,28430,28431,28432,28433,28434,28435,28436,28438,28439,28440,28441,28442,29201,29202,29203,29594,29595,29596,29597,29598,29599,29606,29607,29608,29609,29610,29611,30071,30072,30073,30077,30086,30087,30088,30089,30093,30348,30349,30350,30351,33853,33918,33919,33920,33921,33922,33923,34683,34685,35129,35130,35131,35132,35133,35134,35135,35136,35137,35138,35139,35140,35141,35142,35143,35144,35145,35146,35147,35148,35149,35150,35151,35152,35153,35154,35155,35156,35157,35158,35159,35160,35161,35162,35163,35164,35165,35166,35167,35168,35169,35170,35171,35172,35173,35174,35175,35176,35177,35178,35179,35180,35317,35319,35320,37864,37927,37928,37929,38589,40778,40779,40780,40787,40788,40789,40797,40798,40799,40807,40808,40809,40816,40817,40818,40826,40827,40828,40836,40837,40838,40847,40848,40849,40856,40857,40858,40866,40868,40869,40877,40878,40879,40880,40883,40884,40887,40888,40890,40898,40907,40918,40927,40930,40933,40936,40939,40960,40963,40966,40972,40973,40974,40975,40978,40979,40982,40984,40986,40987,40992,40993,40998,41001,41004,41007,41010,41013,41016,41019,41023,41024,41027,41030,41033,41038,41041,41044,41047,41048,41049,41050,41052,41054,41056,41059,41061,41063,41064,41066,41068,41069,41071,41073,41074,41076,41078,41081,41084,41087,41134,41137,41140,41143,41148,41151,41154,41157,41160,41186,41187,41188,41199,41202,41205,41208,41211,41214,41217,41223,41224,41226,41228,41229,41231,41233,41234,41236,41268,41269,41270,41271,41272,41275,41278,41281,41287,41290,41293,41298,41301,41304,41310,41313,41316,41321,41324,41327,41330,41331,41332,41587,41588,41589,41590,41591,41592,41616,41618,41620,41622,41624,41626,41628,41629,41631,41633,41634,41636,41638,41639,41641,41643,41644,41645,41646,41647,41650,41655,41658,41661,41664,41667,41672,41675,41678,41683,41712,41715,41767,41770,41773,41827,41828,41830,41831,41833,41835,41837,41839,41841,41847,41848,41849,41850,41851,41854,41859,41864,41869,41874,41877,41878,41879,41880,41882,41884,41886,41892,41894,41896,41897,41899,41901,41902,41904,41907,41908,41910,41912,41915,41918,41921,41924,41927,41930,41934,41937,41940,41943,41946,41949,41953,41956,41959,41962,41965,41968,41971,41990,41993,41996,41998,42002,42005,42008,42011,42014,42017,42020,42021,42022,42023,42024,42025,42026,42027,42028,42029,42030,42031,42032,42033,42041,42042,42043,42044,42045,42046,42047,42055,42056,42057,42058,42059,42060,42061,42062,42063,42064,42065,42066,42067,42068,42076,42077,42078,42079,42080,42081,42082,42110,42112,42114,42115,42118,42119,42123,42128,42129,42130,42131,42132,42133,42134,42135,42136,42137,43515,43654,43655,43656,43657,43660,43661,43663,43664,44429,44431,45626,45631,46374,49179,49181,49183,51327,51328,51329,51330,51331,51332,51333,51334,51335,51336,51337,51338,51339,51340,51341,51342,51343,51344,51345,51346,51347,51348,51349,51350,51351,51352,51353,51354,51355,51356,51357,51358,51359,51360,51361,51362,51363,51364,51365,51366,51367,51368,51369,51370,51371,51372,51373,51374,51375,51376,51377},
})

table.insert(Journal.djDungeons, {
    name   = "Burning Steppes",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BurningSteppes.blp",
    bosses = {
        {
            bossID = 10077,
            name   = "Deathmaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 9604,
            name   = "Gorgon'och",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8979,
            name   = "Gruklash",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 9602,
            name   = "Hahk'Zor",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8976,
            name   = "Hematos",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8981,
            name   = "Malfunctioning Reaver",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10078,
            name   = "Terrorspark",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8978,
            name   = "Thauris Balgarr",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10119,
            name   = "Volchan",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,942,943,944,1168,1203,1315,1443,1607,1608,1639,1720,1721,1979,1994,2100,2243,2244,2245,2246,2564,2815,3075,3208,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4046,4062,4069,4080,4082,4084,4088,4089,4091,4696,4733,5216,5266,6423,6427,6430,7113,7332,7468,7477,7517,7518,7519,7520,7521,7522,7523,7525,7526,7527,7528,7529,7530,7531,7532,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7545,7546,7553,7555,7557,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8138,8143,8144,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9433,9905,9911,9912,9913,9914,9915,9918,9921,9922,9923,9924,9928,9933,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10136,10137,10138,10139,10140,10141,10142,10144,10145,10146,10147,10148,10149,10150,10152,10153,10154,10155,10156,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10247,10248,10249,10250,10251,10253,10255,10256,10257,10258,10259,10260,10261,10263,10265,10267,10268,10269,10270,10272,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10385,10386,10387,10388,10390,10391,11865,11867,11868,11963,11974,11975,11976,11977,11978,11979,11988,11989,11990,11991,11992,11999,12001,12002,12004,12005,12012,12013,12014,12015,12016,12023,12024,12025,12026,12027,12032,12034,12035,12036,12043,12044,12045,12046,12049,12055,12056,12057,12066,12082,12083,12112,12113,12114,12115,13001,13002,13003,13004,13007,13008,13009,13013,13014,13015,13018,13021,13022,13026,13027,13028,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13059,13065,13066,13067,13070,13071,13072,13073,13074,13076,13077,13082,13083,13085,13089,13091,13096,13101,13102,13107,13109,13111,13112,13115,13116,13118,13120,13122,13125,13126,13128,13130,13133,13134,13135,13139,13144,13958,13959,13961,13962,13963,13965,13966,13968,14265,14267,14271,14274,14275,14277,14278,14279,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14329,14330,14331,14333,14334,14335,14337,14427,14434,14437,14441,14442,14443,14444,14445,14447,14448,14449,14450,14451,14452,14453,14454,14455,14457,14458,14459,14460,14461,14462,14463,14465,14551,14552,14553,14655,14658,14661,14662,14664,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14681,14682,14683,14684,14685,14686,14687,14688,14779,14780,14788,14789,14790,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14813,14814,14815,14816,14817,14844,14846,14847,14848,14849,14850,14851,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14912,14913,14915,14916,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14948,14952,14953,14954,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14976,14977,14978,14980,14981,14983,15119,15170,15171,15174,15175,15176,15177,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15215,15216,15217,15218,15219,15220,15227,15228,15229,15235,15236,15237,15238,15239,15245,15246,15252,15253,15254,15255,15256,15257,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15287,15288,15291,15294,15295,15296,15323,15324,15325,15381,15384,15385,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15440,15441,15621,15622,15623,15627,15630,15631,15633,15634,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15681,15682,15683,15685,15686,15693,15694,15824,15825,15827,15860,15861,15887,15890,15930,15931,15936,15937,15938,15939,15940,15943,15965,15966,15967,15982,15983,15984,15985,15986,15987,15988,15991,17007,18339,18343,18672,18674,18679,24222},
})

table.insert(Journal.djDungeons, {
    name   = "Searing Gorge",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SearingGorge.blp",
    bosses = {
        {
            bossID = 8279,
            name   = "Faulty War Golem",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8282,
            name   = "Highlord Mastrogonde",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8277,
            name   = "Rekk'tilac",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8281,
            name   = "Scald",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8280,
            name   = "Shleipnarr",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8283,
            name   = "Slave Master Blackheart",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8278,
            name   = "Smoldar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {847,848,849,850,866,867,868,940,942,943,1169,1204,1315,1447,1521,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1722,1845,1846,1979,1980,1981,1994,2100,2564,2623,2624,2802,2815,3187,3208,3430,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4044,4045,4046,4047,4058,4060,4061,4062,4063,4068,4069,4070,4079,4080,4082,4083,4084,4087,4088,4089,4091,4725,4733,4734,4735,4736,4737,4738,5011,5215,5216,5266,5608,6411,6415,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,7112,7113,7332,7429,7430,7439,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8246,8247,8248,8249,8250,8251,8253,8254,8255,8256,8257,8259,8260,8261,8262,8263,8264,8266,8267,8268,8269,8270,8272,8273,8274,8276,8277,8278,8279,8280,8281,8282,8286,8297,8311,8314,8315,8316,8317,8319,8346,8348,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9433,9434,9874,9876,9878,9880,9881,9882,9883,9884,9885,9887,9889,9892,9893,9894,9895,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10096,10098,10099,10103,10107,10108,10109,10110,10120,10122,10126,10127,10128,10129,10130,10131,10132,10133,10134,10165,10166,10167,10171,10172,10173,10174,10175,10176,10179,10180,10183,10184,10185,10186,10187,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10231,10238,10239,10240,10241,10242,10243,10244,10245,10278,10461,10462,10739,10740,10741,10742,10743,10744,10745,10746,11861,11972,11973,11974,11975,11976,11977,11987,11988,11989,11990,11998,11999,12001,12002,12011,12012,12013,12014,12022,12023,12024,12025,12031,12032,12034,12042,12043,12044,12055,12542,12549,13008,13009,13014,13018,13021,13026,13027,13029,13030,13034,13038,13039,13042,13043,13046,13052,13055,13058,13059,13064,13065,13066,13068,13071,13073,13074,13076,13082,13085,13088,13089,13095,13100,13102,13109,13112,13115,13117,13125,13126,13128,13132,13134,13138,13139,13144,13145,13199,14216,14220,14225,14228,14230,14233,14234,14237,14238,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14285,14286,14289,14290,14291,14292,14293,14294,14295,14296,14299,14300,14301,14304,14311,14313,14321,14417,14421,14422,14423,14424,14425,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14450,14451,14452,14454,14549,14551,14591,14592,14598,14599,14600,14601,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14672,14673,14674,14768,14769,14770,14772,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14801,14802,14803,14807,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14855,14856,14857,14861,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14926,14927,14928,14929,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14959,14960,14961,14962,14963,14965,14968,14974,15152,15156,15157,15158,15159,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15180,15181,15182,15183,15184,15186,15187,15190,15214,15215,15216,15217,15227,15228,15229,15234,15235,15236,15237,15244,15245,15251,15252,15253,15254,15261,15262,15263,15270,15274,15275,15279,15280,15287,15291,15294,15295,15323,15359,15363,15366,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15392,15393,15394,15395,15425,15427,15567,15569,15574,15578,15580,15582,15583,15584,15589,15591,15592,15593,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15641,15642,15643,15644,15645,15646,15647,15649,15652,15653,15654,15656,15659,15661,15694,15936,15937,15964,15965,15966,15978,15979,15980,15981,15982,15983,17007,19123,19124,19125,19126,19127,19128,19129,29525,29526,29527,29964,29973},
})

table.insert(Journal.djDungeons, {
    name   = "Badlands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BadLands.blp",
    bosses = {
        {
            bossID = 14224,
            name   = "7:XT",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2754,
            name   = "Anathemus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2753,
            name   = "Barnabus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2850,
            name   = "Broken Tooth",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7057,
            name   = "Digmaster Shovelphlange",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2752,
            name   = "Rumbler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2744,
            name   = "Shadowforge Commander",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2749,
            name   = "Siege Golem",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2751,
            name   = "War Golem",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2931,
            name   = "Zaricotl",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,863,864,866,867,868,873,936,940,942,943,1169,1203,1204,1207,1280,1315,1447,1521,1522,1523,1607,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1721,1722,1979,1980,1981,1988,1990,1993,1994,1996,2080,2100,2143,2244,2276,2277,2429,2431,2432,2434,2463,2464,2465,2467,2468,2469,2564,2565,2620,2621,2623,2624,2802,2815,2877,2951,3020,3075,3185,3187,3197,3208,3345,3430,3593,3594,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3889,3890,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4065,4066,4067,4068,4069,4070,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4614,4652,4653,4717,4718,4721,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,4743,4746,4978,4979,4983,5009,5011,5215,5216,5266,5608,5624,6402,6404,6405,6406,6408,6409,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6732,7111,7112,7113,7331,7332,7353,7357,7368,7369,7407,7414,7417,7418,7423,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7609,7610,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8284,8285,8286,8287,8288,8291,8292,8293,8294,8295,8297,8298,8299,8301,8302,8304,8305,8306,8311,8312,8314,8315,8316,8317,8318,8319,8320,8347,8367,8746,8747,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9384,9385,9391,9393,9395,9396,9397,9405,9406,9420,9428,9433,9434,9435,9522,9819,9826,9844,9845,9846,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10138,10145,10148,10159,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10211,10212,10213,10214,10216,10221,10222,10223,10224,10225,10229,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10276,10277,10278,10279,10280,10281,10282,10358,10359,10362,10364,10365,10369,10370,10371,10372,10374,10375,10377,10381,11193,11194,11195,11196,11964,11970,11971,11972,11973,11974,11975,11976,11977,11978,11985,11986,11987,11988,11989,11990,11991,11996,11997,11998,11999,12000,12001,12002,12004,12010,12011,12012,12013,12014,12015,12020,12022,12023,12024,12025,12026,12029,12030,12031,12032,12034,12035,12038,12040,12042,12043,12044,12045,12055,12056,12059,12108,12109,12110,12111,12112,12113,12114,12115,13008,13009,13014,13018,13021,13022,13025,13026,13027,13029,13030,13033,13034,13038,13039,13042,13043,13045,13046,13052,13055,13058,13059,13064,13065,13066,13067,13068,13071,13073,13074,13076,13081,13082,13084,13085,13087,13088,13089,13093,13095,13100,13102,13103,13105,13108,13109,13110,13111,13112,13115,13117,13119,13120,13121,13122,13124,13125,13126,13128,13129,13132,13134,13138,13139,13144,13145,13199,13958,13959,13961,13962,13963,14200,14201,14202,14203,14204,14207,14208,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14304,14305,14307,14309,14310,14311,14313,14314,14315,14316,14319,14320,14321,14327,14331,14407,14408,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14457,14459,14549,14552,14584,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14682,14683,14759,14760,14761,14762,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14810,14813,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14864,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14932,14933,14934,14937,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14967,14968,14969,14970,14971,14972,14974,14983,15119,15130,15134,15140,15142,15144,15145,15146,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15190,15191,15213,15214,15215,15216,15217,15218,15219,15226,15227,15228,15229,15233,15234,15235,15236,15237,15238,15243,15244,15245,15251,15252,15253,15254,15255,15256,15260,15261,15262,15263,15264,15265,15270,15271,15272,15274,15275,15276,15279,15280,15281,15287,15291,15294,15295,15323,15324,15339,15350,15352,15353,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15431,15432,15536,15540,15543,15546,15550,15551,15552,15553,15557,15558,15560,15561,15562,15563,15565,15566,15567,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15661,15662,15663,15666,15668,15671,15673,15681,15693,15694,15824,15825,15827,15860,15861,15890,15918,15929,15930,15935,15936,15937,15938,15939,15963,15964,15965,15966,15967,15976,15977,15978,15979,15980,15981,15982,15983,15984,15985,15990,17007,18339,18672,18674,20295,20296,29515,29516,29517,29519,29520,29521,29971,29975},
})

table.insert(Journal.djDungeons, {
    name   = "Loch Modan",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-LochModan.blp",
    bosses = {
        {
            bossID = 1398,
            name   = "Boss Galgosh",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14267,
            name   = "Emogg the Crusher",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1425,
            name   = "Grizlak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2476,
            name   = "Large Loch Crocolisk",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14268,
            name   = "Lord Condar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1399,
            name   = "Magosh",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14266,
            name   = "Shanda the Spinner",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {727,789,790,826,827,837,838,839,840,843,844,845,846,847,848,849,850,860,863,864,886,911,920,935,936,1076,1077,1207,1211,1214,1215,1218,1220,1287,1296,1299,1300,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1391,1394,1405,1406,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1436,1438,1440,1446,1448,1449,1455,1457,1458,1459,1460,1461,1462,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1716,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1832,1843,1844,1845,1846,1926,1928,1929,1934,1936,1938,1943,1944,1945,1958,1959,1988,1990,2013,2034,2072,2073,2075,2078,2079,2080,2088,2140,2166,2167,2168,2175,2210,2211,2212,2213,2214,2215,2216,2217,2219,2220,2227,2232,2233,2240,2241,2265,2266,2267,2274,2276,2277,2281,2283,2284,2565,2566,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2821,2822,2823,2877,2879,2907,2908,2911,2951,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3154,3158,3160,3161,3166,3184,3185,3192,3193,3195,3196,3197,3198,3199,3202,3204,3205,3207,3211,3212,3213,3214,3217,3227,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3363,3365,3370,3373,3374,3375,3376,3377,3378,3379,3429,3563,3569,3571,3572,3589,3590,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4036,4038,4039,4040,4041,4042,4043,4044,4052,4054,4055,4057,4059,4060,4065,4066,4067,4068,4074,4075,4076,4077,4078,4079,4290,4368,4385,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4614,4661,4663,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4713,4714,4715,4717,4718,4721,4725,4726,4727,4729,4731,4732,4765,4766,4767,4768,4771,4777,4778,4781,4782,4786,4788,4789,4949,4980,4982,4998,4999,5001,5009,5011,5109,5110,5319,6186,6187,6188,6189,6191,6195,6197,6266,6267,6268,6269,6336,6337,6378,6379,6380,6381,6382,6383,6394,6402,6404,6405,6406,6408,6409,6412,6413,6416,6417,6418,6419,6420,6421,6422,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6591,6593,6600,6602,6604,6608,7108,7109,7111,7331,7350,7351,7353,7357,7368,7369,7407,7414,7417,7418,7423,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7474,7476,7483,7492,7493,7554,7556,7558,7608,7609,8156,8158,8159,8160,8161,8178,8350,8746,8747,9383,9384,9385,9391,9392,9393,9395,9396,9397,9405,9406,9420,9428,9435,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9792,9793,9794,9795,9796,9799,9801,9802,9803,9804,9805,9806,9807,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9826,9844,9845,9846,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9868,9869,9870,9871,9872,9873,9875,9876,9877,9879,9880,9885,9886,9889,9890,9891,9892,9895,9896,9898,9900,9901,10287,10405,10407,10500,10502,10503,10504,10508,11965,11967,11968,11970,11971,11972,11981,11982,11983,11985,11986,11993,11994,11996,11997,12006,12007,12010,12020,12029,12030,12040,12052,12053,12054,12522,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,13025,13033,13038,13045,13081,13084,13087,13093,13103,13105,13108,13110,13119,13121,13124,13129,13145,14025,14086,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14179,14185,14188,14200,14201,14202,14203,14204,14207,14208,14211,14212,14213,14214,14215,14217,14218,14219,14220,14221,14222,14223,14224,14226,14229,14231,14232,14233,14235,14236,14239,14240,14251,14364,14365,14366,14367,14368,14369,14370,14371,14373,14374,14375,14376,14377,14378,14407,14408,14410,14411,14412,14413,14414,14415,14416,14418,14419,14420,14422,14423,14426,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14571,14572,14573,14574,14580,14584,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14600,14602,14607,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14745,14746,14747,14748,14749,14752,14759,14760,14761,14762,14764,14765,14766,14767,14770,14771,14772,14773,14896,14897,14898,14900,14903,15004,15005,15006,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15122,15124,15130,15134,15140,15142,15144,15145,15146,15148,15149,15150,15151,15153,15154,15155,15158,15160,15210,15211,15212,15213,15214,15222,15223,15224,15226,15230,15233,15234,15241,15243,15248,15249,15259,15260,15261,15268,15269,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15339,15340,15348,15350,15352,15353,15355,15356,15357,15358,15360,15361,15362,15364,15365,15366,15367,15368,15472,15473,15476,15477,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15523,15526,15527,15528,15532,15536,15540,15543,15546,15550,15551,15552,15553,15557,15558,15560,15561,15562,15563,15565,15566,15567,15569,15570,15571,15572,15573,15574,15575,15576,15577,15579,15580,15581,15582,15590,15594,15595,15598,15891,15893,15894,15895,15912,15918,15925,15926,15927,15929,15932,15933,15935,15944,15945,15946,15963,15969,15970,15971,15972,15974,15976,15977,15990,15995,15999,16008,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Dun Morogh",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-DwarfMorogh.blp",
    bosses = {
        {
            bossID = 1130,
            name   = "Bjarn",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1137,
            name   = "Edan the Howler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8503,
            name   = "Gibblewilt",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1260,
            name   = "Great Father Arctikus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1119,
            name   = "Hammerspine",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1132,
            name   = "Timber",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {61,79,719,720,727,763,790,792,793,794,795,796,797,798,799,886,890,897,911,920,1009,1076,1077,1121,1351,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1406,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1455,1459,1461,1462,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1839,1840,1965,2011,2013,2017,2034,2059,2069,2072,2073,2075,2077,2108,2109,2110,2112,2114,2117,2119,2120,2121,2122,2123,2124,2125,2126,2127,2129,2140,2172,2194,2210,2211,2212,2213,2214,2215,2218,2219,2220,2221,2222,2227,2232,2233,2236,2254,2326,2379,2380,2381,2383,2384,2385,2392,2393,2394,2395,2396,2397,2546,2547,2566,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2800,2817,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2879,2898,2899,2900,2905,2911,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2971,2972,2975,2976,2978,2979,2980,3008,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3103,3151,3152,3153,3192,3198,3200,3201,3202,3203,3204,3206,3207,3212,3213,3214,3216,3223,3224,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3307,3308,3312,3314,3363,3365,3370,3373,3374,3375,3378,3379,3380,3381,3429,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3565,3569,3599,3600,3602,3603,3641,3642,3643,3644,3647,3649,3650,3651,3652,3653,3654,3656,3740,3835,3836,3842,3844,3848,3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,4036,4049,4368,4385,4561,4562,4564,4566,4569,4570,4658,4659,4661,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4705,4706,4707,4708,4709,4711,4712,4713,4714,4715,4998,4999,5001,5540,5767,6040,6171,6173,6176,6177,6185,6214,6266,6267,6268,6269,6336,6337,6350,6381,6382,6383,6387,6393,6394,6395,6397,6398,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6542,6543,6549,6550,6555,6556,6558,6566,6567,6568,6569,6572,6573,6577,6578,6579,6580,6584,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6604,6605,6608,6611,6612,6613,6614,6615,6835,6953,7108,7109,7298,7350,7351,7415,7558,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8080,8081,8082,8083,8084,8085,8086,8178,8748,8752,8753,8754,8755,9488,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9767,9769,9771,9772,9773,9774,9782,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9813,9814,9815,9816,9817,9818,9822,9829,9831,9838,10287,10500,10502,10503,10504,10508,10549,10550,10553,10554,11964,11967,11968,11969,11982,11983,11984,11994,11995,12000,12007,12008,12054,12259,12405,12406,12408,12409,12410,12414,12773,12775,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13031,13041,14086,14087,14088,14089,14090,14091,14093,14094,14095,14097,14098,14099,14102,14110,14113,14115,14116,14126,14127,14133,14157,14158,14162,14163,14165,14172,14175,14176,14177,14179,14181,14182,14185,14186,14187,14188,14194,14195,14365,14369,14371,14372,14373,14374,14375,14377,14378,14379,14380,14400,14402,14562,14566,14567,14568,14570,14572,14573,14574,14578,14580,14582,14730,14742,14744,14747,14748,14749,14750,14752,14754,14755,14756,15003,15004,15005,15006,15007,15008,15009,15010,15011,15013,15015,15113,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15132,15212,15223,15224,15230,15241,15249,15259,15269,15297,15298,15299,15300,15301,15302,15303,15309,15313,15329,15330,15331,15332,15334,15336,15337,15338,15340,15347,15348,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15490,15491,15492,15495,15500,15505,15511,15512,15513,15514,15515,15516,15517,15519,15520,15521,15522,15523,15525,15526,15527,15528,15529,15532,15535,15537,15547,15891,15894,15895,15912,15925,15927,15932,15933,15944,15946,15947,15969,15970,15972,15974,15995,15999,16008,16605,17184,29201,29202,29203,44803,45631},
})

table.insert(Journal.djDungeons, {
    name = "Ironforge", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Ironforge.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {200,201,202,203,285,286,287,718,837,838,839,840,843,844,845,846,847,848,849,850,1201,1202,1843,1844,1845,1846,1852,1853,2148,2149,2150,2151,2152,2153,2300,2303,2308,2309,2310,2314,2315,2316,2392,2393,2394,2395,2396,2397,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2431,2432,2434,2435,2437,2438,2440,2445,2446,2448,2451,2463,2464,2465,2467,2468,2469,2470,2471,2472,2473,2474,2475,2568,2569,2578,2580,2582,2583,2584,2612,2613,2614,2615,2616,2617,2618,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3587,3588,3589,3590,3593,3594,3597,3598,3719,3835,3836,3842,3844,3848,3889,3890,3891,3892,3893,3894,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4535,4984,4987,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6350,6723,6743,6974,6978,6981,6982,6984,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7281,7282,7285,7348,7374,7377,7378,7387,7507,7673,7746,7918,7919,7920,7922,7930,7931,7933,7938,7939,7941,7945,7956,7957,7958,7963,8088,8089,8090,8091,8092,8093,8094,8175,8176,8185,8189,8191,8193,8197,8198,8350,9362,9514,9538,9604,9605,9623,9624,9625,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,10545,10721,10724,10726,12050,12051,12102,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15995,15999,16008,17186,17187,17188,17189,17190,17192,21994,21996,21997,21998,21999,22002,22004,22005,22006,22009,22010,22011,22013,22015,22060,22062,22063,22065,22066,22069,22070,22071,22074,22075,22077,22078,22079,22080,22081,22083,22086,22088,22089,22090,22091,22095,22097,22098,22099,22102,22106,22108,22109,22110,22113,23563,23564,23565,23825,23828,23829,23835,28425,28426,28427,28428,28429,28430,28431,28432,28433,28434,28435,28436,28438,28439,28440,28441,28442,28483,28484,28485,29201,29202,29203,30069,30070,30071,30072,30073,30074,30076,30077,30086,30087,30088,30089,30093,34418,34419,34484,41186,41187,41188,41189,41190,43515,43654,43655,43656,43657,43660,43661,43663,43664,45626,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Wetlands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Wetlands.blp",
    bosses = {
        {
            bossID = 1037,
            name   = "Dragonmaw Battlemaster",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2108,
            name   = "Garneg Charskull",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14425,
            name   = "Gnawbone",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1112,
            name   = "Leech Widow",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2090,
            name   = "Ma'ruk Wyrmscale",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14424,
            name   = "Mirelow",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1140,
            name   = "Razormaw Matriarch",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14433,
            name   = "Sludginn",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {720,753,756,789,790,791,833,865,890,892,935,1121,1264,1273,1560,1717,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1955,2011,2046,2059,2072,2077,2078,2080,2084,2148,2149,2150,2151,2152,2153,2194,2216,2217,2219,2220,2221,2222,2236,2244,2278,2446,2545,2721,2800,2819,2877,2878,2879,2911,2912,2913,2916,2917,2943,2944,2949,2950,2981,2982,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3022,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3072,3073,3074,3076,3184,3185,3186,3193,3195,3196,3198,3199,3201,3202,3203,3206,3209,3210,3211,3212,3306,3310,3313,3376,3377,3378,3379,3380,3381,3392,3558,3561,3562,3566,3647,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,4035,4036,4037,4040,4048,4049,4050,4051,4055,4064,4071,4072,4073,4075,4444,4463,4504,4505,4568,4575,4661,4694,4695,4697,4698,4699,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4719,4720,4722,4790,4792,4793,4817,4818,4824,4825,4826,4827,4828,4829,4830,4831,4832,4833,4835,4998,4999,5001,5002,5003,5007,5267,5626,5627,5749,5750,6194,6198,6199,6200,6360,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6403,6406,6407,6408,6409,6410,6531,6536,6538,6540,6545,6552,6553,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,7110,7330,7331,7354,7355,7356,7357,7366,7367,7368,7370,7406,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7419,7420,7421,7422,7423,7424,7460,7554,7558,7608,8080,8081,8082,8083,8084,8085,8086,8283,8289,8290,8296,8300,8303,8307,8308,8309,8310,8313,8746,8747,8748,8752,8753,8754,8755,9395,9402,9405,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9847,9853,9857,9860,9865,9867,10105,10135,10136,10137,10139,10140,10141,10142,10143,10144,10146,10147,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10160,10161,10162,10163,10210,10215,10217,10218,10219,10220,10226,10227,10228,10230,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10287,10288,10289,10363,10366,10367,10368,10373,10376,10378,10379,10380,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10404,10405,10406,10407,10408,10409,11965,11967,11968,11969,11970,11979,11980,11981,11982,11983,11984,11992,11993,11994,11995,11996,12005,12006,12007,12008,12009,12016,12017,12019,12027,12028,12036,12039,12046,12047,12048,12052,12053,12054,12057,12058,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13000,13001,13005,13006,13010,13011,13012,13015,13023,13024,13028,13031,13033,13041,13048,13049,13072,13075,13079,13083,13087,13094,13096,13097,13099,13106,13107,13108,13113,13114,13116,13123,13127,13131,13133,14120,14121,14122,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14201,14205,14206,14209,14210,14211,14214,14219,14303,14306,14308,14312,14317,14318,14322,14323,14324,14325,14326,14328,14329,14330,14332,14333,14334,14335,14336,14337,14364,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14409,14414,14416,14456,14458,14460,14461,14462,14463,14464,14465,14559,14560,14562,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14585,14587,14608,14680,14681,14684,14685,14686,14687,14688,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14761,14763,14809,14811,14812,14814,14815,14816,14817,14862,14863,14865,14866,14867,14868,14931,14935,14936,14966,14973,14975,14976,14977,14978,14979,14980,14981,14982,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15135,15136,15137,15139,15140,15143,15147,15148,15189,15192,15193,15194,15195,15211,15212,15220,15221,15222,15223,15224,15225,15230,15231,15232,15239,15240,15241,15242,15246,15247,15248,15249,15250,15257,15258,15259,15266,15267,15269,15273,15278,15282,15283,15288,15289,15296,15305,15307,15310,15311,15312,15313,15325,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15354,15355,15430,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15488,15493,15494,15496,15497,15498,15499,15500,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15547,15548,15549,15553,15554,15555,15556,15559,15560,15568,15660,15664,15665,15667,15669,15670,15672,15674,15675,15676,15677,15678,15679,15680,15682,15683,15684,15685,15686,15687,15887,15891,15892,15893,15894,15912,15927,15928,15931,15934,15935,15940,15941,15942,15943,15945,15946,15947,15962,15968,15971,15972,15973,15974,15975,15986,15987,15988,15989,15991,17192,18343,18679},
})
table.insert(Journal.djDungeons, {
    name   = "Arathi Highlands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ArathiHighlands.blp",
    bosses = {
        {
            bossID = 2598,
            name   = "Darbel Montrose",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2601,
            name   = "Foulbelly",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2609,
            name   = "Geomancer Flintdagger",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2603,
            name   = "Kovork",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2604,
            name   = "Molok the Crusher",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2606,
            name   = "Nimar the Slayer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2779,
            name   = "Prince Nazjak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2602,
            name   = "Ruul Onestone",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2600,
            name   = "Singer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2605,
            name   = "Zalas Witherbark",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,720,789,790,791,863,864,865,866,867,868,873,890,936,1121,1204,1207,1280,1521,1522,1523,1608,1613,1624,1625,1639,1640,1714,1715,1716,1717,1718,1720,1722,1739,1744,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1768,1769,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1789,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1988,1990,1993,1994,1996,1997,2011,2059,2072,2077,2080,2156,2158,2159,2160,2194,2219,2220,2221,2222,2236,2276,2277,2278,2429,2431,2432,2434,2564,2565,2620,2621,2622,2624,2721,2800,2802,2815,2819,2877,2878,2879,2911,2912,2951,2981,2982,2985,2986,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3187,3193,3197,3198,3199,3201,3202,3203,3206,3208,3210,3212,3341,3345,3378,3379,3380,3381,3430,3591,3592,3593,3594,3597,3598,3647,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3889,3936,3937,3938,3939,3940,3941,3942,3943,3961,3962,3963,3964,3965,3966,3967,3968,3986,3989,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4069,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4507,4508,4509,4511,4543,4545,4548,4549,4550,4568,4614,4661,4694,4697,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,4741,4744,4745,4975,4976,4977,4998,4999,5001,5002,5003,5007,5009,5011,5180,5181,5215,5216,5256,5257,5624,5742,5743,5755,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,7110,7111,7112,7113,7330,7331,7332,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7558,7608,7609,7610,7611,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8246,8247,8248,8249,8250,8253,8254,8255,8256,8257,8259,8260,8263,8264,8266,8273,8274,8276,8277,8278,8279,8280,8281,8282,8311,8314,8315,8316,8346,8348,8746,8747,8748,8749,8750,8751,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9385,9395,9405,9433,9434,9435,9520,9521,9776,9778,9780,9781,9782,9783,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10058,10059,10060,10061,10062,10063,10064,10066,10067,10068,10069,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10094,10098,10108,10120,10127,10129,10130,10131,10132,10133,10134,10173,10174,10180,10184,10185,10186,10190,10191,10192,10194,10196,10197,10198,10200,10201,10202,10203,10205,10206,10207,10208,10209,10238,10239,10241,10242,10243,10245,10288,10289,10404,10405,10406,10407,10408,10409,11965,11967,11968,11969,11970,11971,11972,11973,11974,11975,11976,11981,11982,11983,11984,11985,11986,11987,11988,11989,11993,11994,11995,11996,11997,11998,11999,12001,12006,12007,12008,12009,12010,12011,12012,12013,12014,12019,12020,12022,12023,12024,12028,12029,12030,12031,12032,12034,12039,12040,12042,12043,12044,12047,12052,12053,12054,12055,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13009,13010,13011,13012,13024,13025,13026,13029,13030,13031,13033,13034,13038,13041,13042,13045,13046,13048,13049,13058,13064,13065,13066,13068,13071,13074,13079,13081,13082,13084,13085,13087,13088,13093,13094,13095,13097,13099,13100,13103,13105,13106,13108,13110,13114,13115,13117,13119,13121,13124,13125,13127,13129,13131,13132,13138,13139,13145,13199,14168,14170,14171,14172,14173,14175,14178,14180,14183,14184,14186,14189,14190,14191,14192,14193,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14285,14286,14289,14290,14291,14292,14294,14296,14300,14301,14379,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14438,14439,14440,14441,14442,14443,14444,14446,14447,14448,14450,14451,14454,14549,14578,14579,14581,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14665,14666,14667,14668,14669,14672,14673,14751,14753,14754,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14791,14792,14793,14794,14795,14796,14797,14801,14807,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14846,14847,14848,14849,14850,14851,14853,14861,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14926,14927,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14959,14960,14963,14965,15104,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15180,15182,15183,15211,15212,15213,15214,15215,15216,15223,15224,15225,15226,15227,15228,15230,15231,15232,15233,15234,15235,15236,15241,15242,15243,15244,15245,15248,15249,15250,15251,15252,15253,15259,15260,15261,15262,15263,15269,15270,15274,15279,15280,15287,15291,15294,15323,15337,15339,15341,15342,15343,15344,15345,15346,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15392,15393,15395,15455,15456,15518,15522,15524,15529,15530,15531,15533,15534,15535,15536,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15641,15642,15643,15644,15647,15649,15652,15653,15892,15912,15918,15927,15928,15929,15934,15935,15937,15962,15963,15964,15965,15973,15975,15976,15977,15978,15979,15980,15981,15982,15983,15990,20041,20042,20043,20044,20045,20046,20047,20048,20049,20050,20051,20052,20053,20054,20055,20056,20057,20058,20059,20060,20061,20068,20069,20070,20073,20088,20090,20091,20093,20094,20095,20096,20097,20098,20099,20100,20101,20102,20103,20104,20105,20106,20107,20108,20109,20110,20111,20112,20113,20114,20115,20116,20117,20118,20120,20121,20123,20124,20125,20126,20127,20128,20129,20150,20151,20152,20154,20155,20157,20158,20159,20160,20161,20162,20163,20164,20165,20166,20167,20168,20169,20170,20171,20172,20173,20174,20175,20176,20177,20178,20179,20180,20181,20182,20183,20184,20185,20186,20187,20188,20189,20190,20191,20192,20193,20194,20195,20196,20197,20199,20201,20202,20203,20204,20205,20206,20207,20208,20209,20210,20211,20212,20214,20220,21525,29525,29526,29527,29964,29973},
})
table.insert(Journal.djDungeons, {
    name   = "The Hinterlands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Hinterland.blp",
    bosses = {
        {
            bossID = 8215,
            name   = "Grimungous",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8213,
            name   = "Ironback",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8214,
            name   = "Jalinde Summerdrake",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8217,
            name   = "Mith'rethis the Enchanter",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8211,
            name   = "Old Cliff Jumper",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8210,
            name   = "Razortalon",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8216,
            name   = "Retherokk the Berserker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8212,
            name   = "The Reak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8218,
            name   = "Witherheart the Stalker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8219,
            name   = "Zul'arek Hatefowler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,866,867,868,873,936,940,942,943,1169,1203,1204,1207,1315,1447,1521,1607,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1721,1722,1979,1980,1981,1994,2100,2243,2276,2300,2303,2308,2309,2310,2314,2315,2316,2564,2623,2624,2802,2815,3187,3208,3430,3719,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4041,4042,4044,4045,4046,4047,4058,4060,4061,4062,4063,4067,4068,4069,4070,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4696,4725,4729,4731,4733,4734,4735,4736,4737,4738,5011,5215,5216,5266,5267,5608,5739,5961,5962,5964,5966,6411,6412,6415,6420,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,7112,7113,7281,7282,7285,7332,7348,7374,7377,7378,7387,7429,7430,7431,7439,7440,7454,7455,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8175,8176,8185,8189,8191,8193,8194,8196,8197,8198,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9402,9433,9434,9645,9646,9651,9652,9874,9875,9876,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9891,9892,9893,9894,9895,9896,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11123,11124,11972,11973,11974,11975,11976,11977,11978,11979,11980,11986,11987,11988,11989,11990,11991,11992,11998,11999,12001,12002,12004,12005,12011,12012,12013,12014,12015,12016,12017,12022,12023,12024,12025,12026,12027,12030,12031,12032,12034,12035,12036,12042,12043,12044,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13018,13021,13023,13025,13026,13027,13028,13029,13030,13034,13036,13038,13039,13040,13042,13043,13046,13047,13052,13055,13058,13059,13064,13065,13066,13067,13068,13070,13071,13072,13073,13074,13075,13076,13077,13081,13082,13083,13085,13088,13089,13091,13093,13095,13096,13100,13102,13103,13107,13109,13111,13112,13113,13115,13116,13117,13118,13119,13120,13121,13123,13125,13126,13128,13129,13130,13132,13133,13134,13135,13138,13139,13144,13145,13199,14216,14220,14224,14225,14228,14230,14232,14233,14234,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14407,14413,14417,14418,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14549,14551,14554,14555,14591,14592,14598,14599,14600,14601,14602,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14760,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15119,15146,15152,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15214,15215,15216,15217,15218,15219,15220,15221,15227,15228,15229,15233,15234,15235,15236,15237,15238,15239,15240,15244,15245,15246,15247,15251,15252,15253,15254,15255,15256,15257,15258,15261,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15359,15362,15363,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15567,15569,15572,15574,15576,15578,15580,15582,15583,15584,15589,15591,15592,15593,15595,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15963,15964,15965,15966,15967,15968,15978,15979,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15990,15991,17007,17050,18339,18343,18672,18674,18679,19114,19115,19116,19117,19118,19119,19120,19121,19159,20579,20580,20581,20582,20615,20616,20617,20618,20619,20625,20626,20627,20628,20629,20630},
})

table.insert(Journal.djDungeons, {
    name   = "Hillsbrad Foothills",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HilsbreadFoothill.blp",
    bosses = {
        {
            bossID = 14280,
            name   = "Big Samras",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14279,
            name   = "Creepthess",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14277,
            name   = "Lady Zephris",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2447,
            name   = "Narillasanz",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14278,
            name   = "Ro'Bark",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14276,
            name   = "Scargil",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14275,
            name   = "Tamra Stormpike",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,720,727,789,790,791,792,793,794,795,863,864,865,866,867,868,873,886,890,897,935,936,1077,1121,1168,1204,1207,1280,1351,1421,1427,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1521,1522,1523,1608,1613,1624,1625,1640,1659,1664,1715,1716,1717,1722,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1849,1850,1852,1853,1980,1988,1990,1993,1994,1996,1997,1998,2011,2013,2017,2059,2072,2073,2075,2077,2078,2079,2080,2140,2156,2158,2159,2160,2194,2214,2215,2216,2217,2219,2220,2221,2222,2227,2230,2231,2233,2236,2245,2246,2276,2277,2278,2565,2566,2568,2569,2578,2580,2582,2583,2584,2620,2621,2623,2624,2632,2643,2648,2721,2800,2805,2815,2819,2877,2878,2879,2911,2912,2951,2957,2958,2961,2962,2964,2965,2966,2967,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3053,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3187,3192,3193,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3207,3210,3211,3212,3213,3341,3345,3374,3375,3376,3377,3378,3379,3380,3381,3429,3430,3569,3591,3592,3597,3598,3602,3603,3643,3645,3647,3651,3652,3655,3656,3732,3733,3739,3740,3741,3743,3750,3751,3752,3753,3754,3755,3758,3759,3760,3761,3763,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4069,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4430,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4614,4661,4677,4678,4683,4684,4689,4690,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4723,4724,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,4794,4795,4796,4797,4798,4799,4800,4816,4817,4818,4824,4825,4826,4827,4828,4829,4830,4831,4832,4833,4835,4836,4837,4838,4998,4999,5001,5002,5003,5007,5009,5011,5215,5216,5542,5608,5624,5755,5766,6238,6241,6266,6267,6268,6269,6282,6336,6337,6360,6378,6379,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6482,6506,6507,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6521,6528,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6829,6830,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7110,7111,7112,7113,7330,7331,7332,7350,7351,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7519,7520,7521,7522,7523,7524,7525,7526,7529,7530,7531,7532,7533,7534,7535,7540,7541,7542,7543,7544,7545,7546,7552,7554,7555,7556,7558,7608,7609,7610,7611,8080,8081,8082,8083,8084,8085,8086,8107,8108,8109,8110,8114,8116,8117,8118,8120,8121,8127,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8178,8194,8196,8199,8245,8252,8258,8265,8271,8273,8275,8276,8277,8278,8283,8284,8285,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8312,8313,8318,8320,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9385,9395,9402,9405,9434,9435,9649,9650,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9906,9907,9908,9909,9910,9911,9912,9915,9916,9917,9918,9919,9920,9921,9922,9923,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9951,9956,9959,9960,9961,9966,9967,9968,9969,9970,9971,9972,9973,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10087,10088,10089,10090,10091,10092,10094,10095,10097,10100,10101,10102,10104,10105,10106,10111,10112,10113,10118,10119,10121,10123,10124,10125,10136,10137,10138,10139,10140,10141,10142,10144,10145,10146,10147,10148,10149,10150,10152,10153,10154,10155,10156,10159,10160,10161,10162,10163,10164,10168,10169,10170,10177,10178,10181,10182,10188,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10232,10233,10234,10235,10236,10237,10247,10248,10249,10250,10251,10253,10255,10256,10257,10258,10259,10260,10261,10263,10265,10267,10268,10269,10270,10272,10274,10275,10276,10277,10279,10280,10281,10282,10287,10288,10289,10362,10363,10364,10365,10366,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10385,10386,10387,10388,10390,10391,10404,10405,10406,10407,10408,10409,10686,11262,11965,11967,11968,11969,11970,11971,11972,11973,11974,11978,11979,11981,11982,11983,11984,11985,11986,11987,11988,11991,11992,11993,11994,11995,11996,11997,11998,11999,12004,12005,12006,12007,12008,12009,12010,12011,12012,12015,12016,12019,12020,12022,12023,12026,12027,12028,12029,12030,12031,12035,12036,12039,12040,12042,12043,12045,12046,12047,12052,12053,12054,12056,12057,12247,12249,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13001,13005,13010,13011,13012,13015,13024,13025,13026,13028,13029,13031,13033,13034,13038,13041,13042,13045,13048,13049,13058,13064,13068,13071,13072,13079,13081,13084,13087,13088,13093,13094,13095,13096,13097,13099,13100,13103,13105,13106,13108,13110,13114,13115,13116,13117,13119,13121,13124,13127,13129,13131,13133,13138,13145,13199,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14120,14121,14124,14125,14126,14127,14128,14129,14130,14131,14132,14133,14141,14142,14143,14144,14157,14158,14159,14160,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14266,14268,14269,14270,14272,14276,14284,14287,14288,14297,14298,14302,14303,14305,14306,14307,14308,14309,14310,14312,14314,14315,14316,14317,14318,14319,14320,14322,14323,14324,14325,14326,14327,14329,14330,14331,14333,14334,14335,14337,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14428,14429,14430,14431,14432,14433,14435,14436,14439,14440,14449,14453,14455,14457,14458,14459,14460,14461,14462,14463,14465,14560,14562,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14653,14654,14656,14657,14659,14660,14670,14671,14675,14676,14677,14678,14681,14682,14683,14684,14685,14686,14687,14688,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14781,14782,14783,14784,14786,14787,14798,14799,14800,14804,14805,14806,14808,14809,14810,14813,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14838,14839,14840,14841,14843,14854,14858,14859,14860,14862,14863,14864,14865,14866,14867,14868,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14905,14906,14909,14910,14911,14914,14918,14924,14925,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14949,14950,14951,14955,14956,14958,14964,14966,14967,14969,14970,14971,14972,14973,14976,14977,14978,14980,14981,14983,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15119,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15168,15169,15172,15173,15178,15179,15185,15188,15189,15191,15192,15193,15194,15195,15210,15211,15212,15213,15214,15215,15218,15219,15220,15222,15223,15224,15225,15226,15230,15231,15232,15233,15234,15238,15239,15241,15242,15243,15244,15246,15248,15249,15250,15251,15255,15256,15257,15259,15260,15261,15262,15264,15265,15266,15267,15268,15269,15270,15271,15272,15273,15276,15278,15281,15282,15287,15288,15296,15307,15311,15312,15313,15324,15325,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15380,15382,15390,15391,15426,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15440,15441,15488,15496,15497,15498,15500,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15620,15624,15625,15626,15632,15640,15648,15650,15651,15655,15657,15658,15660,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15681,15682,15683,15685,15686,15693,15887,15890,15891,15892,15893,15894,15912,15918,15925,15926,15927,15928,15929,15930,15931,15932,15933,15934,15935,15938,15939,15940,15943,15946,15947,15962,15963,15964,15967,15971,15972,15973,15974,15975,15976,15977,15978,15979,15980,15981,15984,15985,15986,15987,15988,15990,15991,18339,18343,18672,18674,18679,45626},
})

table.insert(Journal.djDungeons, {
    name   = "Alterac Mountains",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-AlteracMountains.blp",
    bosses = {
        {
            bossID = 14222,
            name   = "Araga",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14223,
            name   = "Cranky Benj",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14221,
            name   = "Gravis Slipknot",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14281,
            name   = "Jimmy the Bleeder",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2453,
            name   = "Lo'Grosh",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2447,
            name   = "Narillasanz",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2452,
            name   = "Skhowl",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2258,
            name   = "Stone Fury",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,720,727,789,790,791,863,864,865,866,867,868,873,890,936,1121,1204,1207,1280,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1521,1522,1523,1602,1608,1613,1624,1625,1640,1659,1664,1678,1714,1715,1716,1717,1718,1720,1722,1730,1731,1732,1733,1734,1735,1737,1739,1744,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1768,1769,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1789,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1988,1990,1993,1994,1996,1997,1998,2011,2059,2072,2075,2077,2080,2140,2156,2158,2159,2160,2194,2214,2215,2219,2220,2221,2222,2236,2276,2277,2278,2429,2431,2432,2434,2565,2620,2621,2623,2624,2632,2721,2800,2802,2815,2819,2877,2878,2879,2911,2912,2951,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2971,2972,2975,2979,2981,2982,2985,2986,2989,2990,2991,2992,3011,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3187,3192,3193,3197,3198,3199,3201,3202,3203,3206,3207,3210,3212,3213,3214,3279,3281,3282,3283,3284,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3308,3312,3314,3341,3345,3374,3375,3378,3379,3380,3381,3430,3591,3592,3593,3594,3597,3598,3643,3644,3647,3649,3651,3652,3653,3654,3655,3656,3740,3764,3765,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3889,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4069,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4091,4561,4562,4564,4566,4568,4569,4570,4614,4661,4663,4666,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4697,4698,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,4810,4998,4999,5001,5002,5003,5007,5009,5011,5215,5216,5608,5624,5755,6266,6267,6268,6269,6327,6336,6337,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6549,6555,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6975,6976,6977,7108,7109,7110,7111,7112,7113,7330,7331,7332,7350,7351,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7519,7520,7521,7522,7523,7524,7525,7526,7529,7530,7531,7532,7533,7534,7535,7540,7541,7542,7543,7544,7545,7546,7552,7555,7556,7558,7608,7609,7610,7611,8080,8081,8082,8083,8084,8085,8086,8107,8108,8109,8110,8114,8116,8117,8118,8120,8121,8127,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8178,8194,8196,8199,8273,8276,8277,8278,8283,8289,8290,8296,8300,8303,8307,8308,8309,8310,8313,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9385,9395,9405,9433,9434,9435,9742,9743,9744,9745,9746,9747,9750,9751,9752,9753,9754,9755,9756,9758,9759,9760,9761,9762,9763,9764,9766,9767,9771,9776,9778,9780,9781,9782,9783,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9906,9907,9908,9909,9910,9911,9912,9915,9916,9917,9918,9919,9920,9921,9922,9923,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9951,9956,9959,9960,9961,9966,9967,9968,9969,9970,9971,9972,9973,10087,10088,10089,10090,10091,10092,10094,10105,10136,10137,10139,10140,10141,10142,10144,10146,10147,10149,10150,10152,10153,10154,10155,10156,10160,10161,10162,10163,10210,10215,10217,10218,10219,10220,10226,10227,10228,10230,10247,10248,10249,10250,10251,10253,10255,10256,10257,10258,10259,10260,10261,10263,10265,10267,10268,10269,10270,10272,10274,10275,10287,10288,10289,10363,10366,10368,10373,10376,10378,10379,10380,10382,10383,10385,10386,10387,10388,10390,10391,10404,10405,10406,10407,10408,10409,11965,11967,11968,11969,11970,11971,11972,11973,11974,11979,11981,11982,11983,11984,11985,11986,11987,11988,11992,11993,11994,11995,11996,11997,11998,11999,12005,12006,12007,12008,12009,12010,12011,12012,12016,12019,12020,12022,12023,12027,12028,12029,12030,12031,12036,12039,12040,12042,12043,12046,12047,12052,12053,12054,12057,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13021,13024,13025,13026,13029,13031,13033,13034,13038,13041,13042,13045,13048,13049,13058,13064,13068,13071,13074,13079,13081,13082,13084,13087,13088,13093,13094,13095,13097,13099,13100,13102,13103,13105,13106,13108,13110,13114,13115,13117,13119,13121,13124,13127,13128,13129,13131,13132,13138,13145,13199,14090,14091,14094,14095,14097,14099,14102,14110,14113,14116,14126,14127,14133,14157,14158,14159,14162,14163,14165,14168,14170,14171,14172,14173,14175,14176,14177,14178,14179,14180,14183,14184,14186,14189,14190,14191,14192,14193,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14266,14268,14269,14270,14272,14276,14303,14306,14308,14312,14317,14318,14322,14323,14324,14325,14326,14329,14330,14333,14334,14335,14337,14365,14369,14371,14373,14374,14375,14376,14377,14379,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14428,14429,14430,14431,14432,14433,14435,14436,14439,14440,14458,14460,14461,14462,14463,14465,14562,14566,14567,14568,14569,14572,14574,14578,14579,14581,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14653,14654,14656,14657,14659,14660,14681,14684,14685,14686,14687,14688,14730,14742,14743,14746,14747,14748,14749,14751,14753,14754,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14781,14782,14783,14784,14786,14787,14809,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14838,14839,14840,14841,14843,14862,14863,14865,14866,14867,14868,14895,14896,14897,14898,14899,14900,14901,14902,14903,14905,14906,14909,14910,14911,14914,14918,14931,14935,14936,14939,14940,14941,14942,14943,14944,14945,14946,14947,14949,14950,14951,14955,14956,14966,14973,14976,14977,14978,14980,14981,15009,15010,15011,15013,15015,15113,15115,15116,15117,15118,15120,15122,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15168,15169,15172,15173,15178,15189,15192,15193,15194,15195,15211,15212,15213,15214,15215,15220,15223,15224,15225,15226,15230,15231,15232,15233,15234,15239,15241,15242,15243,15244,15246,15248,15249,15250,15251,15257,15259,15260,15261,15262,15266,15267,15269,15270,15273,15278,15282,15287,15288,15296,15297,15298,15300,15301,15302,15303,15311,15313,15325,15329,15330,15331,15333,15337,15339,15341,15342,15343,15344,15345,15346,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15380,15382,15430,15433,15434,15435,15436,15437,15438,15440,15441,15477,15479,15480,15481,15482,15484,15485,15486,15490,15492,15495,15500,15503,15504,15505,15511,15512,15513,15514,15515,15517,15518,15519,15520,15522,15524,15526,15528,15529,15530,15531,15532,15533,15534,15535,15536,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15620,15624,15625,15626,15632,15660,15664,15665,15667,15669,15670,15672,15674,15675,15676,15677,15678,15679,15682,15683,15685,15686,15887,15891,15892,15894,15895,15912,15918,15925,15927,15928,15929,15931,15932,15933,15934,15935,15940,15943,15944,15946,15962,15963,15964,15969,15970,15972,15973,15974,15975,15976,15977,15978,15979,15980,15981,15986,15987,15988,15990,15991,17690,17691,17900,17901,17902,17903,17904,17905,17906,17907,17908,17909,18343,18679,19083,19084,19085,19086,19087,19088,19089,19090,19091,19092,19093,19094,19095,19096,19097,19098,19099,19100,19101,19102,19103,19104,19106,19107,19108,19308,19309,19310,19311,19312,19315,19321,19323,19325,20369,20556,20648,21563},
})

table.insert(Journal.djDungeons, {
    name   = "Silverpine Forest",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SilverpineForest.blp",
    bosses = {
        {
            bossID = 1920,
            name   = "Dalaran Spellscribe",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 12431,
            name   = "Gorefang",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 12433,
            name   = "Krethis Shadowspinner",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 12432,
            name   = "Old Vicejaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2283,
            name   = "Ravenclaw Regent",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1944,
            name   = "Rot Hide Bruiser",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1948,
            name   = "Snarlmane",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,720,727,789,790,792,793,794,795,796,797,798,799,826,827,837,838,839,840,843,844,845,846,847,848,849,850,890,935,1121,1202,1211,1214,1287,1391,1394,1405,1421,1427,1438,1440,1446,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1717,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1839,1840,1843,1844,1845,1846,1926,1928,1929,1936,1943,1944,1945,1958,1959,2011,2059,2072,2073,2075,2077,2078,2079,2088,2140,2156,2158,2159,2160,2194,2214,2215,2216,2217,2219,2220,2221,2222,2236,2632,2643,2648,2800,2818,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2878,2879,2911,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3186,3192,3193,3195,3196,3198,3199,3201,3202,3203,3205,3206,3207,3210,3211,3212,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3324,3374,3375,3376,3377,3378,3379,3380,3381,3449,3450,3451,3452,3453,3454,3457,3458,3461,3462,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3570,3581,3582,3583,3585,3586,3589,3590,3591,3592,3597,3598,3602,3603,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3656,3740,3835,3836,3842,3844,3848,4036,4037,4049,4051,4064,4072,4290,4436,4437,4439,4445,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4661,4663,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4767,4768,4771,4777,4778,4781,4782,4786,4788,4789,4817,4818,4998,4999,5001,5002,5110,5540,5969,5975,6040,6214,6266,6267,6268,6269,6336,6337,6350,6378,6379,6380,6381,6382,6383,6386,6387,6388,6393,6394,6395,6397,6398,6399,6414,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6611,6612,6613,6614,6615,6617,6628,7108,7109,7350,7351,7356,7415,7419,7554,7558,7608,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8178,8748,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9770,9771,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9821,9822,9827,9829,9831,9837,9838,10287,10404,10405,10407,11965,11967,11968,11969,11981,11982,11983,11984,11993,11994,11995,12006,12007,12008,12047,12052,12053,12054,12259,12405,12406,12408,12409,12410,12414,12773,12775,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13049,13079,13094,13097,13099,13114,13131,14025,14086,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14179,14364,14365,14366,14367,14368,14369,14370,14371,14373,14374,14375,14376,14377,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14571,14572,14574,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14745,14746,14747,14748,14749,15004,15005,15006,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15122,15124,15210,15211,15212,15222,15223,15224,15230,15241,15242,15248,15249,15259,15268,15269,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15333,15348,15472,15473,15476,15477,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15517,15519,15520,15526,15528,15532,15891,15893,15894,15912,15925,15926,15927,15932,15933,15944,15945,15946,15969,15970,15971,15972,15974,17187,29201,29202,29203},
})
table.insert(Journal.djDungeons, {
    name   = "Tirisfal Glades",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-UndeadBrill.blp",
    bosses = {
        {
            bossID = 10356,
            name   = "Bayne",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1911,
            name   = "Deeb",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1936,
            name   = "Farmer Solliden",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10358,
            name   = "Fellicent's Shade",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1531,
            name   = "Lost Soul",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1910,
            name   = "Muad",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10357,
            name   = "Ressan the Needler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10359,
            name   = "Sri'skulk",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1533,
            name   = "Tormented Spirit",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {85,193,194,195,209,210,711,714,720,727,791,826,865,1200,1211,1287,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1394,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1717,1730,1731,1732,1733,1734,1735,1737,1754,1755,1756,1757,1758,1759,1760,1761,1780,1782,1783,1784,1785,1786,1803,1804,1805,1806,1807,1808,1809,1810,1835,1836,1926,2073,2075,2077,2080,2088,2140,2173,2210,2211,2212,2213,2214,2215,2221,2222,2278,2300,2303,2308,2309,2310,2314,2315,2316,2364,2366,2367,2369,2370,2371,2372,2373,2374,2375,2376,2386,2387,2388,2389,2390,2391,2398,2399,2400,2401,2402,2403,2568,2569,2578,2580,2582,2583,2584,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2721,2819,2877,2878,2912,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2970,2971,2972,2974,2975,2976,2977,2978,2979,2980,3020,3185,3186,3192,3200,3201,3203,3206,3207,3210,3213,3214,3260,3261,3263,3270,3272,3273,3274,3275,3276,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3307,3308,3309,3312,3314,3321,3322,3323,3328,3330,3331,3332,3363,3365,3370,3373,3374,3375,3380,3381,3435,3437,3439,3440,3442,3444,3446,3447,3595,3596,3606,3607,3641,3642,3643,3644,3649,3650,3651,3652,3653,3654,3719,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3833,3834,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4037,4040,4048,4049,4050,4051,4055,4064,4071,4072,4073,4075,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4261,4263,4303,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4561,4562,4564,4566,4567,4569,4570,4614,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4701,4711,4712,4716,4717,4719,4720,4722,4767,4768,4771,5002,5003,5007,5542,5739,5766,5819,5939,5940,5941,5961,5962,5964,5966,6060,6063,6238,6241,6266,6267,6268,6269,6336,6337,6386,6387,6388,6389,6393,6395,6396,6397,6398,6399,6400,6403,6406,6407,6408,6409,6410,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6539,6541,6542,6543,6548,6549,6550,6555,6556,6557,6558,6559,6590,6592,6594,6595,6596,6597,6598,6599,6601,6603,6605,6607,6609,6610,6611,6612,6613,6614,6615,6616,6617,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7109,7110,7115,7116,7117,7118,7281,7282,7285,7330,7331,7348,7350,7351,7354,7355,7356,7357,7366,7367,7368,7370,7374,7377,7378,7387,7406,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7419,7420,7421,7422,7423,7424,7460,7727,7728,7752,7754,7786,7787,8080,8081,8082,8083,8084,8085,8086,8175,8176,8178,8185,8189,8191,8193,8197,8198,8226,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9395,9405,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9786,9791,9797,9798,9800,9808,9809,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9847,9853,9857,9860,9865,9867,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10288,10289,10404,10406,10408,10409,11847,11848,11849,11850,11851,11852,11969,11970,11984,11995,11996,12008,12009,12019,12028,12039,12047,12299,13005,13011,13012,13024,13031,13033,13048,13049,13079,13087,13094,13097,13099,13106,13108,13114,13127,13131,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14100,14101,14102,14103,14106,14108,14109,14110,14111,14112,14113,14114,14115,14116,14117,14128,14130,14132,14141,14142,14143,14144,14178,14180,14181,14182,14183,14184,14186,14187,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14201,14205,14206,14209,14210,14211,14214,14219,14365,14372,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14409,14414,14416,14570,14578,14579,14581,14582,14583,14585,14587,14608,14724,14744,14750,14751,14753,14754,14755,14756,14757,14758,14759,14761,14763,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15015,15016,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15121,15123,15125,15126,15127,15128,15129,15130,15131,15132,15133,15135,15136,15137,15139,15140,15143,15147,15148,15210,15225,15231,15232,15242,15250,15268,15297,15298,15299,15300,15301,15302,15303,15304,15306,15309,15337,15338,15339,15341,15342,15343,15344,15345,15346,15347,15349,15350,15351,15352,15354,15355,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15489,15490,15491,15492,15495,15518,15522,15524,15525,15529,15530,15531,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15547,15548,15549,15553,15554,15555,15556,15559,15560,15568,15799,15800,15801,15892,15895,15925,15928,15932,15933,15934,15935,15944,15947,15962,15969,15970,15973,15975,16607,17183,17185,17759,44346,44347,44348,44349,44579,44583,44590,44591,44592,44593,44594,44595,44596,44597,45626},
})

table.insert(Journal.djDungeons, {
    name = "Undercity", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Undercity.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {85,193,194,195,200,201,202,203,209,210,236,237,238,239,285,286,287,711,714,718,792,793,794,795,796,797,798,799,837,838,839,840,843,844,845,846,847,848,849,850,1200,1202,1835,1836,1839,1840,1843,1844,1845,1846,1849,1850,1852,1853,2032,2141,2142,2143,2144,2145,2146,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2300,2303,2308,2309,2310,2314,2315,2316,2364,2366,2367,2369,2370,2371,2372,2373,2374,2375,2376,2386,2387,2388,2389,2390,2391,2392,2393,2394,2395,2396,2397,2398,2399,2400,2401,2402,2403,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2431,2432,2434,2435,2437,2438,2440,2446,2448,2451,2463,2464,2465,2467,2468,2469,2470,2471,2472,2473,2474,2475,2568,2569,2578,2580,2582,2583,2584,2612,2613,2614,2615,2616,2617,2618,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3235,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3587,3588,3589,3590,3591,3592,3593,3594,3595,3596,3597,3598,3602,3603,3606,3607,3719,3747,3749,3835,3836,3842,3844,3848,3889,3890,3891,3892,3893,3894,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4443,4534,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6335,6350,6802,6803,6804,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7132,7281,7282,7285,7298,7348,7374,7377,7378,7387,7507,7510,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8088,8089,8090,8091,8092,8093,8094,8175,8176,8185,8189,8191,8193,8197,8198,8350,9514,9998,9999,10001,10002,10003,10004,10019,10021,10023,10024,10026,10027,10028,10031,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,10637,10638,10711,10823,10824,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15449,15450,15451,15995,15999,16008,17039,17043,17183,17185,17187,17189,17190,17192,20642,20643,29201,29202,29203,30696,43515,43654,43655,43656,43657,43660,43661,43663,43664,45626,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Western Plaguelands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-WPL.blp",
    bosses = {
        {
            bossID = 1844,
            name   = "Foreman Marcrid",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1847,
            name   = "Foulmane",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1848,
            name   = "Lord Maldazzar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1850,
            name   = "Putridius",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1841,
            name   = "Scarlet Executioner",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1838,
            name   = "Scarlet Interrogator",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1837,
            name   = "Scarlet Judge",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 1885,
            name   = "Scarlet Smith",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,942,943,944,1168,1203,1315,1443,1607,1639,1721,1979,2100,2243,2244,2245,2246,2564,2801,3075,3475,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5266,5267,7517,7518,7527,7537,7557,8080,8081,8082,8083,8084,8085,8086,8106,8112,8113,8119,8123,8126,8128,8129,8130,8131,8132,8133,8134,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8274,8275,8280,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9936,9939,9940,9941,9942,9943,9944,9946,9948,9950,9952,9953,9954,9955,9957,9958,9964,9965,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10080,10081,10082,10083,10084,10085,10086,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10203,10204,10205,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11975,11976,11977,11978,11979,11980,11989,11990,11991,11992,12001,12002,12004,12005,12013,12014,12015,12016,12017,12024,12025,12026,12027,12034,12035,12036,12044,12045,12046,12048,12055,12056,12057,12058,12895,12903,12945,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13018,13021,13022,13023,13027,13028,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13059,13065,13066,13067,13070,13072,13073,13075,13076,13077,13083,13085,13089,13091,13096,13101,13102,13107,13109,13111,13112,13113,13116,13118,13120,13122,13123,13125,13126,13130,13133,13134,13135,13139,13144,13473,13475,13986,14002,14265,14267,14271,14274,14275,14277,14278,14279,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14427,14434,14437,14441,14442,14443,14444,14445,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14551,14552,14553,14554,14555,14558,14655,14658,14661,14662,14664,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14779,14780,14788,14789,14790,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14844,14846,14847,14848,14849,14850,14851,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14912,14913,14915,14916,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14948,14952,14953,14954,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15170,15171,15174,15175,15176,15177,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15216,15217,15218,15219,15220,15221,15227,15228,15229,15236,15237,15238,15239,15240,15245,15246,15247,15252,15253,15254,15255,15256,15257,15258,15263,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15288,15289,15291,15294,15295,15296,15323,15324,15325,15381,15384,15385,15387,15388,15389,15390,15391,15392,15393,15394,15395,15411,15413,15421,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15621,15622,15623,15627,15630,15631,15633,15634,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15799,15800,15801,15804,15805,15806,15812,15813,15887,15890,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15965,15966,15967,15968,15982,15983,15984,15985,15986,15987,15988,15989,15991,16058,16723,17007,17759,18339,18343,18672,18674,18679,20504,20505,24222},
})

table.insert(Journal.djDungeons, {
    name   = "Eastern Plaguelands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-EPL.blp",
    bosses = {
        {
            bossID = 10827,
            name   = "Deathspeaker Selendre",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10817,
            name   = "Duggan Wildhammer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10825,
            name   = "Gish the Unmoving",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10821,
            name   = "Hed'mush the Rotting",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10828,
            name   = "High General Abbendis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10826,
            name   = "Lord Darkscythe",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 16184,
            name   = "Nerubian Overseer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10824,
            name   = "Ranger Lord Hawkspear",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10822,
            name   = "Warlord Thresh'jin",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10823,
            name   = "Zul'Brin Warpbranch",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,890,942,944,1121,1168,1203,1315,1443,1607,1608,1721,1746,1747,1748,1749,1750,1751,1752,1753,1772,1774,1775,1776,1777,1778,1795,1796,1797,1798,1799,1800,1801,1802,1979,1994,2011,2059,2072,2194,2219,2220,2236,2243,2244,2245,2246,2564,2800,2801,2819,2911,3021,3045,3047,3048,3049,3055,3056,3057,3058,3066,3067,3069,3075,3201,3202,3206,3212,3378,3379,3656,3740,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4036,4049,4069,4082,4084,4088,4661,4696,4705,4706,4707,4708,4709,4711,4713,4714,4715,4733,4998,4999,5001,5266,5267,6383,6393,6394,6427,6430,6566,6567,6568,6569,6579,6584,6587,6591,6593,6594,6595,6596,6597,6598,6600,6601,6602,6604,6605,6608,6612,6613,6614,7113,7517,7518,7519,7520,7521,7523,7526,7527,7529,7530,7531,7532,7535,7540,7541,7542,7543,7546,7557,7558,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8113,8114,8116,8117,8118,8119,8121,8126,8127,8131,8132,8133,8134,8135,8138,8143,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9769,9771,9772,9773,9774,9792,9793,9794,9795,9796,9797,9799,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9813,9814,9815,9816,9817,9818,9911,9922,9940,9942,9943,9944,9946,9950,9951,9953,9954,9955,9956,9957,9958,9960,9961,9974,10057,10058,10059,10061,10062,10063,10064,10065,10068,10070,10072,10073,10074,10075,10077,10078,10080,10081,10082,10083,10084,10085,10087,10090,10091,10092,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10203,10204,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10287,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11968,11974,11976,11977,11978,11979,11980,11983,11988,11989,11990,11991,11992,11994,11995,11999,12001,12002,12004,12005,12007,12008,12014,12015,12016,12017,12024,12025,12026,12027,12034,12035,12036,12043,12044,12045,12046,12048,12054,12055,12056,12057,12058,12990,12994,12996,12997,12998,12999,13000,13001,13002,13003,13004,13006,13007,13008,13009,13010,13011,13012,13013,13014,13015,13022,13023,13027,13028,13030,13031,13036,13040,13041,13046,13047,13052,13056,13059,13065,13066,13067,13070,13072,13073,13075,13077,13083,13085,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13125,13126,13130,13133,13135,13139,13144,13216,13217,13243,13249,13315,14127,14133,14157,14158,14163,14165,14176,14177,14179,14181,14182,14185,14187,14188,14194,14237,14244,14249,14254,14259,14265,14266,14267,14268,14269,14272,14274,14275,14276,14277,14278,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14372,14373,14374,14375,14377,14378,14380,14433,14436,14437,14439,14440,14441,14444,14445,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14552,14553,14554,14555,14558,14566,14570,14572,14573,14574,14580,14582,14653,14657,14659,14660,14662,14664,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14742,14744,14748,14749,14750,14752,14755,14783,14784,14786,14787,14789,14790,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14840,14843,14844,14846,14848,14849,14850,14851,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14911,14912,14914,14915,14916,14918,14919,14920,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14947,14948,14949,14950,14951,14952,14954,14955,14957,14958,14959,14960,14961,14962,14963,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15116,15117,15118,15119,15120,15121,15122,15123,15124,15164,15170,15171,15172,15173,15174,15175,15176,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15212,15216,15217,15218,15219,15220,15221,15223,15224,15228,15229,15230,15236,15237,15238,15239,15240,15241,15245,15246,15247,15249,15253,15254,15255,15256,15257,15258,15259,15262,15263,15264,15265,15266,15267,15269,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15288,15289,15291,15294,15295,15296,15313,15323,15324,15325,15329,15330,15332,15334,15336,15338,15340,15347,15348,15373,15376,15378,15380,15381,15384,15387,15388,15389,15390,15391,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15500,15511,15512,15513,15514,15515,15516,15517,15520,15521,15523,15525,15526,15527,15528,15532,15537,15601,15604,15609,15615,15616,15618,15620,15621,15622,15623,15625,15626,15627,15631,15632,15633,15634,15637,15639,15640,15641,15642,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15815,15854,15855,15856,15857,15887,15890,15891,15894,15927,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15947,15966,15967,15968,15972,15974,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15991,16994,16995,16996,16997,16998,17001,17003,17004,17007,17523,18022,18339,18343,18672,18674,18679,22656,22657,22659,22667,22668,22680,22681,22688,22689,22690,24222,38645,38646,38647,38648,38649,38650,38651},
})

table.insert(Journal.djDungeons, {
    name   = "Ghostlands",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-GhostiesLand.blp",
    bosses = {
        {
            bossID = 22062,
            name   = "Dr. Whitherlimb",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,727,789,790,826,827,890,911,920,935,1076,1121,1211,1214,1218,1220,1287,1296,1299,1300,1364,1369,1376,1391,1394,1405,1406,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1926,1928,1929,1934,1936,1943,1944,1945,1958,1959,2034,2059,2073,2075,2078,2079,2088,2140,2166,2167,2168,2175,2194,2212,2213,2214,2215,2216,2217,2219,2220,2232,2236,2632,2635,2642,2643,2644,2645,2646,2648,2652,2656,2879,2911,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3021,3057,3058,3065,3066,3184,3192,3193,3195,3196,3198,3199,3200,3202,3205,3207,3211,3213,3214,3227,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3365,3370,3373,3374,3375,3376,3377,3378,3379,3429,3597,3598,3641,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3740,4290,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4697,4698,4699,4700,4701,4706,4708,4709,4710,4767,4768,4771,4788,4949,4998,5110,6266,6267,6268,6269,6336,6337,6378,6379,6380,6381,6382,6383,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,7108,7109,7298,7350,7351,7509,7554,7558,7608,8178,8350,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9770,9771,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9792,9793,9794,9801,9805,9810,9811,9812,9813,9814,9815,9816,9818,10405,10407,11965,11967,11981,11982,11993,11994,12006,12007,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,14025,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14159,14160,14161,14162,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14179,14364,14365,14366,14367,14368,14369,14370,14371,14373,14374,14375,14376,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14571,14572,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14745,14746,14747,14748,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15117,15122,15124,15210,15211,15222,15223,15224,15230,15248,15259,15268,15269,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15329,15330,15331,15333,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15515,15517,15519,15526,15893,15894,15895,15912,15925,15926,15932,15933,15944,15945,15946,15969,15970,15971,15972,22783,22784,22979,22980,22984,22985,22986,22987,22990,22991,22992,22993,22995,22996,22998,23400,23401,23402,23403,23404,23405,23406,23407,23408,23410,23411,23412,23413,23414,23415,24339,24340,24341,28141,28142,28143,28144,28149,28150,28151,28152,28153,28154,28155,28156,28157,28158,28159,28160,28161,28162,28163,28164,28303,29583,29584,30504,30505,31268,31269,31270},
})

table.insert(Journal.djDungeons, {
    name   = "Eversong Woods",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-EversongForest.blp",
    bosses = {
        {
            bossID = 16854,
            name   = "Eldinarcus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 16855,
            name   = "Tregla",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {727,826,1211,1287,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1394,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1926,2073,2075,2088,2140,2210,2211,2212,2213,2214,2215,2300,2303,2308,2309,2310,2314,2315,2316,2364,2366,2367,2369,2370,2371,2372,2373,2374,2375,2376,2398,2399,2400,2401,2402,2403,2568,2569,2578,2580,2582,2583,2584,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2971,2972,2975,2976,2978,2979,2980,3192,3200,3207,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3307,3308,3312,3314,3363,3365,3370,3373,3374,3375,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3606,3607,3641,3642,3643,3644,3649,3650,3651,3652,3653,3654,3719,3835,3836,3842,3844,3848,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4561,4562,4564,4566,4569,4570,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4767,4768,4771,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6266,6267,6268,6269,6336,6337,6350,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6542,6543,6549,6550,6555,6556,6558,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7109,7281,7282,7285,7348,7350,7351,7374,7377,7378,7387,7508,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8175,8176,8178,8185,8189,8191,8193,8197,8198,9513,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14086,14087,14088,14089,14090,14091,14093,14094,14095,14097,14098,14099,14100,14101,14102,14103,14106,14108,14110,14111,14112,14113,14115,14116,14128,14130,14132,14141,14142,14143,14144,14365,15003,15004,15005,15006,15007,15008,15009,15010,15011,15013,15015,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15297,15298,15299,15300,15301,15302,15303,15309,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15490,15491,15492,15495,15895,15925,15932,15933,15944,15969,15970,17185,20818,20820,20821,20823,20826,20827,20828,20832,20841,20907,20909,20911,20912,20914,20915,20916,20917,20918,20919,20920,20921,20922,20923,20924,20925,20955,20960,20961,20964,20985,20986,20987,20988,20989,20990,20991,20992,20993,20994,20995,20996,20997,20998,20999,21000,21001,21002,21003,21004,21005,21006,21007,21008,21009,21010,21011,21012,21013,21014,21015,21016,21017,21018,21019,21020,21021,21022,21748,21755,21764,21765,21767,21768,21775,21790,21791,21932,21933,21934,22951,22952,22953,22964,22965,22966,23265,23266,23267,23367,23375,23376,23377,23395,23397,23399,23924,24241,25438,25439,27552,28146,28147,28148,29157,29158,29159,29160,29201,29202,29203,30419,30420,30421,30422,30804,45626,45627},
})

table.insert(Journal.djDungeons, {
    name = "Isle of Quel'Danas", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-IsleofQD.blp", -- placeholder
    bosses = {
        {
            bossID = 26090,
            spells = {},
            name = "Karyanna",
            flat = itemdir,
        },
        {
            bossID = 26089,
            spells = {},
            name = "Kayri",
            flat = itemdir,
        },
        {
            bossID = 26089,
            spells = {},
            name = "Kayri",
            flat = itemdir,
        },
        {
            bossID = 25977,
            spells = {},
            name = "Yrmi",
            flat = itemdir,
        },
    },
    items = {24544,24545,24546,24547,24549,24552,24553,24554,24555,24556,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25039,25040,25041,25042,25043,25053,25054,25055,25056,25057,25067,25068,25069,25070,25071,25081,25082,25083,25084,25085,25095,25096,25097,25098,25099,25109,25110,25111,25112,25113,25123,25124,25125,25126,25127,25137,25138,25139,25140,25141,25151,25152,25153,25154,25155,25165,25166,25167,25168,25169,25179,25180,25181,25182,25183,25193,25194,25195,25196,25197,25207,25208,25209,25210,25211,25221,25222,25223,25224,25225,25235,25236,25237,25238,25239,25249,25250,25251,25252,25253,25263,25264,25265,25266,25267,25277,25278,25279,25280,25281,25291,25292,25293,25294,25295,25305,25306,25307,25308,25309,25319,25320,25321,25322,25323,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,25830,25831,25832,25833,25834,25854,25855,25856,25857,25858,25997,25998,25999,26000,26001,27469,27470,27471,27472,27473,27702,27703,27704,27705,27706,27707,27708,27709,27710,27711,27879,27880,27881,27882,27883,28126,28127,28128,28129,28130,28136,28137,28138,28139,28140,28331,28332,28333,28334,28335,28540,28541,28542,28543,28544,30186,30187,30188,30200,30201,30486,30487,30488,30489,30490,31190,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31375,31376,31377,31378,31379,31396,31397,31400,31406,31407,31409,31410,31411,31412,31413,31613,31614,31616,31618,31619,31960,31961,31962,31963,31964,31967,31968,31969,31971,31972,31973,31974,31975,31976,31977,31979,31980,31981,31982,31983,31987,31988,31989,31990,31991,31992,31993,31995,31996,31997,31998,31999,32000,32001,32002,32004,32005,32006,32007,32008,32009,32010,32011,32012,32013,32015,32016,32017,32018,32019,32020,32021,32022,32023,32024,32029,32030,32031,32032,32033,32034,32035,32036,32037,32038,32039,32040,32041,32042,32043,32047,32048,32049,32050,32051,32056,32057,32058,32059,32060,32785,32786,32787,32788,32789,32790,32791,32792,32793,32794,32795,32796,32797,32798,32799,32800,32801,32802,32803,32804,32805,32806,32807,32808,32809,32810,32811,32812,32813,32814,32816,32817,32818,32819,32820,32821,32979,32980,32981,32988,32989,32990,32997,32998,32999,33811,33812,33813,33876,33877,33878,33879,33880,33881,33882,33883,33884,33885,33886,33887,33888,33889,33890,33891,33892,33893,33894,33895,33896,33897,33898,33899,33900,33901,33902,33903,33904,33905,33906,33907,33908,33909,33910,33911,33912,33913,33914,33915,33916,33917,34381,34382,34383,34384,34385,34386,34388,34389,34390,34392,34393,34394,34395,34396,34397,34399,34400,34401,34402,34403,34404,34405,34406,34407,34408,34409,34431,34432,34433,34434,34435,34436,34437,34438,34439,34441,34442,34443,34444,34445,34446,34447,34448,34485,34487,34488,34527,34528,34541,34542,34543,34545,34546,34547,34549,34554,34555,34556,34557,34558,34559,34560,34561,34562,34563,34564,34565,34566,34567,34568,34569,34570,34571,34572,34573,34574,34575,34665,34666,34667,34670,34671,34672,34673,34674,34675,34676,34677,34678,34679,34680,34887,34888,34889,34890,34891,34892,34893,34894,34895,34896,34898,34900,34901,34902,34903,34904,34905,34906,34910,34911,34912,34914,34916,34917,34918,34919,34921,34922,34923,34924,34925,34926,34927,34928,34929,34930,34931,34932,34933,34934,34935,34936,34937,34938,34939,34940,34941,34942,34943,34944,34945,34946,34947,34949,34950,34951,34952},
})

table.insert(Journal.djDungeons, {
    name   = "Tanaris",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Tanaris.blp",
    bosses = {
        {
            bossID = 8202,
            name   = "Cyclok the Mad",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8207,
            name   = "Greater Firebird",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8205,
            name   = "Haarka the Ravenous",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8200,
            name   = "Jin'Zallah the Sandbringer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8203,
            name   = "Kregg Keelhaul",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8208,
            name   = "Murderous Blisterpaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8201,
            name   = "Omgorn the Lost",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8204,
            name   = "Soriid the Devourer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8199,
            name   = "Warleader Krazzilak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {791,863,864,865,866,867,868,873,936,940,942,943,1169,1203,1204,1207,1315,1447,1521,1607,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1717,1718,1720,1721,1722,1758,1782,1803,1808,1979,1980,1981,1988,1990,1994,2080,2100,2276,2277,2278,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2448,2451,2564,2565,2623,2624,2721,2802,2815,2877,2878,2912,2951,3020,3185,3186,3187,3197,3208,3210,3380,3430,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3891,3894,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3974,3975,3986,3987,3989,3992,3993,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4069,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4368,4385,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,5002,5003,5007,5009,5011,5215,5216,5266,5267,5608,6386,6388,6389,6396,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6603,6607,6609,6610,6616,6617,6726,6727,7110,7111,7112,7113,7189,7330,7331,7332,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7609,7610,7611,8082,8083,8085,8086,8088,8089,8090,8091,8092,8093,8094,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8289,8290,8291,8293,8294,8295,8296,8297,8298,8300,8303,8304,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8746,8747,8748,8749,8750,8751,8752,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9385,9395,9402,9405,9433,9434,9435,9533,9534,9634,9635,9636,9637,9638,9642,9643,9644,9819,9820,9821,9823,9824,9825,9826,9827,9828,9830,9832,9833,9834,9835,9836,9837,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10103,10105,10106,10107,10108,10109,10110,10111,10113,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10139,10140,10141,10142,10143,10144,10146,10147,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10160,10161,10162,10163,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10179,10180,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10212,10215,10217,10218,10219,10220,10224,10226,10227,10228,10229,10230,10231,10233,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10282,10288,10289,10363,10366,10367,10368,10370,10373,10375,10376,10378,10379,10380,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10404,10406,10408,10409,10500,10502,10503,10504,10508,10542,10543,10588,10749,10750,10751,10826,10827,11502,11970,11971,11972,11973,11974,11975,11976,11977,11979,11980,11985,11986,11987,11988,11989,11990,11992,11996,11997,11998,11999,12001,12002,12005,12009,12010,12011,12012,12013,12014,12015,12016,12017,12019,12020,12022,12023,12024,12025,12027,12028,12029,12030,12031,12032,12034,12035,12036,12039,12040,12042,12043,12044,12045,12046,12047,12048,12055,12056,12057,12058,13000,13001,13006,13008,13009,13014,13015,13018,13021,13022,13023,13025,13026,13027,13028,13029,13030,13033,13034,13038,13039,13042,13043,13045,13046,13048,13052,13055,13058,13059,13064,13065,13066,13067,13068,13071,13072,13073,13074,13075,13076,13079,13081,13082,13083,13084,13085,13087,13088,13089,13093,13094,13095,13096,13100,13102,13103,13105,13106,13107,13108,13109,13110,13111,13112,13113,13114,13115,13116,13117,13119,13120,13121,13122,13123,13124,13125,13126,13127,13128,13129,13132,13133,13134,13138,13139,13144,13145,13199,14216,14220,14224,14225,14228,14230,14232,14233,14234,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14308,14309,14311,14312,14313,14317,14318,14320,14321,14322,14323,14324,14325,14326,14328,14329,14330,14332,14333,14334,14335,14336,14337,14407,14413,14417,14418,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14454,14456,14458,14459,14460,14461,14462,14463,14464,14465,14549,14551,14591,14592,14598,14599,14600,14601,14602,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14671,14672,14673,14674,14675,14678,14680,14681,14684,14685,14686,14687,14688,14760,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14801,14802,14803,14805,14806,14807,14809,14811,14812,14813,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14855,14856,14857,14859,14860,14861,14862,14863,14865,14866,14867,14868,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14934,14935,14936,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,15119,15146,15152,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15213,15214,15215,15216,15217,15218,15220,15221,15225,15226,15227,15228,15229,15231,15232,15233,15234,15235,15236,15237,15239,15240,15242,15243,15244,15245,15246,15247,15250,15251,15252,15253,15254,15255,15257,15258,15260,15261,15262,15263,15264,15266,15267,15270,15271,15273,15274,15275,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15359,15362,15363,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15427,15428,15430,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15567,15569,15572,15574,15576,15578,15580,15582,15583,15584,15589,15591,15592,15593,15595,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15659,15660,15661,15662,15663,15664,15665,15667,15669,15670,15671,15672,15674,15675,15676,15677,15678,15679,15680,15682,15683,15684,15685,15686,15687,15694,15887,15918,15928,15929,15930,15931,15934,15935,15936,15937,15940,15941,15942,15943,15963,15964,15965,15966,15968,15978,15979,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15990,15991,15995,15999,16008,16738,16739,17007,17055,17189,17190,18343,18679,20218,20219,20640,20641,21196,21197,21198,21199,21200,21201,21202,21203,21204,21205,21206,21207,21208,21209,21210,21517,21526,21527,22589,22630,22631,22632,23836,23838,23839,29181,29182,29183,29184,29185,29294,29295,29296,29297,29298,29299,29300,29301,29302,29303,29304,29305,29306,29307,29308,29309,34985,34986,34987,34988,34989,34990,34991,34992,34993,34994,34995,34996,34997,34998,34999,35000,35001,35002,35003,35004,35005,35006,35007,35008,35009,35010,35011,35012,35013,35014,35015,35016,35017,35018,35022,35023,35024,35025,35026,35027,35028,35029,35030,35031,35032,35033,35034,35035,35036,35037,35038,35042,35043,35044,35045,35046,35047,35048,35049,35050,35051,35052,35053,35054,35055,35056,35057,35058,35059,35060,35061,35062,35063,35064,35065,35066,35067,35068,35069,35070,35071,35072,35073,35074,35075,35076,35077,35078,35079,35080,35081,35082,35083,35084,35085,35086,35087,35088,35089,35090,35091,35092,35093,35094,35095,35096,35097,35098,35099,35100,35101,35102,35103,35107,35108,35109,35110,35111,35112,35113,35114,35115,35328,35334,35338,35346,35356,35363,35369,35372,35376,35384,35390,35393,35402,35410,35414,36737,40781,40782,40783,40784,40785,40786,40787,40788,40789,40790,40791,40792,40801,40802,40803,40804,40805,40806,40807,40808,40809,40810,40811,40812,40819,40820,40821,40823,40824,40825,40826,40827,40828,40829,40830,40831,40840,40841,40842,40844,40845,40846,40847,40848,40849,40850,40851,40852,40859,40860,40861,40862,40863,40864,40866,40868,40869,40870,40871,40872,40904,40905,40907,40910,40925,40926,40927,40928,40931,40932,40933,40934,40937,40938,40939,40940,40961,40962,40963,40964,40990,40991,40992,40993,40994,40995,41000,41001,41002,41006,41007,41008,41012,41013,41014,41018,41019,41020,41026,41027,41028,41032,41033,41034,41037,41038,41039,41043,41044,41045,41080,41081,41082,41085,41086,41087,41088,41136,41137,41138,41141,41142,41143,41144,41150,41151,41152,41155,41156,41157,41158,41198,41199,41200,41203,41204,41205,41206,41210,41211,41212,41215,41216,41217,41218,41273,41274,41275,41276,41279,41280,41281,41282,41284,41286,41287,41288,41291,41292,41293,41294,41296,41297,41298,41299,41302,41303,41304,41305,41308,41309,41310,41311,41314,41315,41316,41317,41319,41320,41321,41322,41325,41326,41327,41328,41648,41649,41650,41651,41653,41654,41655,41656,41659,41660,41661,41662,41665,41666,41667,41668,41670,41671,41672,41673,41676,41677,41678,41679,41681,41682,41683,41684,41713,41714,41715,41716,41765,41766,41767,41768,41771,41772,41773,41774,41852,41853,41854,41855,41857,41858,41859,41860,41862,41863,41864,41865,41867,41868,41869,41870,41872,41873,41874,41875,41913,41914,41915,41916,41919,41920,41921,41922,41925,41926,41927,41928,41931,41933,41934,41935,41938,41939,41940,41941,41944,41945,41946,41947,41950,41951,41953,41954,41957,41958,41959,41960,41963,41964,41965,41966,41969,41970,41971,41972,41991,41992,41993,41994,41997,41998,41999,42001,42003,42004,42005,42006,42009,42010,42011,42012,42015,42016,42017,42018,42208,42209,42210,42227,42228,42229,42232,42233,42234,42237,42242,42243,42244,42248,42249,42250,42255,42256,42257,42260,42261,42262,42265,42266,42267,42270,42271,42272,42275,42276,42277,42280,42281,42282,42285,42286,42287,42290,42291,42292,42317,42318,42319,42322,42323,42324,42327,42328,42329,42332,42333,42334,42346,42347,42348,42352,42353,42354,42362,42364,42366,42384,42385,42386,42390,42391,42392,42450,42451,42483,42485,42486,42487,42490,42491,42492,42495,42496,42498,42502,42503,42504,42513,42514,42515,42519,42520,42521,42526,42527,42532,42533,42538,42539,42559,42560,42561,42564,42565,42566,42570,42571,42572,44419,44420,44421,44422,44423,44424,45631,45937,45938,45939,45948,45949,45950,45951,45953,45954,45955,45956,45957,45958,45959,45960,45961,45962,45963,45964,45965,45966,45967,45968,45969,45970,45971,48402,48404,48406,48408,48410,48412,48414,48420,48422,48424,48426,48428,48432,49185,49187,49189,51388,51389,51390,51391,51392,51393,51394,51395,51396,51397,51398,51399,51400,51401,51402,51403,51404,51405,51406,51407,51408,51409,51410,51411,51412,51413,51414,51415,51416,51418,51419,51420,51421,51422,51424,51425,51426,51427,51428,51430,51431,51432,51433,51434,51435,51436,51438,51439,51440,51441,51442,51443,51444,51445,51446,51447,51448,51449,51450,51451,51452,51453,51454,51455,51456,51457,51458,51459,51460,51461,51462,51463,51464,51465,51466,51467,51468,51469,51470,51471,51473,51474,51475,51476,51477,51479,51480,51481,51482,51483,51484,51485,51486,51487,51488,51489,51490,51491,51492,51493,51494,51495,51496,51497,51498,51499,51500,51502,51503,51504,51505,51506,51508,51509,51510,51511,51512,51514,51515,51516,51517,51518,51519,51520,51521,51522,51523,51524,51525,51526,51527,51528,51529,51530,51531,51532,51533,51535,51536,51537,51538,51539,51540,51541,51542,51543,51544,51545},
})

table.insert(Journal.djDungeons, {
    name   = "Un'Goro Crater",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Ungoro.blp",
    bosses = {
        {
            bossID = 6582,
            name   = "Clutchmother Zavas",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6583,
            name   = "Gruff",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6584,
            name   = "King Mosh",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6581,
            name   = "Ravasaur Matriarch",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6585,
            name   = "Uhk'loc",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,940,942,943,944,1168,1169,1203,1315,1443,1447,1607,1608,1639,1720,1721,1979,2100,2244,2245,2246,2564,2815,3075,3208,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4069,4082,4088,4089,4091,4696,5266,5267,7517,7518,7519,7520,7527,7528,7529,7532,7536,7537,7538,7539,7540,7543,7553,7557,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8110,8111,8112,8113,8114,8115,8116,8117,8119,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8138,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8274,8275,8276,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9359,9402,9433,9905,9913,9914,9924,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9957,9958,9960,9961,9962,9963,9964,9965,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10091,10092,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11876,11882,11904,11908,11909,11910,11911,11913,11915,11916,11917,11918,11919,11975,11976,11977,11978,11979,11980,11988,11989,11990,11991,11992,12001,12002,12004,12005,12013,12014,12015,12016,12017,12024,12025,12026,12027,12032,12034,12035,12036,12043,12044,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13018,13021,13022,13023,13026,13027,13028,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13059,13065,13066,13067,13070,13071,13072,13073,13074,13075,13076,13077,13082,13083,13085,13089,13091,13096,13101,13102,13107,13109,13111,13112,13113,13115,13116,13118,13120,13122,13123,13125,13126,13128,13130,13133,13134,13135,13139,13144,14249,14254,14263,14264,14265,14266,14267,14269,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14427,14434,14437,14438,14439,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14549,14551,14552,14553,14655,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14779,14780,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14835,14840,14842,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14907,14908,14912,14913,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14948,14949,14951,14952,14953,14954,14955,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15164,15167,15170,15171,15172,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15216,15217,15218,15219,15220,15221,15227,15228,15229,15235,15236,15237,15238,15239,15240,15245,15246,15247,15252,15253,15254,15255,15256,15257,15258,15263,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15288,15289,15291,15294,15295,15296,15323,15324,15325,15373,15379,15381,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15609,15618,15619,15620,15621,15622,15623,15625,15626,15627,15628,15629,15630,15631,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15965,15966,15967,15968,15981,15982,15983,15984,15985,15986,15987,15988,15989,15991,17007,18339,18343,18672,18674,18679,22272,22274,22458,24222,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36410,36411,36412,36413,36424,36425,36426,36427,36438,36439,36440,36441,36452,36453,36455,36466,36467,36468,36469,36480,36481,36482,36483,36494,36495,36496,36497,36508,36509,36510,36511,36522,36523,36524,36525,36536,36537,36538,36539,36550,36551,36552,36553,36564,36565,36566,36567,36578,36579,36580,36581,36592,36593,36594,36595,36606,36607,36608,36609,36620,36621,36622,36623,36634,36635,36636,36637,36648,36649,36650,36651,36662,36663,36664,36665,36676,36677,36678,36679,36690,36691,36692,36693,36704,36705,36706,36707,36718,36719,36720,36721,39366,39411,39442,39465},
})

table.insert(Journal.djDungeons, {
    name   = "Silithus",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Silthus.blp",
    bosses = {
        {
            bossID = 14472,
            name   = "Gretheer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14477,
            name   = "Grubthor",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14478,
            name   = "Huricanian",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14476,
            name   = "Krellack",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14473,
            name   = "Lapress",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14475,
            name   = "Rex Ashil",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14471,
            name   = "Setis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14479,
            name   = "Twilight Lord Everun",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14474,
            name   = "Zora",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,942,944,1168,1203,1315,1443,1607,1721,2243,2244,2245,2246,2801,3075,3475,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5266,5267,8080,8081,8082,8083,8084,8085,8086,8245,8246,8249,8250,8251,8252,8254,8256,8258,8260,8261,8262,8263,8264,8265,8267,8268,8269,8270,8271,8272,8275,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9943,9944,9946,9950,9974,10057,10064,10065,10070,10073,10074,10077,10078,10084,10085,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10133,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10186,10187,10188,10189,10190,10192,10193,10195,10196,10197,10198,10199,10200,10203,10204,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10240,10241,10242,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11976,11977,11978,11979,11980,11990,11991,11992,12002,12004,12005,12014,12015,12016,12017,12025,12026,12027,12034,12035,12036,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13022,13023,13027,13028,13030,13036,13040,13047,13052,13056,13059,13067,13070,13072,13073,13075,13077,13083,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13126,13130,13133,13135,13144,14275,14277,14281,14283,14284,14287,14288,14293,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14437,14444,14445,14447,14448,14449,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14552,14553,14554,14555,14558,14664,14667,14668,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14789,14790,14795,14796,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14844,14849,14850,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14915,14916,14919,14922,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14959,14961,14962,14963,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15170,15179,15180,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15221,15228,15229,15236,15237,15238,15239,15240,15246,15247,15253,15254,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15280,15281,15282,15283,15288,15289,15294,15295,15296,15324,15325,15388,15389,15390,15391,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15631,15633,15634,15640,15642,15644,15645,15646,15647,15648,15650,15651,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15936,15938,15939,15940,15941,15942,15943,15966,15967,15968,15983,15984,15985,15986,15987,15988,15989,15991,17007,18339,18343,18672,18674,18679,20406,20407,20408,20646,20647,20649,20650,20652,20653,20654,20655,20656,20657,20658,20659,20660,20661,20662,20663,20664,20665,20666,20667,20668,20669,20670,20671,20672,20673,20674,20675,20680,20681,20682,20683,20684,20685,20686,20687,20688,20689,20690,20691,20699,20700,20701,20702,20703,20704,20705,20707,20710,20711,20712,20713,20714,20715,20716,20717,20723,20724,21178,21179,21182,21183,21184,21185,21186,21187,21188,21189,21392,21393,21394,21395,21396,21397,21398,21399,21400,21401,21402,21403,21404,21405,21406,21407,21408,21409,21410,21411,21412,21413,21414,21415,21416,21417,21418,21520,21521,21522,21523,22347,22348,22377,22378,22379,22380,22725,24222},
})

table.insert(Journal.djDungeons, {
    name   = "Thousand Needles",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ThousandNeedles.blp",
    bosses = {
        {
            bossID = 5933,
            name   = "Achellios the Banished",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14427,
            name   = "Gibblesnik",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14426,
            name   = "Harb Foulmountain",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5934,
            name   = "Heartrazor",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5935,
            name   = "Ironeye the Invincible",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 4132,
            name   = "Silithid Ravager",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5937,
            name   = "Vile Sting",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {720,790,791,863,864,865,886,890,897,911,920,936,1076,1077,1121,1207,1280,1351,1406,1455,1459,1461,1462,1493,1522,1523,1625,1659,1664,1717,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1988,1990,1993,1996,1997,1998,2011,2013,2017,2034,2059,2072,2077,2080,2194,2219,2220,2221,2222,2227,2232,2233,2236,2276,2277,2278,2565,2566,2620,2621,2623,2721,2800,2819,2877,2878,2879,2911,2912,2951,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3185,3186,3197,3198,3201,3202,3203,3204,3206,3210,3212,3341,3345,3378,3379,3380,3381,3429,3569,3647,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,4035,4036,4037,4038,4039,4040,4041,4042,4043,4044,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4064,4065,4066,4067,4068,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4087,4614,4661,4705,4706,4707,4708,4709,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4735,4998,4999,5001,5002,5003,5007,5009,5011,5215,5608,5624,5755,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6432,6566,6567,6568,6569,6572,6573,6577,6578,6579,6580,6584,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6740,7110,7111,7112,7330,7331,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7472,7474,7475,7476,7480,7483,7484,7485,7489,7492,7493,7494,7556,7558,7609,7610,8746,8747,8748,9382,9385,9395,9405,9435,9767,9769,9771,9772,9773,9774,9782,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9875,9876,9877,9878,9879,9880,9881,9885,9886,9889,9890,9891,9892,9894,9895,9896,9898,9900,9901,9902,9904,9929,10287,10288,10289,10404,10406,10408,10409,11967,11968,11969,11970,11971,11972,11982,11983,11984,11985,11986,11994,11995,11996,11997,12007,12008,12009,12010,12011,12019,12020,12022,12028,12029,12030,12039,12040,12047,12054,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13025,13031,13033,13041,13045,13048,13049,13079,13081,13084,13087,13093,13094,13097,13099,13103,13105,13106,13108,13110,13114,13121,13124,13127,13131,14126,14127,14133,14157,14158,14162,14163,14165,14172,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14231,14232,14233,14235,14236,14238,14239,14240,14241,14245,14248,14251,14255,14369,14371,14372,14373,14374,14375,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14418,14419,14420,14422,14423,14426,14562,14566,14567,14568,14570,14572,14573,14574,14578,14579,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14600,14602,14603,14606,14607,14608,14730,14742,14744,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14770,14771,14772,14773,14902,15113,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15157,15158,15160,15212,15213,15214,15223,15224,15225,15226,15230,15231,15232,15233,15234,15241,15242,15243,15249,15250,15259,15260,15261,15269,15313,15329,15330,15331,15332,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15364,15365,15366,15367,15368,15371,15457,15458,15459,15461,15462,15463,15467,15468,15469,15470,15471,15500,15505,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15594,15595,15596,15598,15603,15606,15891,15892,15894,15912,15918,15927,15928,15929,15934,15935,15946,15947,15962,15963,15972,15973,15974,15975,15976,15977,15978,15990},
})

table.insert(Journal.djDungeons, {
    name   = "Feralas",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Feralas.blp",
    bosses = {
        {
            bossID = 5347,
            name   = "Antilus the Soarer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5349,
            name   = "Arash-ethis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5346,
            name   = "Bloodroar the Stalker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5345,
            name   = "Diamond Head",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5354,
            name   = "Gnarl Leafbrother",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5343,
            name   = "Lady Szallah",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 11447,
            name   = "Mushgog",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5352,
            name   = "Old Grizzlegut",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5350,
            name   = "Qirot",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 11498,
            name   = "Skarr the Unbreakable",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5356,
            name   = "Snarler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 11497,
            name   = "The Razza",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {236,237,238,239,812,833,866,867,868,873,936,940,942,943,944,1168,1169,1203,1204,1207,1315,1443,1447,1521,1607,1608,1613,1625,1639,1640,1659,1664,1714,1715,1716,1718,1720,1721,1722,1849,1850,1979,1980,1981,1994,2100,2141,2142,2143,2144,2145,2146,2243,2244,2245,2246,2276,2300,2303,2308,2309,2310,2314,2315,2316,2429,2431,2432,2434,2435,2437,2438,2440,2463,2464,2465,2467,2468,2469,2564,2623,2802,2815,3075,3187,3208,3430,3587,3588,3593,3594,3719,3889,3890,3892,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4041,4042,4044,4045,4046,4047,4058,4060,4061,4062,4063,4067,4068,4069,4070,4078,4079,4080,4082,4083,4084,4087,4088,4089,4091,4197,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4696,4725,4729,4731,4733,4734,4735,4736,4737,4738,5011,5215,5216,5266,5267,5608,5739,5961,5962,5964,5966,6411,6412,6415,6420,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6725,6742,7112,7113,7281,7282,7285,7332,7348,7374,7377,7378,7387,7429,7430,7431,7439,7440,7454,7455,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7557,7610,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8175,8176,8185,8189,8191,8193,8194,8196,8197,8198,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8345,8349,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9359,9402,9433,9434,9630,9631,9632,9633,9647,9648,9655,9656,9657,9658,9660,9661,9662,9663,9664,9665,9666,9683,9684,9686,9874,9875,9876,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9891,9892,9893,9894,9895,9896,9897,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10652,10705,10706,11856,11857,11858,11859,11888,11889,11972,11973,11974,11975,11976,11977,11978,11979,11980,11986,11987,11988,11989,11990,11991,11992,11998,11999,12001,12002,12004,12005,12011,12012,12013,12014,12015,12016,12017,12022,12023,12024,12025,12026,12027,12030,12031,12032,12034,12035,12036,12042,12043,12044,12045,12046,12048,12055,12056,12057,12058,12253,12254,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13018,13021,13022,13023,13025,13026,13027,13028,13029,13030,13034,13036,13038,13039,13040,13042,13043,13046,13047,13052,13055,13056,13058,13059,13064,13065,13066,13067,13068,13070,13071,13072,13073,13074,13075,13076,13077,13081,13082,13083,13085,13088,13089,13091,13093,13095,13096,13100,13101,13102,13103,13107,13109,13111,13112,13113,13115,13116,13117,13118,13119,13120,13121,13122,13123,13125,13126,13128,13129,13130,13132,13133,13134,13135,13138,13139,13144,13145,13199,14216,14220,14224,14225,14228,14230,14232,14233,14234,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14407,14413,14417,14418,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14549,14551,14552,14553,14554,14555,14591,14592,14598,14599,14600,14601,14602,14603,14604,14605,14606,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14760,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14940,14941,14942,14943,14944,14945,14946,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15119,15146,15152,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15214,15215,15216,15217,15218,15219,15220,15221,15227,15228,15229,15233,15234,15235,15236,15237,15238,15239,15240,15244,15245,15246,15247,15251,15252,15253,15254,15255,15256,15257,15258,15261,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15323,15324,15325,15359,15362,15363,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15567,15569,15572,15574,15576,15578,15580,15582,15583,15584,15589,15591,15592,15593,15595,15596,15597,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15794,15887,15890,15930,15931,15936,15937,15938,15939,15940,15941,15942,15943,15963,15964,15965,15966,15967,15968,15978,15979,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15990,15991,17007,18339,18343,18411,18491,18672,18674,18679,19037,19038,19039,19040,19041,19042,20579,20580,20581,20582,20599,20615,20616,20617,20618,20619,20621,20622,20623,20624,24222,29522,29523,29524,29970,29974,34416,34417},
})

table.insert(Journal.djDungeons, {
    name   = "Dustwallow Marsh",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-DuskwallowMarsh.blp",
    bosses = {
        {
            bossID = 4339,
            name   = "Brimgore",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14230,
            name   = "Burgle Eye",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 4380,
            name   = "Darkmist Widow",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14232,
            name   = "Dart",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14231,
            name   = "Drogoth the Roamer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14234,
            name   = "Hayoc",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14236,
            name   = "Lord Angler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14237,
            name   = "Oozeworm",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14233,
            name   = "Ripscale",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14235,
            name   = "The Rot",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {791,863,864,865,866,867,868,873,936,1204,1207,1280,1521,1522,1523,1608,1613,1624,1625,1639,1640,1659,1664,1714,1715,1716,1717,1718,1722,1754,1755,1756,1757,1758,1759,1760,1761,1780,1782,1783,1784,1785,1786,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1988,1990,1993,1994,1996,1997,2080,2148,2149,2150,2151,2152,2153,2221,2222,2276,2277,2278,2420,2426,2429,2431,2432,2434,2438,2446,2467,2473,2565,2568,2569,2578,2580,2582,2583,2584,2620,2621,2623,2624,2721,2802,2815,2877,2878,2912,2951,3020,3185,3186,3187,3197,3208,3210,3345,3380,3381,3430,3593,3594,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3889,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4069,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4082,4083,4084,4087,4088,4089,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4614,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4733,4734,4735,4736,4737,4738,4817,4818,4824,4825,4826,4830,4831,4832,5002,5003,5007,5009,5011,5016,5215,5216,5267,5542,5608,5624,5755,5766,6238,6241,6386,6388,6389,6396,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6427,6428,6429,6430,6431,6432,6433,6603,6607,6609,6610,6616,6617,6757,6801,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7110,7111,7112,7113,7330,7331,7332,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7406,7407,7408,7409,7410,7411,7412,7413,7414,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7513,7514,7515,7519,7520,7521,7522,7523,7524,7525,7526,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7556,7609,7610,7611,8080,8081,8082,8083,8084,8085,8086,8107,8108,8109,8110,8111,8112,8114,8115,8116,8117,8118,8120,8121,8122,8123,8124,8125,8127,8128,8129,8130,8135,8137,8138,8139,8140,8141,8142,8143,8144,8156,8157,8158,8159,8160,8161,8162,8163,8194,8196,8199,8273,8276,8277,8278,8279,8280,8281,8283,8288,8289,8290,8292,8296,8299,8300,8301,8302,8303,8305,8306,8307,8308,8309,8310,8313,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9285,9286,9287,9288,9289,9290,9291,9292,9382,9385,9395,9402,9405,9434,9435,9517,9518,9519,9527,9531,9622,9703,9704,9705,9706,9819,9820,9821,9823,9824,9825,9826,9827,9828,9830,9832,9833,9834,9835,9836,9837,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9905,9906,9907,9908,9909,9910,9911,9912,9913,9914,9915,9916,9917,9918,9919,9920,9921,9922,9923,9924,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9936,9937,9938,9939,9941,9945,9947,9948,9949,9951,9952,9956,9959,9960,9961,9962,9963,9964,9965,9966,9967,9968,9969,9970,9971,9972,9973,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10060,10066,10067,10069,10071,10076,10079,10086,10087,10088,10089,10090,10091,10092,10094,10101,10102,10104,10105,10112,10118,10127,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10178,10181,10182,10201,10202,10205,10206,10207,10210,10211,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10225,10226,10227,10228,10230,10232,10234,10235,10236,10237,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10279,10280,10281,10288,10289,10362,10363,10364,10365,10366,10367,10368,10369,10371,10372,10373,10374,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10404,10406,10408,10409,10700,10701,10702,10703,11263,11970,11971,11972,11973,11974,11975,11978,11979,11980,11985,11986,11987,11988,11991,11992,11996,11997,11998,11999,12004,12005,12009,12010,12011,12012,12013,12016,12017,12019,12020,12022,12023,12026,12027,12028,12029,12030,12031,12032,12036,12039,12040,12042,12043,12046,12047,12048,12057,12058,12248,12251,13000,13001,13006,13015,13023,13025,13026,13028,13029,13033,13034,13038,13042,13045,13048,13058,13064,13068,13071,13072,13075,13079,13081,13083,13084,13087,13088,13093,13094,13095,13096,13100,13103,13105,13106,13107,13108,13110,13113,13114,13115,13116,13117,13119,13121,13123,13124,13127,13129,13132,13133,13138,13145,13199,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,14178,14189,14190,14192,14193,14196,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14237,14238,14239,14240,14241,14242,14243,14244,14245,14246,14247,14248,14249,14250,14251,14252,14253,14254,14255,14257,14258,14259,14260,14261,14262,14263,14264,14266,14268,14269,14270,14271,14272,14273,14276,14279,14280,14292,14303,14306,14307,14308,14310,14312,14314,14315,14316,14317,14318,14319,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14397,14398,14399,14401,14403,14404,14405,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14427,14428,14429,14430,14431,14432,14433,14434,14435,14436,14438,14439,14440,14442,14443,14446,14453,14455,14456,14457,14458,14460,14461,14462,14463,14464,14465,14579,14581,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14663,14665,14670,14676,14677,14680,14681,14682,14683,14684,14685,14686,14687,14688,14751,14753,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14791,14798,14799,14800,14804,14808,14809,14810,14811,14812,14814,14815,14816,14817,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14835,14838,14839,14840,14841,14842,14843,14847,14853,14854,14858,14862,14863,14864,14865,14866,14867,14868,14869,14895,14896,14897,14898,14899,14900,14901,14902,14903,14905,14906,14907,14908,14909,14910,14911,14913,14914,14917,14918,14921,14931,14932,14933,14935,14936,14937,14939,14940,14941,14942,14943,14944,14945,14946,14947,14949,14950,14951,14953,14955,14956,14965,14966,14969,14970,14973,14975,14976,14977,14978,14979,14980,14981,14982,14983,15128,15129,15130,15131,15133,15134,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15164,15165,15166,15167,15168,15169,15172,15173,15177,15178,15189,15192,15193,15194,15195,15213,15214,15215,15219,15220,15221,15225,15226,15227,15231,15232,15233,15234,15235,15238,15239,15240,15242,15243,15244,15246,15247,15250,15251,15252,15256,15257,15258,15260,15261,15262,15265,15266,15267,15270,15272,15273,15276,15278,15282,15283,15287,15288,15289,15296,15325,15339,15344,15345,15346,15349,15350,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15373,15374,15375,15376,15377,15378,15379,15380,15382,15383,15385,15386,15392,15426,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15524,15530,15533,15534,15536,15540,15541,15542,15543,15544,15546,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15608,15609,15610,15611,15612,15613,15614,15615,15616,15617,15618,15619,15620,15624,15625,15626,15628,15629,15630,15632,15635,15636,15638,15643,15658,15660,15664,15665,15666,15667,15668,15669,15670,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15887,15890,15892,15918,15928,15929,15931,15934,15935,15938,15939,15940,15941,15942,15943,15962,15963,15964,15965,15967,15968,15975,15976,15977,15978,15979,15980,15981,15986,15987,15988,15989,15990,15991,17192,17772,17773,18339,18343,18672,18674,18679,33228,33229,33230,33231,33232,33233,33235,33237,33239,33240,33241,33242,33243,33244,33245,33247,33248,33249,33250,33251,33252,33253,33255,33256,33257,33258,33259,33260,33261,33262,33263,33264,33265,33266,33267,33268,33269,33270,33271,33272,33273,33274,44737,45626},
})

table.insert(Journal.djDungeons, {
    name   = "The Barrens",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Barrens.blp",
    bosses = {
        {
            bossID = 5797,
            name   = "Aean Swiftriver",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7895,
            name   = "Ambassador Bloodrage",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5834,
            name   = "Azzere the Skyblade",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5838,
            name   = "Brokespear",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5827,
            name   = "Brontus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5851,
            name   = "Captain Gerogg Hammertoe",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5849,
            name   = "Digger Flameforge",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5865,
            name   = "Dishu",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3270,
            name   = "Elder Mystic Razorsnout",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5836,
            name   = "Engineer Whirleygig",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5835,
            name   = "Foreman Grills",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5863,
            name   = "Geopriest Gukk'rok",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3398,
            name   = "Gesharahan",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5859,
            name   = "Hagg Taurenbane",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5799,
            name   = "Hannah Bladeleaf",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5847,
            name   = "Heggin Stonewhisker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5828,
            name   = "Humar the Pridelord",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5848,
            name   = "Malgin Barleybrew",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5800,
            name   = "Marcus Bel",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3470,
            name   = "Rathorian",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5841,
            name   = "Rocklance",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3253,
            name   = "Silithid Harvester",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5830,
            name   = "Sister Rathtalon",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3295,
            name   = "Sludge Beast",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5829,
            name   = "Snort the Heckler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5837,
            name   = "Stonearm",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5831,
            name   = "Swiftmane",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5864,
            name   = "Swinegart Spearhide",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5842,
            name   = "Takk the Leaper",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5798,
            name   = "Thora Feathermoon",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5832,
            name   = "Thunderstomp",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3652,
            name   = "Trigore the Lasher",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,720,727,789,790,791,826,827,837,838,839,840,843,844,845,846,847,848,849,850,863,864,865,886,890,897,911,920,935,1076,1077,1121,1211,1214,1218,1220,1287,1296,1299,1300,1351,1355,1391,1394,1405,1406,1438,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1522,1523,1539,1717,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1843,1844,1845,1846,1849,1850,1852,1853,1926,1928,1929,1934,1936,1943,1944,1945,1958,1959,1988,1990,1993,1996,1997,1998,2011,2013,2017,2034,2035,2059,2072,2073,2075,2077,2078,2079,2080,2088,2140,2166,2167,2168,2175,2194,2214,2215,2216,2217,2219,2220,2221,2222,2227,2232,2233,2236,2276,2277,2278,2300,2303,2308,2309,2310,2314,2315,2316,2445,2565,2566,2568,2569,2578,2580,2582,2583,2584,2621,2632,2694,2721,2800,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2877,2878,2879,2911,2912,2951,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3192,3193,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3207,3210,3211,3212,3213,3214,3227,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3341,3345,3374,3375,3376,3377,3378,3379,3380,3381,3429,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3569,3589,3590,3597,3598,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3656,3719,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3835,3836,3842,3844,3848,4035,4036,4037,4038,4039,4040,4043,4048,4049,4050,4051,4052,4054,4055,4057,4059,4064,4065,4066,4071,4072,4073,4074,4075,4076,4077,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4290,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4614,4661,4663,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4726,4727,4732,4765,4766,4767,4768,4771,4777,4778,4781,4782,4785,4786,4788,4789,4790,4792,4793,4794,4795,4796,4797,4798,4799,4800,4816,4820,4821,4822,4949,4998,4999,5001,5002,5003,5007,5009,5094,5110,5111,5112,5183,5275,5279,5299,5302,5306,5310,5311,5312,5313,5314,5316,5317,5318,5320,5321,5322,5323,5324,5325,5327,5328,5337,5340,5341,5343,5344,5345,5351,5355,5357,5420,5540,5542,5739,5755,5766,5961,5962,5964,5966,6040,6214,6238,6241,6266,6267,6268,6269,6336,6337,6350,6378,6379,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6413,6416,6417,6418,6419,6421,6477,6502,6503,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6737,6898,6900,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7109,7110,7111,7120,7133,7189,7281,7282,7285,7326,7327,7328,7329,7330,7331,7348,7350,7351,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7374,7377,7378,7387,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7432,7433,7434,7435,7436,7437,7438,7441,7443,7444,7445,7446,7447,7448,7456,7457,7458,7459,7460,7461,7462,7463,7512,7554,7558,7559,7608,7609,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8175,8176,8178,8185,8189,8191,8193,8197,8198,8350,8746,8747,8748,9385,9395,9405,9435,9515,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9877,9890,9898,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10287,10288,10289,10404,10405,10406,10407,10408,10409,10500,10502,10503,10504,10508,10542,10543,10571,10573,10578,10582,10584,10588,10653,10654,10657,10658,10820,10821,10919,11853,11965,11967,11968,11969,11970,11971,11981,11982,11983,11984,11985,11993,11994,11995,11996,11997,12006,12007,12008,12009,12010,12019,12020,12028,12029,12039,12040,12047,12052,12053,12054,12259,12405,12406,12408,12409,12410,12414,12773,12775,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13025,13031,13033,13041,13045,13048,13049,13079,13084,13087,13093,13094,13097,13099,13105,13106,13108,13110,13114,13124,13127,13131,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14025,14086,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14100,14101,14102,14103,14106,14108,14109,14110,14111,14112,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14128,14129,14130,14131,14132,14133,14141,14142,14143,14144,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14217,14218,14219,14221,14222,14223,14226,14229,14231,14235,14236,14364,14365,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14408,14409,14410,14411,14412,14414,14415,14416,14419,14420,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14593,14594,14595,14596,14607,14608,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14761,14762,14763,14764,14765,14766,14767,15004,15005,15006,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15105,15106,15107,15108,15109,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15147,15148,15149,15150,15151,15153,15154,15210,15211,15212,15213,15222,15223,15224,15225,15226,15230,15231,15232,15241,15242,15243,15248,15249,15250,15259,15260,15268,15269,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15360,15361,15364,15365,15472,15473,15476,15477,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15568,15570,15571,15573,15575,15577,15579,15581,15590,15594,15598,15866,15891,15892,15893,15894,15912,15918,15925,15926,15927,15928,15929,15932,15933,15934,15935,15944,15945,15946,15947,15962,15969,15970,15971,15972,15973,15974,15975,15976,15977,15995,15999,16008,17188,19510,19511,19512,19513,19518,19519,19520,19521,19526,19527,19528,19529,19534,19535,19536,19537,19542,19543,19544,19545,19550,19551,19552,19553,19558,19559,19560,19566,19567,19568,19569,19578,19580,19581,19582,19583,19584,19587,19589,19590,19595,19596,19597,20425,20426,20427,20429,20430,20441,20442,21565,21566,21567,21568,22651,22673,22676,22740,22741,22747,23836,23838,23839,29201,29202,29203,30498,45626,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Mulgore",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Mulgore.blp",
    bosses = {
        {
            bossID = 5787,
            name   = "Enforcer Emilgund",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3056,
            name   = "Ghost Howl",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3068,
            name   = "Mazzranache",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5785,
            name   = "Sister Hatelash",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5786,
            name   = "Snagglespear",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5807,
            name   = "The Rake",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {85,209,210,714,727,826,1200,1211,1287,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1394,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1835,1836,1926,2073,2075,2088,2140,2210,2211,2212,2213,2214,2215,2300,2303,2308,2309,2310,2314,2315,2316,2370,2371,2372,2373,2374,2375,2376,2386,2387,2388,2389,2390,2391,2398,2399,2400,2401,2402,2403,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2971,2972,2975,2976,2978,2979,2980,3192,3200,3207,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3307,3308,3312,3314,3363,3365,3370,3373,3374,3375,3641,3642,3643,3644,3649,3650,3651,3652,3653,3654,3719,3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4368,4385,4561,4562,4564,4566,4569,4570,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4767,4768,4771,4772,4854,4861,4906,4908,4910,4911,4913,4951,4954,4958,4963,4964,4969,4970,4971,4972,4973,4974,5739,5961,5962,5964,5966,6059,6266,6267,6268,6269,6336,6337,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6542,6543,6549,6550,6555,6556,6558,7108,7109,7281,7282,7285,7348,7350,7351,7374,7377,7378,7387,8080,8081,8082,8083,8084,8085,8086,8175,8176,8178,8185,8189,8191,8193,8197,8198,8752,8753,8754,8755,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,10500,10502,10503,10504,10508,10635,10636,14086,14087,14088,14089,14090,14091,14093,14094,14095,14097,14098,14099,14102,14110,14113,14115,14116,14365,15003,15004,15005,15006,15007,15008,15009,15010,15011,15013,15015,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15297,15298,15299,15300,15301,15302,15303,15309,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15490,15491,15492,15495,15895,15925,15932,15933,15944,15969,15970,15995,15999,16008,17183,17185,17922,45631},
})

table.insert(Journal.djDungeons, {
    name = "Thunder Bluff", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ThunderBuff.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,792,793,794,795,837,838,839,840,843,844,845,846,847,848,849,850,1202,1843,1844,1845,1846,1849,1850,1852,1853,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2300,2303,2308,2309,2310,2314,2315,2316,2370,2371,2372,2373,2374,2375,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2431,2432,2434,2435,2437,2438,2440,2445,2446,2448,2451,2568,2569,2578,2580,2582,2583,2584,2612,2613,2614,2615,2616,2617,2618,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3587,3588,3589,3590,3591,3592,3593,3594,3597,3598,3602,3603,3719,3835,3836,3842,3844,3848,3889,3891,3892,3894,4197,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4909,4962,4967,4968,5540,5542,5739,5766,5936,5961,5962,5964,5966,6040,6214,6238,6241,6350,6504,6505,6523,6524,6525,6526,6720,6725,6742,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7130,7281,7282,7285,7348,7374,7377,7378,7387,7747,7749,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8088,8089,8090,8091,8092,8093,8094,8175,8176,8185,8189,8191,8193,8197,8198,8350,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10919,12249,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15464,15466,17187,17188,17189,17190,17192,17508,29201,29202,29203,33259,33267,33270,34421,34422,43515,43654,43655,43656,43657,43660,43661,43663,43664,45626},
})
table.insert(Journal.djDungeons, {
    name   = "Desolace",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Desolate.blp",
    bosses = {
        {
            bossID = 14229,
            name   = "Accursed Slitherblade",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18241,
            name   = "Crusty",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 11688,
            name   = "Cursed Centaur",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14228,
            name   = "Giggler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14227,
            name   = "Hissperak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14226,
            name   = "Kaskk",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14225,
            name   = "Prince Kellen",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {720,791,863,864,865,866,867,868,873,897,936,1204,1207,1280,1351,1521,1522,1523,1613,1624,1625,1640,1659,1664,1714,1715,1716,1717,1718,1722,1754,1755,1756,1757,1758,1759,1760,1761,1780,1782,1783,1784,1785,1786,1803,1804,1805,1806,1807,1808,1809,1810,1980,1981,1988,1990,1993,1996,1997,1998,2017,2077,2080,2143,2221,2222,2276,2277,2278,2300,2303,2308,2309,2310,2314,2315,2316,2417,2418,2419,2420,2421,2422,2448,2565,2620,2621,2623,2624,2721,2802,2815,2819,2877,2878,2912,2951,2983,2991,3020,3185,3186,3187,3197,3201,3203,3206,3210,3341,3345,3380,3381,3430,3719,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3891,3936,3937,3938,3939,3940,3941,3942,3943,3961,3962,3963,3964,3965,3966,3967,3968,3986,3989,4000,4001,4002,4003,4004,4005,4006,4007,4035,4037,4038,4039,4040,4041,4042,4043,4044,4045,4046,4047,4048,4049,4050,4051,4052,4054,4055,4057,4058,4059,4060,4061,4062,4063,4064,4065,4066,4067,4068,4070,4071,4072,4073,4074,4075,4076,4077,4078,4079,4080,4083,4087,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4614,4711,4712,4716,4717,4718,4719,4720,4721,4722,4725,4726,4727,4729,4731,4732,4734,4735,4736,4737,4738,5002,5003,5007,5009,5011,5215,5216,5608,5624,5739,5755,5961,5962,5964,5966,6386,6387,6388,6389,6393,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6411,6412,6413,6415,6416,6417,6418,6419,6420,6421,6422,6423,6424,6425,6426,6428,6429,6431,6432,6433,6590,6592,6594,6595,6596,6597,6598,6599,6601,6603,6605,6607,6609,6610,6611,6612,6613,6614,6615,6616,6617,6744,6745,6746,6747,6773,6774,6780,6784,6788,6789,6790,6791,6792,6793,6794,7110,7111,7112,7281,7282,7285,7330,7331,7332,7348,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7374,7377,7378,7387,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7429,7430,7431,7432,7433,7434,7435,7436,7437,7438,7439,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7468,7469,7470,7471,7472,7473,7474,7475,7476,7477,7478,7479,7480,7481,7482,7483,7484,7485,7486,7487,7488,7489,7490,7491,7492,7493,7494,7495,7496,7522,7524,7525,7533,7534,7544,7545,7552,7555,7556,7609,7610,8120,8137,8139,8140,8141,8142,8144,8156,8157,8158,8159,8160,8161,8162,8163,8175,8176,8185,8189,8191,8193,8194,8196,8197,8198,8746,8747,8748,8749,8750,8751,9285,9286,9287,9288,9289,9290,9291,9292,9359,9382,9385,9395,9405,9434,9435,9687,9698,9699,9791,9797,9798,9800,9808,9809,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9874,9875,9876,9877,9878,9879,9880,9881,9882,9883,9884,9885,9886,9887,9889,9890,9891,9892,9893,9894,9895,9896,9897,9898,9899,9900,9901,9902,9903,9904,9906,9907,9908,9909,9910,9912,9915,9916,9917,9918,9919,9920,9921,9923,9925,9926,9927,9928,9929,9930,9931,9932,9933,9934,9935,9959,9966,9967,9968,9969,9970,9971,9972,9973,10088,10089,10094,10288,10289,10404,10406,10408,10409,11884,11969,11970,11971,11972,11973,11984,11985,11986,11987,11995,11996,11997,11998,12008,12009,12010,12011,12012,12019,12020,12022,12023,12028,12029,12030,12031,12039,12040,12042,12047,12249,13005,13024,13025,13026,13029,13031,13033,13034,13038,13042,13045,13048,13049,13058,13064,13068,13071,13079,13081,13084,13087,13088,13093,13094,13095,13097,13099,13100,13103,13105,13106,13108,13110,13114,13115,13117,13119,13121,13124,13127,13129,13131,13132,13138,13145,13199,14178,14180,14181,14182,14183,14184,14186,14187,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14216,14217,14218,14219,14220,14221,14222,14223,14224,14225,14226,14228,14229,14230,14231,14232,14233,14234,14235,14236,14238,14239,14240,14241,14242,14243,14245,14246,14247,14248,14250,14251,14252,14253,14255,14257,14258,14260,14261,14262,14270,14372,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14417,14418,14419,14420,14421,14422,14423,14424,14425,14426,14428,14429,14430,14431,14432,14435,14549,14570,14578,14579,14581,14582,14583,14584,14585,14587,14588,14589,14590,14591,14592,14593,14594,14595,14596,14598,14599,14600,14601,14602,14603,14604,14605,14606,14607,14608,14652,14654,14656,14744,14750,14751,14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14768,14769,14770,14771,14772,14773,14774,14775,14776,14777,14778,14781,14782,14821,14825,14826,14827,14828,14829,14830,14831,14832,14833,14834,14838,14839,14841,14895,14896,14897,14898,14899,14900,14901,14902,14903,14905,14906,14909,14910,14940,14941,14942,14943,14944,14945,14946,14956,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15121,15123,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15152,15153,15154,15155,15156,15157,15158,15159,15160,15161,15162,15163,15165,15166,15168,15169,15213,15214,15215,15225,15226,15231,15232,15233,15234,15242,15243,15244,15250,15251,15260,15261,15287,15337,15338,15339,15341,15342,15343,15344,15345,15346,15347,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15359,15360,15361,15362,15363,15364,15365,15366,15367,15368,15369,15370,15371,15372,15374,15375,15377,15382,15518,15522,15524,15525,15529,15530,15531,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15567,15568,15569,15570,15571,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15585,15587,15588,15589,15590,15591,15592,15593,15594,15595,15596,15597,15598,15599,15600,15602,15603,15605,15606,15607,15608,15610,15611,15612,15613,15614,15617,15624,15689,15690,15697,15698,15864,15865,15892,15918,15928,15929,15934,15935,15947,15962,15963,15964,15973,15975,15976,15977,15978,15979,15990,16309,16788,16791,16793,16794,16873,17189,17743,17768,17770,17775,17776,17777,17778,17779},
})

table.insert(Journal.djDungeons, {
    name   = "Stonetalon Mountains",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-StoneTalonMountain.blp",
    bosses = {
        {
            bossID = 5915,
            name   = "Brother Ravenoak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5931,
            name   = "Foreman Rigger",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 4066,
            name   = "Nal'taszar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 4015,
            name   = "Pridewing Patriarch",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5916,
            name   = "Sentinel Amarassan",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5930,
            name   = "Sister Riven",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5928,
            name   = "Sorrow Wing",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5932,
            name   = "Taskmaster Whipfang",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 4030,
            name   = "Vengeful Ancient",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,720,789,790,791,826,827,865,886,890,897,911,920,935,1076,1077,1121,1211,1214,1218,1220,1287,1296,1299,1300,1306,1351,1391,1394,1405,1406,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1717,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1926,1928,1929,1934,1936,1943,1944,1945,1958,1959,1998,2011,2013,2017,2034,2059,2072,2073,2075,2077,2078,2079,2088,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2166,2167,2168,2175,2194,2214,2215,2216,2217,2219,2220,2221,2222,2227,2232,2233,2236,2278,2566,2632,2721,2800,2819,2877,2878,2879,2911,2912,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3186,3192,3193,3195,3196,3198,3199,3201,3202,3203,3204,3205,3206,3207,3210,3211,3212,3213,3227,3282,3283,3287,3288,3291,3292,3302,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3341,3374,3375,3376,3377,3378,3379,3380,3381,3429,3569,3591,3592,3597,3598,3643,3645,3647,3651,3652,3653,3654,3655,3656,3740,4035,4036,4037,4048,4049,4050,4051,4064,4071,4072,4073,4290,4564,4566,4567,4568,4569,4570,4571,4575,4661,4676,4678,4680,4681,4683,4684,4687,4689,4690,4693,4694,4695,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4719,4720,4722,4767,4768,4771,4788,4817,4818,4827,4828,4829,4830,4831,4832,4833,4835,4836,4837,4838,4949,4998,4999,5001,5002,5003,5007,5110,5751,6266,6267,6268,6269,6336,6337,6378,6379,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6403,6407,6410,6512,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6664,6665,6666,6667,6668,6669,6670,6671,6675,6676,7110,7330,7354,7355,7356,7366,7367,7370,7406,7408,7409,7410,7411,7412,7413,7415,7416,7419,7420,7421,7422,7424,7554,7558,7608,8748,9405,9746,9747,9748,9749,9753,9755,9756,9757,9759,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9820,9821,9822,9823,9824,9825,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9847,9867,10287,10288,10289,10404,10405,10406,10407,10408,10409,11965,11967,11968,11969,11981,11982,11983,11984,11993,11994,11995,12006,12007,12008,12009,12019,12028,12039,12047,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13005,13010,13011,13012,13024,13031,13041,13048,13049,13079,13094,13097,13099,13106,13114,13127,13131,14025,14096,14097,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14205,14206,14209,14210,14364,14365,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14409,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14585,14587,14608,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14763,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15131,15132,15133,15135,15136,15137,15139,15143,15147,15210,15211,15212,15222,15223,15224,15225,15230,15231,15232,15241,15242,15248,15249,15250,15259,15268,15269,15298,15300,15301,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15329,15330,15331,15332,15333,15334,15336,15337,15338,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15351,15354,15480,15481,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15537,15538,15539,15541,15542,15544,15545,15547,15548,15549,15554,15555,15556,15559,15568,15891,15892,15893,15894,15912,15926,15927,15928,15932,15933,15934,15944,15945,15946,15947,15962,15970,15971,15972,15973,15974,15975,16891,16894,16981,16985,16986,16987,16990},
})

table.insert(Journal.djDungeons, {
    name   = "Durotar",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Durotar.blp",
    bosses = {
        {
            bossID = 5824,
            name   = "Captain Flat Tusk",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5823,
            name   = "Death Flayer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5822,
            name   = "Felweaver Scornn",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5826,
            name   = "Geolord Mottle",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5808,
            name   = "Warlord Kolkanis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 5809,
            name   = "Watch Commander Zalaphil",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {85,193,194,195,209,210,711,714,727,826,827,1200,1211,1214,1287,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1394,1405,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1835,1836,1926,1928,1958,1959,2073,2075,2079,2088,2140,2210,2211,2212,2213,2214,2215,2364,2366,2367,2369,2370,2371,2372,2373,2374,2375,2376,2386,2387,2388,2389,2390,2391,2398,2399,2400,2401,2402,2403,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2983,3192,3200,3205,3207,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3307,3308,3309,3312,3314,3315,3363,3365,3370,3373,3374,3375,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3595,3596,3606,3607,3641,3642,3643,3644,3645,3649,3650,3651,3652,3653,3654,3835,3836,3842,3844,3848,4368,4385,4561,4562,4564,4566,4567,4569,4570,4571,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4701,4767,4768,4771,4914,4915,4916,4917,4919,4920,4921,4922,4928,4929,4933,4935,4936,4937,4939,4940,4942,4944,4946,4947,4948,5540,6040,6062,6214,6266,6267,6268,6269,6336,6337,6350,6378,6379,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6537,6539,6541,6542,6543,6546,6547,6548,6549,6550,6551,6554,6555,6556,6557,6558,6559,6560,6713,6835,7108,7109,7129,7350,7351,7508,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8178,9513,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9785,9786,10500,10502,10503,10504,10508,12259,12405,12406,12408,12409,12410,12414,12773,12775,14025,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14123,14365,14366,14561,14563,14722,14723,14724,14725,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15014,15015,15016,15210,15268,15297,15298,15299,15300,15301,15302,15303,15304,15306,15308,15309,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15489,15490,15491,15492,15495,15501,15895,15925,15926,15932,15933,15944,15969,15970,15995,15999,16008,16606,17183,17185,29201,29202,29203,44803,45631},
})

table.insert(Journal.djDungeons, {
    name = "Orgrimmar", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Orgrimmar.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,837,838,839,840,843,844,845,846,847,848,849,850,1202,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1843,1844,1845,1846,1849,1850,1852,1853,2073,2075,2140,2141,2142,2143,2144,2145,2146,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2214,2215,2300,2303,2308,2309,2310,2314,2315,2316,2364,2366,2367,2369,2370,2371,2372,2373,2374,2375,2376,2392,2393,2394,2395,2396,2397,2398,2399,2400,2401,2402,2403,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2431,2432,2434,2435,2437,2438,2440,2445,2446,2448,2451,2463,2464,2465,2467,2468,2469,2470,2471,2472,2473,2474,2475,2568,2569,2578,2580,2582,2583,2584,2612,2613,2614,2615,2616,2617,2618,2632,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2957,2961,2965,2971,2972,2975,2976,2978,2979,2980,3192,3207,3213,3279,3281,3282,3283,3284,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3307,3308,3312,3314,3374,3375,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3587,3588,3589,3590,3591,3592,3593,3594,3597,3598,3606,3607,3643,3644,3649,3651,3652,3653,3654,3719,3835,3836,3842,3844,3848,3889,3890,3891,3892,3893,3894,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4561,4564,4566,4569,4570,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6266,6267,6268,6269,6336,6337,6350,6506,6510,6511,6512,6515,6518,6521,6523,6524,6525,6526,6527,6537,6542,6543,6549,6550,6555,6556,6558,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7281,7282,7285,7298,7348,7351,7374,7377,7378,7387,7888,7918,7919,7920,7922,7930,7931,7933,7938,7939,7941,7945,7956,7957,7958,7963,8088,8089,8090,8091,8092,8093,8094,8175,8176,8185,8189,8191,8193,8197,8198,8350,8663,9362,9588,9623,9624,9625,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,11854,11855,11862,11863,11864,11870,11871,11872,12255,12256,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,13965,13966,13968,14090,14091,14094,14095,14097,14099,14100,14101,14102,14103,14106,14108,14110,14111,14112,14113,14115,14116,14128,14130,14132,14141,14142,14143,14144,14365,15009,15010,15011,15013,15015,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15200,15297,15298,15300,15301,15302,15303,15309,15424,15443,15444,15445,15477,15479,15480,15481,15482,15484,15485,15486,15490,15491,15492,15495,15932,15933,15944,15970,15995,15999,16008,16335,16341,16345,16486,16497,16532,16533,16534,16535,16536,16539,16540,16541,16542,16543,16544,16545,16548,16549,16550,16551,16552,16554,16555,16558,16560,16561,16562,16563,16564,16565,16566,16567,16568,16569,16571,16573,16574,16577,16578,16579,16580,17185,17187,17188,17189,17190,17192,17586,17588,17590,17591,17592,17593,17618,17620,17622,17623,17624,17625,17772,17773,18427,18428,18429,18430,18432,18434,18435,18436,18437,18461,18585,18586,18826,18828,18831,18835,18837,18840,18844,18848,18860,18866,18868,18871,18874,18877,19366,19383,19384,20134,21994,21996,21997,21998,21999,22002,22004,22005,22006,22009,22010,22011,22013,22015,22060,22062,22063,22065,22066,22069,22070,22071,22074,22075,22077,22078,22079,22080,22081,22083,22086,22088,22089,22090,22091,22095,22097,22098,22099,22102,22106,22108,22109,22110,22113,22843,22852,22855,22856,22857,22858,22859,22860,22862,22863,22864,22865,22867,22868,22869,22870,22872,22873,22874,22875,22876,22877,22878,22879,22880,22881,22882,22883,22884,22885,22886,22887,23243,23244,23251,23252,23253,23254,23255,23256,23257,23258,23259,23260,23261,23262,23263,23264,23464,23465,23466,23467,23468,23469,23563,23564,23565,24551,25510,25511,25512,25513,28168,28169,28172,28173,28175,28239,28240,28241,28242,28243,28246,28247,28377,28378,28425,28426,28427,28428,28429,28430,28431,28432,28433,28434,28435,28436,28438,28439,28440,28441,28442,28483,28484,28485,29201,29202,29203,29600,29601,29602,29603,29604,29605,29612,29613,29614,29615,29616,29617,30069,30070,30071,30072,30073,30074,30076,30077,30086,30087,30088,30089,30093,30343,30344,30345,30346,33853,33918,33919,33920,33921,33922,33923,34486,35129,35130,35131,35132,35133,35134,35135,35136,35137,35138,35139,35140,35141,35142,35143,35144,35145,35146,35147,35148,35149,35150,35151,35152,35153,35154,35155,35156,35157,35158,35159,35160,35161,35162,35163,35164,35165,35166,35167,35168,35169,35170,35171,35172,35173,35174,35175,35176,35177,35178,35179,35180,35317,35319,35320,37865,37927,37928,37929,38588,40778,40779,40780,40787,40788,40789,40797,40798,40799,40807,40808,40809,40816,40817,40818,40826,40827,40828,40836,40837,40838,40847,40848,40849,40856,40857,40858,40866,40868,40869,40877,40878,40879,40880,40883,40884,40887,40888,40890,40898,40907,40918,40927,40930,40933,40936,40939,40960,40963,40966,40972,40973,40974,40975,40978,40979,40982,40984,40986,40987,40992,40993,40998,41001,41004,41007,41010,41013,41016,41019,41023,41024,41027,41030,41033,41038,41041,41044,41047,41048,41049,41050,41052,41054,41056,41059,41061,41063,41064,41066,41068,41069,41071,41073,41074,41076,41078,41081,41084,41087,41134,41137,41140,41143,41148,41151,41154,41157,41160,41186,41187,41188,41189,41190,41199,41202,41205,41208,41211,41214,41217,41223,41224,41226,41228,41229,41231,41233,41234,41236,41268,41269,41270,41271,41272,41275,41278,41281,41287,41290,41293,41298,41301,41304,41310,41313,41316,41321,41324,41327,41330,41331,41332,41587,41588,41589,41590,41591,41592,41616,41618,41620,41622,41624,41626,41628,41629,41631,41633,41634,41636,41638,41639,41641,41643,41644,41645,41646,41647,41650,41655,41658,41661,41664,41667,41672,41675,41678,41683,41712,41715,41767,41770,41773,41827,41828,41830,41831,41833,41835,41837,41839,41841,41847,41848,41849,41850,41851,41854,41859,41864,41869,41874,41877,41878,41879,41880,41882,41884,41886,41892,41894,41896,41897,41899,41901,41902,41904,41907,41908,41910,41912,41915,41918,41921,41924,41927,41930,41934,41937,41940,41943,41946,41949,41953,41956,41959,41962,41965,41968,41971,41990,41993,41996,41998,42002,42005,42008,42011,42014,42017,42020,42021,42022,42023,42024,42025,42026,42027,42028,42029,42030,42031,42032,42033,42041,42042,42043,42044,42045,42046,42047,42055,42056,42057,42058,42059,42060,42061,42062,42063,42064,42065,42066,42067,42068,42076,42077,42078,42079,42080,42081,42082,42110,42112,42114,42115,42118,42119,42122,42128,42129,42130,42131,42132,42133,42134,42135,42136,42137,43515,43654,43655,43656,43657,43660,43661,43663,43664,44429,44431,45626,45631,46374,49179,49181,49183,51327,51328,51329,51330,51331,51332,51333,51334,51335,51336,51337,51338,51339,51340,51341,51342,51343,51344,51345,51346,51347,51348,51349,51350,51351,51352,51353,51354,51355,51356,51357,51358,51359,51360,51361,51362,51363,51364,51365,51366,51367,51368,51369,51370,51371,51372,51373,51374,51375,51376,51378},
})

table.insert(Journal.djDungeons, {
    name   = "Ashenvale",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Ashenvale.blp",
    bosses = {
        {
            bossID = 3773,
            name   = "Akkrilus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3735,
            name   = "Apothecary Falthis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10641,
            name   = "Branch Snapper",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10642,
            name   = "Eck'alom",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10559,
            name   = "Lady Vespia",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10644,
            name   = "Mist Howler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10643,
            name   = "Mugglefin",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10640,
            name   = "Oakpaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10647,
            name   = "Prince Raze",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10639,
            name   = "Rorgish Jowl",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 3792,
            name   = "Terrowulf Packlord",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 12037,
            name   = "Ursol'lok",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {200,201,202,203,236,237,238,239,720,789,790,791,792,793,794,795,796,797,798,799,837,838,839,840,843,844,845,846,863,864,865,886,890,897,911,920,935,1076,1077,1116,1121,1203,1207,1218,1220,1280,1296,1299,1300,1351,1391,1406,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1486,1522,1523,1717,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1839,1840,1843,1844,1849,1850,1929,1934,1936,1943,1944,1945,1988,1990,1993,1996,1997,2011,2013,2017,2034,2059,2072,2077,2078,2079,2080,2141,2142,2143,2144,2145,2146,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2166,2167,2168,2175,2194,2216,2217,2219,2220,2221,2222,2227,2232,2233,2236,2243,2271,2278,2300,2303,2308,2309,2310,2314,2315,2316,2446,2564,2565,2566,2567,2620,2621,2721,2800,2819,2877,2878,2879,2911,2912,2969,2973,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3193,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3210,3211,3212,3227,3306,3310,3313,3315,3345,3376,3377,3378,3379,3380,3381,3415,3429,3569,3589,3590,3591,3592,3597,3598,3602,3603,3645,3647,3655,3656,3719,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4038,4039,4040,4041,4042,4043,4048,4049,4050,4051,4052,4054,4055,4057,4059,4064,4065,4066,4067,4071,4072,4073,4074,4075,4076,4077,4078,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4290,4568,4571,4575,4614,4661,4694,4695,4696,4697,4698,4699,4700,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4718,4719,4720,4721,4722,4726,4727,4729,4731,4732,4788,4949,4998,4999,5001,5002,5003,5007,5009,5266,5267,5323,5613,5622,5624,5739,5753,5754,5755,5812,5813,5814,5820,5961,5962,5964,5966,6360,6378,6379,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6402,6403,6404,6405,6406,6407,6408,6409,6410,6412,6413,6416,6417,6418,6419,6420,6421,6422,6528,6531,6536,6538,6540,6545,6546,6547,6551,6552,6553,6554,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6678,6721,6722,7110,7111,7281,7282,7285,7330,7331,7334,7335,7336,7348,7353,7354,7355,7356,7357,7366,7367,7368,7369,7370,7374,7377,7378,7387,7406,7407,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7418,7419,7420,7421,7422,7423,7424,7431,7432,7433,7434,7435,7436,7437,7438,7440,7441,7443,7444,7445,7446,7447,7448,7454,7455,7456,7457,7458,7459,7460,7461,7462,7463,7465,7492,7554,7558,7608,7609,8080,8081,8082,8083,8084,8085,8086,8175,8176,8185,8189,8191,8193,8197,8198,8251,8261,8262,8267,8268,8269,8270,8272,8283,8286,8288,8289,8290,8292,8296,8297,8299,8300,8301,8302,8303,8305,8306,8307,8308,8309,8310,8313,8317,8319,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9382,9395,9402,9405,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9844,9845,9846,9847,9848,9849,9850,9851,9852,9853,9854,9855,9856,9857,9858,9859,9860,9861,9862,9863,9864,9865,9866,9867,9868,9869,9870,9871,9872,9873,9875,9877,9879,9886,9890,9891,9896,9898,10057,10065,10070,10093,10096,10099,10101,10102,10103,10104,10105,10107,10109,10110,10112,10118,10122,10126,10128,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10171,10172,10175,10176,10178,10179,10181,10182,10183,10187,10189,10193,10195,10199,10204,10210,10211,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10225,10226,10227,10228,10230,10231,10232,10234,10235,10236,10237,10240,10244,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10278,10279,10280,10281,10287,10288,10289,10362,10363,10364,10365,10366,10367,10368,10369,10371,10372,10373,10374,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10404,10405,10406,10407,10408,10409,11229,11965,11967,11968,11969,11970,11971,11977,11978,11979,11980,11981,11982,11983,11984,11985,11986,11990,11991,11992,11993,11994,11995,11996,11997,12002,12004,12005,12006,12007,12008,12009,12010,12016,12017,12019,12020,12025,12026,12027,12028,12029,12030,12036,12039,12040,12046,12047,12048,12052,12053,12054,12057,12058,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13000,13001,13002,13003,13004,13005,13006,13007,13008,13009,13010,13011,13012,13013,13015,13023,13024,13028,13030,13031,13033,13036,13040,13041,13047,13048,13049,13066,13067,13070,13072,13073,13075,13077,13079,13083,13084,13085,13087,13091,13094,13096,13097,13099,13106,13107,13108,13111,13113,13114,13116,13118,13120,13123,13125,13126,13127,13130,13131,13133,13135,13144,14025,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14200,14201,14202,14203,14204,14205,14206,14207,14208,14209,14210,14211,14212,14213,14214,14215,14217,14218,14219,14221,14222,14223,14224,14226,14229,14231,14232,14235,14236,14239,14283,14293,14295,14299,14303,14304,14306,14307,14308,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14364,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14407,14408,14409,14410,14411,14412,14413,14414,14415,14416,14418,14419,14420,14426,14437,14445,14452,14453,14455,14456,14457,14458,14460,14461,14462,14463,14464,14465,14554,14555,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14584,14585,14587,14588,14589,14590,14593,14594,14595,14596,14602,14607,14608,14664,14670,14674,14676,14677,14680,14681,14682,14683,14684,14685,14686,14687,14688,14722,14723,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764,14765,14766,14767,14771,14773,14789,14790,14798,14799,14800,14802,14803,14804,14808,14809,14810,14811,14812,14814,14815,14816,14817,14844,14852,14854,14855,14856,14857,14858,14862,14863,14864,14865,14866,14867,14868,14869,14928,14929,14931,14932,14933,14935,14936,14937,14961,14962,14966,14968,14969,14970,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15014,15017,15018,15019,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15110,15111,15112,15113,15114,15115,15116,15117,15118,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15134,15135,15136,15137,15139,15140,15142,15143,15144,15145,15146,15147,15148,15149,15150,15151,15153,15154,15155,15160,15181,15184,15186,15187,15189,15190,15192,15193,15194,15195,15211,15212,15213,15217,15219,15220,15221,15222,15223,15224,15225,15226,15229,15230,15231,15232,15233,15237,15238,15239,15240,15241,15242,15243,15246,15247,15248,15249,15250,15254,15256,15257,15258,15259,15260,15265,15266,15267,15269,15272,15273,15275,15276,15278,15282,15283,15288,15289,15295,15296,15305,15307,15308,15310,15311,15312,15313,15325,15329,15330,15331,15332,15333,15334,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15353,15354,15355,15356,15357,15358,15360,15361,15362,15364,15365,15367,15368,15394,15425,15426,15427,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15488,15493,15494,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15546,15547,15548,15549,15550,15551,15552,15553,15554,15555,15556,15557,15558,15559,15560,15561,15562,15563,15565,15566,15568,15570,15571,15572,15573,15575,15576,15577,15579,15581,15590,15594,15595,15598,15645,15646,15654,15656,15658,15659,15660,15661,15664,15665,15666,15667,15668,15669,15670,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15891,15892,15893,15894,15912,15918,15926,15927,15928,15929,15931,15934,15935,15936,15938,15939,15940,15941,15942,15943,15945,15946,15947,15962,15963,15966,15967,15968,15971,15972,15973,15974,15975,15976,15977,15986,15987,15988,15989,15990,15991,16658,16659,16660,16661,16740,16741,16889,16890,16975,16977,16978,17005,17006,17046,17047,17192,17692,17694,17695,18339,18343,18672,18674,18679,19514,19515,19516,19517,19522,19523,19524,19525,19530,19531,19532,19533,19538,19539,19540,19541,19546,19547,19548,19549,19554,19555,19556,19557,19562,19563,19564,19570,19571,19572,19573,19578,19580,19581,19582,19583,19584,19587,19589,19590,19595,19596,19597,20428,20431,20434,20439,20440,20443,20444,20578,20579,20580,20581,20582,20615,20616,20617,20618,20619,20635,20637,20638,20639,21565,21566,21567,21568,22672,22748,22749,22750,22752,22753,24118,24119,24120,30497},
})

table.insert(Journal.djDungeons, {
    name   = "Azshara",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Azshara.blp",
    bosses = {
        {
            bossID = 6648,
            name   = "Antilos",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6651,
            name   = "Gatekeeper Rageroar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6650,
            name   = "General Fangferror",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6649,
            name   = "Lady Sesspira",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6647,
            name   = "Magister Hawkhelm",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6652,
            name   = "Master Feardred",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6646,
            name   = "Monnos the Elder",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 13896,
            name   = "Scalebeard",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 8660,
            name   = "The Evalcharr",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 6118,
            name   = "Varo'then's Ghost",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,826,833,867,868,940,942,943,1168,1169,1203,1211,1287,1315,1394,1447,1607,1608,1613,1639,1714,1715,1718,1720,1721,1926,1979,1980,1981,1994,2073,2088,2100,2244,2245,2246,2564,2632,2802,2815,2976,2978,2980,3075,3187,3208,3302,3307,3308,3314,3430,3651,3652,3653,3654,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4046,4062,4069,4080,4082,4083,4084,4088,4089,4091,4569,4570,4696,4733,4737,4767,4768,4771,5216,5266,5267,6423,6425,6427,6429,6430,6537,6542,6543,6550,6556,6558,7113,7332,7468,7469,7477,7486,7495,7517,7518,7519,7520,7521,7522,7523,7524,7525,7526,7527,7528,7529,7530,7531,7532,7533,7534,7535,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7552,7553,7555,7557,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8138,8139,8141,8142,8143,8144,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8347,8367,8749,8750,8751,8752,8753,8754,8755,9286,9359,9402,9433,9434,9747,9748,9749,9756,9757,9763,9765,9905,9906,9907,9910,9911,9912,9913,9914,9915,9916,9917,9918,9920,9921,9922,9923,9924,9925,9928,9932,9933,9934,9935,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9959,9960,9961,9962,9963,9964,9965,9966,9970,9974,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,10709,11120,11974,11975,11976,11977,11978,11979,11980,11988,11989,11990,11991,11992,11999,12001,12002,12004,12005,12012,12013,12014,12015,12016,12017,12023,12024,12025,12026,12027,12031,12032,12034,12035,12036,12043,12044,12045,12046,12048,12055,12056,12057,12058,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13018,13021,13022,13026,13027,13029,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13058,13059,13064,13065,13066,13067,13068,13070,13071,13072,13073,13074,13075,13076,13077,13082,13083,13085,13089,13091,13095,13096,13100,13102,13107,13109,13111,13112,13113,13115,13116,13117,13118,13120,13122,13123,13125,13126,13128,13130,13132,13133,13134,13135,13139,13144,14097,14113,14237,14244,14246,14247,14249,14252,14254,14257,14258,14259,14260,14262,14263,14264,14265,14266,14267,14268,14269,14270,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14365,14417,14425,14427,14428,14431,14432,14433,14434,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14549,14551,14552,14601,14604,14652,14653,14654,14655,14656,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14768,14777,14778,14779,14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14833,14835,14839,14840,14841,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14905,14906,14907,14908,14909,14910,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14944,14945,14947,14948,14949,14950,14951,14952,14953,14954,14955,14956,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15011,15119,15162,15164,15166,15167,15168,15169,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15215,15216,15217,15218,15219,15220,15221,15227,15228,15229,15235,15236,15237,15238,15239,15240,15245,15246,15247,15252,15253,15254,15255,15256,15257,15258,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15283,15287,15288,15289,15291,15294,15295,15296,15303,15309,15323,15324,15325,15370,15373,15374,15376,15378,15379,15380,15381,15382,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15485,15491,15492,15495,15599,15601,15602,15604,15607,15608,15609,15612,15614,15615,15616,15617,15618,15619,15620,15621,15622,15623,15624,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15887,15890,15930,15931,15933,15936,15937,15938,15939,15940,15941,15942,15943,15964,15965,15966,15967,15968,15970,15980,15981,15982,15983,15984,15985,15986,15987,15988,15989,15991,17007,17070,18202,18208,18339,18343,18541,18542,18545,18547,18672,18674,18679,19130,19131,19132,19982,19984,19992,20006,20035,20037,20082,20083,20255,20295,20296,24222,29515,29516,29517,29519,29520,29521,29971,29975},
})

table.insert(Journal.djDungeons, {
    name   = "Felwood",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Felwood.blp",
    bosses = {
        {
            bossID = 14340,
            name   = "Alshirr Banebreath",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14339,
            name   = "Death Howl",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7104,
            name   = "Dessecus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7137,
            name   = "Immolatus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14344,
            name   = "Mongress",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14343,
            name   = "Olm the Wise",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14342,
            name   = "Ragepaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14345,
            name   = "The Ongar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,940,942,943,1168,1169,1203,1315,1443,1447,1607,1608,1639,1715,1720,1721,1979,1981,1994,2100,2244,2245,2246,2564,2568,2569,2578,2580,2582,2583,2584,2815,3075,3208,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4069,4082,4084,4088,4089,4091,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4696,4733,5266,5542,5766,6238,6241,6427,6430,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7113,7517,7518,7519,7520,7521,7523,7526,7527,7528,7529,7530,7531,7532,7535,7536,7537,7538,7539,7540,7541,7542,7543,7546,7553,7557,7611,8080,8081,8082,8083,8084,8085,8086,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8138,8143,8199,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8273,8274,8275,8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9359,9402,9433,9905,9911,9913,9914,9922,9924,9936,9937,9938,9939,9940,9941,9942,9943,9944,9945,9946,9947,9948,9949,9950,9951,9952,9953,9954,9955,9956,9957,9958,9960,9961,9962,9963,9964,9965,9974,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10057,10058,10059,10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,10079,10080,10081,10082,10083,10084,10085,10086,10087,10090,10091,10092,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10136,10137,10138,10139,10140,10141,10142,10144,10145,10146,10147,10148,10149,10150,10152,10153,10154,10155,10156,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10201,10202,10203,10204,10205,10206,10207,10208,10209,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10247,10248,10249,10250,10251,10253,10255,10256,10257,10258,10259,10260,10261,10263,10265,10267,10268,10269,10270,10272,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10385,10386,10387,10388,10390,10391,11875,11974,11975,11976,11977,11978,11979,11988,11989,11990,11991,11992,11999,12001,12002,12004,12005,12013,12014,12015,12016,12024,12025,12026,12027,12032,12034,12035,12036,12043,12044,12045,12046,12055,12056,12057,13002,13003,13004,13007,13008,13009,13013,13014,13018,13021,13022,13026,13027,13030,13036,13039,13040,13043,13046,13047,13052,13055,13056,13058,13059,13065,13066,13067,13070,13071,13072,13073,13074,13076,13077,13082,13085,13089,13091,13095,13096,13100,13101,13102,13109,13111,13112,13115,13118,13120,13122,13125,13126,13128,13130,13134,13135,13139,13144,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,14237,14244,14249,14254,14259,14263,14264,14265,14266,14267,14268,14269,14271,14272,14273,14274,14275,14276,14277,14278,14279,14280,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14292,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14329,14330,14331,14333,14334,14335,14337,14427,14433,14434,14436,14437,14438,14439,14440,14441,14442,14443,14444,14445,14446,14447,14448,14449,14450,14451,14452,14453,14454,14455,14457,14458,14459,14460,14461,14462,14463,14465,14549,14551,14552,14653,14655,14657,14658,14659,14660,14661,14662,14663,14664,14665,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14681,14682,14683,14684,14685,14686,14687,14688,14779,14780,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14813,14814,14815,14816,14817,14835,14840,14842,14843,14844,14846,14847,14848,14849,14850,14851,14852,14853,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14904,14907,14908,14911,14912,14913,14914,14915,14916,14917,14918,14919,14920,14921,14922,14923,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14939,14947,14948,14949,14950,14951,14952,14953,14954,14955,14957,14958,14959,14960,14961,14962,14963,14964,14965,14966,14967,14968,14969,14970,14971,14972,14973,14974,14976,14977,14978,14980,14981,14983,15119,15164,15167,15170,15171,15172,15173,15174,15175,15176,15177,15178,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15216,15217,15218,15219,15220,15227,15228,15229,15235,15236,15237,15238,15239,15245,15246,15252,15253,15254,15255,15256,15257,15262,15263,15264,15265,15266,15267,15270,15271,15272,15273,15274,15275,15276,15278,15279,15280,15281,15282,15288,15291,15294,15295,15296,15323,15324,15325,15373,15376,15378,15379,15380,15381,15383,15384,15385,15386,15387,15388,15389,15390,15391,15392,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15440,15441,15601,15604,15609,15615,15616,15618,15619,15620,15621,15622,15623,15625,15626,15627,15628,15629,15630,15631,15632,15633,15634,15635,15636,15637,15638,15639,15640,15641,15642,15643,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15681,15682,15683,15685,15686,15693,15694,15705,15706,15707,15708,15709,15796,15797,15822,15823,15887,15890,15930,15931,15936,15937,15938,15939,15940,15943,15965,15966,15967,15980,15981,15982,15983,15984,15985,15986,15987,15988,15991,16768,16769,17007,18339,18343,18672,18674,18679,18762,20530,20534,20536,21311,21312,21316,21317,24222,45626},
})

table.insert(Journal.djDungeons, {
    name   = "Darkshore",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Darkshore.blp",
    bosses = {
        {
            bossID = 2186,
            name   = "Carnivous the Breaker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2192,
            name   = "Firecaller Radison",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7015,
            name   = "Flagglemurk the Cruel",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2184,
            name   = "Lady Moongazer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7016,
            name   = "Lady Vespira",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2191,
            name   = "Licillin",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 7017,
            name   = "Lord Sinslayer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2175,
            name   = "Shadowclaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 2172,
            name   = "Strider Clutchmother",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {287,720,727,789,790,791,826,827,833,837,838,839,840,843,844,845,846,847,848,849,850,865,886,890,911,920,935,1076,1077,1121,1168,1202,1203,1211,1214,1218,1220,1287,1296,1299,1300,1391,1394,1405,1406,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1486,1491,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1607,1717,1721,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1780,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1843,1844,1845,1846,1926,1928,1929,1934,1936,1943,1944,1945,1958,1959,2011,2013,2034,2059,2072,2073,2075,2077,2078,2079,2080,2088,2140,2166,2167,2168,2175,2194,2212,2213,2214,2215,2216,2217,2219,2220,2221,2222,2227,2232,2233,2236,2244,2245,2246,2271,2278,2564,2566,2567,2568,2569,2578,2580,2582,2583,2584,2632,2635,2642,2643,2644,2645,2646,2648,2721,2800,2819,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2877,2878,2879,2911,2912,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3020,3021,3045,3047,3048,3049,3055,3056,3057,3058,3065,3066,3067,3069,3184,3185,3186,3192,3193,3195,3196,3198,3199,3200,3201,3202,3203,3204,3205,3206,3207,3210,3211,3212,3213,3214,3227,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3370,3373,3374,3375,3376,3377,3378,3379,3380,3381,3413,3415,3429,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3569,3589,3590,3641,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3656,3740,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3835,3836,3842,3844,3848,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4035,4036,4037,4040,4048,4049,4050,4051,4055,4064,4071,4072,4073,4075,4290,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4658,4659,4661,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4696,4697,4698,4699,4700,4701,4705,4706,4707,4708,4709,4710,4711,4712,4713,4714,4715,4716,4717,4719,4720,4722,4767,4768,4771,4788,4949,4998,4999,5001,5002,5003,5007,5110,5266,5315,5387,5540,5542,5609,5610,5611,5612,5614,5615,5617,5629,5630,5757,5766,6040,6214,6238,6241,6266,6267,6268,6269,6332,6333,6336,6337,6350,6378,6379,6380,6381,6382,6383,6386,6387,6388,6389,6393,6394,6395,6396,6397,6398,6399,6400,6403,6406,6407,6408,6409,6410,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6566,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6579,6580,6581,6582,6583,6584,6585,6586,6587,6588,6590,6591,6592,6593,6594,6595,6596,6597,6598,6599,6600,6601,6602,6603,6604,6605,6607,6608,6609,6610,6611,6612,6613,6614,6615,6616,6617,6659,7003,7004,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7109,7110,7229,7330,7331,7350,7351,7354,7355,7356,7357,7366,7367,7368,7370,7406,7408,7409,7410,7411,7412,7413,7414,7415,7416,7417,7419,7420,7421,7422,7423,7424,7460,7517,7518,7527,7554,7557,7558,7608,7738,7739,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8080,8081,8082,8083,8084,8085,8086,8106,8113,8119,8126,8131,8132,8133,8134,8178,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8274,8275,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8304,8305,8306,8307,8308,8309,8310,8311,8312,8314,8315,8316,8317,8318,8319,8320,8746,8747,8748,8749,8750,8751,8752,8753,8754,8755,9405,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9769,9770,9771,9772,9773,9774,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9791,9792,9793,9794,9795,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9811,9812,9813,9814,9815,9816,9817,9818,9819,9820,9821,9822,9823,9824,9825,9826,9827,9828,9829,9830,9831,9832,9833,9834,9835,9836,9837,9838,9839,9840,9841,9842,9843,9847,9853,9857,9860,9865,9867,9940,9942,9943,9944,9946,9950,9953,9954,9955,9957,9958,9974,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10043,10044,10046,10047,10057,10058,10059,10061,10062,10063,10064,10065,10068,10070,10072,10073,10074,10075,10077,10078,10080,10081,10082,10083,10084,10085,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10129,10130,10131,10132,10133,10134,10136,10137,10138,10140,10144,10145,10146,10147,10148,10149,10154,10155,10156,10159,10161,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10203,10204,10208,10209,10210,10211,10212,10213,10214,10216,10217,10219,10221,10222,10223,10224,10225,10226,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10249,10256,10258,10267,10275,10276,10277,10278,10279,10280,10281,10282,10287,10288,10289,10362,10363,10364,10365,10369,10370,10371,10372,10373,10374,10375,10376,10377,10379,10380,10381,10383,10387,10391,10404,10405,10406,10407,10408,10409,10500,10502,10503,10504,10508,11936,11965,11967,11968,11969,11970,11976,11977,11978,11979,11981,11982,11983,11984,11989,11990,11991,11993,11994,11995,11996,12001,12002,12004,12006,12007,12008,12009,12014,12015,12016,12019,12024,12025,12026,12028,12034,12035,12039,12044,12045,12046,12047,12052,12053,12054,12055,12056,12057,12259,12405,12406,12408,12409,12410,12414,12773,12775,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,12997,12998,12999,13002,13003,13004,13005,13007,13008,13009,13010,13011,13012,13013,13014,13022,13024,13027,13030,13031,13036,13040,13041,13046,13047,13048,13049,13052,13056,13059,13065,13066,13067,13070,13073,13077,13079,13085,13087,13091,13094,13097,13099,13101,13106,13111,13114,13118,13120,13122,13125,13126,13127,13130,13131,13135,13139,13144,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14025,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14100,14101,14102,14103,14106,14108,14109,14110,14111,14112,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14128,14129,14130,14131,14132,14133,14141,14142,14143,14144,14157,14158,14159,14160,14161,14162,14163,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14176,14177,14178,14179,14180,14181,14182,14183,14184,14185,14186,14187,14188,14189,14190,14191,14192,14193,14194,14195,14196,14197,14198,14199,14201,14205,14206,14209,14210,14211,14214,14219,14265,14267,14274,14275,14277,14278,14281,14282,14283,14284,14285,14286,14287,14288,14289,14290,14291,14293,14294,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14319,14320,14321,14323,14324,14325,14327,14330,14331,14337,14364,14365,14366,14367,14368,14369,14370,14371,14372,14373,14374,14375,14376,14377,14378,14379,14380,14397,14398,14399,14400,14401,14402,14403,14404,14405,14406,14409,14414,14416,14437,14441,14444,14445,14447,14448,14449,14450,14451,14452,14453,14454,14455,14457,14458,14459,14465,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14570,14571,14572,14573,14574,14578,14579,14580,14581,14582,14583,14585,14587,14608,14662,14664,14666,14667,14668,14669,14670,14671,14672,14673,14674,14675,14676,14677,14678,14682,14683,14684,14688,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14744,14745,14746,14747,14748,14749,14750,14751,14752,14753,14754,14755,14756,14757,14758,14759,14761,14763,14789,14790,14792,14793,14794,14795,14796,14797,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14810,14813,14844,14846,14848,14849,14850,14851,14852,14854,14855,14856,14857,14858,14859,14860,14861,14863,14864,14865,14868,14869,14904,14912,14915,14916,14919,14920,14922,14923,14924,14925,14926,14927,14928,14929,14930,14932,14933,14934,14935,14936,14937,14938,14948,14952,14954,14957,14958,14959,14960,14961,14962,14963,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14976,14977,14983,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15116,15117,15118,15119,15120,15121,15122,15123,15124,15125,15126,15127,15128,15129,15130,15131,15132,15133,15135,15136,15137,15139,15140,15143,15147,15148,15170,15171,15174,15175,15176,15179,15180,15181,15182,15183,15184,15185,15186,15187,15188,15189,15190,15191,15192,15194,15202,15203,15206,15207,15210,15211,15212,15216,15217,15218,15219,15222,15223,15224,15225,15228,15229,15230,15231,15232,15236,15237,15238,15239,15241,15242,15245,15248,15249,15250,15253,15254,15255,15256,15259,15263,15264,15265,15266,15268,15269,15271,15272,15274,15275,15276,15278,15279,15280,15281,15282,15288,15291,15294,15295,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15313,15323,15324,15325,15329,15330,15331,15332,15333,15334,15335,15336,15337,15338,15339,15340,15341,15342,15343,15344,15345,15346,15347,15348,15349,15350,15351,15352,15354,15355,15381,15384,15387,15388,15389,15390,15391,15393,15394,15395,15396,15397,15398,15399,15400,15401,15402,15403,15404,15405,15406,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15436,15437,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15505,15506,15507,15508,15509,15510,15511,15512,15513,15514,15515,15516,15517,15518,15519,15520,15521,15522,15523,15524,15525,15526,15527,15528,15529,15530,15531,15532,15533,15534,15535,15536,15537,15538,15539,15540,15541,15542,15543,15544,15545,15547,15548,15549,15553,15554,15555,15556,15559,15560,15568,15621,15622,15623,15627,15631,15633,15634,15637,15639,15640,15641,15642,15644,15645,15646,15647,15648,15649,15650,15651,15652,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15670,15671,15672,15673,15674,15676,15677,15679,15681,15683,15693,15694,15866,15890,15891,15892,15893,15894,15895,15912,15925,15926,15927,15928,15930,15931,15932,15933,15934,15935,15936,15937,15938,15939,15943,15944,15945,15946,15947,15962,15966,15967,15969,15970,15971,15972,15973,15974,15975,15982,15983,15984,15985,15986,15987,15995,15999,16008,17187,18339,18343,18672,18674,18679,24222,29201,29202,29203,45626,45631},
})

table.insert(Journal.djDungeons, {
    name = "Moonglade", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Moonglade.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {812,942,1203,1607,1721,2435,2437,2438,2440,2470,2471,2472,2473,2474,2475,2564,3587,3588,3892,3893,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,5266,7517,7518,7527,7557,8080,8081,8082,8083,8084,8085,8086,8106,8113,8119,8126,8131,8132,8133,8134,8245,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8274,8275,8282,8285,8286,8291,8293,8295,8297,8311,8314,8315,8316,8317,8318,8319,8749,8750,8751,8752,8753,8754,8755,9940,9942,9943,9944,9946,9950,9953,9954,9955,9957,9958,9974,10057,10058,10059,10061,10062,10063,10064,10065,10068,10070,10072,10073,10074,10075,10077,10078,10080,10081,10082,10083,10084,10085,10093,10095,10096,10098,10099,10103,10106,10107,10108,10109,10110,10120,10121,10122,10125,10126,10128,10129,10130,10131,10132,10133,10134,10165,10166,10167,10168,10170,10171,10172,10173,10174,10175,10176,10177,10179,10180,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10203,10204,10208,10209,10229,10231,10238,10239,10240,10241,10242,10243,10244,10245,10276,10278,10282,11976,11977,11989,11990,12001,12002,12014,12024,12025,12034,12044,12045,12055,12056,12254,13008,13009,13014,13022,13027,13030,13046,13052,13059,13065,13066,13067,13073,13085,13111,13120,13122,13125,13126,13139,13144,14265,14267,14274,14275,14277,14278,14281,14282,14283,14284,14285,14286,14287,14289,14290,14291,14293,14294,14295,14296,14298,14299,14300,14301,14302,14304,14309,14311,14313,14321,14437,14441,14444,14445,14447,14448,14450,14451,14452,14454,14662,14664,14666,14667,14668,14669,14671,14672,14673,14674,14675,14789,14790,14792,14793,14794,14795,14796,14797,14801,14802,14803,14807,14844,14846,14848,14849,14850,14851,14852,14855,14856,14857,14860,14861,14904,14912,14915,14916,14919,14920,14922,14923,14926,14927,14928,14929,14938,14948,14952,14954,14957,14958,14959,14960,14961,14962,14963,14964,14967,14968,14972,14974,15119,15170,15171,15174,15175,15176,15180,15181,15182,15183,15184,15186,15187,15190,15216,15217,15228,15229,15236,15237,15245,15253,15254,15263,15264,15271,15274,15275,15279,15280,15291,15294,15295,15323,15324,15381,15384,15387,15388,15389,15390,15391,15393,15394,15395,15425,15427,15428,15621,15622,15623,15627,15631,15633,15634,15637,15639,15640,15641,15642,15644,15645,15646,15647,15648,15649,15651,15652,15653,15654,15655,15656,15659,15661,15663,15671,15694,15930,15936,15937,15966,15982,15983,15984,16608,18400,18402,18535,18536,20600,21531,21532},
})

table.insert(Journal.djDungeons, {
    name   = "Winterspring",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Winterspring.blp",
    bosses = {
        {
            bossID = 10202,
            name   = "Azurous",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10196,
            name   = "General Colbatann",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10199,
            name   = "Grizzle Snowpaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10198,
            name   = "Kashoch the Reaver",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10201,
            name   = "Lady Hederine",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10197,
            name   = "Mezzir the Howler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 10200,
            name   = "Rak'shiri",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {812,833,942,944,1168,1203,1315,1443,1607,1721,1979,2243,2244,2245,2246,2423,2424,2425,2426,2427,2428,2435,2437,2438,2440,2451,2470,2471,2472,2473,2474,2475,2564,3075,3587,3588,3892,3893,3894,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3986,3987,3989,3990,3992,3993,3994,3995,3996,3997,3998,3999,4000,4001,4002,4003,4004,4005,4006,4007,4696,5266,5267,8080,8081,8082,8083,8084,8085,8086,8088,8089,8090,8091,8092,8093,8094,8245,8246,8249,8250,8251,8252,8254,8256,8258,8260,8261,8262,8263,8264,8265,8267,8268,8269,8270,8271,8272,8275,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295,8296,8297,8298,8299,8300,8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320,8749,8750,8751,8752,8753,8754,8755,9402,9943,9944,9946,9950,9974,10057,10064,10065,10070,10073,10074,10077,10078,10084,10085,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10133,10135,10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10186,10187,10188,10189,10190,10192,10193,10195,10196,10197,10198,10199,10200,10203,10204,10210,10211,10212,10213,10214,10215,10216,10217,10218,10219,10220,10221,10222,10223,10224,10225,10226,10227,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10240,10241,10242,10244,10245,10246,10247,10248,10249,10250,10251,10252,10253,10254,10255,10256,10257,10258,10259,10260,10261,10262,10263,10264,10265,10266,10267,10268,10269,10270,10271,10272,10273,10274,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10366,10367,10368,10369,10370,10371,10372,10373,10374,10375,10376,10377,10378,10379,10380,10381,10382,10383,10384,10385,10386,10387,10388,10389,10390,10391,11976,11977,11978,11979,11980,11990,11991,11992,12002,12004,12005,12014,12015,12016,12017,12025,12026,12027,12034,12035,12036,12045,12046,12048,12055,12056,12057,12058,12631,12752,12756,12757,13000,13001,13002,13003,13004,13006,13007,13008,13009,13013,13014,13015,13022,13023,13027,13028,13030,13036,13040,13047,13052,13056,13059,13065,13066,13067,13070,13072,13073,13075,13077,13083,13085,13091,13096,13101,13107,13111,13113,13116,13118,13120,13122,13123,13125,13126,13130,13133,13135,13144,14275,14277,14281,14283,14284,14287,14288,14293,14295,14296,14297,14298,14299,14300,14301,14302,14303,14304,14305,14306,14307,14308,14309,14310,14311,14312,14313,14314,14315,14316,14317,14318,14319,14320,14321,14322,14323,14324,14325,14326,14327,14328,14329,14330,14331,14332,14333,14334,14335,14336,14337,14437,14444,14445,14447,14448,14449,14451,14452,14453,14454,14455,14456,14457,14458,14459,14460,14461,14462,14463,14464,14465,14552,14553,14554,14555,14664,14667,14668,14670,14671,14672,14673,14674,14675,14676,14677,14678,14680,14681,14682,14683,14684,14685,14686,14687,14688,14789,14790,14795,14796,14798,14799,14800,14801,14802,14803,14804,14805,14806,14807,14808,14809,14810,14811,14812,14813,14814,14815,14816,14817,14844,14849,14850,14852,14854,14855,14856,14857,14858,14859,14860,14861,14862,14863,14864,14865,14866,14867,14868,14869,14915,14916,14919,14922,14924,14925,14926,14927,14928,14929,14930,14931,14932,14933,14934,14935,14936,14937,14938,14958,14959,14961,14962,14963,14964,14966,14967,14968,14969,14970,14971,14972,14973,14974,14975,14976,14977,14978,14979,14980,14981,14982,14983,15119,15170,15179,15180,15181,15184,15185,15186,15187,15188,15189,15190,15191,15192,15193,15194,15195,15217,15218,15219,15220,15221,15228,15229,15236,15237,15238,15239,15240,15246,15247,15253,15254,15255,15256,15257,15258,15264,15265,15266,15267,15271,15272,15273,15274,15275,15276,15278,15280,15281,15282,15283,15288,15289,15294,15295,15296,15324,15325,15388,15389,15390,15391,15393,15394,15395,15425,15426,15427,15428,15429,15430,15431,15432,15433,15434,15435,15436,15437,15438,15439,15440,15441,15442,15631,15633,15634,15640,15642,15644,15645,15646,15647,15648,15650,15651,15653,15654,15655,15656,15657,15658,15659,15660,15661,15662,15663,15664,15665,15666,15667,15668,15669,15670,15671,15672,15673,15674,15675,15676,15677,15678,15679,15680,15681,15682,15683,15684,15685,15686,15687,15693,15694,15704,15784,15786,15787,15789,15791,15792,15795,15862,15863,15887,15890,15930,15931,15936,15938,15939,15940,15941,15942,15943,15966,15967,15968,15983,15984,15985,15986,15987,15988,15989,15991,17007,17190,18339,18343,18672,18674,18679,20697,21318,21319,21320,21322,24222,34423,34424},
})

table.insert(Journal.djDungeons, {
    name   = "Bloodmyst Isle",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BloodMyst.blp",
    bosses = {
        {
            bossID = 22060,
            name   = "Fenissa the Assassin",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {727,789,790,827,911,920,935,1076,1214,1218,1220,1296,1299,1300,1391,1405,1406,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1440,1446,1448,1455,1457,1458,1459,1460,1461,1462,1469,1473,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1764,1766,1767,1768,1769,1770,1772,1774,1775,1776,1777,1778,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1928,1929,1934,1936,1943,1944,1945,1958,1959,2034,2073,2075,2078,2079,2140,2166,2167,2168,2175,2212,2213,2214,2215,2216,2217,2219,2220,2232,2632,2635,2642,2643,2644,2645,2646,2648,2879,2911,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969,2970,2971,2972,2973,2974,2975,2976,2977,2978,2979,2980,2981,2982,2983,2984,2985,2986,2987,2988,2989,2990,2991,2992,3057,3058,3065,3066,3184,3192,3193,3195,3196,3198,3199,3200,3202,3205,3207,3211,3213,3214,3227,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3370,3373,3374,3375,3376,3377,3378,3379,3429,3641,3642,3643,3644,3645,3647,3649,3650,3651,3652,3653,3654,3655,3740,4290,4561,4562,4564,4566,4567,4568,4569,4570,4571,4575,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4676,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4694,4695,4697,4698,4699,4700,4701,4706,4708,4709,4710,4788,4949,4998,5110,6266,6267,6268,6269,6336,6337,6378,6379,6380,6381,6382,6383,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6528,6531,6536,6537,6538,6539,6540,6541,6542,6543,6545,6546,6547,6548,6549,6550,6551,6552,6553,6554,6555,6556,6557,6558,6559,6560,6561,6562,6563,6564,6565,6567,6568,6569,6570,6571,6572,6573,6574,6575,6576,6577,6578,6580,6581,6582,6583,6584,6585,6586,6587,7108,7109,7350,7351,7554,7558,7608,8178,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9766,9767,9768,9770,9771,9775,9776,9777,9778,9779,9780,9781,9782,9783,9784,9785,9786,9787,9788,9789,9790,9792,9793,9794,9801,9805,9810,9811,9812,9813,9814,9815,9816,9818,10405,10407,11965,11967,11981,11982,11993,11994,12006,12007,12052,12053,12054,12975,12976,12977,12978,12979,12982,12983,12985,12987,12988,12989,12990,12994,12996,14025,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14119,14120,14121,14122,14123,14124,14125,14126,14127,14129,14131,14133,14159,14160,14161,14162,14164,14165,14166,14167,14168,14169,14170,14171,14172,14173,14174,14175,14179,14364,14365,14366,14367,14368,14369,14370,14371,14373,14374,14375,14376,14559,14560,14561,14562,14563,14564,14565,14566,14567,14568,14569,14571,14572,14722,14723,14724,14725,14726,14727,14728,14729,14730,14742,14743,14745,14746,14747,14748,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15014,15015,15016,15017,15018,15019,15110,15111,15112,15113,15114,15115,15117,15122,15124,15210,15211,15222,15223,15224,15230,15248,15259,15268,15269,15297,15298,15299,15300,15301,15302,15303,15304,15305,15306,15307,15308,15309,15310,15311,15312,15329,15330,15331,15333,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15488,15489,15490,15491,15492,15493,15494,15495,15496,15497,15498,15499,15500,15501,15502,15503,15504,15506,15507,15508,15509,15510,15511,15512,15513,15515,15517,15519,15526,15893,15894,15895,15912,15925,15926,15932,15933,15944,15945,15946,15969,15970,15971,15972,24334,24343,24346,24347,24348,24351,24352,24354,26004,26005,26006,26007,26008,26009,26010,26011,26012,26013,26014,26016,26017,26018,26019,26020,26021,26022,26023,26024,26025,26026,26027,26028,26030,26031,26032,26033,26034,26035,26036,26037,26038,26039,26040,26049,26050,26051,26052,26053,26054,27389,27390,27398,27400,27402,27404,27640,27641,31256,31263,31264},
})

table.insert(Journal.djDungeons, {
    name = "Azuremyst Isle", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-AzureMyst.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {727,792,793,794,795,796,797,798,799,1201,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1839,1840,2073,2075,2117,2119,2120,2121,2122,2123,2124,2125,2126,2127,2129,2140,2210,2211,2212,2213,2214,2215,2300,2303,2308,2309,2310,2314,2315,2316,2379,2380,2381,2383,2384,2385,2390,2392,2393,2394,2395,2396,2397,2568,2569,2578,2580,2582,2583,2584,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2971,2972,2975,2976,2978,2979,2980,3192,3200,3207,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3307,3308,3312,3314,3363,3365,3370,3373,3374,3375,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3599,3600,3602,3603,3641,3642,3643,3644,3649,3650,3651,3652,3653,3654,3719,3835,3836,3842,3844,3848,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4561,4562,4564,4566,4569,4570,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6266,6267,6268,6269,6336,6337,6350,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6542,6543,6549,6550,6555,6556,6558,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7108,7109,7281,7282,7285,7348,7350,7351,7374,7377,7378,7387,7508,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8175,8176,8178,8185,8189,8191,8193,8197,8198,9513,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14086,14087,14088,14089,14090,14091,14093,14094,14095,14097,14098,14099,14100,14101,14102,14103,14106,14108,14110,14111,14112,14113,14115,14116,14128,14130,14132,14141,14142,14143,14144,14365,15003,15004,15005,15006,15007,15008,15009,15010,15011,15013,15015,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15297,15298,15299,15300,15301,15302,15303,15309,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15490,15491,15492,15495,15895,15925,15932,15933,15944,15969,15970,15995,15999,16008,17184,17186,23423,23429,23430,23431,23931,24103,24104,24107,24108,24109,24111,24112,24113,24129,24130,24131,24133,24134,24135,24141,24142,24144,24423,24424,24425,24435,24436,24437,24438,24439,24440,24445,24446,24447,27399,27401,27403,29201,29202,29203,45626,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Teldrassil",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Teldrassil.blp",
    bosses = {
        {
            bossID = 3535,
            name   = "Blackmoss the Fetid",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14430,
            name   = "Duskstalker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14431,
            name   = "Fury Shelda",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14429,
            name   = "Grimmaw",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14432,
            name   = "Threggil",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 14428,
            name   = "Uruson",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {727,792,793,794,795,796,797,798,799,1201,1364,1366,1367,1368,1369,1370,1372,1374,1376,1377,1378,1380,1418,1419,1420,1421,1422,1423,1425,1427,1429,1430,1431,1433,1438,1495,1497,1498,1499,1501,1502,1503,1504,1505,1506,1507,1509,1730,1731,1732,1733,1734,1735,1737,1839,1840,2073,2075,2117,2119,2120,2121,2122,2123,2124,2125,2126,2127,2129,2140,2210,2211,2212,2213,2214,2215,2300,2303,2308,2309,2310,2314,2315,2316,2379,2380,2381,2383,2384,2385,2392,2393,2394,2395,2396,2397,2571,2632,2635,2642,2643,2644,2645,2646,2648,2649,2650,2651,2652,2653,2654,2656,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2970,2971,2972,2974,2975,2976,2977,2978,2979,2980,3192,3200,3207,3213,3214,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3302,3303,3304,3305,3307,3308,3309,3312,3314,3363,3365,3370,3373,3374,3375,3599,3600,3602,3603,3641,3642,3643,3644,3649,3650,3651,3652,3653,3654,3719,3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4561,4562,4564,4566,4567,4569,4570,4658,4659,4662,4663,4665,4666,4668,4669,4671,4672,4674,4675,4677,4678,4680,4681,4683,4684,4686,4687,4689,4690,4692,4693,4701,4907,5394,5395,5398,5399,5405,5419,5458,5459,5587,5589,5590,5591,5592,5593,5606,5618,5739,5961,5962,5964,5966,6058,6061,6266,6267,6268,6269,6336,6337,6506,6507,6508,6509,6510,6511,6512,6513,6514,6515,6517,6518,6519,6520,6521,6527,6537,6539,6541,6542,6543,6548,6549,6550,6555,6556,6557,6558,6559,7095,7108,7109,7281,7282,7285,7348,7350,7351,7374,7377,7378,7387,8080,8081,8082,8083,8084,8085,8086,8175,8176,8178,8185,8189,8191,8193,8197,8198,8752,8753,8754,8755,9598,9599,9603,9742,9743,9744,9745,9746,9747,9748,9749,9750,9751,9752,9753,9754,9755,9756,9757,9758,9759,9760,9761,9762,9763,9764,9765,9786,10655,10656,11187,11189,11190,14086,14087,14088,14089,14090,14091,14093,14094,14095,14096,14097,14098,14099,14102,14109,14110,14113,14114,14115,14116,14117,14365,14724,15003,15004,15005,15006,15007,15008,15009,15010,15011,15012,15013,15015,15016,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15210,15268,15297,15298,15299,15300,15301,15302,15303,15304,15306,15309,15472,15473,15474,15475,15476,15477,15478,15479,15480,15481,15482,15483,15484,15485,15486,15487,15489,15490,15491,15492,15495,15895,15925,15932,15933,15944,15969,15970,16604,16623,17184,17186,18611,18612,18957},
})

table.insert(Journal.djDungeons, {
    name = "Darnassus", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Darnassas.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {200,201,202,203,236,237,238,239,285,286,287,718,792,793,794,795,796,797,798,799,837,838,839,840,843,844,845,846,847,848,849,850,1201,1839,1840,1843,1844,1845,1846,1849,1850,1852,1853,2117,2119,2120,2121,2122,2123,2124,2125,2126,2127,2129,2141,2142,2143,2144,2145,2146,2148,2149,2150,2151,2152,2153,2156,2158,2159,2160,2300,2303,2308,2309,2310,2314,2315,2316,2379,2380,2381,2383,2384,2385,2392,2393,2394,2395,2396,2397,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2431,2432,2434,2435,2437,2438,2440,2445,2446,2448,2451,2463,2464,2465,2467,2468,2469,2470,2471,2472,2473,2474,2475,2568,2569,2578,2580,2582,2583,2584,2612,2613,2614,2615,2616,2617,2618,3587,3588,3589,3590,3591,3592,3593,3594,3597,3598,3599,3600,3602,3603,3719,3889,3890,3891,3892,3893,3894,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,5542,5739,5766,5961,5962,5964,5966,6238,6241,6966,6967,6968,6969,6973,6998,7000,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7281,7282,7285,7298,7348,7374,7377,7378,7387,8088,8089,8090,8091,8092,8093,8094,8175,8176,8185,8189,8191,8193,8197,8198,8350,9600,9601,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,11870,11871,11872,12247,12249,12256,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,17184,17186,17188,17189,17190,17192,43515,43654,43655,43656,43657,43660,43661,43663,43664,45626},
})

-- ################# TBC ZONES ##########
table.insert(Journal.djDungeons, {
    name   = "Hellfire Peninsula",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HellfirePen.blp",
    category = "TBC",
    bosses = {
        {
            bossID = 18678,
            name   = "Fulgorge",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18677,
            name   = "Mekthorg the Wild",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18679,
            name   = "Vorakem Doomspeaker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {1203,1607,1721,2300,2303,2308,2309,2310,2314,2315,2316,2564,2568,2569,2578,2580,2582,2583,2584,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3719,3835,3836,3842,3844,3848,3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,4696,5266,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6350,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7281,7282,7285,7348,7374,7377,7378,7387,7517,7518,7527,7557,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8080,8081,8082,8083,8084,8085,8086,8106,8113,8119,8126,8131,8132,8133,8134,8175,8176,8185,8189,8191,8193,8197,8198,8246,8247,8248,8249,8250,8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270,8271,8272,8274,8275,8282,8284,8285,8286,8287,8288,8289,8291,8292,8293,8294,8295,8297,8298,8299,8300,8301,8302,8304,8305,8306,8307,8308,8310,8311,8312,8314,8315,8316,8317,8318,8319,8320,8752,8753,8754,8755,9402,9940,9942,9943,9944,9946,9950,9953,9954,9955,9957,9958,9974,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10057,10058,10059,10061,10062,10063,10064,10065,10068,10070,10072,10073,10074,10075,10077,10078,10080,10081,10082,10083,10084,10085,10093,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10118,10119,10120,10121,10122,10123,10124,10125,10126,10128,10129,10130,10131,10132,10133,10134,10136,10138,10144,10145,10147,10148,10156,10159,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,10193,10194,10195,10196,10197,10198,10199,10200,10203,10204,10208,10209,10210,10211,10212,10213,10214,10216,10219,10221,10222,10223,10224,10225,10228,10229,10230,10231,10232,10233,10234,10235,10236,10237,10238,10239,10240,10241,10242,10243,10244,10245,10258,10275,10276,10277,10278,10279,10280,10281,10282,10362,10363,10364,10365,10369,10370,10371,10372,10374,10375,10376,10377,10380,10381,10391,10500,10502,10503,10504,10508,11976,11977,11978,11989,11990,11991,12001,12002,12004,12014,12015,12024,12025,12026,12034,12035,12044,12045,12046,12055,12056,12057,12259,12405,12406,12408,12409,12410,12414,12773,12775,13002,13003,13004,13007,13008,13009,13013,13014,13022,13027,13030,13036,13040,13046,13047,13052,13056,13059,13065,13066,13067,13070,13072,13073,13077,13085,13091,13096,13101,13111,13118,13120,13122,13125,13126,13130,13135,13139,13144,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15216,15217,15218,15219,15228,15229,15236,15237,15238,15245,15253,15254,15255,15256,15263,15264,15265,15271,15272,15274,15275,15276,15278,15279,15280,15281,15282,15291,15294,15295,15323,15324,15325,15930,15936,15937,15938,15939,15995,15999,16008,20818,20820,20821,20823,20826,20827,20828,20832,20907,20909,20955,20960,20961,20964,21748,21755,21764,21765,21767,21768,21775,21779,21790,21791,21849,21850,21851,21852,21853,21932,21933,21934,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,23587,23742,24074,24075,24076,24077,24078,24575,24576,24577,24578,24580,24582,24583,24584,24585,24586,24587,24588,24589,24590,24591,24592,24593,24594,24595,24596,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24693,24694,24695,24696,24697,24698,24699,24700,24701,24702,24703,24704,24705,24706,24707,24708,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24806,24807,24808,24809,24810,24811,24812,24813,24814,24815,24816,24817,24818,24819,24820,24821,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24918,24919,24920,24921,24922,24923,24924,24925,24926,24927,24928,24929,24930,24931,24932,24933,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25030,25031,25032,25033,25034,25035,25036,25039,25040,25041,25042,25043,25044,25045,25046,25047,25048,25049,25050,25053,25054,25055,25056,25057,25058,25059,25060,25061,25062,25063,25064,25067,25068,25069,25070,25071,25072,25073,25074,25075,25076,25077,25078,25081,25082,25083,25084,25085,25086,25087,25088,25089,25090,25091,25092,25095,25096,25097,25098,25099,25100,25101,25102,25103,25104,25105,25106,25109,25110,25111,25112,25113,25114,25115,25116,25117,25118,25119,25120,25123,25124,25125,25126,25127,25128,25129,25130,25131,25132,25133,25134,25137,25138,25139,25140,25141,25142,25143,25144,25146,25147,25148,25151,25152,25153,25154,25155,25156,25157,25158,25160,25161,25162,25165,25166,25167,25168,25169,25170,25171,25172,25174,25175,25176,25179,25180,25181,25182,25183,25184,25185,25186,25187,25188,25189,25190,25193,25194,25195,25196,25197,25198,25199,25200,25201,25202,25203,25204,25207,25208,25209,25210,25211,25212,25213,25214,25215,25216,25217,25218,25221,25222,25223,25224,25225,25226,25227,25228,25229,25230,25231,25232,25235,25236,25237,25238,25239,25240,25241,25242,25243,25244,25245,25246,25249,25250,25251,25252,25253,25254,25255,25256,25257,25258,25259,25260,25263,25264,25265,25266,25267,25268,25269,25270,25271,25272,25273,25274,25277,25278,25279,25280,25281,25282,25283,25284,25286,25287,25288,25291,25292,25293,25294,25295,25296,25297,25298,25299,25300,25301,25302,25305,25306,25307,25308,25309,25310,25311,25312,25313,25314,25315,25316,25319,25320,25321,25322,25323,25324,25325,25326,25327,25328,25329,25330,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25438,25439,25478,25479,25480,25481,25482,25483,25484,25485,25486,25487,25488,25489,25492,25494,25495,25496,25499,25500,25501,25502,25503,25504,25505,25506,25507,25508,25522,25523,25524,25654,25655,25656,25657,25659,25660,25661,25662,25668,25669,25670,25671,25673,25674,25675,25676,25701,25702,25710,25711,25712,25713,25714,25715,25716,25717,25718,25781,25782,25783,25784,25785,25788,25789,25790,25791,25792,25803,25804,25805,25806,25808,25809,25810,25811,25823,25824,25825,25826,25913,25914,25915,25919,25920,25921,25979,25980,25981,25982,25983,25984,25985,25986,25987,25989,25992,25993,27731,27732,27830,27832,27833,27834,28040,28041,28042,28050,28051,28052,28055,28057,28062,28063,28069,28070,28074,28075,28531,28532,28533,28534,28535,28536,28537,28540,28541,28542,28543,28544,29108,29109,29151,29152,29153,29155,29156,29157,29158,29159,29160,29165,29166,29167,29168,29169,29201,29202,29203,29204,29212,29398,29399,29400,29908,29909,29910,29911,29913,29914,29915,29916,29917,29919,29926,29927,29928,29929,29930,29931,29932,29933,29934,29935,29936,29937,29938,29939,29940,29941,29942,29943,29944,29945,29946,30419,30420,30421,30422,30732,30733,30734,30735,30736,30737,30738,30739,30740,30741,30753,30755,30804,30855,30856,30857,31080,31125,31126,31127,31131,31133,31134,31136,31137,31138,31139,31140,31142,31143,31145,31147,31148,31149,31150,31151,31152,31153,31168,31170,31172,31173,31174,31175,31176,31177,31178,31179,31180,31181,31182,31183,31184,31185,31186,31187,31190,31193,31196,31715,31717,31718,31719,31720,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32508,32756,32772,32774,32776,35332,35337,35339,35343,35360,35364,35366,35371,35377,35383,35386,35392,35406,35409,35413,35464,35465,35466,35467,35468,35469,35470,35471,35472,35473,35474,35475,35476,35477,35478,43515,43654,43655,43656,43657,43660,43661,43663,43664,43666,43667,45626,45627,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Zangarmarsh",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Zangarmarsh.blp",
    category   = "TBC",
    bosses = {
        {
            bossID = 18682,
            name   = "Bog Lurker",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18681,
            name   = "Coilfang Emissary",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18680,
            name   = "Marticar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {4368,4385,10500,10502,10503,10504,10508,15995,15999,16008,23742,24575,24576,24577,24578,24580,24582,24583,24584,24585,24586,24587,24588,24589,24590,24591,24592,24593,24594,24595,24596,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24693,24694,24695,24696,24697,24698,24699,24700,24701,24702,24703,24704,24705,24706,24707,24708,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24782,24806,24807,24808,24809,24810,24811,24812,24813,24814,24815,24816,24817,24818,24819,24820,24821,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24918,24919,24920,24921,24922,24923,24924,24925,24926,24927,24928,24929,24930,24931,24932,24933,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25030,25031,25032,25033,25034,25035,25036,25037,25038,25039,25040,25044,25045,25046,25047,25048,25049,25050,25051,25052,25053,25054,25058,25059,25060,25061,25062,25063,25064,25065,25066,25067,25068,25072,25073,25074,25075,25076,25077,25078,25079,25080,25081,25082,25086,25087,25088,25089,25090,25091,25092,25093,25094,25095,25096,25100,25101,25102,25103,25104,25105,25106,25107,25108,25109,25110,25114,25115,25116,25117,25118,25119,25120,25121,25122,25123,25124,25128,25129,25130,25131,25132,25133,25134,25135,25136,25137,25138,25142,25143,25144,25146,25147,25148,25149,25150,25151,25152,25156,25157,25158,25160,25161,25162,25163,25164,25165,25166,25170,25171,25172,25174,25175,25176,25177,25178,25179,25180,25184,25185,25186,25187,25188,25189,25190,25191,25192,25193,25194,25198,25199,25200,25201,25202,25203,25204,25205,25206,25207,25208,25212,25213,25214,25215,25216,25217,25218,25219,25220,25221,25222,25226,25227,25228,25229,25230,25231,25232,25233,25234,25235,25236,25240,25241,25242,25243,25244,25245,25246,25247,25248,25249,25250,25254,25255,25256,25257,25258,25259,25260,25261,25262,25263,25264,25268,25269,25270,25271,25272,25273,25274,25275,25276,25277,25278,25282,25283,25284,25286,25287,25288,25289,25290,25291,25292,25296,25297,25298,25299,25300,25301,25302,25303,25304,25305,25306,25310,25311,25312,25313,25314,25315,25316,25317,25318,25319,25320,25324,25325,25326,25327,25328,25329,25330,25331,25332,25333,25334,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25514,25515,25516,25517,25518,25519,25525,25530,25534,25536,25537,25538,25540,25541,25597,25598,25599,25600,25601,25602,25610,25611,25612,25613,25614,25615,25616,25617,25618,25619,25620,25621,25827,25828,25835,25836,25838,25922,25923,25924,25925,27715,27716,27717,27721,27722,27723,27724,27725,27726,27727,27728,27730,27733,27734,27735,27749,27750,27751,27752,27753,27754,27756,27920,27921,27922,27924,27926,27927,27928,27929,27930,27931,27939,27942,28029,28180,28181,28182,28183,28531,28532,28533,28534,28535,28536,28537,28538,28539,28540,28541,29149,29150,29170,29171,29172,29173,29174,30765,30771,30775,30777,30781,30784,31125,31126,31127,31131,31133,31134,31136,31137,31138,31139,31140,31142,31143,31145,31147,31148,31149,31150,31151,31152,31153,31173,31175,31178,31180,31186,31187,31190,31193,31196,31200,31202,31204,31222,31226,31230,31242,31243,31244,31247,31248,31249,31250,31254,31657,31658,31659,31660,31661,31768,31770,31786,31787,31788,31789,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32756,35329,35336,35342,35347,35358,35365,35367,35374,35379,35385,35387,35394,35403,35408,35415,45631},
})

table.insert(Journal.djDungeons, {
    name   = "Nagrand",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Nagrand.blp",
    category   = "TBC",
    bosses = {
        {
            bossID = 18684,
            name   = "Bro'Gaz the Clanless",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 17144,
            name   = "Goretooth",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18683,
            name   = "Voidhunter Yar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,8080,8081,8082,8083,8084,8085,8086,8283,8289,8290,8296,8300,8307,8308,8309,8310,8752,8753,8754,8755,10105,10136,10137,10140,10144,10146,10147,10149,10154,10155,10156,10161,10210,10217,10219,10226,10228,10230,10249,10256,10258,10267,10275,10363,10373,10376,10379,10380,10383,10387,10391,11979,12016,12046,12057,14303,14306,14308,14312,14317,14323,14324,14325,14330,14337,14458,14465,14684,14688,14863,14865,14868,14935,14936,14966,14973,14976,14977,15189,15192,15194,15239,15266,15278,15282,15288,15325,15430,15433,15434,15436,15437,15660,15664,15665,15667,15670,15672,15674,15676,15677,15679,15683,15931,15943,15986,15987,18343,18679,24576,24577,24578,24580,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25032,25033,25034,25035,25036,25037,25038,25039,25040,25041,25042,25043,25046,25047,25048,25049,25050,25051,25052,25053,25054,25055,25056,25057,25060,25061,25062,25063,25064,25065,25066,25067,25068,25069,25070,25071,25074,25075,25076,25077,25078,25079,25080,25081,25082,25083,25084,25085,25088,25089,25090,25091,25092,25093,25094,25095,25096,25097,25098,25099,25102,25103,25104,25105,25106,25107,25108,25109,25110,25111,25112,25113,25116,25117,25118,25119,25120,25121,25122,25123,25124,25125,25126,25127,25130,25131,25132,25133,25134,25135,25136,25137,25138,25139,25140,25141,25144,25146,25147,25148,25149,25150,25151,25152,25153,25154,25155,25158,25160,25161,25162,25163,25164,25165,25166,25167,25168,25169,25172,25174,25175,25176,25177,25178,25179,25180,25181,25182,25183,25186,25187,25188,25189,25190,25191,25192,25193,25194,25195,25196,25197,25200,25201,25202,25203,25204,25205,25206,25207,25208,25209,25210,25211,25214,25215,25216,25218,25219,25220,25221,25222,25223,25224,25225,25228,25229,25230,25231,25232,25233,25234,25235,25236,25237,25238,25239,25242,25243,25244,25245,25246,25247,25248,25249,25250,25251,25252,25253,25256,25257,25258,25259,25260,25261,25262,25263,25264,25265,25266,25267,25270,25271,25272,25273,25274,25275,25276,25277,25278,25279,25280,25281,25284,25286,25287,25288,25289,25290,25291,25292,25293,25294,25295,25298,25299,25300,25301,25302,25303,25304,25305,25306,25307,25308,25309,25312,25313,25314,25315,25316,25317,25318,25319,25320,25321,25322,25323,25326,25327,25328,25329,25330,25331,25332,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25543,25544,25545,25556,25557,25558,25559,25560,25561,25562,25563,25564,25565,25566,25567,25568,25569,25570,25574,25575,25576,25577,25578,25579,25583,25584,25585,25589,25591,25592,25593,25594,25595,25603,25605,25606,25607,25608,25609,25622,25623,25624,25628,25629,25630,25631,25632,25633,25634,25636,25637,25639,25640,25759,25760,25761,25762,25763,25764,25772,25773,25774,25775,25776,25777,25778,25779,25780,25819,25820,25821,25822,27637,27638,27639,27643,27644,27645,27646,27647,27648,27649,27650,27652,27653,27654,28030,28031,28032,28533,28534,28535,28536,28537,28538,28539,28540,28541,28542,28543,28544,29115,29116,29117,29119,29121,29122,29135,29136,29137,29138,29139,29140,29141,29142,29145,29146,29147,29148,29211,29312,29313,29314,29315,29456,29457,30568,30570,30597,30599,30765,30771,30775,30777,30781,30784,31143,31145,31147,31149,31150,31151,31152,31153,31173,31175,31178,31180,31186,31187,31188,31189,31190,31191,31192,31193,31194,31195,31196,31197,31198,31199,31200,31202,31204,31222,31226,31230,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,34985,34986,34987,34988,34989,34990,34991,34992,34993,34994,34995,34996,34997,34998,34999,35000,35001,35002,35003,35004,35005,35006,35007,35008,35009,35010,35011,35012,35013,35014,35015,35016,35017,35018,35022,35023,35024,35025,35026,35027,35028,35029,35030,35031,35032,35033,35034,35035,35036,35037,35038,35042,35043,35044,35045,35046,35047,35048,35049,35050,35051,35052,35053,35054,35055,35056,35057,35058,35059,35060,35061,35062,35063,35064,35065,35066,35067,35068,35069,35070,35071,35072,35073,35074,35075,35076,35077,35078,35079,35080,35081,35082,35083,35084,35085,35086,35087,35088,35089,35090,35091,35092,35093,35094,35095,35096,35097,35098,35099,35100,35101,35102,35103,35107,35108,35109,35110,35111,35112,35113,35114,35115,36737},
})

table.insert(Journal.djDungeons, {
    name   = "Terokkar Forest",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-TerokkarForest.blp",
    category   = "TBC",
    bosses = {
        {
            bossID = 18689,
            name   = "Crippler",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18686,
            name   = "Doomsayer Jurim",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18685,
            name   = "Okrek",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {19302,19303,19426,19491,24575,24576,24577,24578,24580,24582,24583,24584,24585,24586,24587,24588,24589,24590,24591,24592,24593,24594,24595,24596,24597,24598,24599,24600,24601,24602,24603,24604,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24693,24694,24695,24696,24697,24698,24699,24700,24701,24702,24703,24704,24705,24706,24707,24708,24709,24710,24711,24712,24713,24714,24715,24716,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24806,24807,24808,24809,24810,24811,24812,24813,24814,24815,24816,24817,24818,24819,24820,24821,24822,24823,24824,24825,24826,24827,24828,24829,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24918,24919,24920,24921,24922,24923,24924,24925,24926,24927,24928,24929,24930,24931,24932,24933,24934,24935,24936,24937,24938,24939,24940,24941,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25030,25031,25032,25033,25034,25035,25036,25037,25038,25039,25040,25041,25042,25043,25044,25045,25046,25047,25048,25049,25050,25051,25052,25053,25054,25055,25056,25057,25058,25059,25060,25061,25062,25063,25064,25065,25066,25067,25068,25069,25070,25071,25072,25073,25074,25075,25076,25077,25078,25079,25080,25081,25082,25083,25084,25085,25086,25087,25088,25089,25090,25091,25092,25093,25094,25095,25096,25097,25098,25099,25100,25101,25102,25103,25104,25105,25106,25107,25108,25109,25110,25111,25112,25113,25114,25115,25116,25117,25118,25119,25120,25121,25122,25123,25124,25125,25126,25127,25128,25129,25130,25131,25132,25133,25134,25135,25136,25137,25138,25139,25140,25141,25142,25143,25144,25146,25147,25148,25149,25150,25151,25152,25153,25154,25155,25156,25157,25158,25160,25161,25162,25163,25164,25165,25166,25167,25168,25169,25170,25171,25172,25174,25175,25176,25177,25178,25179,25180,25181,25182,25183,25184,25185,25186,25187,25188,25189,25190,25191,25192,25193,25194,25195,25196,25197,25198,25199,25200,25201,25202,25203,25204,25205,25206,25207,25208,25209,25210,25211,25212,25213,25214,25215,25216,25217,25218,25219,25220,25221,25222,25223,25224,25225,25226,25227,25228,25229,25230,25231,25232,25233,25234,25235,25236,25237,25238,25239,25240,25241,25242,25243,25244,25245,25246,25247,25248,25249,25250,25251,25252,25253,25254,25255,25256,25257,25258,25259,25260,25261,25262,25263,25264,25265,25266,25267,25268,25269,25270,25271,25272,25273,25274,25275,25276,25277,25278,25279,25280,25281,25282,25283,25284,25286,25287,25288,25289,25290,25291,25292,25293,25294,25295,25296,25297,25298,25299,25300,25301,25302,25303,25304,25305,25306,25307,25308,25309,25310,25311,25312,25313,25314,25315,25316,25317,25318,25319,25320,25321,25322,25323,25324,25325,25326,25327,25328,25329,25330,25331,25332,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25542,25916,25917,25918,25929,25930,25931,25932,25933,25934,25935,25936,25937,25948,25949,25951,25958,25959,25960,25961,25963,25965,25966,25971,25972,25973,25974,25975,25976,25977,28026,28027,28028,28531,28532,28533,28534,28535,28536,28537,28538,28539,28540,28541,28542,28543,28544,28553,28555,28559,28560,28561,28574,28575,28576,28577,28758,28759,28760,28761,29329,29330,29332,29333,29334,29335,29336,29337,29339,29340,29341,29342,29343,29344,29345,30787,30789,31125,31126,31127,31131,31133,31134,31136,31137,31138,31139,31140,31142,31143,31145,31147,31148,31149,31150,31151,31152,31153,31173,31175,31178,31180,31186,31187,31190,31193,31196,31200,31202,31204,31222,31226,31227,31228,31229,31230,31231,31234,31237,31238,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,31555,31556,31558,31563,31564,31566,31571,31572,31574,31579,31580,31582,31615,31617,31723,31725,31728,31729,31731,31732,31733,31734,31756,31758,31759,31761,31762,31764,31765,31766,31782,31783,31784,31785,31794,31796,31797,31798,31816,31817,31818,31819,31820,31821,31823,32514,32529,32531,32532,32533,32534,32535,32536,32537,32538,32539,32540,32541,32770,32771,32829,32830,32831,32832},
})

table.insert(Journal.djDungeons, {
    name   = "Shadowmoon Valley",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ShadowmoonValley.blp",
    category   = "TBC",
    bosses = {
        {
            bossID = 17407,
            name   = "Felmist",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18695,
            name   = "Ambassador Jerrikar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18694,
            name   = "Collidus the Warp-Watcher",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18696,
            name   = "Kraator",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3835,3836,3842,3844,3848,3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,5540,6040,6214,6350,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8080,8081,8082,8083,8084,8085,8086,8245,8292,8295,8301,8302,8304,8307,8308,8312,8320,8752,8753,8754,8755,10097,10112,10119,10124,10125,10145,10147,10168,10170,10204,10210,10211,10219,10221,10223,10225,10230,10235,10246,10251,10258,10259,10277,10281,10363,10371,10376,10377,10380,10381,12015,12035,12259,12405,12406,12408,12409,12410,12414,12773,12775,13036,13047,13091,13101,13118,15218,15219,15238,15255,15256,15257,15264,15276,15278,15281,15324,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25035,25036,25037,25038,25039,25040,25041,25042,25043,25049,25050,25051,25052,25053,25054,25055,25056,25057,25063,25064,25065,25066,25067,25068,25069,25070,25071,25077,25078,25079,25080,25081,25082,25083,25084,25085,25091,25092,25093,25094,25095,25096,25097,25098,25099,25105,25106,25107,25108,25109,25110,25111,25112,25113,25119,25120,25121,25122,25123,25124,25125,25126,25127,25133,25134,25135,25136,25137,25138,25139,25140,25141,25147,25148,25149,25150,25151,25152,25153,25154,25155,25161,25162,25163,25164,25165,25166,25167,25168,25169,25175,25176,25177,25178,25179,25180,25181,25182,25183,25189,25190,25191,25192,25193,25194,25195,25196,25197,25203,25204,25205,25206,25207,25208,25209,25210,25211,25218,25219,25220,25221,25222,25223,25224,25225,25231,25232,25233,25234,25235,25236,25237,25238,25239,25245,25246,25247,25248,25249,25250,25251,25252,25253,25259,25260,25261,25262,25263,25264,25265,25266,25267,25273,25274,25275,25276,25277,25278,25279,25280,25281,25287,25288,25289,25290,25291,25292,25293,25294,25295,25301,25302,25303,25304,25305,25306,25307,25308,25309,25315,25316,25317,25318,25319,25320,25321,25322,25323,25329,25330,25331,25332,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,28536,28537,28538,28539,28540,28541,28542,28543,28544,29201,29202,29203,29204,30722,30723,30724,30725,30726,30727,30728,30729,30730,30731,30753,30755,30765,30771,30775,30777,30781,30784,30922,30923,30924,30925,30926,30927,30928,30929,30930,30931,30932,30933,30936,30937,30938,30939,30940,30941,30942,30943,30944,30945,30946,30947,30948,30950,30951,30952,30953,30955,30956,30957,30958,30959,30960,30961,30962,30964,30966,30967,30968,30971,30973,30981,30984,30986,30999,31000,31002,31009,31010,31013,31036,31038,31062,31071,31072,31073,31074,31104,31105,31106,31107,31109,31110,31111,31112,31114,31115,31190,31213,31214,31215,31216,31217,31218,31219,31220,31221,31223,31224,31225,31232,31233,31234,31235,31236,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,31380,31381,31382,31383,31417,31490,31491,31492,31493,31494,32649,32864,32865,32866,32867,32868,32869,32870,32871,32872},
})

table.insert(Journal.djDungeons, {
    name   = "Blade's Edge Mountains",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BladesEdgeMountain.blp",
    category   = "TBC",
    bosses = {
        {
            bossID = 18692,
            name   = "Hemathion",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18690,
            name   = "Morcrush",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18693,
            name   = "Speaker Mar'grom",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {2300,2303,2308,2309,2310,2314,2315,2316,3719,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,5739,5961,5962,5964,5966,7281,7282,7285,7348,7374,7377,7378,7387,8175,8176,8185,8189,8191,8193,8197,8198,10135,10143,10151,10157,10158,10246,10252,10254,10262,10264,10266,10271,10273,10367,10384,10389,11980,12017,12048,12058,14328,14332,14336,14456,14464,14680,14811,14812,14975,14979,14982,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15221,15240,15247,15258,15283,15289,15439,15442,15680,15684,15687,15941,15942,15968,15989,24576,24577,24578,24580,24605,24606,24607,24608,24609,24610,24611,24612,24613,24614,24615,24616,24617,24618,24619,24620,24621,24622,24623,24624,24625,24626,24627,24628,24629,24630,24631,24632,24633,24634,24635,24636,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24717,24718,24719,24720,24721,24722,24723,24724,24725,24726,24727,24728,24729,24730,24731,24732,24733,24734,24735,24736,24737,24738,24739,24740,24741,24742,24743,24744,24745,24746,24747,24748,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24782,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24830,24831,24832,24833,24834,24835,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,24848,24849,24850,24851,24852,24853,24854,24855,24856,24857,24858,24859,24860,24861,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24942,24943,24944,24945,24946,24947,24948,24949,24950,24951,24952,24953,24954,24955,24956,24957,24958,24959,24960,24961,24962,24963,24964,24965,24966,24967,24968,24969,24970,24971,24972,24973,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25033,25034,25035,25036,25037,25038,25039,25040,25041,25042,25043,25047,25048,25049,25050,25051,25052,25053,25054,25055,25056,25057,25061,25062,25063,25064,25065,25066,25067,25068,25069,25070,25071,25075,25076,25077,25078,25079,25080,25081,25082,25083,25084,25085,25089,25090,25091,25092,25093,25094,25095,25096,25097,25098,25099,25103,25104,25105,25106,25107,25108,25109,25110,25111,25112,25113,25117,25118,25119,25120,25121,25122,25123,25124,25125,25126,25127,25131,25132,25133,25134,25135,25136,25137,25138,25139,25140,25141,25146,25147,25148,25149,25150,25151,25152,25153,25154,25155,25160,25161,25162,25163,25164,25165,25166,25167,25168,25169,25174,25175,25176,25177,25178,25179,25180,25181,25182,25183,25187,25188,25189,25190,25191,25192,25193,25194,25195,25196,25197,25201,25202,25203,25204,25205,25206,25207,25208,25209,25210,25211,25215,25216,25217,25218,25219,25220,25221,25222,25223,25224,25225,25229,25230,25231,25232,25233,25234,25235,25236,25237,25238,25239,25243,25244,25245,25246,25247,25248,25249,25250,25251,25252,25253,25257,25258,25259,25260,25261,25262,25263,25264,25265,25266,25267,25271,25272,25273,25274,25275,25276,25277,25278,25279,25280,25281,25286,25287,25288,25289,25290,25291,25292,25293,25294,25295,25299,25300,25301,25302,25303,25304,25305,25306,25307,25308,25309,25313,25314,25315,25316,25317,25318,25319,25320,25321,25322,25323,25327,25328,25329,25330,25331,25332,25333,25334,25335,25336,25337,25338,25339,25340,25341,25342,25343,25344,25345,25346,25347,25348,25349,25350,25351,25352,25353,25354,25355,25356,25357,25358,25359,25360,25361,25362,25363,25364,25365,25366,25367,25368,25369,25370,25371,25372,25373,25374,25375,25376,25377,25378,25379,25380,25381,25382,25383,25384,25385,25386,25387,25388,25389,25390,25391,25392,25393,25394,25395,25396,25654,25655,25656,25657,25659,25660,25661,25662,25668,25669,25670,25671,25673,25674,25675,25676,28534,28535,28536,28537,28538,28539,28540,28541,28542,28543,28544,30753,30755,31143,31145,31147,31149,31150,31151,31152,31153,31155,31156,31157,31158,31159,31160,31161,31162,31163,31164,31165,31166,31173,31175,31178,31180,31186,31187,31190,31193,31196,31200,31202,31204,31222,31226,31230,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31341,31342,31343,31414,31415,31416,31418,31419,31420,31421,31422,31423,31424,31425,31426,31427,31428,31429,31430,31431,31432,31433,31434,31435,31436,31438,31439,31440,31441,31442,31443,31444,31445,31446,31447,31448,31452,31453,31454,31455,31456,31457,31458,31459,31470,31471,31472,31473,31474,31475,31476,31477,31478,31479,31480,31481,31482,31483,31484,31485,31486,31487,31488,31508,31509,31510,31511,31512,31513,31514,31515,31516,31519,31520,31521,31523,31526,31527,31528,31531,31532,31533,31534,31537,31538,31539,31540,31541,31542,31543,31544,31545,31546,31547,31548,31549,31553,31561,31569,31577,31683,31684,31685,31686,31687,31688,31689,31690,31691,31692,31693,31694,31695,31696,31711,31712,31713,31714,31790,31791,31792,31793,32522,32645,32647,32648,32650,32651,32652,32653,33661,33662,33664,33665,33666,33667,33672,33673,33675,33677,33678,33680,33681,33683,33685,33686,33689,33691,33692,33694,33695,33696,33697,33698,33701,33702,33704,33705,33706,33708,33709,33711,33713,33714,33718,33719,33721,33722,33723,33724,33725,33728,33730,33731,33734,33735,33736,33738,33740,33741,33745,33746,33748,33749,33750,33751,33752,33755,33756,33758,33760,33761,33764,33765,33768,33769,33771,33801,34014,34015,34016,34033,34059,34066,34985,34986,34987,34988,34989,34991,34995,34996,34997,34998,35003,35008,35011,35014,35015,35016,35017,35018,35022,35027,35028,35029,35030,35031,35032,35037,35038,35047,35058,35059,35060,35061,35062,35063,35064,35065,35071,35072,35073,35074,35075,35076,35082,35088,35089,35090,35091,35092,35093,35094,35095,35101,35102,35103,35107,35108,35109,35111},
})

table.insert(Journal.djDungeons, {
    name   = "Netherstorm",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Netherstorm.blp",
    category   = "TBC",
    bosses = {
        {
            bossID = 18697,
            name   = "Chief Engineer Lorthander",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 18698,
            name   = "Ever-Core the Punisher",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 20932,
            name   = "Nuramoc",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {3944,3945,3946,3947,3948,3949,3950,3951,3969,3970,3971,3972,3973,3974,3975,3976,3987,3990,3992,3993,3994,3995,3996,3997,3998,3999,4368,4385,8080,8081,8082,8083,8084,8085,8086,8752,8753,8754,8755,10212,10500,10502,10503,10504,10508,15276,15995,15999,16008,20818,20820,20821,20823,20826,20827,20828,20832,20907,20909,20955,20960,20961,20964,21748,21755,21764,21765,21767,21768,21775,21779,21790,21791,21932,21933,21934,23742,24074,24075,24076,24077,24078,24637,24638,24639,24640,24641,24642,24643,24644,24645,24646,24647,24648,24649,24650,24651,24652,24653,24654,24655,24656,24657,24658,24659,24660,24661,24662,24663,24664,24665,24666,24667,24668,24669,24670,24671,24672,24673,24674,24675,24676,24677,24678,24679,24680,24681,24682,24683,24684,24685,24686,24687,24688,24689,24690,24691,24692,24749,24750,24751,24752,24753,24754,24755,24756,24757,24758,24759,24760,24761,24762,24763,24764,24765,24766,24767,24768,24769,24770,24771,24772,24773,24774,24775,24776,24777,24778,24779,24780,24781,24783,24784,24785,24786,24787,24788,24789,24790,24791,24792,24793,24794,24795,24796,24797,24798,24799,24800,24801,24802,24803,24804,24805,24862,24863,24864,24865,24866,24867,24868,24869,24870,24871,24872,24873,24874,24875,24876,24877,24878,24879,24880,24881,24882,24883,24884,24885,24886,24887,24888,24889,24890,24891,24892,24893,24894,24895,24896,24897,24898,24899,24900,24901,24902,24903,24904,24905,24906,24907,24908,24909,24910,24911,24912,24913,24914,24915,24916,24917,24974,24975,24976,24977,24978,24979,24980,24981,24982,24983,24984,24985,24986,24987,24988,24989,24990,24991,24992,24993,24994,24995,24996,24997,24998,24999,25000,25001,25002,25003,25004,25005,25006,25007,25008,25009,25010,25011,25012,25013,25014,25015,25016,25017,25018,25019,25020,25021,25022,25023,25024,25025,25026,25027,25028,25029,25037,25038,25039,25040,25041,25042,25043,25051,25052,25053,25054,25055,25056,25057,25065,25066,25067,25068,25069,25070,25071,25079,25080,25081,25082,25083,25084,25085,25093,25094,25095,25096,25097,25098,25099,25107,25108,25109,25110,25111,25112,25113,25121,25122,25123,25124,25125,25126,25127,25135,25136,25137,25138,25139,25140,25141,25149,25150,25151,25152,25153,25154,25155,25163,25164,25165,25166,25167,25168,25169,25177,25178,25179,25180,25181,25182,25183,25191,25192,25193,25194,25195,25196,25197,25205,25206,25207,25208,25209,25210,25211,25219,25220,25221,25222,25223,25224,25225,25233,25234,25235,25236,25237,25238,25239,25247,25248,25249,25250,25251,25252,25253,25261,25262,25263,25264,25265,25266,25267,25275,25276,25277,25278,25279,25280,25281,25289,25290,25291,25292,25293,25294,25295,25303,25304,25305,25306,25307,25308,25309,25317,25318,25319,25320,25321,25322,25323,25331,25332,25333,25334,25335,25336,25337,25341,25342,25343,25344,25345,25346,25347,25348,25357,25358,25359,25360,25361,25362,25363,25364,25373,25374,25375,25376,25377,25378,25379,25380,25389,25390,25391,25392,25393,25394,25395,25396,25438,25439,28538,28539,28540,28541,28542,28543,28544,29115,29116,29117,29119,29121,29122,29157,29158,29159,29160,29371,29372,29377,29378,29380,29391,29456,29457,29780,29781,29782,29783,29784,29785,29786,29787,29788,29789,29791,29792,29793,29794,29804,29806,29807,29808,29810,29811,29812,29813,29814,29815,29954,29955,29959,29967,29968,29969,29978,29979,29980,29999,30000,30001,30002,30003,30004,30005,30006,30014,30016,30019,30218,30224,30225,30226,30227,30252,30253,30254,30255,30256,30257,30258,30262,30263,30264,30265,30266,30267,30268,30269,30270,30271,30272,30273,30274,30275,30276,30277,30278,30279,30284,30285,30286,30290,30291,30293,30294,30295,30296,30297,30298,30299,30300,30328,30329,30330,30331,30332,30333,30334,30338,30339,30340,30341,30342,30352,30362,30363,30364,30365,30366,30377,30378,30379,30380,30381,30382,30383,30384,30386,30394,30395,30396,30397,30398,30399,30400,30401,30402,30419,30420,30421,30422,30514,30515,30516,30517,30519,30520,30521,30522,30523,30753,30755,30804,30847,31190,31201,31203,31209,31210,31211,31212,31234,31237,31240,31255,31258,31272,31275,31276,31277,31280,31281,31282,31283,31284,31285,31286,31287,31288,31289,31290,31291,31292,31293,31294,31295,31297,31298,31299,31303,31304,31305,31306,31308,31312,31313,31314,31315,31319,31320,31321,31322,31326,31328,31329,31330,31333,31334,31335,31336,31338,31339,31340,31342,31343,31557,31565,31573,31581,31699,31700,31701,31703,31925,31926,31927,31928,31929,31935,31936,31937,31938,31939,31940,31943,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32508,32520,32756,32772,32774,32776,40784,40785,40786,40787,40788,40789,40790,40791,40792,40804,40805,40806,40807,40808,40809,40810,40811,40812,40823,40824,40825,40826,40827,40828,40829,40830,40831,40844,40845,40846,40847,40848,40849,40850,40851,40852,40862,40863,40864,40866,40868,40869,40870,40871,40872,40905,40907,40910,40926,40927,40928,40932,40933,40934,40938,40939,40940,40962,40963,40964,40990,40991,40992,40993,40994,40995,41000,41001,41002,41006,41007,41008,41012,41013,41014,41018,41019,41020,41026,41027,41028,41032,41033,41034,41037,41038,41039,41043,41044,41045,41080,41081,41082,41086,41087,41088,41136,41137,41138,41142,41143,41144,41150,41151,41152,41156,41157,41158,41198,41199,41200,41204,41205,41206,41210,41211,41212,41216,41217,41218,41274,41275,41276,41280,41281,41282,41286,41287,41288,41292,41293,41294,41297,41298,41299,41303,41304,41305,41309,41310,41311,41315,41316,41317,41320,41321,41322,41326,41327,41328,41649,41650,41651,41654,41655,41656,41660,41661,41662,41666,41667,41668,41671,41672,41673,41677,41678,41679,41682,41683,41684,41714,41715,41716,41766,41767,41768,41772,41773,41774,41853,41854,41855,41858,41859,41860,41863,41864,41865,41868,41869,41870,41873,41874,41875,41914,41915,41916,41920,41921,41922,41926,41927,41928,41933,41934,41935,41939,41940,41941,41945,41946,41947,41951,41953,41954,41958,41959,41960,41964,41965,41966,41970,41971,41972,41992,41993,41994,41997,41998,41999,42004,42005,42006,42010,42011,42012,42016,42017,42018,42208,42209,42210,42227,42228,42229,42232,42233,42234,42237,42242,42243,42244,42248,42249,42250,42255,42256,42257,42260,42261,42262,42265,42266,42267,42270,42271,42272,42275,42276,42277,42280,42281,42282,42285,42286,42287,42290,42291,42292,42317,42318,42319,42322,42323,42324,42327,42328,42329,42332,42333,42334,42346,42347,42348,42352,42353,42354,42362,42364,42366,42384,42385,42386,42390,42450,42451,42483,42485,42486,42487,42490,42491,42492,42495,42496,42498,42502,42503,42504,42513,42514,42515,42519,42520,42521,42526,42527,42532,42533,42538,42539,42559,42560,42561,42564,42565,42566,42570,42571,42572,44419,44420,44421,44422,44423,44424,45627,45631,45937,45938,45939,45948,45949,45950,45951,45953,45954,45955,45956,45957,45958,45959,45960,45961,45962,45963,45964,45965,45966,45967,45968,45969,45970,45971,48402,48404,48406,48408,48410,48412,48414,48420,48422,48424,48426,48428,48432,49185,49187,49189,51388,51389,51390,51391,51392,51393,51394,51395,51396,51397,51398,51399,51400,51401,51402,51403,51404,51405,51406,51407,51408,51409,51410,51411,51412,51413,51414,51415,51416,51418,51419,51420,51421,51422,51424,51425,51426,51427,51428,51430,51431,51432,51433,51434,51435,51436,51438,51439,51440,51441,51442,51443,51444,51445,51446,51447,51448,51449,51450,51451,51452,51453,51454,51455,51456,51457,51458,51459,51460,51461,51462,51463,51464,51465,51466,51467,51468,51469,51470,51471,51473,51474,51475,51476,51477,51479,51480,51481,51482,51483,51484,51485,51486,51487,51488,51489,51490,51491,51492,51493,51494,51495,51496,51497,51498,51499,51500,51502,51503,51504,51505,51506,51508,51509,51510,51511,51512,51514,51515,51516,51517,51518,51519,51520,51521,51522,51523,51524,51525,51526,51527,51528,51529,51530,51531,51532,51533,51535,51536,51537,51538,51539,51540,51541,51542,51543,51544,51545},
})

-- ############# WOTLK
table.insert(Journal.djDungeons, {
    name   = "Borean Tundra",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-BorenTundrea.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 32358,
            name   = "Fumblub Gearwind",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32361,
            name   = "Icehorn",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32357,
            name   = "Old Crystalbark",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {2300,2303,2308,2309,2310,2314,2315,2316,2423,2424,2425,2426,2427,2428,2451,2568,2569,2578,2580,2582,2583,2584,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3719,3835,3836,3842,3844,3848,3894,4237,4239,4242,4243,4246,4247,4249,4251,4253,4257,4259,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,5540,5542,5739,5766,5961,5962,5964,5966,6040,6214,6238,6241,6350,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7281,7282,7285,7348,7374,7377,7378,7387,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,8088,8089,8090,8091,8092,8093,8094,8175,8176,8185,8189,8191,8193,8197,8198,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15084,15085,15086,15087,15088,15090,15091,15092,15093,15094,15095,15096,15995,15999,16008,17190,20818,20820,20821,20823,20826,20827,20828,20832,20907,20909,20955,20960,20961,20964,21748,21755,21764,21765,21767,21768,21775,21779,21790,21791,21849,21850,21851,21852,21853,21932,21933,21934,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,23742,24074,24075,24076,24077,24078,25438,25439,25654,25655,25656,25657,25659,25660,25661,25662,25668,25669,25670,25671,25673,25674,25675,25676,29157,29158,29159,29160,29201,29202,29203,29204,30419,30420,30421,30422,30804,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32508,32756,32772,32774,32776,33358,33359,33360,33361,33362,33363,33364,33372,33373,33374,33375,33376,33377,33378,33390,33391,33392,33393,33394,33395,33396,33404,33405,33406,33407,33408,33409,33410,33437,33438,33439,33440,35955,35956,35957,35958,35959,35960,35961,35962,35963,35964,35965,35966,35967,35968,35969,35970,35971,35972,35973,35974,35975,35976,35977,35978,35979,35980,35981,35982,35983,35984,35985,35986,35987,35988,35989,35990,35991,35992,35993,35994,35995,35996,35997,35998,35999,36000,36001,36002,36067,36068,36069,36070,36071,36072,36073,36074,36075,36076,36077,36078,36079,36080,36081,36082,36083,36084,36085,36086,36087,36088,36089,36090,36091,36092,36093,36094,36095,36096,36097,36098,36099,36100,36101,36102,36103,36104,36105,36106,36107,36108,36109,36110,36111,36112,36113,36114,36179,36180,36181,36182,36183,36184,36185,36186,36187,36188,36189,36190,36191,36192,36193,36194,36195,36196,36197,36198,36199,36200,36201,36202,36203,36204,36205,36206,36207,36208,36209,36210,36211,36212,36213,36214,36215,36216,36217,36218,36219,36220,36221,36222,36223,36224,36225,36226,36291,36292,36293,36294,36295,36296,36297,36298,36299,36300,36301,36302,36303,36304,36305,36306,36307,36308,36309,36310,36311,36312,36313,36314,36315,36316,36317,36318,36319,36320,36321,36322,36323,36324,36325,36326,36327,36328,36329,36330,36331,36332,36333,36334,36335,36336,36337,36338,36403,36404,36405,36406,36407,36408,36417,36418,36419,36420,36421,36422,36431,36432,36433,36434,36435,36436,36445,36446,36447,36448,36449,36450,36459,36460,36461,36462,36463,36464,36473,36474,36475,36476,36478,36487,36488,36489,36490,36492,36501,36502,36503,36504,36506,36515,36516,36517,36518,36520,36529,36530,36531,36532,36534,36543,36544,36545,36546,36548,36557,36558,36559,36560,36562,36571,36572,36573,36574,36576,36585,36586,36587,36588,36590,36599,36600,36601,36602,36604,36613,36614,36615,36616,36618,36627,36628,36629,36630,36632,36641,36642,36643,36644,36646,36655,36656,36657,36658,36660,36669,36670,36671,36672,36674,36683,36684,36685,36686,36688,36697,36698,36699,36700,36702,36711,36712,36713,36714,36716,36878,36879,36880,36881,36882,36883,36884,36885,36886,36887,36888,36937,36938,36939,36998,37002,37004,37005,37007,37008,37009,37014,37015,37016,37017,37018,37019,37021,37022,37023,37024,37025,37026,37028,37029,37030,37031,37032,37033,37034,37036,37039,37041,37042,37044,37046,37047,37049,37054,37072,37073,37074,37075,37076,37077,37078,37080,37122,37203,37204,37205,37206,37207,37208,37209,37211,37212,37213,37214,37215,37223,37224,37226,37227,37228,37231,37234,37239,37270,37271,37272,37274,37275,37276,37277,37282,37283,37319,37320,37325,37351,37352,37353,37354,37355,37356,37357,37375,37378,37380,37382,37383,37387,37388,37391,37392,37393,37394,37396,37399,37402,37403,37404,37405,37406,37414,37415,37417,37418,37419,37421,37422,37423,37424,37425,37426,37427,37428,37429,37434,37435,37436,37437,37439,37440,37441,37442,37443,37446,37447,37458,37461,37462,37463,37471,37475,37476,37478,37479,37480,37481,37482,37483,37484,37486,37487,37505,37506,37507,37508,37509,37512,37513,37514,37515,37516,37517,37518,37519,37520,37521,37522,37523,37524,37525,37526,37527,37528,37529,37530,37535,37537,37541,37543,37545,37546,37547,37548,37555,37556,37557,37558,37559,37560,37564,37566,37743,37744,37745,37746,37747,37748,37749,37751,37752,37753,37754,37755,37762,37763,37764,37772,37773,37774,37775,37782,37783,37785,37795,37796,37802,37803,37811,37817,37819,37820,38208,38212,38213,38214,38221,38222,38223,38226,38227,38228,38230,38231,38232,38237,38238,38239,38240,38241,38242,38250,38251,38252,38322,38400,38401,38402,38403,38404,38405,38406,38407,38408,38409,38410,38411,38412,38413,38414,38415,38416,38417,38418,38419,38420,38421,38422,38424,38433,38434,38435,38436,38437,38438,38439,38440,38441,38452,38453,38454,38455,38456,38457,38458,38459,38460,38461,38462,38463,38464,38465,38590,38591,38592,39083,39084,39085,39086,39087,39088,39688,40668,40669,40670,40671,40672,40673,40674,40675,40767,40865,40942,40943,40949,40950,40951,40952,40953,40954,40955,41112,41113,41114,41116,41117,41121,41126,41127,41128,41129,41168,41181,41182,41183,41184,41185,41238,41239,41240,41241,41242,41243,41245,41257,41344,41345,41346,41347,41348,41349,41350,41351,41352,41353,41354,41355,41356,41357,41383,41384,41386,41387,41388,41391,41392,41394,41512,41513,41515,41516,41519,41520,41521,41522,41523,41525,41528,41543,41544,41545,41546,41548,41549,41550,41551,41553,41554,41555,41607,41608,41974,41975,41984,41985,41986,42084,42088,42092,42093,42094,42095,42096,42097,42098,42099,42100,42101,42102,42103,42111,42113,42336,42337,42338,42339,42340,42341,42395,42413,42418,42435,42443,42508,42549,42550,42551,42552,42553,42554,42555,42723,42724,42725,42726,42727,42728,42729,42730,42731,42758,42760,42761,42762,42763,42765,42766,42767,42768,43129,43130,43131,43132,43133,43181,43182,43183,43184,43244,43245,43246,43247,43248,43249,43255,43256,43257,43258,43515,43565,43566,43583,43584,43585,43586,43587,43588,43654,43655,43656,43657,43660,43661,43663,43664,43666,43667,43860,43864,43865,43870,43871,43969,43970,43971,43972,43973,43974,43975,44063,44210,44211,44322,44323,44324,44334,44335,44336,44337,44354,44355,44356,44357,44436,44437,44438,44440,44441,44442,44443,44444,44445,44504,44649,44666,44667,44703,44740,44741,44742,44949,45085,45626,45627,45631,45808,45809,45810,45811,45812,45813,45849},
})

table.insert(Journal.djDungeons, {
    name   = "Sholazar Basin",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-ShozlarBazin.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 32481,
            name   = "Aotona",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32485,
            name   = "King Krush",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32517,
            name   = "Loque'nahak",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {33358,33359,33360,33361,33362,33363,33364,33365,33366,33367,33368,33369,33370,33371,33372,33373,33374,33375,33376,33377,33378,33379,33380,33381,33382,33383,33384,33385,33390,33391,33392,33393,33394,33395,33396,33397,33398,33399,33400,33401,33402,33403,33404,33405,33406,33407,33408,33409,33410,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,33437,33438,33439,33440,35995,35996,35997,35998,35999,36000,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36107,36108,36109,36110,36111,36112,36113,36114,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36219,36220,36221,36222,36223,36224,36225,36226,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36331,36332,36333,36334,36335,36336,36337,36338,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36408,36409,36410,36411,36412,36413,36414,36415,36422,36423,36424,36425,36426,36427,36428,36429,36436,36437,36438,36439,36440,36441,36442,36443,36450,36451,36452,36453,36455,36456,36457,36464,36465,36466,36467,36468,36469,36470,36471,36478,36479,36480,36481,36482,36483,36484,36485,36492,36493,36494,36495,36496,36497,36498,36499,36506,36507,36508,36509,36510,36511,36512,36513,36520,36521,36522,36523,36524,36525,36526,36527,36534,36535,36536,36537,36538,36539,36540,36541,36548,36549,36550,36551,36552,36553,36554,36555,36562,36563,36564,36565,36566,36567,36568,36569,36576,36577,36578,36579,36580,36581,36582,36583,36590,36591,36592,36593,36594,36595,36596,36597,36604,36605,36606,36607,36608,36609,36610,36611,36618,36619,36620,36621,36622,36623,36624,36625,36632,36633,36634,36635,36636,36637,36638,36639,36646,36647,36648,36649,36650,36651,36652,36653,36660,36661,36662,36663,36664,36665,36666,36667,36674,36675,36676,36677,36678,36679,36680,36681,36688,36689,36690,36691,36692,36693,36694,36695,36702,36703,36704,36705,36706,36707,36708,36709,36716,36717,36718,36719,36720,36721,36722,36723,37756,37757,37758,37759,37761,37765,37766,37767,37768,37769,37771,37776,37777,37778,37779,37781,37786,37787,37789,37790,37792,37794,37797,37804,37805,37806,37807,37808,37809,37810,37812,37813,37821,37823,37824,39323,39330,39331,39332,39333,39335,39336,39337,39346,39348,39363,39365,39367,39368,39373,39374,39375,39376,39377,39378,39380,39383,39385,39387,39402,39406,39412,39413,39428,39429,39430,39431,39432,39433,39435,39436,39438,39439,39441,39444,39445,39446,39448,39449,39450,39451,39452,39453,39454,39455,39459,39461,39463,39464,39466,39474,39478,39479,39480,39481,39482,39486,39487,39488,39490,39503,39508,39672,39673,39674,39675,40290,40291,40292,40293,40295,40353,41608,44073,44074,44104,44106,44108,44109,44110,44111,44112,44116,44117,44118,44120,44121,44122,44123,44683,44687,44688,44691},
})

table.insert(Journal.djDungeons, {
    name   = "Icecrown",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Icecrown.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 32501,
            name   = "High Thane Jorfus",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32495,
            name   = "Hildana Deathstealer",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32487,
            name   = "Putridus the Ancient",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    zoneId = 67,
    items = {33358,33359,33360,33361,33362,33363,33364,33365,33366,33367,33368,33369,33370,33371,33372,33373,33374,33375,33376,33377,33378,33379,33380,33381,33382,33383,33384,33385,33390,33391,33392,33393,33394,33395,33396,33397,33398,33399,33400,33401,33402,33403,33404,33405,33406,33407,33408,33409,33410,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,33437,33438,33439,33440,35995,35996,35997,35998,35999,36000,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36107,36108,36109,36110,36111,36112,36113,36114,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36219,36220,36221,36222,36223,36224,36225,36226,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36331,36332,36333,36334,36335,36336,36337,36338,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36408,36409,36410,36411,36412,36413,36414,36415,36422,36423,36424,36425,36426,36427,36428,36429,36436,36437,36438,36439,36440,36441,36442,36443,36450,36451,36452,36453,36455,36456,36457,36464,36465,36466,36467,36468,36469,36470,36471,36478,36479,36480,36481,36482,36483,36484,36485,36492,36493,36494,36495,36496,36497,36498,36499,36506,36507,36508,36509,36510,36511,36512,36513,36520,36521,36522,36523,36524,36525,36526,36527,36534,36535,36536,36537,36538,36539,36540,36541,36548,36549,36550,36551,36552,36553,36554,36555,36562,36563,36564,36565,36566,36567,36568,36569,36576,36577,36578,36579,36580,36581,36582,36583,36590,36591,36592,36593,36594,36595,36596,36597,36604,36605,36606,36607,36608,36609,36610,36611,36618,36619,36620,36621,36622,36623,36624,36625,36632,36633,36634,36635,36636,36637,36638,36639,36646,36647,36648,36649,36650,36651,36652,36653,36660,36661,36662,36663,36664,36665,36666,36667,36674,36675,36676,36677,36678,36679,36680,36681,36688,36689,36690,36691,36692,36693,36694,36695,36702,36703,36704,36705,36706,36707,36708,36709,36716,36717,36718,36719,36720,36721,36722,36723,37756,37757,37758,37759,37761,37765,37766,37767,37768,37769,37771,37776,37777,37778,37779,37781,37786,37787,37789,37790,37792,37794,37797,37804,37805,37806,37807,37808,37809,37810,37812,37813,37821,37823,37824,39323,39330,39331,39332,39333,39335,39336,39337,39346,39348,39363,39365,39367,39368,39373,39374,39375,39376,39377,39378,39380,39383,39385,39387,39402,39406,39412,39413,39428,39429,39430,39431,39432,39433,39435,39436,39438,39439,39441,39444,39445,39446,39448,39449,39450,39451,39452,39453,39454,39455,39459,39461,39463,39464,39466,39474,39478,39479,39480,39481,39482,39486,39487,39488,39490,39503,39508,39672,39673,39674,39675,40290,40291,40292,40293,40295,40353,41608,44073,44074,44104,44106,44108,44109,44110,44111,44112,44116,44117,44118,44120,44121,44122,44123,44683,44687,44688,44691},
})

table.insert(Journal.djDungeons, {
    name   = "The Storm Peaks",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-StormPeaks.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 32500,
            name   = "Dirkee",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 35189,
            name   = "Skoll",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32475,
            name   = "Terror Spinner",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32491,
            name   = "Time-Lost Proto Drake",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32630,
            name   = "Vyragosa",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3835,3836,3842,3844,3848,5540,6040,6214,6350,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,12259,12405,12406,12408,12409,12410,12414,12773,12775,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,29201,29202,29203,29204,33365,33366,33367,33368,33369,33370,33371,33379,33380,33381,33382,33383,33384,33385,33397,33398,33399,33400,33401,33402,33403,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36409,36410,36411,36412,36413,36414,36415,36423,36424,36425,36426,36427,36428,36429,36437,36438,36439,36440,36441,36442,36443,36451,36452,36453,36455,36456,36457,36465,36466,36467,36468,36469,36470,36471,36479,36480,36481,36482,36483,36484,36485,36493,36494,36495,36496,36497,36498,36499,36507,36508,36509,36510,36511,36512,36513,36521,36522,36523,36524,36525,36526,36527,36535,36536,36537,36538,36539,36540,36541,36549,36550,36551,36552,36553,36554,36555,36563,36564,36565,36566,36567,36568,36569,36577,36578,36579,36580,36581,36582,36583,36591,36592,36593,36594,36595,36596,36597,36605,36606,36607,36608,36609,36610,36611,36619,36620,36621,36622,36623,36624,36625,36633,36634,36635,36636,36637,36638,36639,36647,36648,36649,36650,36651,36652,36653,36661,36662,36663,36664,36665,36666,36667,36675,36676,36677,36678,36679,36680,36681,36689,36690,36691,36692,36693,36694,36695,36703,36704,36705,36706,36707,36708,36709,36717,36718,36719,36720,36721,36722,36723,37757,37758,37759,37760,37761,37766,37767,37768,37769,37770,37771,37777,37778,37779,37780,37781,37787,37789,37790,37792,37793,37794,37797,37804,37805,37806,37808,37809,37810,37812,37813,37822,37823,37824,37835,39083,39084,39085,39086,39087,39088,40668,40669,40670,40671,40672,40673,40674,40675,40942,40943,40949,40950,40951,40952,40953,40954,40955,41113,41114,41116,41117,41126,41127,41128,41129,41181,41182,41183,41184,41185,41239,41240,41241,41242,41243,41245,41257,41344,41345,41346,41347,41348,41349,41350,41351,41352,41353,41354,41355,41356,41357,41383,41384,41386,41387,41388,41391,41392,41394,41608,41754,41974,41975,42435,42443,42508,42723,42724,42725,42726,42727,42728,42729,42730,42785,42786,42787,42788,42789,42790,42791,42792,42793,42794,42795,42796,42798,42799,42800,42801,42802,42803,42804,42805,42806,42807,42808,42809,42810,42811,42812,42813,42814,42815,42816,42817,42818,42819,42820,42821,42822,42823,42824,42825,42826,42827,42828,42829,42830,42831,42832,42833,42834,42835,42836,42841,42842,42843,42844,42845,42846,42847,42848,42849,42850,42857,42858,42859,42860,42861,42862,42863,42864,42865,42866,42867,42868,42869,42870,42871,42872,42874,42876,42877,42878,42879,42880,42881,42882,42883,42884,42887,42888,42889,42890,42891,42892,42893,42895,42896,43185,43186,43187,43188,43189,43190,43191,43192,43193,43194,43195,43197,43198,43200,43201,43202,43203,43204,43207,43208,43209,43210,43211,43212,43213,43573,43586,43587,43588,43860,43864,43865,43870,43871,44189,44190,44192,44193,44194,44195,44308,44681,44682,44708,44732,45085,49227},
})

table.insert(Journal.djDungeons, {
    name   = "Zul'Drak",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Zuldrak.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 33776,
            name   = "Gondria",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32471,
            name   = "Griegen",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32475,
            name   = "Terror Spinner",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32447,
            name   = "Zul'drak Sentinel",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {33358,33359,33360,33361,33362,33363,33364,33365,33366,33367,33368,33369,33370,33371,33372,33373,33374,33375,33376,33377,33378,33379,33380,33381,33382,33383,33384,33385,33390,33391,33392,33393,33394,33395,33396,33397,33398,33399,33400,33401,33402,33403,33404,33405,33406,33407,33408,33409,33410,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,33437,33438,33439,33440,35979,35980,35981,35982,35983,35984,35985,35986,35987,35988,35989,35990,35991,35992,35993,35994,35995,35996,35997,35998,35999,36000,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36027,36028,36029,36030,36031,36032,36033,36034,36035,36036,36037,36038,36039,36040,36041,36042,36091,36092,36093,36094,36095,36096,36097,36098,36099,36100,36101,36102,36103,36104,36105,36106,36107,36108,36109,36110,36111,36112,36113,36114,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36139,36140,36141,36142,36143,36144,36145,36146,36147,36148,36149,36150,36151,36152,36153,36154,36203,36204,36205,36206,36207,36208,36209,36210,36211,36212,36213,36214,36215,36216,36217,36218,36219,36220,36221,36222,36223,36224,36225,36226,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36251,36252,36253,36254,36255,36256,36257,36258,36259,36260,36261,36262,36263,36264,36265,36266,36315,36316,36317,36318,36319,36320,36321,36322,36323,36324,36325,36326,36327,36328,36329,36330,36331,36332,36333,36334,36335,36336,36337,36338,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36363,36364,36365,36366,36367,36368,36369,36370,36371,36372,36373,36374,36375,36376,36377,36378,36406,36407,36408,36409,36410,36411,36412,36413,36420,36421,36422,36423,36424,36425,36426,36427,36434,36435,36436,36437,36438,36439,36440,36441,36448,36449,36450,36451,36452,36453,36455,36462,36463,36464,36465,36466,36467,36468,36469,36476,36478,36479,36480,36481,36482,36483,36490,36492,36493,36494,36495,36496,36497,36504,36506,36507,36508,36509,36510,36511,36518,36520,36521,36522,36523,36524,36525,36532,36534,36535,36536,36537,36538,36539,36546,36548,36549,36550,36551,36552,36553,36560,36562,36563,36564,36565,36566,36567,36574,36576,36577,36578,36579,36580,36581,36588,36590,36591,36592,36593,36594,36595,36602,36604,36605,36606,36607,36608,36609,36616,36618,36619,36620,36621,36622,36623,36630,36632,36633,36634,36635,36636,36637,36644,36646,36647,36648,36649,36650,36651,36658,36660,36661,36662,36663,36664,36665,36672,36674,36675,36676,36677,36678,36679,36686,36688,36689,36690,36691,36692,36693,36700,36702,36703,36704,36705,36706,36707,36714,36716,36717,36718,36719,36720,36721,37755,37756,37757,37758,37759,37760,37761,37765,37766,37767,37768,37769,37771,37775,37776,37777,37778,37779,37781,37785,37786,37787,37789,37790,37792,37794,37797,37802,37804,37805,37806,37807,37808,37809,37810,37811,37812,37813,37817,37821,37823,39652,39653,39655,39770,39771,39772,39773,39775,39776,39777,39778,39779,39780,39781,39782,39783,39784,39785,39786,39787,39788,39789,39790,39791,39792,39793,39794,39795,39796,39797,39798,39799,39800,39801,39802,39803,39804,39805,39806,39807,39808,39809,39810,39811,39812,39815,39816,39817,39818,39820,39821,39822,39823,39824,39825,39826,39827,39829,39830,39831,39833,39834,39835,39836,39837,39838,39839,39840,39841,39842,39843,39844,39845,39846,39847,39848,39849,39850,39851,39852,39853,39854,39855,39856,39857,39858,39859,39860,39861,39862,39863,39864,39865,39866,39867,39868,39869,39870,39871,39872,39873,39874,39875,39876,39877,39880,39882,39886,39890,39891,39893,41608,41760,41761,41762,41763,41815,41816,41821,41822,41824,41825,41826,41829,41844,41845,41846,41890,41891,41905,41932,41987,43160,43161,43162,43163,43164,43165,43167,43168,43171,43172,43173,43174,43176,43177,43178,43179,43180,44677,44685,44686,44734,44735,44736,46324},
})

table.insert(Journal.djDungeons, {
    name   = "Grizzly Hills",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-GrizzlyHills.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 38453,
            name   = "Arcturis",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32422,
            name   = "Grocklar",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32429,
            name   = "Seething Hate",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32438,
            name   = "Syreian the Bonecarver",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {2435,2437,2438,2440,2470,2471,2472,2473,2474,2475,3587,3588,3892,3893,33358,33359,33360,33361,33362,33363,33364,33372,33373,33374,33375,33376,33377,33378,33390,33391,33392,33393,33394,33395,33396,33404,33405,33406,33407,33408,33409,33410,33437,33438,33439,33440,35955,35956,35957,35958,35959,35960,35961,35962,35963,35964,35965,35966,35967,35968,35969,35970,35971,35972,35973,35974,35975,35976,35977,35978,35979,35980,35981,35982,35983,35984,35985,35986,35987,35988,35989,35990,35991,35992,35993,35994,35995,35996,35997,35998,35999,36000,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36019,36020,36021,36022,36023,36024,36025,36026,36067,36068,36069,36070,36071,36072,36073,36074,36075,36076,36077,36078,36079,36080,36081,36082,36083,36084,36085,36086,36087,36088,36089,36090,36091,36092,36093,36094,36095,36096,36097,36098,36099,36100,36101,36102,36103,36104,36105,36106,36107,36108,36109,36110,36111,36112,36113,36114,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36131,36132,36133,36134,36135,36136,36137,36138,36179,36180,36181,36182,36183,36184,36185,36186,36187,36188,36189,36190,36191,36192,36193,36194,36195,36196,36197,36198,36199,36200,36201,36202,36203,36204,36205,36206,36207,36208,36209,36210,36211,36212,36213,36214,36215,36216,36217,36218,36219,36220,36221,36222,36223,36224,36225,36226,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36243,36244,36245,36246,36247,36248,36249,36250,36291,36292,36293,36294,36295,36296,36297,36298,36299,36300,36301,36302,36303,36304,36305,36306,36307,36308,36309,36310,36311,36312,36313,36314,36315,36316,36317,36318,36319,36320,36321,36322,36323,36324,36325,36326,36327,36328,36329,36330,36331,36332,36333,36334,36335,36336,36337,36338,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36355,36356,36357,36358,36359,36360,36361,36362,36403,36404,36405,36406,36407,36408,36409,36410,36411,36417,36418,36419,36420,36421,36422,36423,36424,36425,36431,36432,36433,36434,36435,36436,36437,36438,36439,36445,36446,36447,36448,36449,36450,36451,36452,36453,36459,36460,36461,36462,36463,36464,36465,36466,36467,36473,36474,36475,36476,36478,36479,36480,36481,36487,36488,36489,36490,36492,36493,36494,36495,36501,36502,36503,36504,36506,36507,36508,36509,36515,36516,36517,36518,36520,36521,36522,36523,36529,36530,36531,36532,36534,36535,36536,36537,36543,36544,36545,36546,36548,36549,36550,36551,36557,36558,36559,36560,36562,36563,36564,36565,36571,36572,36573,36574,36576,36577,36578,36579,36585,36586,36587,36588,36590,36591,36592,36593,36599,36600,36601,36602,36604,36605,36606,36607,36613,36614,36615,36616,36618,36619,36620,36621,36627,36628,36629,36630,36632,36633,36634,36635,36641,36642,36643,36644,36646,36647,36648,36649,36655,36656,36657,36658,36660,36661,36662,36663,36669,36670,36671,36672,36674,36675,36676,36677,36683,36684,36685,36686,36688,36689,36690,36691,36697,36698,36699,36700,36702,36703,36704,36705,36711,36712,36713,36714,36716,36717,36718,36719,37753,37754,37755,37756,37757,37758,37763,37764,37765,37766,37767,37773,37774,37775,37776,37777,37778,37783,37785,37786,37787,37789,37795,37796,37802,37803,37804,37805,37807,37810,37811,37812,37813,37817,37819,37820,37821,38353,38354,38355,38356,38357,38358,38359,38710,38711,38712,38713,38714,38715,38716,38717,38718,38719,38726,38727,38728,38729,38730,38732,38733,38734,38735,38743,38744,38745,38746,38747,38748,38749,38750,38751,38752,38753,38754,38755,38756,38757,38758,38759,38760,38761,38762,39010,39011,39013,39015,39016,39017,39018,39019,39020,39021,39022,39023,39025,39026,39027,39028,39029,39030,39031,39033,39034,39043,39044,39045,39046,39047,39048,39049,39050,39051,39052,39053,39054,39055,39056,39057,39058,39059,39060,39062,39064,39075,39076,39077,39078,39079,39080,39081,39082,39089,39090,39091,39092,39093,39094,39095,39096,39097,39098,39099,39105,39109,39110,39112,39113,39114,39116,39117,39118,39119,39120,39124,39125,39127,39128,39129,39131,39132,39142,39168,39169,39170,39171,39172,39173,39174,39175,39176,39177,39178,39179,39180,39181,39182,39183,39648,39649,39650,40755,40756,40757,40758,41608,44674,44675,44676,44703,51958},
})

table.insert(Journal.djDungeons, {
    name   = "Howling Fjord",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-HowlingFjord.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 32398,
            name   = "King Ping",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32377,
            name   = "Perobas the Bloodthirster",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32386,
            name   = "Vigdis the War Maiden",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    items = {2568,2569,2578,2580,2582,2583,2584,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3835,3836,3842,3844,3848,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,5540,5542,5766,6040,6214,6238,6241,6350,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15995,15999,16008,20818,20820,20821,20823,20826,20827,20828,20832,20907,20909,20918,20955,20960,20961,20964,20986,21748,21755,21764,21765,21767,21768,21775,21779,21790,21791,21849,21850,21851,21852,21853,21932,21933,21934,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,23742,24074,24075,24076,24077,24078,25438,25439,29157,29158,29159,29160,29201,29202,29203,29204,30419,30420,30421,30422,30765,30771,30775,30777,30781,30784,30804,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32508,32756,32772,32774,32776,33358,33359,33360,33361,33362,33363,33364,33365,33366,33367,33368,33369,33370,33371,33372,33373,33374,33375,33376,33377,33378,33379,33380,33381,33382,33383,33384,33385,33390,33391,33392,33393,33394,33395,33396,33397,33398,33399,33400,33401,33402,33403,33404,33405,33406,33407,33408,33409,33410,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,33437,33438,33439,33440,35807,35808,35809,35810,35811,35812,35814,35815,35816,35817,35818,35820,35821,35822,35823,35824,35826,35827,35829,35830,35832,35833,35834,35835,35839,35841,35842,35843,35844,35845,35846,35848,35849,35851,35852,35856,35857,35858,35859,35860,35861,35862,35863,35864,35865,35866,35867,35868,35869,35870,35871,35872,35873,35875,35877,35878,35879,35880,35881,35882,35883,35884,35885,35886,35887,35888,35889,35890,35891,35892,35893,35894,35895,35896,35897,35898,35899,35900,35901,35902,35903,35911,35912,35913,35914,35915,35916,35917,35918,35919,35920,35921,35922,35923,35924,35925,35926,35927,35928,35929,35930,35931,35932,35933,35934,35935,35936,35937,35938,35955,35956,35957,35958,35959,35960,35961,35962,35963,35964,35965,35966,35967,35968,35969,35970,35971,35972,35973,35974,35975,35976,35977,35978,35979,35980,35981,35982,35983,35984,35985,35986,35987,35988,35989,35990,35991,35992,35993,35994,35995,35996,35997,35998,35999,36000,36001,36002,36035,36036,36037,36038,36039,36040,36041,36042,36051,36052,36053,36054,36055,36056,36057,36058,36067,36068,36069,36070,36071,36072,36073,36074,36075,36076,36077,36078,36079,36080,36081,36082,36083,36084,36085,36086,36087,36088,36089,36090,36091,36092,36093,36094,36095,36096,36097,36098,36099,36100,36101,36102,36103,36104,36105,36106,36107,36108,36109,36110,36111,36112,36113,36114,36147,36148,36149,36150,36151,36152,36153,36154,36163,36164,36165,36166,36167,36168,36169,36170,36179,36180,36181,36182,36183,36184,36185,36186,36187,36188,36189,36190,36191,36192,36193,36194,36195,36196,36197,36198,36199,36200,36201,36202,36203,36204,36205,36206,36207,36208,36209,36210,36211,36212,36213,36214,36215,36216,36217,36218,36219,36220,36221,36222,36223,36224,36225,36226,36259,36260,36261,36262,36263,36264,36265,36266,36275,36276,36277,36278,36279,36280,36281,36282,36291,36292,36293,36294,36295,36296,36297,36298,36299,36300,36301,36302,36303,36304,36305,36306,36307,36308,36309,36310,36311,36312,36313,36314,36315,36316,36317,36318,36319,36320,36321,36322,36323,36324,36325,36326,36327,36328,36329,36330,36331,36332,36333,36334,36335,36336,36337,36338,36371,36372,36373,36374,36375,36376,36377,36378,36387,36388,36389,36390,36391,36392,36393,36394,36403,36404,36405,36406,36407,36408,36413,36415,36417,36418,36419,36420,36421,36422,36427,36429,36431,36432,36433,36434,36435,36436,36441,36443,36445,36446,36447,36448,36449,36450,36455,36457,36459,36460,36461,36462,36463,36464,36469,36471,36473,36474,36475,36476,36478,36483,36485,36487,36488,36489,36490,36492,36497,36499,36501,36502,36503,36504,36506,36511,36513,36515,36516,36517,36518,36520,36525,36527,36529,36530,36531,36532,36534,36539,36541,36543,36544,36545,36546,36548,36553,36555,36557,36558,36559,36560,36562,36567,36569,36571,36572,36573,36574,36576,36581,36583,36585,36586,36587,36588,36590,36595,36597,36599,36600,36601,36602,36604,36609,36611,36613,36614,36615,36616,36618,36623,36625,36627,36628,36629,36630,36632,36637,36639,36641,36642,36643,36644,36646,36651,36653,36655,36656,36657,36658,36660,36665,36667,36669,36670,36671,36672,36674,36679,36681,36683,36684,36685,36686,36688,36693,36695,36697,36698,36699,36700,36702,36707,36709,36711,36712,36713,36714,36716,36721,36723,36871,36872,36874,37283,37319,37546,37566,37743,37744,37745,37746,37747,37748,37749,37751,37752,37753,37754,37762,37763,37764,37772,37773,37774,37782,37783,37795,37796,37803,37819,37820,38218,38219,38220,38257,38258,38259,38322,38400,38401,38402,38403,38404,38405,38406,38407,38408,38409,38410,38411,38412,38413,38414,38415,38416,38417,38418,38419,38420,38421,38422,38424,38433,38434,38435,38436,38437,38438,38439,38440,38441,38452,38453,38454,38455,38456,38457,38458,38459,38460,38461,38462,38463,38464,38465,38590,38591,38592,39072,39073,39074,39083,39084,39085,39086,39087,39088,39676,39678,39679,39680,39688,40668,40669,40670,40671,40672,40673,40674,40675,40767,40865,40942,40943,40949,40950,40951,40952,40953,40954,40955,41112,41113,41114,41116,41117,41121,41126,41127,41128,41129,41168,41181,41182,41183,41184,41185,41238,41239,41240,41241,41242,41243,41245,41257,41344,41345,41346,41347,41348,41349,41350,41351,41352,41353,41354,41355,41356,41357,41383,41384,41386,41387,41388,41391,41392,41394,41512,41513,41515,41516,41519,41520,41521,41522,41523,41525,41528,41543,41544,41545,41546,41548,41549,41550,41551,41553,41554,41555,41607,41608,41974,41975,41984,41985,41986,42093,42095,42096,42100,42101,42102,42103,42111,42113,42336,42337,42338,42339,42340,42341,42395,42413,42418,42435,42443,42508,42549,42550,42551,42552,42553,42554,42555,42723,42724,42725,42726,42727,42728,42729,42730,42731,43129,43130,43131,43132,43133,43244,43245,43246,43247,43248,43249,43255,43256,43257,43258,43515,43565,43566,43583,43584,43585,43586,43587,43588,43654,43655,43656,43657,43660,43661,43663,43664,43666,43667,43860,43864,43865,43870,43871,43969,43970,43971,43972,43973,43974,43975,44051,44052,44053,44054,44055,44057,44058,44059,44060,44061,44062,44063,44210,44211,44322,44323,44324,44374,44375,44376,44377,44436,44437,44438,44440,44441,44442,44443,44444,44445,44504,44668,44669,44670,44703,44740,44741,44742,44949,45085,45626,45627,45631,45808,45809,45810,45811,45812,45813,45849},
})

table.insert(Journal.djDungeons, {
    name   = "Dragonblight",
    icon   = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Dragonblight.blp",
    category   = "WOTLK",
    bosses = {
        {
            bossID = 32409,
            name   = "Crazed Indu'le Survivor",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32417,
            name   = "Scarlet Highlord Daion",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
        {
            bossID = 32400,
            name   = "Tukemuth",
            rare   = true,
            flat   = itemdir,
            spells = {},
        },
    },
    zoneId = 65,
    items = {2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3835,3836,3842,3844,3848,5540,6040,6214,6350,7918,7919,7920,7922,7930,7931,7933,7941,7945,7956,7957,7958,7963,12259,12405,12406,12408,12409,12410,12414,12773,12775,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,29201,29202,29203,29204,31080,33358,33359,33360,33361,33362,33363,33364,33365,33366,33367,33368,33369,33370,33371,33372,33373,33374,33375,33376,33377,33378,33379,33380,33381,33382,33383,33384,33385,33390,33391,33392,33393,33394,33395,33396,33397,33398,33399,33400,33401,33402,33403,33404,33405,33406,33407,33408,33409,33410,33412,33413,33414,33415,33416,33417,33419,33433,33434,33435,33436,33437,33438,33439,33440,35955,35956,35957,35958,35959,35960,35961,35962,35963,35964,35965,35966,35967,35968,35969,35970,35971,35972,35973,35974,35975,35976,35977,35978,35979,35980,35981,35982,35983,35984,35985,35986,35987,35988,35989,35990,35991,35992,35993,35994,35995,35996,35997,35998,35999,36000,36001,36002,36003,36004,36005,36006,36007,36008,36009,36010,36011,36012,36013,36014,36015,36016,36017,36018,36035,36036,36037,36038,36039,36040,36041,36042,36043,36044,36045,36046,36047,36048,36049,36050,36051,36052,36053,36054,36055,36056,36057,36058,36067,36068,36069,36070,36071,36072,36073,36074,36075,36076,36077,36078,36079,36080,36081,36082,36083,36084,36085,36086,36087,36088,36089,36090,36091,36092,36093,36094,36095,36096,36097,36098,36099,36100,36101,36102,36103,36104,36105,36106,36107,36108,36109,36110,36111,36112,36113,36114,36115,36116,36117,36118,36119,36120,36121,36122,36123,36124,36125,36126,36127,36128,36129,36130,36147,36148,36149,36150,36151,36152,36153,36154,36155,36156,36157,36158,36159,36160,36161,36162,36163,36164,36165,36166,36167,36168,36169,36170,36179,36180,36181,36182,36183,36184,36185,36186,36187,36188,36189,36190,36191,36192,36193,36194,36195,36196,36197,36198,36199,36200,36201,36202,36203,36204,36205,36206,36207,36208,36209,36210,36211,36212,36213,36214,36215,36216,36217,36218,36219,36220,36221,36222,36223,36224,36225,36226,36227,36228,36229,36230,36231,36232,36233,36234,36235,36236,36237,36238,36239,36240,36241,36242,36259,36260,36261,36262,36263,36264,36265,36266,36267,36268,36269,36270,36271,36272,36273,36274,36275,36276,36277,36278,36279,36280,36281,36282,36291,36292,36293,36294,36295,36296,36297,36298,36299,36300,36301,36302,36303,36304,36305,36306,36307,36308,36309,36310,36311,36312,36313,36314,36315,36316,36317,36318,36319,36320,36321,36322,36323,36324,36325,36326,36327,36328,36329,36330,36331,36332,36333,36334,36335,36336,36337,36338,36339,36340,36341,36342,36343,36344,36345,36346,36347,36348,36349,36350,36351,36352,36353,36354,36371,36372,36373,36374,36375,36376,36377,36378,36379,36380,36381,36382,36383,36384,36385,36386,36387,36388,36389,36390,36391,36392,36393,36394,36403,36404,36405,36406,36407,36408,36409,36410,36413,36414,36415,36417,36418,36419,36420,36421,36422,36423,36424,36427,36428,36429,36431,36432,36433,36434,36435,36436,36437,36438,36441,36442,36443,36445,36446,36447,36448,36449,36450,36451,36452,36455,36456,36457,36459,36460,36461,36462,36463,36464,36465,36466,36469,36470,36471,36473,36474,36475,36476,36478,36479,36480,36483,36484,36485,36487,36488,36489,36490,36492,36493,36494,36497,36498,36499,36501,36502,36503,36504,36506,36507,36508,36511,36512,36513,36515,36516,36517,36518,36520,36521,36522,36525,36526,36527,36529,36530,36531,36532,36534,36535,36536,36539,36540,36541,36543,36544,36545,36546,36548,36549,36550,36553,36554,36555,36557,36558,36559,36560,36562,36563,36564,36567,36568,36569,36571,36572,36573,36574,36576,36577,36578,36581,36582,36583,36585,36586,36587,36588,36590,36591,36592,36595,36596,36597,36599,36600,36601,36602,36604,36605,36606,36609,36610,36611,36613,36614,36615,36616,36618,36619,36620,36623,36624,36625,36627,36628,36629,36630,36632,36633,36634,36637,36638,36639,36641,36642,36643,36644,36646,36647,36648,36651,36652,36653,36655,36656,36657,36658,36660,36661,36662,36665,36666,36667,36669,36670,36671,36672,36674,36675,36676,36679,36680,36681,36683,36684,36685,36686,36688,36689,36690,36693,36694,36695,36697,36698,36699,36700,36702,36703,36704,36707,36708,36709,36711,36712,36713,36714,36716,36717,36718,36721,36722,36723,37743,37744,37745,37746,37747,37748,37749,37751,37752,37753,37754,37755,37756,37757,37758,37762,37763,37764,37765,37766,37772,37773,37774,37775,37776,37777,37778,37782,37783,37785,37786,37787,37795,37796,37802,37803,37805,37807,37811,37813,37817,37819,37820,37821,37936,37937,37938,37939,37940,37941,37942,37943,37944,37945,37947,37948,37949,37950,37953,37954,37956,37957,37958,37959,37960,37961,37962,37963,37964,37965,37966,37968,37969,37970,37971,37980,37981,37982,37983,37984,37985,37986,37987,37988,37989,37990,37991,37992,37993,37995,37996,37998,37999,38000,38001,38002,38003,38004,38005,38006,38007,38008,38010,38011,38012,38013,38014,38023,38024,38025,38026,38027,38028,38029,38030,38031,38032,38033,38034,38035,38036,38037,38039,38040,38041,38042,38043,38044,38045,38046,38047,38048,38049,38051,38053,38054,38055,38056,38057,38068,38070,38071,38073,38080,38081,38084,38085,38086,38087,38088,38092,38093,38094,38095,38096,38097,38100,38101,38102,38103,38104,38105,38106,38107,38108,38109,38110,38111,38112,38114,38115,38116,38117,38118,38126,38127,38128,38129,38130,38131,38132,38133,38134,38135,38137,38138,38141,38142,38143,38146,38148,38150,38151,38152,38153,38154,38155,38156,38157,38169,38170,38171,38172,38173,38174,38176,38177,38178,38181,38187,38188,38189,38190,38191,38194,38195,38196,38197,38198,38202,38206,38207,38217,38224,38284,38293,38528,38529,38530,38531,38532,38533,38534,38535,38536,38537,38540,38541,38542,38543,38763,38764,38765,39083,39084,39085,39086,39087,39088,40668,40669,40670,40671,40672,40673,40674,40675,40942,40943,40949,40950,40951,40952,40953,40954,40955,41113,41114,41116,41117,41126,41127,41128,41129,41181,41182,41183,41184,41185,41239,41240,41241,41242,41243,41245,41257,41344,41345,41346,41347,41348,41349,41350,41351,41352,41353,41354,41355,41356,41357,41383,41384,41386,41387,41388,41391,41392,41394,41608,41974,41975,42435,42443,42508,42723,42724,42725,42726,42727,42728,42729,42730,43586,43587,43588,43860,43864,43865,43870,43871,44051,44052,44053,44054,44055,44057,44058,44059,44060,44061,44062,44187,44188,44196,44197,44198,44199,44200,44201,44202,44203,44204,44205,44350,44351,44352,44353,44358,44359,44360,44361,44362,44363,44364,44365,44657,44658,44659,44660,44661,44662,44664,44665,44671,44672,44673,44703,45085},
})

table.insert(Journal.djDungeons, {
    name = "Dalaran", 
    category   = "WOTLK",
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-Dalaran.blp", -- placeholder
    bosses = {
        {
            bossID = 36597,
            spells = {},
            name = "Lick King",
            flat = itemdir,
        }
    },
    items = {2568,2569,2578,2580,2582,2583,2584,2848,2849,2850,2851,2852,2854,2857,2865,2866,2868,2870,3469,3472,3473,3480,3482,3483,3487,3488,3489,3491,3835,3836,3842,3844,3848,4307,4308,4309,4310,4312,4314,4316,4318,4320,4324,4326,4343,4368,4385,5540,5542,5766,6040,6214,6238,6241,6350,7026,7046,7048,7050,7051,7052,7054,7055,7057,7058,7062,7064,7189,7918,7919,7920,7922,7930,7931,7933,7938,7939,7941,7945,7956,7957,7958,7963,8345,8346,8347,8348,8349,8367,9149,9998,9999,10001,10003,10019,10021,10024,10026,10027,10041,10042,10044,10046,10047,10500,10502,10503,10504,10508,10542,10543,10545,10588,10721,10724,10726,12259,12405,12406,12408,12409,12410,12414,12773,12775,13856,13857,13858,13860,13863,13864,13865,13866,13867,13869,13870,13871,14100,14101,14103,14106,14108,14111,14112,14128,14130,14132,14141,14142,14143,14144,15995,15999,16008,20295,20296,20818,20820,20821,20823,20826,20827,20828,20832,20907,20909,20955,20960,20961,20964,21748,21755,21764,21765,21767,21768,21775,21779,21790,21791,21849,21850,21851,21852,21853,21932,21933,21934,23482,23484,23487,23488,23489,23490,23491,23493,23494,23497,23498,23499,23563,23564,23565,23742,23825,23828,23829,23835,23836,23838,23839,24074,24075,24076,24077,24078,25438,25439,28425,28426,28427,28428,28429,28430,28431,28432,28433,28434,28435,28436,28438,28439,28440,28441,28442,28483,28484,28485,29157,29158,29159,29160,29201,29202,29203,29204,29515,29516,29517,29519,29520,29521,29522,29523,29524,29525,29526,29527,29964,29970,29971,29973,29974,29975,30069,30070,30071,30072,30073,30074,30076,30077,30086,30087,30088,30089,30093,30419,30420,30421,30422,30804,32461,32472,32473,32474,32475,32476,32478,32479,32480,32494,32495,32508,32756,32772,32774,32776,37889,37890,37891,38322,38400,38401,38402,38403,38404,38405,38406,38407,38408,38409,38410,38411,38412,38413,38414,38415,38416,38417,38418,38419,38420,38421,38422,38424,38433,38434,38435,38436,38437,38438,38439,38440,38441,38590,38591,38592,39083,39084,39085,39086,39087,39088,39491,39492,39493,39494,39495,39496,39497,39498,39499,39500,39514,39515,39517,39518,39519,39521,39523,39528,39529,39530,39531,39538,39539,39542,39543,39544,39545,39546,39547,39548,39553,39554,39555,39556,39557,39558,39560,39561,39564,39565,39578,39579,39580,39581,39582,39583,39588,39589,39590,39591,39592,39593,39594,39595,39596,39597,39601,39602,39603,39604,39605,39606,39607,39608,39609,39610,39611,39612,39613,39617,39618,39619,39620,39621,39622,39623,39624,39625,39626,39627,39628,39629,39630,39631,39632,39633,39634,39635,39636,39637,39638,39639,39640,39641,39642,39688,40415,40416,40417,40418,40419,40420,40421,40422,40423,40424,40445,40447,40448,40449,40450,40454,40456,40457,40458,40459,40460,40461,40462,40463,40465,40466,40467,40468,40469,40470,40471,40472,40473,40493,40494,40495,40496,40499,40500,40502,40503,40504,40505,40506,40507,40508,40509,40510,40512,40513,40514,40515,40516,40517,40518,40520,40521,40522,40523,40524,40525,40527,40528,40529,40530,40544,40545,40546,40547,40548,40550,40552,40554,40556,40557,40559,40563,40565,40567,40568,40569,40570,40571,40572,40573,40574,40575,40576,40577,40578,40579,40580,40581,40583,40584,40585,40586,40668,40669,40670,40671,40672,40673,40674,40675,40678,40679,40680,40681,40682,40683,40684,40685,40688,40689,40691,40692,40693,40694,40695,40696,40697,40698,40699,40700,40701,40702,40703,40704,40716,40717,40718,40719,40720,40721,40722,40723,40724,40733,40734,40735,40736,40737,40738,40739,40740,40741,40742,40743,40745,40746,40747,40748,40749,40750,40751,40767,40778,40779,40780,40781,40782,40783,40784,40785,40786,40787,40788,40789,40790,40791,40792,40797,40798,40799,40801,40802,40803,40804,40805,40806,40807,40808,40809,40810,40811,40812,40816,40817,40818,40819,40820,40821,40823,40824,40825,40826,40827,40828,40829,40830,40831,40836,40837,40838,40840,40841,40842,40844,40845,40846,40847,40848,40849,40850,40851,40852,40856,40857,40858,40859,40860,40861,40862,40863,40864,40865,40866,40868,40869,40870,40871,40872,40898,40904,40905,40907,40910,40918,40925,40926,40927,40928,40930,40931,40932,40933,40934,40936,40937,40938,40939,40940,40942,40943,40949,40950,40951,40952,40953,40954,40955,40960,40961,40962,40963,40964,40986,40987,40988,40989,40990,40991,40992,40993,40994,40995,40998,40999,41000,41001,41002,41004,41005,41006,41007,41008,41010,41011,41012,41013,41014,41016,41017,41018,41019,41020,41023,41024,41025,41026,41027,41028,41030,41031,41032,41033,41034,41036,41037,41038,41039,41041,41042,41043,41044,41045,41078,41079,41080,41081,41082,41084,41085,41086,41087,41088,41112,41113,41114,41116,41117,41121,41126,41127,41128,41129,41134,41135,41136,41137,41138,41140,41141,41142,41143,41144,41148,41149,41150,41151,41152,41154,41155,41156,41157,41158,41160,41162,41168,41181,41182,41183,41184,41185,41186,41187,41188,41189,41190,41198,41199,41200,41202,41203,41204,41205,41206,41208,41209,41210,41211,41212,41214,41215,41216,41217,41218,41238,41239,41240,41241,41242,41243,41245,41257,41268,41269,41270,41271,41272,41273,41274,41275,41276,41278,41279,41280,41281,41282,41284,41286,41287,41288,41290,41291,41292,41293,41294,41296,41297,41298,41299,41301,41302,41303,41304,41305,41308,41309,41310,41311,41313,41314,41315,41316,41317,41319,41320,41321,41322,41324,41325,41326,41327,41328,41344,41345,41346,41347,41348,41349,41350,41351,41352,41353,41354,41355,41356,41357,41383,41384,41386,41387,41388,41391,41392,41394,41512,41513,41515,41516,41519,41520,41521,41522,41523,41525,41528,41543,41544,41545,41546,41548,41549,41550,41551,41553,41554,41555,41607,41608,41643,41644,41645,41646,41647,41648,41649,41650,41651,41653,41654,41655,41656,41658,41659,41660,41661,41662,41664,41665,41666,41667,41668,41670,41671,41672,41673,41675,41676,41677,41678,41679,41681,41682,41683,41684,41712,41713,41714,41715,41716,41765,41766,41767,41768,41770,41771,41772,41773,41774,41847,41848,41849,41850,41851,41852,41853,41854,41855,41857,41858,41859,41860,41862,41863,41864,41865,41867,41868,41869,41870,41872,41873,41874,41875,41912,41913,41914,41915,41916,41918,41919,41920,41921,41922,41924,41925,41926,41927,41928,41930,41931,41933,41934,41935,41937,41938,41939,41940,41941,41943,41944,41945,41946,41947,41949,41950,41951,41953,41954,41956,41957,41958,41959,41960,41962,41963,41964,41965,41966,41968,41969,41970,41971,41972,41974,41975,41984,41985,41986,41990,41991,41992,41993,41994,41996,41997,41998,41999,42001,42002,42003,42004,42005,42006,42008,42009,42010,42011,42012,42014,42015,42016,42017,42018,42093,42095,42096,42100,42101,42102,42103,42111,42113,42208,42209,42210,42227,42228,42229,42232,42233,42234,42237,42242,42243,42244,42248,42249,42250,42255,42256,42257,42260,42261,42262,42265,42266,42267,42270,42271,42272,42275,42276,42277,42280,42281,42282,42285,42286,42287,42290,42291,42292,42317,42318,42319,42322,42323,42324,42327,42328,42329,42332,42333,42334,42336,42337,42338,42339,42340,42341,42346,42347,42348,42352,42353,42354,42362,42364,42366,42384,42385,42386,42390,42391,42392,42395,42413,42418,42435,42443,42450,42451,42483,42485,42486,42487,42490,42491,42492,42495,42496,42498,42502,42503,42504,42508,42513,42514,42515,42519,42520,42521,42526,42527,42532,42533,42538,42539,42549,42550,42551,42552,42553,42554,42555,42559,42560,42561,42564,42565,42566,42570,42571,42572,42723,42724,42725,42726,42727,42728,42729,42730,42731,42943,42944,42945,42946,42947,42948,42949,42950,42951,42952,42984,42985,42991,42992,43129,43130,43131,43132,43133,43244,43245,43246,43247,43248,43249,43255,43256,43257,43258,43515,43565,43566,43583,43584,43585,43586,43587,43588,43654,43655,43656,43657,43660,43661,43663,43664,43666,43667,43860,43864,43865,43870,43871,43969,43970,43971,43972,43973,43974,43975,44063,44166,44167,44170,44171,44173,44174,44176,44179,44180,44181,44182,44183,44210,44211,44322,44323,44324,44342,44343,44344,44345,44419,44420,44421,44422,44423,44424,44436,44437,44438,44440,44441,44442,44443,44444,44445,44504,44647,44648,44692,44740,44741,44742,44934,44935,44949,45085,45335,45336,45337,45338,45339,45340,45341,45342,45343,45344,45345,45346,45347,45348,45349,45351,45352,45353,45354,45355,45356,45357,45358,45359,45360,45361,45362,45363,45364,45365,45367,45368,45369,45370,45371,45372,45373,45374,45375,45376,45377,45379,45380,45381,45382,45383,45384,45385,45386,45387,45388,45389,45390,45391,45392,45393,45394,45395,45396,45397,45398,45399,45400,45401,45402,45403,45404,45405,45406,45408,45409,45410,45411,45412,45413,45414,45415,45416,45417,45419,45420,45421,45422,45424,45425,45426,45427,45428,45429,45430,45431,45432,45433,45626,45627,45631,45688,45689,45690,45691,45808,45809,45810,45811,45812,45813,45819,45820,45821,45822,45823,45824,45825,45826,45827,45828,45829,45830,45831,45833,45834,45835,45836,45837,45838,45839,45840,45841,45842,45843,45844,45845,45846,45847,45848,45849,45937,45938,45939,45948,45949,45950,45951,45952,45953,45954,45955,45956,45957,45958,45959,45960,45961,45962,45963,45964,45965,45966,45967,45968,45969,45970,45971,46111,46113,46115,46116,46117,46118,46119,46120,46121,46122,46123,46124,46125,46126,46127,46129,46130,46131,46132,46133,46134,46135,46136,46137,46139,46140,46141,46142,46143,46144,46145,46146,46148,46149,46150,46151,46152,46153,46154,46155,46156,46157,46158,46159,46160,46161,46162,46163,46164,46165,46166,46167,46168,46169,46170,46172,46173,46174,46175,46176,46177,46178,46179,46180,46181,46182,46183,46184,46185,46186,46187,46188,46189,46190,46191,46192,46193,46194,46195,46196,46197,46198,46199,46200,46201,46202,46203,46204,46205,46206,46207,46208,46209,46210,46211,46212,46313,47658,47659,47660,47674,47675,47677,47678,47681,47682,47684,47685,47686,47687,47688,47689,47690,47691,47692,47693,47694,47695,47696,47697,47698,47699,47701,47702,47704,47705,47706,47707,47708,47709,47710,47712,47713,47714,47715,47716,47729,47730,47731,47732,47733,47734,47735,47748,47749,47750,47751,47752,47773,47774,47775,47776,47777,47783,47784,47785,47786,47787,47798,47799,47800,47801,47802,47914,47936,47980,47981,47982,48067,48068,48069,48070,48071,48072,48073,48074,48075,48076,48097,48098,48099,48100,48101,48102,48129,48130,48131,48132,48153,48154,48155,48156,48157,48158,48159,48160,48161,48162,48183,48184,48185,48186,48187,48188,48189,48190,48191,48192,48213,48214,48215,48216,48217,48218,48219,48220,48221,48222,48243,48244,48245,48246,48247,48250,48251,48252,48253,48254,48275,48276,48277,48278,48279,48280,48281,48282,48283,48284,48295,48296,48297,48298,48299,48310,48312,48313,48314,48315,48336,48337,48338,48339,48340,48341,48342,48343,48344,48345,48366,48367,48368,48369,48370,48371,48372,48373,48374,48375,48386,48387,48388,48389,48390,48402,48404,48406,48408,48410,48412,48414,48420,48422,48424,48426,48428,48429,48432,48436,48445,48448,48449,48456,48457,48458,48459,48460,48472,48474,48476,48478,48480,48501,48502,48503,48504,48505,48529,48531,48533,48535,48537,48558,48559,48560,48561,48562,48564,48566,48568,48572,48574,48595,48596,48597,48598,48599,48602,48603,48604,48605,48606,48627,48628,48629,48630,48631,48632,48633,48634,48635,48636,48652,48653,48654,48655,48656,48677,48683,48685,48687,48689,48691,48716,48718,48722,48724,48954,48955,48956,48957,49185,49187,49189,50078,50079,50080,50081,50082,50087,50088,50089,50090,50094,50095,50096,50097,50098,50105,50106,50107,50108,50109,50113,50114,50115,50116,50117,50118,50240,50241,50242,50243,50244,50255,50275,50276,50277,50278,50279,50324,50325,50326,50327,50328,50355,50356,50357,50358,50391,50392,50393,50394,50396,50466,50467,50468,50469,50470,50474,50765,50766,50767,50768,50769,50819,50820,50821,50822,50823,50824,50825,50826,50827,50828,50830,50831,50832,50833,50834,50835,50836,50837,50838,50839,50841,50842,50843,50844,50845,50846,50847,50848,50849,50850,50853,50854,50855,50856,50857,50860,50861,50862,50863,50864,50865,50866,50867,50868,50869,50965,50968,50969,50970,50971,50972,50973,50974,50975,50976,50977,50978,50979,50980,50981,50982,50983,50984,50987,50989,50991,50992,50993,50994,50995,50996,50997,51125,51126,51127,51128,51129,51130,51131,51132,51133,51134,51135,51136,51137,51138,51139,51140,51141,51142,51143,51144,51145,51146,51147,51148,51149,51150,51151,51152,51153,51154,51155,51156,51157,51158,51159,51160,51161,51162,51163,51164,51165,51166,51167,51168,51169,51170,51171,51172,51173,51174,51175,51176,51177,51178,51179,51180,51181,51182,51183,51184,51185,51186,51187,51188,51189,51190,51191,51192,51193,51194,51195,51196,51197,51198,51199,51200,51201,51202,51203,51204,51205,51206,51207,51208,51209,51210,51211,51212,51213,51214,51215,51216,51217,51218,51219,51220,51221,51222,51223,51224,51225,51226,51227,51228,51229,51230,51231,51232,51233,51234,51235,51236,51237,51238,51239,51240,51241,51242,51243,51244,51245,51246,51247,51248,51249,51250,51251,51252,51253,51254,51255,51256,51257,51258,51259,51260,51261,51262,51263,51264,51265,51266,51267,51268,51269,51270,51271,51272,51273,51274,51275,51276,51277,51278,51279,51280,51281,51282,51283,51284,51285,51286,51287,51288,51289,51290,51291,51292,51293,51294,51295,51296,51297,51298,51299,51300,51301,51302,51303,51304,51305,51306,51307,51308,51309,51310,51311,51312,51313,51314,51388,51389,51390,51391,51392,51393,51394,51395,51396,51397,51398,51399,51400,51401,51402,51403,51404,51405,51406,51407,51408,51409,51410,51411,51412,51413,51414,51415,51416,51418,51419,51420,51421,51422,51424,51425,51426,51427,51428,51430,51431,51432,51433,51434,51435,51436,51438,51439,51440,51441,51442,51443,51444,51445,51446,51447,51448,51449,51450,51451,51452,51453,51454,51455,51456,51457,51458,51459,51460,51461,51462,51463,51464,51465,51466,51467,51468,51469,51470,51471,51473,51474,51475,51476,51477,51479,51480,51481,51482,51483,51484,51485,51486,51487,51488,51489,51490,51491,51492,51493,51494,51495,51496,51497,51498,51499,51500,51502,51503,51504,51505,51506,51508,51509,51510,51511,51512,51514,51515,51516,51517,51518,51519,51520,51521,51522,51523,51524,51525,51526,51527,51528,51529,51530,51531,51532,51533,51535,51536,51537,51538,51539,51540,51541,51542,51543,51544,51545,51557,51558,51559,51560},
})

--[[
table.insert(Journal.djDungeons, {
    name = "Elwynn Forest", 
    icon = "Interface\\Addons\\TheJournal\\Assets\\Buttons\\UI-EJ-DUNGEONBUTTON-SiegeofNizaoTemple.blp", -- placeholder
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

