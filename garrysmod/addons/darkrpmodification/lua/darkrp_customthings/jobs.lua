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
TEAM_STORMTROOPERSENL = DarkRP.createJob("Storm Trooper Enlisted", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "st_e11_atlas",
        "st_dc17_atlas",
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
TEAM_STORMTROOPERSSGT = DarkRP.createJob("Storm Trooper Sergeant", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "st_e11_atlas",
        "st_dc17_atlas",
        "arccw_thermal_grenade"
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
        "st_e11_atlas",
        "weapon_imperial_flamethrower",
        "arccw_nade_inc"
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
        "st_e11_atlas",
        "st_e11s_atlas",
        "st_ec17_atlas"
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
TEAM_STORMTROOPERSJT = DarkRP.createJob("Jump Trooper", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "st_t21_atlas",
        "st_dc17_atlas",
        "",
    },
    command = "jumptrooper",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_STORMTROOPERSHEAVY = DarkRP.createJob("Heavy Trooper", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "st_dc17_atlas",
        "st_dlt19_atlas",
        "arccw_thermal_grenade"
    },
    command = "heavytrooper",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_STORMTROOPERSMECHANIC = DarkRP.createJob("Storm Trooper Mechanic", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "st_e11_atlas",
        "st_dc17_atlas",
        "alydus_fortificationbuildertablet",
        "weapon_lvsrepair"
    },
    command = "stmechanic",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Storm Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
TEAM_STORMTROOPERSOFFICER = DarkRP.createJob("Storm Trooper Officer", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "st_e11_atlas",
        "st_dc17_atlas",
        "st_dlt19_atlas",
        "arccw_thermal_grenade"
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

TEAM_STORMTROOPERSCOMMAND = DarkRP.createJob("Storm Trooper Command", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper 
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_empty_hands",
        "st_e11_atlas",
        "st_dc17_atlas",
        "st_dlt19_atlas",
        "st_e11s_atlas",
        "arccw_thermal_grenade"
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
TEAM_STORMTROOPERSCOMMANDER = DarkRP.createJob("Storm Trooper Commander", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_empty_hands",
        "st_e11_atlas",
        "st_dc17_atlas",
        "st_dlt19_atlas",
        "st_e11s_atlas",
        "st_dlt19x_atlas",
        "arccw_thermal_grenade"
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
TEAM_PURGEENL = DarkRP.createJob("Purge Trooper Enlisted", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "purge_dc15s_atlas",
        "purge_e11d_atlas",
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

TEAM_PURGESGT = DarkRP.createJob("Purge Trooper Sergeant", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "purge_dc15s_atlas",
        "purge_e11d_atlas",
        "purge_dc17_atlas",
        "arccw_thermal_grenade"
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
TEAM_PURGEOFFICER = DarkRP.createJob("Purge Trooper Officer", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "purge_dc15s_atlas",
        "purge_e11d_atlas",
        "purge_dc17_atlas",
        "arccw_thermal_grenade",
        "sfw_estaff"
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
TEAM_PURGECOMMAND = DarkRP.createJob("Purge Trooper Command", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "purge_dc15s_atlas",
        "purge_e11d_atlas",
        "purge_dc17_atlas",
        "arccw_thermal_grenade",
        "sfw_estaff",
        "weapon_imperial_flamethrower"
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
TEAM_PURGECOMMANDER = DarkRP.createJob("Purge Trooper Commander", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper 
    ]],
    weapons = {
        "weapon_empty_hands",
        "purge_dc15s_atlas",
        "purge_e11d_atlas",
        "purge_dc17_atlas",
        "arccw_thermal_grenade",
        "sfw_estaff",
        "weapon_imperial_flamethrower"
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
TEAM_SHOCKTROOPER = DarkRP.createJob("Shock Trooper Enlisted", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Trooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "shock_dlt19_atlas",
        "shock_dl44_atlas",
        "shock_rk3_atlas",

        "weapon_r_handcuffs",
        "arrest_stick",
        "unarrest_stick",

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
TEAM_SHOCKSGT = DarkRP.createJob("Shock Trooper Sergeant", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Sergeant
    ]],
    weapons = {
        "weapon_empty_hands",
        "shock_dlt19_atlas",
        "shock_dl44_atlas",
        "shock_rk3_atlas",

        "weapon_r_handcuffs",
        "arrest_stick",
        "unarrest_stick",
        "arrcw_shock_grenade",
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
TEAM_SHOCKOFFICER = DarkRP.createJob("Shock Trooper Officer", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "shock_dlt19_atlas",
        "shock_dl44_atlas",
        "shock_rk3_atlas",

        "weapon_r_handcuffs",
        "arrest_stick",
        "unarrest_stick",
        "arrcw_shock_grenade",
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
TEAM_SHOCKCOMMAND = DarkRP.createJob("Shock Trooper Command", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Command
    ]],
    weapons = {
        "weapon_empty_hands",
        "shock_dlt19_atlas",
        "shock_dual_dl44_atlas",
        "shock_rk3_atlas",

        "weapon_r_handcuffs",
        "arrest_stick",
        "unarrest_stick",
        "arrcw_shock_grenade",
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
TEAM_SHOCKCOMMANDER = DarkRP.createJob("Shock Trooper Commander", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Commander
    ]],
    weapons = {
        "weapon_empty_hands",
        "shock_commander_dlt19_atlas",
        "shock_dual_dl44_atlas",
        "shock_rk3_atlas",

        "weapon_r_handcuffs",
        "arrest_stick",
        "unarrest_stick",
        "arrcw_shock_grenade",
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
TEAM_MEDICALENLISTED = DarkRP.createJob("Medical Trooper Enlisted", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_trooper.mdl",
    },
    description = [[
        Medical Trooper
    ]],
    weapons = {
        "weapon_bactainjector",

        "medical_e11_atlas",
        "medical_rk3_atlas",

        "weapon_empty_hands",
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

TEAM_MEDICALSGT = DarkRP.createJob("Medical Trooper Sergeant", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_sergeant.mdl",
    },
    description = [[
        Medical Sergeant
    ]],
    weapons = {
        "medical_e11_atlas",

        "arccw_bacta_grenade",

        "weapon_empty_hands",
        "weapon_defibrilator",
        "weapon_bactainjector",
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

TEAM_MEDICALOFFICER = DarkRP.createJob("Medical Trooper Officer", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_lieutenant.mdl",
    },
    description = [[
        Medical Officer
    ]],
    weapons = {
        "medical_e11_atlas",
        "medical_rk3_atlas",

        "arccw_bacta_grenade",
        
        "weapon_empty_hands",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_squadshield_arm",
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

TEAM_MEDICALCOMMAND = DarkRP.createJob("Medical Trooper Command", {
    color = Color(80, 101, 211),
    model = {
      "models/player/bunny/zephyr_imperial_medics/zephyr_medic_officer.mdl",
    },

    description = [[
        Medical Command 
    ]],
    weapons = {
        "medical_e11_atlas",
        "medical_rk3_atlas",

        "arccw_bacta_grenade",
        
        "weapon_empty_hands",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_squadshield_arm",
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

TEAM_MEDICALCOMMANDER = DarkRP.createJob("Medical Trooper Commander", {
    color = Color(80, 101, 211),
    model = {
        "models/player/bunny/zephyr_imperial_medics/zephyr_medic_commander.mdl",
    },
    description = [[
        Medical Commander 
    ]],
    weapons = {
        "medical_e11_atlas",
        "medical_rk3_atlas",
        "medical_t21_atlas",

        "weapon_empty_hands",
        "arccw_bacta_grenade",
        "weapon_defibrilator",
        "weapon_bactainjector",
        "weapon_squadshield_arm",
        "weapon_shield_activator",

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
        "custom_ll_DEV"
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
        "weapon_lscs",
        "inq_ec17_atlas"
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
        "weapon_lscs", 
        "weapon_r_handcuffs",
        "inq_ec17_atlas"
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
        "weapon_r_handcuffs",
        "inq_ec17_atlas"
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
        "weapon_r_handcuffs",
        "inq_ec17_atlas"
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
        "weapon_r_handcuffs",
        "inq_ec17_atlas"
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
        "inq_ec17_atlas",
        "weapon_r_handcuffs"
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
        "weapon_lscs", 
        "weapon_r_handcuffs",
        "inq_ec17_atlas",
        "custom_ib_OWNER"
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
        "models/nada/MudTrooper_M.mdl",
        "models/nada/MudTrooper_F.mdl",
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl"
    },
    description = [[
        You're an Enlisted in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "ia_e10_atlas",
        "ia_ec17_atlas"
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
        "models/nada/MudTrooper_M.mdl",
        "models/nada/MudTrooper_F.mdl",
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl"
    },
    description = [[
        You're a Sergeant in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "ia_e10_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",
        "ia_rk3_atlas"
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
        "models/nada/MudTrooper_M.mdl",
        "models/nada/MudTrooper_F.mdl",
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl",
    },
    description = [[
        You're an Officer in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "ia_e10_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",
        "ia_rk3_atlas",
        "ia_e11s_atlas",
        "ia_e11_atlas",
        "ia_t21_atlas"
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
    "models/nada/MudTrooper_M.mdl",
    "models/nada/MudTrooper_F.mdl",
    "models/nada/ArmyTrooper_M.mdl",
    "models/nada/ArmyTrooper_F.mdl"
    },
    description = [[
        You're a Command in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "ia_e10_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",
        "ia_rk3_atlas",
        "ia_e11s_atlas",
        "ia_e11_atlas",
        "ia_t21_atlas",
        "alydus_fortificationbuildertablet",
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
        "models/nada/MudTrooper_M.mdl",
        "models/nada/MudTrooper_F.mdl",
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl"
    },
    description = [[
        You're a Commander in the Imperial Army
    ]],
    weapons = {
        "weapon_empty_hands",
        "ia_e10_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",
        "ia_rk3_atlas",
        "ia_e11s_atlas",
        "ia_e11_atlas",
        "ia_t21_atlas",
        "alydus_fortificationbuildertablet",
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

-- Nova Corp
TEAM_NOVATROOPER = DarkRP.createJob("Nova Trooper Enlisted", {
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
TEAM_NOVASGT = DarkRP.createJob("Nova Trooper Sergeant", {
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

TEAM_NOVAOFFICER = DarkRP.createJob("Nova Trooper Officer", {
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

TEAM_NOVACOMMAND = DarkRP.createJob("Nova Trooper Command", {
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
TEAM_NOVACOMMANDER = DarkRP.createJob("Nova Trooper Commander", {
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

-- Death Trooper
TEAM_DEATHTROOPERTRA = DarkRP.createJob("Death Trooper Trainee", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "dt_e11d_atlas",
        "dt_dc17_atlas",

        "dt_encrypter",
        "dt_decrypter",

    },
    command = "deathtroopertra",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Death Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_DEATHTROOPEREN = DarkRP.createJob("Death Trooper Enlisted", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper
    ]],
    weapons = {
        "weapon_empty_hands",
        "dt_e11d_atlas",
        "dt_se14_atlas",
        "dt_dc17_atlas",

        "dt_encrypter",
        "dt_decrypter",

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
TEAM_DEATHTROOPERSGT = DarkRP.createJob("Death Trooper Sergeant", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Sergeant
    ]],
    weapons = {
        "weapon_empty_hands",
        "dt_e11d_atlas",
        "dt_se14_atlas",
        "dt_dc17_atlas",

        "dt_encrypter",
        "dt_decrypter",

        "weapon_r_handcuffs",

        "arccw_thermal_grenade",
        
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

TEAM_DEATHTROOPEROFFICER = DarkRP.createJob("Death Trooper Officer", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Officer
    ]],
    weapons = {
        "weapon_empty_hands",
        "dt_e11d_atlas",
        "dt_se14_atlas",
        "dt_dc17_atlas",
        "dt_dlt19_atlas",
        "dt_dlt19x_atlas",

        "dt_encrypter",
        "dt_decrypter",

        "weapon_r_handcuffs",

        "arccw_thermal_grenade",
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

TEAM_DEATHTROOPERCOMMAND = DarkRP.createJob("Death Trooper Command", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Command
    ]],
    weapons = {
        "weapon_empty_hands",
        "dt_e11d_atlas",
        "dt_se14_atlas",
        "dt_dc17_atlas",
        "dt_dlt19_atlas",
        "dt_dlt19x_atlas",
        "weapon_r_handcuffs",

        "dt_encrypter",
        "dt_decrypter",

        "arccw_thermal_grenade",
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
TEAM_DEATHTROOPERCOMMANDER = DarkRP.createJob("Death Trooper Commander", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper Commander
    ]],
    weapons = {
        "weapon_empty_hands",
        "dt_e11d_atlas",
        "dt_se14_atlas",
        "dt_dc17_atlas",
        "dt_dlt19_atlas",
        "dt_dlt19x_atlas",
        "dt_z2_atlas",
        "weapon_r_handcuffs",

        "dt_encrypter",
        "dt_decrypter",

        "arccw_thermal_grenade",
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
        "isb_rk3_atlas",
        "isb_e11d_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
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
        "isb_rk3_atlas",
        "isb_e11d_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",

        "arrcw_smoke_grenade"
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
        "isb_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",

        "arrcw_smoke_grenade"
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
        "isb_duel_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",

        "arrcw_smoke_grenade"
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
        "isb_duel_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",

        "arrcw_smoke_grenade"
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
        "isb_director_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",

        "arrcw_smoke_grenade"
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
        "isb_duel_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        
        "arrest_stick",
        "stunstick",
        "unarrest_stick",

        "arrcw_smoke_grenade",
        "custom_ib_OWNER"
        
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

TEAM_SHORETRA = DarkRP.createJob("Shore Trooper Enlisted", {
    color = Color(255, 149, 0),
    model = "models/nada/ShoreTrooper_Andor.mdl",
    description = [[
        You're a Shore Trainee of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "shore_e22_atlas",
        "shore_rk3_atlas",

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
TEAM_SHORESGT = DarkRP.createJob("Shore Trooper Sergeant", {
    color = Color(255, 149, 0),
    model = "models/nada/ShoreTrooper_Andor.mdl",
    description = [[
        You're a Shore Sergeant of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "shore_e22_atlas",
        "shore_rk3_atlas",

        "arccw_nade_inc",

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
TEAM_SHOREOFFICER = DarkRP.createJob("Shore Trooper Officer", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_Captain.mdl",
    description = [[
        You're a Shore Officer of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "shore_e22_atlas",
        "shore_rk3_atlas",

        "arccw_nade_inc",
        "shore_tl50_atlas",
        "shore_e11s_atlas",

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
TEAM_SHORECOMMAND = DarkRP.createJob("Shore Trooper Command", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_Mortar.mdl",
    description = [[
        You're a Shore Command of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "shore_e22_atlas",
        "shore_rk3_atlas",

        "arccw_nade_inc",
        "shore_tl50_atlas",
        "shore_e11s_atlas",

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
TEAM_SHORECOMMANDER = DarkRP.createJob("Shore Trooper Commander", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_SquadLeader.mdl",
    description = [[
        You're a Shore Commander of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "shore_e22_atlas",
        "shore_rk3_atlas",

        "arccw_nade_inc",
        "shore_tl50_atlas",
        "shore_e11s_atlas",

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

TEAM_SHADOWSGT = DarkRP.createJob("Shadow Trooper Sergeant", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "cloaking-infinite",
        "arccw_smoke_grenade",

        "shadow_t21_atlas",
        "shadow_se14_atlas",
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
TEAM_SHADOWOFFICER = DarkRP.createJob("Shadow Trooper Officer", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "cloaking-infinite",
        "arccw_smoke_grenade",

        "shadow_t21_atlas",
        "shadow_se14_atlas",
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
TEAM_SHADOWCOMMAND = DarkRP.createJob("Shadow Trooper Command", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "cloaking-infinite",
        "arccw_smoke_grenade",

        "shadow_t21_atlas",
        "shadow_dual_se14_atlas",

        "shadow_dlt19x_atlas",
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
TEAM_SHADOWCOMMANDER = DarkRP.createJob("Shadow Trooper Commander", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "cloaking-infinite",
        "arccw_smoke_grenade",

        "shadow_t21_atlas",
        "shadow_dual_se14_atlas",

        "shadow_dlt19x_atlas",
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
TEAM_DEV = DarkRP.createJob("Dev on Duty", {
    color = Color(225, 0, 255),
    model = "models/gonzo/stormtrooperjanitors/stormtrooperjanitorco/stormtrooperjanitorco.mdl",
    description = [[
        Dev For Atlas Imperial RP
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_physgun",
        "gmod_tool",
        "custom_ll_DEV",
        "custom_ib_OWNER",
        "custom_test_bowcaster",
        "custom_grenade_launcher",
        "shadow_dual_se14_atlas",
    },
    command = "dev",
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
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_RECRUIT
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
--[[ DarkRP.addHitmanTeam() ]]