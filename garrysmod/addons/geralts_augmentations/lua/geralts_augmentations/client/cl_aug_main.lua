local get_skin = CYBERNETIC_AUGMENTATIONS.Skins[CYBERNETIC_AUGMENTATIONS.Skin]
local fonts = get_skin.Fonts
local colors = get_skin.Colors
local language = CYBERNETIC_AUGMENTATIONS.Languages[CYBERNETIC_AUGMENTATIONS.CurrentLanguage]
local head_implants = CYBERNETIC_AUGMENTATIONS.Items[6]

CYBERNETIC_AUGMENTATIONS.EyeMaterials = CYBERNETIC_AUGMENTATIONS.EyeMaterials or {}
local eye_materials = CYBERNETIC_AUGMENTATIONS.EyeMaterials
local default_hotkeys = CYBERNETIC_AUGMENTATIONS.DefaultHotkeys

local cvars_to_commands = {}

for abil, key in next, default_hotkeys do
	abil = string.lower(abil)
	
	local cvar = "cyber_augs_key_"..abil
	CreateClientConVar(cvar, key, true, false)
	
	cvars_to_commands[cvar] = "cyber_augs_command_"..abil
end

surface.CreateFont( "CYBER_AUGS_TitleFont", {
	font = fonts.Title, 
	extended = true,
	size = ScreenScale(25),
	weight = 100,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_AugInfo", {
	font = fonts.Title, 
	extended = true,
	size = ScreenScale(12),
	weight = 100,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_ItemFont", {
	font = fonts.Title, 
	extended = true,
	size = ScreenScale(7),
	weight = 100,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_DescFont", {
	font = fonts.Main, 
	extended = true,
	size = ScreenScale(8),
	weight = 500,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_NotifyFont", {
	font = fonts.Main, 
	extended = true,
	size = ScreenScale(10),
	weight = 500,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_BoldDescFont", {
	font = fonts.Bold, 
	extended = true,
	size = ScreenScale(8),
	weight = 500,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_BoldBigFont", {
	font = fonts.Bold, 
	extended = true,
	size = ScreenScale(12),
	weight = 500,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_ButtonFont", {
	font = fonts.Bold, 
	extended = true,
	size = ScreenScale(9),
	weight = 100,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_DialogFont", {
	font = fonts.Bold, 
	extended = true,
	size = ScreenScale(9),
	weight = 100,
	antialias = true,
} )

surface.CreateFont( "CYBER_AUGS_DialogFont_Blur", {
	font = fonts.Bold, 
	extended = true,
	size = ScreenScale(9),
	weight = 100,
	antialias = true,
	blursize = 5,
} )

surface.CreateFont( "CYBER_AUGS_NPCFont", {
	font = fonts.Bold, 
	extended = true,
	size = 75,
	weight = 100,
	antialias = true,
} )

function CYBERNETIC_AUGMENTATIONS.BuyAug_CL(npc, slot, aug_id, clr, mat_id)
	local aug = CYBERNETIC_AUGMENTATIONS.Items[slot][aug_id]
	
	if not aug or not IsValid(npc) then return end
	
	local ply = CYBER_AUGS_LOCALPLAYER
	
	if not CYBERNETIC_AUGMENTATIONS.CanBuyAug(ply, aug) then return end

	clr = Color(clr.r, clr.g, clr.b)

	net.Start("CYBER_AUGS_BuyAug")
		net.WriteEntity(npc)
		net.WriteUInt(slot, 3)
		net.WriteUInt(aug_id, 10)
		net.WriteUInt(0, 4)
		net.WriteColor(clr)
		net.WriteUInt(mat_id or 0, 6)
	net.SendToServer()
end

local function OpenAugShop(npc)
	if IsValid(CYBER_AUGS_CLINIC_MENU) or not IsValid(npc) or npc:GetPos():DistToSqr(CYBER_AUGS_LOCALPLAYER:GetPos()) > 150 * 150 then return end
	
	local wide, tall = ScrW(), ScrH()
	
	local frame = vgui.Create("Panel")
	frame:SetSize(wide, tall)
	frame:MakePopup()
	frame.Paint = get_skin.ClinicPaint
	frame.OnKeyCodeReleased = function(self, key)
		if key == KEY_TAB then
			self:Remove()
		end
	end
	frame.npc = npc
	
	CYBER_AUGS_CLINIC_MENU = frame
	
	get_skin.ClinicMain(frame, wide, tall)
	get_skin.CloseButton(frame, wide, tall)
end

local function OpenPaintMenu(npc)
	if IsValid(CYBER_AUGS_PAINT_MENU) or not IsValid(npc) or npc:GetPos():DistToSqr(CYBER_AUGS_LOCALPLAYER:GetPos()) > 150 * 150 then return end
	
	local wide, tall = ScrW(), ScrH()
	
	local frame = vgui.Create("Panel")
	frame:SetSize(wide, tall)
	frame:MakePopup()
	frame.Paint = get_skin.PaintMenu
	frame.OnKeyCodeReleased = function(self, key)
		if key == KEY_TAB then
			self:Remove()
		end
	end
	frame.npc = npc
	
	CYBER_AUGS_PAINT_MENU = frame
	
	get_skin.PaintMenuElements(frame, wide, tall)
	get_skin.CloseButton(frame, wide, tall)
end

local dialog_options = {
	[1] = {
		[1] = OpenAugShop,
		[2] = OpenPaintMenu,
		[3] = function()
			CYBER_AUGS_DIALOG:Remove()
		end,
	},
}

net.Receive("CYBER_AUGS_NPCMenu", function()
	local ent = net.ReadEntity()
	local wide, tall = ScrW(), ScrH()
	
	get_skin.Dialog(wide, tall, ent, dialog_options, 1)
end )

concommand.Add("cyber_augs_command_infokey", function()
	local wide, tall = ScrW(), ScrH()
	
	get_skin.InfoMain(wide, tall)
end )

local delay = 0

local function bindings_func(ply, mv)
	if gui.IsGameUIVisible() then return end 
	if vgui.CursorVisible() then return end 
	if ply:IsTyping() then return end 
	
	local ct = CurTime()
	
	if ct < delay then return end 
	for k, v in next, cvars_to_commands do
		local get = GetConVar(k):GetInt()
		if input.WasKeyPressed(get) then
            delay = ct + 0.5
            
			CYBER_AUGS_LOCALPLAYER:ConCommand(v)
		end 
	end 
end

hook.Add("Move", "CYBER_AUGS_Bindings", function(ply, mv)
	bindings_func(ply, mv)
end )

if CYBERNETIC_AUGMENTATIONS.AllowAbilitiesInVehicle then
	hook.Add("VehicleMove", "CYBER_AUGS_Bindings", function(ply, mv)
		if not CYBERNETIC_AUGMENTATIONS.AllowAbilitiesInVehicle then hook.Remove("VehicleMove", "CYBER_AUGS_Bindings") return end -- make sure that hook is removed in case if config changed
		bindings_func(ply, mv)
	end )
end

net.Receive("CYBER_AUGS_SyncAugs", function()
	local len = net.ReadUInt(12)
	local data = net.ReadData(len)
	
	data = util.Decompress(data)
	
	data = util.JSONToTable(data)
	
	if not data then data = {} end
	
	CYBERNETIC_AUGMENTATIONS_DATA = data
end )

net.Receive("CYBER_AUGS_SyncAug", function()
	local slot = net.ReadUInt(3)
	CYBERNETIC_AUGMENTATIONS_DATA[slot] = net.ReadTable()
end )

net.Receive("CYBER_AUGS_SyncAugDeleted", function()
	local slot = net.ReadUInt(3)
	CYBERNETIC_AUGMENTATIONS_DATA[slot] = nil
end )

hook.Add("NetworkEntityCreated", "CYBER_AUGS_Players", function(ent)
	if !ent:IsPlayer() then return end 
	
	CYBERNETIC_AUGMENTATIONS_PLAYERS[ent] = true
end )

hook.Add("EntityRemoved", "CYBER_AUGS_Players", function(ent)
	if !ent:IsPlayer() then return end 
	
	CYBERNETIC_AUGMENTATIONS_PLAYERS[ent] = nil
end )

hook.Add("InitPostEntity", "CYBER_AUGS_InitPostEntity_cl", function()
	CYBER_AUGS_LOCALPLAYER = LocalPlayer() -- small optimization
end)