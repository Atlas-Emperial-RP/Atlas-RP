--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------
This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
      Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomJobFields

Add your custom jobs under the following line:
---------------------------------------------------------------------------]]

TEAM_RECRUIT = DarkRP.createJob("Recruit", {
    color = Color(156, 143, 58),
    model = "models/nada/pms/male/ScienceOfficer.mdl",
    description = [[
        Recruit 
    ]],
    weapons = {
        "weapon_empty_hands",
        "arccw_dc17_training_v2",
        "arccw_dc15s_training_v2"
    },
    command = "recruit",
    max = 0,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Recruits",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
    end,
})
TEAM_STORMTROOPERSENL = DarkRP.createJob("Stormtrooper Enlisted", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dh17",
        "rw_sw_e11",
    },
    command = "stormenlisted",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_STORMTROOPERSSGT = DarkRP.createJob("Stormtrooper Sergeant", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dh17",
        "rw_sw_nade_thermal",
        "rw_sw_e11"
    },
    command = "stormsergeant",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_STORMTROOPERSFLAME = DarkRP.createJob("Flame Trooper", {
    color = Color(13, 0, 255),
    model = "models/nada/FlameTrooper.mdl",
    description = [[
        FlameTrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dh17",
        "rw_sw_e11",
        "rw_sw_nade_thermal",
        "flamethrower_basic",
        "rw_sw_nade_incendiary"
    },
    command = "flametrooper",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(325)
        ply:SetMaxHealth(325)
    end,
})
TEAM_STORMTROOPERSSCOUT = DarkRP.createJob("Scout Trooper", {
    color = Color(13, 0, 255),
    model = {
        "models/nada/ScoutTrooper_M.mdl",
        "models/nada/ScoutTrooper_F.mdl"
    },
    description = [[
        Scout Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11",
        "rw_sw_dlt19x",
        "rw_sw_scoutblaster",
        "realistic_hook",
        "rw_sw_nade_smoke"
    },
    command = "scouttroopers",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(225)
        ply:SetMaxHealth(225)
    end,
})
TEAM_STORMTROOPERSOFFICER = DarkRP.createJob("Stormtrooper Officer", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dh17",
        "rw_sw_nade_thermal",
        "rw_sw_huntershotgun",
        "rw_sw_nade_smoke",
        "rw_sw_t21"
    },
    command = "stormofficer",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})

TEAM_STORMTROOPERSCOMMAND = DarkRP.createJob("Stormtrooper Command", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dual_dh17a",
        "rw_sw_nade_thermal",
        "rw_sw_t21",
        "rw_sw_huntershotgun",
        "rw_sw_nade_smoke"
    },
    command = "stormcommand",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_STORMTROOPERSCOMMANDER = DarkRP.createJob("Stormtrooper Commander", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dual_dh17a",
        "rw_sw_t21",
        "rw_sw_nade_thermal",
        "rw_sw_huntershotgun",
        "rw_sw_nade_smoke",
        "rw_sw_t21b"
    },
    command = "stormcommander",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
TEAM_PURGEMEDIC = DarkRP.createJob("Purge Medic", {
    color = Color(140, 45, 13),
    model = "models/nada/PurgeTrooperElectroHammer.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "rw_sw_electrodagger",
        "weapon_bactainjector",
        "bandage",
        "admin_defib",
        "first_aid_kit",
        "analysis_notebook",
        "syringe_morphine"
    },
    command = "purgetroopermed",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_PURGEENL = DarkRP.createJob("Purge Enlisted", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "rw_sw_electrodagger"
    },
    command = "purgeenlisted",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})

TEAM_PURGESGT = DarkRP.createJob("Purge Sergeant", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "rw_sw_electrostaff",
        "rw_sw_electrodagger",
        "rw_sw_dual_dc17",
        "rw_sw_nade_thermal",
        "weapon_cuff_elastic"
    },
    command = "purgesergeant",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_PURGEOFFICER = DarkRP.createJob("Purge Officer", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "rw_sw_electrodagger",
        "rw_sw_dual_dc17",
        "rw_sw_nade_thermal",
        "rw_sw_electrostaff",
        "rw_sw_electrohammer",
        "weapon_cuff_elastic"
    },
    command = "purgeofficer",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_PURGECOMMAND = DarkRP.createJob("Purge Command", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "rw_sw_electrodagger",
        "rw_sw_dual_dc17",
        "rw_sw_nade_thermal",
        "rw_sw_electrostaff",
        "rw_sw_electrohammer",
        "flamethrower_basic",
        "rw_sw_z6",
        "weapon_cuff_elastic"
    },
    command = "purgecommand",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_PURGECOMMANDER = DarkRP.createJob("Purge Commander", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "rw_sw_electrodagger",
        "rw_sw_dual_dc17",
        "rw_sw_nade_thermal",
        "rw_sw_electrostaff",
        "rw_sw_electrohammer",
        "flamethrower_basic",
        "rw_sw_z6",
        "rw_sw_dc15x",
        "weapon_cuff_elastic"
    },
    command = "purgecommander",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
TEAM_SHOCKTROOPER = DarkRP.createJob("Shock Trooper", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_stun_e11",
        "rw_sw_se14r",
        "weapon_cuff_elastic"
    },
    command = "shocktrooper",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_SHOCKSGT = DarkRP.createJob("Shock Sergeant", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Sergeant
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_stun_e11",
        "rw_sw_se14r",
        "rw_sw_shield_imp_rk3",
        "weapon_cuff_elastic"
    },
    command = "shocksergeant",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHOCKOFFICER = DarkRP.createJob("Shock Officer", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_stun_e11",
        "rw_sw_se14r",
        "rw_sw_shield_imp_rk3",
        "rw_sw_nade_stun",
        "rw_sw_e11t",
        "weapon_cuff_elastic"
    },
    command = "shockofficer",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHOCKCOMMAND = DarkRP.createJob("Shock Command", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Command
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_stun_e11",
        "rw_sw_se14r",
        "rw_sw_shield_imp_rk3",
        "rw_sw_nade_stun",
        "rw_sw_e11t",
        "rw_sw_shield_imp",
        "rw_sw_nade_thermal",
        "weapon_cuff_elastic"
    },
    command = "shockcommand",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_SHOCKCOMMANDER = DarkRP.createJob("Shock Commander", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Commander
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_stun_e11",
        "rw_sw_se14r",
        "rw_sw_shield_imp_rk3",
        "rw_sw_nade_stun",
        "rw_sw_e11t",
        "rw_sw_shield_imp",
        "rw_sw_nade_thermal",
        "weapon_cuff_elastic"
    },
    command = "shockcommander",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
TEAM_MEDICALTROOPER = DarkRP.createJob("Medical Trooper", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_trooper.mdl",
    },
    description = [[
        Medical Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_defibrilator",
        "weapon_bactainjector",

        "arccw_e11",
    },
    command = "medtrooper",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Medical Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(225)
        ply:SetMaxHealth(225)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Medical Sergeant  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_MEDICALSGT = DarkRP.createJob("Medical Sergeant", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_sergeant.mdl",
    },
    description = [[
        Medical Sergeant
    ]],
    weapons = {
        "weapon_empty_hands",
        "arccw_bacta_grenade",
        "arccw_thermal_grenade",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_defibrilator",

        "arccw_e11",
        "weapon_squadshield_arm",
    },
    command = "medsergeant",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Medical Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Medical Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_MEDICALOFFICER = DarkRP.createJob("Medical Officer", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_lieutenant.mdl",
    },
    description = [[
        Medical Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "arccw_bacta_grenade",
        "arccw_thermal_grenade",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_defibrilator",

        "arccw_e11",
        "weapon_squadshield_arm",
        "arccw_rk3",
        "weapon_shield_activator",
    },
    command = "medofficer",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Medical Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Medical Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_MEDICALCOMMAND = DarkRP.createJob("Medical Command", {
    color = Color(80, 101, 211),
    model = {
      "models/player/bunny/zephyr_imperial_medics/zephyr_medic_officer.mdl",
    },

    description = [[
        Medical Command 
    ]],
    weapons = {
        "weapon_empty_hands",
        "arccw_bacta_grenade",
        "arccw_thermal_grenade",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_defibrilator",

        "arccw_e11",
        "weapon_squadshield_arm",
        "arccw_rk3",
        "weapon_shield_activator",
    },
    command = "medcommand",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Medical Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    Medical Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_MEDICALCOMMANDER = DarkRP.createJob("Medical Commander", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_commander.mdl",
    },
    description = [[
        Medical Commander 
    ]],
    weapons = {
        "weapon_empty_hands",
        "arccw_bacta_grenade",
        "arccw_thermal_grenade",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_defibrilator",

        "arccw_e11",
        "weapon_squadshield_arm",
        "arccw_rk3",
        "weapon_shield_activator",
        "arccw_t21",
    },
    command = "medcommander",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Medical Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    Fleet Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_FLEETENSIGN = DarkRP.createJob("Ensign/Lieutenant", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/naval_officer.mdl",
        "models/nada/pms/female/naval_officer.mdl"
    },
    description = [[
        Fleet Ensign-Lieutenant-Post
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d"
    },
    command = "fleetEL",
    max = 0,
    salary = 748,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Fleet",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
    end,
})
--[[
    Fleet Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_FLEETADMIRAL = DarkRP.createJob("Admiral/Fleet Admiral", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/grey_admiral.mdl",
        "models/nada/pms/female/grey_admiral.mdl"
    },
    description = [[
        Fleet Admiral-Fleet Admiral 
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d"
    },
    command = "fleetAF",
    max = 0,
    salary = 1000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Fleet",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(900)
        ply:SetMaxHealth(900)
    end,
})
--[[
    Fleet Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_FLEETGRAND = DarkRP.createJob("Grand Admiral", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/grandadmiral.mdl",
        "models/nada/pms/female/grandadmiral.mdl"
    },
    description = [[
        Grand Admiral
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d",
        "arccw_ll30"
    },
    command = "fleetGA",
    max = 2,
    salary = 2500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Fleet",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
    end,
})
--[[
    Fleet Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_FLEETCAPTAIN = DarkRP.createJob("Captain/Major", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/medic.mdl",
        "models/nada/pms/female/medic.mdl"
    },
    description = [[
        Fleet Captain-Major
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d"
    },
    command = "fleetCM",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Fleet",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(600)
        ply:SetMaxHealth(600)
    end,
})
TEAM_FLEETCOLONEL = DarkRP.createJob("Colonel/Commodore", {
    color = Color(192, 193, 123),
    model = {
        "models/defcon/repcomm/executiveofficer/executiveofficer.mdl"
    },
    description = [[
        Fleet Colonel-Commadore
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d"
    },
    command = "fleetCC",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Fleet",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(700)
        ply:SetMaxHealth(700)
    end,
})

TEAM_FLEETREAR = DarkRP.createJob("Rear Admiral/Vice Admiral", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/admiral.mdl",
        "models/nada/pms/female/admiral.mdl"
    },
    description = [[
        Fleet Rear Admiral-Vice Admiral 
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d"
    },
    command = "fleetRV",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Fleet",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(800)
        ply:SetMaxHealth(800)
    end,
})

TEAM_INQUSITORJUNIOR = DarkRP.createJob("Junior Inquisitor", {
    color = Color(204, 0, 0),
    model = {
        "models/player/xozz/hydra/inquisitor/durosinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/keldorinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_01.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_02.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_03.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_04.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_06.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_05.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_07.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_08.mdl",
        "models/player/xozz/hydra/inquisitor/rodianinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/zabrakinquisitor.mdl"
    },
    description = [[
        Acolyte/Apprentice of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs"
    },
    command = "jrinquisitor",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})

TEAM_INQUSITOR = DarkRP.createJob("Inquisitor", {
    color = Color(204, 0, 0),
    model = {
        "models/player/xozz/hydra/inquisitor/durosinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/keldorinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_01.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_02.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_03.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_04.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_06.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_05.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_07.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_08.mdl",
        "models/player/xozz/hydra/inquisitor/rodianinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/zabrakinquisitor.mdl"
    },
    description = [[
        Warrior/Master of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lightsaber",
        "weapon_cuff_elastic"
    },
    command = "inquisitor",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(750)
        ply:SetMaxHealth(750)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
    end,
})

TEAM_INQUSITORSENIOR = DarkRP.createJob("Senior Inquisitor", {
    color = Color(204, 0, 0),
    model = {
        "models/player/xozz/hydra/inquisitor/durosinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/keldorinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_01.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_02.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_03.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_04.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_06.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_05.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_07.mdl",
        "models/player/xozz/hydra/inquisitor/inquisitormale_08.mdl",
        "models/player/xozz/hydra/inquisitor/rodianinquisitor.mdl",
        "models/player/xozz/hydra/inquisitor/zabrakinquisitor.mdl"
    },
    description = [[
        Lord of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs",
        "weapon_cuff_elastic"
    },
    command = "srinquisitor",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
    end,
})
TEAM_INQUSITORSECOND = DarkRP.createJob("Second Sister", {
    color = Color(204, 0, 0),
    model = "models/player/sample/sister/test/sister.mdl",
    description = [[
        Second Sister of the Inquisitors  
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs",
        "weapon_cuff_elastic"
    },
    command = "secondsister",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1500)
        ply:SetMaxHealth(1500)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
    end,
})

TEAM_INQUSITORGRAND = DarkRP.createJob("Grand Inquisitor", {
    color = Color(204, 0, 0),
    model = "models/epangelmatikes/grand_inquisitor.mdl",
    description = [[
        Grand Inquisitor of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs",
        "weapon_cuff_elastic"
    },
    command = "grandinquisitor",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(2000)
        ply:SetMaxHealth(2000)
        ply:SetArmor(250)
        ply:SetMaxArmor(250)
    end,
})


TEAM_INQUISITORROYAL = DarkRP.createJob("Royal Guard", {
    color = Color(240, 0, 0),
    model = {
        "models/epangelmatikes/royalguard/royal_guard.mdl"
    },
    description = [[
        A bounty hunter for hire
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_royal_staff",
        "rw_sw_shield_rebel_dh17",
        "rw_sw_dh17",
        "rw_sw_tl40"
    },
    command = "royalguard",
    max = 0,
    salary = 400,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
    end,
})

TEAM_INQUSITORDARTH = DarkRP.createJob("Darth Vader", {
    color = Color(204, 0, 0),
    model = "models/konnie/starwars/darthvader.mdl",
    description = [[
        You are Darth Vader
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs",
        "weapon_cuff_elastic"
    },
    command = "darthvader",
    max = 1,
    salary = 700,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(5000)
        ply:SetMaxHealth(5000)
        ply:SetArmor(300)
        ply:SetMaxArmor(300)
    end,
})

TEAM_INQUSITOREMPEROR = DarkRP.createJob("The Emperor", {
    color = Color(10, 0, 194),
    model = "models/player/emperor_palpatine.mdl",
    description = [[
        the ruler of the empire and a sith lord
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_cuff_elastic",
        "weapon_lscs",
        "arccw_ibOWNER"
    },
    command = "theemperor",
    max = 0,
    salary = 1000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Inquisition",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(7000)
        ply:SetMaxHealth(7000)
        ply:SetArmor(400)
        ply:SetMaxArmor(400)
    end,
})
TEAM_IMPERIALARMYENL = DarkRP.createJob("Imperial Army Enlisted", {
    color = Color(0, 148, 57),
   model = {
        "models/strasser/swbf2/imp/Imperial_Adam_Trooper_pm.mdl",
    },
    description = [[
        You're an Enlisted in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19s",
        "rw_sw_e11",
        "rw_sw_se14c"
    },
    command = "imparmyenlisted",
    max = 0,
    salary = 25,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Army",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(200)
        ply:SetMaxHealth(200)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_IMPERIALARMYSGT = DarkRP.createJob("Imperial Army Sergeant", {
    color = Color(0, 148, 57),
   model = {
        "models/strasser/swbf2/imp/Chr_Imperial_Charlie_Officer_Coat_pm.mdl",
    },
    description = [[
        You're a Sergeant in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19s",
        "rw_sw_e11",
        "rw_sw_se14c",
        "rw_sw_nade_smoke",
        "rw_sw_nade_thermal"
    },
    command = "imparmysergeant",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Army",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})

TEAM_IMPERIALARMYOFFICER = DarkRP.createJob("Imperial Army Officer", {
    color = Color(0, 148, 57),
    model = {
        "models/strasser/swbf2/imp/Chr_Imperial_Viktor_Officer_pm.mdl",
    },
    description = [[
        You're an Officer in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19s",
        "rw_sw_e11",
        "rw_sw_se14c",
        "rw_sw_nade_smoke",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19x",
        "rw_sw_dual_westar34"
    },
    command = "imparmyofficer",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Army",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_IMPERIALARMYCOMMAND = DarkRP.createJob("Imperial Army Command", {
    color = Color(0, 148, 57),
   model = {
        "models/strasser/swbf2/imp/Chr_Imperial_Viktor_Officer_pm.mdl",
    },
    description = [[
        You're a Command in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19s",
        "rw_sw_e11",
        "rw_sw_se14c",
        "rw_sw_nade_smoke",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19x",
        "rw_sw_dual_westar34",
        "alydus_fortificationbuildertablet",
        "alydus_fusioncutter"
    },
    command = "imparmycommand",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Army",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_IMPERIALARMYCOMMANDER = DarkRP.createJob("Imperial Army Commander", {
    color = Color(0, 148, 57),
    model = {
        "models/strasser/swbf2/imp/Chr_Imperial_Viktor_Officer_pm.mdl",
    },
    description = [[
        You're a Commander in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19s",
        "rw_sw_e11",
        "rw_sw_se14c",
        "rw_sw_nade_smoke",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19x",
        "rw_sw_dual_westar34",
        "alydus_fortificationbuildertablet",
        "alydus_fusioncutter",
        "rw_sw_dual_e5bx"
    },
    command = "imparmycommander",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Army",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
TEAM_NOVATROOPER = DarkRP.createJob("Nova Trooper", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_t21",
        "rw_sw_rk3"
    },
    command = "novatrooper",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Nova Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(275)
        ply:SetMaxHealth(275)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_NOVASGT = DarkRP.createJob("Nova Sergeant", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_t21",
        "rw_sw_rk3",
        "alydus_fusioncutter"
    },
    command = "novasergeant",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Nova Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})

TEAM_NOVAOFFICER = DarkRP.createJob("Nova Officer", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_t21",
        "rw_sw_hh12",
        "rw_sw_nade_thermal",
        "rw_sw_rk3",
        "alydus_fusioncutter",
        "rw_sw_cr2c"
    },
    command = "novaofficer",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Nova Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})

TEAM_NOVACOMMAND = DarkRP.createJob("Nova Command", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_t21",
        "rw_sw_hh12",
        "rw_sw_nade_thermal",
        "rw_sw_rk3",
        "alydus_fusioncutter",
        "rw_sw_cr2c",
        "rw_sw_dp23"
    },
    command = "novacommand",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Nova Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_NOVACOMMANDER = DarkRP.createJob("Nova Commander", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_t21",
        "rw_sw_hh12",
        "rw_sw_nade_thermal",
        "alydus_fusioncutter",
        "rw_sw_cr2c",
        "rw_sw_dp23",
        "rw_sw_ib94"
    },
    command = "novacommander",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Nova Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})


TEAM_DEATHTROOPER = DarkRP.createJob("DeathTrooper", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "realistic_hook",
        "rw_sw_nade_thermal",
        "sc_tranceiver"
    },
    command = "deathtrooper",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Death Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_DEATHTROOPERSGT = DarkRP.createJob("DeathTrooper Sergeant", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Sergeant
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "realistic_hook",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19",
        "sc_tranceiver"
    },
    command = "deathtroopersgt",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Death Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})

TEAM_DEATHTROOPEROFFICER = DarkRP.createJob("DeathTrooper Officer", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "realistic_hook",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19",
        "rw_sw_dlt19x",
        "rw_sw_pinglauncher",
        "rw_sw_nade_dioxis",
        "sc_tranceiver"
    },
    command = "deathtrooperof",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Death Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})


TEAM_DEATHTROOPERCOMMAND = DarkRP.createJob("DeathTrooper Command", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Command
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "realistic_hook",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19",
        "rw_sw_dlt19x",
        "rw_sw_pinglauncher",
        "rw_sw_nade_dioxis",
        "rw_sw_smartlauncher",
        "rw_sw_nade_bacta",
        "admin_defib",
        "weapon_bactainjector",
        "sc_tranceiver"
    },
    command = "deathtroopercom",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Death Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_DEATHTROOPERCOMMANDER = DarkRP.createJob("DeathTrooper Commander", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Commander
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_se14r",
        "realistic_hook",
        "rw_sw_nade_thermal",
        "rw_sw_dlt19",
        "rw_sw_dlt19x",
        "rw_sw_pinglauncher",
        "rw_sw_nade_dioxis",
        "rw_sw_smartlauncher",
        "rw_sw_nade_bacta",
        "admin_defib",
        "weapon_bactainjector",
        "rw_sw_z4",
        "sc_tranceiver"
    },
    command = "deathtrooperco",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Death Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(550)
        ply:SetMaxHealth(550)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})

TEAM_ISB = DarkRP.createJob("ISB Agent", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
       You're a Naval Agent
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "weapon_cuff_elastic",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_e11d",
        "realistic_hook"
    },
    command = "isbagent",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
    end,
})

TEAM_ISBCONSTABLE = DarkRP.createJob("ISB Constable", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Constable
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "weapon_cuff_elastic",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_shield_imp_rk3",
        "rw_sw_e11d",
        "realistic_hook"
    },
    command = "isbconstable",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
    end,
})

TEAM_ISBWO = DarkRP.createJob("ISB Warrant Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Warrant Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "weapon_cuff_elastic",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_shield_imp_rk3",
        "rw_sw_e11t",
        "rw_sw_e11d",
        "realistic_hook"
    },
    command = "isbwo",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
    end,
})

TEAM_ISBOFFICER = DarkRP.createJob("ISB Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "weapon_cuff_elastic",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_shield_imp_rk3",
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "rw_sw_e11d",
        "realistic_hook"
    },
    command = "isbofficer",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
    end,
})

TEAM_ISBCOMMAND = DarkRP.createJob("ISB Command", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Command 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "weapon_cuff_elastic",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_shield_imp_rk3",
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "rw_sw_nade_thermal",
        "rw_sw_e11d",
        "realistic_hook"
    },
    command = "isbcommand",
    max = 0,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
    end,
})

TEAM_ISBCHIEF = DarkRP.createJob("ISB Chief", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Chief 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "weapon_cuff_elastic",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_shield_imp_rk3",
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "rw_sw_nade_thermal",
        "rw_sw_shield_imp",
        "rw_sw_e11d",
        "realistic_hook"
    },
    command = "isbchief",
    max = 0,
    salary = 350,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(550)
        ply:SetMaxHealth(550)
    end,
})

TEAM_ISBDIRECTOR = DarkRP.createJob("ISB Director", {
    color = Color(10, 0, 194),
    model = {
        "  models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Director 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_smartlauncher",
        "weapon_cuff_elastic",
        "realistic_hook",
        "rw_sw_shield_imp",
        "rw_sw_nade_stun",
        "rw_sw_e11t",
        "rw_sw_shield_imp_rk3",
        "rw_sw_rk3",
        "rw_sw_stun_e11",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_nade_thermal",
        "rw_sw_e11d",
        "rw_sw_shield_imp"
    },
    command = "isbdirector",
    max = 0,
    salary = 350,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(600)
        ply:SetMaxHealth(600)
    end,
})

TEAM_ISBCOLONEL = DarkRP.createJob("ISB Colonel", {
    color = Color(0, 0, 0),
    model = {
        "models/nada/pms/male/isb.mdl",
    },
    description = [[
        ISB Colonel a jack of certain trades 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e22",
        "rw_sw_nn14",
        "rw_sw_bo_staff",
        "rw_sw_dc15a_o",
        "at_sw_dc17m",
        "weapon_cuff_elastic",
        "sw_datapad",
        "rw_sw_dual_rk3",
        "rw_sw_dlt19",
        "rw_sw_e11d",
        "rw_sw_tl40",
        "rw_sw_stun_e11",
        "rw_sw_nade_smoke",
        "rw_sw_smartlauncher",
        "rw_sw_nade_dioxism",
        "rw_sw_riotbaton",
        "cloakinginfinite",
        "stunstick",
        "unarrest_stick",
        "arrest_stick",
        "arccw_ibOWNER"
        
    },
    command = "isbcol",
    max = 1,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(700)
        ply:SetMaxHealth(700)
        ply:SetArmor(149)
        ply:SetMaxArmor(149)
    end,
})

TEAM_GAMEMASTER = DarkRP.createJob("Gamemaster on Duty", {
    color = Color(225, 0, 255),
    model = "models/gonzo/stormtrooperjanitors/stormtrooperjanitor/stormtrooperjanitor.mdl",
    description = [[
        Gamemaster For Atlas Imperial RP
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_physgun",
        "gmod_tool",
        "voice_amplifier"
    },
    command = "gamemaster",
    max = 2000,
    salary = 2000,
    admin = 1,
    vote = false,
    hasLicense = false,
    category = "Staff",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(99999)
        ply:SetMaxHealth(99999)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
    end,
})


TEAM_STAFF = DarkRP.createJob("Staff on Duty", {
    color = Color(225, 0, 255),
    model = "models/gonzo/stormtrooperjanitors/stormtrooperjanitorco/stormtrooperjanitorco.mdl",
    description = [[
        Staff For Atlas Imperial RP
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_physgun",
        "gmod_tool"
    },
    command = "staff",
    max = 9000,
    salary = 9000,
    admin = 1,
    vote = false,
    hasLicense = false,
    category = "Staff",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(99999)
        ply:SetMaxHealth(99999)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
    end,
})
TEAM_INFERNOSL = DarkRP.createJob("Inferno Squad Leader", {
    color = Color(126, 1, 1),
    model = {
    "models/pilot/inferno_squad_pilot.mdl",
    "models/crewman/inferno_squad_crewman.mdl"
    
    },
    description = [[
        you are the leader of Inferno Squad an elite unit within the empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11t",
        "rw_sw_dual_westar35",
        "rw_sw_nade_impact",
        "rw_sw_nade_smoke",
        "rw_sw_dlt20a"
    },
    command = "infernosquadleader",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Squads",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})

TEAM_INFERNOSUB = DarkRP.createJob("Inferno Squad Sub Leader", {
    color = Color(126, 1, 1),
    model = {
    "models/pilot/inferno_squad_pilot.mdl",
    "models/crewman/inferno_squad_crewman.mdl"
    
    },
    description = [[
        you are the Sub leader of Inferno Squad an elite unit within the empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11t",
        "rw_sw_dual_westar35",
        "rw_sw_nade_impact",
        "rw_sw_nade_smoke"
    },
    command = "infernosubleader",
    max = 0,
    salary = 450,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Squads",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_INFERNOMEMBER = DarkRP.createJob("Inferno Squad Member", {
    color = Color(126, 1, 1),
    model = {
    "models/pilot/inferno_squad_pilot.mdl",
    "models/crewman/inferno_squad_crewman.mdl"
    
    },
    description = [[
        you are a member of Inferno Squad an elite unit within the empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11t",
        "rw_sw_nade_impact",
        "rw_sw_nade_smoke",
        "rw_sw_westar35"
    },
    command = "infernosquadmember",
    max = 0,
    salary = 400,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Squads",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHORETRA = DarkRP.createJob("Shore Trainee", {
    color = Color(255, 149, 0),
    model = "models/nada/ShoreTrooper_Andor.mdl",
    description = [[
        You're a Shore Trainee of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e22",
        "rw_sw_rk3",

    },
    command = "shoretrainee",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shore Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_SHORESGT = DarkRP.createJob("Shore Sergeant", {
    color = Color(255, 149, 0),
    model = "models/nada/ShoreTrooper_Andor.mdl",
    description = [[
        You're a Shore Sergeant of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e22",
        "rw_sw_shield_imp",
        "rw_sw_rk3",
        "rw_sw_nade_incendiary",
        "rw_sw_nade_thermal"
    },
    command = "shoresergeant",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shore Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHOREOFFICER = DarkRP.createJob("Shore Officer", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_Captain.mdl",
    description = [[
        You're a Shore Officer of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e22",
        "rw_sw_shield_imp",
        "rw_sw_rk3",
        "rw_sw_nade_incendiary",
        "rw_sw_nade_thermal",
        "rw_sw_tl50"
    },
    command = "shoreofficer",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shore Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHORECOMMAND = DarkRP.createJob("Shore Command", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_Mortar.mdl",
    description = [[
        You're a Shore Command of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e22",
        "rw_sw_shield_imp",
        "rw_sw_rk3",
        "rw_sw_nade_incendiary",
        "rw_sw_nade_thermal",
        "rw_sw_dlt20a",
        "rw_sw_tl50"
    },
    command = "shorecommand",
    max = 0,
    salary = 200,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shore Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_SHORECOMMANDER = DarkRP.createJob("Shore Commander", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_SquadLeader.mdl",
    description = [[
        You're a Shore Commander of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e22",
        "rw_sw_shield_imp",
        "rw_sw_rk3",
        "rw_sw_nade_incendiary",
        "rw_sw_nade_thermal",
        "rw_sw_dlt20a",
        "rw_sw_z6i",
        "rw_sw_tl50"
    },
    command = "shorecommander",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shore Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
TEAM_SHADOWSGT = DarkRP.createJob("Shadow Sergeant", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dl18",
        "rw_sw_t21",
        "rw_sw_t21b",
        "rw_sw_nade_smoke",
        "rw_sw_shield_imp",
        "cloaking-infinite"
    },
    command = "shadowsergeant",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shadow Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHADOWOFFICER = DarkRP.createJob("Shadow Officer", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dl18",
        "rw_sw_t21",
        "rw_sw_t21b",
        "rw_sw_nade_smoke",
        "rw_sw_shield_imp",
        "cloaking-infinite"
    },
    command = "shadowofficer",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shadow Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_SHADOWCOMMAND = DarkRP.createJob("Shadow Command", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_x8",
        "rw_sw_nade_smoke",
        "rw_sw_shield_imp",
        "rw_sw_e11s",
        "rw_sw_t21",
        "rw_sw_t21b",
        "cloaking-infinite"
    },
    command = "shadowcommand",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shadow Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_SHADOWCOMMANDER = DarkRP.createJob("Shadow Commander", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_nade_smoke",
        "rw_sw_shield_imp",
        "rw_sw_x8",
        "rw_sw_e11s",
        "rw_sw_t21",
        "rw_sw_t21b",
        "cloaking-infinite"
    },
    command = "shadowcommander",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shadow Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_RECRUIT
--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
    [TEAM_POLICE] = true,
    [TEAM_CHIEF] = true,
    [TEAM_MAYOR] = true,
}
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)