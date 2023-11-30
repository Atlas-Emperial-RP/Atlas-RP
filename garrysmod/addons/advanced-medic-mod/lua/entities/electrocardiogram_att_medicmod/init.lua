AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    
	self:SetModel("models/props_junk/PopCan01a.mdl")
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

function ENT:Touch( ent )

	if ent:GetClass() ~= "bed_medicmod" then return end
	
	local bed = ent
	local elec = self.Elec

	if not elec or not IsValid(elec) then return end
	
	if not bed.ragdoll or not IsValid( bed.ragdoll ) then return end
	
	if not IsValid( bed.ragdoll:GetOwner() ) then return end
	
	local ragdoll = bed.ragdoll
	local ply = ragdoll:GetOwner()
	local rope = self
	
	local bone = ragdoll:LookupBone("ValveBiped.Bip01_Spine4")
	
	if not bone then return end
		
	local pos, ang = ragdoll:GetBonePosition( bone )
		
	rope:SetPos( pos + ang:Right() * -4 )
	rope:SetParent( ragdoll )
	
	ragdoll.Rope = rope
	
	elec:SetPatient( ply )
	
end

function ENT:OnRemove()
	if IsValid( self.Elec ) then
		self.Elec:Remove()
	end
end
