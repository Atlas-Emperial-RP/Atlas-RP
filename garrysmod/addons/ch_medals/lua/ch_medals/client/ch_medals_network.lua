--[[
	Receive all medals on clientside
--]]
net.Receive( "CH_Medals_Net_NetworkMedals", function()
	local target = net.ReadEntity()
	local amount_of_entries = net.ReadUInt( 6 )
	
	-- Make the table first
	target.CH_Medals = {}
	
	-- Write info into tables
	for i = 1, amount_of_entries do
		if not IsValid( target ) then
			return
		end
		
		table.insert( target.CH_Medals, {
			Key = net.ReadString(),
			Display = net.ReadBool(),
		} )
	end
end )