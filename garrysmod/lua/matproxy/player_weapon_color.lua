
local megaGravClr = Vector( 0.4, 1, 1 )

matproxy.Add( {
	name = "PlayerWeaponColor",

	init = function( self, mat, values )

		self.ResultTo = values.resultvar

	end,

	bind = function( self, mat, ent )

		if ( not IsValid( ent ) ) then return end

		local owner = ent:GetOwner()
		if ( not IsValid( owner ) or not owner:IsPlayer() ) then return end

		local col = owner:GetWeaponColor()
		if ( not isvector( col ) ) then return end

		-- A hack for the mega gravity gun
		local wep = owner:GetActiveWeapon()
		if ( IsValid( wep ) and wep:GetClass() == "weapon_physcannon" and not wep:IsScripted() ) then
			col = megaGravClr
		end

		local mul = ( 1 + math.sin( CurTime() * 5 ) ) * 0.5

		mat:SetVector( self.ResultTo, col + col * mul )

	end
} )
