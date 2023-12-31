
local PreviewCache = {}
local InfoCache = {}
local VoteCache = {}
local ListCache = {}

function WorkshopFileBase( namespace, requiredtags )

	local ret = {}
	ret.HTML = nil

	function ret:Fetch( type, offset, perpage, extratags, searchText, filter, sort )

		local tags = table.Copy( requiredtags )
		for k, v in pairs( extratags ) do
			if ( v == "" ) then return end
			table.insert( tags, v )
		end

		if ( type == "local" ) then
			return self:FetchLocal( offset, perpage )
		end
		if ( type == "subscribed" ) then
			return self:FetchSubscribed( offset, perpage, tags, searchText, false, filter, sort )
		end
		if ( type == "subscribed_ugc" ) then
			return self:FetchSubscribed( offset, perpage, tags, searchText, true, filter, sort )
		end

		local userid = "0"
		if ( type == "mine" ) then userid = "1" end

		local cachename = type .. "-" .. table.concat( tags, "/" ) .. offset .. "-" .. perpage .. "-" .. userid

		if ( ListCache[ cachename ] ) then
			self:FillFileInfo( ListCache[ cachename ] )
			return
		end

		steamworks.GetList( type, tags, offset, perpage, 0, userid, function( data )
			ListCache[ cachename ] = data
			self:FillFileInfo( data )
		end )

	end

	function ret:FetchSubscribed( offset, perpage, tags, searchText, isUGC, filter, sort )

		local subscriptions = {}
		if ( isUGC ) then
			subscriptions = engine.GetUserContent()
		else
			subscriptions = engine.GetAddons()
		end

		for id, e in pairs( subscriptions ) do
			if ( e.timeadded == 0 ) then e.timeadded = os.time() end
		end

		if ( sort == "title" ) then
			table.sort( subscriptions, function( a, b )
				return a.title:lower() < b.title:lower()
			end )
		elseif ( sort == "size" ) then
			table.sort( subscriptions, function( a, b )
				return a.size > b.size
			end )
		elseif ( sort == "updated" ) then
			table.sort( subscriptions, function( a, b )
				return a.updated > b.updated
			end )
		else
			table.sort( subscriptions, function( a, b )
				return a.timeadded > b.timeadded
			end )
		end

		-- First build a list of items that fit our search terms
		local searchedItems = {}
		local localFileHack = -1
		for id, item in pairs( subscriptions ) do

			-- This is a dirty hack for local addons, ideally should be done in engine, or not use solely IDs to identify addons
			if ( item.wsid == "0" ) then
				item.wsid = tostring( localFileHack ) -- why is this a string?
				localFileHack = localFileHack - 1
			end

			-- Search for tags
			local found = true
			for id, tag in pairs( tags ) do
				if ( not item.tags:lower():find( tag, 1, true ) ) then found = false end
			end
			if ( not found ) then return end

			-- Search for searchText
			if ( searchText:Trim() ~= "" ) then
				if ( not item.title:lower():find( searchText:lower(), 1, true ) ) then return end
			end

			if ( filter and filter == "enabledonly" ) then
				if ( not steamworks.ShouldMountAddon( item.wsid ) ) then return end
			end
			if ( filter and filter == "disabledonly" ) then
				if ( steamworks.ShouldMountAddon( item.wsid ) ) then return end
			end

			searchedItems[ #searchedItems + 1 ] = item

		end

		-- Build the page!
		local data = {
			totalresults = #searchedItems,
			extraresults = {}, -- The local info about the addon
			otherresults = {}, -- The complete list of IDs that match the search query for the Addons menu UI
			results = {}
		}

		-- Add the list of all items for "select all" in the UI
		local i = 0
		for id, item in ipairs( searchedItems ) do
			data.otherresults[ i ] = item.wsid
			i = i + 1
		end

		-- Add the actual results for the requested range
		local i = 0
		while ( i < perpage ) do

			if ( searchedItems[ offset + i + 1 ] ) then

				local res = table.insert( data.results, searchedItems[ offset + i + 1 ].wsid )
				data.extraresults[ res ] = searchedItems[ offset + i + 1 ]

			end

			i = i + 1

		end

		self:FillFileInfo( data, isUGC )

	end

	function ret:RetrieveUserName( steamid, func )
		steamworks.RequestPlayerInfo( steamid, function( name )
			self.HTML:Call( namespace .. ".ReceiveUserName( \"" .. steamid:JavascriptSafe() .. "\", \"" .. name:JavascriptSafe() .. "\" )" )
			if ( func ) then func( name ) end
		end )
	end

	function ret:FillFileInfo( results, isUGC )

		--
		-- File info failed..
		--
		if ( not results ) then return end

		--
		-- Send the file index..
		--
		local json = util.TableToJSON( results, false )
		self.HTML:Call( namespace .. ".ReceiveIndex( " .. json .. " )" )

		--
		-- Request info on each file..
		--
		for k, v in pairs( results.results ) do

			v = v:JavascriptSafe()

			--
			-- Got it cached?
			--
			if ( PreviewCache[ v ] ) then

				self.HTML:Call( namespace .. ".ReceiveImage( \"" .. v .. "\", \"" .. PreviewCache[ v ] .. "\" )" )

			end

			--
			-- Get the file information
			--
			if ( tonumber( v ) <= 0 ) then

				-- Local addon
				local extra = results.extraresults[ k ]
				if ( not extra ) then extra = {} end

				extra.ownername = "Local"
				extra.description = "Non workshop .gma addon. (" .. extra.file .. ")"
				extra.floating = true

				local json = util.TableToJSON( extra, false )

				self.HTML:Call( namespace .. ".ReceiveFileInfo( \"" .. v .. "\", " .. json .. " )" )
				self.HTML:Call( namespace .. ".ReceiveImage( \"" .. v .. "\", \"html/img/localaddon.png\" )" )

				-- Do not try to get votes for this one
				return

			elseif ( InfoCache[ v ] ) then

				self.HTML:Call( namespace .. ".ReceiveFileInfo( \"" .. v .. "\", " .. InfoCache[ v ] .. " )" )

			else

				steamworks.FileInfo( v, function( result )

					if ( not result or result.error ~= nil ) then
						-- Try to get the title from the GetAddons(), this probably could be done more efficiently
						local title = "Offline addon"
						for id, t in pairs( isUGC and engine.GetUserContent() or engine.GetAddons() ) do
							if ( tonumber( v ) == tonumber( t.wsid ) ) then title = t.title break end
						end

						local json = util.TableToJSON( { title = title, description = "Failed to get addon info, error code " .. ( result and result.error or "unknown" ) }, false )
						self.HTML:Call( namespace .. ".ReceiveFileInfo( \"" .. v .. "\", " .. json .. " )" )
						return
					end

					if ( result.description ) then
						result.description = string.gsub( result.description, "%[img%]([^%]]*)%[/img%]", "" ) -- Gotta remove inner content of img tags
						result.description = string.gsub( result.description, "%[([^%]]*)%]", "" )
						result.description = string.Trim( result.description )
					end

					if ( result.owner and ( not result.ownername or result.ownername == "" or result.ownername == "[unknown]" ) ) then
						self:RetrieveUserName( result.owner, function( name )
							result.ownername = name

							local json = util.TableToJSON( result, false )
							InfoCache[ v ] = json
						end )
					end

					local json = util.TableToJSON( result, false )
					InfoCache[ v ] = json
					self.HTML:Call( namespace .. ".ReceiveFileInfo( \"" .. v .. "\", " .. json .. " )" )

					--
					-- Now we have the preview id - get the preview imagenot 
					--
					if ( not PreviewCache[ v ] and result.previewid ) then

						steamworks.Download( result.previewid, false, function( name )

							-- Download failed
							if ( not name ) then return end

							PreviewCache[ v ] = name:JavascriptSafe()
							self.HTML:Call( namespace .. ".ReceiveImage( \"" .. v .. "\", \"" .. PreviewCache[ v ] .. "\" )" )

						end )

					end

				end )
			end
			::continue::
		end

	end

	function ret:Publish( filename, image )

		--MsgN( "PUBLISHING ", filename )
		--MsgN( "Image ", image )

		local window = vgui.Create( "UGCPublishWindow" )
		window:Setup( namespace, filename, image, self )
		window:MakePopup()
		window:DoModal() -- We want the user to either finish this or quit

	end

	return ret

end
