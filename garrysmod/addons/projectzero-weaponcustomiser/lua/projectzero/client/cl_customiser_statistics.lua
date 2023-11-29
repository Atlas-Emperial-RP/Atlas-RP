function PROJECT0.FUNC.RequestCosmeticsPurchased()
    if( CurTime() < (PROJECT0.TEMP.LastCosmeticsPurchasedRequest or 0)+PROJECT0.CONFIG.CUSTOMISER.StatisticsNetworkDelay ) then return end
    PROJECT0.TEMP.LastCosmeticsPurchasedRequest = CurTime()

    net.Start( "Project0.RequestCosmeticsPurchased" )
    net.SendToServer()
end

net.Receive( "Project0.SendCosmeticsPurchased", function()
    PROJECT0.TEMP.CosmeticsPurchased = {}

    for i = 1, 7 do
        PROJECT0.TEMP.CosmeticsPurchased[i] = net.ReadUInt( 10 )
    end

    hook.Run( "Project0.Hooks.CosmeticsPurchasedUpdated" )
end )