resource.AddWorkshop("2631018397")

util.AddNetworkString("CYBER_AUGS_SyncAugs")
util.AddNetworkString("CYBER_AUGS_SyncAug")
util.AddNetworkString("CYBER_AUGS_BuyAug")
util.AddNetworkString("CYBER_AUGS_SendNotify")
util.AddNetworkString("CYBER_AUGS_NPCMenu")
util.AddNetworkString("CYBER_AUGS_ExitDialog")
util.AddNetworkString("CYBER_AUGS_RepairAug")
util.AddNetworkString("CYBER_AUGS_PaintAug")
util.AddNetworkString("CYBER_AUGS_SyncChildren")
util.AddNetworkString("CYBER_AUGS_RequestChildren")
util.AddNetworkString("CYBER_AUGS_HideAug")
util.AddNetworkString("CYBER_AUGS_SellAugmentation")
util.AddNetworkString("CYBER_AUGS_SyncAugDeleted")

local Items = CYBERNETIC_AUGMENTATIONS.Items
local max_param = CYBERNETIC_AUGMENTATIONS.MaxParameter
local ChangeEyeTextures = CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures
local MaxBuyDist = CYBERNETIC_AUGMENTATIONS.MaxBuyDistance
local LimbsDamageMultiply = CYBERNETIC_AUGMENTATIONS.LimbsDamageMultiply
local LimbsWorkLimit = CYBERNETIC_AUGMENTATIONS.LimbsWorkLimit
local Abilities = CYBERNETIC_AUGMENTATIONS.Abilities
local PassiveEnergyRestore = CYBERNETIC_AUGMENTATIONS.PassiveEnergyRestore
local MaxEnergy = CYBERNETIC_AUGMENTATIONS.MaxEnergy
local RepairPrice = CYBERNETIC_AUGMENTATIONS.RepairPrice
local UISounds = CYBERNETIC_AUGMENTATIONS.UISounds
local WipeOnDisconnect = CYBERNETIC_AUGMENTATIONS.WipeOnDisconnect
local WipeOnDeath = CYBERNETIC_AUGMENTATIONS.WipeOnDeath

MaxBuyDist = MaxBuyDist * MaxBuyDist

local queued_sync = {}
local store_energy = {}

CYBERNETIC_AUGMENTATIONS.SendNotify = function(ply, msg, type, len)
	if CYBERNETIC_AUGMENTATIONS.CustomNotifyFunction then CYBERNETIC_AUGMENTATIONS.CustomNotifyFunction(ply, msg, type, len) return end
	
	net.Start("CYBER_AUGS_SendNotify")
	net.WriteString(msg)
	net.WriteInt(type, 4)
	net.WriteInt(len, 6)
	net.Send(ply)
end

CYBERNETIC_AUGMENTATIONS.AddMoney = function(ply, amount)
	return CYBERNETIC_AUGMENTATIONS.MoneySystem and ply:addMoney(amount)
end

CYBERNETIC_AUGMENTATIONS.AddPoints = function(ply, amount) -- for donate points
	
end

local function create_charple(ply)
	local charple = ents.Create("geralts_augmentations_charple")
	charple:SetModel("models/player/breen.mdl")
	charple:SetParent(ply)
	charple:AddEffects(EF_BONEMERGE + EF_BONEMERGE_FASTCULL)
	charple:Spawn()
	
	ply.CYBER_AUGS_Charple = charple
end

local function create_aug_ent(ply, skin, color, model, slot)
	local ent = ents.Create("geralts_augmentations_bonemerge")
	ent:SetModel(model)
	ent:SetSkin(skin)
	ent:SetColor(color)
	ent:SetParent(ply.CYBER_AUGS_Charple)
	ent:AddEffects(EF_BONEMERGE + EF_BONEMERGE_FASTCULL)
	ent:Spawn()
	
	return ent
end

CYBERNETIC_AUGMENTATIONS.InstallAugmentation = function(ply, item, id, slot, skin, color, item)
	if not IsValid(ply.CYBER_AUGS_Charple) then create_charple(ply) end
	
	local ply_id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply, ply_id)
	local slot_items = Items[slot]
	
	item = item or slot_items[id]
	
	local old_aug = augs[slot]
	local is_leg = slot == 3 or slot == 4

	local new_aug = {
		id = id,
		skin = skin,
		clr = color,
		mods = {},
		health = item.Health or 100,
	}
	
	local model = item.Model
	local to_add_run = 0
	local to_add_jump = 0
		
	if old_aug then
		local ent = old_aug.ent
		if IsValid(ent) then
			ent:SetModel(model)
			ent:SetSkin(skin)
			ent:SetColor(color)
			
			new_aug.ent = ent
		else
			new_aug.ent = create_aug_ent(ply, skin, color, model, slot)
		end
		
		if is_leg then
			local old_aug_data = slot_items[old_aug.id].Parameters

			to_add_run = to_add_run - (old_aug_data.RunSpeed or 0)
			to_add_jump = to_add_jump - (old_aug_data.JumpPower or 0)
		end
	else
		new_aug.ent = create_aug_ent(ply, skin, color, model, slot)
	end

	if is_leg then
		local new_aug_data = item.Parameters
		
		to_add_run = to_add_run + (new_aug_data.RunSpeed or 0)
		to_add_jump = to_add_jump + (new_aug_data.JumpPower or 0)

		ply:SetRunSpeed(CYBERNETIC_AUGMENTATIONS.GetRunSpeed(ply) + to_add_run)
		ply:SetJumpPower(CYBERNETIC_AUGMENTATIONS.GetJumpPower(ply) + to_add_jump)
	end

	augs[slot] = new_aug

	ply:SetNWInt("CYBER_AUGS_Limbs", bit.bor(ply:GetNWInt("CYBER_AUGS_Limbs"), CYBER_AUGS_SLOTS_TO_BITS[slot]))
	
	CYBERNETIC_AUGMENTATIONS.SyncAug(ply, slot, new_aug, 0.5)
end

local function add_to_queue(ply, slot, queue)
	if not queued_sync[ply] then queued_sync[ply] = {} end
	if queued_sync[ply][slot] then return end
	
	queued_sync[ply][slot] = CurTime() + queue
end

CYBERNETIC_AUGMENTATIONS.SyncAugs = function(ply, augs)
	augs = augs or CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	
	augs = util.TableToJSON(augs)
	augs = util.Compress(augs)
	
	local len = #augs
	
	net.Start("CYBER_AUGS_SyncAugs")
	net.WriteUInt(len, 12)
	net.WriteData(augs, len)
	net.Send(ply)
end

CYBERNETIC_AUGMENTATIONS.SyncAug = function(ply, slot, aug, queue)
	if queue then
		add_to_queue(ply, slot, queue)
		return
	end
	aug = aug or CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)[slot]
	
	if not aug then
		net.Start("CYBER_AUGS_SyncAugDeleted")
		net.WriteUInt(slot, 3)
		net.Send(ply)
	return end

	net.Start("CYBER_AUGS_SyncAug")
	net.WriteUInt(slot, 3)
	net.WriteTable(aug)
	net.Send(ply)
end

CYBERNETIC_AUGMENTATIONS.InstallTorsoMod = function(ply, item, id)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)

	local chips = augs[5]
	if not chips then augs[5] = {} chips = augs[5] end
	chips[id] = true
	
	local params = item.Parameters

	if params then
		if not augs[5].Overall then augs[5].Overall = {} end
		local overall = augs[5].Overall
		
		for param, value in next, params do
			param = string.lower(param)
			local overall_param = overall[param]
			if overall_param then
				if isnumber(value) then overall[param] = overall_param + value
				elseif istable(value) then
					for k, v in next, value do
						local total = (overall_param[k] or 0) + v
						
						if total > max_param then total = max_param end
						
						overall_param[k] = total
					end
				end
			else
				overall[param] = value
			end
		end
	end
	
	CYBERNETIC_AUGMENTATIONS.SyncAug(ply, 5, chips, 0.5)
end

CYBERNETIC_AUGMENTATIONS.InstallEyes = function(ply, item, id)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	local eye_material = item.EyeMaterial
	if eye_material then
		local mat = ""
		local old_eyes = augs[6]

		augs[6] = {
			id = id,
		}
		
		if istable(eye_material) then
			local id = net.ReadUInt(6)
			
			augs[6].mat_id = id
			mat = eye_material[id]
		else
			mat = eye_material
		end
		
		CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures(ply, mat)
		CYBERNETIC_AUGMENTATIONS.SyncAug(ply, 6, augs[6], 0.5)
		return
	end
end

local install_limb = CYBERNETIC_AUGMENTATIONS.InstallAugmentation
local install_torso_mod = CYBERNETIC_AUGMENTATIONS.InstallTorsoMod
local install_head_mod = CYBERNETIC_AUGMENTATIONS.InstallEyes

local aug_install_callbacks = {
	[1] = install_limb,
	[2] = install_limb,
	[3] = install_limb,
	[4] = install_limb,
	[5] = install_torso_mod,
	[6] = install_head_mod
}

local hide_aug = CYBERNETIC_AUGMENTATIONS.HideAug

net.Receive("CYBER_AUGS_HideAug", function(len, ply)
	local slot = net.ReadUInt(3)
	local var = net.ReadUInt(3)
	
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	local aug = augs[slot]
	local ent = aug and aug.ent
	
	if ent and IsValid(ent) then
		aug.hide = var
		
		hide_aug(ply, ent, var, slot)
		CYBERNETIC_AUGMENTATIONS.SyncAug(ply, slot, aug)
	end
end )

net.Receive("CYBER_AUGS_SellAugmentation", function(len, ply)
	local slot = net.ReadUInt(3)
	local ply_id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply, ply_id)
	local aug = augs[slot]
	
	if not aug then return end
	
	local item = Items[slot][aug.id]
	
	if not item then return end
	
	local money, donate = item.Money or 0, item.Donate or 0
	
	if CYBERNETIC_AUGMENTATIONS.MoneySystem and money > 0 then
		CYBERNETIC_AUGMENTATIONS.AddMoney(ply, money * CYBERNETIC_AUGMENTATIONS.SellMoneyMultiply)
	end
	
	if donate and donate > 0 then
		CYBERNETIC_AUGMENTATIONS.AddPoints(ply, donate * CYBERNETIC_AUGMENTATIONS.SellDonateMultiply)
	end

	if IsValid(aug.ent) then
		aug.ent:Remove()
	end

	augs[slot] = nil
	
	CYBERNETIC_AUGMENTATIONS.SyncAug(ply, slot)
	CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply, augs, ply_id)
	CYBERNETIC_AUGMENTATIONS.SendNotify(ply, string.format(CYBER_AUGS_LANGUAGE.SoldAug, CYBERNETIC_AUGMENTATIONS.formatMoney(money), donate), 1, 4)
	
	if slot == 6 then return end

	ply:SetNWInt("CYBER_AUGS_Limbs", bit.band(ply:GetNWInt("CYBER_AUGS_Limbs"), bit.bnot(CYBER_AUGS_SLOTS_TO_BITS[slot])))
end )

net.Receive("CYBER_AUGS_RequestChildren", function(len, ply)
    local ent = net.ReadEntity()
    if not IsValid(ent) then return end
    local tab = {}
    for k, v in next, ent:GetChildren() do
        if v:GetClass() == "geralts_augmentations_bonemerge" then
            table.insert(tab, v)
        end
    end

    net.Start("CYBER_AUGS_SyncChildren")
    net.WriteEntity(ent)
    net.WriteEntity(ent.CYBER_AUGS_Charple)
    net.WriteUInt(#tab, 16)
    for index = 1, #tab do
        net.WriteUInt(tab[index]:EntIndex(), 16);
    end
    net.Send(ply)
end)

net.Receive("CYBER_AUGS_ExitDialog", function(len, ply)
	ply:SetFOV(ply:GetFOV() + 10, 0.25)
end )

net.Receive("CYBER_AUGS_RepairAug", function(len, ply)
	local npc = net.ReadEntity()
	
	if not IsValid(npc) or npc:GetPos():DistToSqr(ply:GetPos()) > MaxBuyDist then return end
	
	local slot = net.ReadUInt(4)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	local aug = augs[slot]
	
	if not aug then return end
	
	local aug_hp = aug.health
	local to_repair = 100 - aug_hp
	local rep_price = to_repair * RepairPrice
	
	if to_repair > 0 and CYBERNETIC_AUGMENTATIONS.CanAfford(ply, rep_price) then
		aug.health = 100
		
		CYBERNETIC_AUGMENTATIONS.AddMoney(ply, -rep_price)
		CYBERNETIC_AUGMENTATIONS.SyncAug(ply, slot, aug, 0.5)
		CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply, augs)
		
		ply:EmitSound(UISounds.RepairSound)
	end
end )

net.Receive("CYBER_AUGS_PaintAug", function(len, ply)
	local npc = net.ReadEntity()

	if not IsValid(npc) or npc:GetPos():DistToSqr(ply:GetPos()) > MaxBuyDist then return end
	
	local slot = net.ReadUInt(4)
	local color = net.ReadColor()
	local skin = net.ReadUInt(4)
	
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	local aug = augs[slot]

	if aug then 
		local ent = aug.ent

		ent:SetColor(color)
		ent:SetSkin(skin)
		
		aug.skin = skin
		aug.clr = color
		
		CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply, augs)
		CYBERNETIC_AUGMENTATIONS.SyncAug(ply, slot, aug, 0.5)
		
		ply:EmitSound(UISounds.PaintSound)
	else
		return
	end
end )

net.Receive("CYBER_AUGS_BuyAug", function(len, ply)
	local npc = net.ReadEntity()
	if not IsValid(npc) or ply:GetPos():DistToSqr(npc:GetPos()) > MaxBuyDist then return end 
	
	local slot, id = net.ReadUInt(3), net.ReadUInt(10)

	if slot == 0 or id == 0 then return end
	
	local item = Items[slot][id]
	
	if not item then return end
	local price, donate_price = item.Money or 0, item.Donate or 0

	if not CYBERNETIC_AUGMENTATIONS.CanBuyAug(ply, item) then return end
	
	local skin, color = net.ReadUInt(4), net.ReadColor()
	color.a = 255
	
	if price > 0 then
		CYBERNETIC_AUGMENTATIONS.AddMoney(ply, -price)
	end 
	if donate_price > 0 then
		CYBERNETIC_AUGMENTATIONS.AddPoints(ply, -donate_price)
	end

	aug_install_callbacks[slot](ply, item, id, slot, skin, color)
	CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply)
	CYBERNETIC_AUGMENTATIONS.SendNotify(ply, string.format(CYBER_AUGS_LANGUAGE.BuyNotification, item.Name, CYBERNETIC_AUGMENTATIONS.formatMoney(price), donate_price), 1, 4)
end )

hook.Add("PlayerInitialSpawn", "CYBER_AUGS_FullLoadHook", function(ply)
   hook.Add("SetupMove",ply,function(self,ply,_,cmd) -- this is method from facepunch wiki to get full loaded player
		if not self or not IsValid(self) or self == NULL then hook.Remove("SetupMove",self) return end 
        if self == ply and not cmd:IsForced() then 
			ply.CYBER_AUGS_SyncCheck = 0
			ply.CYBER_AUGS_EyeCheck = 0
			ply.CYBER_AUGS_AugCheck = 0
			ply.CYBER_AUGS_ActiveAbils = {}
			
			ply:SetNWInt("CYBER_AUGS_Limbs", 0)
			hook.Remove("SetupMove",self) 
			hook.Run("CYBER_AUGS_PlayerLoaded", ply)
		end
	end )
end )

local function adjust_speed(ply)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	
	if not augs then return end
	
	local l_leg, r_leg = augs[4], augs[3]
	local to_add_run, to_add_jump = 0, 0
	
	if l_leg then
		local l_leg_data = Items[4][l_leg.id].Parameters
		
		to_add_run = to_add_run + (l_leg_data.RunSpeed or 0)
		to_add_jump = to_add_jump + (l_leg_data.JumpPower or 0)
	end	
	if r_leg then
		local r_leg_data = Items[4][r_leg.id].Parameters
		
		to_add_run = to_add_run + (r_leg_data.RunSpeed or 0)
		to_add_jump = to_add_jump + (r_leg_data.JumpPower or 0)
	end
	
	ply:SetRunSpeed(CYBERNETIC_AUGMENTATIONS.GetRunSpeed(ply) + to_add_run)
	ply:SetJumpPower(CYBERNETIC_AUGMENTATIONS.GetJumpPower(ply) + to_add_jump)
	
	ply.CYBER_AUGS_SpeedAdjusted = true
end

hook.Add("PlayerSpawn", "CYBER_AUGS_PlayerSpawn", function(ply)
	timer.Simple(4, function()
		adjust_speed(ply)
	end )
end )

local function load_aug_callback(ply, augs)
	local limbs = ply:GetNWInt("CYBER_AUGS_Limbs")
	
	for slot, aug in next, augs do
		local aug_data = Items[slot][aug.id]
		if slot <= 4 then
			local ent = create_aug_ent(ply, aug.skin, aug.clr, aug_data.Model, slot)
			
			aug.ent = ent
			
			limbs = bit.bor(limbs, CYBER_AUGS_SLOTS_TO_BITS[slot])
			
			hide_aug(ply, ent, aug.hide or 0, slot)
		elseif slot == 6 then
			local mat = aug.mat_id and aug_data.EyeMaterial[aug.mat_id] or aug_data.EyeMaterial
			
			CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures(ply, mat)
		end
	end
	
	ply:SetNWInt("CYBER_AUGS_Limbs", limbs)

	if not ply.CYBER_AUGS_SpeedAdjusted then
		adjust_speed(ply)
	end
end

hook.Add("CYBER_AUGS_PlayerLoaded", "LoadAugmentations", function(ply)
	if not IsValid(ply.CYBER_AUGS_Charple) then create_charple(ply) end
	
	local ply_id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
	
	ply:SetNWFloat("CYBER_AUGS_Energy", store_energy[ply_id] or MaxEnergy)
	
	CYBERNETIC_AUGMENTATIONS_PLAYERS[ply] = true
	
	CYBERNETIC_AUGMENTATIONS.LoadData(ply, load_aug_callback)
	
	timer.Simple(1, function()
		if not CYBERNETIC_AUGMENTATIONS_DATA[ply_id] then CYBERNETIC_AUGMENTATIONS_DATA[ply_id] = {} end
	end )
end )

local hitgroups_to_augs = {
	[1] = 6,
	[2] = 5,
	[3] = 5,
	[4] = 2,
	[5] = 1,
	[6] = 4,
	[7] = 3,
	[10] = 5,
}

hook.Add( "EntityTakeDamage", "CYBER_AUGS_DamageHook", function( target, dmginfo )
	if not target:IsPlayer() then return end
	
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(target)
	
	if not augs or table.IsEmpty(augs) then return end
	
	local lh = target:LastHitGroup()
	local limb = hitgroups_to_augs[lh]
	local aug = limb and augs[limb]
	local damage_type = dmginfo:GetDamageType()
	
	if not aug then
		if damage_type == DMG_FALL then
			local l_leg, r_leg = augs[4], augs[3]
			local prot = 0
			if l_leg then
				prot = prot + l_leg.Parameters.Protection[DMG_FALL] or 0
			end			
			if r_leg then
				prot = prot + r_leg.Parameters.Protection[DMG_FALL] or 0
			end
			local scale = 100 - prot
			if scale < 0 then scale = 0 end
			
			dmginfo:ScaleDamage(scale / 100)
		else
			if not augs[5] then return end

			local torso_parameters = augs[5].Overall
			
			if not torso_parameters then return end
			
			local protect = torso_parameters.Protection
			if protect and protect[damage_type] then
				dmginfo:ScaleDamage(protect[damage_type] / 100)
			end
		end
		return 
	end 
	
	local aug_data = Items[limb][aug.id]
	local protections
	if aug_data then
		protections = aug_data.Parameters.Protection
	end 
	
	if protections then
		local cur_dmg_protect = protections[damage_type]
		local aug_health = aug.health
		
		if cur_dmg_protect and not aug.damaged then
			dmginfo:ScaleDamage(cur_dmg_protect / 100)
			local total = aug_health - cur_dmg_protect * LimbsDamageMultiply
			if total < 0 then
				total = 0
			end
			if total < LimbsWorkLimit then
				aug.damaged = true
				CYBERNETIC_AUGMENTATIONS.SendNotify(ply, CYBER_AUGS_LANGUAGE.AugBroken, 2, 4)
			end
			aug.health = total
			
			CYBERNETIC_AUGMENTATIONS.SyncAug(target, limb, aug, 2)
		else
			return
		end
	else
		return
	end
end )

hook.Add("PlayerTick", "CYBER_AUGS_PlayerTick", function(ply)
	local ct = CurTime()
	if not ply.CYBER_AUGS_SyncCheck then return end

	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
	
	if ct > ply.CYBER_AUGS_SyncCheck and augs then
		ply.CYBER_AUGS_SyncCheck = ct + 1
		
		local sync = queued_sync[ply]
		
		if sync then
			if table.Count(sync) > 3 then
				CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, augs)
			else
				for slot, queue in next, sync do
					if ct > queue then
						CYBERNETIC_AUGMENTATIONS.SyncAug(ply, slot)
					end
				end
			end
		end
	end

	if ct > ply.CYBER_AUGS_EyeCheck and augs then -- we need to check if model changed. Unfortunately, there's no hook or something called when model changed
		ply.CYBER_AUGS_EyeCheck = ct + 5
		
		local last_mdl = ply.CYBER_AUGS_LastEyeModel
		if last_mdl and ply:GetModel() != last_mdl then
			local eye = augs and augs[6]
			
			for keye,eyes in next,ply:GetMaterials() do
				ply:SetSubMaterial(keye-1)
			end

			if eye then
				local eye_data = Items[6][eye.id]
				local mat = ""
				local mat_id = eye.mat_id
				
				if mat_id then
					mat = eye_data.EyeMaterial[mat_id]
				else
					mat = eye_data.EyeMaterial
				end

				ChangeEyeTextures(ply, mat)	
			end
		end
	end
	
	if ct > ply.CYBER_AUGS_AugCheck and augs then
		local ActiveAbils = ply.CYBER_AUGS_ActiveAbils
		local Overall = augs[5] and augs[5].Overall
		local regen = Overall and Overall.regen
		local health, max_health = ply:Health(), ply:GetMaxHealth()
		local energy = ply:GetNWFloat("CYBER_AUGS_Energy")
		local is_running = ply:KeyDown(IN_SPEED) and ply:GetVelocity():Length() > 4 and (augs[3] or augs[4])

		if table.IsEmpty(ActiveAbils) and energy < MaxEnergy and not is_running then
			local to_give = energy + PassiveEnergyRestore
			
			if to_give > MaxEnergy then to_give = MaxEnergy end
			
			ply:SetNWFloat("CYBER_AUGS_Energy", to_give)
		elseif energy > 0 then
			for abil, _ in next, ActiveAbils do
				energy = energy - Abilities[abil].EnergyDrain
			end
			if is_running then energy = energy - 1 end
			if energy < 0 then energy = 0 end
			
			ply:SetNWFloat("CYBER_AUGS_Energy", energy)
		end

		if regen and health < max_health then
			local to = health + regen
			
			if to > max_health then to = max_health end
			
			ply:SetHealth(to)
		end
		ply.CYBER_AUGS_AugCheck = ct + 1
	end
end )

hook.Add("PlayerDisconnected", "CYBER_AUGS_PlayerDisconnected", function(ply)
	local id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
	
	CYBERNETIC_AUGMENTATIONS_PLAYERS[ply] = nil
	
	if WipeOnDisconnect then
		CYBERNETIC_AUGMENTATIONS_DATA[id] = {}
		CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply, {})
	else
		CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply, nil, id)
		
		store_energy[id] = ply:GetNWFloat("CYBER_AUGS_Energy")
	end
end )

hook.Add("PlayerDeath", "CYBER_AUGS_PlayerDeath", function(ply)
	if WipeOnDeath then
		local id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
		local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply, id)
		
		for slot, aug in next, augs do
			if IsValid(aug.ent) then aug.ent:Remove() end
		end
		
		CYBERNETIC_AUGMENTATIONS_DATA[id] = {}
		CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, {})
		CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData(ply, {})
		
		ply:SetNWInt("CYBER_AUGS_Limbs", 0)
	end
end )

local default_hotkeys = CYBERNETIC_AUGMENTATIONS.DefaultHotkeys

for abil, key in next, default_hotkeys do
	if not abil then return end
	
	abil = string.lower(abil)
	
	if abil == "visor" or abil == "infokey" then continue end
	
	concommand.Add("cyber_augs_command_"..abil, function(ply)
		if not abil then return end
		
		local abil_data = Abilities[abil]
		local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)
		local chips = augs[5]
		local have_abil = chips and chips.Overall and chips.Overall[abil]
		
		if not abil_data or not have_abil then return end
		
		local active_abils = ply.CYBER_AUGS_ActiveAbils
		local abil_status = active_abils[abil]
		
		if abil_status then
			abil_data.OnDeactivate(ply)
			if abil_data.DeactivateSound then
				ply:EmitSound(abil_data.DeactivateSound)
			end
			active_abils[abil] = nil
		else
			abil_data.OnActivate(ply)
			if abil_data.ActivateSound then
				ply:EmitSound(abil_data.ActivateSound)
			end	
			active_abils[abil] = true
		end
	end )
end

hook.Add("PlayerFootstep", "CYBER_AUGS_Footsteps", function( ply, pos, foot, sound, volume, rf ) 
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply)

	if not augs then return end

	local r_leg, l_leg = augs[3], augs[4]
	
    if foot == 0 and l_leg then
		local custom_foot_sound = Items[4][l_leg.id].FootstepSound
		
		ply:EmitSound(custom_foot_sound or "npc/stalker/stalker_footstep_left1.wav")
	elseif foot == 1 and r_leg then
		local custom_foot_sound = Items[3][r_leg.id].FootstepSound
		
		ply:EmitSound(custom_foot_sound or "npc/stalker/stalker_footstep_right1.wav")
	end 
end )

local function spawn_aug_npc(id, pos, ang)
	local ent = ents.Create("geralts_augmentations_npc")
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:SetNPC_ID(id or 1)
	
	ent:Spawn()
end 

local function save_aug_positions()
	local tab = {}
	local tab_to_edit = {} -- to not create table every cycle
	
	for k, v in next, ents.FindByClass("geralts_augmentations_npc") do 
		tab_to_edit.Pos = v:GetPos()
		tab_to_edit.Ang = v:GetAngles()
		tab_to_edit.ID = v:GetNPC_ID()
		
		tab[#tab + 1] = tab_to_edit
		
		local save = util.TableToJSON(tab)
		file.CreateDir("geralts_augmentations")
		file.Write("geralts_augmentations/npcs.txt", save)		
	end 
end 

local function load_aug_npcs()
	local aug_npcs = file.Read("geralts_augmentations/npcs.txt", "DATA")
	
	if aug_npcs then 
		aug_npcs = util.JSONToTable(aug_npcs)
		for k, v in next, aug_npcs do 
			spawn_aug_npc(v.ID, v.Pos, v.Ang)
		end 
	end 
end 

concommand.Add("geralts_augmentations_spawnnpc", function( ply, cmd, args )
	if ply:IsSuperAdmin() then 
		local trace = ply:GetEyeTrace()
		local id = args[1]
		
		spawn_aug_npc(id, trace.HitPos, Angle(0,0,0))
		ply:ChatPrint(string.format(CYBER_AUGS_LANGUAGE.NPCSpawned, id))
	end
end ) 

concommand.Add("geralts_augmentations_savenpcs", function( ply, cmd, args )
	if ply:IsSuperAdmin() then 
		save_aug_positions()
		ply:ChatPrint(CYBER_AUGS_LANGUAGE.NPCSaved)
	end
end ) 

hook.Add("InitPostEntity", "CYBER_AUGS_SpawnNPC", function()
	load_aug_npcs()
end )

hook.Add("PostCleanupMap", "CYBER_AUGS_SpawnNPC", function()
	load_aug_npcs()
end )