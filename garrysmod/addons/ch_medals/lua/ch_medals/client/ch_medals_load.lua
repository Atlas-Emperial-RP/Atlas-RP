--[[
	This is a method of ensuring that the player is loaded in, so we can network stuff to them (PlayerInitialSpawn is unreliable)
	-- 76561198165273585
--]]
function CH_Medals.IsPlayerLoadedIn()
	if IsValid( LocalPlayer() ) then
		net.Start( "CH_Medals_Net_HUDPaintLoad" )
		net.SendToServer()
		
		hook.Remove( "HUDPaint", "CH_Medals.IsPlayerLoadedIn" )
	end
end
hook.Add( "HUDPaint", "CH_Medals.IsPlayerLoadedIn", CH_Medals.IsPlayerLoadedIn )