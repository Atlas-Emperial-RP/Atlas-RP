ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.AuthorName = ""
ENT.Category = "[NCS] Datapad"
ENT.Spawnable = false
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Editable = true

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 1, "IsHacking")
	self:NetworkVar("Int", 1, "HackTimeRemaining")
	self:NetworkVar("Entity", 1, "Hacker")

    self:NetworkVar( "String", 1, "HackConsoleModel", {
        KeyName = "HackConsoleModel",
        Edit = {
            type = "String",
        }
    })

	self:NetworkVar( "Int", 2, "HackConsoleTiming", {
        KeyName = "HackConsoleTiming",
        Edit = {
            type = "Int",
			max = 3000,
        }
    })

   	if SERVER then
		self:NetworkVarNotify( "HackConsoleModel", function(name, old, new)
			self:SetModel(new)
		end)
	end
end