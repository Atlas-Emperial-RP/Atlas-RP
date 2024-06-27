local MODULE = GAS.Logging:MODULE()

MODULE.Category = "CH Medals"
MODULE.Name = "Medals"
MODULE.Colour = Color( 150, 0, 0 )  

MODULE:Setup( function()
	MODULE:Hook( "CH_Medals_Hook_GiveMedal", "ch_medal_received", function( target, medal, ply )
		MODULE:Log( "{1} has received a {2} medal from {3}", GAS.Logging:Highlight( target ), GAS.Logging:Highlight( medal ), GAS.Logging:Highlight( ply ) )
	end )
	
	MODULE:Hook( "CH_Medals_Hook_TakeMedal", "ch_medal_removed", function( ply, medal, target )
		MODULE:Log( "{1} removed {2} medal from {3}", GAS.Logging:Highlight( ply ), GAS.Logging:Highlight( medal ), GAS.Logging:Highlight( target ) )
	end )
end )

GAS.Logging:AddModule( MODULE )

-- 76561198165273585