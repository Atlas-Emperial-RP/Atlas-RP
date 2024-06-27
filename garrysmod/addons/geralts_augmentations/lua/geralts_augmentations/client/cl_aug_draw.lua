local plyDrawModel = false
local to_hide_vector = Vector(0, 0, 0)
local unhide_vector = Vector(1, 1, 1)
local render = render
local bit_band = bit.band
local InvalidModels = CYBERNETIC_AUGMENTATIONS.InvalidModels

local CYBER_AUGS_RH = CYBER_AUGS_RH
local CYBER_AUGS_LH = CYBER_AUGS_LH
local CYBER_AUGS_RL = CYBER_AUGS_RL
local CYBER_AUGS_LL = CYBER_AUGS_LL

local hide_thighs = CYBERNETIC_AUGMENTATIONS.HideThighs and true or nil

local bones_to_hide = {
	[1] = {
		[0] = {
			["ValveBiped.Bip01_R_Finger0"] = true,
			["ValveBiped.Bip01_R_Finger01"] = true,
			["ValveBiped.Bip01_R_Finger02"] = true,
			["ValveBiped.Bip01_R_Finger1"] = true,
			["ValveBiped.Bip01_R_Finger11"] = true,
			["ValveBiped.Bip01_R_Finger12"] = true,
			["ValveBiped.Bip01_R_Finger2"] = true,
			["ValveBiped.Bip01_R_Finger21"] = true,
			["ValveBiped.Bip01_R_Finger22"] = true,
			["ValveBiped.Bip01_R_Finger3"] = true,
			["ValveBiped.Bip01_R_Finger31"] = true,
			["ValveBiped.Bip01_R_Finger32"] = true,
			["ValveBiped.Bip01_R_Finger4"] = true,
			["ValveBiped.Bip01_R_Finger41"] = true,
			["ValveBiped.Bip01_R_Finger42"] = true,
			["ValveBiped.Bip01_R_Bicep"] = true,
			["ValveBiped.Bip01_R_Wrist"] = true,
			["ValveBiped.Bip01_R_Elbow"] = true,
			["ValveBiped.Bip01_R_Ulna"] = true,
			["ValveBiped.Bip01_R_Trapezius"] = true,
			-- ["ValveBiped.Bip01_R_Shoulder"] = true,
			["ValveBiped.Bip01_R_UpperArm"] = true,
			-- ["ValveBiped.Bip01_R_Hand"] = true,
			["ValveBiped.Bip01_R_Forearm"] = true,
			-- ["ValveBiped.Anim_Attachment_RH"] = true,
		},	
		[1] = {
			["ValveBiped.Bip01_R_Finger0"] = true,
			["ValveBiped.Bip01_R_Finger01"] = true,
			["ValveBiped.Bip01_R_Finger02"] = true,
			["ValveBiped.Bip01_R_Finger1"] = true,
			["ValveBiped.Bip01_R_Finger11"] = true,
			["ValveBiped.Bip01_R_Finger12"] = true,
			["ValveBiped.Bip01_R_Finger2"] = true,
			["ValveBiped.Bip01_R_Finger21"] = true,
			["ValveBiped.Bip01_R_Finger22"] = true,
			["ValveBiped.Bip01_R_Finger3"] = true,
			["ValveBiped.Bip01_R_Finger31"] = true,
			["ValveBiped.Bip01_R_Finger32"] = true,
			["ValveBiped.Bip01_R_Finger4"] = true,
			["ValveBiped.Bip01_R_Finger41"] = true,
			["ValveBiped.Bip01_R_Finger42"] = true,
			["ValveBiped.Bip01_R_Wrist"] = true,
			["ValveBiped.Bip01_R_Ulna"] = true,
			["ValveBiped.Bip01_R_Forearm"] = true,
		},
		[2] = {
			["ValveBiped.Bip01_R_Finger0"] = true,
			["ValveBiped.Bip01_R_Finger01"] = true,
			["ValveBiped.Bip01_R_Finger02"] = true,
			["ValveBiped.Bip01_R_Finger1"] = true,
			["ValveBiped.Bip01_R_Finger11"] = true,
			["ValveBiped.Bip01_R_Finger12"] = true,
			["ValveBiped.Bip01_R_Finger2"] = true,
			["ValveBiped.Bip01_R_Finger21"] = true,
			["ValveBiped.Bip01_R_Finger22"] = true,
			["ValveBiped.Bip01_R_Finger3"] = true,
			["ValveBiped.Bip01_R_Finger31"] = true,
			["ValveBiped.Bip01_R_Finger32"] = true,
			["ValveBiped.Bip01_R_Finger4"] = true,
			["ValveBiped.Bip01_R_Finger41"] = true,
			["ValveBiped.Bip01_R_Finger42"] = true,
			["ValveBiped.Bip01_R_Wrist"] = true,		
		},
		[3] = {},
	},
	[2] = {
		[0] = {
			["ValveBiped.Bip01_L_Finger0"] = true,
			["ValveBiped.Bip01_L_Finger01"] = true,
			["ValveBiped.Bip01_L_Finger02"] = true,
			["ValveBiped.Bip01_L_Finger1"] = true,
			["ValveBiped.Bip01_L_Finger11"] = true,
			["ValveBiped.Bip01_L_Finger12"] = true,
			["ValveBiped.Bip01_L_Finger2"] = true,
			["ValveBiped.Bip01_L_Finger21"] = true,
			["ValveBiped.Bip01_L_Finger22"] = true,
			["ValveBiped.Bip01_L_Finger3"] = true,
			["ValveBiped.Bip01_L_Finger31"] = true,
			["ValveBiped.Bip01_L_Finger32"] = true,
			["ValveBiped.Bip01_L_Finger4"] = true,
			["ValveBiped.Bip01_L_Finger41"] = true,
			["ValveBiped.Bip01_L_Finger42"] = true,
			["ValveBiped.Bip01_L_Bicep"] = true,
			["ValveBiped.Bip01_L_Wrist"] = true,
			["ValveBiped.Bip01_L_Elbow"] = true,
			["ValveBiped.Bip01_L_Ulna"] = true,
			["ValveBiped.Bip01_L_Trapezius"] = true,
			["ValveBiped.Bip01_L_UpperArm"] = true,
			["ValveBiped.Bip01_L_Hand"] = true,
			["ValveBiped.Bip01_L_Forearm"] = true,
		},
		[1] = {
			["ValveBiped.Bip01_L_Finger0"] = true,
			["ValveBiped.Bip01_L_Finger01"] = true,
			["ValveBiped.Bip01_L_Finger02"] = true,
			["ValveBiped.Bip01_L_Finger1"] = true,
			["ValveBiped.Bip01_L_Finger11"] = true,
			["ValveBiped.Bip01_L_Finger12"] = true,
			["ValveBiped.Bip01_L_Finger2"] = true,
			["ValveBiped.Bip01_L_Finger21"] = true,
			["ValveBiped.Bip01_L_Finger22"] = true,
			["ValveBiped.Bip01_L_Finger3"] = true,
			["ValveBiped.Bip01_L_Finger31"] = true,
			["ValveBiped.Bip01_L_Finger32"] = true,
			["ValveBiped.Bip01_L_Finger4"] = true,
			["ValveBiped.Bip01_L_Finger41"] = true,
			["ValveBiped.Bip01_L_Finger42"] = true,
			["ValveBiped.Bip01_L_Wrist"] = true,
			["ValveBiped.Bip01_L_Ulna"] = true,
			["ValveBiped.Bip01_L_Hand"] = true,
			["ValveBiped.Bip01_L_Forearm"] = true,
		},
		[2] = {
			["ValveBiped.Bip01_L_Finger0"] = true,
			["ValveBiped.Bip01_L_Finger01"] = true,
			["ValveBiped.Bip01_L_Finger02"] = true,
			["ValveBiped.Bip01_L_Finger1"] = true,
			["ValveBiped.Bip01_L_Finger11"] = true,
			["ValveBiped.Bip01_L_Finger12"] = true,
			["ValveBiped.Bip01_L_Finger2"] = true,
			["ValveBiped.Bip01_L_Finger21"] = true,
			["ValveBiped.Bip01_L_Finger22"] = true,
			["ValveBiped.Bip01_L_Finger3"] = true,
			["ValveBiped.Bip01_L_Finger31"] = true,
			["ValveBiped.Bip01_L_Finger32"] = true,
			["ValveBiped.Bip01_L_Finger4"] = true,
			["ValveBiped.Bip01_L_Finger41"] = true,
			["ValveBiped.Bip01_L_Finger42"] = true,
			["ValveBiped.Bip01_L_Hand"] = true,
		},
		[3] = {},		
	},
	[3] = {
		[0] = {
			["ValveBiped.Bip01_R_Thigh"] = hide_thighs,
			["ValveBiped.Bip01_R_Calf"] = true,
			["ValveBiped.Bip01_R_Foot"] = true,
			["ValveBiped.Bip01_R_Toe0"] = true,
		},
		[1] = {
			["ValveBiped.Bip01_R_Calf"] = true,
			["ValveBiped.Bip01_R_Foot"] = true,
			["ValveBiped.Bip01_R_Toe0"] = true,
		},
		[2] = {
			["ValveBiped.Bip01_R_Foot"] = true,
			["ValveBiped.Bip01_R_Toe0"] = true,
		},
		[3] = {},		
	},
	[4] = {
		[0] = {
			["ValveBiped.Bip01_L_Thigh"] = hide_thighs,
			["ValveBiped.Bip01_L_Calf"] = true,
			["ValveBiped.Bip01_L_Foot"] = true,
			["ValveBiped.Bip01_L_Toe0"] = true,
		},
		[1] = {
			["ValveBiped.Bip01_L_Calf"] = true,
			["ValveBiped.Bip01_L_Foot"] = true,
			["ValveBiped.Bip01_L_Toe0"] = true,
		},
		[2] = {
			["ValveBiped.Bip01_L_Foot"] = true,
			["ValveBiped.Bip01_L_Toe0"] = true,
		},
		[3] = {},		
	}
}

function CYBERNETIC_AUGMENTATIONS.HideBones(ply, id, to_hide) -- there wasn't other way, trust me. I tried multiple of ways, but they didn't worked
	local vec = to_hide and to_hide_vector or unhide_vector
	local var = ply:GetNWInt("CYBER_AUGS_Hide_"..id)
	
	for k,v in next, bones_to_hide[id][var] do
		local bone = ply:LookupBone(k)
		if bone then
			ply:ManipulateBoneScale(bone, vec)
		end
	end
end

local hide_bones = CYBERNETIC_AUGMENTATIONS.HideBones

local dist = 1000 * 1000
local function check_bonemerge(ent, children)
    if ent:GetNoDraw() or (ent != CYBER_AUGS_LOCALPLAYER and CYBER_AUGS_LOCALPLAYER:GetPos():DistToSqr(ent:GetPos()) > dist) or !ent:Alive() then return true end 

	for k, v in next,children do
		if v:GetClass() == "geralts_augmentations_bonemerge" and !v:GetNoDraw() then
			return true
		end
	end
	return false 
end 

net.Receive("CYBER_AUGS_SyncChildren", function()
    local ent = net.ReadEntity()
	local charple = net.ReadEntity()
    local length = net.ReadUInt(16)

    for _ = 1, length do
        local entity = Entity(net.ReadUInt(16))
        if entity == NULL then continue end
        entity:SetParent(charple)
    end
end)

timer.Create("CYBER_AUGS_CheckForBonemerge", 0.5, 0, function()
	for ply, _ in next, CYBERNETIC_AUGMENTATIONS_PLAYERS do 
		if !IsValid(ply) then CYBERNETIC_AUGMENTATIONS_PLAYERS[ply] = nil continue end 
		
		local augs = ply:GetNWInt("CYBER_AUGS_Limbs")
		
		if augs == 0 then continue end
		
		local children = ply:GetChildren()
		
		if !check_bonemerge(ply, children) then
			net.Start("CYBER_AUGS_RequestChildren")
			net.WriteEntity(ply)
			net.SendToServer()
		end
	end
end )

hook.Add("PrePlayerDraw","CYBER_AUGS_DrawPlayer",function(ply)
    if ply.AUGS_DrawModel then return end
	local augs = ply:GetNWInt("CYBER_AUGS_Limbs")

	if augs == 0 then return end
	
    ply.AUGS_DrawModel = true
		if bit_band(augs, CYBER_AUGS_RH) == CYBER_AUGS_RH then hide_bones(ply, 1, true) end
		if bit_band(augs, CYBER_AUGS_LH) == CYBER_AUGS_LH then hide_bones(ply, 2, true) end
		if bit_band(augs, CYBER_AUGS_RL) == CYBER_AUGS_RL then hide_bones(ply, 3, true) end
		if bit_band(augs, CYBER_AUGS_LL) == CYBER_AUGS_LL then hide_bones(ply, 4, true) end
	
		local ply_color = ply:GetColor()
		local old_r, old_g, old_b = render.GetColorModulation()
		local active_weapon = ply:GetActiveWeapon()
		
		if IsValid(active_weapon) then active_weapon:DrawModel() end
		
		render.SetColorModulation(ply_color.r / 255, ply_color.g / 255, ply_color.b / 255)
			ply:SetupBones()
			ply:DrawModel()
		render.SetColorModulation(old_r, old_g, old_b)
		
		if bit_band(augs, CYBER_AUGS_RH) == CYBER_AUGS_RH then hide_bones(ply, 1) end
		if bit_band(augs, CYBER_AUGS_LH) == CYBER_AUGS_LH then hide_bones(ply, 2) end
		if bit_band(augs, CYBER_AUGS_RL) == CYBER_AUGS_RL then hide_bones(ply, 3) end
		if bit_band(augs, CYBER_AUGS_LL) == CYBER_AUGS_LL then hide_bones(ply, 4) end
    ply.AUGS_DrawModel = false

	return true
end)