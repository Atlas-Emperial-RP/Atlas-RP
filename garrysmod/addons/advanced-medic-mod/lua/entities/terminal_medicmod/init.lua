AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/medical_terminal/medical_terminal.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	-- self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
end

function ENT:Use( a, c ) 
	
	if ConfigurationMedicMod.Terminal3D2D then return end
	
	net.Start("MedicMod.TerminalMenu")
		net.WriteEntity( self )
	net.Send(c)
	
end