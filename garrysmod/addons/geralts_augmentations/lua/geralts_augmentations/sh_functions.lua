--serverside functions like AddMoney are in augmentations/server/sv_augs.lua !
CYBERNETIC_AUGMENTATIONS.CanAfford = function(ply, amount, no_notify)
	local can_afford = CYBERNETIC_AUGMENTATIONS.MoneySystem and ply:canAfford(amount)
	if not can_afford and !no_notify then 
		if SERVER then	
			CYBERNETIC_AUGMENTATIONS.SendNotify(ply, CYBER_AUGS_LANGUAGE.CantAfford, 2, 4)
		else
			CYBERNETIC_AUGMENTATIONS.SendNotify(CYBER_AUGS_LANGUAGE.CantAfford, 2, 4) 
		end
	end 
	return can_afford
end

CYBERNETIC_AUGMENTATIONS.GetRunSpeed = function(ply)
	return ply:GetRunSpeed()
end

CYBERNETIC_AUGMENTATIONS.GetJumpPower = function(ply)
	return ply:GetJumpPower()
end

CYBERNETIC_AUGMENTATIONS.GetMoney = function(ply)
	return CYBERNETIC_AUGMENTATIONS.MoneySystem and ply:getDarkRPVar("money") or 0
end

CYBERNETIC_AUGMENTATIONS.GetDonatePoints = function(ply)
	return 0
end

CYBERNETIC_AUGMENTATIONS.formatMoney = function(amount)
	return DarkRP and DarkRP.formatMoney(amount) or amount .. CYBERNETIC_AUGMENTATIONS.Currency
end

CYBERNETIC_AUGMENTATIONS.CanAffordDonate = function(ply, amount) -- for donate points
	return true
end

CYBERNETIC_AUGMENTATIONS.GetID = function(ply)
	return CYBERNETIC_AUGMENTATIONS.CustomDataID or ply:SteamID64()
end

CYBERNETIC_AUGMENTATIONS.GetAugmentations = function(ply, id)
	if SERVER then
		id = id or CYBERNETIC_AUGMENTATIONS.GetID(ply)
		
		local augs = CYBERNETIC_AUGMENTATIONS_DATA[id]
		if not augs then CYBERNETIC_AUGMENTATIONS_DATA[id] = {} augs = CYBERNETIC_AUGMENTATIONS_DATA[id] end
		
		return augs
	else
		return CYBERNETIC_AUGMENTATIONS_DATA
	end
end

CYBERNETIC_AUGMENTATIONS.CanBuyAug = function(ply, aug) -- you can make custom check here, for example if you use Sandbox and want to use lvl system
	local price, donate_price = aug.Money or 0, aug.Donate or 0

	if (price > 0 and not CYBERNETIC_AUGMENTATIONS.CanAfford(ply, price)) or (donate_price > 0 and not CYBERNETIC_AUGMENTATIONS.CanAffordDonate(ply, donate_price)) then return false end
	return true
end

CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures = function(ent, new_eye)
	for keye,eyes in next,ent:GetMaterials() do
		if string.match(eyes, "/eyeball_") then
			if not new_eye then return end
			ent:SetSubMaterial(keye-1, new_eye)
		end
	end
	if SERVER and ent:IsPlayer() then
		ent.CYBER_AUGS_LastEyeModel = ent:GetModel()
	end
end
--CustomDataID is callback function for id by what data will be saved in database. For example, if you have character system and want to save data for chars. If you don't understand, don't touch it, system will use steamid64 to save data, if no custom id defined.
-- CYBERNETIC_AUGMENTATIONS.CustomDataID = function(ply)
	-- return
-- end

--update 1.0.6
local hide_aug_differentials = {
	["models/geralts_augmentations/myomere/myomere_leg_l.mdl"] = function(ent, var)
		print(var)

		ent:SetBodygroup(0, var)
		
		if var != 0 then
			ent:SetBodygroup(1, 1)
		else
			ent:SetBodygroup(1, 0)
		end
	end,
}
hide_aug_differentials["models/geralts_augmentations/myomere/myomere_leg_r.mdl"] = hide_aug_differentials["models/geralts_augmentations/myomere/myomere_leg_l.mdl"]


CYBERNETIC_AUGMENTATIONS.HideAug = function(ply, ent, var, slot)
	ply:SetNWInt("CYBER_AUGS_Hide_"..slot, var)
	
	local different = hide_aug_differentials[ent:GetModel()]
	
	if different then
		different(ent, var)
	else
		for i = 0, 2 do
			local to_hide = i < var and 1 or 0

			ent:SetBodygroup(i, to_hide)
		end
	end
end