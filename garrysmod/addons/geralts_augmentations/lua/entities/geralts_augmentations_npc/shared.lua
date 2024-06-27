ENT.Base 			= "base_ai"
ENT.Type 			= "ai"

ENT.PrintName		= "NPC"
ENT.Author			= "Sofa Soldier"
ENT.Category		= "Geralt's Augmentations"

ENT.Spawnable 		= true
ENT.AdminOnly 		= true
ENT.RenderGroup 	= RENDERGROUP_TRANSLUCENT

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "NPC_ID" )	
end