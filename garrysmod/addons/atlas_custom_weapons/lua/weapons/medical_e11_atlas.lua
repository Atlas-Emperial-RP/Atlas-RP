AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Custom Weapons"
SWEP.Credits = { Author1 = "Yairme"}
SWEP.PrintName = "MED E-11"
SWEP.Trivia_Class = "Imperial Light Blaster Carbine"
SWEP.Trivia_Desc = "High tech compact Imperial E-11 Blaster Carbine, preffered for CQB enviroments and general allround usage."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "Netherlands"
SWEP.Trivia_Year = 2024

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_e11.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_e11.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.009
}

SWEP.IconOverride = "materials/entities/rw_sw_e11_noscope.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 25
SWEP.RangeMin = 150
SWEP.DamageMin = 24
SWEP.Range = 450
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400

SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(250, 0, 0)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 25

SWEP.Recoil = 0.33
SWEP.RecoilSide = 0.19
SWEP.RecoilRise = 0.23

SWEP.Delay = 60 / 270
SWEP.Num = 1
SWEP.Firemodes = {
	{
		Mode = 2
	},
    {
        Mode = 1
    },
    {
        Mode = 0
    },    
}

SWEP.AccuracyMOA = 0.51 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 610 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/e11.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(255, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-2.99, -8, 2.8),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 50,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(2.9, -4, .5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(7, -10, 0)
SWEP.SprintAng = Angle(-10, 40, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(12.824, -8, -3.897)
SWEP.CustomizeAng = Angle(10.149, 34.547, 0)

SWEP.DefaultElements = {"e11", "muzzle"}

SWEP.AttachmentElements = {
    ["e11"] = {
        VMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/e11_noscope.mdl",
                Bone = "v_e11_reference001",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(-1.1, 4, -3),
                    ang = Angle(0, -90, 0)
                }
            }
        },
    },
    ["muzzle"] = {
         VMElements = {
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "e11_sight",
                Scale = Vector(0, 0, 0),                
                Offset = {
                    pos = Vector(-0.5, 4, 11),
                    ang = Angle(-90, 180, 0)
                },
                IsMuzzleDevice = true
            }
        },
        WMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/e11_noscope.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(1100, 40, 0),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(2000, 0, -900),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}

WMOverride = "models/arccw/sw_battlefront/weapons/e11_noscope.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.15, 0.3, -2),
            vang = Angle(90, 0, -90),
            wpos = Vector(400, 40, -600),
            wang = Angle(-15, 0, 180)
        },
    },
    [2] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.5, 1.5, 7),
            vang = Angle(90, 0, 15),
            wpos = Vector(1600, 130, -750),
            wang = Angle(-15, 0, -90)
        },
    },    
    [3] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0, 3.3, 8),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
        vmin = Vector(-0, 2.5, 5),
        vmax = Vector(-0, 2.5, 8),
        wmin = Vector(1600, 50, -600), 
        wmax = Vector(1600, 50, -600) -- how far this attachment can slide in both directions.
        },        
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle"},
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 1.8, 14),
            vang = Angle(90, 0, -90),
            wpos = Vector(1900, 40, -850),
            wang = Angle(-15, 0, -90)
        },
    },    
    [5] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [6] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {},
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.3, 2.3, 4),
            vang = Angle(0, 0, 0),
            wpos = Vector(650, 10, -300),
            wang = Angle(-15, 90, -90)
        },
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
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.8, 2, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(600, 120, -440),
            wang = Angle(-10 , 0, 180)
        },
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
        Mult = 1.2,
        SoundTable = {
            {
                s = "w/dc15s/overheat_manualcooling_resetfoley_generic_var_01.mp3", -- sound; can be string or table
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
                s = "w/dc15s/gunfoley_blaster_sheathe_var_03.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        Time = 3.35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "ArcCW_dc15a.reload2", t = 1 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_dc15s.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/pistols.wav"
    }),
}