-- local meta = FindMetaTable( "Player" )

-- function meta:MedicNotif( msg, time )
	
	-- local ply = self
	
	-- if not IsValid( ply ) or not ply:IsPlayer() then return end
	
	-- msg = msg or ""
	-- time = time or 5
	
	-- net.Start("MedicMod.NotifiyPlayer")
		-- net.WriteString( msg )
		-- net.WriteInt( time, 32 )
	-- net.Send( ply )
-- end

local meta = FindMetaTable( "Player" )

util.AddNetworkString("MedicMod:NotifyPlayer")

function meta:MedicNotif( msg, time )
	
	local ply = self
	
	if not IsValid( ply ) or not ply:IsPlayer() then return end
	
	msg = msg or ""
	time = time or 5
	
	net.Start("MedicMod:NotifyPlayer")
		net.WriteString( msg )
		net.WriteInt( time, 32 )
	net.Send( ply )
end