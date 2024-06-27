/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Model = "models/zerochain/props_lottery/ticket.mdl"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.PrintName = "Ticket"
ENT.Category = "Zeros Scratchcards"
ENT.RenderGroup = RENDERGROUP_OPAQUE
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273576 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

function ENT:SetupDataTables()
    self:NetworkVar("String", 1, "TicketID")
    self:NetworkVar("Int", 2, "PrizeID")
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

    if (SERVER) then
        self:SetTicketID(1)
        self:SetPrizeID(1)
    end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

function ENT:CanProperty(ply)
    return ply:IsSuperAdmin()
end

function ENT:CanTool(ply, tab, str)
    return ply:IsSuperAdmin()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */

function ENT:CanDrive(ply)
    return ply:IsSuperAdmin()
end
