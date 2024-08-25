AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Custom Weapons"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "ST DP-23"
SWEP.Trivia_Class = "Blaster Rifle"
SWEP.Trivia_Desc = "High tech Blaster shotgun, built for piercing the enemy defenses."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/meeks/v_dp23_v2.mdl"
SWEP.WorldModel = "models/meeks/worldmodels/w_dp23_v2.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = false
SWEP.WorldModelOffset = {
    pos = Vector(10, 0, -4),
    ang = Angle(165, 180, 0),
    bone = "ValveBiped.Bip01_R_Hand",
}

SWEP.IconOverride = "materials/entities/rw_sw_dp23.png"
SWEP.NoHideLeftHandInCustomization = true
SWEP.DefaultBodygroups = "000000000000"

-- [Damage] --
SWEP.Damage = 21
SWEP.DamageMin = 13

-- [Range] --
SWEP.Range = 50
SWEP.RangeMin = 20

-- [Recoil] --
SWEP.Recoil = 1.5
SWEP.RecoilSide = 0.6
SWEP.RecoilPunch = 0.8
SWEP.RecoilRise = 1

-- [Fire Rate M/R] --
SWEP.Delay = 90 / 240

SWEP.Penetration = 1
SWEP.DamageType = DMG_BUCKSHOT
SWEP.MuzzleVelocity = 400

SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_blue"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 5

SWEP.Num = 5
SWEP.Firemodes = {
	{
		Mode = 1
	},
    {
        Mode = 0
    },
}

SWEP.AccuracyMOA = 50 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 450 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 100

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false --
SWEP.MuzzleFlashColor = Color(0, 0, 255)



----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100


SWEP.DistantShootSound = "dc15a/SW02_Weapons_Blasters_Shared_Corebass_Tight_Close_VAR_02 0 0 0.mp3"
SWEP.ShootSound = "dp23/dp23.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.MuzzleEffectAttachment = "1" -- which attachment to put the muzzle on
SWEP.ProceduralViewBobAttachment = 1 -- attachment on which coolview is affected by, default is muzzleeffect
SWEP.MuzzleFlashColor = Color(0, 0, 250)

SWEP.IronSightStruct = {
    Pos = Vector(-2.81, -7, 1.4),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterheavy_01.mp3",
     ViewModelFOV = 60,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(1.5, -2, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(0.2, -1, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -10, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

-- SWEP.DefaultElements = {"", ""}

-- SWEP.AttachmentElements = {
--     ["dc15a"] = {
--         VMElements = {
--             {
--                 Model = "models/arccw/sw_battlefront/weapons/new/DC15A_Rifle.mdl", -- using the model-edit i made in like 2 mins lol
--                 Bone = "v_dlt19_reference001",
--                 Scale = Vector(1.2, 1.2, 1.2),
--                 Offset = {
--                     pos = Vector(.7, -0.3, 0.5),
--                     ang = Angle(0,-90, 0)
--                 },
--             }
--         },
--     },
--     ["muzzle"] = {
--          VMElements = {
--             {
--                 Model = "models/hunter/plates/plate.mdl",
--                 Bone = "dlt19_sight",
--                 Scale = Vector(0, 0, 0),                
--                 Offset = {
--                     pos = Vector(-0.5, 4, 27 ),
--                     ang = Angle(-90, 180, 0)
--                 },
--                 IsMuzzleDevice = true
--             }
--         },
--         WMElements = {
--             {
--                 Model = "models/arccw/sw_battlefront/weapons/new/dc15a_rifle.mdl",
--                 Bone = "ValveBiped.Bip01_R_Hand",
--                 Scale = Vector(1.1, 1.1, 1.1),
--                 Offset = {
--                     pos = Vector(3.75, 2.5, -1.5),
--                     ang = Angle(-15, 0, 180)
--                 }
--             },
--             {
--                 Model = "models/hunter/plates/plate.mdl",
--                 Bone = "ValveBiped.Bip01_R_Hand",
--                 Scale = Vector(0, 0, 0),
--                 Offset = {
--                     pos = Vector(3500, 0, -1100),
--                     ang = Angle(-15, 0, 180)
--                 },
--                 IsMuzzleDevice = true
--             },
--         }, -- change the world model to something else. Please make sure it's compatible with the last one.
--     }
-- }
-- WMOverride = "models/arccw/sw_battlefront/weapons/new/dc15a_rifle.mdl"

--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        -- WMScale = Vector(111, 111, 111),
        Bone = "sights", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(-0.04, -0.7, 0.15),
            vang = Angle(90, 0, -90),
            wpos = Vector(3, 1, -3.8),
            wang = Angle(-15, 0, 180)
        },
    },
    [2] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"foregrip"},
        Bone = "sights", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(-0., 1.65, 6.5),
            vang = Angle(90, 0, -90),
            wang = Angle(165, 180, 0),
        },
        SlideAmount = {
            vmin = Vector(-0, 2.2, 6),
            vmax = Vector(-0, 2.2, 12),
            wmin = Vector(12.2, 1, -3), 
            wmax = Vector(18, 1, -4.35) -- how far this attachment can slide in both directions.
        },    
    },          
    [3] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol","tac"},
        Bone = "sights", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.65, 0.85, 11),
            vang = Angle(90, 0, -0),
            wpos = Vector(20, 1.8, -6.5),
            wang = Angle(-15, 0, -90)
        },
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle","dlt19_muzzle", "dc15a_muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "sights", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(-0.04, 0.84, 15.4),
            vang = Angle(90, 0, -90),
            wpos = Vector(23.1, 1, -7.4),
            wang = Angle(-15, 0, -90)
        },
    },    
    [5] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Bone = "sights", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.3, 2.3, -3),
            vang = Angle(0, 0, 0),
            wpos = Vector(440, 10, -260),
            wang = Angle(-15, 90, -90)
        },
    },         
    [6] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [7] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [8] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        Bone = "sights", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.7, 0.8, 5.9),
            vang = Angle(90, 0, -90),
            wpos = Vector(10, 1.8, -4),
            wang = Angle(-10 , 0, 180)
        },
    },    
    [9] = {
        PrintName = "Killcounter", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = {"killcounter"},
        Bone = "sights", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 1, 3),
            vang = Angle(90, 0, -90),
            wpos = Vector(675, 90, -400),
            wang = Angle(-15 , 0, 180)
        },
    },   
    [10] = {
        PrintName = "Grip", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "grip",
    },    
    [11] = {
        PrintName = "Internal Modifications", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "uc_fg",
    },   
}
SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = "fire"
    },
    ["draw"] = {
        Source = "draw",
        SoundTable = {
            {
                s = "draw/gunfoley_blaster_draw_var_04.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "draw/gunfoley_blaster_draw_var_08.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        Time = 3,
        LHIK = true,
        LHIKOut = 0.6,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "reloads/heavy.wav", t = 4 / 30}, --s sound file
        },
    },

}