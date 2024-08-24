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

util.AddNetworkString("Comlink.JoinActive")
util.AddNetworkString("Comlink.JoinPassive1")
util.AddNetworkString("Comlink.JoinPassive2")
util.AddNetworkString("Comlink.StateUpdate")
util.AddNetworkString("Comlink.StatusUpdate")

resource.AddFile("materials/summe/comlink/icon.png")

-- NETWORKING
-- Sets the current channel
net.Receive("Comlink.JoinActive", function(len, ply)
    local channelID = net.ReadInt(8)
    
    ply:SetComlinkActive(channelID)
end)

-- NETWORKING
-- Sets the current channel
net.Receive("Comlink.JoinPassive1", function(len, ply)
    local channelID = net.ReadInt(8)
    
    ply:SetComlinkPassive(1, channelID)
end)

-- NETWORKING
-- Sets the current channel
net.Receive("Comlink.JoinPassive2", function(len, ply)
    local channelID = net.ReadInt(8)
    
    ply:SetComlinkPassive(2, channelID)
end)

local PLAYER = FindMetaTable("Player")

-- FUNCTION
-- Sets the active comlink channel of a player.
function PLAYER:SetComlinkActive(channelID)
    local cmlTbl = Comlink.Channels[channelID]

    if channelID == -1 then self:SetNWInt("ComlinkChannel.Active", channelID) return end

    if not cmlTbl then return end

    if not cmlTbl.accessCheck(self) then return end

    if not Comlink:IsEnabled() then return end

    self:SetNWInt("ComlinkChannel.Active", channelID)
end

-- FUNCTION
-- Sets the passive comlink channel of a player.
function PLAYER:SetComlinkPassive(passType, channelID)
    local cmlTbl = Comlink.Channels[channelID]

    if channelID == -1 then self:SetNWInt("ComlinkChannel.Passive"..passType, channelID) return end

    if not cmlTbl then return end

    if not cmlTbl.accessCheck(self) then return end

    if not Comlink:IsEnabled() then return end

    self:SetNWInt("ComlinkChannel.Passive"..passType, channelID)
end

-- FUNCTION
-- Sets the global comlink status.
function Comlink:ChangeStatus(value)
    if value then
        for k, v in pairs(player.GetAll()) do
            SummeLibrary:Notify(v, "success", "Comlink", Comlink:L("NOTIFY_SignalGot"))
        end
    else
        for k, v in pairs(player.GetAll()) do
            v:SetComlinkActive(-1)
            v:SetComlinkPassive(1, -1)
            v:SetComlinkPassive(2, -1)
            SummeLibrary:Notify(v, "warning", "Comlink", Comlink:L("NOTIFY_SignalLost"))
        end
    end

    Comlink.Enabled = value

    net.Start("Comlink.StatusUpdate")
    net.WriteBool(value)
    net.Broadcast()
end

-- FUNCTION
-- Checks whether the player has access to the current channels
function PLAYER:CheckComlinkAccess()
    if self:GetComlinkState() != 0 then return end

    timer.Simple(1, function()
        local comlinkIDActive = self:GetComlinkActive()
        local cmlTableActive = Comlink.Channels[comlinkIDActive]

        if cmlTableActive then
            if not cmlTableActive.accessCheck(self) then
                self:SetComlinkActive(-1)
            end
        end

        local cmlTablePassive1 = Comlink.Channels[self:GetComlinkPassive1()]

        if cmlTablePassive1 then
            if not cmlTablePassive1.accessCheck(self) then
                self:SetComlinkPassive(1, -1)
            end
        end

        local cmlTablePassive2 = Comlink.Channels[self:GetComlinkPassive2()]

        if cmlTablePassive2 then
            if not cmlTablePassive2.accessCheck(self) then
                self:SetComlinkPassive(2, -1)
            end
        end
    end)
end


-- NETWORKING
-- Handles when a player mutes and unmutes
net.Receive("Comlink.StateUpdate", function(len, ply)
    local actualState = ply:GetComlinkState()
    
    if actualState == 0 then
        ply:SetNWInt("ComlinkState", 2) -- Comlink is off
    else
        ply:SetNWInt("ComlinkState", 0) -- Comlink is on
    end
end)

-- HOOK
-- Core element for players to hear each other in the Comlink at all.
hook.Add("Comlink.Loaded", "Comlink.CreateVoiceHook", function()
    if Comlink.Config.ApplyVoiceFix then
        hook.Add("PlayerCanHearPlayersVoice", "Comlink.VoiceHookFixed", function(listener, talker)

            if listener:GetPos():DistToSqr( talker:GetPos() ) < 300000 then
                return true
            end
        
            if talker:GetComlinkState() != 0 then return end
        
            if listener:GetComlinkState() == 2 then return end
        
            local tChannel = talker:GetComlinkActive()
        
            if tChannel == -1 then return end

            if Comlink.Channels[tChannel] and Comlink.Channels[tChannel].announcementChannel == true then
                return true, false
            end
                
            if listener:GetComlinkActive() == tChannel or listener:GetComlinkPassive1() == tChannel or listener:GetComlinkPassive2() == tChannel then
                return true, false
            end
        end)
    else
        hook.Add("PlayerCanHearPlayersVoice", "Comlink.VoiceHookNormal", function(listener, talker)

            if talker:GetComlinkState() != 0 then return end
        
            if listener:GetComlinkState() == 2 then return end
        
            local tChannel = talker:GetComlinkActive()
        
            if tChannel == -1 then return end
        
            if Comlink.Channels[tChannel] and Comlink.Channels[tChannel].announcementChannel == true then
                return true, false
            end

            if listener:GetComlinkActive() == tChannel or listener:GetComlinkPassive1() == tChannel or listener:GetComlinkPassive2() == tChannel then
                return true, false
            end
        end)        
    end
end)

-- HOOK
-- Checks when spawning if the player still has access to the current comlink. If not, he will be kicked from the channel.
hook.Add("PlayerSpawn", "Comlink.CheckChannelAccessOnSpawn", function(ply)
    ply:CheckComlinkAccess()
end)

-- HOOK
-- Checks when changing the team if the player still has access to the current comlink. If not, he will be kicked from the channel.
hook.Add("PlayerChangedTeam", "Comlink.CheckChannelAccessOnTeamchange", function(ply)
    ply:CheckComlinkAccess()
end)


-- NETWORKING
-- Networks the current comlink global status to the player
hook.Add("PlayerInitialSpawn", "Comlink.UpdateOnJoin", function(ply)
    net.Start("Comlink.StatusUpdate")
    net.WriteBool(Comlink.Enabled)
    net.Send(ply)
end)

-- HOOK
-- Just some fancy stuff
hook.Add("PlayerSwitchWeapon", "Comlink.SWEPSelectSound", function(ply, oldWep, wep)
    if IsValid(ply) and IsValid(oldWep) and IsValid(wep) then
        if wep:GetClass() == "comlink_fixingtool" then
            ply:EmitSound("HL1/fvox/blip.wav", 75, 100, 0.5)
        end
    end
end)

util.AddNetworkString("Comlink.TextComms")

SummeLibrary:RegisterCommand({
    key = "Comlink.TextComms",
    commandList = {"/comms"},
    allowedRanks = false,
    func = function(ply, arguments)

        if not arguments[1] then return end

        if not Comlink.Enabled then
            SummeLibrary:Notify(ply, "warning", "Comlink", Comlink:L("NOTIFY_SignalLost"))
            return
        end

        local channelID = ply:GetComlinkActive()
        if channelID == -1 then return end

        local plys = Comlink:GetAllPlayersInChannel(channelID)

        for k, v in pairs(plys) do
            net.Start("Comlink.TextComms")
            net.WriteString(table.concat(arguments, " ") or "n/A")
            net.WriteEntity(ply)
            net.Send(v)
        end
    end,
})