CYBERNETIC_AUGMENTATIONS = CYBERNETIC_AUGMENTATIONS or {}
CYBERNETIC_AUGMENTATIONS_PLAYERS = CYBERNETIC_AUGMENTATIONS_PLAYERS or {}
CYBERNETIC_AUGMENTATIONS_DATA = CYBERNETIC_AUGMENTATIONS_DATA or {}

CYBERNETIC_AUGMENTATIONS.Skins = CYBERNETIC_AUGMENTATIONS.Skins or {}
CYBERNETIC_AUGMENTATIONS.Languages = CYBERNETIC_AUGMENTATIONS.Languages or {}
CYBERNETIC_AUGMENTATIONS.Abilities = CYBERNETIC_AUGMENTATIONS.Abilities or {}

CYBER_AUGS_RH = 2
CYBER_AUGS_LH = 4
CYBER_AUGS_RL = 8
CYBER_AUGS_LL = 16

CYBER_AUGS_SLOTS_TO_BITS = {
	[1] = CYBER_AUGS_RH,
	[2] = CYBER_AUGS_LH,
	[3] = CYBER_AUGS_RL,
	[4] = CYBER_AUGS_LL,
}

local language_folder = "geralts_augmentations/languages/"
local languages = file.Find(language_folder .. "*.lua", "LUA")
for id, name in next, languages do
	if SERVER then
		AddCSLuaFile(language_folder .. name)
		include(language_folder .. name)
	else
		include(language_folder .. name)
	end
end

if SERVER then -- we need to keep this order
	include("geralts_augmentations/sh_config.lua")
	include("geralts_augmentations/sh_functions.lua")
	include("geralts_augmentations/sh_items.lua")
	
	AddCSLuaFile("geralts_augmentations/sh_config.lua")
	AddCSLuaFile("geralts_augmentations/sh_functions.lua")
	AddCSLuaFile("geralts_augmentations/sh_items.lua")
else
	include( "geralts_augmentations/sh_config.lua" )
	include( "geralts_augmentations/sh_functions.lua" )
	include( "geralts_augmentations/sh_items.lua" )
end

local skins_folder = "geralts_augmentations/client/skins/"
local skins = file.Find(skins_folder .. "*.lua", "LUA")
for id, name in next, skins do
	if SERVER then
		AddCSLuaFile(skins_folder .. name)
	else
		include(skins_folder .. name)
	end
end

if SERVER then 
	include("geralts_augmentations/server/sv_augs.lua")
	include("geralts_augmentations/server/sv_mysql.lua")
	include("geralts_augmentations/server/sv_txt.lua")

	AddCSLuaFile( "geralts_augmentations/client/cl_aug_draw.lua" )
	AddCSLuaFile( "geralts_augmentations/client/cl_aug_main.lua" )
	AddCSLuaFile( "geralts_augmentations/client/cl_aug_ui_lib.lua" )
	AddCSLuaFile( "geralts_augmentations/client/cl_aug_hud.lua" )

	local abilities_folder = "geralts_augmentations/server/abilities/"
	local abilities = file.Find(abilities_folder .. "*.lua", "LUA")
	for id, name in next, abilities do
		include(abilities_folder .. name)
	end
else 
	include( "geralts_augmentations/client/cl_aug_draw.lua" )
	include( "geralts_augmentations/client/cl_aug_main.lua" )
	include( "geralts_augmentations/client/cl_aug_ui_lib.lua" )
	include( "geralts_augmentations/client/cl_aug_hud.lua" )
end