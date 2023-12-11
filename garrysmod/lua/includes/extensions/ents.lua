
function ents.FindByClassAndParent( classname, entity )

	if ( not IsValid( entity ) ) then return end

	local list = ents.FindByClass( classname )
	if ( not list ) then return end

	local out = {}
	for k, v in ipairs( list ) do

		if ( not IsValid(v) ) then return end

		local p = v:GetParent()
		if ( not IsValid(p) ) then return end
		if ( p ~= entity ) then return end

		table.insert( out, v )

	end

	if ( #out == 0 ) then return end

	return out

end
