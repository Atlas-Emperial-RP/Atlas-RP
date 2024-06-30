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

    for i = 1,10 do
        local cloud = ents.Create( "arccw_go_fire" )

        if !IsValid(cloud) then return end

        local vel = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * 1500

        cloud.Order = i
        cloud:SetPos(self:GetPos() - (self:GetVelocity() * FrameTime()) + VectorRand())
        cloud:SetAbsVelocity(vel + self:GetVelocity())
        cloud:SetOwner(self:GetOwner())
        cloud:Spawn()
    end

    self:Remove()
end

function ENT:DrawTranslucent()
    self:Draw()
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()

        --cam.Start3D()
           -- render.SetMaterial( Material("sprites/orangeflare1") ) 
           -- render.DrawSprite( self:GetPos(), math.random(75, 100), math.random(75, 100), Color(255, 255, 255) ) 
        --cam.End3D()
    end
end