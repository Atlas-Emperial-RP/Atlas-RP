AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/radio/radio.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	-- self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
	
	local screen = ents.Create("computer_screen_medicmod")
	screen:SetPos( self:GetPos() + self:GetAngles():Forward() * -35 + self:GetAngles():Up() * 70 )
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ang:Forward(), 0);
	ang:RotateAroundAxis(ang:Right(),0);
	ang:RotateAroundAxis(ang:Up(), 180);
	screen:SetAngles( ang )
	screen:Spawn()
	screen:SetParent( self )
	
	self.Screen = screen
	
end

local sentences = ConfigurationMedicMod.Sentences
local lang = ConfigurationMedicMod.Language

function ENT:ScanPlayer( ply )

	local pos = ply:GetPos()
	local ang = ply:GetAngles()

	local hbed = ents.Create("prop_vehicle_prisoner_pod")
	hbed:SetModel("models/vehicles/prisoner_pod_inner.mdl")
	hbed:SetPos( self:GetPos() + self:GetAngles():Up() * 40 + self:GetAngles():Right() * -35+ self:GetAngles():Forward() * 20	)
	hbed:SetAngles( self:GetAngles() + Angle(-90,0,90))
	hbed:SetNoDraw(true)
	hbed:SetCollisionGroup(COLLISION_GROUP_WORLD)
	hbed:SetSolid(SOLID_NONE)
	hbed.locked = true
	
	self.ragdoll = hbed
	
	ply:EnterVehicle(hbed)
	ply:MedicNotif( sentences["You are being scanned"][lang], ConfigurationMedicMod.ScanRadioTime)
	
	ply:Freeze( true )
	
	timer.Simple( ConfigurationMedicMod.ScanRadioTime, function()
	
		if not IsValid(ply) or not IsValid(self) or not IsValid(hbed) then return end
		
		ply:Freeze( false )
		
		ply:ExitVehicle(hbed)
		
		hbed:Remove()
		ply:SetPos( pos )
		ply:SetEyeAngles( ang )
		
		self.ragdoll = nil
		
		if not ply.Fractures then return end
		
		net.Start("MedicMod.ScanRadio")
			net.WriteEntity( self )
			net.WriteTable( ply.Fractures )
		net.Broadcast()
		
	end)
end

function ENT:Use( a, c )
	
	if self.ragdoll then return end
	
	self:ScanPlayer( c )
	
end

function ENT:OnRemove()
	if IsValid( self.ragdoll ) then
		self.ragdoll:Remove()
	end
end