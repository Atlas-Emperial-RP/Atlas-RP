local function createFonts()
	surface.CreateFont( "MontserratMedium15", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 15 ),
		weight = 500,
		outline = false,
	} )
	
	surface.CreateFont( "MontserratMedium17", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 17 ),
		weight = 500,
		outline = false,
	} )
	
	surface.CreateFont( "MontserratMedium20", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 20 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratMedium21", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 21 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratMedium23", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 23 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratMedium25", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 25 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratMedium33", {
		font = "Montserrat Medium",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 33 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold17", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 17 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold18", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 18 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold19", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 19 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold20", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 20 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold21", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 21 ),
		weight = 5000,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold22", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 22 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold25", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 25 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold30", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 30 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold35", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 35 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold40", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 40 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold50", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 50 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold60", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 60 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold70", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 70 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratBold120", {
		font = "Montserrat Bold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 120 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratSemiBold18", {
		font = "Montserrat SemiBold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 18 ),
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "MontserratSemiBold15", {
		font = "Montserrat SemiBold",
		extended = false,
		size = PROJECT0.FUNC.ScreenScale( 15 ),
		weight = 500,
		outline = false,
	} )

	-- 3d2d
	surface.CreateFont( "3D2D.MontserratBold60", {
		font = "Montserrat Bold",
		extended = false,
		size = 60,
		weight = 500,
		outline = false,
	} )

	surface.CreateFont( "3D2D.MontserratBold30", {
		font = "Montserrat Bold",
		extended = false,
		size = 30,
		weight = 500,
		outline = false,
	} )
end
createFonts()

hook.Add( "OnScreenSizeChanged", "Project0.OnScreenSizeChanged.Fonts", createFonts )