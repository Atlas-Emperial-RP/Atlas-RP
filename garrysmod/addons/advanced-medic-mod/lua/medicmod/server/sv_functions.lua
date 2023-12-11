local meta = FindMetaTable( "Player" )
 
local lang = ConfigurationMedicMod.Language
local sentences = ConfigurationMedicMod.Sentences
 
function meta:MedicModDamages()
 
    local dmg = 0
   
    if self:IsBleeding() then
        dmg = dmg + ConfigurationMedicMod.DamagePerSecsDuringBleeding * 4
    end
    if self:IsPoisoned() then
        dmg = dmg + ConfigurationMedicMod.DamagePerSecsDuringPoisoned * 4
    end
   
    return dmg or 0
   
end
 
function meta:CreateMedicTimer()
   
    timer.Create("MedicMod"..self:EntIndex(), 4, 0, function()
        if not IsValid( self ) or not self:Alive() then return end
       
        local world = game.GetWorld()
 
       
        local d = DamageInfo()
        d:SetDamage( self:MedicModDamages() )
        d:SetAttacker( world )
        d:SetInflictor( world )
        if self:IsBleeding() then
            d:SetDamageType( DMG_MEDICMODBLEEDING )
           
            -- bleeding effect
            local bone = self:GetBonePosition(math.random(1, self:GetBoneCount() - 1))
            if bone then
                local ef = EffectData()
                ef:SetOrigin(bone)
                util.Effect("BloodImpact", ef, true, true)
            end
           
            -- bleeding decals
			if ConfigurationMedicMod.DecalsBleeding then
				local src = self:LocalToWorld(self:OBBCenter())
				for i = 1, 12 do
					local dir = VectorRand() * self:GetModelRadius() * 1.4
					util.Decal("Blood", src - dir, src + dir)
				end
			end
           
        else
            d:SetDamageType( DMG_MEDICMOD )
        end
		
		local health = self:Health()
		
		self:TakeDamageInfo( d )
		self:SetHealth(health-self:MedicModDamages())

		if self:Health() <= 0 and self:Alive() then
			self:Kill()
		end
       
    end)
 
end
 
function meta:SetBleeding( bool )
   
    if self:HasGodMode() then return end
    if not ConfigurationMedicMod.CanGetBleeding then return end
	if table.HasValue( ConfigurationMedicMod.TeamsCantGetBleeding, self:Team() ) then return end
 
    self:SetNWBool("Bleeding", bool )
   
    if not bool then
        if timer.Exists( "MedicMod"..self:EntIndex() ) then
            if not self:IsPoisoned() then
                timer.Destroy("MedicMod"..self:EntIndex())
            end
        end
        return
    end
   
    if timer.Exists( "MedicMod"..self:EntIndex() ) then return end
	
	hook.Run( "onPlayerStartsBleeding", self )
	
    self:CreateMedicTimer()
   
end
 
function meta:SetMorphine( bool )
    self:SetNWBool("Morphine", bool )
end
 
function meta:SetHeartAttack( bool )
    self:SetNWBool("HeartAttack", bool )
   
    if timer.Exists( "MedicMod"..self:EntIndex() ) then
        timer.Destroy("MedicMod"..self:EntIndex())
    end
end
 
function meta:SetPoisoned( bool )
	if self:HasGodMode() then return end
    if not ConfigurationMedicMod.CanGetPoisoned then return end
	if table.HasValue( ConfigurationMedicMod.TeamsCantGetPoisoned, self:Team() ) then return end
	
    self:SetNWBool("Poisoned", bool )
   
    if not bool then
        if timer.Exists( "MedicMod"..self:EntIndex() ) then
            if not self:IsBleeding() then
                timer.Destroy("MedicMod"..self:EntIndex())
            end
        end
        return
    end
   
    if timer.Exists( "MedicMod"..self:EntIndex() ) then return end
	
	hook.Run( "onPlayerPoisoned", self )

    self:CreateMedicTimer()
   
end
 
local FractureHitGroups = {}
 
FractureHitGroups["legs"] = {
    [HITGROUP_LEFTLEG] = true,
    [HITGROUP_RIGHTLEG] = true,
}
FractureHitGroups["arms"] = {
    [HITGROUP_LEFTARM] = true,
    [HITGROUP_RIGHTARM] = true,
}
 
function meta:SetFracture( bool, hitgroup )
	if self:HasGodMode() then return end
    if not ConfigurationMedicMod.CanGetFractures then return end
	if table.HasValue( ConfigurationMedicMod.TeamsCantGetFracture, self:Team() ) then return end
   
    if bool then
        self:SetNWBool("Fracture", bool )
       
        if not self.Fractures then self.Fractures = {} end
       
        if self.Fractures[hitgroup] then return end
       
        self.Fractures[hitgroup] = true
       
        if FractureHitGroups["legs"][hitgroup] then
       
            self:MedicNotif(sentences["You broke your leg, your speed is reduced"][lang])
           
            if self.SpeedReduced then return end
           
            self.MMFWalkSpeed = self:GetWalkSpeed()
            self.MMFRunSpeed = self:GetRunSpeed()
           
            self:SetRunSpeed(ConfigurationMedicMod.FracturePlayerSpeed)
            self:SetWalkSpeed(ConfigurationMedicMod.FracturePlayerSpeed)
           
            self.SpeedReduced = true
       
        elseif FractureHitGroups["arms"][hitgroup] then    
           
            self:MedicNotif(sentences["You broke your arm, you can't use any weapon"][lang])
            self:SelectWeapon( "" )
            self.CantSwitchWeaponMF = true
           
        end
		
		hook.Run( "onPlayerBreaksBone", self, hitgroup )
       
    else
       
        if not self.Fractures then self.Fractures = {} end
       
        if FractureHitGroups["legs"][hitgroup] then
 
            if self.Fractures[hitgroup] then
                self.Fractures[hitgroup] = nil
            end
           
            for k, v in pairs( FractureHitGroups["legs"] ) do
                if self.Fractures[k] then
                    return
                end
            end
           
            if not self.MMFRunSpeed or not self.MMFWalkSpeed then return end
 
            self:SetRunSpeed(self.MMFRunSpeed)
            self:SetWalkSpeed(self.MMFWalkSpeed)
           
            self.SpeedReduced = false
       
        elseif FractureHitGroups["arms"][hitgroup] then
           
            if self.Fractures[hitgroup] then
                self.Fractures[hitgroup] = nil
            end
           
            for k, v in pairs( FractureHitGroups["arms"] ) do
                if self.Fractures[k] then
                    return
                end
            end
           
            self.CantSwitchWeaponMF = false
           
        end
       
        for k, v in pairs( self.Fractures ) do
           
            if FractureHitGroups["legs"][ k ] or FractureHitGroups["arms"][ k ] then
                return
            end
           
        end
               
        self:SetNWBool("Fracture", false)
        self:MedicNotif(sentences["You have no more fracture"][lang])
       
    end
   
end
 
function meta:GetFractures()
    return self.Fractures or nil
end
 
function meta:CreateDeathRagdoll()
 
    -- create the ragdoll
    local ragdoll = ents.Create("prop_ragdoll")
    ragdoll:SetPos(self:GetPos())
    ragdoll:SetAngles( self:GetAngles() )
    ragdoll:SetModel(self:GetModel())
 
    ragdoll:SetOwner( self )
    ragdoll:SetDeathRagdoll( true )
	
    -- set bones of the ragdoll at the same pos than bones of the player
    local gpobc = ragdoll:GetPhysicsObjectCount() - 1
 
    for i=0, gpobc do
       
        local bone = self:GetPhysicsObjectNum(i)
       
        if IsValid(bone) then
           
            local bonepos, boneang = self:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))
           
            if bonepos and boneang then
                bone:SetPos(bonepos)
                bone:SetAngles(boneang)
            end
           
        end
       
    end
 
    ragdoll:Spawn()
    ragdoll:Activate()
	
	ragdoll:AddEFlags( EFL_IN_SKYBOX )
	
    -- make a prop to allow the player to pickup the ragdoll
    local pickupProp = ents.Create("prop_physics")
    pickupProp:SetModel("models/hunter/blocks/cube025x025x025.mdl")
    pickupProp:SetPos(ragdoll:GetPos())
    pickupProp:SetNoDraw(true)
    pickupProp:Spawn()
    pickupProp:SetCollisionGroup(COLLISION_GROUP_WORLD)
 
    ragdoll.Prop = pickupProp
   
    pickupProp.ragdoll = ragdoll
 
    constraint.Weld(ragdoll, pickupProp, 0, 0, 0, false)
   
    self.DeathRagdoll = ragdoll
	
	if CLOTHESMOD then self:CM_ApplyRagModel( ragdoll ) end
	
    return ragdoll
   
end
 
function meta:Stabilize( medic )
   
    if self:IsBleeding() then return end
    if self:IsPoisoned() then return end
    if self:GetHeartAttack() then return end
   
    self.NextSpawnTime = ConfigurationMedicMod.TimeBeforeRespawnIfStable + CurTime()
    net.Start("MedicMod.Respawn") net.WriteInt(self.NextSpawnTime, 32) net.Send(self)
    self.Stable = true
    self:MedicNotif( sentences["Your condition has been stabilized"][lang], 10)
	
	hook.Run( "onPlayerStabilized", self, medic )
	
    if not IsValid( medic ) then return end
   
    medic:MedicNotif( sentences["You stabilized the wounded"][lang], 10)
   
end
 
function meta:MedicalRespawn()
   
    local pos
    if not IsValid( self.DeathRagdoll ) or not  self.DeathRagdoll:IsDeathRagdoll() then
        pos = self:GetPos()
    else
        if IsValid(self.DeathRagdoll.Rope) then
            self.DeathRagdoll.Rope:SetParent( nil )
            if self.DeathRagdoll.Rope.Elec and IsValid( self.DeathRagdoll.Rope.Elec ) then
				self.DeathRagdoll.Rope.Elec:SetPatient( nil )
			end
        end
        pos = self.DeathRagdoll:GetPos()
    end
   
    self:MedicNotif( sentences["You have been saved"][lang], 10)
    self:Spawn()
    self:SetPos( pos )
	
	local weaponsstripped = self.WeaponsStripped or {}
    for k, v in pairs( weaponsstripped ) do
        self:Give( v )
    end
	
	hook.Run( "onPlayerRevived", self )
	
end
 
function meta:StartOperation( bed )
   
    local pos = self:GetPos()
    local ang = self:GetAngles()
 
    local hbed = ents.Create("prop_vehicle_prisoner_pod")
    hbed:SetModel("models/vehicles/prisoner_pod_inner.mdl")
    hbed:SetPos( bed:GetPos() + bed:GetAngles():Up() * 22 + bed:GetAngles():Right() * -30   )
    hbed:SetAngles( bed:GetAngles() + Angle(-90,0,90))
    hbed:SetNoDraw(true)
    hbed:SetCollisionGroup(COLLISION_GROUP_WORLD)
    hbed:SetSolid(SOLID_NONE)
    hbed.locked = true
   
    bed.ragdoll = hbed
   
    self:EnterVehicle(hbed)
    self:MedicNotif( sentences["You are having surgery"][lang], ConfigurationMedicMod.SurgicalOperationTime)
	
    self:Freeze( true )
	
	hook.Run( "onPlayerStartsOperation", self )
	
    timer.Simple( ConfigurationMedicMod.SurgicalOperationTime, function()
   
        if not IsValid(self) or not IsValid(bed) or not IsValid(hbed) then return end
           
        self:Freeze( false )
       
        self:SetHealth( self:GetMaxHealth() )
       
        if not self.Fractures then self.Fractures = {} end
 
        for k, v in pairs( self.Fractures ) do
            self:SetFracture( false, k )
        end
		
		self:SetBleeding( false )
       
        hbed:Remove()
		timer.Simple(0.2, function()
			self:SetPos( pos )
			self:SetEyeAngles( ang )
		end)
        bed.ragdoll = nil
       
    end)
   
end

function meta:HaveFractures()
   
    local fract = false
   
    if not self.Fractures then return false end
   
    for k, v in pairs( self.Fractures ) do
           
        if FractureHitGroups["legs"][ k ] or FractureHitGroups["arms"][ k ] then
            fract = true
            break
        end
           
    end
   
    return fract
   
end
 
function StartMedicAnimation( ply, id )

    ply:SetNWString("MedicPlayerModel", ply:GetModel())
    ply:SetModel("models/medicmod/player/medic_anims.mdl")
	ply:SetRenderMode(RENDERMODE_TRANSALPHA)
    ply:SetColor(Color(0,0,0,0))
    ply:SetNWInt("MedicActivity", id ) 
	
    ply:Freeze( true )
   
    -- network animation
    net.Start("MedicMod.PlayerStartAnimation")
    net.Broadcast()
 
end
 
function StopMedicAnimation( ply )

	ply:SetNWInt("MedicActivity", 0 )
	ply:SetModel( ply:GetNWString("MedicPlayerModel") )
	ply:SetColor(Color(255,255,255,255))
	ply:SetNWString("MedicPlayerModel", nil) 
    ply:Freeze( false )
	
	-- network animation
    net.Start("MedicMod.PlayerStopAnimation")
    net.Broadcast()
   
end
 
function IsBleedingDamage( dmg )
   
    local isdmg = false
   
    for k, v in pairs( ConfigurationMedicMod.DamageBleeding ) do
        
		if not v then return end
		
		if dmg:IsDamageType( k ) then
            isdmg = true
        end
        
    end
   
    return isdmg
end
 
function IsPoisonDamage( dmg )
   
    local isdmg = false
   
    for k, v in pairs( ConfigurationMedicMod.DamagePoisoned ) do
        if dmg:IsDamageType( k ) then
            isdmg = true
        end
    end
   
    return isdmg
end

local ent = FindMetaTable( "Entity" )
 
function ent:SetDeathRagdoll( bool )
   
    self:SetNWBool("IsDeathRagdoll", bool )
   
end