local CURRENCY = PROJECT0.FUNC.CreateCurrency( "ps1_points" )
CURRENCY:SetTitle( "PS1 Points" )

CURRENCY:SetInstalledFunction( function()
    return tobool( Pointshop2 )
end )

CURRENCY:SetAddCurrency( function( ply, amount )
    ply:PS_GivePoints( amount )
end )

CURRENCY:SetTakeCurrency( function( ply, amount )
    ply:PS_GivePoints( -amount )
end )

CURRENCY:SetGetCurrency( function( ply )
    return ply:PS_GetPoints() or 0
end )

CURRENCY:SetFormatCurrency( function( amount )
    return string.Comma( amount ) .. " Points"
end )

CURRENCY:Register()