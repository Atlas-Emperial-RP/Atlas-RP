--[[
	Function to give a medal to a player
--]]
net.Receive( "CH_Medals_Net_GiveMedal", function( len, ply )
	local cur_time = CurTime()
	if ( ply.CH_Medals_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Medals_NetDelay = cur_time + 0.5
	
	-- Read net
	local target_sid64 = net.ReadString()
	local medal = net.ReadString()
	
	-- Security sid64 check
	local sid_find = util.SteamIDFrom64( target_sid64 )
	if sid_find == "STEAM_0:0:0" then
		print( "POSSIBLE EXPLOITER!" )
		print( ply, ply:SteamID64() )
		print( "Tried giving medal directly via net message and providing malicious string instead of SteamID!" )
		return
	end
	
	-- Give it
	CH_Medals.GiveMedal( ply, target_sid64, medal )
end )

function CH_Medals.GiveMedal( ply, target_sid64, medal )
	local medal_tbl = CH_Medals.Medals[ medal ]
	
	if not medal_tbl then
		print( "ERROR: Trying to give a medal that does not exist in the config!" )
		print( medal )
		return
	end
	
	local target = player.GetBySteamID64( target_sid64 )
	if IsValid( target ) and not target:IsPlayer() then
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You must target a valid player to give or take medals." ) )
		return
	end
	
	-- Check they can give medals
	if IsValid( ply ) and not ply:CH_Medals_MedalAuthorized() then
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You are not authorized to give or take medals." ) )
		return
	end
	
	-- IF THE PLAYER IS ONLINE:
	if IsValid( target ) then
		-- Check if target already has medal
		for k, v in ipairs( target.CH_Medals ) do
			if v.Key == medal then
				CH_Medals.NotifyPlayer( ply, target:Nick() .." ".. CH_Medals.LangString( "already has this medal!" ) )
				return
			end
		end
		
		-- If they can, then proceed to give!
		table.insert( target.CH_Medals, {
			Key = medal,
			Display = CH_Medals.Config.AutoDisplayMedal,
		} )
		
		-- Notify both
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You have successfully given this medal to" ) .." ".. target:Nick() )
		CH_Medals.NotifyPlayer( target, CH_Medals.LangString( "You have just received medal" ) .." ".. medal_tbl.Name )
		
		-- Save players medals
		CH_Medals.SavePlayerMedals( target )
		
		-- Network the target medals to everyone
		CH_Medals.NetworkMedals( target )
		
		-- bLogs support
		hook.Run( "CH_Medals_Hook_GiveMedal", target:Nick(), medal_tbl.Name, ply and ply:Nick() or "Console" )
		
		-- Addon logs
		CH_Medals.LogAction( medal_tbl.Name, ply and CH_Medals.SQL.Escape( ply:Nick() ) or "Console", ply and ply:SteamID64() or 0, target:Nick(), target:SteamID64(), 1 )
	else -- IF THEY'RE OFFLINE
		CH_Medals.SQL.Query( "SELECT * FROM ch_medals_player WHERE SteamID = '".. target_sid64 .."';", function( data )
			if data then
				-- WE FOUND THEM
				local target_medals = util.JSONToTable( data.Medals )
				
				-- Check if they have medal
				for k, v in ipairs( target_medals ) do
					if v.Key == medal then
						CH_Medals.NotifyPlayer( ply, data.Nick .." ".. CH_Medals.LangString( "already has this medal!" ) )
						return
					end
				end
				
				-- All good, insert it into their table
				table.insert( target_medals, {
					Key = medal,
					Display = false,
				} )

				-- Then update their data entry
				CH_Medals.SQL.Query( "UPDATE ch_medals_player SET Medals = '".. util.TableToJSON( target_medals ) .."' WHERE SteamID = '".. target_sid64 .."';" )
				
				-- Notify giver
				CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You have successfully given this medal to" ) .." ".. data.Nick )
				
				-- bLogs support
				hook.Run( "CH_Medals_Hook_GiveMedal", data.Nick, medal_tbl.Name, ply and ply:Nick() or "Console" )
				
				-- Addon logs
				CH_Medals.LogAction( medal_tbl.Name, ply and CH_Medals.SQL.Escape( ply:Nick() ) or "Console", ply and ply:SteamID64() or 0, data.Nick, data.SteamID, 1 )
			else
				CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "Unable to find any player in the database with the SteamID64" ) ..": ".. target_sid64 )
				return
			end
		end, true )
	end
end

--[[
	Function to take a medal from a player
--]]
net.Receive( "CH_Medals_Net_TakeMedal", function( len, ply )
	local cur_time = CurTime()
	if ( ply.CH_Medals_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Medals_NetDelay = cur_time + 0.5
	
	-- Read net
	local target_sid64 = net.ReadString()
	local medal = net.ReadString()
	
	-- Security sid64 check
	local sid_find = util.SteamIDFrom64( target_sid64 )
	if sid_find == "STEAM_0:0:0" then
		print( "POSSIBLE EXPLOITER!" )
		print( ply, ply:SteamID64() )
		print( "Tried giving medal directly via net message and providing malicious string instead of SteamID!" )
		return
	end
	
	-- Take it
	CH_Medals.TakeMedal( ply, target_sid64, medal )
end )

function CH_Medals.TakeMedal( ply, target_sid64, medal )
	local medal_tbl = CH_Medals.Medals[ medal ]
	
	if not medal_tbl then
		print( "ERROR: Trying to take a medal that does not exist in the config!" )
		print( medal )
		return
	end
	
	local target = player.GetBySteamID64( target_sid64 )
	if IsValid( target ) and not target:IsPlayer() then
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You must target a valid player to give or take medals." ) )
		return
	end
	
	-- Check they can give medals
	if IsValid( ply ) and not ply:CH_Medals_MedalAuthorized() then
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You are not authorized to give or take medals." ) )
		return
	end
	
	-- IF THE PLAYER IS ONLINE:
	if IsValid( target ) then
		local medal_found = false
		
		-- Check if target has the medal then remove it by key
		for k, v in ipairs( target.CH_Medals ) do
			if v.Key == medal then
				medal_found = true
				
				table.remove( target.CH_Medals, k )
				break
			end
		end
		
		-- Actions based on outcome
		if medal_found then
			CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You have successfully removed this medal from" ) .." ".. target:Nick() )
			CH_Medals.NotifyPlayer( target, ply and ply:Nick() or "Console" .." ".. CH_Medals.LangString( "removed your medal" ) .." ".. medal_tbl.Name )
		
			-- Save players medals
			CH_Medals.SavePlayerMedals( target )
			
			-- Network the target medals to everyone
			CH_Medals.NetworkMedals( target )
			
			-- bLogs support
			hook.Run( "CH_Medals_Hook_TakeMedal", ply and ply:Nick() or "Console", medal_tbl.Name, target:Nick() )
			
			-- Addon logs
			CH_Medals.LogAction( medal_tbl.Name, ply and CH_Medals.SQL.Escape( ply:Nick() ) or "Console", ply and ply:SteamID64() or 0, target:Nick(), target:SteamID64(), 0 )
		else
			CH_Medals.NotifyPlayer( target, target:Nick() .." ".. CH_Medals.LangString( "does not have medal" ) .." ".. medal_tbl.Name )
		end
	else -- IF THEY'RE OFFLINE
		CH_Medals.SQL.Query( "SELECT * FROM ch_medals_player WHERE SteamID = '".. target_sid64 .."';", function( data )
			if data then
				-- WE FOUND THEM
				local target_medals = util.JSONToTable( data.Medals )
				local medal_found = false
		
				-- Check if target has the medal then remove it by key
				for k, v in ipairs( target_medals ) do
					if v.Key == medal then
						medal_found = true
						
						table.remove( target_medals, k )
						break
					end
				end
				
				-- If not found then end it here
				if not medal_found then
					CH_Medals.NotifyPlayer( target, data.Nick .." ".. CH_Medals.LangString( "does not have medal" ) .." ".. medal_tbl.Name )
					return
				end
				
				-- Then update their data entry
				CH_Medals.SQL.Query( "UPDATE ch_medals_player SET Medals = '".. util.TableToJSON( target_medals ) .."' WHERE SteamID = '".. target_sid64 .."';" )
				
				-- Notify giver
				CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You have successfully removed this medal from" ) .." ".. data.Nick )
				
				-- bLogs support
				hook.Run( "CH_Medals_Hook_TakeMedal", ply and ply:Nick() or "Console", medal_tbl.Name, data.Nick )
				
				-- Addon logs
				CH_Medals.LogAction( medal_tbl.Name, ply and CH_Medals.SQL.Escape( ply:Nick() ) or "Console", ply and ply:SteamID64() or 0, data.Nick, data.SteamID, 0 )
			else
				CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "Unable to find any player in the database with the SteamID64" ) ..": ".. target_sid64 )
				return
			end
		end, true )
	end
end

--[[
	Function lets an online player show or hide a medal from their dashboard
--]]
net.Receive( "CH_Medals_Net_ShowHideMedal", function( len, ply )
	local cur_time = CurTime()
	if ( ply.CH_Medals_NetDelay or 0 ) > cur_time then
		ply:ChatPrint( "You're running the command too fast. Slow down champ!" )
		return
	end
	ply.CH_Medals_NetDelay = cur_time + 0.2
	
	-- Read net
	local medal_key = net.ReadUInt( 32 )
	local show_hide = net.ReadBool()

	if not ply.CH_Medals[ medal_key ] then
		print( "ERROR: Trying to show/hide invalid medal!" )
		print( medal_key )
		return
	end

	-- If they can, then adjust bool in table
	ply.CH_Medals[ medal_key ].Display = show_hide
	
	-- Notify
	if show_hide then
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You are now showing this medal." ) )
	else
		CH_Medals.NotifyPlayer( ply, CH_Medals.LangString( "You are no longer showing this medal." ) )
	end
	
	-- Save players medals
	CH_Medals.SavePlayerMedals( ply )
	
	-- Network the target medals to everyone
	CH_Medals.NetworkMedals( ply )
end )

function CH_Medals.SavePlayerMedals( ply )
	CH_Medals.SQL.Query( "UPDATE ch_medals_player SET Medals = '".. util.TableToJSON( ply.CH_Medals ) .."' WHERE SteamID = '".. ply:SteamID64() .."';" )
end