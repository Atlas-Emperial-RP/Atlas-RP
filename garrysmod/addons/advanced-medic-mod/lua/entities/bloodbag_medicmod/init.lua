AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/bloodbag/bloodbag.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
	self:SetBlood(100)
	
	self:SetBodygroup( 0,1 )
end

function ENT:OnRemove()

	if self and IsValid( self ) and self.Stand and IsValid( self.Stand ) then
	
		self.Stand.BloodBag = nil
	
	end

end

-- function ENT:Think()
-- 	if self:GetBlood() <= 0 then
-- 		self:Remove()
-- 	end
-- end