AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Custom Weapons"
SWEP.Credits = { Author1 = "Yairme"}
SWEP.PrintName = "ST DLT-19X"
SWEP.Trivia_Class = "Imperial Sniper Blaster Rifle"
SWEP.Trivia_Desc = "High RPM DLT-19 Heavy Blaster Rifle"
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

SWEP.IconOverride = "materials/entities/rw_sw_dlt19x.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 145
SWEP.RangeMin = 340
SWEP.DamageMin = 55
SWEP.Range = 750
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 5

SWEP.Recoil = 1
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.34

SWEP.Delay = 60 / 100
SWEP.Num = 1
SWEP.Firemodes = {
    {
        Mode = 1
    }, 
    {
        Mode = 0
    },           
}

SWEP.AccuracyMOA = 0.75 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 400 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 0.5 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.3 -- Bipod recoil for Integral bipods
----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/dlt19.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(250, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-2.7, -10, 0.4),
    Ang = Angle(1, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 70,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(2, .8, -2)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(3, 0, 0)
SWEP.SprintAng = Angle(-10, 40, -40)

SWEP.HolsterPos = Vector(0.2, -1, 1)
SWEP.HolsterAng = Vector(-15, 30, -15)


SWEP.CustomizePos = Vector(20.824, -10, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"dlt19x", "muzzle"}

SWEP.AttachmentElements = {
    ["dlt19x"] = {
        VMElements = {
            {
                Model = "models/arccw/markus/swbf2/gameplay/equipment/longrange/dlt19x/dlt19x_mesh1p_mesh.mdl",
                Bone = "v_dlt19_reference001",
                Scale = Vector(1.2, 1.2, 1.2),
                Offset = {
                    pos = Vector(1, -0.002, 0.709),
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
                   pos = Vector(-0.5, 4, 27 ),
                   ang = Angle(-90, 180, 0)
               },
               IsMuzzleDevice = true
           }
       },
        WMElements = {
            {
                Model = "models/arccw/markus/swbf2/gameplay/equipment/longrange/dlt19x/dlt19x_mesh1p_mesh.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(300, 200.5, -1.5),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(4100, 0, -1200),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}

WMOverride = "models/arccw/markus/swbf2/gameplay/equipment/longrange/dlt19x/dlt19x_mesh1p_mesh.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "dlt19_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.5, -1.2, -0.5),
            vang = Angle(90, 0, -90),
            wpos = Vector(800, 205, -630),
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
            vpos = Vector(1, 0.8, 24),
            vang = Angle(90, 0, 0),
            wpos = Vector(3200, 290, -1100),
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
            vpos = Vector(0, 1.8, 7),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
        vmin = Vector(-0, 2, 2),
        vmax = Vector(-0, 2, 7),
        wmin = Vector(2100, 200, -680), 
        wmax = Vector(2100, 200, -680)  -- how far this attachment can slide in both directions.
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
        Bone = "dlt19_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1.7, 0, 4.5),
            vang = Angle(90, 0, -90),
            wpos = Vector(1200, 340, -520),
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
                s = "draw/overheat_manualcooling_resetfoley_generic_var_04.mp3", -- sound; can be string or table
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