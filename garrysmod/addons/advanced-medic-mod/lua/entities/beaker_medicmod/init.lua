AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/beaker/beaker.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
	self.NextTouch = 0
	
	self:SetProduct1(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	self:SetProduct2(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	self:SetProduct3(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
end


function ENT:Touch( ent )
	
	if self.NextTouch > CurTime() then return end
	
	self.NextTouch = CurTime() + 1
	
	if ent:GetClass() != "test_tube_medicmod" then return end
	
	if self:GetProduct1() != ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] && self:GetProduct2() != ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] &&  self:GetProduct3() != ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] then
		return
	end

	if self:GetProduct1() == ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] then
		self:SetProduct1( ent:GetProduct() )
		ent:Remove()
	elseif self:GetProduct2() == ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] then
		self:SetProduct2( ent:GetProduct() )
		ent:Remove()
	elseif self:GetProduct3() == ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] then
		self:SetProduct3( ent:GetProduct() )
		ent:Remove()
	end
	
end

function ENT:Use()
	self:SetProduct1(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	self:SetProduct2(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	self:SetProduct3(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
end