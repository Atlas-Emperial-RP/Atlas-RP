
module( "presets", package.seeall )

-- TODO: A function to check/replace invalid characters for filenamesnot 

local Presets = LoadPresets()

function GetTable( presetname )

	if ( not presetname ) then return end
	presetname = presetname:Trim()
	if ( presetname == "" ) then return end

	Presets[ presetname ] = Presets[ presetname ] or {}

	return Presets[ presetname ]

end

function Exists( presetname, strName )

	if ( not presetname or not strName ) then return false end
	presetname = presetname:Trim()
	strName = strName:Trim()
	if ( presetname == "" or strName == "" ) then return false end

	if ( not Presets[ presetname ] or not Presets[ presetname ][ strName ] ) then return false end

	return true

end

function Add( presetname, strName, pTable )

	if ( not presetname or not strName ) then return end
	presetname = presetname:Trim()
	strName = strName:Trim()
	if ( presetname == "" or strName == "" ) then return end

	Presets[ presetname ] = Presets[ presetname ] or {}
	Presets[ presetname ][ strName ] = pTable

	-- Only save the specific preset group, not ALL of them
	SavePresets( { [ presetname ] = Presets[ presetname ] } )

end

function Rename( presetname, strName, strToName )

	if ( not presetname or not strName or not strToName or strName == strToName ) then return end
	presetname = presetname:Trim()
	strName = strName:Trim()
	strToName = strToName:Trim()
	if ( presetname == "" or strName == "" or strToName == "" or strName == strToName ) then return end

	Presets[ presetname ] = Presets[ presetname ] or {}
	Presets[ presetname ][ strToName ] = Presets[ presetname ][ strName ]
	Presets[ presetname ][ strName ] = nil

	-- Only save the specific preset group, not ALL of them
	SavePresets( { [ presetname ] = Presets[ presetname ] } )

end

function Remove( presetname, strName )

	if ( not presetname or not strName ) then return end
	presetname = presetname:Trim()
	strName = strName:Trim()
	if ( presetname == "" or strName == "" ) then return end

	Presets[ presetname ] = Presets[ presetname ] or {}
	Presets[ presetname ][ strName ] = nil

	-- Only save the specific preset group, not ALL of them
	SavePresets( { [ presetname ] = Presets[ presetname ] } )

end

-- Internal helper functions to not copypaste same code
function BadNameAlert()

	Derma_Message( "#preset.badname_desc", "#preset.badname_title", "#preset.okay" )

end

function OverwritePresetPrompt( func )

	Derma_Query( "#preset.exists_desc", "#preset.exists_title", "#preset.overwrite", func, "#preset.cancel" )

end
