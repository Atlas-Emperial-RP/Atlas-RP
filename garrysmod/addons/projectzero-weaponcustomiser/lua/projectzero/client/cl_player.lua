-- DATA FUNCTIONS --
net.Receive( "Project0.SendFirstSpawn", function()
    hook.Run( "Project0.Hooks.FirstSpawn" )
end )

-- GENERAL FUNCTIONS --
net.Receive( "Project0.SendUserID", function()
    PROJECT0.LOCALPLYMETA.UserID = net.ReadUInt( 16 )
end )