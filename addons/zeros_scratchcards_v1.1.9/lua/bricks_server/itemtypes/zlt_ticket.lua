/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

local ITEM = BRICKS_SERVER.Func.CreateItemType( "zlt_ticket" )
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

ITEM.GetItemData = function(ent)
    if (not IsValid(ent)) then return end
    local itemData = {"zlt_ticket", "models/zerochain/props_lottery/ticket.mdl", ent:GetTicketID(), ent:GetPrizeID()}
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273576 */

    return itemData, 1
end

ITEM.OnSpawn = function( ply, pos, itemData, itemAmount )
    local ticketID = itemData[3]
    local prizeID = itemData[4]
    if ticketID and prizeID and zlt.Ticket.DoesExist(ticketID,prizeID) then
        local ent = ents.Create("zlt_ticket")
        if not IsValid(ent) then return end
        ent:SetPos(pos)
        ent:Spawn()
        ent:Activate()

        ent:SetTicketID(ticketID)
        ent:SetPrizeID(prizeID)
        zclib.Player.SetOwner(ent, ply)
    end
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

ITEM.CanUse = function( ply, itemData )
    return true
end

ITEM.OnUse = function( ply, itemData )
    local ticketID = itemData[3]
    local prizeID = itemData[4]
    if ticketID and prizeID and zlt.Ticket.DoesExist(ticketID,prizeID) then
        zlt.Ticket.InventoryUse(ply,ticketID,prizeID)
    end
    return true
end

ITEM.GetInfo = function( itemData )
    local ticketID = zlt.Ticket.GetID(itemData[3])
    local itemDescription = ""
    local itemtitle = ""
    if zlt.config.Tickets[ticketID] then
        if zlt.config.Tickets[ticketID].title_val then
            itemtitle = zlt.config.Tickets[ticketID].title_val
        end
        if zlt.config.Tickets[ticketID].desc_val then
            itemDescription = zlt.config.Tickets[ticketID].desc_val
        end
    end

    return { itemtitle, itemDescription, "" }
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273576

ITEM.ModelDisplay = function( Panel, itemtable )
    if ( not Panel.Entity or not IsValid( Panel.Entity ) ) then return end

    local mn, mx = Panel.Entity:GetRenderBounds()
    local size = 0
    size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
    size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
    size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )

    Panel:SetFOV( 45 )
    Panel:SetCamPos( Vector( size, size, size * 0.4 ) )
    Panel:SetLookAt( (mn + mx) * 0.5 )
    Panel.Entity:SetAngles(Angle(0,210,0))

    local ticketID = zlt.Ticket.GetID(itemtable[3])
    if ticketID and zlt.config.Tickets[ticketID] then
        zlt.Ticket.UpdateMaterial(Panel.Entity,ticketID)
    end
end

ITEM.CanCombine = function( itemData1, itemData2 )
    return false
end

ITEM:Register()

if BRICKS_SERVER and BRICKS_SERVER.CONFIG and BRICKS_SERVER.CONFIG.INVENTORY and BRICKS_SERVER.CONFIG.INVENTORY.Whitelist then
    BRICKS_SERVER.CONFIG.INVENTORY.Whitelist["zlt_ticket"] = {false,true}
end
