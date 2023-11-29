AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/firstaidkit/firstaidkit.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
	self.Content = {
		["bandage"] = 3,
		["syringe_antidote"] = 1,
		["syringe_morphine"] = 2,
	}
end

local sentences = ConfigurationMedicMod.Sentences
local lang = ConfigurationMedicMod.Language

function ENT:Use( activator, ply )

	if ply:HasWeapon("first_aid_kit") then ply:MedicNotif(sentences["You already carry a medical kit on you"][lang],5) return end
	
	ply:Give("first_aid_kit")
	ply:SelectWeapon("first_aid_kit")
	
	local weap = ply:GetWeapon("first_aid_kit")
	weap:SetBandage( self.Content["bandage"] )
	weap:SetAntidote( self.Content["syringe_antidote"] )
	weap:SetMorphine( self.Content["syringe_morphine"] )
	
	self:Remove()

end

function ENT:Touch( ent )
	
	self.nexttouch = self.nexttouch or 0
	
	if self.nexttouch > CurTime() then return end
	
	self.nexttouch = CurTime() + 0.5
	
	if ent:GetClass() != "spawned_weapon" then return end
		
	local content = ent:GetWeaponClass()

	if not self.Content[content] then return end
	
	self.Content[content] = self.Content[content] + 1
	
	ent:Remove()
	
end