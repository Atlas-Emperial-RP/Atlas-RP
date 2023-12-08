-- This module holds any type of remote execution functions (IE, 'dangerous')
local CATEGORY_NAME = "GMC Hosting Custom Modules"
------------------------------[ Custom GMC Hosting ] Reload The Map [ Custom GMC Hosting ]------------------------------
function ulx.reloadmap(calling_ply)
	game.ConsoleCommand( "changelevel " .. game.GetMap( ) ..  "\n" )

	ulx.fancyLogAdmin( calling_ply,"#A Has Reloaded the Map!" )
end
local reloadmap = ulx.command( CATEGORY_NAME, "ulx reload", ulx.reloadmap, "!reload" )
reloadmap:defaultAccess( ULib.ACCESS_SUPERADMIN )
reloadmap:help( "Reloads current map to update scripts" )
