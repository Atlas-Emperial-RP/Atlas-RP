AddCSLuaFile()

SWEP.Base = "arccw_meeks_sw_base"
SWEP.Spawnable = true
SWEP.Category = "[ Atlas ] Custom Weapons"
SWEP.Credits = { Author1 = "Yairme"}
SWEP.PrintName = "Shock Dual DL-44"
SWEP.Trivia_Class = "Dual Blaster Pistol"
SWEP.Trivia_Desc = "Dual Blaster pistols for shooting enviroments"
SWEP.Trivia_Manufacturer = "Drearian Defense Conglomerate"
SWEP.Trivia_Calibre = "Low Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "Netherlands"
SWEP.Trivia_Year = 2024

SWEP.Slot = 1

SWEP.UseHands = true

SWEP.ViewModel = "models/arccw/strasser/weapons/c_ddeagle.mdl"
SWEP.WorldModel = "models/arccw/weapons/synbf3/w_scoutblaster.mdl"
SWEP.ViewModelFOV = 90
SWEP.HideViewmodel = true
SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0),
    bone = "ValveBiped.Bip01_R_Hand",
    scale = 0.09
}

SWEP.IconOverride = "materials/entities/rw_sw_dual_dl44.png"

SWEP.DefaultBodygroups = "000000000000"

-- [Damage] --
SWEP.Damage = 23
SWEP.DamageMin = 13

-- [Range] --
SWEP.Range = 330
SWEP.RangeMin = 100

-- [Recoil] --
SWEP.Recoil = 0.7
SWEP.RecoilPunch = 0.6
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.31

-- [Fire Rate M/R] --
SWEP.Delay = 60 / 330

SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 400


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_yellow"
SWEP.TracerCol = Color(255, 165, 18)
SWEP.HullSize = 1.5

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 32

SWEP.Num = 1
SWEP.Firemodes = {
	{
		Mode = 1
	},
    {
        Mode = 0
    },
}

SWEP.AccuracyMOA = 0.56 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 460 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

SWEP.ShootSound = "w/dl44.wav"

SWEP.MuzzleFlashColor = Color(255, 165, 18, 50)

SWEP.IronSightStruct = {
    Pos = Vector(0, -4, 1),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "",
     ViewModelFOV = 90,
}
SWEP.HoldtypeHolstered = ""
SWEP.HoldtypeActive = "duel"
SWEP.HoldtypeSights = ""


SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0, -5, -1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(0, -14,-10)
SWEP.SprintAng = Angle(40, 0, 0)

SWEP.HolsterPos = Vector(0.532, -6, 0)
SWEP.HolsterAng = Vector(-25, 0, 0)

SWEP.ReloadPos = Vector(0, -10, -5)

SWEP.CustomizePos = Vector(-0.5, -8, -4.897)
SWEP.CustomizeAng = Angle(30, 0, 0)

SWEP.InBipodPos = Vector(-8, 0, -4)
SWEP.InBipodMult = Vector(2, 1, 1)
SWEP.DrawCrosshair = true

SWEP.BarrelLength = 60
SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(3, 0, -3)
SWEP.DefaultElements = {"dl44", "dl44+"}

SWEP.AttachmentElements = {
    ["dl44"] = {
        VMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/dl44_pistol_ext.mdl",
                Bone = "LeftHand_1stP",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(3, 2, -0.7),
                    ang = Angle(85, -2, 90)
                }
            }
        },
    },
    ["dl44+"] = {
         VMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/dl44_pistol_ext.mdl",
                Bone = "RightHand_1stP",
                Scale = Vector(1.1, 1.1, 1.1),                
                Offset = {
                    pos = Vector(-3.5, -2.2, 1.2),
                    ang = Angle(90, -2, -90)
                }
            }
        }, 
        WMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/dl44_pistol_ext.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(30, 15, -10),
                    ang = Angle(180, -90, 2)
                }
            },
            {
                Model = "models/arccw/sw_battlefront/weapons/dl44_pistol_ext.mdl",
                Bone = "ValveBiped.Bip01_L_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(-50, 230, -55),
                    ang = Angle(180, -90, 2)
                }
            },
        },            -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}
WMOverride = "models/arccw/sw_battlefront/weapons/dl44_pistol_ext.mdl"

--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Energization", -- print name
        DefaultAttName = "Standard Energization", -- used to display the "no attachment" text
        Slot = "ammo",
    }
}


SWEP.Animations = {
    ["idle"] = {
        Source = "idle"
    },
    ["fire"] = {
        Source = {"shoot_lw", "shoot_rw"},
    },
    ["draw"] = {
        Source = "draw",
        Mult = 1.5,
        SoundTable = {
            {
                s = "draw/gunfoley_pistol_draw_var_10.mp3", -- sound; can be string or table
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
        Time = 3.35,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_PHYSGUN,
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