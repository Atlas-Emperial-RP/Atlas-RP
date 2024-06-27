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

NordJSP={}
NordJSP.DISABLE_setspawn="1" --Setspawn of Darkrp is Glitched you can disable it if your is broke.
---CONFIGURATION---
JSP_CONFIG={}
JSP_CONFIG.OwnerSteamID="STEAM_0:0:000000" --If you are the owner and you dont use Admin System put your Steam ID here. Value exemple: ---> "STEAM_0:0:000000"
JSP_CONFIG.Allow_Admin=0 --Admin access (1 Enable / 0 Disable)
JSP_CONFIG.Allow_SUPER_Admin=1 --Admin access (1 Enable / 0 Disable)

JSP_CONFIG.Allow_ULX_GROUP_CAN_ACCESS_PANEL={"superadmin"} --Add ULX Admin Group if you want add "admin" ULX rank and another {"superadmin","admin","anothergroup"}
JSP_CONFIG.SERVERGUARD_Access_rank={"superadmin","admin"} --Add ServerGuard Admin Group if you want add "admin" {"superadmin","admin","anothergroup"} if you dont have Server Guard installed keep it empty.
JSP_CONFIG.SAM_Access_rank={"superadmin","admin"}

JSP_CONFIG.USeWorkshopContent=1 --If you dont have a fastdownload you can use workshop content (1 Enable "I want use workshop" / 0 Disable "I prefer use my fastdl")
JSP_CONFIG.entvisible=1 --1 by default, 0= The 3D model is automatically hidden.
------
JSP_CONFIG.Job_CATEGORIES={}
--Group the jobs by categories soem exemple:
JSP_CONFIG.Job_CATEGORIES["Group_Name"]={"citizenx","mayorx"}
JSP_CONFIG.Job_CATEGORIES["Group1"]={"citizenx","mayorx"}
JSP_CONFIG.Job_CATEGORIES["Group2"]={"job_name_1","job_name_2","job_name_3"}

nordahl_cfg_1966=NordJSP
