-- INITIALIZE SCRIPT
if SERVER then	
	for k, v in ipairs( file.Find( "ch_medals/shared/*.lua", "LUA" ) ) do
		include( "ch_medals/shared/".. v )
		AddCSLuaFile( "ch_medals/shared/".. v )
	end

	for k, v in ipairs( file.Find( "ch_medals/server/*.lua", "LUA" ) ) do
		include( "ch_medals/server/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_medals/server/sql/*.lua", "LUA" ) ) do
		include( "ch_medals/server/sql/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_medals/client/*.lua", "LUA" ) ) do
		AddCSLuaFile( "ch_medals/client/".. v )
	end
end

if CLIENT then
	for k, v in ipairs( file.Find( "ch_medals/shared/*.lua", "LUA" ) ) do
		include( "ch_medals/shared/".. v )
	end
	
	for k, v in ipairs( file.Find( "ch_medals/client/*.lua", "LUA" ) ) do
		include( "ch_medals/client/".. v )
	end
end

-- 76561198165273585