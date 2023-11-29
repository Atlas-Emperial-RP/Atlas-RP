--[[---------------------------------------------------------------------------
Group chats
---------------------------------------------------------------------------
Team chat for when you have a certain job.
e.g. with the default police group chat, police officers, chiefs and mayors can
talk to one another through /g or team chat.

HOW TO MAKE A GROUP CHAT:
Simple method:
GAMEMODE:AddGroupChat(List of team variables separated by comma)

Advanced method:
GAMEMODE:AddGroupChat(a function with ply as argument that returns whether a random player is in one chat group)
This is for people who know how to script Lua.

---------------------------------------------------------------------------]]
-- Example: GAMEMODE:AddGroupChat(TEAM_MOB, TEAM_GANG)
-- Example: GAMEMODE:AddGroupChat(function(ply) return ply:isCP() end)

GAMEMODE:AddGroupChat(TEAM_ISB)
GAMEMODE:AddGroupChat(TEAM_STORMTROOPERS)
GAMEMODE:AddGroupChat(TEAM_PURGE)
GAMEMODE:AddGroupChat(TEAM_SHOCK)
GAMEMODE:AddGroupChat(TEAM_NAVAL)
GAMEMODE:AddGroupChat(TEAM_SHORE)
GAMEMODE:AddGroupChat(TEAM_MEDICAL)
GAMEMODE:AddGroupChat(TEAM_FLEET)
GAMEMODE:AddGroupChat(TEAM_INQUSITOR)
GAMEMODE:AddGroupChat(TEAM_IMPERIALCOMMANDO)
GAMEMODE:AddGroupChat(TEAM_CHIMAERA)
GAMEMODE:AddGroupChat(TEAM_IMPERIALARMY)
GAMEMODE:AddGroupChat(TEAM_NOVA)
GAMEMODE:AddGroupChat(TEAM_SHADOW)
GAMEMODE:AddGroupChat(TEAM_DEATHTROOPER)
GAMEMODE:AddGroupChat(TEAM_ARC)
GAMEMODE:AddGroupChat(TEAM_SECRETSECTOR)
GAMEMODE:AddGroupChat(TEAM_INFERNO)
GAMEMODE:AddGroupChat(TEAM_HUTT)