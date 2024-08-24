--[[
   _____                _ _       _     _____           _                 
  / ____|              | (_)     | |   / ____|         | |                
 | |     ___  _ __ ___ | |_ _ __ | | _| (___  _   _ ___| |_ ___ _ __ ___  
 | |    / _ \| '_ ` _ \| | | '_ \| |/ /\___ \| | | / __| __/ _ \ '_ ` _ \ 
 | |___| (_) | | | | | | | | | | |   < ____) | |_| \__ \ ||  __/ | | | | |
  \_____\___/|_| |_| |_|_|_|_| |_|_|\_\_____/ \__, |___/\__\___|_| |_| |_|
                                               __/ |                      
                                              |___/                         
               Created by Summe https://steamcommunity.com/id/DerSumme/
               This content was purchased.                               
]]--

AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "Comlink Array"
ENT.Category = "Summe"
ENT.Editable = true
ENT.Spawnable = true
ENT.AdminOnly = false

function ENT:SpawnFunction( ply, tr, ClassName )
if ( !tr.Hit ) then return end
    local SpawnPos = tr.HitPos + tr.HitNormal * 10
    pAngle = ply:GetAngles()
    pAngle.pitch = pAngle.pitch
    pAngle.roll = pAngle.roll 
    pAngle.yaw = pAngle.yaw + 180
    local ent = ents.Create( ClassName ) 
    ent:SetPos( SpawnPos - Vector(0,0,-10) )
    ent:SetAngles( pAngle )
    ent:Spawn()
    ent:Activate()
    return ent
end

function ENT:Initialize()
    if SERVER then
        self:SetModel( Comlink.Config.Entity.model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:Wake()
		end
        self:SetTrigger(true)

        self:OnSpawn()
    end
end

function ENT:OnSpawn()

    self:SetMaxHealth(Comlink.Config.Entity.hp)
	self:SetHealth(self:GetMaxHealth())

    timer.Simple(1, function()
        local entCache = {}
        for k, v in pairs(ents.GetAll()) do
            if v:GetClass() == "comlink_array" then
                table.insert(entCache, v)
            end
        end

        if #entCache > 1 then
            self:Remove()
            for k, v in pairs(player.GetAll()) do
                SummeLibrary:Chat(v, "comlink", Comlink:L("NOTIFY_MaxArrays"))
            end
            return
        end

        Comlink:ChangeStatus(true)
    end)
end

function ENT:Repair(value)
    self:SetHealth(math.Clamp(self:Health() + value, 0, self:GetMaxHealth()))
    if not Comlink.Enabled and self:Health() >= self:GetMaxHealth() then
        Comlink:ChangeStatus(true)
    end
end

function ENT:OnTakeDamage( dmg )
	self:TakePhysicsDamage( dmg )
    if ( self:Health() <= 0 ) then return end
    self:SetHealth( math.Clamp( self:Health() - dmg:GetDamage(), 0, self:GetMaxHealth() ) )

	if ( self:Health() <= 0 ) then
        local BoomBoom4 = ents.Create( "env_explosion" )
        BoomBoom4:SetKeyValue( "spawnflags", 144 )
        BoomBoom4:SetKeyValue( "iMagnitude", 15 )
        BoomBoom4:SetKeyValue( "iRadiusOverride", 256 )
        BoomBoom4:SetPos( self:GetPos() )
        BoomBoom4:Spawn()
        BoomBoom4:Fire( "explode", "", 0 )

		Comlink:ChangeStatus(false)
	end
end

if CLIENT then 

    local white = Color( 201, 201, 201, 230)

    function ENT:Draw()
        self:DrawModel()

        local p = self:GetPos()

        local ang = self:GetAngles()
        ang:RotateAroundAxis( ang:Forward(), 90 )
        ang:RotateAroundAxis( ang:Up(), 90 )
        ang.y = LocalPlayer():EyeAngles().y - 90

        local health = self:Health()
        local maxHealth = self:GetMaxHealth()

        if LocalPlayer():GetPos():DistToSqr( self:GetPos() ) < 512 * 512 then
            cam.Start3D2D(p + Vector( 0, 0, 60 ), Angle( 0, ang.y, 90 ), .15)
                draw.RoundedBox(0, - 150, - 120, 300, 105, Color( 0, 0, 0, 230 ))
                draw.DrawText(string.upper(Comlink:L("ENTITY_Header")), "Comlink.Title", 0, - 105, white, TEXT_ALIGN_CENTER)

                draw.RoundedBox(5, - 120, - 65, 240, 8, Color( 15, 15, 15, 230))

                if health > 0 then
                    draw.RoundedBox(5, - 120, - 65, 240 * (health / maxHealth), 8, Color( 255, 0, 0, 230))
                end

                if Comlink.Enabled then
                    draw.DrawText(string.upper(Comlink:L("ENTITY_Online")), "Comlink.EntStatus", 0, - 50, SummeLibrary:GetColor("green"), TEXT_ALIGN_CENTER)
                else
                    draw.DrawText(string.upper(Comlink:L("ENTITY_Offline")), "Comlink.EntStatus", 0, - 50, SummeLibrary:GetColor("red"), TEXT_ALIGN_CENTER)
                end

                draw.OutlinedBox(- 150, - 120, 300, 105, 1, white)
            cam.End3D2D()
        end
    end
end