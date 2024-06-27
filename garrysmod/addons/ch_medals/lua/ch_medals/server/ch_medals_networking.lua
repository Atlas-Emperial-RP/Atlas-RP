--[[
	Network the players medals to everybody
--]]
function CH_Medals.NetworkMedals( ply )
	-- Get the length of the table
	local table_length = #ply.CH_Medals
	
	-- Network it to everybody as efficient as possible
	net.Start( "CH_Medals_Net_NetworkMedals" )
		net.WriteEntity( ply )
		net.WriteUInt( table_length, 6 )
		
		for k, info in ipairs( ply.CH_Medals ) do
			net.WriteString( info.Key )
			net.WriteBool( info.Display )
		end
	net.Broadcast()
end

--[[
	Loop through all online players to get their medals and network it to the newly connected player
--]]
function CH_Medals.RetrieveMedals( ply )
	for k, v in ipairs( player.GetAll() ) do
		if not v.CH_Medals then
			continue
		end
		
		-- Get the length of the table
		local table_length = #v.CH_Medals
		
		if table_length <= 0 then
			continue
		end
		
		-- Network it to everybody as efficient as possible
		net.Start( "CH_Medals_Net_NetworkMedals" )
			net.WriteEntity( v )
			net.WriteUInt( table_length, 6 )
			
			for k, info in ipairs( v.CH_Medals ) do
				net.WriteString( info.Key )
				net.WriteBool( info.Display )
			end
		net.Send( ply )
	end
end