local CURRENCY = PROJECT0.FUNC.CreateCurrency( "ps2_premium_points" )
CURRENCY:SetTitle( "PS2 Premium Points" )

CURRENCY:SetInstalledFunction( function()
    return tobool( Pointshop2 )
end )

CURRENCY:SetAddCurrency( function( ply, amount )
    ply:PS2_AddPremiumPoints( amount )
end )

CURRENCY:SetTakeCurrency( function( ply, amount )
    ply:PS2_AddPremiumPoints( -amount )
end )

CURRENCY:SetGetCurrency( function( ply )
    return (ply.PS2_Wallet or {}).premiumPoints or 0
end )

CURRENCY:SetFormatCurrency( function( amount )
    return string.Comma( amount ) .. " Premium Points"
end )

CURRENCY:Register()