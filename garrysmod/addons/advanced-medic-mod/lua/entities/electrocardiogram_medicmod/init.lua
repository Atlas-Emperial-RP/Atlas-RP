AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/electrocardiogram/electrocardiogram.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	-- self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
	local ent = ents.Create("electrocardiogram_att_medicmod")
	ent:SetPos( self:GetPos() )
	ent:Spawn()
	
	local const, rope = constraint.Rope( self, ent, 0,0, Vector(0,6.5,0), Vector(0,0,0), 30, 0, 0, 1, "cable/cable_lit", true )

	ent.Elec = self
	self.Att = ent
end

function ENT:OnRemove()
	if IsValid( self.Att ) then
		self.Att:Remove()
	end
end
