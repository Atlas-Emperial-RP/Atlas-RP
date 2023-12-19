timer.Simple(0, function()    
    local VALID = RDV.LIBRARY.RegisterProduct("Training NPC", {
        {
            Name = "PixelUI (https://github.com/TomDotBat/pixel-ui)", 
            Check = function() 
                if !PIXEL then return false end 
            end
        },
    })

    if !VALID then return end

    RDV.TRAINING = RDV.TRAINING or {
        CFG = {},
        TESTS = {},
        NTESTS = {},
        NPCS = {},
        DELAYS = {},
        JOBS = {},
        SPAWNED = false,
    }
    
    local rootDir = "training_npc"

    local function AddFile(File, dir)
        local fileSide = string.lower(string.Left(File , 3))

        if SERVER and fileSide == "sv_" then
            include(dir..File)
        elseif fileSide == "sh_" then
            if SERVER then 
                AddCSLuaFile(dir..File)
            end
            include(dir..File)
        elseif fileSide == "cl_" then
            if SERVER then 
                AddCSLuaFile(dir..File)
            elseif CLIENT then
                include(dir..File)
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

    end
    IncludeDir(rootDir)

    if RDV.TRAINING.CFG.Cami.Enabled then
        CAMI.RegisterPrivilege({
            Name = RDV.TRAINING.CFG.Cami.Name,
            MinAccess = "superadmin"
        })
    end
end)