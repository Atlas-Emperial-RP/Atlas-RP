AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/test_tube/testtube.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
end

function ENT:OnRemove()
	if self.TestTubeSpawner and IsValid( self.TestTubeSpawner ) then
		local testtubesspawned = self.TestTubeSpawner.TestTubesSpawned or 1
		self.TestTubeSpawner.TestTubesSpawned = testtubesspawned - 1 or 0
	end
end