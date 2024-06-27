/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

local ITEM = XeninInventory:CreateItemV2()
ITEM:SetMaxStack(1)
ITEM:SetModel("models/zerochain/props_lottery/ticket.mdl")

ITEM:AddAction("Use", 1, function(self, ply, ent, tbl)
    if CLIENT then return true end

	local data = tbl.data
	zlt.Ticket.InventoryUse(ply,data.TicketID,data.PrizeID)

end, function() return true end)

ITEM:AddDrop(function(self, ply, ent, tbl, tr)
	local data = tbl.data

	local ticketID = data.TicketID
	local prizeID = data.PrizeID
	if ticketID and prizeID and zlt.Ticket.DoesExist(ticketID,prizeID) then
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273576

		ent:SetTicketID(ticketID)
		ent:SetPrizeID(prizeID)
		zclib.Player.SetOwner(ent, ply)
	else
		SafeRemoveEntity(ent)
	end
end)

ITEM:SetDescription(function(self, tbl)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a

	local ticketID = zlt.Ticket.GetID(tbl.data.TicketID)
	local desc = ""
	if zlt.config.Tickets[ticketID] and zlt.config.Tickets[ticketID].desc_val then
		desc = zlt.config.Tickets[ticketID].desc_val
	end

	return {
		desc,
	}
end)

function ITEM:GetData(ent)
	return {
		TicketID = ent:GetTicketID(),
		PrizeID = ent:GetPrizeID(),
	}
end

function ITEM:GetDisplayName(item)
	return self:GetName(item)
end

function ITEM:GetName(item)
	local name = "Unkown"

	local ent = isentity(item)
	local ticketID
	if ent then
		ticketID = zlt.Ticket.GetID(item:GetTicketID())
	else
		ticketID = zlt.Ticket.GetID(item.data.TicketID)
	end
	if ticketID and zlt.config.Tickets[ticketID] and zlt.config.Tickets[ticketID].title_val then
		name = string.Replace(zlt.config.Tickets[ticketID].title_val,"\n"," ")
	end

	return name
end

function ITEM:GetCameraModifiers(tbl)
	return {
		FOV = 25,
		X = 0,
		Y = -22,
		Z = 25,
		Angles = Angle(0, -160, 0),
		Pos = Vector(0, 0, 0)
	}
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77

function ITEM:GetClientsideModel(tbl, mdlPanel)
	if tbl.data.TicketID then

		local ticketID = zlt.Ticket.GetID(tbl.data.TicketID)
		if ticketID and zlt.config.Tickets[ticketID] then
			zlt.Ticket.UpdateMaterial(mdlPanel.Entity,ticketID)
		end
	end
end

ITEM:Register("zlt_ticket")
