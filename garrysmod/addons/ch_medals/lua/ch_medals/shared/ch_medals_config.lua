CH_Medals = CH_Medals or {}
CH_Medals.Config = CH_Medals.Config or {}
CH_Medals.Medals = CH_Medals.Medals or {}

--[[
	Language Config
--]]
CH_Medals.Config.Language = "en" -- Set the language of the script.

--[[
	General
--]]
CH_Medals.Config.NotificationTime = 10 -- How long will notifications last?

CH_Medals.Config.AdminUsergroups = { -- Usergroups that you categorize as admins. Supports admin mods that supports ply:GetUserGroup() - most admins most does this apart from ServerGuard!
	["owner"] = true,
	["superadmin"] = true,
	["admin"] = true,
}

CH_Medals.Config.AllowedMedalTeams = { -- Teams/jobs that are allowed to give medals
	["Starwars Shipper"] = true,
	["Citizen"] = true,
	["Gangster"] = true,
}

CH_Medals.Config.AllowedSteamID64 = { -- Steamids64 that are allowed to give medals
	["11111111111111111"] = true,
	["22222222222222222"] = true,
	["33333333333333333"] = true,
}

--[[
	Menu
--]]
CH_Medals.Config.UseMedalMenuChatCommand = true -- Should the chat command be in use?
CH_Medals.Config.MedalsMenuChatCommand = "!medals" -- Chat command to open the medals menu

CH_Medals.Config.ShowCategoryInMenu = true -- Should the category show after the name of the medal in the menu?

--[[
	Medal 3d2d
--]]
CH_Medals.Config.AutoDisplayMedal = true -- Should the medal be displayed or hidden when given? true for display, false for hide.

CH_Medals.Config.DrawDistance3D2D = 100000 -- Distance for the medals to display above heads (they also have alpha fade)
CH_Medals.Config.YPos3D2D = 60 -- The y axis adjustment of the medals above players head

CH_Medals.Config.YPosCrouched3D2D = 80 -- The y axis adjustment of the medals above players head

CH_Medals.Config.Medal3D2DSizeY = 40 -- The size of the icons above the players head (height)
CH_Medals.Config.Medal3D2DSizeX = 40 -- The size of the icons above the players head (width)

CH_Medals.Config.MedalNewRowCount = 10 -- Will create a new row of medals when this amount of medals is reached. Set to 999 (or very high) if you wish to keep it on 1 line
CH_Medals.Config.MedalRowSpaceY = 50 -- Spacing between rows

CH_Medals.Config.Medal3D2DIconSpacing = 1.35 -- This value determines the spacing. It techincally multiplies with the medal width size to increase the spacing.

--[[
	Custom logs
--]]
CH_Medals.Config.UseCustomLogs = false -- The addon offers a log database ch_medals_logs that you can log medal give/take actions into if you want.