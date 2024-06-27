--[[
	Open mining menu via chat command
--]]
function CH_Medals.PlayerSay( ply, text )
	if string.lower( text ) == CH_Medals.Config.MedalsMenuChatCommand then
		if not CH_Medals.Config.UseMedalMenuChatCommand then
			return
		end

		net.Start( "CH_Medals_Net_OpenMedalsMenu" )
		net.Send( ply )
		return ""
	end
end
hook.Add( "PlayerSay", "CH_Medals.PlayerSay", CH_Medals.PlayerSay )

--[[
	Run code on PlayerSpawn
--]]
function CH_Medals.PlayerSpawn( ply )
	local ply_medals = ply.CH_Medals
	
	if not ply_medals then
		return
	end
	
	-- Loop through players medal to see if there is hook to run
	for k, v in ipairs( ply_medals ) do
		local medal_tbl = CH_Medals.Medals[ v.Key ]
		
		if medal_tbl and medal_tbl.PlayerSpawn then
			medal_tbl.PlayerSpawn( ply )
		end
	end
end
hook.Add( "PlayerSpawn", "CH_Medals.PlayerSpawn", CH_Medals.PlayerSpawn )

--[[
	Run code on PlayerDeath
--]]
function CH_Medals.PlayerDeath( ply, inflictor, attacker )
	local ply_medals = ply.CH_Medals
	
	if not ply_medals then
		return
	end
	
	-- Loop through players medal to see if there is hook to run
	for k, v in ipairs( ply_medals ) do
		local medal_tbl = CH_Medals.Medals[ v.Key ]
		
		if medal_tbl and medal_tbl.PlayerDeath then
			medal_tbl.PlayerDeath( ply, inflictor, attacker )
		end
	end
end
hook.Add( "PlayerDeath", "CH_Medals.PlayerDeath", CH_Medals.PlayerDeath )