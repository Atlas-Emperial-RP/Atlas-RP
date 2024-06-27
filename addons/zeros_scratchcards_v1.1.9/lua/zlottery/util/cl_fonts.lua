/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

if SERVER then return end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */

zlt = zlt or {}
zlt.Font = zlt.Font or {}

function zlt.Font.Rebuild()
	for k, v in pairs(zlt.config.Fonts) do
		zclib.FontData["zlt_ticket_title0" .. k] = {
			font = v,
			extended = true,
			size = ScreenScale(17),
			weight = ScreenScale(500),
			antialias = true
		}

		zclib.FontData["zlt_ticket_title0" .. k .. "_big"] = {
			font = v,
			extended = true,
			size = ScreenScale(60),
			weight = ScreenScale(500),
			antialias = true
		}
	end
end
zlt.Font.Rebuild()

zclib.FontData["zlt_ticket_price"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(50),
	weight = ScreenScale(100),
	antialias = true
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 73328797a3461379a11a407533711e318b63a7474a0d30aefc9660369a502b5a */

zclib.FontData["zlt_ticket_desc"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(26),
	weight = ScreenScale(100),
	antialias = true
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

zclib.FontData["zlt_ticket_desc_small"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(15),
	weight = ScreenScale(100),
	antialias = true
}

zclib.FontData["zlt_ticket_desc_tiny"] = {
	font = "Nexa Bold",
	extended = true,
	size = ScreenScale(10),
	weight = ScreenScale(100),
	antialias = true
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585
