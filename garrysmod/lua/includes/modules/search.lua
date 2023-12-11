
module( "search", package.seeall )

local Providers = {}

function AddProvider( func, id )

	local prov = {
		func = func,
	}

	if ( id ) then
		Providers[ id ] = prov
	else
		table.insert( Providers, prov )
	end

end

function GetResults( str, types, maxResults )

	if ( not maxResults or maxResults < 1 ) then maxResults = 1024 end

	local str = str:lower()
	if ( str == "" ) then return {} end

	local results = {}

	for k, v in pairs( Providers ) do
		if ( isstring( types ) ) then
			if ( types ~= k ) then return end
		elseif ( istable( types ) ) then
			if ( not table.HasValue( types, k ) ) then return end
		end
	end

	-- Todo. Sort, weighted?

	return results

end
