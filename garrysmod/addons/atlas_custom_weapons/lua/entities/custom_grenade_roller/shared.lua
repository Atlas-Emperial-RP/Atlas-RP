ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Grenade Roller"
ENT.Author 				= "Yairme"
ENT.Information 		= "A grenade that rolls around and explodes after a set time."

ENT.Spawnable 			= false

AddCSLuaFile()

ENT.Model = "models/arccw/thermal_detonator.mdl"
ENT.FuseTime = 2
ENT.ArmTime = 0
ENT.ImpactFuse = true

ENT.NextBeepTime = 0
ENT.BeepPitch = 50
ENT.Volume = 60

function ENT:Initialize()
    if SERVER then
        local pb_vert = 1
        local pb_hor = 1
        self:SetModel(self.Model)
        self:PhysicsInitBox( Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor) )
        self:SetSolid(SOLID_VPHYSICS)

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()

        timer.Simple(0.1, function()
            if not IsValid(self) then return end
            self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        end)
    end
end

function ENT:Think()
    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
        self:Detonate()
    end
end 
function ENT:Detonate()
    if SERVER then
        if not self:IsValid() then return end
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() >= 1 then
            util.Effect( "WaterSurfaceExplosion", effectdata )
            self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
        else
            util.Effect( "Explosion", effectdata)
            self:EmitSound("phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)
        end

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end

        util.BlastDamage(self, attacker, self:GetPos(), 75, 200)

        self:Remove()
    end
end

function ENT:PhysicsCollide(colData, physobj, collider)
    if SERVER then
        if colData.Speed > 75 then
            self:EmitSound(Sound("weapons/arccw/grenade_impact" .. math.random(1,3) .. ".wav"))
        elseif colData.Speed > 25 then
            self:EmitSound(Sound("weapons/arccw/grenade_impact" .. math.random(1,3) .. ".wav"))
        end

        local ent = colData.HitEntity

        if ent:IsWorld() then
            self.ImpactFuse = false
        end

        if (CurTime() - self.SpawnTime >= self.ArmTime) and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
        if self.NextBeepTime - 0.9 >= CurTime() and self.NextBeepTime - 1 <= CurTime() then
            cam.Start3D() -- Start the 3D function so we can draw onto the screen.
                render.SetMaterial( Material("effects/blueflare1") ) -- Tell render what material we want, in this case the flash from the gravgun
                render.DrawSprite( self:GetPos(), math.random(100, 200), math.random(100, 200), Color(255, 175, 150) ) -- Draw the sprite in the middle of the map, at 16x16 in it's original colour with full alpha.
            cam.End3D()
        end 
    end
end