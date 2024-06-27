AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ ArcCW ] Imperial TFA Weapons"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "TL-50"
SWEP.Trivia_Class = "Imperial Heavy Blaster Rifle"
SWEP.Trivia_Desc = "High tech TL-50 Purge Blaster Rifle, preffered for long-range combat and general allround usage."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

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

SWEP.IconOverride = "materials/entities/rw_sw_tl50.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 45
SWEP.RangeMin = 100
SWEP.DamageMin = 23
SWEP.Range = 330
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(255, 0, 0)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 65

SWEP.Recoil = 0.5
SWEP.RecoilPunch = 0.8
SWEP.RecoilSide = 0.23
SWEP.RecoilRise = 0.22

SWEP.Delay = 60 / 720
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

SWEP.AccuracyMOA = 0.61 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 510 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/tl50.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(250, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-2.43, -8, -0.25),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterheavy_01.mp3",
     ViewModelFOV = 70,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "smg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(3, .8, -2)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(4, -3, -1)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -14, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"tl50", "muzzle"}

SWEP.AttachmentElements = {
    ["tl50"] = {
        VMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/tl50_repeater.mdl",
                Bone = "v_dlt19_reference001",
                Scale = Vector(1.2, 1.2, 1.2),
                Offset = {
                    pos = Vector(1.2, -03, -0.8),
                    ang = Angle(0,-90, 0)
                }
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
                   pos = Vector(0.4, 2, 12 ),
                   ang = Angle(-90, 180, 0)
               },
               IsMuzzleDevice = true
           }
       },
        WMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/tl50_repeater.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(230, 100.5, 40),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(2500, 0, -1100),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}
WMOverride = "models/arccw/sw_battlefront/weapons/tl50_repeater.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.75, -2, 1),
            vang = Angle(90, 0, -90),
            wpos = Vector(900, 100, -880),
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
            vpos = Vector(2.1, -0.2, 11),
            vang = Angle(90, 0, 0),
            wpos = Vector(2150, 250, -1000),
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
            vpos = Vector(0, 2.3, 7),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
        vmin = Vector(-0.2, 2.3, 4),
        vmax = Vector(-0.2, 2.3, 8),
        wmin = Vector(1600, 100, -650), 
        wmax = Vector(1600, 100, -650) -- how far this attachment can slide in both directions.
        },        
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle"},
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.9, -0.55, 14.5),
            vang = Angle(90, 0, -90),
            wpos = Vector(2450, 100, -1150),
            wang = Angle(-15, 0, -90)
        },
    },
    [5] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        NoWM = true,
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
            vpos = Vector(1.8, 0.7, 2.5),
            vang = Angle(90, 0, -90),
            wpos = Vector(1330, 220, -680),
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