CYBERNETIC_AUGMENTATIONS.CurrentLanguage = "en" -- available: en, ru

CYBERNETIC_AUGMENTATIONS.MoneySystem = true
CYBERNETIC_AUGMENTATIONS.Skin = "cyberpunk"
CYBERNETIC_AUGMENTATIONS.Database = "txt" -- data method. Available: MySQL and txt, not sensitive to case. To edit MySQL database parameters - go to geralts_augmentations/sv_mysql.lua
CYBERNETIC_AUGMENTATIONS.EnableBlur = true
CYBERNETIC_AUGMENTATIONS.Currency = "$" -- this currency will be used if you don't use any format money function

CYBERNETIC_AUGMENTATIONS.UseRandomPool = false -- if set, augmentations will generate every X amount of time
CYBERNETIC_AUGMENTATIONS.RemoveItemFromStock = true -- if set, augs will be removed after buying from stock

CYBERNETIC_AUGMENTATIONS.AllowPlayersModificate = true -- if set, players can modify their augs from info menu, otherwise, they'll need to go to NPC
CYBERNETIC_AUGMENTATIONS.AllowAbilitiesInVehicle = true
CYBERNETIC_AUGMENTATIONS.UseModelImage = true -- if set, in shop will be displayed model images of augmentations instead of model panels. This will increase FPS
CYBERNETIC_AUGMENTATIONS.InstallTime = 10 -- installation time in seconds

CYBERNETIC_AUGMENTATIONS.MaxParameter = 100
CYBERNETIC_AUGMENTATIONS.MaxChips = 3
CYBERNETIC_AUGMENTATIONS.MaxBuyDistance = 150 -- hammer units
CYBERNETIC_AUGMENTATIONS.PassiveEnergyRestore = 2 -- per second
CYBERNETIC_AUGMENTATIONS.MaxEnergy = 100
CYBERNETIC_AUGMENTATIONS.PaintPrice = 500
CYBERNETIC_AUGMENTATIONS.RepairPrice = 5 -- how much per percent. For 50% repair it will be X * 50.

CYBERNETIC_AUGMENTATIONS.LimbsDamageMultiply = 0.05 -- that means 5% of applied damage will affect aug's health
CYBERNETIC_AUGMENTATIONS.LimbsWorkLimit = 15 -- if hp is below that, aug will not work, write -1 if you want to disable it

CYBERNETIC_AUGMENTATIONS.HideSandboxHUD = true

--for enums, check this page: https://wiki.facepunch.com/gmod/Enums/KEY
CYBERNETIC_AUGMENTATIONS.DefaultHotkeys = {
	Visor = KEY_N,
	Cloak = KEY_L,
	InfoKey = KEY_I, -- this key will open information menu
}

CYBERNETIC_AUGMENTATIONS.NPCs = {
	{
		Model = "models/Kleiner.mdl",
		Name = "Viktor Vector",
		Color = Color(220, 32, 65),
	},
}

CYBERNETIC_AUGMENTATIONS.UISounds = {
	Hover = "geralts_augmentations/button_hover.wav",
	Click1 = "geralts_augmentations/button_click1.wav",
	Click2 = "geralts_augmentations/button_click2.wav",
	PaintSound = "geralts_augmentations/paint_sound.wav",
	RepairSound = "geralts_augmentations/repair_sound.wav",
}

CYBERNETIC_AUGMENTATIONS.DamageTypeIcons = {
	[DMG_BULLET] = Material("geralts_augmentations/ui/bullet.png"),
	[DMG_BUCKSHOT] = Material("geralts_augmentations/ui/buckshot.png"),
	[DMG_BLAST] = Material("geralts_augmentations/ui/explosion.png"),
	[DMG_FALL] = Material("geralts_augmentations/ui/fall_damage.png"),
}

CYBERNETIC_AUGMENTATIONS.ExtraContent = {
	["Mecha Set"] = false,
}

CYBER_AUGS_LANGUAGE = CYBERNETIC_AUGMENTATIONS.Languages[CYBERNETIC_AUGMENTATIONS.CurrentLanguage] -- made for comfortable use of table

--1.0.2 update
CYBERNETIC_AUGMENTATIONS.WipeOnDeath = false -- shall augmentations wipe when player dies?
CYBERNETIC_AUGMENTATIONS.WipeOnDisconnect = false -- shall augmentations wipe when player disconnects?

--1.0.4 update
CYBERNETIC_AUGMENTATIONS.InvalidModels = { -- add models which are having problem with invisible limbs
	-- ["models/player/zhidus/jedi/human/human.mdl"] = true, -- example how to add models
}

--1.0.6 update
CYBERNETIC_AUGMENTATIONS.AllowHideAugmentations = true
CYBERNETIC_AUGMENTATIONS.AllowCoverAugmentations = true
CYBERNETIC_AUGMENTATIONS.AllowSellAugmentations = true
CYBERNETIC_AUGMENTATIONS.SellMoneyMultiply = 0.5
CYBERNETIC_AUGMENTATIONS.SellDonateMultiply = 0.1
CYBERNETIC_AUGMENTATIONS.HideThighs = false -- looks kinda good with some models, so you might like it more