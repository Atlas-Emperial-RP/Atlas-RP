local InvalidModels = CYBERNETIC_AUGMENTATIONS.InvalidModels

AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:Initialize()
	self:AddEFlags(EFL_NO_THINK_FUNCTION)
	if SERVER then 
        self:SetMoveType( MOVETYPE_NONE )
	end 
end

function ENT:DrawTranslucent()
	local charple = self:GetParent()
	
	if not IsValid(charple) then return end
	
	local parent = charple:GetParent()
	
	if IsValid(CYBER_AUGS_LOCALPLAYER) and CYBER_AUGS_LOCALPLAYER == parent and not CYBER_AUGS_LOCALPLAYER:ShouldDrawLocalPlayer() then self:DestroyShadow() return true end
	
	if InvalidModels[parent:GetModel()] then
		self.RenderGroup = RENDERGROUP_OPAQUE
		return
	end
	
	self:DrawModel()
end

function ENT:Draw()
	local charple = self:GetParent()
	
	if not IsValid(charple) then return end
	
	local parent = charple:GetParent()
	
	if IsValid(CYBER_AUGS_LOCALPLAYER) and CYBER_AUGS_LOCALPLAYER == parent and not CYBER_AUGS_LOCALPLAYER:ShouldDrawLocalPlayer() then self:DestroyShadow() return true end
	
	if not InvalidModels[parent:GetModel()] then
		self.RenderGroup = RENDERGROUP_TRANSLUCENT
		return
	end
	
	self:DrawModel()
end