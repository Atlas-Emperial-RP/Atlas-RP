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

local whiteC = Color(255,255,255)
local greyC = Color(255,255,255,121)
local redC = Color(255,155,155)

local icon = Material("summe/comlink/icon.png", "noclamp smooth")

hook.Add("HUDPaint", "Comlink.HUD", function()

    local ScrW, ScrH = ScrW(), ScrH()

    local ho = Comlink.Config.HeightOffset or 0
    local wo = Comlink.Config.WidthOffset or 0
    local state = LocalPlayer():GetComlinkState()

    local greyC = greyC
    local whiteC = whiteC

    draw.DrawBlur(ScrW * .78 + ScrW * wo, ScrH * .015 + ScrH * ho, ScrW * .2, ScrH * .04, 4, 5, 255)
	draw.OutlinedBox(ScrW * .78 + ScrW * wo, ScrH * .015 + ScrH * ho, ScrW * .2, ScrH * .04, 1, color_white)
	--draw.RoundedBox(0, ScrW * .805 + ScrW * wo, ScrH * .015 + ScrH * ho, ScrW * .001, ScrH * .04, color_white)
    draw.NoTexture()
    draw.Circle(ScrW * .807 + ScrW * wo, ScrH * .035 + ScrH * ho, 3, 35)

    surface.SetDrawColor(Comlink.Config.Theme.Indicators[state])
    surface.SetMaterial(icon)
    surface.DrawTexturedRect(ScrW * .7844 + ScrW * wo, ScrH * .0225 + ScrH * ho, ScrH * .03, ScrH * .03)

    if Comlink.Enabled then

        if state == 2 then
            greyC = ColorAlpha(greyC, 40)
            whiteC = ColorAlpha(whiteC, 60)
        end

        local cmlTbl1 = Comlink.Channels[LocalPlayer():GetComlinkActive()] or {}

        local tw = draw.SimpleText(cmlTbl1.name or Comlink:L("HUD_NoChannel"), "Comlink.HUDChannel", ScrW * .813 + ScrW * wo, ScrH * .025 + ScrH * ho, whiteC, TEXT_ALIGN_LEFT)

        local cmlTbl2 = Comlink.Channels[LocalPlayer():GetComlinkPassive1()] or {}

        local cmlTbl3 = Comlink.Channels[LocalPlayer():GetComlinkPassive2()] or {}

        local pchan1 = cmlTbl2.name or Comlink:L("HUD_NoChannel")
        local pchan2 = cmlTbl3.name or Comlink:L("HUD_NoChannel")

        local txt = SummeLibrary:ShortenString(pchan1 .. " / ".. pchan2, 30)

        draw.SimpleText(txt, "Comlink.HUDChannelPassive1", ScrW * .817 + tw + ScrW * wo, ScrH * .0289 + ScrH * ho, greyC, TEXT_ALIGN_LEFT)

    else

        draw.SimpleText(Comlink:L("HUD_SignalLost"), "Comlink.HUDChannel", ScrW * .812 + ScrW * wo, ScrH * .025 + ScrH * ho, redC, TEXT_ALIGN_LEFT)

    end
end)