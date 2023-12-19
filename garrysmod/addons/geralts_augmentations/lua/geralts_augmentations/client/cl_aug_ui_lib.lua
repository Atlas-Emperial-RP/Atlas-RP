
local blur = Material("pp/blurscreen")
local glitch_duration = 0
local skin = CYBERNETIC_AUGMENTATIONS.Skins[CYBERNETIC_AUGMENTATIONS.Skin]
local colors = skin.Colors
local hide_bones = CYBERNETIC_AUGMENTATIONS.HideBones
local Items = CYBERNETIC_AUGMENTATIONS.Items
local UISounds = CYBERNETIC_AUGMENTATIONS.UISounds

CYBERNETIC_AUGMENTATIONS.GlitchAnimation = function(time)
	glitch_duration = CurTime() + time
end

local set_seed, get_seed, get_random_32;

do
	local secret_key_6  = 58;
	local secret_key_7  = 110;
	local secret_key_44 = 3580861008710;

	local floor = math.floor;

	local function primitive_root_257(idx)
		local g, m, d = 1, 128, 2 * idx + 1;
		repeat
			g, m, d = g * g * (d >= m and 3 or 1) % 257, m / 2, d % m;
		until m < 1;
		return g;
	end

	local param_mul_8 = primitive_root_257(secret_key_7);
	local param_mul_45 = secret_key_6 * 4 + 1;
	local param_add_45 = secret_key_44 * 2 + 1;

	local state_45 = 0;
	local state_8 = 2;

	function set_seed(seed_53)
		state_45 = seed_53 % 35184372088832;
		state_8 = floor(seed_53 / 35184372088832) % 255 + 2;
	end

	function get_seed()
		return (state_8 - 2) * 35184372088832 + state_45;
	end

	function get_random_32()
		state_45 = (state_45 * param_mul_45 + param_add_45) % 35184372088832;
		repeat
			state_8 = state_8 * param_mul_8 % 257;
		until state_8 ~= 1;
		local r = state_8 % 32;
		local n = floor(state_45 / 2^(13 - (state_8 - r) / 32)) % 2^32 / 2^r;
		return floor(n % 1 * 2^32) + floor(n);
	end
end

local EFFECT_TEXTURE_MAT = CreateMaterial("cyber_augs_glitch_effect", "UnlitGeneric", {
	["$basetexture"] = "_rt_fullframefb",
	["$vertexcolor"] = 1,
	["$additive"]    = 1
})

local OFFSET = 20

local function draw_glitch_pass(seed, offset_seed, element_count)
	render.UpdateScreenEffectTexture();
	local scrw, scrh = ScrW(), ScrH();
	surface.SetMaterial(EFFECT_TEXTURE_MAT)
	local last_seed = seed
	local last_seed2 = offset_seed
	for _ = 1, element_count do
		set_seed(last_seed);
		local element_width   = (get_random_32() % 64) + 128;
		local element_height  = (get_random_32() % 8) + 16;
		local element_x       = get_random_32() % (scrw + element_width * 2) - element_width;
		local element_y       = get_random_32() % (scrh + element_height * 2) - element_height;
		local random_offset_x = (get_random_32() % 32) - 16;
		local random_offset_y = (get_random_32() % 32) - 16;
		last_seed = get_seed();
		set_seed(last_seed2);
		local r = get_random_32() % 20;
		surface.SetDrawColor(r, r, r)
		surface.DrawRect(
			element_x + random_offset_x,
			element_y + random_offset_y,
			element_width,
			element_height
		);
		surface.SetDrawColor(255, 0, 0);
		surface.DrawTexturedRectUV(
			element_x + random_offset_x,
			element_y + random_offset_y,
			element_width,
			element_height,
			(element_x - ((get_random_32() % OFFSET) - OFFSET / 2)) / scrw,
			(element_y - ((get_random_32() % OFFSET) - OFFSET / 2)) / scrh,
			(element_x + element_width - ((get_random_32() % OFFSET) - OFFSET / 2)) / scrw,
			(element_y + element_height - ((get_random_32() % OFFSET) - OFFSET / 2)) / scrh
		);
		surface.SetDrawColor(0, 255, 0);
		surface.DrawTexturedRectUV(
			element_x + random_offset_x,
			element_y + random_offset_y,
			element_width,
			element_height,
			element_x / scrw,
			element_y / scrh,
			(element_x + element_width) / scrw,
			(element_y + element_height) / scrh
		);
		surface.SetDrawColor(0, 0, 255);
		surface.DrawTexturedRectUV(
			element_x + random_offset_x,
			element_y + random_offset_y,
			element_width,
			element_height,
			(element_x + ((get_random_32() % OFFSET) - OFFSET / 2)) / scrw,
			(element_y + ((get_random_32() % OFFSET) - OFFSET / 2)) / scrh,
			(element_x + element_width + ((get_random_32() % OFFSET) - OFFSET / 2)) / scrw,
			(element_y + element_height + ((get_random_32() % OFFSET) - OFFSET / 2)) / scrh
		);
		last_seed2 = get_seed();
	end
end

local next_update = 0
local next_update2 = 0
local SEED_1 = math.random(0, 0x123456789ABCDE);
local SEED_2 = math.random(0, 0x123456789ABCDE);
local SEED_3 = math.random(0, 0x123456789ABCDE);
local SEED_4 = math.random(0, 0x123456789ABCDE);

hook.Add("PostRenderVGUI", "AUGS_GlitchEffect", function()
	if glitch_duration < CurTime() then return end

	set_seed(SEED_1);
	local time = SysTime();
	local seed1 = get_random_32();
	local seed2 = get_random_32();
	local seed3 = get_random_32();
	local seed4 = get_random_32();
	draw_glitch_pass(seed1, SEED_3, 256);
	draw_glitch_pass(seed2, SEED_4, 128);
	-- draw_glitch_pass(seed3, SEED_4, 64);
	-- draw_glitch_pass(seed4, SEED_4, 64);
	if next_update < time then
		next_update = time + math.random();
		SEED_1 = math.random(0, 0x123456789ABCDE);
		SEED_2 = math.random(0, 0x123456789ABCDE);
	end
	if next_update2 < time then
		next_update2 = time + 0.1;
		SEED_3 = math.random(0, 0x123456789ABCDE);
		SEED_4 = math.random(0, 0x123456789ABCDE);
	end
end)

function CYBERNETIC_AUGMENTATIONS.MakeProgressBar(time, can_deny, func, should_hold, text, deny_func)
	if IsValid(CYBER_AUGS_ProgressPanel) then CYBER_AUGS_ProgressPanel.Deny() end
	
	local clr = colors.MainBG
	local text_clr = colors.LightText

	CYBER_AUGS_ProgressPanel = vgui.Create("Panel")
	CYBER_AUGS_ProgressPanel:SetSize(ScrW(), ScrH())
	CYBER_AUGS_ProgressPanel.startTime = SysTime()
	if !should_hold then CYBER_AUGS_ProgressPanel:MakePopup() end 
	CYBER_AUGS_ProgressPanel:SetDrawOnTop(true)
	CYBER_AUGS_ProgressPanel.Paint = function(self, w, h)
		if !timer.Exists("CYBER_AUGS_Progress") then self:Remove() end 
		Derma_DrawBackgroundBlur(self, self.startTime)
		local frac = timer.TimeLeft("CYBER_AUGS_Progress")  / time

		local bar_w = w * 0.35
		surface.SetDrawColor(clr)
		surface.DrawOutlinedRect(w * 0.325, h * 0.5 - 6, bar_w, 12)
		surface.DrawRect(w * 0.325 + 2, h * 0.5 - 4, ((bar_w - bar_w * frac) - 4), 8)
		
		if text then draw.SimpleText(text, "CYBER_AUGS_BoldDescFont", w * 0.5, h * 0.5 - 10, text_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM) end 
		
		if should_hold then 
			draw.SimpleText(CYBER_AUGS_LANGUAGE.HoldE, "CYBER_AUGS_DescFont", w * 0.5, h * 0.5 + 10, text_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP) 
			if !input.IsKeyDown(KEY_E) then self.Deny() end return 
		end
		if can_deny then 
			draw.SimpleText(CYBER_AUGS_LANGUAGE.TabToCancel, "CYBER_AUGS_DescFont", w * 0.5, h * 0.5 + 10, text_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP) 
		end 
	end 
	CYBER_AUGS_ProgressPanel.Deny = function()
		if IsValid(CYBER_AUGS_ProgressPanel) then CYBER_AUGS_ProgressPanel:Remove() end 	
		if timer.Exists("CYBER_AUGS_Progress") then timer.Destroy("CYBER_AUGS_Progress") end
		if deny_func then deny_func() end
	end 
	CYBER_AUGS_ProgressPanel.OnKeyCodeReleased = function(self, key)
		if !can_deny then return end 
		if key == KEY_TAB then 
			self.Deny()
		end 
	end 
	timer.Create("CYBER_AUGS_Progress", time, 1, function()
		CYBER_AUGS_ProgressPanel.Deny()
		if func then func() end 
	end )	
	return CYBER_AUGS_ProgressPanel
end 

function CYBERNETIC_AUGMENTATIONS.Query( strText, strTitle, ... )
	
	local Window = vgui.Create( "Panel" )
	Window:SetDrawOnTop( true )
	Window.startTime = SysTime()
	Window.Paint = function(self, w, h)
		Derma_DrawBackgroundBlur(self, self.startTime)

		surface.SetDrawColor(0,0,0,150)
		surface.DrawRect(0, 0, w, h)
		
		surface.SetDrawColor(colors.MainBG)
		surface.DrawRect(0, 0, 4, h)
		surface.DrawRect(w - 4, 0, 4, h)
		draw.SimpleText(strTitle, "CYBER_AUGS_BoldDescFont", w * 0.5, h * 0.1, colors.LightText, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		
		draw.DrawText(strText, "CYBER_AUGS_DescFont", w * 0.5, h * 0.25, color_white, TEXT_ALIGN_CENTER)
	end 

	local ButtonPanel = vgui.Create( "Panel", Window )
	ButtonPanel:SetTall( ScrH() * 0.07  )

	-- Loop through all the options and create buttons for them.
	local NumOptions = 0
	local x = 5

	for k=1, 8, 2 do

		local Text = select( k, ... )
		if Text == nil then break end

		local Func = select( k+1, ... ) or function() end

		local Button = vgui.Create( "Cyber_Button", ButtonPanel )
		Button:SetFont("CYBER_AUGS_BoldBigFont")
		Button:SetText( Text )
		Button:SizeToContents()
		Button:SetTall(  ScreenScale(12) + 20 )
		Button:SetWide( Button:GetWide() + 40 )
		Button:SetButtonStyle(4, colors.MainBG, colors.TextColor, colors.ButtonHover, colors.TextColor)
		Button.DoClick = function() Window:Remove() Func() surface.PlaySound(UISounds.Click2) end
		Button:SetPos( x, 5 )

		x = x + Button:GetWide() + 5

		ButtonPanel:SetWide( x )
		NumOptions = NumOptions + 1

	end
	surface.SetFont("CYBER_AUGS_BoldBigFont")
	local w, h = surface.GetTextSize(strText)

	w = math.max( w, ButtonPanel:GetWide() )

	Window:SetSize( w + 50, ScrH() * 0.15 + h)
	Window:Center()

	ButtonPanel:CenterHorizontal()
	ButtonPanel:AlignBottom( 8 )

	Window:MakePopup()
	Window:DoModal()

	return Window

end

function CYBERNETIC_AUGMENTATIONS.DrawBlur(amount, x, y, w, h, alpha)
	local scrw, scrh = ScrW(), ScrH()
	local blur_enabled = CYBERNETIC_AUGMENTATIONS.EnableBlur
	if blur_enabled == 0 then surface.SetDrawColor(ColorAlpha(color_black, 220)) surface.DrawRect(0, 0, scrw, scrh) return end 
	if !x then x = 0 end 
	if !y then y = 0 end 
	if !w then w = ScrW() end 
	if !h then h = ScrH() end 
	
	surface.SetDrawColor(0, 0, 0, alpha or 255)
	surface.SetMaterial(blur)
	for i = 1, 5 do
		blur:SetFloat('$blur', (i / 5) * (amount or 5))
		render.UpdateScreenEffectTexture()

        render.SetScissorRect(x, y, x+w, y+h, true)
            surface.DrawTexturedRect((x or 0) * -1, (y or 0) * -1, scrw, scrh)
        render.SetScissorRect(0, 0, 0, 0, false)
	end

	if !rec then 	
		blur:Recompute()
		rec = true 
	end 
end

function CYBERNETIC_AUGMENTATIONS.TextAnimation(panel, txt, speed)
	if !panel.StartTextAnim then panel.StartTextAnim = 0 end 
	
	local start_anim = panel.StartTextAnim
	local txt_anim
	if start_anim < #txt then panel.StartTextAnim = start_anim + (speed or 0.5)
		txt_anim = string.Left(txt, 0 + start_anim)	
	else 
		txt_anim = txt
	end

	return txt_anim
end

local CYBER_BUTTON = {}

function CYBER_BUTTON:Init()
	self.ButtonStyle = 1
	self.Colors = {
		BG = Color(0,0,0,200),
		Text = Color(220, 220, 220),
		BGHover = Color(0,0,0,200),
		TextHover = Color(211, 32, 72),
		TextDown = Color(225, 45, 100)
	}
	self:SetContentAlignment( 5 )

	--
	-- These are Lua side commands
	-- Defined above using AccessorFunc
	--
	self:SetDrawBorder( true )
	self:SetPaintBackground( true )

	self:SetTall( 22 )
	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( true )

	self:SetCursor( "hand" )
	self:SetFont( "DermaDefault" )
end

local polys = {
	[3] = function(w, h)
		local a = h * 0.35
		if a > 15 then a = 15 end 
		local poly = {
			{ x = 0, y = 0 },
			{ x = w - a, y = 0 },
			{ x = w, y = a },
			{ x = w, y = h },
			{ x = a, y = h },
			{ x = 0, y = h - a},		
		}		
		return poly
	end,
	[4] = function(w, h)
		local a = h * 0.35
		if a > 25 then a = 25 end 
		local poly = {
			{ x = a, y = 0 },
			{ x = w, y = 0 },
			{ x = w - a, y = h },
			{ x = 0, y = h },
		}	
		return poly	
	end,
	[5] = function(w, h)
		local a = h * 0.25
		if a > 15 then a = 15 end
		
		local poly = {
			{x = 0, y = 0},
			{x = w, y = 0},
			{x = w, y = h - a},
			{x = w - a, y = h},
			{x = 0, y = h},
		}	
		return poly
	end,	
	[6] = function(w, h)
		local a = h * 0.25
		if a > 15 then a = 15 end
		
		local poly = {
			{x = 0, y = 0},
			{x = w, y = 0},
			{x = w, y = h},
			{x = a, y = h},
			{x = 0, y = h - a},
		}	
		return poly
	end,
	[7] = function(w, h)
		local a = h * 0.25
		-- if a > 12 then a = 12 end
		local a2 = h * 0.5
		local poly = {
			{ x = a, y = 0 },
			{ x = w - a, y = 0 },
			{ x = w, y = a2 },
			{ x = w - a, y = h },
			{ x = a, y = h},		
			{ x = 0, y = a2},		
			-- { x = a, y = 0},		
		}		
		return poly
	end,	
}

function CYBER_BUTTON:UpdatePoly(w, h)
	local style = self.ButtonStyle
	if polys[style] then 
		self.poly = polys[style](w, h)
	end 
end

function CYBER_BUTTON:UpdateColours()

	-- if ( !self:IsEnabled() )					then return self:SetTextStyleColor( skin.Colours.Button.Disabled ) end
	-- if ( self:IsDown() || self.m_bSelected )	then return self:SetTextStyleColor( skin.Colours.Button.Down ) end
	if ( self.Hovered )							then return self:SetTextStyleColor( self.Colors.TextHover ) end

	return self:SetTextStyleColor( self.Colors.Text )

end

function CYBER_BUTTON:OnCursorEntered()
	surface.PlaySound(UISounds.Hover)
end

function CYBER_BUTTON:SetButtonStyle(numb, bg_color, text_color, hover_bg, text_hover)
	self.ButtonStyle = numb
	if numb > 2 then 
		local w, h = self:GetWide(), self:GetTall()
		self:UpdatePoly(w, h)
	end 
	if bg_color then self.Colors.BG = bg_color end 
	if text_color then self.Colors.Text = text_color end 
	if hover_bg then self.Colors.BGHover = hover_bg end 
	if text_hover then self.Colors.TextHover = text_hover end 
	
	-- self:UpdateColours()
end 

local styles = {
	[1] = function(self, w, h, colors)
		surface.SetDrawColor(self.Hovered and colors.BGHover or colors.BG)
		surface.DrawRect(0, 0, w, h )		
	end,	
	[3] = function(self, w, h, colors)
		if !self.poly then return end 
		if self:IsHovered() then 
			self:UpdatePoly(w, h)
		end 
		surface.SetDrawColor(self.Hovered and colors.BGHover or colors.BG)
		draw.NoTexture()
		surface.DrawPoly( self.poly )
	end,	
}
styles[4] = styles[3]
styles[5] = styles[3]
styles[6] = styles[3]
styles[7] = styles[3]

function CYBER_BUTTON:Paint( w, h )
	if ( !self.m_bBackground ) then return end
	local style = self.ButtonStyle	
	local colors = self.Colors
	local is_hovered = self:IsHovered()
	if !self.NoBubble then
		local x, y = self:GetPos()
		if !self.StoreW then 
			self.StoreW = w
			self.StoreH = h
			self.StoreX = x
			self.StoreY = y
		end 
		if is_hovered then 
			if !self.EnteredForSize then 
				self.EnteredForSize = true
				self:SizeTo( w + 5, h + 5, 0.1)
				self:MoveTo( x - 2.5, y - 2.5, 0.1)
			end 
		else 
			if self.EnteredForSize then 
				self.EnteredForSize = false 
				self:SizeTo( self.StoreW, self.StoreH, 0.1)
				self:MoveTo( self.StoreX, self.StoreY, 0.1)		
			end 
			if w != self.StoreW then 
				self:UpdatePoly(w, h)
			end 
		end 
	end 
	
	if styles[style] then styles[style](self, w, h, colors) end
end

vgui.Register( "Cyber_Button", CYBER_BUTTON, "DButton" )

hook.Add("PostGamemodeLoaded", "CYBER_AUGS_LoadModelPanel", function() -- that's needed to load custom model panel properly, so it can derive functions from default one
local CYBER_DMODEL = {}
local dmodelpanel = vgui.GetControlTable("DModelPanel")
local InvalidModels = CYBERNETIC_AUGMENTATIONS.InvalidModels

function CYBER_DMODEL:Init()
	dmodelpanel.Init(self)
	
	self.Augmentations = {}
	self.HiddenBones = {}
end

function CYBER_DMODEL:Think( w, h )
	local mc_left = input.IsMouseDown(MOUSE_LEFT)
	local mc_middle = input.IsMouseDown(MOUSE_MIDDLE)
	local mc_right = input.IsMouseDown(MOUSE_RIGHT)

	if (self.m_bDragging and !mc_left) then
		self.m_bDragging = false
	elseif mc_left and !self.m_bDragging then 
		self.m_bDragging = true
		self.m_iX = gui.MouseX()		
	end

	if (self.m_bZooming and !mc_middle) then
		self.m_bZooming = false
	elseif mc_middle and !self.m_bZooming then 
		self.m_bZooming = true
		self.m_iY = gui.MouseY()	
	end

	if (self.m_bMoving and !mc_right) then
		self.m_bMoving = false
	elseif mc_right and !self.m_bMoving then 
		self.m_bMoving = true
		self.m_iX = gui.MouseX()
		self.m_iY = gui.MouseY()
	end
end

function CYBER_DMODEL:OnCursorMoved()
	if not self.Entity or not IsValid(self.Entity) then return end
	local ang = self.Entity:GetAngles()
	local modif = self.m_bDragging or self.m_bZooming or self.m_bMoving

	if (self.Draggable and self.m_bDragging) then
		local mx = gui.MouseX()
		local xdif = mx - self.m_iX

		self.m_iX = mx
		self.Entity:SetAngles(Angle(0, (ang[2] + xdif * 0.5) % 360, 0))
	end

	if (self.Zoomable and self.m_bZooming) then
		local my = gui.MouseY()
		local ydif = my - self.m_iY

		self.m_iY = my
		self:SetFOV(math.Clamp(self:GetFOV() + ydif * 0.33, 5, 100))
	end

	if (self.Movable and self.m_bMoving) then
		local mx, my = gui.MousePos()
		local xdif = mx - self.m_iX
		local ydif = my - self.m_iY
		local cp = self:GetCamPos()
		local la = self:GetLookAt()

		self.m_iX = mx
		self.m_iY = my
		self:SetCamPos(Vector(cp.x + xdif * 0.1, cp.y, cp.z + ydif * 0.15))
		self:SetLookAt(Vector(la.x + xdif * 0.1, la.y, la.z + ydif * 0.15))
	end

	if (modif) then
		self.m_fNextSave = RealTime() + 0.1
	end

	self.m_bCursorIn = true
end 

function CYBER_DMODEL:OnCursorExited()
	local mx, my = gui.MousePos()

	if (self.m_bDragging or self.m_bZooming or self.m_bMoving) then
		local rx, ry = self:ScreenToLocal(mx, my)
		if (rx <= 0) then
			rx, ry = self:LocalToScreen(self:GetWide(), 0)
			input.SetCursorPos(rx, my)
			self.m_iX = rx
		elseif (rx >= self:GetWide()) then
			rx, ry = self:LocalToScreen(0, 0)
			input.SetCursorPos(rx, my)
			self.m_iX = rx
		end

		local rx, ry = self:ScreenToLocal(mx, my)
		if (ry <= 0) then
			rx, ry = self:LocalToScreen(0, self:GetTall())
			input.SetCursorPos(mx, ry)
			self.m_iY = ry
		elseif (ry >= self:GetTall()) then
			rx, ry = self:LocalToScreen(0, 0)
			input.SetCursorPos(mx, ry)
			self.m_iY = ry
		end
	end

	self.m_bCursorIn = false
end 

function CYBER_DMODEL:SetModifable(zoom, drag, move)
	self.Movable = move
	self.Draggable = drag
	self.Zoomable = zoom
end 

function CYBER_DMODEL:CenterCam()
	local ent = self:GetEntity()
	local pos = ent:GetPos()
	local ang = ent:GetAngles()

	local tab = PositionSpawnIcon( ent, pos, true )

	ent:SetAngles( ang )
	if ( tab ) then
		self:SetCamPos( tab.origin )
		self:SetFOV( tab.fov )
		self:SetLookAng( tab.angles )
	end
end

function CYBER_DMODEL:UpdateAugColor(slot, color)
	local augs = self.Augmentations
	local is_exist = augs[slot]
	if is_exist then
		is_exist.Color = color
	end
end

function CYBER_DMODEL:SetupAugmentations(augs)
	for slot, data in next, augs do
		if slot < 5 then
			local model = Items[slot][data.id].Model

			self:SetAugmentation(slot, model, data.skin, data.clr, data.hide)
		elseif slot == 6 then
			local mat_id, id = data.mat_id, data.id
			local mat = mat_id and Items[6][id].EyeMaterial[mat_id] or Items[6][id].EyeMaterial
			
			CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures(self.Entity, mat)
		end
	end
end

function CYBER_DMODEL:RestoreAugmentations()
	local entity = self.Entity
	local augs = self.Augmentations
	if augs then
		for slot, v in next, augs do
			if IsValid(v.Ent) then
				v.Ent:Remove()
			end
			augs[slot] = nil
			hide_bones(entity, slot)
		end
	end
end

function CYBER_DMODEL:SetAugmentation(slot, model, skin, color, hide)
	local self_ent = self.Entity
	local augs = self.Augmentations
	local is_exist = augs[slot]
	
	if is_exist then
		local ent = is_exist.Ent
		
		ent:SetModel(model)
		ent:SetSkin(skin)
		
		is_exist.Color = color
	else
		local ent = ClientsideModel( model )
		ent:SetSkin(skin)
		ent:SetNoDraw(true)
		ent:AddEffects(EF_BONEMERGE + EF_BONEMERGE_FASTCULL)
		ent:SetParent(self_ent)
		
		CYBERNETIC_AUGMENTATIONS.HideAug(self_ent, ent, hide or 0, slot)
		
		augs[slot] = {
			Ent = ent,
			Color = color
		}
	end
end


function CYBER_DMODEL:Paint(w, h)
	local ent = self.Entity

	if ( !IsValid( ent ) ) then return end

	local x, y = self:LocalToScreen( 0, 0 )
	-- local ambCol, colColor, 
	local ang = self.aLookAngle
	local DirLight, colAmbientLight = self.DirectionalLight, self.colAmbientLight
	local augs = self.Augmentations
	
	if ( !ang ) then
		ang = ( self.vLookatPos - self.vCamPos ):Angle()
	end

	cam.Start3D( self.vCamPos, ang, self.fFOV, x, y, w, h, 5, self.FarZ )

	render.SuppressEngineLighting( true )
	render.SetLightingOrigin( ent:GetPos() )
	render.ResetModelLighting( colAmbientLight.r / 255, colAmbientLight.g / 255, colAmbientLight.b / 255 )

	for i = 0, 6 do
		local col = DirLight[ i ]
		if ( col ) then
			render.SetModelLighting( i, col.r / 255, col.g / 255, col.b / 255 )
		end
	end
	
	if InvalidModels[ent:GetModel()] then
		self:DrawModel()

		for slot, data in next, augs do
			local clr = data.Color
			local aug_ent = data.Ent

			render.SetColorModulation(clr.r / 255, clr.g / 255, clr.b / 255)
				aug_ent:DrawModel()
		end
	else
		for slot, _ in next, augs do
			hide_bones(ent, slot, true)
		end
		
		self:DrawModel()
		
		for slot, _ in next, augs do
			hide_bones(ent, slot)
		end
		
		for slot, data in next, augs do
			local clr = data.Color
			local aug_ent = data.Ent

			render.SetColorModulation(clr.r / 255, clr.g / 255, clr.b / 255)
				aug_ent:DrawModel()
		end
	end
	render.SuppressEngineLighting( false )

	cam.End3D()

	self.LastPaint = RealTime()
end

function CYBER_DMODEL:ChangeCamPos(anim_speed, bone, cam_pos, FOV, model_angle) 
	if bone == self.LookupCamBone then return end 
	self.LookupCamBone = bone 
	local entity = self.Entity

	local lookup_pos = entity:GetBonePosition( entity:LookupBone( bone ) )
	
	local anim = self:NewAnimation(anim_speed, 0, -1)
	
	anim.Think = function( anim, pnl, fraction )
		local new_cam_pos = LerpVector(fraction, self:GetCamPos(), lookup_pos + cam_pos )
			
		if model_angle then 
			entity:SetAngles(LerpAngle(fraction, entity:GetAngles(), model_angle))
		end 
		
		self:SetLookAt(lookup_pos)
		self:SetCamPos(new_cam_pos)	
		
		if FOV then 
			self:SetFOV(Lerp(fraction, self:GetFOV(), FOV))
		end 
	end			
end

function CYBER_DMODEL:OnRemove()
	dmodelpanel.OnRemove(self)
	
	for k,v in next, self.Augmentations do
		if IsValid(v.Ent) then v.Ent:Remove() end
	end
end

vgui.Register( "Cyber_ModelPanel", CYBER_DMODEL, "DModelPanel" )
end )