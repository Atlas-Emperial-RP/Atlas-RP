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
--[[
    Stormtrooper Enlisted Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]
--[[
    Citizen Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CITIZEN = DarkRP.createJob("Citizen", {
    color = Color(89, 255, 0),
    model = {
        "models/nada/female/factoryworker.mdl",
        "models/nada/male/factoryworker.mdl"
    },
    description = [[
        You're a citizen of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "gmod_camera",
    },
    command = "citizen",
    max = 0,
    salary = 25,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Citizens",
    canDemote = false,
})
TEAM_STORMTROOPERSTRA = DarkRP.createJob("Stormtrooper Trainee", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper on the base of Atlas
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dh17",
        "rw_sw_e11"
    },
    command = "stormtrainee",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(225)
        ply:SetMaxHealth(225)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
TEAM_STORMTROOPERSENL = DarkRP.createJob("Stormtrooper Enlisted", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper on the base of Atlas
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Stormtrooper Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STORMTROOPERSSGT = DarkRP.createJob("Stormtrooper Sergeant", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper on the base of Atlas
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    FlameTrooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STORMTROOPERSFLAME = DarkRP.createJob("Flametrooper", {
    color = Color(13, 0, 255),
    model = "models/nada/FlameTrooper.mdl",
    description = [[
        FlameTrooper Of Vardos!
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(325)
        ply:SetMaxHealth(325)
    end,
})
--[[
    Scout Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STORMTROOPERSSCOUT = DarkRP.createJob("Scout Trooper", {
    color = Color(13, 0, 255),
    model = {
        "models/nada/ScoutTrooper_M.mdl",
        "models/nada/ScoutTrooper_F.mdl"
    },
    description = [[
        Scout Trooper Of Vardos!
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(225)
        ply:SetMaxHealth(225)
    end,
})

--[[
    Stormtrooper Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STORMTROOPERSOFFICER = DarkRP.createJob("Stormtrooper Officer", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper on the base of Atlas
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Stormtrooper Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STORMTROOPERSCOMMAND = DarkRP.createJob("Stormtrooper Command", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper on the base of Atlas
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    Stormtrooper Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STORMTROOPERSCOMMANDER = DarkRP.createJob("Stormtrooper Commander", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper on the base of Atlas
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
    category = "Stormtroopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    Purge Trooper Medic Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_PURGEMEDIC = DarkRP.createJob("Purge Medic", {
    color = Color(140, 45, 13),
    model = "models/nada/PurgeTrooperElectroHammer.mdl",
    description = [[
        Purge Trooper Medic Of Vardos!
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
--[[
    Purge Enlisted Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_PURGEENL = DarkRP.createJob("Purge Enlisted", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper on the base of Atlas
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
--[[
    Purge Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_PURGESGT = DarkRP.createJob("Purge Sergeant", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper on the base of Atlas
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
--[[
    Purge Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_PURGEOFFICER = DarkRP.createJob("Purge Officer", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper on the base of Atlas
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
--[[
    Purge Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_PURGECOMMAND = DarkRP.createJob("Purge Command", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper on the base of Atlas
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
--[[
    Purge Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_PURGECOMMANDER = DarkRP.createJob("Purge Commander", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper on the base of Atlas
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
--[[
    Shock Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHOCKTROOPER = DarkRP.createJob("Shock Trooper", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Trooper of Vardos!
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
--[[
    Shock Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHOCKSGT = DarkRP.createJob("Shock Sergeant", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Sergeant of Vardos!
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
--[[
    Shock Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHOCKOFFICER = DarkRP.createJob("Shock Officer", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Officer of Vardos!
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
--[[
    Shock Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHOCKCOMMAND = DarkRP.createJob("Shock Command", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Command of Vardos!
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
--[[
    Shock Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHOCKCOMMANDER = DarkRP.createJob("Shock Commander", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        You're a Shock Commander of Vardos!
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
--[[
    Naval Agent Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NAVALAGENT = DarkRP.createJob("Naval Agent", {
    color = Color(0, 64, 255),
    model = {
        "models/nada/pms/female/black_naval_officer.mdl",
        "models/nada/pms/male/black_naval_officer.mdl"
    },
    description = [[
        You're a Naval Agent of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
        "rw_sw_stun_e11",
        "rw_sw_se14r",
        "weapon_cuff_elastic",
        "realistic_hook"
    },
    command = "navalagent",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
    end,
})
--[[
    Naval Constable Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NAVALCONSTABLE = DarkRP.createJob("Naval Constable", {
    color = Color(0, 64, 255),
    model = {
        "models/nada/pms/female/black_naval_officer.mdl",
        "models/nada/pms/male/black_naval_officer.mdl"
    },
    description = [[
        You're a Naval Constable of Vardos!
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
        "weapon_cuff_elastic",
        "realistic_hook"
    },
    command = "navalconstable",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
    end,
})
--[[
    Naval Warrant Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NAVALWO = DarkRP.createJob("Naval Warrant Officer", {
    color = Color(0, 64, 255),
    model = {
        "models/nada/pms/female/black_naval_officer.mdl",
        "models/nada/pms/male/black_naval_officer.mdl"
    },
    description = [[
        You're a Naval Warrant Officer of Vardos!
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
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "weapon_cuff_elastic",
        "realistic_hook"
    },
    command = "navalwarrantofficer",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
    end,
})
--[[
    Naval Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NAVALOFFICER = DarkRP.createJob("Naval Officer", {
    color = Color(0, 64, 255),
    model = {
        "models/nada/pms/female/black_naval_officer.mdl",
        "models/nada/pms/male/black_naval_officer.mdl"
    },
    description = [[
        You're a Naval Officer of Vardos!
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
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "rw_sw_shield_imp",
        "weapon_cuff_elastic",
        "realistic_hook"
    },
    command = "navalofficer",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
    end,
})
--[[
    Naval Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NAVALCOMMAND = DarkRP.createJob("Naval Command", {
    color = Color(0, 64, 255),
    model = {
        "models/nada/pms/female/black_naval_officer.mdl",
        "models/nada/pms/male/black_naval_officer.mdl"
    },
    description = [[
        You're a Naval Command of Vardos!
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
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "rw_sw_shield_imp",
        "weapon_cuff_elastic",
        "realistic_hook"
    },
    command = "navalcommand",
    max = 0,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(550)
        ply:SetMaxHealth(550)
    end,
})
--[[
    Naval Director Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NAVALDIRECTOR = DarkRP.createJob("Naval Director", {
    color = Color(0, 64, 255),
    model = {
        "models/nada/pms/female/black_naval_officer.mdl",
        "models/nada/pms/male/black_naval_officer.mdl"
    },
    description = [[
        You're a Naval Director of Vardos!
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
        "rw_sw_e11t",
        "rw_sw_nade_stun",
        "rw_sw_shield_imp",
        "rw_sw_smartlauncher",
        "weapon_cuff_elastic",
        "realistic_hook"
    },
    command = "navaldirector",
    max = 0,
    salary = 350,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(600)
        ply:SetMaxHealth(600)
    end,
    })
--[[
    Shore Trainee Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Shore Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Shore Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Shore Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Shore Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Imperial Commando Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALCOMMANDO = DarkRP.createJob("Imperial Commando", {
    color = Color(66, 0, 0),
    model = {
        "models/nada/ImperialCommandoGrunt.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Fisher.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Scorch.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Fixer.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Fils.mdl",
        "models/aussiwozzi/imperialcommandos/ic_boss.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Zag.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Tyto.mdl",
        "models/aussiwozzi/imperialcommandos/ic_sarge.mdl",
        "models/aussiwozzi/imperialcommandos/ic_Dikut.mdl",
        "models/aussiwozzi/imperialcommandos/ic_white.mdl",
        "models/aussiwozzi/imperialcommandos/ic_lambert.mdl"
    },
    description = [[
        You're a Imperial Commando of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "at_sw_dc17m",
        "defuse_kit",
        "rw_sw_electrodagger",
        "weapon_bactainjector",
        "realistic_hook"
    },
    command = "imperialcommando",
    max = 4,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Squads",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(850)
        ply:SetMaxHealth(850)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    Imperial Commando SL Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALCOMMANDOSL = DarkRP.createJob("Imperial Commando SL", {
    color = Color(66, 0, 0),
    model = {
        "models/aussiwozzi/imperialcommandos/ic_lambert_leader.mdl",
        "models/aussiwozzi/imperialcommandos/ic_lambert.mdl"
    },
    description = [[
        Imperial Commando Squad Lead On Vardos
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "at_sw_dc17m",
        "rw_sw_smartlauncher",
        "rw_sw_nade_smoke",
        "rw_sw_nade_thermal",
        "t3m4_empgrenade",
        "weapon_cuff_elastic",
        "defuse_kit",
        "rw_sw_nn14",
        "rw_sw_electrodagger",
        "weapon_bactainjector",
        "realistic_hook"
    },
    command = "commandosl",
    max = 1,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Squads",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(850)
        ply:SetMaxHealth(850)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
    end,
})
--[[
    Chimaera Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CHIMAERATROOPER = DarkRP.createJob("Chimaera Trooper", {
    color = Color(83, 238, 249),
    model = "models/player/zephyr_chimaera_troopers/chimaera_trooper.mdl",
    description = [[
        Chimaera Trooper Of Vardos
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_tl40",
        "rw_sw_dlt19",
        "defuse_kit",
        "rw_sw_westar35",
        "cloaking-infinite",
        "realistic_hook"
    },
    command = "chimaeratrooper",
    max = 0,
    salary = 55,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Chimaera",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(325)
        ply:SetMaxHealth(325)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Chimaera Recon Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CHIMAERARECON = DarkRP.createJob("Chimaera Recon", {
    color = Color(83, 238, 249),
    model = "models/player/zephyr_chimaera_troopers/chimaera_recon.mdl",
    description = [[
        Chimaera Trooper Of Vardos
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_tl40",
        "rw_sw_dlt19",
        "defuse_kit",
        "rw_sw_westar35",
        "cloaking-infinite",
        "rw_sw_shield_imp_e11",
        "realistic_hook"
    },
    command = "chimaerarecon",
    max = 0,
    salary = 55,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Chimaera",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
TEAM_CHIMAERAOVERSEER = DarkRP.createJob("Chimaera Overseer", {
    color = Color(83, 238, 249),
    model = "models/player/zephyr_chimaera_troopers/chimaera_overseer.mdl",
    description = [[
        Chimaera Trooper Of Vardos
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_tl40",
        "rw_sw_dlt19",
        "defuse_kit",
        "rw_sw_westar35",
        "cloaking-infinite",
        "rw_sw_shield_imp_e11",
        "realistic_hook",
        "rw_sw_dlt19x"
    },
    command = "chimaeraoverseer",
    max = 0,
    salary = 55,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Chimaera",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end, 
})
--[[
    Chimaera Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CHIMAERACOMMANDER = DarkRP.createJob("Chimaera Commander", {
    color = Color(83, 238, 249),
    model = "models/player/zephyr_chimaera_troopers/chimaera_commander.mdl",
    description = [[
        Chimaera Commander Of Vardos
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_e11d",
        "rw_sw_tl40",
        "rw_sw_dlt19",
        "defuse_kit",
        "rw_sw_westar35",
        "cloaking-infinite",
        "rw_sw_shield_imp_e11",
        "zx_wrist_flamethrower",
        "dw_wrist_rocket",
        "realistic_hook"
    },
    command = "chimaeracommander",
    max = 0,
    salary = 58,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Chimaera",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    Medical Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_MEDICALTROOPER = DarkRP.createJob("Medical Trooper", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Trooper of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_bactainjector",
        "rw_sw_e11",
        "rw_sw_se14r",
        "admin_defib",
        "analysis_notebook"
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

TEAM_MEDICALSGT = DarkRP.createJob("Medical Sergeant ", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Sergeant of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_bactainjector",
        "rw_sw_e11",
        "rw_sw_se14r",
        "admin_defib",
        "rw_sw_nade_bacta",
        "analysis_notebook"
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
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Officer of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_bactainjector",
        "rw_sw_e11",
        "rw_sw_se14r",
        "admin_defib",
        "rw_sw_nade_bacta",
        "rw_sw_nade_smoke",
        "weapon_squadshield_arm",
        "analysis_notebook"
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
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Command of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_bactainjector",
        "rw_sw_e11",
        "rw_sw_se14r",
        "admin_defib",
        "rw_sw_nade_bacta",
        "rw_sw_nade_smoke",
        "weapon_squadshield_arm",
        "weapon_shield_activator",
        "analysis_notebook"
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
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Commander of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_bactainjector",
        "rw_sw_e11",
        "rw_sw_se14r",
        "admin_defib",
        "rw_sw_nade_bacta",
        "rw_sw_nade_smoke",
        "weapon_squadshield_arm",
        "weapon_shield_activator",
        "rw_sw_t21",
        "analysis_notebook"
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
        Fleet Ensign-Lieutenant-Post Captain of Vardos!
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
        Fleet Admiral-Fleet Admiral of Vardos!
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
        Grand Admiral of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "tfa_dt29",
        "rw_sw_e11d"
    },
    command = "fleetGA",
    max = 0,
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
        Fleet Captain-Major of Vardos!
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
})--[[
    Fleet Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_FLEETCOLONEL = DarkRP.createJob("Colonel/Commodore", {
    color = Color(192, 193, 123),
    model = {
        "models/defcon/repcomm/executiveofficer/executiveofficer.mdl"
    },
    description = [[
        Fleet Colonel-Commadore of Vardos!
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
--[[
    Fleet Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_FLEETREAR = DarkRP.createJob("Rear Admiral/Vice Admiral", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/admiral.mdl",
        "models/nada/pms/female/admiral.mdl"
    },
    description = [[
        Fleet Rear Admiral-Vice Admiral of Vardos!
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
--[[
    Junior Inquisitor Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
        "weapon_lightsaber"
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
--[[
    Inquisitor Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Senior Inquisitor Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
        "weapon_lightsaber",
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
--[[
    Second Sister Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_INQUSITORSECOND = DarkRP.createJob("Second Sister", {
    color = Color(204, 0, 0),
    model = "models/player/sample/sister/test/sister.mdl",
    description = [[
        Second Sister of the Inquisitors  
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lightsaber",
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
--[[
    Grand Inquisitor Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_INQUSITORGRAND = DarkRP.createJob("Grand Inquisitor", {
    color = Color(204, 0, 0),
    model = "models/epangelmatikes/grand_inquisitor.mdl",
    description = [[
        Grand Inquisitor of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lightsaber",
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
--[[
    Royal Guard Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Darth Vader Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_INQUSITORDARTH = DarkRP.createJob("Darth Vader", {
    color = Color(204, 0, 0),
    model = "models/konnie/starwars/darthvader.mdl",
    description = [[
        You are Darth Vader
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lightsaber",
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
--[[
    The Emperor Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_INQUSITOREMPEROR = DarkRP.createJob("The Emperor", {
    color = Color(10, 0, 194),
    model = "models/player/emperor_palpatine.mdl",
    description = [[
        the ruler of the empire and a sith lord
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_cuff_elastic",
        "weapon_lightsaber",
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
--[[
    Imperial Army Enlisted Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALARMYENL = DarkRP.createJob("Imperial Army Enlisted", {
    color = Color(0, 148, 57),
    model = {
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl",
        "models/nada/MudTrooper_M.mdl"
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
--[[
    Imperial Army Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALARMYSGT = DarkRP.createJob("Imperial Army Sergeant", {
    color = Color(0, 148, 57),
    model = {
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl",
        "models/nada/MudTrooper_M.mdl"
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
--[[
    Imperial Army Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALARMYOFFICER = DarkRP.createJob("Imperial Army Officer", {
    color = Color(0, 148, 57),
    model = {
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl",
        "models/nada/MudTrooper_M.mdl"
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
--[[
    Imperial Army Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALARMYCOMMAND = DarkRP.createJob("Imperial Army Command", {
    color = Color(0, 148, 57),
    model = {
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl",
        "models/nada/MudTrooper_M.mdl"
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
--[[
    Imperial Army Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_IMPERIALARMYCOMMANDER = DarkRP.createJob("Imperial Army Commander", {
    color = Color(0, 148, 57),
    model = {
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl",
        "models/nada/MudTrooper_M.mdl"
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
--[[
    Nova Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NOVATROOPER = DarkRP.createJob("Nova Trooper", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp of Vardos!
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
--[[
    Nova Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NOVASGT = DarkRP.createJob("Nova Sergeant", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp of Vardos!
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
--[[
    Nova Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NOVAOFFICER = DarkRP.createJob("Nova Officer", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp of Vardos!
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
--[[
    Nova Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NOVACOMMAND = DarkRP.createJob("Nova Command", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp of Vardos!
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
--[[
    Nova Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_NOVACOMMANDER = DarkRP.createJob("Nova Commander", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp of Vardos!
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
--[[
    Shadow Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHADOWTROOPER = DarkRP.createJob("Shadow Trooper", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dl18",
        "rw_sw_t21",
        "rw_sw_nade_smoke",
        "cloaking-infinite"
    },
    command = "shadowtrooper",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shadow Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(275)
        ply:SetMaxHealth(275)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Shadow Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
})--[[
    Shadow Officer  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SHADOWOFFICER = DarkRP.createJob("Shadow Officer ", {
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
--[[
    Shadow Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Shadow Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Senate Commando Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SENATECOMMANDO = DarkRP.createJob("Senate Commando", {
    color = Color(17, 59, 228),
    model = "models/aussiwozzi/senatecommandos/senate_commando_trooper.mdl",
    description = [[
        Senate Commando of Vardos! (VIP)
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dc15s_purge",
        "rw_sw_shield_imp_e11",
        "rw_sw_d"
    },
    command = "senatecommando",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Senate Commando",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Senate Commando Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SENATECOMMANDOOFFICER = DarkRP.createJob("Senate Commando Officer", {
    color = Color(17, 59, 228),
    model = "models/aussiwozzi/senatecommandos/honor_guard.mdl",
    description = [[
        Senate Commando Officer of Vardos! (VIP)
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dc15s_purge",
        "rw_sw_shield_imp_e11",
        "rw_sw_d",
        "rw_sw_e11_noscope",
        "rw_sw_nade_smoke",
        "rw_sw_dc15a_purge"
    },
    command = "senatecommandoof",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Senate Commando",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    Senate Commando Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SENATECOMMANDOCOMMANDER = DarkRP.createJob("Senate Commando Commander", {
    color = Color(17, 59, 228),
    model = "models/aussiwozzi/senatecommandos/senate_commando_commander.mdl",
    description = [[
        Senate Commando Commander of Vardos! (VIP)
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dc15s_purge",
        "rw_sw_shield_imp_e11",
        "rw_sw_d",
        "rw_sw_e11_noscope",
        "rw_sw_nade_smoke",
        "rw_sw_dc15a_purge",
        "rw_sw_dlt19"
    },
    command = "senatecommandoco",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Senate Commando",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    DeathTrooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_DEATHTROOPER = DarkRP.createJob("Deathtrooper", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        Deathtrooper of Vardos!
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
    category = "DeathTrooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    DeathTrooper Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_DEATHTROOPERSGT = DarkRP.createJob("Deathtrooper Sergeant", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        Deathtrooper Sergeant of Vardos!
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
    category = "DeathTrooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    DeathTrooper Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_DEATHTROOPEROFFICER = DarkRP.createJob("Deathtrooper Officer", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        Deathtrooper Officer of Vardos!
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
    category = "DeathTrooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    DeathTrooper Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_DEATHTROOPERCOMMAND = DarkRP.createJob("Deathtrooper Command", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        Deathtrooper Command of Vardos!
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
    category = "DeathTrooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    DeathTrooper Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_DEATHTROOPERCOMMANDER = DarkRP.createJob("Deathtrooper Commander", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        Deathtrooper Commander of Vardos!
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
    category = "DeathTrooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(550)
        ply:SetMaxHealth(550)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    ISB Agent Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISB = DarkRP.createJob("ISB Agent", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
       You're a Naval Agent of Vardos!
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
--[[
    ISB Constable Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBCONSTABLE = DarkRP.createJob("ISB Constable", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Constable of Vardos!
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
--[[
    ISB Warrant Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBWO = DarkRP.createJob("ISB Warrant Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Warrant Officer of Vardos!
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
--[[
    ISB Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBOFFICER = DarkRP.createJob("ISB Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Officer of Vardos!
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
--[[
    ISB Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBCOMMAND = DarkRP.createJob("ISB Command", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Command of Vardos!
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
--[[
    ISB Chief Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBCHIEF = DarkRP.createJob("ISB Chief", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Chief of Vardos!
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
--[[
    ISB Director Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBDIRECTOR = DarkRP.createJob("ISB Director", {
    color = Color(10, 0, 194),
    model = {
        "  models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        You're an ISB Director of Vardos!
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
--[[
    Arc Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCTROOPER = DarkRP.createJob("Arc Trooper", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/trp.mdl",
    description = [[
        Arc Trooper Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "rw_sw_dual_dc17s",
        "rw_sw_e11",
        "rw_sw_se14r"
    },
    command = "arctrooper",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Arc Trooper Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCLIEUTENANT = DarkRP.createJob("Arc Trooper Lieutenant", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/sgt.mdl",
    description = [[
        Arc Trooper Officer Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "rw_sw_dual_dc17s",
        "rw_sw_e11",
        "rw_sw_se14r",
        "rw_sw_t21",
        "rw_sw_nade_thermal"
    },
    command = "arctrooperlt",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Arc Trooper Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCOFFICER = DarkRP.createJob("Arc Trooper Officer", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/lt.mdl",
    description = [[
        Arc Trooper Officer Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "rw_sw_dual_dc17s",
        "rw_sw_e11",
        "rw_sw_se14r",
        "rw_sw_t21",
        "rw_sw_nade_thermal",
        "rw_sw_tl50"
    },
    command = "arctrooperof",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Arc Trooper Command Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCCOMMAND = DarkRP.createJob("Arc Trooper Command", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/cpt.mdl",
    description = [[
        Arc Trooper Command Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "rw_sw_dual_dc17s",
        "rw_sw_e11",
        "rw_sw_se14r",
        "rw_sw_t21",
        "rw_sw_nade_thermal",
        "rw_sw_tl50",
        "mortar_constructor",
        "mortar_range_finder"
    },
    command = "arctroopercom",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    Arc Trooper Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCCOMMANDER = DarkRP.createJob("Arc Trooper Commander", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/co.mdl",
    description = [[
        Arc Trooper Commander Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "rw_sw_dual_dc17s",
        "rw_sw_e11",
        "rw_sw_se14r",
        "rw_sw_t21",
        "rw_sw_nade_thermal",
        "rw_sw_tl50",
        "mortar_constructor",
        "mortar_range_finder",
        "rw_sw_nade_stun",
        "rw_sw_huntershotgun",
        "ven_riddick_dlt23v"
    },
    command = "arctrooperco",
    max = 0,
    salary = 55,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    Arc Trooper Demo Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCDEMO = DarkRP.createJob("Arc Trooper Demo", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/eod.mdl",
    description = [[
        Arc Trooper Demo Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_fists",
        "rw_sw_dual_dc17s",
        "rw_sw_e11",
        "rw_sw_se14r",
        "rw_sw_t21",
        "rw_sw_nade_thermal",
        "rw_sw_tl50",
        "mortar_constructor",
        "mortar_range_finder",
        "rw_sw_nade_stun",
        "rw_sw_huntershotgun",
        "rw_sw_hh12",
        "rw_sw_ee3a"
    },
    command = "arctrooperdemo",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Arc Trooper Marksmen Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCMARKSMEN = DarkRP.createJob("Arc Trooper Marksmen", {
    color = Color(140, 45, 13),
    model = "models/halves/imparc/scout.mdl",
    description = [[
        Arc Trooper Marksmen Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dlt19x",
        "rw_sw_tl50",
        "rw_sw_e11",
        "rw_sw_dual_dc17s",
        "rw_sw_nt242c"
    },
    command = "arctroopermark",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(325)
        ply:SetMaxHealth(325)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Arc Trooper Medic Rep Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ARCMEDIC = DarkRP.createJob("Arc Trooper Medic Rep", {
    color = Color(170, 9, 9),
    model = "models/halves/imparc/med.mdl",
    description = [[
        Arc Trooper Med Rep Of Vardos!
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_tl50",
        "rw_sw_e11",
        "rw_sw_dual_dc17s",
        "rw_sw_nade_thermal",
        "weapon_bactainjector",
        "admin_defib",
        "analysis_notebook",
        "first_aid_kit",
        "bandage",
        "syringe_morphine",
        "weapon_squadshield_arm"
    },
    command = "arctroopermed",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Arc Trooper",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(275)
        ply:SetMaxHealth(275)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Fist Order Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTOR = DarkRP.createJob("First Order Trooper", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordertrooper.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_se44"
    },
    command = "firstordertrooper",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Fist Order Sergeant Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORSGT = DarkRP.createJob("First Order Sergeant", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordertrooper.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_se44",
        "rw_sw_fwmb10"
    },
    command = "firstordersergeant",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Fist Order Lieutenant  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORLIEUTENANT = DarkRP.createJob("First Order Lieutenant ", {
    color = Color(108, 64, 15),
    model = "models/nada/firstorderlieutenantgauge.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_fwmb10",
        "rw_sw_se44c",
        "rw_sw_dlt19d"
    },
    command = "firstorderlt",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Fist Order Officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTOROFFICER = DarkRP.createJob("First Order Officer", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordercaptaincardinal.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
       "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_fwmb10",
        "rw_sw_se44c",
        "rw_sw_dlt19d"
    },
    command = "firstorderof",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Fist Order Vice Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORVICE = DarkRP.createJob("First Order Vice Commander", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordercommanderpyre.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_fwmb10",
        "rw_sw_se44c",
        "rw_sw_dlt19d",
        "rw_sw_stw48",
        "rw_sw_e44"
    },
    command = "firstordervc",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    Fist Order Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORCOMMANDER = DarkRP.createJob("First Order Commander", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordercaptainphasma.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_fwmb10",
        "rw_sw_se44c",
        "rw_sw_dlt19d",
        "rw_sw_stw48",
        "rw_sw_e44"
    },
    command = "firstorderco",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(450)
        ply:SetMaxHealth(450)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    Fist Order Tie Pilot Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORPILOT = DarkRP.createJob("First Order Tie Pilot", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordertiepilot.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
       "weapon_empty_hands",
        "rw_sw_f11a",
        "rw_sw_se44"
    },
    command = "firstorderpilot",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(250)
        ply:SetMaxHealth(250)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Sovereign Protector   Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORPROTECTOR = DarkRP.createJob("Sovereign Protector  ", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordersovereignprotector.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
       "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_royal_staff",
        "rw_sw_se44c"
    },
    command = "sovprotecter",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(275)
        ply:SetMaxHealth(275)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[
    Sith Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORTROOPER = DarkRP.createJob("Sith Trooper", {
    color = Color(108, 64, 15),
    model = "models/nada/firstordersithtrooper.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
       "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_se44c",
        "rw_sw_stw48"
    },
    command = "sithtrooper",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    First Order FlameTrooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORFLAME = DarkRP.createJob("First Order FlameTrooper", {
    color = Color(108, 64, 15),
    model = "models/nada/firstorderflametrooper.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
       "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_se44c",
        "flamethrower_basic"
    },
    command = "firstorderflame",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(275)
        ply:SetMaxHealth(275)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    First Order Executioner  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTOREXECUTIONER = DarkRP.createJob("First Order Executioner ", {
    color = Color(108, 64, 15),
    model = "models/nada/firstorderexecutioner.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_se44c",
        "rw_sw_electrohammer"
    },
    command = "firstorderex",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(375)
        ply:SetMaxHealth(375)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
    end,
})
--[[
    First Order Elite Trooper  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_SECRETSECTORELITE = DarkRP.createJob("First Order Elite Trooper ", {
    color = Color(108, 64, 15),
    model = "models/nada/firstorderelitetrooper.mdl",
    description = [[
        First Order StormTrooper Prototype 
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_f11d",
        "rw_sw_se44c",
        "rw_sw_fwmb10"
    },
    command = "firstorderet",
    max = 0,
    salary = 45,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Secret Sector ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    ISB Colonel  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_ISBCOLONEL = DarkRP.createJob("ISB Colonel ", {
    color = Color(0, 0, 0),
    model = {
        "models/nada/pms/male/isb.mdl",
        "models/nada/rogueonetriton.mdl",
        "models/nada/snowtroopercommander.mdl",
        "models/nada/male/firstordersecuritybureau.mdl",
        "models/nada/navycommando.mdl",
        "models/nada/specialforcescommander.mdl"
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
        "arrest_stick"
        
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
--[[
    Gamemaster on Duty Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_GAMEMASTER = DarkRP.createJob("Gamemaster on Duty", {
    color = Color(225, 0, 255),
    model = "models/billy/mcdonalds/mcdonaldstrooper.mdl",
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
--[[
    Staff on Duty Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_STAFF = DarkRP.createJob("Staff on Duty", {
    color = Color(225, 0, 255),
    model = "models/billy/mcdonalds/mcdonaldscommander.mdl",
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
--[[
    Bounty Hunter Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_BOUNTY = DarkRP.createJob("Bounty Hunter", {
    color = Color(148, 0, 143),
    model = "models/gonzo/narshaddaacharacters/snake/snake.mdl",
    description = [[
        A bounty hunter for hire (VIP)
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dual_ib94",
        "rw_sw_westar11",
        "rw_sw_nade_smoke",
        "rw_sw_nade_thermal",
        "realistic_hook"
    },
    command = "bountyhunter",
    max = 10,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(700)
        ply:SetMaxHealth(700)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
    end,
})
TEAM_DEALER = DarkRP.createJob("Drug Dealer", {
    color = Color(240, 0, 0),
    model = "models/byan7259/bodian_player/segular_rodian_player.mdl",
    description = [[
        you sell drugs to the people of vardos, becareful of shock and ISB
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dt12"
    },
    command = "drugdealer",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
    end,
})
--[[
    Inferno Squad Leader Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Inferno Squad Sub Leader Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Inferno Squad Sub Leader Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

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
--[[
    Clone Insurgent  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CRIMINALSCLONE = DarkRP.createJob("Clone Insurgent ", {
    color = Color(102, 88, 208),
    model = {
        "models/gonzo/tenarshaddaaarmourpack/forgottenclonearmour/forgottenclonearmour.mdl",
        "models/aotr/sparrow/104th/troopers/evo.mdl",
        "models/defcon/stan/rangerplatoon/ranger.mdl",
        "models/defcon/loudmantis/501/carnivore_trooper.mdl",
        "models/defcon/loudmantis/41/sarlacc_trooper.mdl",
        "models/defcon/stan/1stinfantry/trooper/1stinfantrytrooper.mdl",
        "models/defcon/stan/1stinfantry/specialist/1stspecialist.mdl",
        "models/defcon/stan/1stinfantry/heavy/1stheavytrooper.mdl",
        "models/defcon/stan/1stinfantry/engineer/1stengineertrooper.mdl",
        "models/aotr/sparrow/212th/troopers/trooper.mdl",
        "models/aotr/sparrow/212th/ghostcompany/trooper.mdl",
        
        },
    description = [[
        you are a forgotten veteran of the clone wars mad at being abandoned by the Republic and you're going to do something about it
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_dc15a",
        "rw_sw_dual_dc17",
        "rw_sw_nade_thermal",
        "rw_sw_dc15a_o",
        "rw_sw_dc15s"
    },
    command = "cloneinsurgent",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Hutt Cartel Thug Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_HUTT = DarkRP.createJob("Hutt Cartel Thug", {
    color = Color(67, 117, 79),
    model = {
        "models/gonzo/narshaddaacharacters/droiddealer/droiddealer.mdl",
        
        },
    description = [[
        You are a low-ranking thug within the Hutt Cartel. (VIP)
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_el16",
        "rw_sw_gile44"
    },
    command = "huttcartelmember",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Hutt Cartel",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(350)
        ply:SetMaxHealth(350)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
    end,
})
--[[
    Hutt Cartel officer Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_HUTTOFFICER = DarkRP.createJob("Hutt Cartel Officer", {
    color = Color(67, 117, 79),
    model = "models/gyan7259/geequay_player/geequay_regular_player.mdl",
    description = [[
        You are an officer within the Hutt Cartel. (VIP)
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_el16hfe",
        "rw_sw_blurrg1120",
        "rw_sw_nade_thermal"
    },
    command = "huttcartelofficer",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Hutt Cartel",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Heavy Clone Insurgent  Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CRIMINALSHEAVYCLONE = DarkRP.createJob("Heavy Clone Insurgent ", {
    color = Color(0, 0, 0),
    model = {
        "models/sparrow/republic/clone/commando/foxtrot/demo.mdl",
        "models/sparrow/republic/clone/commando/foxtrot/gregor.mdl",
        "models/sparrow/republic/clone/commando/foxtrot/sniper.mdl",
        "models/sparrow/republic/clone/commando/foxtrot/tech.mdl"
    },
    description = [[
        You are a Decommissioned Clone Commando going to show the Empire your wraith 
    ]],
    weapons = {
        "at_sw_dc17m_original",
        "rw_sw_dc17s",
        "rw_sw_nade_thermal",
        "weapon_empty_hands",
        "rw_sw_electrodagger"
    },
    command = "heavyclone",
    max = 4,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
TEAM_CRIMINALSEMPEROR = DarkRP.createJob("Emperor Butter", {
    color = Color(0, 97, 37),
    model = "models/player/emperor_palpatine.mdl",
    description = [[
        some old homeless man on crack who stole the emperors robes an enemy to any ISB, Naval and Shock who have to deal with this crazy crack head.
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lightsaber"
    },
    command = "emperorbutter",
    max = 1,
    salary = 0,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
    end,
})
--[[
    Rebel Trooper Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CRIMINALSREBEL = DarkRP.createJob("Rebel Trooper", {
    color = Color(76, 0, 255),
    model = {
        "models/npc/hgn/swrp/swrp/rebel_soldier_01.mdl",
        "models/player/hydro/linnea/swbf_rebel_soldiermagma_linnea/swbf_rebel_soldiermagma_linnea.mdl",
        "models/player/hydro/linnea/swbf_rebel_soldiersand_linnea/swbf_rebel_soldiersand_linnea.mdl",
        "models/player/hydro/linnea/swbf_rebel_soldiersnow_linnea/swbf_rebel_soldiersnow_linnea.mdl",
        "models/player/hydro/roger/swbf_rebel_soldiermagma_roger/swbf_rebel_soldiermagma_roger.mdl",
        "models/player/hydro/roger/swbf_rebel_soldiersand_roger/swbf_rebel_soldiersand_roger.mdl",
        "models/player/hydro/roger/swbf_rebel_soldiersnow_roger/swbf_rebel_soldiersnow_roger.mdl"
    },
    description = [[
        Rebel Trooper fighting to free the galaxy from the grasp of the Emperor and his empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_a280",
        "rw_sw_dh17",
        "rw_sw_nade_thermal",
        "rw_sw_nade_smoke"
    },
    command = "rebeltrooper",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
    end,
})
--[[
    Rebel Commander Job
    Generated using: DarkRP | Job Generator
    https://yourdevtools.com/gmod/darkrp-job
--]]

TEAM_CRIMINALSREBELCOMMANDER = DarkRP.createJob("Rebel Commander", {
    color = Color(76, 0, 255),
    model = {
        "models/npc/hgn/swrp/swrp/rebel_soldier_01.mdl",
        "models/player/hydro/linnea/swbf_rebel_soldiermagma_linnea/swbf_rebel_soldiermagma_linnea.mdl",
        "models/player/hydro/linnea/swbf_rebel_soldiersand_linnea/swbf_rebel_soldiersand_linnea.mdl",
        "models/player/hydro/linnea/swbf_rebel_soldiersnow_linnea/swbf_rebel_soldiersnow_linnea.mdl",
        "models/player/hydro/roger/swbf_rebel_soldiermagma_roger/swbf_rebel_soldiermagma_roger.mdl",
        "models/player/hydro/roger/swbf_rebel_soldiersand_roger/swbf_rebel_soldiersand_roger.mdl",
        "models/player/hydro/roger/swbf_rebel_soldiersnow_roger/swbf_rebel_soldiersnow_roger.mdl"
    },
    description = [[
        a Rebel Commander leading rebels in the fight to free the galaxy from the grasp of the Emperor and his empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "rw_sw_a280",
        "rw_sw_dh17",
        "rw_sw_nade_thermal",
        "rw_sw_dlt20a",
        "rw_sw_nade_stun"
    },
    command = "rebelcommander",
    max = 0,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Criminals",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(600)
        ply:SetMaxHealth(600)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
    end,
})
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN
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
DarkRP.addHitmanTeam(TEAM_BOUNTY)