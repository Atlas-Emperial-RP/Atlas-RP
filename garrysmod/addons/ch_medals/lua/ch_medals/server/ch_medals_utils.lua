--[[
	Notification function based on the current gamemode
--]]
function CH_Medals.NotifyPlayer( ply, text )
	if not IsValid( ply ) then
		return
	end
	
	if DarkRP then
		DarkRP.notify( ply, 1, CH_Medals.Config.NotificationTime, text )
	else
		ply:ChatPrint( text )
	end
end