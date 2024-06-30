NT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Incendiary Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/tfa_starwars/w_incendiary.mdl"
ENT.FuseTime = 5
ENT.ArmTime = 0
ENT.FireTime = 15
ENT.ImpactFuse = true

ENT.Armed = false

ENT.NextDamageTick = 0

ENT.Ticks = 0

AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()

        timer.Simple(0, function()
            if !IsValid(self) then return end
            self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        end)
        self.ActiveTimer = CurTime() + 1.5
        self.IgniteEnd = 0
        self.IgniteEndTimer = CurTime()
        self.IgniteStage = 0
        self.IgniteStageTimer = CurTime()
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        self:Detonate()
    end
end

function ENT:Think()
    if !self.SpawnTime then self.SpawnTime = CurTime() end

    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime and !self.Armed then
        self:Detonate()
    end

    if CLIENT then
        local emitter = ParticleEmitter(self:GetPos())

        if !self:IsValid() or self:WaterLevel() > 2 then return end
        if !IsValid(emitter) then return end

        emitter:Finish()

        self.Ticks = self.Ticks + 1
    end
end



function ENT:Detonate()
    if self.Exploded then return end
    self.Exploded = true
    self:EmitSound("arccw/inc/inc_detonate_1.wav", 75, 100, 1, CHAN_ITEM)
    self:EmitSound("arccw/inc/inc_detonate_main_far.wav", 100, 100, 1, CHAN_WEAPON)
    
    if SERVER then
        local molotovfire = ents.Create( "tfa_csgo_fire_2" )
        molotovfire:SetPos( self:GetPos() )
        molotovfire:SetOwner( self.Owner )
        molotovfire:Spawn()
        timer.Simple( 10, function()
            if IsValid( molotovfire ) then
                molotovfire:Remove()
            end
        end )
        
        local molotovfire = ents.Create( "tfa_csgo_fire_1" )
        local pos = self:GetPos()
        molotovfire:SetPos( self:GetPos() )
        molotovfire:SetOwner( self.Owner )
        molotovfire:SetCreator( self )
        molotovfire:Spawn()
        timer.Simple( 10, function()
            if IsValid( molotovfire ) then
                molotovfire:Remove()
            end
        end )
        
        self:SetMoveType( MOVETYPE_NONE )
        self:SetSolid( SOLID_NONE )
        self:PhysicsInit( SOLID_NONE )
        self:SetCollisionGroup( COLLISION_GROUP_NONE )
        self:SetRenderMode( RENDERMODE_TRANSALPHA )
        self:SetColor( Color( 255, 255, 255, 0 ) )
        self:DrawShadow( false )
        self:StopParticles()

        self.FireSound = CreateSound(self, "arccw/inc/fire_loop_1.wav")
        self.FireSound:Play()
    
        self.FireSound:ChangePitch(80, self.FireTime)
    end
    self:Remove()
end

function ENT:DrawTranslucent()
    self:Draw()
end

function ENT:OnRemove()
    if !self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()

        --cam.Start3D()
           -- render.SetMaterial( Material("sprites/orangeflare1") ) 
           -- render.DrawSprite( self:GetPos(), math.random(75, 100), math.random(75, 100), Color(255, 255, 255) ) 
        --cam.End3D()
    end
endI