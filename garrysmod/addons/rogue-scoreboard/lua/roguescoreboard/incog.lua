if SERVER then
	util.AddNetworkString( "Scoreboard.Hidden" )
	net.Receive("Scoreboard.Hidden", function(len, ply)
		if IsValid(ply) and ply:IsPlayer() then
			ply:SetRogueNetBool("Incognito", not ply:GetRogueNetBool("Incognito", false))
		end
	end)
end