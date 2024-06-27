/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/


local DebugPrint = false

local function NicePrint(txt)
    if DebugPrint == false then return end

    if SERVER then
        MsgC(Color(84, 150, 197), txt .. "\n")
    else
        MsgC(Color(193, 193, 98), txt .. "\n")
    end
end

local function PreLoadFile(path)
	if CLIENT then
		include(path)
	else
		AddCSLuaFile(path)
		include(path)
	end
end

local function LoadFiles(path)
	local files, _ = file.Find(path .. "/*", "LUA")

	for _, v in ipairs(files) do
		if string.sub(v, 1, 3) == "sh_" then
			if CLIENT then
				include(path .. "/" .. v)
			else
				AddCSLuaFile(path .. "/" .. v)
				include(path .. "/" .. v)
			end
			NicePrint("// Loaded " .. v .. string.rep(" ", 38 - v:len()) .. " //")
		end
	end

	for _, v in ipairs(files) do
		if string.sub(v, 1, 3) == "cl_" then
			if CLIENT then
				include(path .. "/" .. v)
				NicePrint("// Loaded " .. v .. string.rep(" ", 38 - v:len()) .. " //")
			else
				AddCSLuaFile(path .. "/" .. v)
			end
		elseif string.sub(v, 1, 3) == "sv_" then
			include(path .. "/" .. v)
			NicePrint("// Loaded " .. v .. string.rep(" ", 38 - v:len()) .. " //")
		end
	end
end

local function Initialize()
	NicePrint(" ")
	NicePrint("///////////////////////////////////////////////////")
	NicePrint("////////////// Zero´s Scratchcards ////////////////")
	NicePrint("///////////////////////////////////////////////////")
	NicePrint("//                                               //")

	PreLoadFile("zlottery/sh_main_config.lua")
	PreLoadFile("zlottery/sh_ticket_config.lua")

	LoadFiles("zlt_languages")

	LoadFiles("zlottery/util")
	LoadFiles("zlottery/util/player")
	LoadFiles("zlottery/ticket")
	LoadFiles("zlottery/machine")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a


	NicePrint("//                                               //")
	NicePrint("///////////////////////////////////////////////////")
	NicePrint("///////////////////////////////////////////////////")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273576 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273576

	if DebugPrint == false then
		if SERVER then
			MsgC(Color(84, 150, 197), "Zeros Scratchcards - Loaded\n")
		else
			MsgC(Color(193, 193, 98), "Zeros Scratchcards - Loaded\n")
		end
	end
end

timer.Simple(0,function()
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8 */

	// If zeros libary is not installed on the server then lets tell them
	if zclib == nil then
		local function Warning(ply, msg)
			if DarkRP and DarkRP.notify then
				DarkRP.notify(ply, 1, 8, msg)
			else
				ply:ChatPrint(msg)
			end
		end

		MsgC(Color(255, 0, 0), "[Zeros Scratchcards] > Zeros Lua Libary not found!")
		MsgC(Color(255, 0, 0), "https://steamcommunity.com/sharedfiles/filedetails/?id=2532060111")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

		if CLIENT then
			surface.PlaySound( "common/warning.wav" )
		end

		if SERVER then
			for k,v in ipairs(player.GetAll()) do
				if IsValid(v) then
					Warning(v, "[Zeros Scratchcards] > Zeros Lua Libary not found!")
					Warning(v, "https://steamcommunity.com/sharedfiles/filedetails/?id=2532060111")
				end
			end
		end
		return
	end

	Initialize()
end)
