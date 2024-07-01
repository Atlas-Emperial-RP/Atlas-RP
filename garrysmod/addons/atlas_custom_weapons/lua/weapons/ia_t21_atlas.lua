AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Imperial Army Weapons"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "T-21"
SWEP.Trivia_Class = "Imperial Heavy Blaster Rifle"
SWEP.Trivia_Desc = "High tech T-21 Heavy Blaster Rifle"
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 3

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_t21.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_t21.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.009
}

SWEP.IconOverride = "materials/entities/rw_sw_t21.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 35
SWEP.RangeMin = 145
SWEP.DamageMin = 19
SWEP.Range = 410
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
SWEP.Primary.ClipSize = 100

SWEP.Recoil = 0.7
SWEP.RecoilPunch = 0.4
SWEP.RecoilSide = 0.13
SWEP.RecoilRise = 0.26

SWEP.Delay = 60 / 380
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 2
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

SWEP.ShootSound = "w/t21.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(250, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-1.8, -9, 1),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 55,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(5, -3, -1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(0.2, -1, 1)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -14, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"t21", "muzzle"}

SWEP.AttachmentElements = {
    ["t21"] = {
        VMElements = {
            {
                Model = "models/arccw/kuro/sw_battlefront/weapons/bf1/t21.mdl",
                Bone = "v_t21_reference001",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(0.6, 1.5, -1.8),
                    ang = Angle(0,-90, 0)
                }
            }
        },
    },
    ["muzzle"] = {
        VMElements = {
           {
               Model = "models/hunter/plates/plate.mdl",
               Bone = "t21_sight",
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
                Model = "models/arccw/kuro/sw_battlefront/weapons/bf1/t21.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(400, 50.5, 200),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(4400, 0, -1600),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}
WMOverride = "models/arccw/kuro/sw_battlefront/weapons/bf1/t21.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.55, -1, -2),
            vang = Angle(90, 0, -90),
            wpos = Vector(600, 50, -700),
            wang = Angle(-15, 0, 180)
        },
    },
    [2] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0, 2.5, 9),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
            vmin = Vector(-0, 2, 2),
            vmax = Vector(-0, 2, 7),
            wmin = Vector(1800, 50, -700), 
            wmax = Vector(1800, 50, -700)  -- how far this attachment can slide in both directions.
        },      
    },    
    [3] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(111, 111, 111),
        Bone = "v_t21_reference001", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 20, 3),
            vang = Angle(0, -90, 0),
            wpos = Vector(3200, 50, -1100),
            wang = Angle(-15, 0, 180)
        },
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        NoWM = true,
        Slot = {},
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, 1.5, 29),
            vang = Angle(90, 0, -90),
            wpos = Vector(4300, 200, -1360),
            wang = Angle(-15, 0, -90)
        },
    },    
    [5] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [6] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [7] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        WMScale = Vector(111, 111, 111),
        Bone = "t21_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 2, 3),
            vang = Angle(90, 0, -90),
            wpos = Vector(600, 100, -520),
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
        Mult = 1.3,
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