/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

zclib.NetEvent.AddDefinition("machine_button01", {
	[1] = {
		type = "entity"
	},
}, function(received)
	zlt.Machine.PressButton(received[1], 1)
end)


zclib.NetEvent.AddDefinition("machine_button02", {
	[1] = {
		type = "entity"
	},
}, function(received)
	zlt.Machine.PressButton(received[1], 2)
end)
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680 */

                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */

zclib.NetEvent.AddDefinition("machine_button03", {
	[1] = {
		type = "entity"
	},
}, function(received)
	zlt.Machine.PressButton(received[1], 3)
end)


zclib.NetEvent.AddDefinition("machine_button04", {
	[1] = {
		type = "entity"
	},
}, function(received)
	zlt.Machine.PressButton(received[1], 4)
end)

                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680

zclib.NetEvent.AddDefinition("machine_door", {
	[1] = {
		type = "entity"
	},
}, function(received)
	zclib.Animation.Play(received[1], "door", 1)
end)
