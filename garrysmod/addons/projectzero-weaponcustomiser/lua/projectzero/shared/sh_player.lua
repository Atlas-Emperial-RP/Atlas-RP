local playerMeta = FindMetaTable( "Player" )

function playerMeta:Project0()
	if( SERVER ) then
		if( not self ) then return false end

		if( not self.PROJECT0_PLAYERMETA ) then
			self.PROJECT0_PLAYERMETA = {
				Player = self,
				TempItemData = {}
			}

			setmetatable( self.PROJECT0_PLAYERMETA, PROJECT0.PLAYERMETA )
		end

		return self.PROJECT0_PLAYERMETA
	else
		return PROJECT0.LOCALPLYMETA
	end
end

-- GENERAL FUNCTIONS --
function PROJECT0.PLAYERMETA:GetUserID()
	return self.UserID or 0
end