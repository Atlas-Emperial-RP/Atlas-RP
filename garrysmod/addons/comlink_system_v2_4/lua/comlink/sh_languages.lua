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

Comlink.Languages = {}

function Comlink:L(key)
    return Comlink.Languages[Comlink.Config.Language][key] or "ERROR"
end

Comlink.Languages["en"] = {
    HUD_NoChannel = "No Channel",
    HUD_SignalLost = "Signal lost",
    MENU_Title = "Comlink",
    MENU_JoinA = "Connect active",
    MENU_JoinP1 = "Connect passive 1",
    MENU_JoinP2 = "Connect passive 2",
    MENU_Active = "Active",
    MENU_Passive = "Passive",
    ENTITY_Header = "Comlink Array",
    ENTITY_Online = "Online",
    ENTITY_Offline = "Offline",
    NOTIFY_SignalLost = "The comlink signal is down!",
    NOTIFY_SignalGot = "Connection to the comlink array re-established.",
    NOTIFY_MaxArrays = "There is already an array on the map!",
}

Comlink.Languages["de"] = {
    HUD_NoChannel = "Kein Kanal",
    HUD_SignalLost = "Signal verloren",
    MENU_Title = "Comlink",
    MENU_JoinA = "Aktiv verbinden",
    MENU_JoinP1 = "Passiv verbinden 1",
    MENU_JoinP2 = "Passiv verbinden 2",
    MENU_Active = "Aktiv",
    MENU_Passive = "Passiv",
    ENTITY_Header = "Comlink Array",
    ENTITY_Online = "Online",
    ENTITY_Offline = "Offline",
    NOTIFY_SignalLost = "Das Comlink-Signal ist ausgefallen!",
    NOTIFY_SignalGot = "Verbindung zum Comlink-Array wiederhergestellt.",
    NOTIFY_MaxArrays = "Es befindet sich bereits ein Array auf der Map!",
}
