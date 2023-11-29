local CURRENCY = PROJECT0.FUNC.CreateCurrency( "darkrp" )
CURRENCY:SetTitle( "DarkRP" )

CURRENCY:SetInstalledFunction( function()
    return tobool( DarkRP )
end )

CURRENCY:SetAddCurrency( function( ply, amount )
    ply:addMoney( amount )
end )

CURRENCY:SetTakeCurrency( function( ply, amount )
    ply:addMoney( -amount )
end )

CURRENCY:SetGetCurrency( function( ply )
    return ply:getDarkRPVar( "money" )
end )

CURRENCY:SetFormatCurrency( function( amount )
    return DarkRP.formatMoney( amount )
end )

CURRENCY:Register()