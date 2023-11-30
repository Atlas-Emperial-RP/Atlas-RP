AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	
	self:SetModel( "models/nada/male/MedicalTrooper.mdl" )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal()
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE or CAP_TURN_HEAD )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
	self.nextClick = CurTime() + 1
	self:SetMaxYawSpeed( 90 )
	
end

function ENT:AcceptInput( event, a, p )

	if( event == "Use" and p:IsPlayer() and self.nextClick < CurTime() )  then
	
		self.nextClick = CurTime() + 2

		if not p.Fractures then
			p.Fractures = {}
		end
		
		net.Start("MedicMod.MedicMenu")
			net.WriteEntity( self )
			net.WriteTable( p.Fractures )
		net.Send( p )
		
	end
	
end

function ENT:OnTakeDamage()
    return 0
end