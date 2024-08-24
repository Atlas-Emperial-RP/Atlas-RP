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

local ComlinkLine = {}

function ComlinkLine:Init()
    self.HoverColor = Color(117,117,117,19)

    self:SetText("")
end

function ComlinkLine:Paint(w, h)
    local color

    if not self:GetDisabled() then
        if self:IsHovered() then
            color = self.HoverColor
        else
            if self.key%2 != 0 then
                color = Color(117,117,117,82)
            else
                color = Color(117,117,117,0)
            end
        end

        if LocalPlayer():GetComlinkActive() == self.id or LocalPlayer():GetComlinkPassive1() == self.id or LocalPlayer():GetComlinkPassive2() == self.id then
            color = Comlink.Config.Theme.primaryTrans
        end
    end

    draw.RoundedBoxEx(5, 0, 0, w, h, color, true, true, true, true)

    local tw = draw.SimpleText(self.name, "Comlink.Details", w * .015, h * .17, self.color, TEXT_ALIGN_LEFT)

    if LocalPlayer():GetComlinkActive() == self.id then
        draw.SimpleText(string.upper(Comlink:L("MENU_Active")), "Comlink.HUDChannelPassive", w * .03 + tw, h * .22, Comlink.Config.Theme.whiteTrans, TEXT_ALIGN_LEFT)
    elseif LocalPlayer():GetComlinkPassive1() == self.id or LocalPlayer():GetComlinkPassive2() == self.id then
        draw.SimpleText(string.upper(Comlink:L("MENU_Passive")), "Comlink.HUDChannelPassive", w * .03 + tw, h * .22, Comlink.Config.Theme.whiteTrans, TEXT_ALIGN_LEFT)
    end

    surface.SetDrawColor(Comlink.Config.Theme.whiteTrans)
    surface.DrawRect(0, h * .95, w, h * .05)

    draw.RoundedBoxEx(5, w * .86, h * .18, w * .12, h * .6, ColorAlpha(color, 30), true, true, true, true)
    draw.SimpleText(self.cmltbl:GetCount(), "Comlink.Count", w * .919, h * .234, color_white, TEXT_ALIGN_CENTER)
end

function ComlinkLine:DoClick()

    local id = self.id

    if id == LocalPlayer():GetComlinkActive() then
        Comlink:JoinActive(-1)
        return
    end

    if id == LocalPlayer():GetComlinkPassive1() then
        Comlink:JoinPassive1(-1)
        return
    end

    if id == LocalPlayer():GetComlinkPassive2() then
        Comlink:JoinPassive2(-1)
        return
    end

    local options = {
        [Comlink:L("MENU_JoinA")] = function()
            Comlink:JoinActive(id)
        end,
        [Comlink:L("MENU_JoinP1")] = function()
            Comlink:JoinPassive1(id)
        end,
        [Comlink:L("MENU_JoinP2")] = function()
            Comlink:JoinPassive2(id)
        end,
    }

    local menu = DermaMenu() 
    function menu:Paint(width, height) end

    for name, func in SortedPairs(options) do
        local line = menu:AddOption(name, func)
        line:SetColor(color_white)
        line:SetFont("Comlink.NotifyName")

        function line:Paint(width, height)
            if self:IsHovered() then
                draw.RoundedBox(6, 0, 0, width, height, ColorAlpha(Comlink.Config.Theme.primaryTrans, 200))
            else
                draw.RoundedBox(6, 0, 0, width, height, ColorAlpha(Comlink.Config.Theme.darkTrans, 200))
            end
        end
    end

    menu:Open()
end

function ComlinkLine:DoClickInternal()
    surface.PlaySound("UI/buttonclick.wav")
end

function ComlinkLine:SetComlink(comlinkID, key)
    local cmlTbl = Comlink.Channels[comlinkID]
    
    self.name = cmlTbl:GetName()
    self.color = cmlTbl:GetColor()
    self.id = comlinkID
    self.key = key
    self.cmltbl = cmlTbl
end

vgui.Register("Comlink.ComlinkLine", ComlinkLine, "DButton")