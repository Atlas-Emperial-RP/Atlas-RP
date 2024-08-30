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

--- [ATLAS IMPERIAL RP RECRUIT JOBS] ---

TEAM_RECRUIT = DarkRP.createJob("Recruit", {
    color = Color(156, 143, 58),
    model = "models/nada/pms/male/ScienceOfficer.mdl",
    description = [[
        Recruit of the Empire
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
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
    end,
})

--- [ATLAS IMPERIAL RP IMPERIAL ARMY JOBS] ---

TEAM_IMPERIALARMYENL = DarkRP.createJob("Imperial Army Enlisted", {
    color = Color(0, 148, 57),
   model = {
        "models/nada/MudTrooper_M.mdl",
        "models/nada/MudTrooper_F.mdl",
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl"
    },
    description = [[
        Imperial Army of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
        ply:GiveAmmo(200, "ar2");
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
        Imperial Army of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "ia_e10_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
        ply:GiveAmmo(200, "ar2");
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
        Imperial Army of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "ia_e10_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",

        "alydus_fortificationbuildertablet",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
        ply:GiveAmmo(200, "ar2");
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
        Imperial Army of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "ia_e11_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
        ply:GiveAmmo(200, "ar2");
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
        Imperial Army of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "ia_e11_atlas",
        "ia_ec17_atlas",
        "arccw_thermal_grenade",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
        ply:GiveAmmo(200, "ar2");
    end,
})

TEAM_IMPERIALARMYENGINEER =  DarkRP.createJob("Imperial Army Engineer", {
    color = Color(0, 148, 57),
   model = {
        "models/nada/MudTrooper_M.mdl",
        "models/nada/MudTrooper_F.mdl",
        "models/nada/ArmyTrooper_M.mdl",
        "models/nada/ArmyTrooper_F.mdl"
    },
    description = [[
        Imperial Army of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "ia_e10_atlas",
        "ia_ec17_atlas"
    },
    command = "imparmyengeneer",
    max = 0,
    salary = 25,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Army",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(200)
        ply:SetRunSpeed(300)
        ply:GiveAmmo(200, "ar2");
    end,
})
--- [ATLAS IMPERIAL RP STORM TROOPER JOBS] ---

TEAM_STORMTROOPERSENL = DarkRP.createJob("Storm Trooper Enlisted", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSSGT = DarkRP.createJob("Storm Trooper Sergeant", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSOFFICER = DarkRP.createJob("Storm Trooper Officer", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "st_e11_atlas",
        "st_dc17_atlas",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSCOMMAND = DarkRP.createJob("Storm Trooper Command", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "st_e22_atlas",
        "st_dc17_atlas",

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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSCOMMANDER = DarkRP.createJob("Storm Trooper Commander", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "st_e22_atlas",
        "st_hunter_shotgun_atlas", --- Replace with hunter shot

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})

TEAM_STORMTROOPERSFLAME = DarkRP.createJob("Flame Trooper", {
    color = Color(13, 0, 255),
    model = "models/nada/FlameTrooper.mdl",
    description = [[
        Flame Trooper of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSSCOUT = DarkRP.createJob("Scout Trooper", {
    color = Color(13, 0, 255),
    model = {
        "models/nada/ScoutTrooper_M.mdl",
        "models/nada/ScoutTrooper_F.mdl"
    },
    description = [[
        Scout Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "st_e11_atlas",
        "st_e11s_atlas",
        "st_ec17_atlas",

        "realistic_hook",
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(350)
        ply:SetRunSpeed(525)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSJT = DarkRP.createJob("Jump Trooper", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
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
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSENGINEER = DarkRP.createJob("Storm Trooper Engineer", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "st_e11_atlas",
        "st_dc17_atlas",
        "st_dp23_atlas",

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
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_STORMTROOPERSHEAVY = DarkRP.createJob("Heavy Trooper", {
    color = Color(13, 0, 255),
    model = "models/nada/rogueonetk.mdl",
    description = [[
        Stormtrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "st_dlt19_atlas",

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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(400)
        ply:SetMaxArmor(400)
        ply:SetWalkSpeed(90)
        ply:SetRunSpeed(135)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP SHORE TROOPER JOBS] ---

TEAM_SHORESGT = DarkRP.createJob("Shore Trooper Sergeant", {
    color = Color(255, 149, 0),
    model = "models/nada/ShoreTrooper_Andor.mdl",
    description = [[
        Shoretrooper of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHOREOFFICER = DarkRP.createJob("Shore Trooper Officer", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_Captain.mdl",
    description = [[
        Shoretrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shore_e22_atlas",
        "shore_rk3_atlas",

        "arccw_nade_inc",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHORECOMMAND = DarkRP.createJob("Shore Trooper Command", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_Mortar.mdl",
    description = [[
        Shoretrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shore_e22_atlas",
        "shore_dual_rk3_atlas",

        "arccw_nade_inc",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHORECOMMANDER = DarkRP.createJob("Shore Trooper Commander", {
    color = Color(255, 149, 0),
    model = "models/nada/Shoretrooper_SquadLeader.mdl",
    description = [[
        Shoretrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shore_e22_atlas",
        "shore_dual_rk3_atlas",

        "arccw_nade_inc",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP NOVA TROOPER JOBS] ---

TEAM_NOVASGT = DarkRP.createJob("Nova Trooper Sergeant", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "nova_t21_atlas",
        "nova_rk3_atlas",

        "arccw_flash_grenade",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NOVAOFFICER = DarkRP.createJob("Nova Trooper Officer", {
    color = Color(255, 232, 82),
    model = "models/nada/rogueonenova.mdl",
    description = [[
        Nova Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "nova_t21_atlas",
        "nova_rk3_atlas",
        "alydus_fusioncutter",

        "arccw_flash_grenade",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NOVACOMMAND = DarkRP.createJob("Nova Trooper Command", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "nova_t21_command_atlas",
        "nova_rk3_atlas",
        "alydus_fusioncutter",

        "arccw_flash_grenade",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NOVACOMMANDER = DarkRP.createJob("Nova Trooper Commander", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "nova_t21_command_atlas",
        "nova_rk3_atlas",
        "alydus_fusioncutter",

        "arccw_flash_grenade",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NOVAMEDIC = DarkRP.createJob("Nova Trooper Commander", {
    color = Color(255, 232, 82),
    model = {
        "models/nada/rogueonenova.mdl",
        "models/nada/rogueonenovaelite.mdl"
    },
    description = [[
        Nova Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "nova_t21_atlas",
        "nova_rk3_atlas",

        "weapon_bactainjector",
    },
    command = "novamedic",
    max = 0,
    salary = 50,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Nova Corp",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP SHADOW TROOPER JOBS] ---

TEAM_SHADOWSGT = DarkRP.createJob("Shadow Trooper Sergeant", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shadow_t21_atlas",
        "shadow_se14_atlas",

        "cloaking-infinite",
        "arccw_smoke_grenade",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHADOWOFFICER = DarkRP.createJob("Shadow Trooper Officer", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shadow_t21_atlas",
        "shadow_se14_atlas",

        "cloaking-infinite",
        "arccw_smoke_grenade",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHADOWCOMMAND = DarkRP.createJob("Shadow Trooper Command", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shadow_t21_atlas",
        "arccw_dual_se14",

        "cloaking-infinite",
        "rw_sw_bino_dark",
        "arccw_smoke_grenade",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHADOWCOMMANDER = DarkRP.createJob("Shadow Trooper Commander", {
    color = Color(74, 73, 75),
    model = "models/nada/rogueoneshadow.mdl",
    description = [[
        Shadow Corp of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shadow_t21_atlas",
        "arccw_dual_se14",

        "cloaking-infinite",
        "rw_sw_bino_dark",
        "arccw_smoke_grenade",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP SHOCK TROOPER JOBS] ---

TEAM_SHOCKTROOPER = DarkRP.createJob("Shock Trooper Enlisted", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shock_dlt19_atlas",
        "shock_dl44_atlas",
        "shock_rk3_atlas",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHOCKSGT = DarkRP.createJob("Shock Trooper Sergeant", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shock_dlt19_atlas",
        "shock_dl44_atlas",
        "shock_rk3_atlas",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHOCKOFFICER = DarkRP.createJob("Shock Trooper Officer", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock Trooper of the Empire
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHOCKCOMMAND = DarkRP.createJob("Shock Trooper Command", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock Trooper of the Empire
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHOCKCOMMANDER = DarkRP.createJob("Shock Trooper Commander", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock Commander of the Empire
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})

TEAM_SHOCKRIOTCONTROL = DarkRP.createJob("Shock Trooper Commander", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock Riot Control of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shock_e11_atlas",
        "shock_rk3_atlas",
        "rw_sw_shield_imp",

        "weapon_r_handcuffs",
        "arrest_stick",
        "unarrest_stick",
        "",

        "arrcw_shock_grenade",
    },
    command = "shockriotcontrol",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_SHOCKAIU = DarkRP.createJob("Shock Trooper Commander", {
    color = Color(255, 0, 0),
    model = "models/nada/RogueOneShock.mdl",
    description = [[
        Shock AIU of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "shock_rk3_atlas",

        "weapon_r_handcuffs",
        "dt_decrypter",
        "dt_encrypter",
        
        "arrcw_shock_grenade",
    },
    command = "shockaiu",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Shock Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP MEDICAL TROOPER JOBS] ---

TEAM_MEDICALENLISTED = DarkRP.createJob("Medical Trooper Enlisted", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Trooper of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_MEDICALSGT = DarkRP.createJob("Medical Trooper Sergeant", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Trooper of the Empire
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
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_MEDICALOFFICER = DarkRP.createJob("Medical Trooper Officer", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl"
    },
    description = [[
        Medical Trooper of the Empire
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_MEDICALCOMMAND = DarkRP.createJob("Medical Trooper Command", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl",
        "models/nada/RogueOneMedic.mdl"
    },

    description = [[
        Medical Trooper of the Empire
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_MEDICALCOMMANDER = DarkRP.createJob("Medical Trooper Commander", {
    color = Color(80, 101, 211),
    model = {
        "models/nada/male/MedicalTrooper.mdl",
        "models/nada/female/MedicalTrooper.mdl",
        "models/nada/RogueOneMedic.mdl"
    },
    description = [[
        Medical Trooper of the Empire
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP DEATH TROOPER JOBS] ---

TEAM_DEATHTROOPEREN = DarkRP.createJob("Death Trooper Enlisted", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "dt_e11d_atlas",
        "dt_se14_atlas",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_DEATHTROOPERSGT = DarkRP.createJob("Death Trooper Sergeant", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "dt_e11d_atlas",
        "dt_se14_atlas",

        "dt_encrypter",
        "dt_decrypter",

        "weapon_r_handcuffs",
        
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_DEATHTROOPEROFFICER = DarkRP.createJob("Death Trooper Officer", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        
        "dt_e11d_atlas",
        "dt_se14_atlas",

        "dt_encrypter",
        "dt_decrypter",

        "weapon_r_handcuffs",

        "zeus_flashbang",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_DEATHTROOPERCOMMAND = DarkRP.createJob("Death Trooper Command", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "dt_e11d_atlas",
        "arccw_dual_se14",

        "weapon_r_handcuffs",

        "dt_encrypter",
        "dt_decrypter",

        "zeus_flashbang",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_DEATHTROOPERCOMMANDER = DarkRP.createJob("Death Trooper Commander", {
    color = Color(8, 99, 26),
    model = "models/nada/DeathTrooperScaled.mdl",
    description = [[
        DeathTrooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "dt_e11d_atlas",
        "arccw_dual_se14",

        "weapon_r_handcuffs",

        "dt_encrypter",
        "dt_decrypter",

        "zeus_flashbang",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP PURGE TROOPER JOBS] ---

TEAM_PURGEENL = DarkRP.createJob("Purge Trooper Enlisted", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "purge_dc15s_atlas",
        "purge_dc17_atlas",

        "sfw_estaff",
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_PURGESGT = DarkRP.createJob("Purge Trooper Sergeant", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        
        "purge_e11d_atlas",
        "purge_dc17_atlas",

        "sfw_estaff",

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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_PURGEOFFICER = DarkRP.createJob("Purge Trooper Officer", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_PURGECOMMAND = DarkRP.createJob("Purge Trooper Command", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "purge_e11d_atlas",
        "purge_dc17_atlas",

        "arccw_thermal_grenade",
        "sfw_estaff",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_PURGECOMMANDER = DarkRP.createJob("Purge Trooper Commander", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "purge_e11d_atlas",
        "purge_dc17_atlas",

        "arccw_thermal_grenade",
        "sfw_estaff",
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_PURGEMEDIC = DarkRP.createJob("Purge Medic", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "purge_e11d_atlas",
        "purge_dc17_atlas",

        "weapon_bactainjector",
    },
    command = "purgemedic",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_PURGEFLAMER = DarkRP.createJob("Purge Flamer", {
    color = Color(170, 9, 9),
    model = "models/nada/purgetrooperphase2.mdl",
    description = [[
        Purge Trooper of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "purge_e11d_atlas",
        "purge_dc17_atlas",

        "arccw_thermal_grenade",
        "sfw_estaff",
        "weapon_imperial_flamethrower"
    },
    command = "purgeflamer",
    max = 0,
    salary = 250,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Purge Troopers",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP ISB JOBS] ---

TEAM_ISB = DarkRP.createJob("ISB Agent", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
       ISB Agent of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "isb_rk3_atlas",
        "isb_e11d_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        "stunstick",
        
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(25)
        ply:SetMaxArmor(25)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_ISBWO = DarkRP.createJob("ISB Warrant Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        ISB Agent of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "isb_rk3_atlas",
        "isb_e11d_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        "stunstick",

        "arrcw_shock_grenade"
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
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_ISBOFFICER = DarkRP.createJob("ISB Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        ISB Agent of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "isb_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        "stunstick",

        "arrcw_shock_grenade"
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(75)
        ply:SetMaxArmor(75)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_ISBCOMMAND = DarkRP.createJob("ISB Command", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        ISB Agent of the Empire 
    ]],
    weapons = {
        "weapon_empty_hands",
        "isb_duel_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        "stunstick",

        "arrcw_shock_grenade"
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_ISBDEPUTYDIRECTOR = DarkRP.createJob("ISB Deputy Director", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        ISB Agent of the Empire 
    ]],
    weapons = {
        "weapon_empty_hands",
        "isb_duel_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        "stunstick",

        "arrcw_shock_grenade"
    },
    command = "isbdeputydirector",
    max = 0,
    salary = 350,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_ISBDIRECTOR = DarkRP.createJob("ISB Director", {
    color = Color(10, 0, 194),
    model = {
        "  models/nada/pms/female/isb.mdl",
        "models/nada/pms/male/isb.mdl"
    },
    description = [[
        ISB Agent of the Empire 
    ]],
    weapons = {
        "weapon_empty_hands",
        "isb_director_rk3_atlas",
        "isb_e11d_atlas",
        "isb_e11s_atlas",

        "dt_decrypter",
        "dt_encrypter",
        "weapon_r_handcuffs",
        "stunstick",

       "arrcw_shock_grenade"
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})

TEAM_ISBCOLONEL = DarkRP.createJob("ISB Colonel", {
    color = Color(0, 0, 0),
    model = {
        "models/nada/pms/male/imperialweapontechnician.mdl",
        "models/nada/NavyCommando.mdl",
        "models/nada/deathtrooper.mdl",
        "models/nada/RogueOneTriton.mdl",
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

        "arrcw_shock_grenade",
        "arccw_btrs_41"
        
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
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_ISBSECRETARY = DarkRP.createJob("ISB Secretary", {
    color = Color(0, 0, 0),
    model = {
        "models/nada/pms/male/ISBAttendant.mdl",
        "models/nada/pms/female/ISBAttendant.mdl",
        "models/nada/pms/male/imperialweapontechnician.mdl",
        "models/nada/NavyCommando.mdl",
        "models/nada/deathtrooper.mdl",
        "models/nada/RogueOneTriton.mdl",
    },
    description = [[
        ISB Secretary a jack of certain trades 
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

        "arrcw_shock_grenade",
        "arccw_btrs_41"
        
    },
    command = "isbsecretary",
    max = 1,
    salary = 500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Imperial Security Bureau ",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetArmor(125)
        ply:SetMaxArmor(125)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP INQUISITOR JOBS] ---

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
        Junior Inquisitor of the Empire
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
        ply:SetHealth(750)
        ply:SetMaxHealth(750)
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
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
        Inquisitor of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs", 
        "weapon_r_handcuffs",
        "inq_se14_atlas"
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
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
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
        Senior Inquisitor of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs", 
        "weapon_r_handcuffs",
        "inq_se14_atlas"
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
        ply:SetHealth(750)
        ply:SetMaxHealth(750)
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
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
        "inq_se14_atlas"
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
        ply:SetHealth(750)
        ply:SetMaxHealth(750)
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
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
        "inq_se14_atlas"
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
        ply:SetHealth(750)
        ply:SetMaxHealth(750)
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_INQUISITORROYAL = DarkRP.createJob("Royal Guard", {
    color = Color(240, 0, 0),
    model = {
        "models/epangelmatikes/royalguard/royal_guard.mdl"
    },
    description = [[
        A Royal Guard of Emperor Palpatine
    ]],
    weapons = {
        "weapon_empty_hands",

        "inq_cr2_atlas",
        "inq_t21_atlas",

        "Item_saberhilt_staffel",
        "Weapon_squadshield_arm",
        "Rw_sw_shield_imp",
        "Arccw_thermal_grenade",
        "arccw_shock_grenade"

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
        ply:SetHealth(750)
        ply:SetMaxHealth(750)
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
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

        "inq_se14_atlas",
        "high_command_dt29_atlas",

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
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(500)
        ply:SetMaxArmor(500)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_INQUSITOREMPEROR = DarkRP.createJob("The Emperor", {
    color = Color(10, 0, 194),
    model = "models/player/emperor_palpatine.mdl",
    description = [[
        The Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "weapon_lscs", 
        "weapon_r_handcuffs",

        "inq_se14_atlas",
        "high_command_dt29_atlas",

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
        ply:SetHealth(2000)
        ply:SetMaxHealth(2000)
        ply:SetArmor(1000)
        ply:SetMaxArmor(1000)
        ply:SetWalkSpeed(150)
        ply:SetRunSpeed(225)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP NAVY JOBS] ---

TEAM_NAVAL = DarkRP.createJob("Naval Crewman", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Crewman of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        "naval_cr2_atlas",

        "weapon_r_handcuffs",
        "arccw_thermal_grenade",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
    },
    command = "navalcrewman",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NAVALPO = DarkRP.createJob("Naval Petty Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Petty Officer of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        "naval_cr2_atlas",

        "weapon_r_handcuffs",
        "arccw_thermal_grenade",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
    },
    command = "navalpo",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(125)
        ply:SetMaxHealth(125)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NAVALWO = DarkRP.createJob("Naval Warrant Officer", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Warrant Officer of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        "naval_cr2_atlas",

        "weapon_r_handcuffs",
        "arccw_thermal_grenade",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
    },
    command = "navalofficer",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
    end,
})
TEAM_NAVALCAPTAIN = DarkRP.createJob("Naval Captain/Lieutenant", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Captain/Lieutenant of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        "naval_cr2_atlas",

        "weapon_r_handcuffs",
        "arccw_thermal_grenade",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
    },
    command = "navalcaptain",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(150)
        ply:SetMaxHealth(150)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NAVALCHIEF = DarkRP.createJob("Naval Command", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Chief of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        "naval_cr2_atlas",

        "weapon_r_handcuffs",
        "arccw_thermal_grenade",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
    },
    command = "navalchief",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(200)
        ply:SetMaxHealth(200)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NAVALDIRECTOR = DarkRP.createJob("Naval Director", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Director of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        "naval_cr2_atlas",
        
        "weapon_r_handcuffs",
        "arccw_thermal_grenade",
        "arrest_stick",
        "stunstick",
        "unarrest_stick",
    },
    command = "navalcommand",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(200)
        ply:SetMaxHealth(200)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_NAVALPILOT = DarkRP.createJob("Tie Pilot", {
    color = Color(10, 0, 194),
    model = {
        "models/nada/pms/male/navy_trooper.mdl",
        "models/nada/pms/female/navy_trooper.mdl"
    },
    description = [[
       Naval Director of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "naval_rk3_atlas",
        
        "weapon_r_handcuffs",
    },
    command = "navaltiepilot",
    max = 0,
    salary = 100,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Naval Agency",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(100)
        ply:SetMaxHealth(100)
        ply:SetArmor(50)
        ply:SetMaxArmor(50)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP HIGH COMMAND JOBS] ---

TEAM_HIGHCOMMANDENSIGN = DarkRP.createJob("Ensign/Lieutenant", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/naval_officer.mdl",
        "models/nada/pms/female/naval_officer.mdl"
    },
    description = [[
        High Command of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        
        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "fleetEL",
    max = 0,
    salary = 748,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANDCAPTAIN = DarkRP.createJob("Captain/Major", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/medic.mdl",
        "models/nada/pms/female/medic.mdl"
    },
    description = [[
        High Command of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "fleetCM",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(300)
        ply:SetMaxHealth(300)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANDCOLONEL = DarkRP.createJob("Colonel/Commodore", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/army.mdl", "models/nada/pms/female/army.mdl"
    },
    description = [[
        High Command of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "fleetCC",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
    end,
})
TEAM_HIGHCOMMANDREAR = DarkRP.createJob("Rear Admiral/Vice Admiral", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/admiral.mdl",
        "models/nada/pms/female/admiral.mdl"
    },
    description = [[
        High Command of the Empire 
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "fleetRV",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANBRIGADIER = DarkRP.createJob("Brigadier General/ Lieutenant General ", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/grandgeneral.mdl",
        "models/nada/pms/female/grandgeneral.mdl",
    },
    description = [[
        High Command of the Empire 
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "armyBrigadier",
    max = 0,
    salary = 750,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(400)
        ply:SetMaxHealth(400)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANDADMIRAL = DarkRP.createJob("Admiral/High Command Admiral", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/grey_admiral.mdl",
        "models/nada/pms/female/grey_admiral.mdl"
    },
    description = [[
        High Command of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "fleetAF",
    max = 0,
    salary = 1000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANDGENERAL = DarkRP.createJob("General/High General", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/commandant.mdl",
        "models/nada/pms/female/commandant.mdl",

    },
    description = [[
        High Command of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "armyGeneral",
    max = 0,
    salary = 1000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANDGRANDADMIRAL = DarkRP.createJob("Grand Admiral/Grand General", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/male/grandadmiral.mdl",
        "models/nada/pms/female/grandadmiral.mdl",
    },
    description = [[
        Grand Admiral of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "fleetGA",
    max = 2,
    salary = 2500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_HIGHCOMMANDGRANDGENERAL = DarkRP.createJob("Grand General", {
    color = Color(192, 193, 123),
    model = {
        "models/nada/pms/female/warlord.mdl", 
        "models/nada/pms/male/warlord.mdl"
    },
    description = [[
        Grand Admiral of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "high_command_dt29_atlas",
        "high_command_e11d_atlas"
    },
    command = "armyGrandGeneral",
    max = 2,
    salary = 2500,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "High Command",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(500)
        ply:SetMaxHealth(500)
        ply:SetWalkSpeed(250)
        ply:SetRunSpeed(375)
        ply:GiveAmmo(200, "ar2");
    end,
})

-- [ATLAS IMPERIAL RP SQUAD JOBS] ---

TEAM_INFERNOMEMBER = DarkRP.createJob("Inferno Squad Member", {
    color = Color(126, 1, 1),
    model = {
    "models/pilot/inferno_squad_pilot.mdl",
    "models/crewman/inferno_squad_crewman.mdl"
    
    },
    description = [[
        Inferno Squad of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "inferno_e11d_atlas",
        "inferno_westar35_atlas",

        "arccw_impact_grenade",
        "arccw_smoke_grenade",
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
        ply:SetHealth(200)
        ply:SetMaxHealth(200)
        ply:SetArmor(100)
        ply:SetMaxArmor(100)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_INFERNOSUB = DarkRP.createJob("Inferno Squad Sub Leader", {
    color = Color(126, 1, 1),
    model = {
    "models/pilot/inferno_squad_pilot.mdl",
    "models/crewman/inferno_squad_crewman.mdl"
    
    },
    description = [[
        Inferno Squad of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "inferno_e11d_atlas",
        "inferno_dual_westar35_atlas",

        "arccw_impact_grenade",
        "arccw_smoke_grenade",
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
        ply:SetHealth(200)
        ply:SetMaxHealth(200)
        ply:SetArmor(150)
        ply:SetMaxArmor(150)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_INFERNOSL = DarkRP.createJob("Inferno Squad Leader", {
    color = Color(126, 1, 1),
    model = {
    "models/pilot/inferno_squad_pilot.mdl",
    "models/crewman/inferno_squad_crewman.mdl"
    
    },
    description = [[
        Inferno Squad of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",

        "inferno_e11d_atlas",
        "inferno_dual_westar35_atlas",
        "inferno_dlt20a_atlas",

        "arccw_impact_grenade",
        "arccw_smoke_grenade",
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
        ply:SetHealth(200)
        ply:SetMaxHealth(200)
        ply:SetArmor(200)
        ply:SetMaxArmor(200)
        ply:SetWalkSpeed(190)
        ply:SetRunSpeed(285)
        ply:GiveAmmo(200, "ar2");
    end,
})

--- [ATLAS IMPERIAL RP VIP JOBS] ---

TEAM_BH = DarkRP.createJob("Bounty Hunter", {
    color = Color(225, 0, 255),
    model = "models/player/aussiwozzi/mandalorians/male_mando_red.mdl",
    description = [[
        Free lance Bounty Hunter
    ]],
    weapons = {
        "weapon_empty_hands",
        "bh_e11_atlas"
    },
    command = "bountyhunter",
    max = 9000,
    salary = 9000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Miscellaneous",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(200, "ar2");
    end,
})
TEAM_BH = DarkRP.createJob("Bounty Hunter", {
    color = Color(225, 0, 255),
    model = "models/player/aussiwozzi/mandalorians/male_mando_red.mdl",
    description = [[
        Free lance Bounty Hunter
    ]],
    weapons = {
        "weapon_empty_hands",
        "bh_e11_atlas"
    },
    command = "bountyhunter",
    max = 9000,
    salary = 9000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Miscellaneous",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(999, "ar2");
    end,
})

TEAM_REBEL = DarkRP.createJob("Rebel", {
    color = Color(225, 0, 255),
    model = "models/player/aussiwozzi/mandalorians/male_mando_red.mdl",
    description = [[
        Rebel of the Empire
    ]],
    weapons = {
        "weapon_empty_hands",
        "bh_e11_atlas"
    },
    command = "bountyhunter",
    max = 9000,
    salary = 9000,
    admin = 0,
    vote = false,
    hasLicense = false,
    category = "Miscellaneous",
    canDemote = false,
    PlayerSpawn = function(ply)
        ply:SetHealth(1000)
        ply:SetMaxHealth(1000)
        ply:SetArmor(0)
        ply:SetMaxArmor(0)
        ply:SetWalkSpeed(300)
        ply:SetRunSpeed(450)
        ply:GiveAmmo(999, "ar2");
    end,
})
--- [ATLAS IMPERIAL RP STAFF] ---

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
        ply:GiveAmmo(9999, "ar2");
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
        ply:GiveAmmo(9999, "ar2");
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
        "custom_rocket_jumper",
        "custom_z2_atlas",
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
        ply:GiveAmmo(9999, "ar2");
    end,
})
--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_RECRUIT
--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_BH)