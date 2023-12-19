AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/stretcher/stretcher.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
	self:StartMotionController()
	self.ShadowParams = {}
	self:SetPos(self:GetPos() + Vector(0,0,50))
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
	ragdoll:SetPos(self:GetPos()+self:GetAngles():Up() * 12+self:GetAngles():Right()*35)
	ragdoll:SetAngles(Angle(-90,self:GetAngles().Yaw,-90))
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
	
	if ent:GetClass() == "bed_medicmod" then return end
	
	local rag
	
	if ent:IsDeathRagdoll() then
		rag = ent
	elseif IsValid(ent.ragdoll) && ent.ragdoll:IsDeathRagdoll() then
		rag = ent.ragdoll
	elseif ent:IsVehicle() && ConfigurationMedicMod.Vehicles[ent:GetModel()] && not IsValid(ent.Stretcher) then
		if self:GetPos():Distance(ent:LocalToWorld(ConfigurationMedicMod.Vehicles[ent:GetModel()].backPos)) > 150 then return end
		self:SetPos(ent:LocalToWorld(ConfigurationMedicMod.Vehicles[ent:GetModel()].stretcherPos))
		self:SetAngles(ent:LocalToWorldAngles(ConfigurationMedicMod.Vehicles[ent:GetModel()].stretcherAngle))
		self:SetParent( ent )
		
		ent.Stretcher = self
		ent.SpawnedStretcher = self
		
		if not ConfigurationMedicMod.Vehicles[ent:GetModel()].drawStretcher then
			self:SetRenderMode( RENDERMODE_TRANSALPHA )
			self:SetColor( Color(0,0,0,0) )
		end
		
		return
	end
	
	if self.ragdoll && IsValid( self.ragdoll ) then return end

	if not IsValid( rag ) then return end
	
	if not IsValid( rag:GetOwner() ) then return end
	
	local ply = rag:GetOwner()
	
	self.ragdoll = self:CreateDeathRagdoll( ply )
	
	ply.DeathRagdoll = self.ragdoll
	
	rag:Remove()
	
end