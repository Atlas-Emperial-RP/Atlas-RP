include('shared.lua')

local v = Vector()

local dist = 150 * 150
local NPCs = CYBERNETIC_AUGMENTATIONS.NPCs
local poly = {
	{x = 0, y = 0},
	{x = 50, y = 0},
	{x = 50, y = 100},
	{x = 25, y = 100},
	{x = 0, y = 85},
}

local hide_bones = CYBERNETIC_AUGMENTATIONS.HideBones

function ENT:Initialize()
	self.SetYAW = 0
end

function ENT:TurnHead(ply)
	local ply_eyepos = ply:EyePos()
	local angdiff = (ply_eyepos - self:EyePos()):Angle()

	local yaw = math.NormalizeAngle(angdiff.y - self:GetAngles().y)
	local get_yaw = self:GetPoseParameter("head_yaw") 
	if (yaw < 0 and get_yaw > yaw) or (yaw > 0 and get_yaw < yaw) then 
		self.SetYAW = math.Approach(self.SetYAW, yaw, 1.25)
	end 
	self:SetPoseParameter("head_yaw", yaw)

	self:SetEyeTarget( ply_eyepos )
end 

function ENT:Think()
	local l = LocalPlayer()
	if l:GetPos():DistToSqr( self:GetPos() ) > ( dist ) then if self.SetYAW != 0 then self.SetYAW = 0 end return end 
	self:TurnHead(l)
end

function ENT:DrawTranslucent()
	self:DrawModel()
	
	local pos = self:GetAttachment(self:LookupAttachment("eyes")).Pos
	if CYBER_AUGS_LOCALPLAYER:GetPos():DistToSqr(pos) > dist then return end 
	
	local ang = self:GetAngles()	
	
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)
	
	local NPC = NPCs[self:GetNPC_ID()]
	local w = self.NameW or 0
	local clr = NPC.Color
	
	cam.Start3D2D(pos - ang:Right() * 2 + ang:Forward() * 5, ang, 0.05)
		surface.SetDrawColor(ColorAlpha(color_black, 150))
		draw.NoTexture()
		surface.DrawPoly(poly)
		surface.DrawRect(50, 0, w, 100)
		
		self.NameW = draw.SimpleTextOutlined(NPC.Name, "CYBER_AUGS_NPCFont", 25, 10, clr, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		
		surface.SetDrawColor(clr)
		surface.DrawRect(40 + w, 0, 10, 100)
		
		surface.SetDrawColor(color_black)
		surface.DrawOutlinedRect(40 + w, 0, 10, 100)
	cam.End3D2D()
end 