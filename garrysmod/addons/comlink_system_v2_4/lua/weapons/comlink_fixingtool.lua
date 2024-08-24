--[[
   _____                _ _       _     _____           _                 
  / ____|              | (_)     | |   / ____|         | |                
 | |     ___  _ __ ___ | |_ _ __ | | _| (___  _   _ ___| |_ ___ _ __ ___  
 | |    / _ \| '_ ` _ \| | | '_ \| |/ /\___ \| | | / __| __/ _ \ '_ ` _ \ 
 | |___| (_) | | | | | | | | | | |   < ____) | |_| \__ \ ||  __/ | | | | |
  \_____\___/|_| |_| |_|_|_|_| |_|_|\_\_____/ \__, |___/\__\___|_| |_| |_|
                                               __/ |                      
                                              |___/                         
               Created by Summe https://steamcommunity.com/id/DerSumme/
               This content was purchased.                               
]]--

AddCSLuaFile()

SWEP.PrintName = "Comlink Repairing Tool"
SWEP.Slot = 2
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Instructions = "Dieses Tool ist zum Reparieren des Comlink Arrays gedacht!"
SWEP.Author = "Summe"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Category = "Summe"

SWEP.ViewModelFOV = 65
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/c_toolgun.mdl"
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.UseHands = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"



function SWEP:PrimaryAttack()
local ply = self.Owner
local trace = ply:GetEyeTrace()
local traceEnt = trace.Entity
    if IsValid( ply ) && ply:IsPlayer() then
        if traceEnt:GetPos():DistToSqr( ply:EyePos() ) < 150 * 150 then
            if !ply.CooldownActive || ply.CooldownActive < CurTime() then
                if traceEnt:GetClass() == "comlink_array" then
                    traceEnt:Repair(20)
                    local effectdata = EffectData()
                    effectdata:SetOrigin(trace.HitPos)
                    util.Effect("StunstickImpact", effectdata)
                end
                ply.CooldownActive = CurTime() + 0.1
            end
        end
    end
    return true
end

function SWEP:SecondaryAttack()
    return false
end

function SWEP:Reload()
    return false
end