AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/hospital_bed/hospital_bed.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
	self:StartMotionController()
	self.ShadowParams = {}
end

function ENT:PhysicsSimulate( phys, deltatime )

	phys:Wake()

	self.ShadowParams.secondstoarrive = 0.1
	self.ShadowParams.angle = Angle( 0, self:GetAngles().yaw, 0 )
	self.ShadowParams.maxangular = 5000
	self.ShadowParams.maxangulardamp = 10000
	
	phys:ComputeShadowControl( self.ShadowParams )

end

local boneAngles = {
	[1] = {
		bone = "ValveBiped.Bip01_R_Foot",
		ang = Angle(0,0,0)
	},
	[2] = {
		bone = "ValveBiped.Bip01_L_Foot",
		ang = Angle(-0,0,0)
	},
	[3] = {
		bone = "ValveBiped.Bip01_R_ForeArm",
		ang = Angle(-20,0,0)
	},
	[4] = {
		bone = "ValveBiped.Bip01_L_ForeArm",
		ang = Angle(20,0,0)
	},
	[5] = {
		bone = "ValveBiped.Bip01_L_UpperArm",
		ang = Angle(20,-0,0)
	},
	[6] = {
		bone = "ValveBiped.Bip01_R_UpperArm",
		ang = Angle(-20,-0,0)
	},
	[7] = {
		bone = "ValveBiped.Bip01_Head1",
		ang = Angle(20,0,45)
	},
}


function ENT:CreateDeathRagdoll( ply )

	local ragdoll = ents.Create("prop_physics")
	ragdoll:SetPos(self:GetPos()+self:GetAngles():Up() * 14+self:GetAngles():Right()*-22)
	ragdoll:SetAngles(Angle(-90,self:GetAngles().Yaw,90))
	ragdoll:SetModel(ply:GetModel())
	ragdoll:Spawn()
	ragdoll:SetParent(self)
	for _, inf in pairs( boneAngles ) do
		local bone = ragdoll:LookupBone(inf.bone)
		if bone then
			ragdoll:ManipulateBoneAngles(bone, inf.ang)
		end
	end
	
	ragdoll:SetOwner( ply )
	ragdoll:SetDeathRagdoll( true )	
	
	-- Set the view on the ragdoll
	ply:Spectate( OBS_MODE_CHASE )
	ply:SpectateEntity( ragdoll )
	
	return ragdoll
	
end


function ENT:Touch( ent )
	
	self.nexttouch = self.nexttouch or 0
	
	if self.nexttouch > CurTime() then return end
	
	self.nexttouch = CurTime() + 1
	
	if self.ragdoll && IsValid( self.ragdoll ) then return end
	
	local rag
	local typer
	
	if ent:IsDeathRagdoll() then
		rag = ent
		typer = 1
	elseif IsValid(ent.ragdoll) && ent.ragdoll:IsDeathRagdoll() then
		rag = ent.ragdoll
		typer = 2
	else
		return
	end
	
	if not IsValid( rag:GetOwner() ) then return end
	
	local ply = rag:GetOwner()
	
	self.ragdoll = self:CreateDeathRagdoll( ply )
	
	ply.DeathRagdoll = self.ragdoll
	
	rag:Remove()
	
end

function ENT:OnRemove()
	if IsValid( self.Stand ) then
		self.Stand.Bed = nil
	end
	if IsValid( self.ragdoll ) then
		self.ragdoll:Remove()
	end
end