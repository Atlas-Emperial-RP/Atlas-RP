
local HTML				= nil
local DupeInClipboard	= false

spawnmenu.AddCreationTab( "#spawnmenu.category.dupes", function()

	HTML = vgui.Create( "DHTML" )
	JS_Language( HTML )
	JS_Workshop( HTML )

	ws_dupe = WorkshopFileBase( "dupe", { "dupe" } )
	ws_dupe.HTML = HTML

	function ws_dupe:FetchLocal( offset, perpage )

		local f = file.Find( "dupes/*.dupe", "MOD", "datedesc" )

		local saves = {}

		for k, v in ipairs( f ) do

			if ( k <= offset ) then return end
			if ( k > offset + perpage ) then break end

				table.insert( saves, entry )

			elseif ( k > offset + perpage ) then 
				break 
			end
		end

		local results = {
			totalresults	= #f,
			results			= saves
		}

		local json = util.TableToJSON( results, false )
		HTML:Call( "dupe.ReceiveLocal( " .. json .. " )" )

	end

	function ws_dupe:Arm( filename )

		RunConsoleCommand( "dupe_arm", filename )

	end

	function ws_dupe:DownloadAndArm( id )

		-- Server doesn't allow us to arm dupes, don't even try to download anything
		local res = hook.Run( "CanArmDupe", LocalPlayer() )
		if ( res == false ) then LocalPlayer():ChatPrint( "Refusing to download Workshop dupe, server has blocked usage of the Duplicator tool!" ) return end

		MsgN( "Downloading Dupe..." )
		steamworks.DownloadUGC( id, function( name )

			MsgN( "Finished - arming!" )
			ws_dupe:Arm( name )

		end )

	end

	function ws_dupe:Publish( filename, imagename )

		RunConsoleCommand( "dupe_publish", filename, imagename )

	end

	HTML:OpenURL( "asset://garrysmod/html/dupes.html" )
	HTML:Call( "SetDupeSaveState( " .. tostring( DupeInClipboard ) .. " );" )

	return HTML

end, "icon16/control_repeat_blue.png", 200 )

hook.Add( "DupeSaveAvailable", "UpdateDupeSpawnmenuAvailable", function()

	DupeInClipboard = true

	if ( not IsValid( HTML ) ) then return end

	HTML:Call( "SetDupeSaveState( true );" )

end )

hook.Add( "DupeSaveUnavailable", "UpdateDupeSpawnmenuUnavailable", function()

	DupeInClipboard = false

	if ( not IsValid( HTML ) ) then return end

	HTML:Call( "SetDupeSaveState( false );" )

end )

hook.Add( "DupeSaved", "DuplicationSavedSpawnMenu", function()

	if ( not IsValid( HTML ) ) then return end

	HTML:Call( "ShowLocalDupes();" )

end )

concommand.Add( "dupe_show", function()

	g_SpawnMenu:OpenCreationMenuTab( "#spawnmenu.category.dupes" )

	timer.Simple( 1.0, function() if ( not IsValid( HTML ) ) then return end HTML:Call( "ShowLocalDupes();" ) end )

end, nil, "", { FCVAR_DONTRECORD } )
