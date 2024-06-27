util.AddNetworkString("RDV.TRAINING.PROCESS")
util.AddNetworkString("RDV.TRAINING.MENU")
util.AddNetworkString("RDV.TRAINING.CREATE")
util.AddNetworkString("RDV.TRAINING.DELAY")
util.AddNetworkString("RDV.TRAINING.OpenQuiz")

local COL_1 = Color(255,255,255)

local function SendNotification(ply, msg)
    RDV.LIBRARY.AddText(ply, RDV.TRAINING.CFG.Prefix.Color, "["..RDV.TRAINING.CFG.Prefix.Appension.."] ", Color(255,255,255), msg)
end

local DELAYS = {}

net.Receive("RDV.TRAINING.PROCESS", function(len, ply)
    local TEST = net.ReadUInt(8)

    local OBJ = RDV.TRAINING.TESTS[TEST]

    if !OBJ then return end

    if OBJ.T_RANKS then
        local B, R = nil, nil

        if RDV.RANK then
            B = RDV.RANK.GetPlayerRankTree(ply)
            R = RDV.RANK.GetPlayerRank(ply)
        elseif MRS then
            B = MRS.GetPlayerGroup(ply:Team())
            R = MRS.GetPlyRank(ply, B)
        end

        if OBJ.T_RANKS[B] then
            if ( OBJ.T_RANKS[B] > R ) then return end
        else
            return
        end
    end

    local SID64 = ply:SteamID64()

    if !OBJ.OpenWithF4 then
        for k, v in pairs(RDV.TRAINING.NPCS) do
            if !IsValid(k) then continue end

            if v.Q and v.Q[TEST] and ply:GetPos():DistToSqr(k:GetPos()) > 12000 then
                return false
            end
        end
    end

    if DELAYS[SID64] and DELAYS[SID64][TEST] and DELAYS[SID64][TEST] > CurTime() then
        SendNotification(ply, RDV.LIBRARY.GetLang(nil, "TR_delayEn", {
            string.NiceTime( (DELAYS[SID64][TEST] - CurTime()) ),
        }))
        return
    end

    if ( RDV.SAL and OBJ.LEVEL ) then
        local LVL = RDV.SAL.GetLevel(ply) or 0
        
        if !LVL then return end
        
        if tonumber(LVL) < OBJ.LEVEL then
            return
        end
    end

    if ( OBJ.CustomCheck(ply) == false ) then
        return
    end

    local QCOUNT = OBJ.QUESTIONS

    local COUNT = table.Count(OBJ.QUESTIONS)

    local RESPONSES = {
        INC = {},
        COR = {},
    }

    local CORRECT = 0

    for i = 1, COUNT do
        local QUESTION = net.ReadUInt(8)
        local ANSWERS = net.ReadUInt(8)
        
        for i = 1, ANSWERS do
            local RESPONSE = net.ReadUInt(8)

            local TAB = OBJ.QUESTIONS[QUESTION].OP[RESPONSE]

            if !TAB.Correct then
                RESPONSES.INC[RESPONSE] = true
            else
                RESPONSES.COR[RESPONSE] = true

                CORRECT = CORRECT + 1
            end
        end

        for k, v in ipairs(OBJ.QUESTIONS[QUESTION].OP) do
            if v.Correct and !RESPONSES.COR[k] then
                table.insert(RESPONSES.INC, k)
            end
        end
    end

    local PERCENT = CORRECT / OBJ.CORRECT * 100
    local LANG

    if PERCENT >= OBJ.PASS then
        LANG = "TR_passedQuiz"
        hook.Run("RDV_TRAINING_PassedQuiz", ply, TEST, PERCENT)

        if OBJ.OnPass then 
            OBJ.OnPass(ply)
        end

        if DarkRP then
            local LIST = {}
            local WLE = false

            if !istable(OBJ.TEAM) then
                LIST[1] = OBJ.TEAM
            else
                LIST = OBJ.TEAM
            end

            for k, v in ipairs(LIST) do
                if (GAS and GAS.JobWhitelist) then
                    GAS.JobWhitelist:AddToWhitelist( v, GAS.JobWhitelist.LIST_TYPE_STEAMID, ply:AccountID() )
                    WLE = true
                elseif SH_WHITELIST then
                    SH_WHITELIST:WhitelistSteamID(nil, ply:SteamID(), { team.GetName(v) }, { true })
                    WLE = true
                end
            end

            if !WLE then
                ply:changeTeam(table.Random(LIST), true)
            end
        end
    else
        LANG = "TR_failedQuiz"
        hook.Run("RDV_TRAINING_FailedQuiz", ply, TEST, PERCENT)
    end

    SendNotification(ply, RDV.LIBRARY.GetLang(nil, LANG, {
        OBJ.NAME,
        math.Round(PERCENT),
        100,
    }))

    DELAYS[ply:SteamID64()] = DELAYS[ply:SteamID64()] or {}
    DELAYS[ply:SteamID64()][TEST] = ( CurTime() + OBJ.DELAY )

    net.Start("RDV.TRAINING.DELAY")
        net.WriteBool(true)
        net.WriteUInt(TEST, 8)
    net.Send(ply)
end )

hook.Add("PlayerSay", "RDV:TRAINING", function(ply, TEXT)
    if TEXT == RDV.TRAINING.CFG.Commands.CORE then
        local ACCESS = false

        if RDV.TRAINING.CFG.Cami.Enabled and CAMI.PlayerHasAccess(ply, RDV.TRAINING.CFG.Cami.Name, nil) then
            ACCESS = true
        elseif RDV.TRAINING.CFG.Groups[ply:GetUserGroup()] then
            ACCESS = true
        end

        if !ACCESS then
            SendNotification(ply, RDV.LIBRARY.GetLang(nil, "TR_noAccess"))
            return ""
        end

        net.Start("RDV.TRAINING.CREATE")
        net.Send(ply)

        return ""
    end
end )

hook.Add("playerCanChangeTeam", "CLIENT TEST", function(P, NJ)
    local KEY = RDV.TRAINING.JOBS[NJ]

    if RDV.TRAINING.TESTS[KEY] then
        local T = RDV.TRAINING.TESTS[KEY]

        if T.OpenWithF4 then            
            local CAN = true

            if GAS and GAS.JobWhitelist then
                if !GAS.JobWhitelist:IsWhitelisted( P, NJ ) then
                    CAN = false
                end
            elseif SH_WHITELIST then
                if !SH_WHITELIST:IsPlayerWhitelisted( P, NJ ) then
                    CAN = false
                end
            end

            if !CAN then
                if T.T_RANKS then
                    local B, R = nil, nil

                    if RDV.RANK then
                        B = RDV.RANK.GetPlayerRankTree(P)
                        R = RDV.RANK.GetPlayerRank(P)
                    elseif MRS then
                        B = MRS.GetPlayerGroup(P:Team())
                        R = MRS.GetPlyRank(P, B)
                    end

                    if T.T_RANKS[B] then
                        if (T.T_RANKS[B] > R ) then 
                            return false, RDV.LIBRARY.GetLang(nil, "TR_noAccessToQuiz", {tostring(T.T_RANKS[B])}) 
                        end
                    else
                        return false, RDV.LIBRARY.GetLang(nil, "TR_noAccessToQuiz", {tostring(T.T_RANKS[B])})
                    end
                end

                local SID64 = P:SteamID64()

                if DELAYS[SID64] and DELAYS[SID64][KEY] and DELAYS[SID64][KEY] > CurTime() then
                    SendNotification(P, RDV.LIBRARY.GetLang(nil, "TR_delayEn", {
                        string.NiceTime( (DELAYS[SID64][KEY] - CurTime()) ),
                    }))
                    return false
                end

                net.Start("RDV.TRAINING.OpenQuiz")
                    net.WriteUInt(KEY, 8)
                net.Send(P)

                return false
            end
        end
    end
end )

net.Receive("RDV.TRAINING.CREATE", function(len, ply)
    local ACCESS = false

    if RDV.TRAINING.CFG.Cami.Enabled and CAMI.PlayerHasAccess(ply, RDV.TRAINING.CFG.Cami.Name, nil) then
        ACCESS = true
    elseif RDV.TRAINING.CFG.Groups[ply:GetUserGroup()] then
        ACCESS = true
    end

    if !ACCESS then return end

    local MODEL = net.ReadString()
    local COUNT = net.ReadUInt(8)

    local E = ents.Create("training_npc")
    E:SetPos(ply:GetPos())
    E:SetAngles(ply:GetAngles())
    E:Spawn()

    if MODEL and MODEL ~= "" then
        E:SetModel(MODEL)
    end

    RDV.TRAINING.NPCS[E] = RDV.TRAINING.NPCS[E] or {}
    
    for i = 1, COUNT do
        local TAB = RDV.TRAINING.TESTS[net.ReadUInt(8)]

        if !TAB then continue end

        RDV.TRAINING.NPCS[E][TAB.NAME] = true
    end
end )

hook.Add("PlayerReadyForNetworking", "RDV:TRAINING", function(ply)
    local TAB = DELAYS[ply:SteamID64()]

    if TAB then
        local CNT = table.Count(TAB)

        net.Start("RDV.TRAINING.DELAY")
            net.WriteBool(false)
            net.WriteUInt(CNT, 8)

            for k, v in pairs(TAB) do
                net.WriteUInt(k, 8)
                net.WriteString(v - CurTime())
            end
        net.Send(ply)
    end
end )