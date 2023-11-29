local CURRENCY = PROJECT0.FUNC.CreateCurrency( "ps2_points" )
CURRENCY:SetTitle( "PS2 Points" )

CURRENCY:SetInstalledFunction( function()
    return tobool( Pointshop2 )
end )

CURRENCY:SetAddCurrency( function( ply, amount )
    ply:PS2_AddStandardPoints( amount )
end )

CURRENCY:SetTakeCurrency( function( ply, amount )
    ply:PS2_AddStandardPoints( -amount )
end )

CURRENCY:SetGetCurrency( function( ply )
    return (ply.PS2_Wallet or {}).points or 0
end )

CURRENCY:SetFormatCurrency( function( amount )
    return string.Comma( amount ) .. " Points"
end )

CURRENCY:Register()