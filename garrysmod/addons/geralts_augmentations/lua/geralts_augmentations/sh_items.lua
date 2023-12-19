local chip_png = Material("geralts_augmentations/ui/chip.png")
local eye_png = Material("geralts_augmentations/ui/eye.png")

CYBERNETIC_AUGMENTATIONS.Items = CYBERNETIC_AUGMENTATIONS.Items or {
	[1] = {},
	[2] = {},
	[3] = {},
	[4] = {},
	[5] = {},
	[6] = {},
}
--slots are: 1 - right arm, 2 - left arm, 3 - right leg, 4 - left leg, 5 - chips, 6 - eyes
local Items = CYBERNETIC_AUGMENTATIONS.Items
Items[1] = {
	[1] = {
		Name = "Hydraulic Arm",
		Model = "models/geralts_augmentations/hydraulic/hydraulic_hand_right.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/arm_hydraulic_r.mdl", -- prop
		Parameters = {
			Protection = {[DMG_BULLET] = 45, [DMG_BUCKSHOT] = 45, [DMG_BLAST] = 25}, 
		},
		Money = 75000, -- how much rp money it cost
	},
	[2] = {
		Name = "Myomere Arm",
		Model = "models/geralts_augmentations/myomere/myomere_right.mdl",
		Prop = "models/geralts_augmentations/props/arm_mym_r.mdl", 
		Parameters = {
			Protection = {[DMG_BULLET] = 35, [DMG_BUCKSHOT] = 35, [DMG_BLAST] = 35},
		},
		Money = 125000,
	},
}

Items[2] = {
	[1] = {
		Name = "Hydraulic Arm",
		Model = "models/geralts_augmentations/hydraulic/hydraulic_hand_left.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/arm_hydraulic_l.mdl", -- prop
		Parameters = {
			Protection = {[DMG_BULLET] = 45, [DMG_BUCKSHOT] = 45, [DMG_BLAST] = 25}, 
		},
		Money = 75000, -- how much rp money it cost
	},	
	[2] = {
		Name = "Myomere Arm",
		Model = "models/geralts_augmentations/myomere/myomere_left.mdl",
		Prop = "models/geralts_augmentations/props/arm_mym_l.mdl", 
		Parameters = {
			Protection = {[DMG_BULLET] = 35, [DMG_BUCKSHOT] = 35, [DMG_BLAST] = 35},
		},
		Money = 125000,
	},
}

Items[3] = {
	[1] = {
		Name = "Hydraulic Leg",
		Model = "models/geralts_augmentations/hydraulic/hydraulic_leg_right.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/leg_hydraulic_r.mdl", -- prop
		Parameters = {
			RunSpeed = 25,
			JumpPower = 15,
			Protection = {[DMG_BULLET] = 45, [DMG_BUCKSHOT] = 45, [DMG_BLAST] = 25, [DMG_FALL] = 75}, 
		},
		Money = 150000, -- how much rp money it cost
	},	
	[2] = {
		Name = "Myomere Leg",
		Model = "models/geralts_augmentations/myomere/myomere_leg_r.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/leg_mym_r.mdl", -- prop
		Parameters = {
			RunSpeed = 55,
			JumpPower = 45,
			Protection = {[DMG_BULLET] = 15, [DMG_BUCKSHOT] = 15, [DMG_BLAST] = 5, [DMG_FALL] = 35}, 
		},
		Money = 150000, -- how much rp money it cost
	},
}

Items[4] = {
	[1] = {
		Name = "Hydraulic Leg",
		Model = "models/geralts_augmentations/hydraulic/hydraulic_leg_left.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/leg_hydraulic_l.mdl", -- prop
		Parameters = {
			RunSpeed = 25,
			JumpPower = 15,
			Protection = {[DMG_BULLET] = 45, [DMG_BUCKSHOT] = 45, [DMG_BLAST] = 25, [DMG_FALL] = 75}, 
		},
		Money = 150000, -- how much rp money it cost
	},
	[2] = {
		Name = "Myomere Leg",
		Model = "models/geralts_augmentations/myomere/myomere_leg_l.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/leg_mym_l.mdl", -- prop
		Parameters = {
			RunSpeed = 55,
			JumpPower = 45,
			Protection = {[DMG_BULLET] = 15, [DMG_BUCKSHOT] = 15, [DMG_BLAST] = 5, [DMG_FALL] = 35}, 
		},
		Money = 150000, -- how much rp money it cost
	},
}

Items[5] = {
	[1] = {
		Name = "Regen Module",
		Icon = chip_png, --ui icon
		Parameters = {
			Regen = 1, -- 1 hp per second
		},
		Money = 200000, -- how much rp money it cost
		-- Donate = 150, -- how much donate points it cost, if both set, then it will take as money, as points
	},	
	[2] = {
		Name = "Armoured Skin",
		Icon = chip_png, --ui icon
		Parameters = {
			Protection = {[DMG_BULLET] = 25, [DMG_BUCKSHOT] = 45, [DMG_BLAST] = 35, [DMG_GENERIC] = 20}, 
		},
		Money = 150000,
	},	
	[3] = {
		Name = "Stealth Module",
		Icon = chip_png, --ui icon
		Parameters = {
			Cloak = true,
		},
		Money = 200000,
	},
}

Items[6] = {
	[1] = {
		Name = "Cybernetic Eyes",
		Icon = eye_png,
		EyeMaterial = {"geralts_augmentations/eyes/blue_robot_eye", "geralts_augmentations/eyes/green_robot_eye", "geralts_augmentations/eyes/orange_robot_eye", "geralts_augmentations/eyes/purple_robot_eye","geralts_augmentations/eyes/red_robot_eye"}, -- can be used with tables for multiple variants
		Parameters = {
			Thermalvision = true,
			Echolocation = true,
			Nightvision = true,
		},
		Money = 200000, -- how much rp money it cost
	},	
	[2] = {
		Name = "Cat Eyes",
		Icon = eye_png,
		EyeMaterial = "geralts_augmentations/eyes/witcher_eye",
		Parameters = {
			Nightvision = true,
		},
		Money = 50000,
	},
	[3] = {
		Name = "Darkness Eyes",
		Icon = eye_png,
		EyeMaterial = "geralts_augmentations/eyes/black_eye",
		Parameters = {
			Echolocation = true,
		},
		Money = 75000,
	},	
	[4] = {
		Name = "Reptile Eyes",
		Icon = eye_png,
		EyeMaterial = "geralts_augmentations/eyes/reptile_eye",
		Parameters = {
			Thermalvision = true,
		},
		Money = 80000,
	},
}

local ExtraContent = CYBERNETIC_AUGMENTATIONS.ExtraContent
local right_hands = Items[1]
local left_hands = Items[2]
local right_legs = Items[3]
local left_legs = Items[4]

if ExtraContent["Mecha Set"] then
	if SERVER then
		resource.AddWorkshop("2631017361")
	end
	right_hands[#right_hands + 1] = {
		Name = "Mechanical Arm",
		Model = "models/geralts_augmentations/mecha/mech_arm_r.mdl", 
		Prop = "models/geralts_augmentations/props/arm_mech_r.mdl",
		Parameters = {
			Protection = {[DMG_BULLET] = 75, [DMG_BUCKSHOT] = 75, [DMG_BLAST] = 25}, 
		},
		Money = 90000, 
	}
	left_hands[#left_hands + 1] = {
		Name = "Mechanical Arm",
		Model = "models/geralts_augmentations/mecha/mech_arm_l.mdl", 
		Prop = "models/geralts_augmentations/props/arm_mech_l.mdl",
		Parameters = {
			Protection = {[DMG_BULLET] = 75, [DMG_BUCKSHOT] = 75, [DMG_BLAST] = 25}, 
		},
		Money = 90000,
	}
	right_legs[#right_legs + 1] = {
		Name = "Mechanical Leg",
		Model = "models/geralts_augmentations/mecha/mech_leg_r.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/leg_mech_r.mdl", -- prop
		Parameters = {
			RunSpeed = -25,
			JumpPower = -25,
			Protection = {[DMG_BULLET] = 75, [DMG_BUCKSHOT] = 75, [DMG_BLAST] = 25, [DMG_FALL] = 65}, 
		},
		Money = 75000, -- how much rp money it cost
	}
	left_legs[#left_legs + 1] = {
		Name = "Mechanical Leg",
		Model = "models/geralts_augmentations/mecha/mech_leg_l.mdl", -- model that parents to playermodel
		Prop = "models/geralts_augmentations/props/leg_mech_l.mdl", -- prop
		Parameters = {
			RunSpeed = -25,
			JumpPower = -25,
			Protection = {[DMG_BULLET] = 75, [DMG_BUCKSHOT] = 75, [DMG_BLAST] = 25, [DMG_FALL] = 65}, 
		},
		Money = 75000, -- how much rp money it cost
	}
end