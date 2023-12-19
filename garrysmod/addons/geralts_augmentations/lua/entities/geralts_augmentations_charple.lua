
AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Initialize()
	self:AddEFlags(EFL_NO_THINK_FUNCTION)
	if SERVER then 
		self:DrawShadow(false)
        self:SetMoveType( MOVETYPE_NONE )
	end 
end

function ENT:Draw()
end