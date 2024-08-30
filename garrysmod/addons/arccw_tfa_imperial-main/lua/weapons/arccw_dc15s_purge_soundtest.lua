AddCSLuaFile()

SWEP.Base = "arccw_base"
SWEP.Spawnable = true
SWEP.Category = "[ ArcCW ] Imperial TFA Weapons"
SWEP.Credits = { Author1 = "cat"}
SWEP.PrintName = "DC-15S (SOUND)"
SWEP.Trivia_Class = "Imperial Light Blaster Carbine"
SWEP.Trivia_Desc = "High tech compact Imperial DC-15S Blaster Carbine, preffered for CQB enviroments and general allround usage."
SWEP.Trivia_Manufacturer = "BlasTech Industries"
SWEP.Trivia_Calibre = "Medium Density Bolt"
SWEP.Trivia_Mechanism = "Energized Compressed Tibanna"
SWEP.Trivia_Country = "GAR"
SWEP.Trivia_Year = 2020

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

SWEP.IconOverride = "materials/entities/rw_sw_dc15s_purge.png"

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 35
SWEP.RangeMin = 150
SWEP.DamageMin = 24
SWEP.Range = 485
SWEP.Penetration = 1
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 1050


SWEP.TraceNum = 1
SWEP.PhysTracerProfile = 1
--SWEP.ImpactDecal = "FadingScorch"

function SWEP:DoImpactEffect(tr, dmgtype)
    if tr.HitSky then return true end

    util.Decal("fadingscorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal);
    if( game.SinglePlayer() or SERVER or not self:IsCarriedByLocalPlayer() or IsFirstTimePredicted() ) then
        local soundToPlay = "impacts/sw752_hit_1.wav"
        local randomSound = math.random(1,14)
        if randomSound == 1 then
            soundToPlay = "impacts/sw752_hit_4.wav"
        elseif randomSound == 2 then
            soundToPlay = "impacts/sw752_hit_5.wav"
        elseif randomSound == 3 then
            soundToPlay = "impacts/.wav"
        elseif randomSound == 4 then
            soundToPlay = "impacts/sw752_hit_9.wav"
        elseif randomSound == 5 then
            soundToPlay = "impacts/sw752_hit_10.wav"
        elseif randomSound == 6 then
            soundToPlay = "impacts/sw752_hit_12.wav"
        elseif randomSound == 7 then
            soundToPlay = "impacts/sw752_hit_13.wav"
        elseif randomSound == 8 then
            soundToPlay = "impacts/sw752_hit_14.wav"
        elseif randomSound == 9 then
            soundToPlay = "impacts/sw752_hit_19.wav"
        elseif randomSound == 10 then
            soundToPlay = "impacts/sw752_hit_27.wav"
        elseif randomSound == 11 then
            soundToPlay = "impacts/sw752_hit_28.wav"
        elseif randomSound == 12 then
            soundToPlay = "impacts/sw752_hit_30.wav"
        elseif randomSound == 13 then
            soundToPlay = "impacts/sw752_hit_31.wav"
        elseif randomSound == 14 then
            soundToPlay = "impacts/sw752_hit_17.wav"
        end
    
        local effect = EffectData()
        effect:SetOrigin(tr.HitPos)
        effect:SetNormal(tr.HitNormal)

        -- util.Effect( "effect_astw2_swbf_impact", effect );
        sound.Play( soundToPlay, tr.HitPos, 75, 100, 1 );

        local effect = EffectData()
        effect:SetOrigin(tr.HitPos)
        effect:SetStart(tr.StartPos)
        effect:SetDamageType(dmgtype)

        util.Effect("RagdollImpact", effect)
    end

    return true;
end

SWEP.TracerNum = 1
SWEP.Tracer = "tfa_tracer_red"
SWEP.TracerCol = Color(0, 0, 255)
SWEP.HullSize = 2

SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 25

SWEP.Recoil = 0.27
SWEP.RecoilSide = 0.25
SWEP.RecoilRise = 0.13

SWEP.Delay = 60 / 270
SWEP.Num = 1
SWEP.Firemodes = {
	{
		Mode = 1
	},
    {
        Mode = 2
    },
    {
        Mode = 0
    },         
}

SWEP.AccuracyMOA = 0.75 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 800 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 50


----AMMO / stuff----

SWEP.Primary.Ammo = "ar2"

SWEP.ShootVol = 100
SWEP.ShootPitch = 100

--SWEP.ShootSound = "weapons/bf3/dc15.wav"
SWEP.ShootSoundSilenced = "w/dc19.wav"

SWEP.NoFlash = nil -- disable light flash
SWEP.MuzzleEffect = "wpn_muzzleflash_dc17_red"
SWEP.FastMuzzleEffect = nil
SWEP.GMMuzzleEffect = false

SWEP.MuzzleFlashColor = Color(255, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-2.92, -11, 3.2),
    Ang = Angle(0, 0, 0),
     Magnification = 1,
     SwitchToSound = "zoom_in/gunfoley_zoomin_blasterrifle_08.mp3",
     ViewModelFOV = 50,
}
SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(2.9, -6, .5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(7, -10, 0)
SWEP.SprintAng = Angle(-10, 40, 0)

SWEP.HolsterPos = Vector(4, -3, 2)
SWEP.HolsterAng = Vector(-15, 30, -15)

SWEP.CustomizePos = Vector(20.824, -12, 3.897)
SWEP.CustomizeAng = Angle(12.149, 50.547, 45)

SWEP.DefaultElements = {"dc15s", "muzzle"}

SWEP.AttachmentElements = {
    ["dc15s"] = {
        VMElements = {
            {
                Model = "models/arccw/sw_battlefront/weapons/dc15s_carbine.mdl",
                Bone = "v_e11_reference001",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(-1, 0, 0.6),
                    ang = Angle(0, -90, 0)
                },
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
                Model = "models/arccw/sw_battlefront/weapons/dc15s_carbine.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(1.1, 1.1, 1.1),
                Offset = {
                    pos = Vector(3.75, 4.5, -1.5),
                    ang = Angle(-15, 0, 180)
                }
            },
            {
                Model = "models/hunter/plates/plate.mdl",
                Bone = "ValveBiped.Bip01_R_Hand",
                Scale = Vector(0, 0, 0),
                Offset = {
                    pos = Vector(1800, 0, -600),
                    ang = Angle(-15, 0, 180)
                },
                IsMuzzleDevice = true
            },            
        }, -- change the world model to something else. Please make sure it's compatible with the last one.
    }
}

WMOverride = "models/arccw/SW_Battlefront/Weapons/dc15s_carbine.mdl"
--SWEP.Attachments 
SWEP.Attachments = {
    [1] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights", -- used to display the "no attachment" text
        Slot = "optic",
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0.2, 0.5, 4),
            vang = Angle(90, 0, -90),
            wpos = Vector(300, 0, -400),
            wang = Angle(-15, 0, 180)
        },
    },    
    [2] = {
        PrintName = "Foregrip", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = "foregrip",
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments wwill be mostly referring to
        Offset = {
            vpos = Vector(0, 3, 15),
            vang = Angle(90, 0, -90),
            wang = Angle(170, 180, 0),
        },
        SlideAmount = {
        vmin = Vector(-0.2, 2.5, 8),
        vmax = Vector(-0.2, 2.5, 14),
        wmin = Vector(1600, 00, -480), 
        wmax = Vector(1600, 00, -480)  -- how far this attachment can slide in both directions.
        },          
    },
    [3] = {
        PrintName = "Tactical", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"tactical","tac_pistol"},
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 1.5, 11),
            vang = Angle(90, 0, 0),
            wpos = Vector(1150, 120, -550),
            wang = Angle(-15, 0, -90)
        },
    },
    [4] = {
        PrintName = "Muzzle", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"muzzle", "cr2_muzzle", "cr2c_muzzle", "stealth_muzzle", "b1120_muzzle"},
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.2, 1.6, 17.4),
            vang = Angle(90, 0, -90),
            wpos = Vector(1750, 10, -710),
            wang = Angle(-15, 0, -90)
        },
    },
    [5] = {
        PrintName = "Magazine", -- print name
        DefaultAttName = "No Attachment", -- used to display the "no attachment" text
        Slot = {"dc15a_magazine_75", "dc15a_magazine_100"},
        WMScale = Vector(111, 111, 111),
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.3, 2.3, 4),
            vang = Angle(0, 0, 0),
            wpos = Vector(650, 10, -300),
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
        Bone = "e11_sight", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(1, 2, 0),
            vang = Angle(90, 0, -90),
            wpos = Vector(900, 100, -470),
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
        Mult = 1.4,
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