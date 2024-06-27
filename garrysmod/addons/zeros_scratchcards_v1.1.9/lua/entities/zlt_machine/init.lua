/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680

function ENT:SpawnFunction(ply, tr)
	local SpawnPos = tr.HitPos + tr.HitNormal * 1
	local ent = ents.Create(self.ClassName)
	if not IsValid(ent) then return end
	ent:SetPos(SpawnPos)
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	angle:RotateAroundAxis(angle:Up(), 180)
	ent:SetAngles(angle)
	ent:Spawn()
	ent:Activate()
	zclib.Player.SetOwner(ent, ply)

	return ent
end

function ENT:Initialize()
	self:SetModel(self.Model)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:UseClientSideAnimation()

	self:PhysWake()

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:EnableMotion(false)
	end

	zlt.Machine.Initialize(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77

function ENT:OnRemove()
	zlt.Machine.OnRemove(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

function ENT:AcceptInput(inputName, activator, caller, data)
	if inputName == "Use" and IsValid(activator) and activator:IsPlayer() and activator:Alive() then
		if self.NextUse and CurTime() < self.NextUse then return end
		zlt.Machine.OnUse(self, activator)
		self.NextUse = CurTime() + 0.25
	end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a */
