ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Electrocardiogram"
ENT.Category = "Medic Mod"
ENT.Author = "Venatuss"
ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "Patient")
end
