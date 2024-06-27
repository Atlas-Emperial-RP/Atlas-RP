--[[
	Write a new log entry in our DB
--]]
function CH_Medals.LogAction( medal, nick, sid64, target_nick, target_sid64, give_take )
	if not CH_Medals.Config.UseCustomLogs then
		return
	end
	
	CH_Medals.SQL.Query( "INSERT INTO ch_medals_logs ( Medal, Nick, SteamID, TargetNick, TargetSteamID, GiveTake, Timestamp ) VALUES( '".. medal .."', '".. nick .."', '".. sid64 .."', '".. target_nick .."', '".. target_sid64 .."', '".. give_take .."', '".. os.date( "%Y/%m/%d %X", os.time() ) .."');" )
end