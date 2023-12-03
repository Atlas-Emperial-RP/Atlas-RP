AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/drug/drug.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
	self:SetDrug(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	
	self.NextTouch = 0
	
end

function ENT:Touch( ent )
	
	if self.NextTouch > CurTime() then return end
	
	self.NextTouch = CurTime() + 1
	
	if ent:GetClass() ~= "beaker_medicmod" then return end
	
	if self:GetDrug() ~= ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] then return end
	
	local drug
	
	for k, v in pairs( ConfigurationMedicMod.Drugs ) do
		drug = k
		for product, val in pairs( ConfigurationMedicMod.Drugs[k] ) do
			if product ~= "func" or product ~= "price" or product ~= ent:GetProduct1() or product ~= ent:GetProduct2() or product ~= ent:GetProduct3() then 
				drug = nil
				break
			end
		end
		
		if drug then break end

	end

	if not drug then return end

	self:SetDrug( drug )
	ent:SetProduct1(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	ent:SetProduct2(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	ent:SetProduct3(ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language])
	
end

function ENT:Use(a, c)
	
	if self:GetDrug() == ConfigurationMedicMod.Sentences["Empty"][ConfigurationMedicMod.Language] then return end
	
	ConfigurationMedicMod.Drugs[self:GetDrug()].func( c )
	
	self:Remove()
	
end

function ENT:OnRemove()
	if self.DrugSpawner and IsValid( self.DrugSpawner ) then
		local drugsspawned = self.DrugSpawner.DrugsSpawned or 1
		self.DrugSpawner.DrugsSpawned = drugsspawned - 1 or 0
	end
end