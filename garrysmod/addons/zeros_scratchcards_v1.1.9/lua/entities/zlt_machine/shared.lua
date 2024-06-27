/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_lottery/machine.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.PrintName = "Machine"
ENT.Category = "Zeros Scratchcards"
ENT.RenderGroup = RENDERGROUP_OPAQUE

ENT.ButtonList = {
	[1] = Vector(10.5,-9.7,48.65),
	[2] = Vector(10.5,-3.3,48.65),
	[3] = Vector(10.5,3,48.65),
	[4] = Vector(10.5,9.4,48.65),
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- ac450a252ccfd31cc7be3778c6daa6ea87f2d445b951d47a65e8d80a8bbab4ca

function ENT:CanProperty(ply)
	return ply:IsSuperAdmin()
end
function ENT:CanTool( ply, tab, str )
	return ply:IsSuperAdmin()
end
function ENT:CanDrive(ply)
	return ply:IsSuperAdmin()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680

// Returns which button the player is looking at
function ENT:OnButton(ply)
	local trace = ply:GetEyeTrace()
	local lp = self:WorldToLocal(trace.HitPos)
	local closest_button
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77

	for k, v in pairs(self.ButtonList) do
		if lp.x < (v.x + 4) and lp.x > (v.x - 4) and lp.y < (v.y + 4) and lp.y > (v.y - 4) and lp.z > 45 and lp.z < 50 then
			closest_button = k
			break
		end
	end

	return closest_button
end

function ENT:OnEditButton(ply)
	local trace = ply:GetEyeTrace()
	local lp = self:WorldToLocal(trace.HitPos)
	if lp.x < 4 and lp.x > 3 and lp.y < 27 and lp.y > 17 and lp.z > 83 and lp.z < 93 then
		return true
	else
		return false
	end
end
