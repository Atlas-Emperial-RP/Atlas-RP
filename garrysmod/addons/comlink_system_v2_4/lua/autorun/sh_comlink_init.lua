--[[
   _____                _ _       _     _____           _                 
  / ____|              | (_)     | |   / ____|         | |                
 | |     ___  _ __ ___ | |_ _ __ | | _| (___  _   _ ___| |_ ___ _ __ ___  
 | |    / _ \| '_ ` _ \| | | '_ \| |/ /\___ \| | | / __| __/ _ \ '_ ` _ \ 
 | |___| (_) | | | | | | | | | | |   < ____) | |_| \__ \ ||  __/ | | | | |
  \_____\___/|_| |_| |_|_|_|_| |_|_|\_\_____/ \__, |___/\__\___|_| |_| |_|
                                               __/ |                      
                                              |___/                         
               Created by Summe https://steamcommunity.com/id/DerSumme/
               This content was purchased.                               
]]--

Comlink = {}

Comlink.Version = 1.0

Comlink.Channels = {}

timer.Simple(0, function()
    SummeLibrary:Register({
        class = "comlink",
        name = "ComlinkSystem",
        color = Color(251,255,0),
        version = 2.3,
    })
end)

hook.Add("ComlinkSystem.Registered", "34343", function()
    local rootDir = "comlink"

    local function AddFile(File, dir)
        local fileSide = string.lower(string.Left(File , 3))

        if SERVER and fileSide == "sv_" then
            include(dir..File)
            SummeLibrary:Print("comlink", "> "..dir..File)
        elseif fileSide == "sh_" then
            if SERVER then 
                AddCSLuaFile(dir..File)
            end
            include(dir..File)
            SummeLibrary:Print("comlink", "> "..dir..File)
        elseif fileSide == "cl_" then
            if SERVER then 
                AddCSLuaFile(dir..File)
            elseif CLIENT then
                include(dir..File)
                SummeLibrary:Print("comlink", "> "..dir..File)
            end
        end
    end

    local function IncludeDir(dir)
        dir = dir .. "/"
        local File, Directory = file.Find(dir.."*", "LUA")

        for k, v in ipairs(File) do
            if string.EndsWith(v, ".lua") then
                AddFile(v, dir)
            end
        end
        
        for k, v in ipairs(Directory) do
            IncludeDir(dir..v)
        end

        hook.Run("Comlink.Loaded")

    end
    IncludeDir(rootDir)
end)