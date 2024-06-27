/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

if CLIENT then return end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273576

zclib.Hook.Add("zclib_PlayerJoined", "zlt_PlayerJoined", function(ply)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

    // Send main config
    zlt.Machine.SendConfig(ply)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

    // Send ticket config
    zlt.Ticket.SendConfig(ply)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */

    timer.Simple(3,function()
        // Send machine definitions for each entity
        for k,v in ipairs(ents.FindByClass("zlt_machine")) do
            if IsValid(v) then
                zlt.Machine.SendData(v,ply)
            end
        end
    end)
end)
