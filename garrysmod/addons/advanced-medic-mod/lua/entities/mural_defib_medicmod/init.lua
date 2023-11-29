AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/mural_defib/mural_defib.mdl")
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

local sentences = ConfigurationMedicMod.Sentences
local lang = ConfigurationMedicMod.Language

function ENT:Think()

	if  not IsValid(self.User) then return end
	
	if self.User:GetPos():DistToSqr( self:GetPos() ) > 62500 then
	
		local ply = self.User
		
		ply:GetActiveWeapon():Remove()
		ply.CantSwitchWeapon = false
		self.User = NULL
		self.Used = false
		constraint.RemoveConstraints( ply, "Rope" )
		
	end

end

function ENT:Use( a, c )
	if self.Used then
		if c == self.User then
			
			c:StripWeapon("defibrillator")

			constraint.RemoveConstraints( c, "Rope" )

			c.CantSwitchWeapon = false
			self.User = NULL
			self.Used = false
			
		end
	else
	
		if c:HasWeapon("defibrillator") then c:MedicNotif(sentences["You already have a defibrillator on you"][lang]) return end
		
		c:Give("defibrillator")
		c:SelectWeapon("defibrillator")
		
		constraint.Rope( self, c, 0, 0 , Vector(0,0,0), Vector(0,0,50), 50, 0, 0, 2, "cable/cable2", false )
		
		c.CantSwitchWeapon = true
		self.User = c
		self.Used = true
		
	end	
end