if string.lower(CYBERNETIC_AUGMENTATIONS.Database) ~= "txt" then return end

CYBERNETIC_AUGMENTATIONS.SaveAugmentationsData = function(ply, augs, id)
	id = id or CYBERNETIC_AUGMENTATIONS.GetID(ply)

	local ents = {}
	
	augs = augs or CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply, id)
	
	for slot, data in next, augs do -- we don't want extra unused data to be written, isn't it?
		if data.ent then
			ents[slot] = data.ent
			data.ent = nil
		end
	end
	
	local augs_txt = util.TableToJSON(augs)
	
	file.CreateDir("geralts_augmentations")
	file.Write("geralts_augmentations/"..id..".txt", augs_txt)
	
	for slot, ent in next, ents do
		augs[slot].ent = ent
	end
end

CYBERNETIC_AUGMENTATIONS.LoadData = function(ply, callback)
	local ply_id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
	
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply, ply_id)
	
	if augs and not table.IsEmpty(augs) then
		CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, augs)

		callback(ply, augs)
	else
		local data = file.Read("geralts_augmentations/"..ply_id..".txt")

		if data then
			augs = util.JSONToTable(data)
			
			CYBERNETIC_AUGMENTATIONS_DATA[ply_id] = augs

			CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, augs)

			callback(ply, augs)
		else
			CYBERNETIC_AUGMENTATIONS_DATA[ply_id] = {}

			CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, {})
		end
	end
end
