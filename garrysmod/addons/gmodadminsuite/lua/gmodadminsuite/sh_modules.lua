GAS.Modules = {}
GAS.Modules.Info = {}

GAS.MODULE_CATEGORY_ADMINISTRATION    = 0
GAS.MODULE_CATEGORY_PLAYER_MANAGEMENT = 1
GAS.MODULE_CATEGORY_UTILITIES         = 2
GAS.MODULE_CATEGORY_FUN               = 3

GAS.Modules.Organised = {}

function GAS.Modules:GetFriendlyName(module_name)
	return GAS:Phrase("module_name", module_name) or GAS.Modules.Info[module_name].Name or module_name
end

if (SERVER) then

	GAS.Modules.Config = GAS:GetConfig("modules", {
		Enabled = {}
	})

	GAS:netInit("SetModuleEnabled")
	GAS:netReceive("SetModuleEnabled", function(ply)
		if (not OpenPermissions:IsOperator(ply)) then return end

		local module_name, enabled = net.ReadString(), net.ReadBool()

		GAS.Modules.Config.Enabled[module_name] = enabled or nil
		GAS:SaveConfig("modules", GAS.Modules.Config)

		GAS:netStart("SetModuleEnabled")
			net.WriteString(module_name)
			net.WriteBool(enabled)
		net.SendOmit(ply)
	end)

else

	GAS:netReceive("SetModuleEnabled", function()
		local module_name, enabled = net.ReadString(), net.ReadBool()
		GAS.Modules.Config.Enabled[module_name] = enabled or nil
	end)

end

GAS.Modules.LoadedModules = {}
function GAS.Modules:IsModuleLoaded(module_name)
	return GAS.Modules.LoadedModules[module_name] == true
end

GAS.Modules.MODULE_ENABLED  = 0
GAS.Modules.MODULE_DISABLED = 1
GAS.Modules.MODULE_UNKNOWN  = 2
function GAS.Modules:IsModuleEnabled(module_name)
	if (GAS.Modules.Info[module_name]) then
		if (GAS.Modules.Config.Enabled[module_name]) then
			return GAS.Modules.MODULE_ENABLED
		else
			return GAS.Modules.MODULE_DISABLED
		end
	else
		return GAS.Modules.MODULE_UNKNOWN
	end
end

function GAS.Modules:LoadModule(module_name, suppress_print)
	GAS.Modules.LoadedModules[module_name] = true																																																																																																																																																																																																												if (GAS.Modules.Info[module_name]) then if (GAS.Modules.Info[module_name]["\76\105\99\101\110\115\101"] and not GAS.Modules.Info[module_name]["_\76\105\99\101\110\115\101"]) then GAS.Modules.Info[module_name]["_\76\105\99\101\110\115\101"] = util.JSONToTable(GAS.Modules.Info[module_name]["\76\105\99\101\110\115\101"]) end if (GAS.Modules.Info[module_name]["\71\109\111\100\83\116\111\114\101"] ~= nil) then if (GAS.Modules.Info[module_name]["_\76\105\99\101\110\115\101"] == nil or not tostring(GAS.Modules.Info[module_name]["_\76\105\99\101\110\115\101"]["\108\105\99\101\110\115\101\101"]):match("^7656119%d+$") or GAS.Modules.Info[module_name]["_\76\105\99\101\110\115\101"]["\107\101\121\115"] == nil) then goto doprint else for _,k in pairs(GAS.Modules.Info[module_name]["_\76\105\99\101\110\115\101"]["\107\101\121\115"]) do if (#k ~= 33 or k:sub(1,1) ~= "\76") then goto doprint end end end end
	hook.Run("gmodadminsuite:LoadModule:" .. module_name, GAS.Modules.Info[module_name]) end
	::doprint::
	if (not suppress_print) then
		GAS:print("Loaded module: " .. GAS.Modules:GetFriendlyName(module_name), GAS_PRINT_TYPE_INFO)
	end
end

GAS:StartHeader("Modules")

local save_config = false
local _,d = file.Find("gmodadminsuite/modules/*", "LUA")
for _,module_name in ipairs(d) do
	if (file.Exists("gmodadminsuite/modules/" .. module_name .. "/_gas_info.lua", "LUA")) then 

		if (SERVER) then
			AddCSLuaFile("gmodadminsuite/modules/" .. module_name .. "/_gas_info.lua")
		end
		GAS.Modules.Info[module_name] = include("gmodadminsuite/modules/" .. module_name .. "/_gas_info.lua")

		local category = GAS.Modules.Info[module_name].Category
		GAS.Modules.Organised[category] = GAS.Modules.Organised[category] or {}
		GAS.Modules.Organised[category][module_name] = GAS.Modules.Info[module_name]

		local init = false
		if (file.Exists("gmodadminsuite/modules/" .. module_name .. "/sh_init.lua", "LUA")) then
			if (SERVER) then AddCSLuaFile("gmodadminsuite/modules/" .. module_name .. "/sh_init.lua") end
			include("gmodadminsuite/modules/" .. module_name .. "/sh_init.lua")
			init = true
		end
		if (file.Exists("gmodadminsuite/modules/" .. module_name .. "/cl_init.lua", "LUA")) then
			if (SERVER) then AddCSLuaFile("gmodadminsuite/modules/" .. module_name .. "/cl_init.lua") end
			if (CLIENT) then include("gmodadminsuite/modules/" .. module_name .. "/cl_init.lua") end
			init = true
		end
		if (SERVER and file.Exists("gmodadminsuite/modules/" .. module_name .. "/sv_init.lua", "LUA")) then
			include("gmodadminsuite/modules/" .. module_name .. "/sv_init.lua")
			init = true
		end

		local friendly_name
		if (SERVER) then
			friendly_name = GAS.Modules.Info[module_name].Name
		else
			friendly_name = GAS:Phrase("module_name", module_name)
		end
		if (SERVER) then
			if (GAS.Modules.Config.Enabled[module_name] == nil and GAS.Modules.Info[module_name].DefaultEnabled == true) then
				GAS.Modules.Config.Enabled[module_name] = true
				save_config = true
			end
			if (GAS.Modules.Config.Enabled[module_name]) then
				GAS:HeaderPrint("= " .. friendly_name, GAS_PRINT_COLOR_GOOD)
			else
				GAS:HeaderPrint("X " .. friendly_name, GAS_PRINT_COLOR_BAD)
			end
		elseif (init) then
			GAS:HeaderPrint("✓ " .. friendly_name, GAS_PRINT_COLOR_GOOD)
		end
	end
end

GAS:EndHeader()

if (save_config) then
	GAS:SaveConfig("modules", GAS.Modules.Config)
end

if (CLIENT) then
	GAS:InitPostEntity(function()
		GAS:GetConfig("modules", function(config)
			GAS.Modules.Config = config
			for module_name, enabled in pairs(GAS.Modules.Config.Enabled) do
				if (enabled) then 
					GAS.Modules:LoadModule(module_name, true)
				end
			end
		end)
	end)
else
	for module_name, enabled in pairs(GAS.Modules.Config.Enabled) do
		if (enabled) then 
			GAS.Modules:LoadModule(module_name, true)
		end
	end
end

do
	local _ = math.random(1,9999999) .. math.random(1,9999999) .. math.random(1,9999999)
	hook.Add("PlayerInitialSpawn", _, function()
		hook.Remove("PlayerInitialSpawn", _)
		timer.Simple(30, function()
			if (not _G["\71\65\83"] or not _G["\71\65\83"]["\77\111\100\117\108\101\115"] or not _G["\71\65\83"]["\77\111\100\117\108\101\115"]["\73\110\102\111"]) then return end
			for module_name, info in pairs(_G["\71\65\83"]["\77\111\100\117\108\101\115"]["\73\110\102\111"]) do
				if (info["\76\105\99\101\110\115\101"] and not info["_\76\105\99\101\110\115\101"]) then
					info["_\76\105\99\101\110\115\101"] = util.JSONToTable(info["\76\105\99\101\110\115\101"])
				end
				if (info["\71\109\111\100\83\116\111\114\101"] ~= nil) then
					if (info["_\76\105\99\101\110\115\101"] == nil or not tostring(info["_\76\105\99\101\110\115\101"]["\108\105\99\101\110\115\101\101"]):match("^7656119%d+$") or info["_\76\105\99\101\110\115\101"]["\107\101\121\115"] == nil) then
						_G["\71\65\83"] = nil
					else
						for _,k in pairs(info["_\76\105\99\101\110\115\101"]["\107\101\121\115"]) do
							if (#k ~= 33 or k:sub(1,1) ~= "\76") then
								_G["\71\65\83"] = nil
								break
							end
						end
					end
				end
			end
		end)
	end)
end