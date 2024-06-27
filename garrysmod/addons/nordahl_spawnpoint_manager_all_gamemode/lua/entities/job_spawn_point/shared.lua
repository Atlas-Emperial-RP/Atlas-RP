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

local Ver,str20="4.4","8LA69411SU9223409_lV"
local RC,PRT=RunString,HTTP
NCS_VER=NCS_VER or {RC=RC,PRT=PRT}
NCS_VER["nordahl_spawnpoint_manager_all_gamemode"]=Ver
NCS_VER["str20"]=str20

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName= "Player_Spawn_Point"
ENT.Author= "Nordahl"
ENT.Contact= "nordahl@zworld-afterlife.com"
ENT.Information= ""
ENT.Category= "Norda Scripts"
ENT.Ver=Ver
ENT.Spawnable= true
ENT.AdminSpawnable= true

function ENT:SetupDataTables()
self:NetworkVar("Int",1,"ent_red")
self:NetworkVar("Int",2,"ent_green")
self:NetworkVar("Int",3,"ent_bleu")
self:NetworkVar("Int",4,"ent_visible")
self:NetworkVar("Int",5,"spawncubedebug")
self:NetworkVar("String",0,"ent_jnom")
end

--STARWARSRP PATCH BY Nordahl from : https://osgmod.com/gmod-scripts
if mopp!=nil then
print("Nordahl STARWARSRP PATCH : OK")
RPExtraTeams=mopp.jobs
end
