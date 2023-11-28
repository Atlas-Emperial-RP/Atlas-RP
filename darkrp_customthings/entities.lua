--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
    Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
https://darkrp.miraheze.org/wiki/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]
	DarkRP.createEntity("Bed", {
		ent = "bed_medicmod",
		model = "models/medicmod/hospital_bed/hospital_bed.mdl",
		price = 50,
		max = 0,
		cmd = "buybed",
		allowed =  {TEAM_MEDICALTROOPER, TEAM_MEDICALSERGEANT, TEAM_MEDICALOFFICER, TEAM_MEDICALCOMMAND, TEAM_MEDICALCOMMANDER},
    category = "Medical Supplies", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 100, -- The position of this thing in its category. Lower number means higher up.
    allowTools = false, -- Whether players (including superadmins!) are allowed to use other tools than just remover. Defaults to false
	})

	DarkRP.createEntity("Beaker", {
		ent = "beaker_medicmod",
		model = "models/medicmod/beaker/beaker.mdl",
		price = 50,
		max = 0,
		cmd = "buybeaker",
		allowed =  {TEAM_MEDICALTROOPER, TEAM_MEDICALSERGEANT, TEAM_MEDICALOFFICER, TEAM_MEDICALCOMMAND, TEAM_MEDICALCOMMANDER},
    category = "Medical Supplies", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 100, -- The position of this thing in its category. Lower number means higher up.
    allowTools = false, -- Whether players (including superadmins!) are allowed to use other tools than just remover. Defaults to false
	})
	
	DarkRP.createEntity("Drug pot", {
		ent = "drug_medicmod",
		model = "models/medicmod/drug/drug.mdl",
		price = 100,
		max = 2,
		cmd = "buydrugpot",
		allowed = {TEAM_MEDICALTROOPER, TEAM_MEDICALSERGEANT, TEAM_MEDICALOFFICER, TEAM_MEDICALCOMMAND, TEAM_MEDICALCOMMANDER},
    category = "Medical Supplies", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 100, -- The position of this thing in its category. Lower number means higher up.
    allowTools = false, -- Whether players (including superadmins!) are allowed to use other tools than just remover. Defaults to false
	})
	
	DarkRP.createEntity("Blood bag", {
		ent = "bloodbag_medicmod",
		model = "models/medicmod/bloodbag/bloodbag.mdl",
		price = 10,
		max = 0,
		cmd = "buybloodbag",
		allowed = {TEAM_MEDICALTROOPER, TEAM_MEDICALSERGEANT, TEAM_MEDICALOFFICER, TEAM_MEDICALCOMMAND, TEAM_MEDICALCOMMANDER},
    category = "Medical Supplies", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 100, -- The position of this thing in its category. Lower number means higher up.
    allowTools = false, -- Whether players (including superadmins!) are allowed to use other tools than just remover. Defaults to false
	})	
	
	DarkRP.createEntity("Drip", {
		ent = "drip_medicmod",
		model = "models/medicmod/medical_stand/medical_stand.mdl",
		price = 100,
		max = 0,
		cmd = "buydrip",
		allowed =  {TEAM_MEDICALTROOPER, TEAM_MEDICALSERGEANT, TEAM_MEDICALOFFICER, TEAM_MEDICALCOMMAND, TEAM_MEDICALCOMMANDER},
    category = "Medical Supplies", -- The name of the category it is in. Note: the category must be created!
    sortOrder = 100, -- The position of this thing in its category. Lower number means higher up.
    allowTools = false, -- Whether players (including superadmins!) are allowed to use other tools than just remover. Defaults to false
	})