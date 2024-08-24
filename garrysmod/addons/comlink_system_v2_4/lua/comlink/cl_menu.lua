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
local redC = Color(255,131,131)

function Comlink:OpenMenu()
    if self.Main then self.Main:Remove() end

    COMLINK_MENU_COOLDOWN = CurTime() + 1

    local width, height = ScrW() * .2, ScrH() * .45
    local posX, posY = ScrW() * .78, ScrH() * .054

    local ho = Comlink.Config.HeightOffset or 0
    local wo = Comlink.Config.WidthOffset or 0


    self.Main = vgui.Create("DFrame")
    self.Main:SetPos(posX + ScrW() * wo, posY + ScrH() * ho)
    self.Main:SetSize(width, height)
    self.Main:SetTitle("")
    self.Main:SetDraggable(false)
    self.Main:MakePopup()
    self.Main:ShowCloseButton(false)
    function self.Main:Paint(w, h)

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

        draw.OutlinedBox(0, 0, w, h, 1, color_white)

        draw.DrawText(Comlink:L("MENU_Title"), "Comlink.Title", w * .05, h * .015, color_white, TEXT_ALIGN_LEFT)
    end
    self.Main:SetAlpha(0)
	self.Main:SetVisible(true)
	self.Main:AlphaTo(255, .1, 0)

    function self.Main:CloseMenu()
        self:AlphaTo(0, .1, 0, function(anim, pnl)
            if not IsValid(pnl) then return end
            pnl:SetVisible(false)
            pnl:Remove()
        end)
    end

    timer.Simple(0.3, function()
        function self.Main:Think()
            if input.IsKeyDown(Comlink.Config.MenuKey) then
                self:CloseMenu()
            end
        end
    end)

    self.CloseButton = vgui.Create("Comlink.NavButton", self.Main)
    self.CloseButton:SetPos(width * .93, height * .01)
    self.CloseButton:SetSize(height * .04, height * .04)
    self.CloseButton:SetUp("X", function(me)
        me:GetParent():CloseMenu()
    end)

    self.List = vgui.Create("DScrollPanel", self.Main)
    self.List:SetPos(width * .05, height * .1)
    self.List:SetSize(width * .9, height * .84)
    local sbar = self.List:GetVBar()
    sbar:SetSize(0,0)
    function sbar:Paint(w, h)
        draw.RoundedBox(0, 0, 0, 0, 0, Color(124, 124, 124))
    end
    function sbar.btnUp:Paint(w, h)
        draw.RoundedBox(0, 0, 0, 0, 0, Color(124, 124, 124))
    end
    function sbar.btnDown:Paint(w, h)
        draw.RoundedBox(0, 0, 0, 0, 0, Color(124, 124, 124))
    end
    function sbar.btnGrip:Paint(w, h)
        draw.RoundedBox(0, 0, 0, 0, 0, Color(124, 124, 124))
    end

    sbar.LerpTarget = 0

    function sbar:AddScroll(dlta)
        local OldScroll = self.LerpTarget or self:GetScroll()
        dlta = dlta * 75
        self.LerpTarget = math.Clamp(self.LerpTarget + dlta, -self.btnGrip:GetTall(), self.CanvasSize + self.btnGrip:GetTall())

        return OldScroll ~= self:GetScroll()
    end

    sbar.Think = function(s)
        local frac = FrameTime() * 5
        if (math.abs(s.LerpTarget - s:GetScroll()) <= (s.CanvasSize / 10)) then
            frac = FrameTime() * 2
        end
        local newpos = Lerp(frac, s:GetScroll(), s.LerpTarget)
        s:SetScroll(math.Clamp(newpos, 0, s.CanvasSize))
        if (s.LerpTarget < 0 and s:GetScroll() <= 0) then
            s.LerpTarget = 0
        elseif (s.LerpTarget > s.CanvasSize and s:GetScroll() >= s.CanvasSize) then
            s.LerpTarget = s.CanvasSize
        end
    end

    function self.List:Paint(w, h)
        draw.RoundedBox(5, 0, 0, w, h, Color(36,36,36,89))

        if not Comlink:IsEnabled() then
            draw.DrawText(Comlink:L("HUD_SignalLost"), "Comlink.HUDChannel", w * .5, h * .4, redC, TEXT_ALIGN_CENTER)
        end
    end

    function self:PopulateComlinklist()

        if not Comlink:IsEnabled() then return end

        local tempKey = 0

        for k, v in SortedPairs(Comlink.Channels) do
            if v.accessCheck(LocalPlayer()) == false then continue end
        
            local cmlPanel = vgui.Create("Comlink.ComlinkLine", self.List)
            cmlPanel:SetSize(0, height * .07)
            cmlPanel:Dock(TOP)
            cmlPanel:SetComlink(k, tempKey)
        
            tempKey = tempKey + 1
        end 
    end

    Comlink:PopulateComlinklist()
end