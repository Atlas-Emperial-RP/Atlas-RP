/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

ITEM.Name = "Lottery Ticket"
ITEM.Description = "A lottery ticket."
ITEM.Model = "models/zerochain/props_lottery/ticket.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false
ITEM.DropStack = false
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */

function ITEM:GetName()
	local name = "Unkown"
	local TicketID = self:GetData("TicketID")
	local ListID = zlt.Ticket.GetID(TicketID)
	if ListID and zlt.config.Tickets[ListID] then
		name = zlt.config.Tickets[ListID].title_val
	end

	return self:GetData("Name", name)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680 */

// Only merge the same ingredient item ids
function ITEM:CanMerge( item )
	return false
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8 */

// Only pickup if the student owns this item, NO STEALING!
function ITEM:CanPickup(ply, ent)
	return zclib.Player.IsOwner(ply, ent)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */

// We save the uniqueid to be save should the ingredients config order or item count change
function ITEM:SaveData(ent)
	self:SetData("TicketID", ent:GetTicketID())
	self:SetData("PrizeID", ent:GetPrizeID())
end

// Get the list id using the uniqueid and set it in the entity
function ITEM:LoadData(ent)
	local ticketID = self:GetData("TicketID")
	local prizeID = self:GetData("PrizeID")
	if ticketID and prizeID and zlt.Ticket.DoesExist(ticketID,prizeID) then
		ent:SetTicketID(ticketID)
		ent:SetPrizeID(prizeID)
	else
		SafeRemoveEntity(ent)
	end
end

function ITEM:Drop(ply,con,slot,ent)
	if not IsValid(ent) then return end
	zclib.Player.SetOwner(ent, ply)
end


function ITEM:Use( pl )

	if SERVER then
		zlt.Ticket.InventoryUse(pl,self:GetData("TicketID"),self:GetData("PrizeID"))
	end

	return self:TakeOne()
end
