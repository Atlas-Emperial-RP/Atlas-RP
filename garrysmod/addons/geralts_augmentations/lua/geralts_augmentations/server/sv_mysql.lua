if string.lower(CYBERNETIC_AUGMENTATIONS.Database) ~= "mysql" then return end

require("mysqloo")

local meta = FindMetaTable("Player")
local mysql_data = {
	host = "localhost",
	port = 3306,
	username = "root",
	password = "",
	database = "darkrp",
}

local tab_name = "geralts_augmentations"
local db_name = mysql_data.database

if not CYBER_AUGS_DB then CYBER_AUGS_DB = mysqloo.connect( mysql_data.host, mysql_data.username, mysql_data.password, db_name, mysql_data.port ) end 

local preparedInsert, preparedUpdate

if CYBER_AUGS_DB:status() == mysqloo.DATABASE_CONNECTED then
	preparedInsert = CYBER_AUGS_DB:prepare("INSERT INTO " .. tab_name .. "(`ID`, `Augmentations`) VALUES (?, ?)")
	preparedUpdate = CYBER_AUGS_DB:prepare("UPDATE " .. tab_name .. " SET Augmentations = ? WHERE ID = ?")
end

local function ConnectToDatabase()
    if not CYBER_AUGS_DB then return end
    print("[CYBER_AUGS] Connecting to Database")
	
	CYBER_AUGS_DB.onConnected = function() 
	    print("[CYBER_AUGS] Database Connection Successful!")
		CYBER_AUGS_DB:setCharacterSet('utf8')
		
		local query = CYBER_AUGS_DB:query([[CREATE TABLE IF NOT EXISTS ]] .. tab_name .. [[(
		ID TEXT NOT NULL,
		Augmentations TEXT NOT NULL)
		]])
		query.onError = function(q, e)
			print(e)
		end
		query:start()
		
		preparedInsert = CYBER_AUGS_DB:prepare("INSERT INTO " .. tab_name .. "(`ID`, `Augmentations`) VALUES (?, ?)")
		preparedUpdate = CYBER_AUGS_DB:prepare("UPDATE " .. tab_name .. " SET Augmentations = ? WHERE ID = ?")

	end
	CYBER_AUGS_DB.onConnectionFailed = function (db, msg)
	    print("[CYBER_AUGS] Connect to Database failed!")
		print(msg)
	end
	
	CYBER_AUGS_DB:connect()
end

local function CheckDB() 
    if not CYBER_AUGS_DB then return end
    if (CYBER_AUGS_DB:status() ~= mysqloo.DATABASE_CONNECTED) then 
	    ConnectToDatabase()
		print("[CYBER_AUGS] Database Connection Restarted")
	end
end
CheckDB()
timer.Create( "CYBER_AUGS_DB_CHECK", 10, 0, CheckDB)

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

	local augs_json = util.TableToJSON(augs)
	local select = CYBER_AUGS_DB:query("SELECT * FROM " .. tab_name .. " WHERE `ID` = " .. id)
	select.onSuccess = function(q, data)
		if data[1] then
			preparedUpdate:setString(1, augs_json)
			preparedUpdate:setString(2, id)
			preparedUpdate:start()
		else
			preparedInsert:setString(1, id)
			preparedInsert:setString(2, augs_json)
			preparedInsert:start()
		end
	end
	select:start()
	
	for slot, ent in next, ents do
		augs[slot].ent = ent
	end
end

CYBERNETIC_AUGMENTATIONS.LoadData = function(ply, callback)
	local ply_id = CYBERNETIC_AUGMENTATIONS.GetID(ply)
	
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations(ply, ply_id)
	
	if augs then
		CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, augs)

		callback(ply, augs)
	else
		local select = CYBER_AUGS_DB:query("SELECT * FROM " .. tab_name .. " WHERE `ID` = " .. ply_id)
		select.onSuccess = function(q, data)
			if data[1] then
				local augs = util.JSONToTable(data[1].Augmentations)
				CYBERNETIC_AUGMENTATIONS_DATA[ply_id] = augs

				CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, augs)

				callback(ply, augs)
			else
				CYBERNETIC_AUGMENTATIONS_DATA[ply_id] = {}

				CYBERNETIC_AUGMENTATIONS.SyncAugs(ply, {})
			end
		end
		select:start()
	end
end