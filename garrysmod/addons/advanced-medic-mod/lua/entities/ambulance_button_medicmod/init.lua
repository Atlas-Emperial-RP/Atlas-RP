AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/maxofs2d/button_02.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end

end

function ENT:Use( a, c )
	
	local team = c:Team() or 0
		
	if ConfigurationMedicMod.OnlyMedicCanUseVehicleButton and not table.HasValue( ConfigurationMedicMod.MedicTeams, team ) then return end
	
	if not IsValid(self:GetParent()) then self:Remove() return end
	
	local amb = self:GetParent()
	
	if not ConfigurationMedicMod.Vehicles[amb:GetModel()] then self:Remove() return end
	
	if not IsValid( amb.Stretcher ) then return end
	
	local stretcher = amb.Stretcher
	
	stretcher:SetParent( nil )
	stretcher:SetPos(amb:LocalToWorld(ConfigurationMedicMod.Vehicles[amb:GetModel()].backPos))
	stretcher:SetColor(Color(255,255,255,255))
	
	amb.Stretcher = nil
	amb.SpawnedStretcher = stretcher
	
	
end