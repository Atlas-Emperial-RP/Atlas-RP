local PMETA = FindMetaTable( "Player" )

--[[
	Language functions
--]]
function CH_Medals.LangString( text )
	local translation = text .." (Translation missing)"
	local lang = CH_Medals.Config.Language or "en"
	
	if CH_Medals.Config.Lang[ text ] then
		translation = CH_Medals.Config.Lang[ text ][ lang ]
	end
	
	return translation
end

--[[
	Check if okay to give/take medals
--]]
function PMETA:CH_Medals_MedalAuthorized()
	if self:CH_Medals_IsAdmin() then
		return true
	end
	
	if self:CH_Medals_IsAllowedTeam() then
		return true
	end
	
	if self:CH_Medals_IsAllowedSteamID64() then
		return true
	end
	
	return false
end

--[[
	Is in admin table.
--]]
function PMETA:CH_Medals_IsAdmin()
	return CH_Medals.Config.AdminUsergroups[ self:GetUserGroup() ]
end

--[[
	Is allowed team
--]]
function PMETA:CH_Medals_IsAllowedTeam()
	return CH_Medals.Config.AllowedMedalTeams[ team.GetName( self:Team() ) ]
end

--[[
	Is allowed team
--]]
function PMETA:CH_Medals_IsAllowedSteamID64()
	return CH_Medals.Config.AllowedSteamID64[ self:SteamID64() ]
end