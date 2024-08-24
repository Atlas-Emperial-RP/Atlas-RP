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

function Comlink:ToggleState()
    net.Start("Comlink.StateUpdate")
    net.SendToServer()

    surface.PlaySound("UI/buttonclick.wav")
end

function Comlink:JoinActive(id)
    net.Start("Comlink.JoinActive")
    net.WriteInt(id, 16)
    net.SendToServer()

    surface.PlaySound("UI/buttonclick.wav")
end

function Comlink:JoinPassive1(id)
    net.Start("Comlink.JoinPassive1")
    net.WriteInt(id, 16)
    net.SendToServer()

    surface.PlaySound("UI/buttonclick.wav")
end

function Comlink:JoinPassive2(id)
    net.Start("Comlink.JoinPassive2")
    net.WriteInt(id, 16)
    net.SendToServer()

    surface.PlaySound("UI/buttonclick.wav")
end

function Comlink:QuickSwitch()
    local activeChannel = LocalPlayer():GetComlinkActive()
    local passiveChannel1 = LocalPlayer():GetComlinkPassive1()
    local passiveChannel2 = LocalPlayer():GetComlinkPassive2()

    net.Start("Comlink.JoinPassive1")
    net.WriteInt(passiveChannel2, 16)
    net.SendToServer()

    net.Start("Comlink.JoinPassive2")
    net.WriteInt(activeChannel, 16)
    net.SendToServer()

    net.Start("Comlink.JoinActive")
    net.WriteInt(passiveChannel1, 16)
    net.SendToServer()

    surface.PlaySound("UI/buttonclick.wav")
end

net.Receive("Comlink.StatusUpdate", function()
    Comlink.Enabled = net.ReadBool()
end)


hook.Add("Comlink.Loaded", "Comlink.RegisterKeyBinds", function()

    COMLINK_MENU_COOLDOWN = 0

    SummeLibrary:RegisterBind({
        name = "ComlinkOpenMenu",
        key = Comlink.Config.MenuKey,
        func = function()

            if input.IsKeyDown(KEY_LALT) then
                Comlink:QuickSwitch() -- Quick switches active and passive
                return
            end

            if input.IsKeyDown(KEY_LSHIFT) then
                Comlink:ToggleState() -- Switches between green/yellow/red
                return
            end

            if COMLINK_MENU_COOLDOWN - CurTime() < 0 then
                Comlink:OpenMenu() -- Opens the menu
            end
        end,
    })
end)

concommand.Add("comlink_getjoinables", function()
    for key, channel in pairs(Comlink.Channels) do
        if not channel.accessCheck(LocalPlayer()) then continue end

        SummeLibrary:Print("comlink", channel.name)
    end
end)

net.Receive("Comlink.TextComms", function()
    local text = net.ReadString()
    local sender = net.ReadEntity()

    local channelID = sender:GetComlinkActive()
    local cmlTbl = Comlink.Channels[channelID]

    chat.AddText(cmlTbl.color, "[", cmlTbl.name, "] ", color_white, sender:Name(), ": ", text)
end)