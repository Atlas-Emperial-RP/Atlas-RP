AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Custom Weapons"
SWEP.Credits = { Author1 = "Yairme"}
SWEP.PrintName = "ISB E-11S"
SWEP.Trivia_Class = "Imperial Sniper Blaster"
SWEP.Trivia_Desc = "Powerful Sniper blaster, preffered for long-range combat."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "Netherlands"
SWEP.Trivia_Year = 2024

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_dlt19.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_dlt19.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.009
}

SWEP.IconOverride = "materials/entities/rw_sw_e11s.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 125
SWEP.RangeMin = 350
SWEP.DamageMin = 55
SWEP.Range = 750
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
SWEP.Primary.ClipSize = 8

SWEP.Recoil = 1
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.34

SWEP.Delay = 60 / 140
SWEP.Num = 1
SWEP.Firemodes = {
	{
		Mode = 1
	},
    {
        Mode = 0
    },
}

SWEP.AccuracyMOA = 0 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 400 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/e11s.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(250, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-3.1, -9, 1.7),
    Ang = Angle(0, 0.25, 0),
     Magnification = 1,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterrifle_08.mp3",
     ViewModelFOV = 50,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(2, 6, -2)
SWEP.ActiveAng = Angle(0, 0.4, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(0.2, -1, 1)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.DefaultElements = {"e11s", "muzzle"}

SWEP.AttachmentElements = {
    ["e11s"] = {
        VMElements = {
            {
                Model = "models/arccw/rising/w_e11s.mdl",
                Bone = "v_dlt19_reference001",
                Scale = Vector(1.2, 1.2, 1.2),
                Offset = {
                    pos = Vector(-0.65, 7.5, 2.25),
                    ang = Angle(0, 0, 0)
                },
            }
        },
    },
    ["muzzle"] = {
        VMElements = {
           {
               Model = "models/hunter/plates/plate.mdl",
               Bone = "dlt19_sight",
               Scale = Vector(0, 0, 0),                
               Offset = {
                   pos = Vector(-0.5, 4, 27 ),
                   ang = Angle(-90, 180, 0)
               },
               IsMuzzleDevice = true
           }
       },
        WMElements = {
            {
                Model = "models/arccw/rising/w_e11s.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(1100, 4.5, -500.5),
                    ang = Angle(-15, -90, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(3500, 0, -1100),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}
WMOverride = "models/arccw/rising/w_e11s.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.01, 0.1, -12),
            vang = Angle(90, 0, -90),
            wpos = Vector(390, 125, -460),
            wang = Angle(-15, 0, 180)
        },
    },
    [2] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.3, 1.9, 15),
            vang = Angle(90, 0, 0),
            wpos = Vector(3200, 200, -1100),
            wang = Angle(-15, 0, -90)
        },
    },
    [3] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0, 3, 4),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
            vmin = Vector(-0, 2, 2),
            vmax = Vector(-0, 2, 7),
            wmin = Vector(2100, 125, -600), 
            wmax = Vector(2100, 125, -600)  -- how far this attachment can slide in both directions.
        },  
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        WMScale = Vector(111, 111, 111),
        Slot = {"muzzle","dlt19_muzzle", "dc15a_muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 1.5, 29),
            vang = Angle(90, 0, -90),
            wpos = Vector(3600, 120, -1170),
            wang = Angle(-15, 0, -90)
        },
    },
    [5] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        WMScale = Vector(111, 111, 111),
        Slot = {},
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
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
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.8, 2, -8),
            vang = Angle(90, 0, -90),
            wpos = Vector(500, 200, -320),
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
        Mult = 2,
        SoundTable = {
            {
                s = "draw/gunfoley_blaster_dc17m_draw_var_03.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 100, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["holster"] = {
        Source = "holster",
        SoundTable = {
            {
                s = "holster/gunfoley_blaster_sheathe_var_04.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload", 
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
            {s = "ArcCW_dc15a.reload2", t = 4 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_dc15a.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/heavy.wav"
    }),
}