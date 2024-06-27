/* 
- Product of osgmod.com -
Script create by Nordahl you can find here : https://osgmod.com/gmod-scripts/1966/players-spawn-point-editor
Profile page of the Creator : https://osgmod.com/profiles/76561198033784269

Gmod Script Market Place : https://osgmod.com/gmod-scripts/page-1

- Do not duplicate or reproduce.
- By buying my scripts you contribute to the creations and the updates
- Dont leak, Lack of recognition fuelled by thanks does not bring food to the table
- Respect my work please

Code Minified with Originahl-Scripts Software : https://osgmod.com/en/help/code-minification-optimisation

The satisfied members who offered the coffee and supported me : https://osgmod.com/coffee
*/

local clr_8,clr_1,cl_w,clr_mod=Color(0,0,0),Color(40,40,40,200),color_white,Color(85,111,170)
local RBox,SText,SDClr,DTextR,vCrt,SMat,CTxt,KD=draw.RoundedBox,draw.SimpleText,surface.SetDrawColor,surface.DrawTexturedRect,vgui.Create,surface.SetMaterial,chat.AddText,input.IsKeyDown
local function z4pint(z4)local c=clr_8 z4.Paint=function(p,w,h)RBox(4,0,0,w,h,c)RBox(4,2,2,w-4,h-4,cl_w)RBox(4,0,0,16+8,h,c)end end

include('shared.lua')
include('config.lua')
local zcolorbase=Color(0,255,0,200) 
local showlogo=0
local greenvalue=1

local function eRight(a)
if a:SteamID()==JSP_CONFIG.OwnerSteamID then return true end
if a:IsAdmin()==true then if JSP_CONFIG.Allow_Admin==1 then return true end end
if a.GetUserGroup!=nil then
for _,c in ipairs(JSP_CONFIG.SAM_Access_rank)do if a:GetUserGroup()==c then return true end end
end
for _,c in ipairs(JSP_CONFIG.Allow_ULX_GROUP_CAN_ACCESS_PANEL)do if a:IsUserGroup(c) then return true end end
if serverguard then for _,c in ipairs(JSP_CONFIG.SERVERGUARD_Access_rank)do if serverguard.player:GetRank(a)==c then return true end end end
return a:IsSuperAdmin()
end

local files=file.Read("nordahlclient_option/language.txt","DATA")
if (!files) then
file.CreateDir("nordahlclient_option")
file.Write("nordahlclient_option/language.txt","2")
Z_Defaut_Languages=2
else
Z_Defaut_Languages=tonumber(file.Read("nordahlclient_option/language.txt","DATA"))
end

local function btnble(a,b,c)
local col1=Color(0,0,90,175)
local col2=Color(200,200,230,255)
if a.val==greenvalue then
col1=Color(0,150,0,175)
col2=Color(200,230,200,255)
end
draw.RoundedBox(6,0,0,a:GetWide(),a:GetTall(),col1)
draw.RoundedBox(6,1,1,a:GetWide()-2,a:GetTall()-2,color_white)
draw.RoundedBox(4,1,a:GetTall()-1-a:GetTall()/3,a:GetWide()-2,a:GetTall()/3,col2)
surface.SetDrawColor(255,255,255) 
surface.SetMaterial(Material(c))surface.DrawTexturedRect(5,2,16,16)
surface.SetDrawColor(255,255,255)draw.SimpleText(b,"Trebuchet18",a:GetWide()/2+8,10,Color(0,0,0),1,1)
end

local trajsp_nordahl="Player Spawn Point Manager"
local trajsp_nordahl_a=""
local trajsp_nordahl_b="Editez la couleur du point de spawn"
local trajsp_nordahl_c1="Admin Eyes"
local trajsp_nordahl_c2="Disable Eyes"
local trajsp_nordahl_d1="Cacher Model"
local trajsp_nordahl_d2="Montrer Model"
local trajsp_nordahl_e="Supprimer"
local trajsp_nordahl_f="Point de spawn pour"
local tra_scrp_nordahl_credit="Fait par Nordahl"
local tra_scrp_nordahl_script="Script"
local trajsp_nordahl_g=""

function nordahl_jpslanguefr(z)Z_Defaut_Languages=z
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
trajsp_nordahl="Player Spawn Point Manager"
trajsp_nordahl_a=""
trajsp_nordahl_b="Editez la couleur du point de spawn"
trajsp_nordahl_c1="Admin Eyes"
trajsp_nordahl_c2="Disable Eyes"
trajsp_nordahl_d1="Cacher Model"
trajsp_nordahl_d2="Montrer Model"
trajsp_nordahl_e="Supprimer"
trajsp_nordahl_f="Point de spawn pour"
tra_scrp_nordahl_credit="Fait par Nordahl"
tra_scrp_nordahl_script="Script"
trajsp_nordahl_g=""
end

function nordahl_jpslangueen(z)Z_Defaut_Languages=z
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
trajsp_nordahl="Player Spawn Point Manager"
trajsp_nordahl_a=""
trajsp_nordahl_b="Edit the color of the spawn point"
trajsp_nordahl_c1="Admin Eyes"
trajsp_nordahl_c2="Disable Eyes"
trajsp_nordahl_d1="Hide Model"
trajsp_nordahl_d2="Show Model"
trajsp_nordahl_e="Remove"
trajsp_nordahl_f="Spawn point for"
tra_scrp_nordahl_credit="Made by Nordahl"
tra_scrp_nordahl_script="Script"
trajsp_nordahl_g="" end

function nordahl_jpslanguedu(z)Z_Defaut_Languages=z
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
trajsp_nordahl="Player Spawn Point Manager"
trajsp_nordahl_a=""
trajsp_nordahl_b="Bearbeiten Sie die Farbe der Spawnpunkt"
trajsp_nordahl_c1="Admin Eyes"
trajsp_nordahl_c2="Disable Eyes"
trajsp_nordahl_d1="Hide Model"
trajsp_nordahl_d2="Show Model"
trajsp_nordahl_e="Entfernen"
trajsp_nordahl_f="Spawnpunkt für"
tra_scrp_nordahl_credit="von Nordahl Gemacht"
tra_scrp_nordahl_script="Script"
trajsp_nordahl_g="" end

function nordahl_jpslangueru(z)Z_Defaut_Languages=z
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
trajsp_nordahl="Player Spawn Point Manager"
trajsp_nordahl_a=""
trajsp_nordahl_b="Измените цвет точки икру"
trajsp_nordahl_c1="Admin Eyes"
trajsp_nordahl_c2="Disable Eyes"
trajsp_nordahl_d1="Скрыть Модель"
trajsp_nordahl_d2="Показать модель"
trajsp_nordahl_e="Удалить"
trajsp_nordahl_f="Спаун точка для"
tra_scrp_nordahl_credit="Сделано Нордалем"
tra_scrp_nordahl_script="Script"
trajsp_nordahl_g="" end

function nordahl_jpslanguees(z)Z_Defaut_Languages=z
if IsValid(LocalPlayer()) then
LocalPlayer():EmitSound("garrysmod/ui_return.wav",60,150)
end
trajsp_nordahl="Player Spawn Point Manager"
trajsp_nordahl_a=""
trajsp_nordahl_b="Edite el color del punto de generación"
trajsp_nordahl_c1="Admin Eyes"
trajsp_nordahl_c2="Disable Eyes"
trajsp_nordahl_d1="Ocultar Modelo"
trajsp_nordahl_d2="Mostrar Modelo"
trajsp_nordahl_e="Eliminar"
trajsp_nordahl_f="Punto de Spawn para"
tra_scrp_nordahl_credit="Made by Nordahl"
tra_scrp_nordahl_script="Script"
trajsp_nordahl_g="" end

if Z_Defaut_Languages==1 then
nordahl_jpslanguefr(1)
elseif Z_Defaut_Languages==2 then
nordahl_jpslangueen(2)
elseif Z_Defaut_Languages==3 then
nordahl_jpslanguees(3)
elseif Z_Defaut_Languages==4 then
nordahl_jpslanguedu(4)
elseif Z_Defaut_Languages==5 then
nordahl_jpslangueru(5)
else
nordahl_jpslangueen(2)
end

function ENT:Draw()
if self:Getent_visible()==1 then
self.Entity:DrawModel()
local amount=10
local Pos=self:GetPos()+Vector(0,0,0)
local Ang=self:GetAngles()
cam.Start3D2D(Pos,Ang,0.2 )
draw.DrawText("----->","Default",50,0,Color(255,0,0,255,255),1)
draw.DrawText("----->","Default",100,0,Color(0,255,0,255,255),1)
draw.DrawText("----->","Default",150,0,Color(0,0,255,255,255),1)
cam.End3D2D()
end end

local mat2=Material("vgui/entities/safezoneicon.png" )
local mat4=Material("icon32/zoom_extend.png" ) --icon64/tool
local mat5=Material("models/props_combine/com_shield001a.vmt" )
local mat6=Material("phoenix_storms/wire/pcb_red.vmt")
local mat7=Material("ngui/nordahl_icon/sppt1.png" )

local gradient=Material("gui/gradient.png")

local SetDrawColor=surface.SetDrawColor
local TexturedRect=surface.DrawTexturedRect
local SetMaterial=surface.SetMaterial

local function zradient(r,g,b,a,x,y,w,t)
SetDrawColor(r,g,b,a)
SetMaterial(gradient)TexturedRect(x,y,w,t)
end

net.Receive("SynchJPS",function(len)
LocalPlayer():EmitSound("garrysmod/ui_return.wav",45,100)
local c1=net.ReadString()
local ent=Entity(c1)
local c2=net.ReadString()
local c3=net.ReadTable()
local c4=net.ReadTable()
local c5=net.ReadTable()
local c6=net.ReadTable()
local entVer=ent.Ver
if !IsValid(ent) then return end
local jmet=ent:Getent_jnom()
local showcube=ent:Getent_visible()
local disk=tonumber(c2)
local zcolorbase=Color(ent:Getent_red(),ent:Getent_green(),ent:Getent_bleu(),255)
local Menu=vgui.Create("DFrame")
local w=600
Menu:SetSize(w,300)
Menu:SetPos(ScrW()-w-323-10,ScrH()-(Menu:GetTall()+5))
Menu:SetTitle("")
Menu:SetDraggable(true)
Menu:ShowCloseButton(false)
Menu:MakePopup()
Menu.Paint=function()
if !IsValid(ent) then
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
Menu:Close()
return end
zradient(38,37,175,255,0,0,Menu:GetWide(),Menu:GetTall())
zradient(255,255,255,255,1,1,Menu:GetWide()-2,Menu:GetTall()-2)

surface.SetDrawColor(255,255,255) 
surface.SetMaterial(Material("ngui/jps_by_nordahl.png"))surface.DrawTexturedRect(5,4,16,16)
draw.SimpleText(trajsp_nordahl.." Ver "..entVer.." : "..jmet,"Trebuchet18",28,13,Color(zcolorbase.r/1.5,zcolorbase.g/1.5,zcolorbase.b/1.5),TEXT_ALIGN_LEFT,1,1,Color(0,0,0))
draw.SimpleText(trajsp_nordahl_a,"Trebuchet18",20,15,Color(0,0,0),TEXT_ALIGN_LEFT,0,1,Color(0,0,0))
draw.SimpleText(trajsp_nordahl_b,"Trebuchet18",20,60,Color(0,0,0),TEXT_ALIGN_LEFT,0,1,Color(0,0,0)) end

local button=vgui.Create("DButton",Menu)
button:SetText("")
button:SetPos(0,26)
button:SetSize(Menu:GetWide(),30 )
button.Paint=function(p,w,t)
zradient(0,0,0,255,1,0,w-2,t)
zradient(186,185,254,255,1,1,w-2,t-2)
zradient(141,138,253,255,1,20,w-2,9)
draw.SimpleText(trajsp_nordahl_f..":".." "..jmet,"Trebuchet18",20,15,Color(0,0,0),TEXT_ALIGN_LEFT,1,1,Color(0,0,0))
draw.RoundedBox(4,w/2-100,6,200,20-2,Color(zcolorbase.r,zcolorbase.g,zcolorbase.b,255))
draw.RoundedBox(4,w/2-100+1,6+1,198,18-2,Color(0,0,0))
draw.RoundedBox(4,w/2-100+1,6+10,198,5,Color(40,40,40,255))
draw.SimpleText("Change the Group?","Trebuchet18",w/2,15,color_white,1,1,1,Color(0,0,0))
end
button.DoClick=function()end

local textbox1=vgui.Create("DTextEntry",button)
textbox1:SetPos(Menu:GetWide()/2-100,5)
textbox1:SetSize(200,20)
textbox1:SetText(jmet)
textbox1.OnEnter=function(self)
local strR=string.Replace(self:GetValue(),"","")
textbox1:SetTextColor(Color(0,150,0,255))
RunConsoleCommand("spsetname",strR)
end

local zcolor=vgui.Create("DColorMixer",Menu);
zcolor:SetAlphaBar(false)
zcolor:SetPalette(false)
zcolor:SetWangs(false) 
zcolor:SetSize(Menu:GetWide()-31,100);
zcolor:SetPos(20,75);
zcolor:SetColor(zcolorbase)
zcolor.Think=function(self)
if colorr!=zcolor:GetColor().r or colorg!=zcolor:GetColor().g or colorb!=zcolor:GetColor().b then
zcolorbase=zcolor:GetColor()
colorr=zcolorbase.r
colorg=zcolorbase.g
colorb=zcolorbase.b
RunConsoleCommand("sprecoitlescoulor",tostring(colorr),tostring(colorg),tostring(colorb))
end
end

local zizmatch=vgui.Create("DButton",Menu)
zizmatch:SetText("")
zizmatch:SetPos(20,200)
zizmatch:SetSize(90,90)
zizmatch.Paint=function()
if showlogo==1 then
zradient(0,200,0,255,1,1,zizmatch:GetWide()-2,zizmatch:GetTall()-2)
zradient(0,150,0,255,1,70,90,16)
draw.RoundedBox(0,0,0,0,0,color_white)
surface.SetMaterial(mat4)surface.DrawTexturedRect(22,22,44,44)
draw.SimpleText(trajsp_nordahl_c1,"Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
else
zradient(254,185,185,255,1,1,90,zizmatch:GetTall()-2)zradient(253,141,138,255,1,69,Menu:GetWide()-2,20)
draw.RoundedBox(0,0,0,0,0,Color(255,0,0,255))
surface.SetMaterial(mat4)surface.DrawTexturedRect(22,22,44,44)
draw.SimpleText(trajsp_nordahl_c2,"Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
end
end
zizmatch.DoClick=function()
surface.PlaySound("ambient/machines/keyboard1_clicks.wav")
if showlogo==1 then
showlogo=0
else
showlogo=1
end
end
local zizmatch=vgui.Create("DButton",Menu)
zizmatch:SetText("")
zizmatch:SetPos(120,200)
zizmatch:SetSize(90,90)
zizmatch.Paint=function()
if showcube==1 then
zradient(0,200,0,255,1,1,zizmatch:GetWide()-2,zizmatch:GetTall()-2)
zradient(0,150,0,255,1,70,90,16)
draw.RoundedBox(0,0,0,0,0,color_white)
surface.SetMaterial(mat5)surface.DrawTexturedRect(22,22,44,44)
draw.SimpleText(trajsp_nordahl_d1,"Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
else
zradient(254,185,185,255,1,1,90,zizmatch:GetTall()-2)zradient(253,141,138,255,1,69,w-2,20)
draw.RoundedBox(0,22,22,44,44,color_white)
surface.SetMaterial(mat6)surface.DrawTexturedRect(22,22,44,44)
draw.SimpleText(trajsp_nordahl_d2,"Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
end
end
zizmatch.DoClick=function()
surface.PlaySound("ambient/machines/keyboard1_clicks.wav")
if showcube==1 then
showcube=0
RunConsoleCommand("spHidethecube","0")
else
showcube=1
RunConsoleCommand("spHidethecube","1")
end
end
local zizmatch=vgui.Create("DButton",Menu)
zizmatch:SetText("")
zizmatch:SetPos(220,200)
zizmatch:SetSize(90,90)
zizmatch.Paint=function()
if showcube==1 then
zradient(0,200,0,255,1,1,zizmatch:GetWide()-2,zizmatch:GetTall()-2)
zradient(0,150,0,255,1,70,90,16)
surface.SetMaterial(mat5)surface.DrawTexturedRect(22,22,44,44)
draw.SimpleText("Hide All","Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
else
zradient(254,185,185,255,1,1,90,zizmatch:GetTall()-2)zradient(253,141,138,255,1,69,Menu:GetWide()-2,20)
draw.RoundedBox(0,22,22,44,44,color_white)
surface.SetMaterial(mat6)surface.DrawTexturedRect(22,22,44,44)
draw.SimpleText("Show All","Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
end
end
zizmatch.DoClick=function()
surface.PlaySound("ambient/machines/keyboard1_clicks.wav")
if showcube==1 then
showcube=0
RunConsoleCommand("nordahl_hide_all_cubemodel")
else
showcube=1
RunConsoleCommand("nordahl_show_all_cubemodel")
end
end

local zizmatch=vgui.Create("DButton",Menu)
zizmatch:SetText("")
zizmatch:SetPos(320,200)
zizmatch:SetSize(90,90)
zizmatch.Paint=function()
zradient(0,200,0,255,1,1,zizmatch:GetWide()-2,zizmatch:GetTall()-2)
zradient(0,150,0,255,1,70,90,16)

surface.SetMaterial(mat7)surface.DrawTexturedRect(15,5,30,30)
surface.SetMaterial(mat7)surface.DrawTexturedRect(45,30,30,30)
draw.SimpleText("Duplicate","Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
end
zizmatch.DoClick=function()
RunConsoleCommand("Zworld_SP_Dup")surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
Menu:Close()
end

local zizmatch=vgui.Create("DButton",Menu)
zizmatch:SetText("")
zizmatch:SetPos(420,200)
zizmatch:SetSize(90,90)
zizmatch.Paint=function()
zradient(0,200,0,255,1,1,zizmatch:GetWide()-2,zizmatch:GetTall()-2)
zradient(0,150,0,255,1,70,90,16)
draw.RoundedBox(4,22,22,44,44,Color(255,0,0,255))
draw.SimpleText(trajsp_nordahl_e,"Trebuchet18",45,70,color_white,1,0,1,Color(0,0,0))
end
zizmatch.DoClick=function()
surface.PlaySound("ambient/machines/keyboard1_clicks.wav")
RunConsoleCommand("RemovetheSPJ")
Menu:Close() end
local button=vgui.Create("DButton",Menu)button:SetText("")button:SetSize(136,16)
button.Paint=function(p,w,t)
if disk==1 then
draw.RoundedBox(4,0,0,w,t,Color(0,0,0))
draw.RoundedBox(4,1,1,w-2,t-2,color_white)
draw.RoundedBox(2,1,10,w-2,4,Color(187,254,185,255))
draw.SimpleText("Persistant: ON","Trebuchet18",68,8,Color(0,150,0),1,1,1,Color(0,0,0))
else
draw.RoundedBox(4,0,0,w,t,Color(0,0,0))
draw.RoundedBox(4,1,1,w-2,t-2,color_white)
draw.RoundedBox(2,1,10,w-2,4,Color(254,187,185,255))
draw.SimpleText("Persistant: OFF","Trebuchet18",68,8,Color(150,0,0),1,1,1,Color(0,0,0))
end
end
button:SetPos(Menu:GetWide()-200,5)
button.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
if disk==1 then disk=0 RunConsoleCommand("Zworld_SPJSauvegarde0") else disk=1 RunConsoleCommand("Zworld_SPJSauvegarde1") end
end

local button=vgui.Create("DButton",Menu)button:SetText("")
button:SetSize(60,16)
button:SetPos(Menu:GetWide()-190-74,5)
button.Paint=function(p,w,t)
if disk==1 then
draw.RoundedBox(4,0,0,w,t,Color(0,0,0))
draw.RoundedBox(4,1,1,w-2,t-2,color_white)
draw.RoundedBox(2,1,10,w-2,4,Color(187,254,185,255))
draw.SimpleText("Save","Trebuchet18",30,8,Color(0,150,0),1,1,1,Color(0,0,0))
else
draw.RoundedBox(4,0,0,w,t,Color(0,0,0))
draw.RoundedBox(4,1,1,w-2,t-2,color_white)
draw.RoundedBox(2,1,10,w-2,4,Color(254,187,185,255))
draw.SimpleText("Save","Trebuchet18",30,8,Color(150,0,0),1,1,1,Color(0,0,0))
end
end
button.DoClick=function()
RunConsoleCommand("Zworld_SPsave")surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
end

local button=vgui.Create("DButton",Menu)button:SetText("")button:SetSize(16,16)
button.Paint=function(p,w,t)draw.RoundedBox(8,0,0,w,t,Color(0,0,0,0))
end
button:SetPos(Menu:GetWide()-40,5)local zmodcm=vgui.Create("DImage",Menu)zmodcm:SetImage("icon16/Wrench.png")zmodcm:SetSize(16,16)zmodcm:SetPos(Menu:GetWide()-40,5)button.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
local z4=DermaMenu()

local z1,z01=z4:AddSubMenu("Languages")
z01:SetIcon("icon16/world.png")
local flche=""
if Z_Defaut_Languages==1 then flche="*" else flche="" end 
z1:AddOption(flche.."Français",function()file.Write("nordahlclient_option/language.txt","1")nordahl_jpslanguefr(1)end):SetImage("flags16/fr.png")
if Z_Defaut_Languages==2 then flche="*" else flche="" end 
z1:AddOption(flche.."English",function()file.Write("nordahlclient_option/language.txt","2")nordahl_jpslangueen(2)end):SetImage("flags16/gb.png")
if Z_Defaut_Languages==3 then flche="*" else flche="" end 
z1:AddOption(flche.."Español",function()file.Write("nordahlclient_option/language.txt","3")nordahl_jpslanguees(3)end):SetImage("flags16/es.png")
if Z_Defaut_Languages==4 then flche="*" else flche="" end 
z1:AddOption(flche.."Deutsch",function()file.Write("nordahlclient_option/language.txt","4")nordahl_jpslanguedu(4)end):SetImage("flags16/de.png")
if Z_Defaut_Languages==5 then flche="*" else flche="" end 
z1:AddOption(flche.."Russian",function()file.Write("nordahlclient_option/language.txt","5")nordahl_jpslangueru(5)end):SetImage("flags16/ru.png")
z4pint(z1)
local z1,z01=z4:AddSubMenu(tra_scrp_nordahl_script)
z01:SetIcon("icon16/wand.png")
z1:AddOption(tra_scrp_nordahl_credit,function()gui.OpenURL("https://osgmod.com/profiles/76561198033784269") end):SetImage("ngui/nordahl.png")
z1:AddOption(tra_scrp_nordahl_script.." :)",function()gui.OpenURL("https://osgmod.com/gmod-scripts/1966/reviews-page-1") end):SetImage("icon16/star.png")
z1:AddOption("Workshop Content",function()gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=493897275") end)
z4:AddOption("Script Description",function()gui.OpenURL("https://osgmod.com/gmod-scripts/1966/description") end):SetImage("ngui/originahl-scripts.png")
z4:AddOption("Script Wiki",function()gui.OpenURL("https://osgmod.com/gmod-scripts/1966/wiki") end):SetImage("ngui/originahl-scripts.png")
z4pint(z1)
z4pint(z4)
z4:Open()
end

local button=vgui.Create("DButton",Menu)button:SetText("")button:SetSize(16,16)
button.Paint=function(p,w,t)draw.RoundedBox(8,0,0,w,t,Color(0,0,0,0))
end
button:SetPos(Menu:GetWide()-60,5)local zmodcm=vgui.Create("DImage",Menu)zmodcm:SetImage("icon16/arrow_refresh.png")zmodcm:SetSize(16,16)zmodcm:SetPos(Menu:GetWide()-60,5)button.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")Menu:Close()
RunConsoleCommand("playerspawnpoint_open")
end

local button=vgui.Create("DButton",Menu)button:SetText("")button:SetSize(16,16)
button.Paint=function(p,w,t)draw.RoundedBox(8,0,0,w,t,Color(0,0,0,0))
end
button:SetPos(Menu:GetWide()-20,5)local zmodcm=vgui.Create("DImage",Menu)zmodcm:SetImage("icon16/cross.png")zmodcm:SetSize(16,16)zmodcm:SetPos(Menu:GetWide()-20,5)button.DoClick=function()surface.PlaySound("ambient/machines/keyboard5_clicks.wav")Menu:Close()
end

local panel=vgui.Create("DFrame",Menu)
panel:SetSize(323,600)
panel:SetPos(ScrW()-(panel:GetWide()+5),ScrH()-(panel:GetTall()+5))
panel:SetTitle("")
panel:SetDraggable(true)
panel:ShowCloseButton(false)
panel:MakePopup()
panel.Paint=function()
zradient(38,37,175,255,0,0,panel:GetWide()-2,panel:GetTall())
zradient(255,255,255,255,1,1,panel:GetWide()-4,panel:GetTall()-2)
surface.SetDrawColor(255,255,255)
if enabled==0 then
surface.SetMaterial(Material("icon16/cross.png"))surface.DrawTexturedRect(5,5,16,16)
draw.SimpleText("Disabled","Trebuchet18",28,13,Color(0,0,0),TEXT_ALIGN_LEFT,1)

elseif enabled==1 then
surface.SetMaterial(Material("icon16/accept.png"))surface.DrawTexturedRect(5,5,16,16)
draw.SimpleText("Mode 1 : Autorisation System","Trebuchet18",28,13,Color(0,0,0),TEXT_ALIGN_LEFT,1)

elseif enabled==2 then
surface.SetMaterial(matngui)surface.DrawTexturedRect(5,5,16,16)
draw.SimpleText("Mode 2 : Autorisation reversed System","Trebuchet18",28,13,Color(0,0,0),TEXT_ALIGN_LEFT,1)

end
end

local dpanel=vgui.Create("DPanel",panel)
dpanel:SetSize(panel:GetWide(),panel:GetTall())
dpanel.Paint=function()end
local iist=vgui.Create("DIconLayout",dpanel)
iist:SetSize(dpanel:GetWide(),dpanel:GetTall())
iist:SetPos(5,4)
iist:SetSpaceY(3)
iist:SetSpaceX(5)
iist:SetBGColor(255,255,0,255)
iist:SetPaintBackgroundEnabled(true)
local undpanel=nil
greenvalue=1

local function miZaJ(crea,t,a,b,c)
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
crea:Clear()
for k,f in pairs(t)do
if f[1]==b then
f[2]=tonumber(c)
end
end
for k,v in pairs(t) do
if v[2]==1 then
crea:AddLine(v[1],zzrugmpod18,zzrugmpod4,k)
else
crea:AddLine(v[1],zzrugmpod18,zzrugmpod5,k)
end
end
RunConsoleCommand(a,b,c)
end

local function miZaJ2(crea,t,a,b,c)
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
crea:Clear()
for k,f in pairs(t)do
if f[2]==b then
f[3]=tonumber(c)
end
end
for k,v in pairs(t) do
if v[3]==1 then
crea:AddLine(v[1],zzrugmpod18,zzrugmpod4,k)
else
crea:AddLine(v[1],zzrugmpod18,zzrugmpod5,k)
end
end
RunConsoleCommand(a,b,c)
end

local function miZaJ3(crea,t,a,b,c,d)
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
crea:Clear()
table.insert(t,{b,c,d})
for k,v in pairs(t) do
crea:AddLine(v[1],v[2],v[3],k)
end
RunConsoleCommand(a,b,c,d)
end

local function un()
if undpanel then undpanel:Remove() undpanel=nil end
undpanel=vgui.Create("DPanel",panel)
undpanel:SetPos(5,50)
undpanel:SetSize(panel:GetWide()-10,panel:GetTall()-55)
undpanel.Paint=function()
zradient(0,0,0,255,0,0,undpanel:GetWide()-1,undpanel:GetTall())zradient(zcolorbase.r/1.5,zcolorbase.g/1.5,zcolorbase.b/1.5,255,1,1,undpanel:GetWide()-3,undpanel:GetTall()-2)
end
local list2=vgui.Create("DListView",undpanel)
list2:SetPos(0,30)
list2:SetSize(undpanel:GetWide(),undpanel:GetTall()-30)
list2.Paint=function()
draw.RoundedBox(6,0,0,list2:GetWide()-1,list2:GetTall(),Color(0,0,0))
draw.RoundedBox(6,1,1,list2:GetWide()-3,list2:GetTall()-2,Color(zcolorbase.r+100,zcolorbase.g+100,zcolorbase.b+100,255))
end
list2:AddColumn("Job")
for k,v in pairs(c3) do
if v[2]==1 then
list2:AddLine(v[1],zzrugmpod18,zzrugmpod4,k)
else
list2:AddLine(v[1],zzrugmpod18,zzrugmpod5,k)
end
end
list2.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
z4:AddOption("Delete",function()RunConsoleCommand("jsp_job_rem",line:GetColumnText(1))table.remove(c3,line:GetColumnText(4)) list2:RemoveLine(id)end):SetImage("icon16/cross.png")
z4pint(z4)
z4:Open()
end

local a=vgui.Create("DButton",undpanel)
a:SetText("")
a:SetPos(5,5)
a:SetSize(100,20)
a.Paint=function()
btnble(a,"Add".." Jobs","icon16/book.png")
end
a.DoClick=function()
surface.PlaySound("garrysmod/ui_return.wav")
local z4=DermaMenu()
for k,v in SortedPairsByMemberValue(team.GetAllTeams(),"Name") do
local Nil=bil
for q,f in pairs(c3) do
if f[1]==v.Name then
Nil=true
end
end
if Nil==nil then
z4:AddOption(v.Name,function()
table.insert(c3,{v.Name,zzrugmpod5})
list2:AddLine(v.Name,zzrugmpod18,zzrugmpod5,#c3)
RunConsoleCommand("jsp_job_add",v.Name)
end):SetImage("icon16/add.png")
end
end

z4pint(z4)
z4:Open()
end
local a=vgui.Create("DButton",undpanel)
a:SetText("")
a:SetPos(110,5)
a:SetSize(80,20)
a.Paint=function()
btnble(a,"Cleanup","icon16/cross.png")
end
a.DoClick=function()
list2:Clear()
RunConsoleCommand("jsp_job_del")
c3={}
surface.PlaySound("garrysmod/ui_return.wav")
end

end
local function deux()
if undpanel then undpanel:Remove() undpanel=nil end
undpanel=vgui.Create("DPanel",panel)
undpanel:SetPos(5,50)
undpanel:SetSize(panel:GetWide()-10,panel:GetTall()-55)
undpanel.Paint=function()
zradient(0,0,0,255,0,0,undpanel:GetWide()-1,undpanel:GetTall())zradient(zcolorbase.r/1.5,zcolorbase.g/1.5,zcolorbase.b/1.5,255,1,1,undpanel:GetWide()-3,undpanel:GetTall()-2)
end
local list2=vgui.Create("DListView",undpanel)
list2:SetPos(0,30)
list2:SetSize(undpanel:GetWide(),undpanel:GetTall()-30)
list2.Paint=function()
draw.RoundedBox(6,0,0,list2:GetWide()-1,list2:GetTall(),Color(0,0,0))
draw.RoundedBox(6,1,1,list2:GetWide()-3,list2:GetTall()-2,Color(zcolorbase.r+100,zcolorbase.g+100,zcolorbase.b+100,255))
end
list2:AddColumn("ULX Rank Name")
for k,v in pairs(c4) do
list2:AddLine(v[1],zzrugmpod18,zzrugmpod5,k)
end
list2.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
z4:AddOption("Delete",function()RunConsoleCommand("jsp_ulx_rem",line:GetColumnText(1))table.remove(c4,line:GetColumnText(4)) list2:RemoveLine(id)end):SetImage("icon16/cross.png")
z4pint(z4)
z4:Open()
end
local dtext=vgui.Create("DTextEntry",undpanel)
dtext:SetPos(5,5)
dtext:SetSize(140,20)
dtext:SetText("Nom du rang et entrée")
dtext.OnEnter=function(self)
local strR=string.Replace(self:GetValue(),"","")

local N3l=nil
for q,f in pairs(c4) do
if f[1]==strR then
N3l=true
end
end
if !N3l then
dtext:SetTextColor(Color(0,150,0,255))
dtext:SetText("Good")
RunConsoleCommand("jsp_ulx_add",strR)
table.insert(c4,{strR,zzrugmpod5})
list2:AddLine(strR,zzrugmpod18,zzrugmpod5,#c4)
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
else
dtext:SetTextColor(Color(150,0,0,255))
dtext:SetText("Exist Already in the list")
surface.PlaySound("garrysmod/ui_return.wav")

end
end
local a=vgui.Create("DButton",undpanel)
a:SetText("")
a:SetPos(150,5)
a:SetSize(80,20)
a.Paint=function()
btnble(a,"Cleanup","icon16/cross.png")
end
a.DoClick=function()
list2:Clear()
RunConsoleCommand("jsp_ulx_del")
c4={}
surface.PlaySound("garrysmod/ui_return.wav")
end
end

local function trois()
if undpanel then undpanel:Remove() undpanel=nil end
undpanel=vgui.Create("DPanel",panel)
undpanel:SetPos(5,50)
undpanel:SetSize(panel:GetWide()-10,panel:GetTall()-55)
undpanel.Paint=function()
zradient(0,0,0,255,0,0,undpanel:GetWide()-1,undpanel:GetTall())zradient(zcolorbase.r/1.5,zcolorbase.g/1.5,zcolorbase.b/1.5,255,1,1,undpanel:GetWide()-3,undpanel:GetTall()-2)
end
local list2=vgui.Create("DListView",undpanel)
list2:SetPos(0,30)
list2:SetSize(undpanel:GetWide(),undpanel:GetTall()-30)
list2.Paint=function()
draw.RoundedBox(6,0,0,list2:GetWide()-1,list2:GetTall(),Color(0,0,0))
draw.RoundedBox(6,1,1,list2:GetWide()-3,list2:GetTall()-2,Color(zcolorbase.r+100,zcolorbase.g+100,zcolorbase.b+100,255))
end
list2:AddColumn("Name of the Teamgroup")
for k,v in pairs(c5) do
list2:AddLine(v[1],v[2],zzrugmpod4,k)
end
list2.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
z4:AddOption("Delete",function()RunConsoleCommand("jsp_teamgroup_rem",line:GetColumnText(1))table.remove(c5,line:GetColumnText(4)) list2:RemoveLine(id)end):SetImage("icon16/cross.png")
z4pint(z4)
z4:Open()
end
local dtext=vgui.Create("DTextEntry",undpanel)
dtext:SetPos(5,5)
dtext:SetSize(140,20)
dtext:SetText("Nom du rang et entrée")
dtext.OnEnter=function(self)
local strR=string.Replace(self:GetValue(),"","")

local N3l=nil
for q,f in pairs(c5) do
if f[1]==strR then
N3l=true
end
end
if !N3l then
dtext:SetTextColor(Color(0,150,0,255))
dtext:SetText("Good")
RunConsoleCommand("jsp_teamg_add",strR)
table.insert(c5,{strR,zzrugmpod5})
list2:AddLine(strR,zzrugmpod18,zzrugmpod5,#c5)
surface.PlaySound("ambient/machines/keyboard5_clicks.wav")
else
dtext:SetTextColor(Color(150,0,0,255))
dtext:SetText("Exist Already in the list")
surface.PlaySound("garrysmod/ui_return.wav")

end
end
local a=vgui.Create("DButton",undpanel)
a:SetText("")
a:SetPos(150,5)
a:SetSize(80,20)
a.Paint=function()
btnble(a,"Cleanup","icon16/cross.png")
end
a.DoClick=function()
list2:Clear()
RunConsoleCommand("jsp_teamgroup_del")
c5={}
surface.PlaySound("garrysmod/ui_return.wav")
end
end

local function quatre()
if undpanel then undpanel:Remove() undpanel=nil end
undpanel=vgui.Create("DPanel",panel)
undpanel:SetPos(5,50)
undpanel:SetSize(panel:GetWide()-10,panel:GetTall()-55)
undpanel.Paint=function()
zradient(0,0,0,255,0,0,undpanel:GetWide()-1,undpanel:GetTall())zradient(zcolorbase.r/1.5,zcolorbase.g/1.5,zcolorbase.b/1.5,255,1,1,undpanel:GetWide()-3,undpanel:GetTall()-2)
end
local list2=vgui.Create("DListView",undpanel)
list2:SetPos(0,30)
list2:SetSize(undpanel:GetWide(),undpanel:GetTall()-30)
list2.Paint=function()
draw.RoundedBox(6,0,0,list2:GetWide()-1,list2:GetTall(),Color(0,0,0))
draw.RoundedBox(6,1,1,list2:GetWide()-3,list2:GetTall()-2,Color(zcolorbase.r+100,zcolorbase.g+100,zcolorbase.b+100,255))
end
list2:AddColumn("Job Category")
for k,v in pairs(c6) do
if v[2]==1 then
list2:AddLine(v[1],zzrugmpod18,zzrugmpod4,k)
else
list2:AddLine(v[1],zzrugmpod18,zzrugmpod5,k)
end
end
list2.OnRowRightClick=function(panel,id,line)
local z4=DermaMenu()
z4:AddOption("Delete",function()RunConsoleCommand("jsp_cat_del",line:GetColumnText(1))table.remove(c6,line:GetColumnText(4)) list2:RemoveLine(id)end):SetImage("icon16/cross.png")
z4pint(z4)
z4:Open()
end

local a=vgui.Create("DButton",undpanel)
a:SetText("")
a:SetPos(5,5)
a:SetSize(100,20)
a.Paint=function()
btnble(a,"Add".." Category","icon16/book.png")
end
a.DoClick=function()
surface.PlaySound("garrysmod/ui_return.wav")
local z4=DermaMenu()
local z1,z01=z4:AddSubMenu("List of category of jobs set in darkrp/gamemode/jobrelated.lua")z01:SetIcon("icon16/book.png")

local trij={}
PrintTable(RPExtraTeams)
for k,v in pairs(RPExtraTeams) do
local c=v.category
if !trij[c] then
trij[c]=true
local Nil=bil
for q,f in pairs(c6) do
if f[1]==c then
Nil=true
end
end
if Nil==nil then
z1:AddOption(c,function()
table.insert(c6,{c,zzrugmpod5})
list2:AddLine(c,zzrugmpod18,zzrugmpod5,#c6)
RunConsoleCommand("jsp_cat_add",c)
end):SetImage("icon16/add.png")
end
end
end
z4pint(z1)
z4pint(z4)
z4:Open()
end
local a=vgui.Create("DButton",undpanel)
a:SetText("")
a:SetPos(110,5)
a:SetSize(80,20)
a.Paint=function()
btnble(a,"Cleanup","icon16/cross.png")
end
a.DoClick=function()
list2:Clear()
RunConsoleCommand("jsp_cat_del")
c6={}
surface.PlaySound("garrysmod/ui_return.wav")
end
end
un()

local a=vgui.Create("DButton",iist)
a.val=1
a:SetText("")
a:SetSize(100,20)
a.Paint=function()
btnble(a,"Job List","icon16/book.png")
end
a.DoClick=function()
surface.PlaySound("garrysmod/ui_return.wav")
greenvalue=1
un()
end

local a=vgui.Create("DButton",iist)
a.val=3
a:SetText("")
a:SetSize(100,20)
a.Paint=function()
btnble(a,"U".."L".."X & ".."Ranks","icon16/coins.png")
end
a.DoClick=function()
surface.PlaySound("garrysmod/ui_return.wav")
greenvalue=3
deux()
end

local a=vgui.Create("DButton",iist)
a.val=2
a:SetText("")
a:SetSize(100,20)
a.Paint=function()
btnble(a,"Teamgroup","icon16/user.png")
end
a.DoClick=function()
surface.PlaySound("garrysmod/ui_return.wav")
greenvalue=2
trois()
end
local a=vgui.Create("DButton",iist)
a.val=4
a:SetText("")
a:SetSize(100,20)
a.Paint=function()
btnble(a,"Job Category","icon16/book.png")
end
a.DoClick=function()
surface.PlaySound("garrysmod/ui_return.wav")
greenvalue=4
quatre()
end

end)

local function wh()
if showlogo==1 then
for k,v in pairs(ents.FindByClass("job_spawn_point")) do
pos=v:GetPos()+Vector(0,0,10)
pos.z=pos.z
pos=pos:ToScreen()
draw.RoundedBox(0,0,0,0,0,Color(v:Getent_red(),v:Getent_green(),v:Getent_bleu(),255))
surface.SetMaterial(mat7)surface.DrawTexturedRect(pos.x-8,pos.y-8,16,16)
surface.SetMaterial(mat7)surface.DrawTexturedRect(pos.x-8,pos.y-8,16,16)
draw.SimpleText("Player Spawn : "..v:Getent_jnom(),"Trebuchet24",pos.x+14,pos.y-6,Color(v:Getent_red(),v:Getent_green(),v:Getent_bleu(),255),TEXT_ALIGN_LEFT,0)
end
end
end
hook.Add("HUDPaint","nordahl_jbspawnpointeye",wh)
