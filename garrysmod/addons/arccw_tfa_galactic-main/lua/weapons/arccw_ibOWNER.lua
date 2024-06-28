AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = false
SWEP.Category = nil
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "IB-94"
SWEP.Trivia_Class = "Galactic Blaster Pistol"
SWEP.Trivia_Desc = "A Blaster pistol for shooting enviroments"
SWEP.Trivia_Manufacturer = "Forged Armory"
SWEP.Trivia_Calibre = "Low Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

SWEP.Slot = 1

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/bf2017/c_scoutblaster.mdl"
SWEP.WorldModel = "models/arccw/bf2017/w_scoutblaster.mdl"
SWEP.ViewModelFOV = 70
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.09
}

SWEP.IconOverride = "materials/entities/rw_sw_ib94.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 999999999999999999999999
SWEP.RangeMin = 999999999999999999999999
SWEP.DamageMin = 999999999999999999999999
SWEP.Range = 999999999999999999999999
SWEP.Penetration = 999999999999999999999999
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 999999999999999999999999


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(255, 0, 0)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 999999999999999999999999

SWEP.Recoil = 0
SWEP.RecoilPunch = 0
SWEP.RecoilSide = 0
SWEP.RecoilRise = 0.

SWEP.Delay = 1 / 1
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
    {
        {
            Mode = -100,
            RunawayBurst = true,
            PostBurstDelay = 0.4,
        },
	}
}

SWEP.AccuracyMOA = 0 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 0 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 0

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = nil
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false --
SWEP.MuzzleFlashColor = Color(250, 0, 0)


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/ib94.wav"
SWEP.IronSightStruct = {
    Pos = Vector(-3.799, -8, 1.85),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 60,
}
SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(3, -4, -1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(5, -10,-20)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Vector(-15, 0, 0)

SWEP.CustomizePos = Vector(20.824, -16, 4.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"ib94"}

SWEP.AttachmentElements = {
    ["ib94"] = {
        VMElements = {
            {
                Model = "models/arccw/cs574/weapons/dc92.mdl",
                Bone = "v_scoutblaster_reference001",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(-0.25, -4, -0.38),
                    ang = Angle(0, 90, 0)
                }
            }
        },
        WMElements = {
            {
                Model = "models/arccw/cs574/weapons/dc92.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(80, 20, -15.3),
                    ang = Angle(-15, 0, 180)
                }
            }
        },
    },
}
WMOverride = "models/arccw/cs574/weapons/dc92.mdl" -- change the world model to something else. Please make sure it's compatible with the last one.

--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "swoptic_module",
        VMScale = Vector(0.8, 0.8, 0.8),
        WMScale = Vector(9, 9, 9),
        Bone = "v_scoutblaster_reference001", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(-0.14, -2.4, 2.9),
            vang = Angle(0, 180, 0),
            wpos = Vector(70, 20, -50),
            wang = Angle(-15, 90, 180)
        },
    },
    [2] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment",
        VMScale = Vector(0.8, 0.8, 0.8), -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(9, 9, 9),
        Bone = "v_scoutblaster_reference001", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, -8, 1.45),
            vang = Angle(0, 90, 0),
            wpos = Vector(115, 20, -56),
            wang = Angle(-15, 0, 180)
        },
    },    
    [3] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = {"ammo", "sw_ammo" , "ammo_rocket", "anti_vehicle_btrs"},
    },
    [4] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [5] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        WMScale = Vector(8, 8, 8),
        Bone = "scoutblaster_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.35, 0.9, 4),
            vang = Angle(90, 0, -90),
            wpos = Vector(60, 22, -35),
            wang = Angle(-10, 0, 180)
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
                s = "draw/gunfoley_pistol_draw_var_06.mp3", -- sound; can be string or table
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
                s = "holster/gunfoley_pistol_sheathe_var_09.mp3", -- sound; can be string or table
                p = 100, -- pitch
                v = 75, -- volume
                t = 0, -- time at which to play relative to Animations.Time
                c = CHAN_ITEM, -- channel to play the sound
            },
        }
    },
    ["reload"] = {
        Source = "reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
 --       Time = 3.35,
        SoundTable = {
            {s = "ArcCW_dc17.reload2", t = 1 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_dc17.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/pistols.wav"
    }),
}