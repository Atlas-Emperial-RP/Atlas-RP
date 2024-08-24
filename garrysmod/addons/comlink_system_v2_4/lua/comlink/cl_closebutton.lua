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

local NavButton = {}

function NavButton:Init()
    self:SetFont("Comlink.Details")
    self:SetText("")
end

function NavButton:Paint(w, h)
    draw.DrawText(self.text, "Comlink.Details", w / 2, h * .09, Color(255,255,255), TEXT_ALIGN_CENTER)
end

function NavButton:DoClickInternal()
    surface.PlaySound("UI/buttonclick.wav")
end

function NavButton:DoClick()
    self.func(self)
end

function NavButton:SetUp(text, closeFunc)
    self.text = text
    self.func = closeFunc
end
    
vgui.Register("Comlink.NavButton", NavButton, "DButton")