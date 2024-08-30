AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Custom Weapons"
SWEP.Credits = { Author1 = "Yairme"}
SWEP.PrintName = "DT-29"
SWEP.Trivia_Class = "Imperial Blaster Pistol"
SWEP.Trivia_Desc = "Imperial blaster pistol for CQB enviroments"
SWEP.Trivia_Manufacturer = "BlasTech Industries"
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

SWEP.IconOverride = "materials/entities/rw_sw_dt29.png"

SWEP.DefaultBodygroups = "000000000000"

-- [Damage] --
SWEP.Damage = 2000
SWEP.DamageMin = 17

-- [Range] --
SWEP.Range = 240
SWEP.RangeMin = 120

-- [Recoil] --
SWEP.Recoil = 0.4
SWEP.RecoilPunch = 0.35
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.31

-- [Fire Rate M/R] --
SWEP.Delay = 60 / 160

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
SWEP.Primary.ClipSize = 8

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
SWEP.HipDispersion = 800 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = nil
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false --
SWEP.MuzzleFlashColor = Color(255, 0, 0)


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/dt29.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.IronSightStruct = {
    Pos = Vector(-3.85, -8, 1.5),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterpistol_04.mp3",
     ViewModelFOV = 60,
}
SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "revolver"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(3, -5, -1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(4, -15,-10)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Vector(-20, 0, 0)

SWEP.CustomizePos = Vector(20.824, -16, 4.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"dt29"}

SWEP.AttachmentElements = {
    ["dt29"] = {
        VMElements = {
            {
                Model = "models/arccw/rising/w_dt29.mdl",
                Bone = "v_scoutblaster_reference001",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(0.85, -07, 01.75),
                    ang = Angle(0, 180, 0)
                }
            }
        },
        WMElements = {
            {
                Model = "models/arccw/rising/w_dt29.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1, 1, 1),
                Offset = {
                    pos = Vector(100.75, 0.5, -40),
                    ang = Angle(0, -90, 168)
                }
            }
        },
    },
}
WMOverride = "models/arccw/rising/w_dt29.mdl" -- change the world model to something else. Please make sure it's compatible with the last one.

--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "swoptic_module",
        WMScale = Vector(11, 11, 11),
        Bone = "v_scoutblaster_reference001", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(-0.1, -4, 3),
            vang = Angle(0, 180, 0),
            wpos = Vector(60, 11, -45),
            wang = Angle(-10, 90, 180)
        },
    },
    [2] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(11, 11, 11),
        Bone = "v_scoutblaster_reference001", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, -7, 1),
            vang = Angle(0, 90, 0),
            wpos = Vector(90 , 12, -30),
            wang = Angle(-10, 0, 180)
        },
    },    
    [3] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle"},
        WMScale = Vector(11, 11, 11),
        Bone = "scoutblaster_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0, -0.5, 12),
            vang = Angle(90, 0, -90),
            wpos = Vector(154, 11, -63),
            wang = Angle(-11, 0, 180)
        },
    },        
    [4] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    },
    [5] = {
        PrintName = "Training/Perk", -- print name
        DefaultAttName = "None", -- used to display the "no attachment" text
        Slot = "perk",
    },
    [6] = {
        PrintName = "Charms", -- print name
        DefaultAttName = "No Charm", -- used to display the "no attachment" text
        Slot = {"charm"},
        WMScale = Vector(11, 11, 11),
        Bone = "scoutblaster_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.5, 0.7, 7),
            vang = Angle(90, 0, -90),
            wpos = Vector(90, 15, -40),
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
            {s = "ArcCW_dc17.reload2", t = 4 / 30}, --s sound file
        },
    },


sound.Add({
    name =          "ArcCW_dc17.reload2",
    channel =       CHAN_ITEM,
    volume =        1.0,
    sound =             "weapons/bf3/pistols.wav"
    }),
}