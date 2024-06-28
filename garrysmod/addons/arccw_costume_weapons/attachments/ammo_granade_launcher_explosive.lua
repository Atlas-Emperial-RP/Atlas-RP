att.PrintName = "Grenade Launcher Explosive"
att.Icon = Material("entities/acwatt_ammo_rpg7_he.png")
att.Description = "Load high explosive rockets that have a greater splash radius but no HEAT jet, reducing impact damage."
att.Desc_Pros = {
    "Bounces off surfaces",
    "Rolls on ground",
    "Large Splash Radius",
}
att.Desc_Cons = {
    "Reduced Impact Damage",
    "Longer reload time",
    "Long arming time",
    "No explosion on direct impact",
}
att.AutoStats = true
att.Slot = "ammo_grenade_launcher"

att.Mult_SightTime = 0.9
att.Mult_MoveSpeed = 1.15

att.Override_ShootEntity = "costum_grenade_roller"