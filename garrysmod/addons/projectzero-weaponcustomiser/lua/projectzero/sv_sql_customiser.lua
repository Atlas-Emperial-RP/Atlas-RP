PROJECT0.FUNC.SQLCreateTable( "projectzero_weapons", [[
	userID int,
	weaponClass varchar(50),
	skinID int,
	charmID int,
	stickerID int
]] )

PROJECT0.FUNC.SQLCreateTable( "projectzero_skins", [[
	userID int,
	skinID int,
	weaponClass varchar(50)
]] )

PROJECT0.FUNC.SQLCreateTable( "projectzero_cosmetics", [[
	userID int,
	type int,
	itemKey int
]] )

PROJECT0.FUNC.SQLCreateTable( "projectzero_purchases", [[
	steamID64 varchar(20),
	time int,
	storeKey int
]] )