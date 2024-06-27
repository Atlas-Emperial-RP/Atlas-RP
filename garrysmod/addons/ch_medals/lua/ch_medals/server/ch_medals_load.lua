--[[
	Called when a player joins.
	Check if we should create a new account or load an existing account
--]]
function CH_Medals.InitializePlayer( ply )
	local sid64 = ply:SteamID64()
	local escaped_nick = CH_Medals.SQL.Escape( ply:Nick() )
	
	CH_Medals.SQL.Query( "SELECT Medals FROM ch_medals_player WHERE SteamID = '".. sid64 .."';", function( data )
		if data then
			-- Load player
			ply.CH_Medals = util.JSONToTable( data.Medals )
			
			-- Update their nick in the database
			CH_Medals.SQL.Query( "UPDATE ch_medals_player SET Nick = '".. escaped_nick .."' WHERE SteamID = '".. sid64 .."';" )
		else
			-- Write a new profile for the player
			CH_Medals.SQL.Query( "INSERT INTO ch_medals_player ( Nick, Medals, SteamID ) VALUES( '".. escaped_nick .."', '{}', '".. sid64 .."');" )
			
			-- Setup medals table
			ply.CH_Medals = {}
		end
		
		-- Network
		CH_Medals.NetworkMedals( ply )
		
		-- Retrieve all medals of online players
		CH_Medals.RetrieveMedals( ply )
	end, true )
end

--[[
	Call this net when the player is actually loaded in properly
--]]
net.Receive( "CH_Medals_Net_HUDPaintLoad", function( len, ply )
	-- The player is fully loaded in
	CH_Medals.InitializePlayer( ply )
end )