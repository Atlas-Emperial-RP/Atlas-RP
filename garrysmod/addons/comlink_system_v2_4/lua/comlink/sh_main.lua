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

Comlink.Enabled = true

Comlink.Meta = {}
Comlink.Meta.__index = {}

Comlink.Meta.__index = Comlink.Meta

function Comlink.Meta:GetName()
    return self.name
end

function Comlink.Meta:GetColor()
    return self.color
end

function Comlink.Meta:GetID()
    return self.id or -1
end

function Comlink.Meta:GetCount()
    local count = 0
    local id = self:GetID()
    for k, v in pairs(player.GetAll()) do
        if v:GetComlinkActive() == id or v:GetComlinkPassive1() == id or v:GetComlinkPassive2() == id then
            count = count + 1
        end
    end
    return count
end

function Comlink:CreateChannel(data)
    local comlinkTable = {}
    comlinkTable.name = data.name or "Undefined"
    comlinkTable.color = data.color or Color(255,255,255)
    comlinkTable.accessCheck = data.accessCheck
    comlinkTable.announcementChannel = data.announcementChannel or false

    for k, v in pairs(Comlink.Channels) do
        if v.name == data.name then
            Comlink.Channels[k] = nil
        end
    end

    local index = table.insert(Comlink.Channels, comlinkTable)
    setmetatable(Comlink.Channels[index], Comlink.Meta)

    Comlink.Channels[index].id = index
end

local PLAYER = FindMetaTable("Player")

function PLAYER:GetComlinkState()
    local comlinkState = self:GetNWInt("ComlinkState", 0)
    return comlinkState
end

function PLAYER:GetComlinkActive()
    local comlinkID = self:GetNWInt("ComlinkChannel.Active", -1)
    return comlinkID
end

function PLAYER:GetComlinkPassive1()
    local comlinkID = self:GetNWInt("ComlinkChannel.Passive1", -1)
    return comlinkID
end

function PLAYER:GetComlinkPassive2()
    local comlinkID = self:GetNWInt("ComlinkChannel.Passive2", -1)
    return comlinkID
end

function Comlink:IsEnabled() -- Returns whether the comlink is global online
    return Comlink.Enabled
end

function Comlink:GetAllPlayersInChannel(channelID)
    local t = {}

    for key, v in pairs(player.GetAll()) do
        if v:GetComlinkActive() == channelID or v:GetComlinkPassive1() == channelID or v:GetComlinkPassive2() == channelID then
            table.insert(t, v)
        end
    end

    return t
end

function PLAYER:IsInJob(jobNameList)
    if not DarkRP then return false end

    local jobTable = self:getJobTable()
    if not jobTable or jobTable == nil then return false end

    for k, jobName in pairs(jobNameList) do
        if jobTable.name == jobName then
            return true
        end
    end
    return false
end

function PLAYER:IsInAnnouncement()
    local comlinkID = self:GetComlinkActive()
    local cmlTbl = Comlink.Channels[channelID]
    if not cmlTbl then return false end

    if cmlTbl.announcementChannel then
        return true
    end

    return false
end