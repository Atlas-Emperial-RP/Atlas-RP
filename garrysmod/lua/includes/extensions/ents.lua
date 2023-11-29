
function ents.FindByClassAndParent( classname, entity )

	if ( !IsValid( entity ) ) then return end

	local list = ents.FindByClass( classname )
	if ( !list ) then return end

	local out = {}
	for k, v in ipairs( list ) do

		if ( !IsValid(v) ) then goto continue end

		local p = v:GetParent()
		if ( !IsValid(p) ) then goto continue end
		if ( p ~= entity ) then goto continue end

		table.insert( out, v )

	end

	if ( #out == 0 ) then return end

	return out

end
