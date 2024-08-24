att.PrintName = "Rocket Jumper Rockets"
att.Icon = Material("entities/acwatt_ammo_rpg7_he.png")
att.Description = "Funny rockets that do not deal damage."
att.Desc_Pros = {
    "- You take no damge from your own rockets",
}
att.Desc_Cons = {
    "- You do not deal damage with your rockets",
}
att.AutoStats = true
att.Slot = "ammo_atlas_rocket"

att.Mult_SightTime = 0.9
att.Mult_MoveSpeed = 1.15

att.Override_ShootEntity = "custom_rocket_jumper"