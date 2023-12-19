if RDV.TRAINING.SPAWNED then return end

local function SendNotification(ply, msg)
    RDV.LIBRARY.AddText(ply, RDV.TRAINING.CFG.Prefix.Color, "["..RDV.TRAINING.CFG.Prefix.Appension.."] ", Color(255,255,255), msg)
end

local function Save()
    local NEW = {}

    local COUNT = 0

    for k, v in pairs(RDV.TRAINING.NPCS) do
        if !IsValid(k) then continue end

        COUNT = COUNT + 1

        table.insert(NEW, {
            M = k:GetModel(),
            P = k:GetPos(),
            A = k:GetAngles(),
            Q = RDV.TRAINING.NPCS[k],
        })
    end

    local TAB = util.TableToJSON(NEW)

    file.CreateDir("rdv/training")
    
    file.Write("rdv/training/rdv_training_npcs_"..game.GetMap()..".json", TAB)

    local P = RDV.TRAINING.CFG.Prefix

    MsgC(P.Color, "["..P.Appension.."] ", Color(255,255,255), RDV.LIBRARY.GetLang(nil, "TR_saveLoc", {COUNT}).."\n")
end

concommand.Add("rdv_training_save", function(ply)
    local ACCESS = false

    if RDV.TRAINING.CFG.Cami.Enabled and CAMI.PlayerHasAccess(ply, RDV.TRAINING.CFG.Cami.Name, nil) then
        ACCESS = true
    elseif RDV.TRAINING.CFG.Groups[ply:GetUserGroup()] then
        ACCESS = true
    end

    if !ACCESS then
        SendNotification(ply, RDV.LIBRARY.GetLang(nil, "TR_noAccess"))
        return false
    end

    Save()
end)

local function Start()
    local PATH = "rdv/training/rdv_training_npcs_"..game.GetMap()..".json"

    if !file.Exists(PATH, "DATA") then return end

    RDV.TRAINING.NPCS = {}
    
    local DATA = file.Read(PATH, "DATA")

    DATA = util.JSONToTable(DATA)

    for k, v in ipairs(DATA) do
        local E = ents.Create("training_npc")
        E:SetPos(v.P)
        E:SetAngles(v.A)
        E:Spawn()
        E:SetModel(v.M)
    
        RDV.TRAINING.NPCS[E] = v.Q
    end
end
Start()
hook.Add("PostCleanupMap", "RDV_TRAINING_SPAWN", Start)

RDV.TRAINING.SPAWNED = true