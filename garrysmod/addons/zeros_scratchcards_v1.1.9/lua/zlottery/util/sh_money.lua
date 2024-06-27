/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

zlt = zlt or {}
zlt.Money = zlt.Money or {}

if SERVER then
    function zlt.Money.Give(ply, amount)
        local result = zlt.config.MoneyOverwrite.give(ply, amount)

        if result == nil then
            zclib.Money.Give(ply, amount)
        end
    end

    function zlt.Money.Take(ply, amount)
        local result = zlt.config.MoneyOverwrite.take(ply, amount)

        if result == nil then
            zclib.Money.Take(ply, amount)
        end
    end
end

function zlt.Money.Has(ply, amount)
    local result = zlt.config.MoneyOverwrite.has(ply, amount)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273576

    if result == nil then
        result = zclib.Money.Has(ply, amount)
    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273576
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a

    return result
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a */
