
SWEP.Base = "arccw_base_nade"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Starwars [Dec]" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "Incendiary Grenade"
SWEP.Trivia_Class = "Hand Grenade"
SWEP.Trivia_Desc = "Eine Professionele Bradgranate fuer die nutzung durch Clon Pionire und ARCs"
SWEP.Trivia_Manufacturer = "Blas-Tech Industries"
SWEP.Trivia_Mechanism = "Entflambare Fluessigkeit und Kleiner sprengsatz zur entzuendung und verteilung"
SWEP.Trivia_Country = "GAR"

SWEP.Slot = 3
SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/tfa_starwars/c_incendiary.mdl"
SWEP.WorldModel = "models/weapons/tfa_starwars/w_incendiary.mdl"
SWEP.ViewModelFOV = 60

SWEP.WorldModelOffset = {
    pos = Vector(3, 2, -1),
    ang = Angle(-10, 0, 180)
}

SWEP.ProceduralViewBobIntensity = 0

SWEP.FuseTime = false

SWEP.Throwing = true

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 1000
SWEP.ShootEntity = "arccw_thr_inc_per"

SWEP.TTTWeaponType = "weapon_zm_molotov"
SWEP.NPCWeaponType = "weapon_grenade"
SWEP.NPCWeight = 50

SWEP.PullPinTime = 1

SWEP.Animations = {
    ["draw"] = {
        Source = "deploy",
    },
    ["pre_throw"] = {
        Source = "pullpin",
        SoundTable = {
            {
                t = 0,
                s = "arccw/inc/inc_pin.wav",
                c = CHAN_WEAPON
            }
        }
    },
    ["throw"] = {
        Source = "throw",
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE,
        SoundTable = {
            {
                t = 0,
                s = "arccw/inc/grenade_throw.wav",
                c = CHAN_WEAPON
            }
        }
    }
}

sound.Add({
    name = "ARCCW_INC.Draw",
    channel = 16,
    volume = 1.0,
    sound = "arccw/inc/inc_draw.wav"
})A