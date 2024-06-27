AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua") 
include("shared.lua")

local NPCs = CYBERNETIC_AUGMENTATIONS.NPCs
local create_charple = CYBERNETIC_AUGMENTATIONS.CreateCharple
local Items = CYBERNETIC_AUGMENTATIONS.Items

function ENT:Initialize()
	self:SetNPC_ID(1)
	local id = self:GetNPC_ID()
	
	if not NPCs[id] then self:Remove() return end
	
	self:SetSolid(SOLID_BBOX);
	self:SetUseType(SIMPLE_USE);
	self:SetModel(NPCs[id].Model)
	
	self.NextUse = 0
end

function ENT:SetPlayerLook(ply)
	local vec1 = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"))
	local vec2 = ply:GetShootPos()
	
	ply:SetEyeAngles( ( vec1 - vec2 ):Angle() + Angle(5,0,0))
	
	ply:SetFOV(ply:GetFOV() - 10, 0.25)
end 

function ENT:Use(cal, act)
	if CurTime() < self.NextUse then return end 
	if (cal:IsPlayer()) then
		self:SetPlayerLook(cal)
		
		net.Start("CYBER_AUGS_NPCMenu")
		net.WriteEntity(self)
		net.Send(cal)
		
		self.NextUse = CurTime() + 1
	end
end