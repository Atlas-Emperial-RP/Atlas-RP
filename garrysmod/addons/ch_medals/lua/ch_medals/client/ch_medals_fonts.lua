--[[
	Create scaled fonts
--]]
local CH_Medals_FontSizes = { "8", "9", "10", "12", "14" }

local function CH_Medals_CreateFonts()
	for k, font in ipairs( CH_Medals_FontSizes ) do
		local font_path = "Open Sans"
		local boldness = 500
		
		-- Fonts
		surface.CreateFont( "CH_Medals_Font_Size".. font, {
			font = font_path, 
			size = ScreenScale( font ), 
			weight = boldness
		} )
	end
end

CH_Medals_CreateFonts()

--[[
	Update when screen sizes changes
--]]
local function CH_Medals_OnScreenSizeChanged()
	CH_Medals.ScrW = ScrW()
	CH_Medals.ScrH = ScrH()
	
	-- Recreate fonts
    CH_Medals_CreateFonts()
end
hook.Add( "OnScreenSizeChanged", "CH_Medals_OnScreenSizeChanged", CH_Medals_OnScreenSizeChanged )