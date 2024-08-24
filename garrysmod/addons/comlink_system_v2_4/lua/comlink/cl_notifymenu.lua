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

local blur = Material("pp/blurscreen")

hook.Add("InitPostEntity", "Comlink.OpenNotifyPanel", function()
    Comlink:OpenNotifyMenu()
end)

function Comlink:OpenNotifyMenu()
    if IsValid(self.NotifyMenu) then self.NotifyMenu:Remove() end

    local width, height = ScrW() * .15, ScrH() * .5
    local posX, posY = ScrW() * .83, ScrH() * .054
    local ho = Comlink.Config.HeightOffset or 0
    local wo = Comlink.Config.WidthOffset or 0

    self.NotifyMenu = vgui.Create("DPanel")
    self.NotifyMenu:SetPos(posX + ScrW() * wo, posY + ScrH() * ho)
    self.NotifyMenu:SetSize(width, height)
    function self.NotifyMenu:Paint()
        
    end
end

local PLAYER = FindMetaTable("Player")

function PLAYER:CreateComlinkPanel()
    if not IsValid(Comlink.NotifyMenu) then return end

    local ply = self
    local channel = ply:GetComlinkActive()
    local channelData = Comlink.Channels[channel]

    if IsValid(self.ComlinkNotify) then self.ComlinkNotify:Remove() end

    self.ComlinkNotify = vgui.Create("DPanel", Comlink.NotifyMenu)
    self.ComlinkNotify:Dock(TOP)
    self.ComlinkNotify:SetSize(0, ScrH() * .04)
    self.ComlinkNotify:SetAlpha(0)
    self.ComlinkNotify:AlphaTo(255, .2)

    function self.ComlinkNotify:Paint(w, h)

        if not ply then return end
        if not IsValid(ply) then self:Remove() end
        if not ply:IsPlayer() then return end

        local x, y = self:LocalToScreen(0, 0)
        local scrW, scrH = ScrW(), ScrH()

        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(blur)
        for i = 1, 3 do
            blur:SetFloat("$blur", (i / 3) * 6)
            blur:Recompute()
            render.UpdateScreenEffectTexture()
            surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
        end

        draw.OutlinedBox(0, 0, w, h, 1, Color(255,255,255, 150))

        draw.DrawText(ply:GetName(), "Comlink.NotifyName", w * .25, h * .12, color_white, TEXT_ALIGN_LEFT)
        draw.DrawText(channelData.name, "Comlink.RankName", w * .25, h * .52, channelData.color, TEXT_ALIGN_LEFT)

        draw.NoTexture()

        local intPol = math.sin(CurTime()) * 10
        local col = channelData.color

        surface.SetDrawColor(ColorAlpha(col, 10))
        draw.Circle(w * .115, h * .5, (h * .2) + intPol, 35)

        surface.SetDrawColor(ColorAlpha(col, 5))
        draw.Circle(w * .115, h * .5, h * .2, 35)

        surface.SetDrawColor(col)
        draw.Circle(w * .115, h * .5, h * .07, 35)
    end
    
end

function PLAYER:RemoveComlinkPanel()
    if not IsValid(self.ComlinkNotify) then return end
    self.ComlinkNotify:AlphaTo(1, .1, 0, function()
        self.ComlinkNotify:Remove()
    end)
end


hook.Add("PlayerStartVoice", "Comlink.NotifyOn", function(ply)
    if not ply or not IsValid(ply) or not ply:IsPlayer() then return end
    local plyChan = ply:GetComlinkActive()
    if ply:GetComlinkState() != 0 or plyChan == -1 then return end

    if plyChan == LocalPlayer():GetComlinkActive() or plyChan == LocalPlayer():GetComlinkPassive1() or plyChan == LocalPlayer():GetComlinkPassive2() or ply:IsInAnnouncement() then
        ply:CreateComlinkPanel()
    end
end)


hook.Add("PlayerEndVoice", "Comlink.NotifyOff", function(ply)
    if not ply or not IsValid(ply) or not ply:IsPlayer() then return end
    local plyChan = ply:GetComlinkActive()
    if ply:GetComlinkState() != 0 or plyChan == -1 then return end

    if plyChan == LocalPlayer():GetComlinkActive() or plyChan == LocalPlayer():GetComlinkPassive1() or plyChan == LocalPlayer():GetComlinkPassive2() or ply:IsInAnnouncement() then
        ply:RemoveComlinkPanel()
    end
end)