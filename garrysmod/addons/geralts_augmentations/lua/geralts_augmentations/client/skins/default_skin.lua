CYBERNETIC_AUGMENTATIONS.Skins["cyberpunk"] = CYBERNETIC_AUGMENTATIONS.Skins["cyberpunk"] or {}

local skin = CYBERNETIC_AUGMENTATIONS.Skins["cyberpunk"]
local background = Material("geralts_augmentations/skins/default_skin/main.jpg")
local hover_gradient = Material("geralts_augmentations/ui/gradient_transparent.png")
local unknown_dmg = Material("geralts_augmentations/ui/unknown_dmg.png")
local CYBER_AUGS_LANGUAGE = CYBER_AUGS_LANGUAGE
local DamageTypeIcons = CYBERNETIC_AUGMENTATIONS.DamageTypeIcons
local Dialog = CYBER_AUGS_LANGUAGE.Dialog
local UISounds = CYBERNETIC_AUGMENTATIONS.UISounds
local MaxBuyDist = CYBERNETIC_AUGMENTATIONS.MaxBuyDistance
local RepairPrice = CYBERNETIC_AUGMENTATIONS.RepairPrice
local slots = CYBER_AUGS_LANGUAGE and CYBER_AUGS_LANGUAGE.Slots
local items = CYBERNETIC_AUGMENTATIONS and CYBERNETIC_AUGMENTATIONS.Items
local use_image = CYBERNETIC_AUGMENTATIONS.UseModelImage
local eye_mats = {}
local s8, s9, s10 = ScreenScale(8), ScreenScale(9), ScreenScale(10)
MaxBuyDist = MaxBuyDist * MaxBuyDist

local ui_slot_positions = {
	[1] = {0.35, 0.24},
	[2] = {0.65, 0.24},
	[3] = {0.36, 0.75},
	[4] = {0.65, 0.75},
}

skin.Fonts = {
	Main = "Blender Pro Book",
	Bold = "Blender Pro Bold",
	Title = "Blender Pro Heavy",
}

skin.Colors = {
	CloseColor = Color(250, 232, 0),
	SecondaryColor = Color(238, 52, 83),
	MainBG = Color(250, 232, 0),
	TextColor = Color(15, 15, 15),
	ButtonHover = Color(255, 255, 255),
	FrontLight = Color(150,220,255),
	ItemColor = Color(0,0,0,240),
	ParameterBar = Color(0, 235, 255),
	NegativeColor = Color(255, 0, 0),
	LightText = Color(250, 232, 0),
	MoneyPriceClr = Color(0, 255, 150),
	CantAffordClr = Color(255, 50, 0),
	DonatePriceClr = Color(255, 200, 0),
	BarColor = Color(0,0,0),
	NotifyColors = {
		[1] = Color(0,255,50),
		[2] = Color(200,0,100),
		[3] = Color(50,100,200),
		[4] = Color(200,200,0),
	},
	InfoHuman = Color(255, 255, 255),
	InfoSlotColor = Color(250, 232, 0),
	EmptySlotColor = Color(250, 5, 75),
}

local colors = skin.Colors
local fonts = skin.Fonts

skin.ClinicPaint = function(self, w, h)
	local npc = self.npc
	
	if not IsValid(npc) or npc:GetPos():DistToSqr(CYBER_AUGS_LOCALPLAYER:GetPos()) > MaxBuyDist then self:Remove() end
	
	surface.SetDrawColor(color_white)
	surface.SetMaterial(background)
	surface.DrawTexturedRect(0,0,w,h)
end

skin.EnergyBar = { -- X,Y,W and H are proportions of screen
	X = 0.41,
	Y = 0.9,
	W = 0.18,
	H = 0.02,
	Color = colors.MainBG,
}

for i, v in next, items[6] do
	local icon = v.EyeMaterial
	if istable(icon) then
		eye_mats[i] = {}
		for id, mat in next, icon do
			eye_mats[i][id] = Material(mat .. ".jpg")
		end
	else
		eye_mats[i] = Material(icon .. ".jpg")
	end
end

local function scroll_bar_texture(scroll_bar)
	local sbar = scroll_bar:GetVBar()
	sbar:SetWide(10)
	
	function sbar:Paint(w, h) end
	function sbar.btnUp:Paint(w, h) end
	function sbar.btnDown:Paint(w, h) end
	function sbar.btnGrip:Paint(w, h)
		surface.SetDrawColor(colors.BarColor)
		surface.DrawRect(0,0,w,h)
	end
end

local function BuildItems(s, slot)
	local DeleteItems = s.DeleteItems
	local wide, tall = s:GetWide(), s:GetTall()
	local button_w, button_h = wide * 0.1, tall * 0.15
	local start_x, start_y = wide * 0.025, tall * 0.25
	local i_x, i_y = 0, 0
	local down = false
	local page = 1

	local current_category = items[slot]
	
	local button_y_padding = button_h * 0.5 + 5
	local button_x_padding = button_w * 0.75 + 15
	
	local item_clr = colors.ItemColor
	local model_panel = s.ModelPanel
	
	local item_scroll = vgui.Create("DScrollPanel", s)
	item_scroll:SetSize(wide * 0.45, tall * 0.6)
	item_scroll:SetPos(start_x, start_y)
	scroll_bar_texture(item_scroll)
	
	for id, item_data in next, current_category do
		local name = item_data.Name
		local model = item_data.Prop
		local aug_model = item_data.Model
		local icon = item_data.Icon
		local eye_material = item_data.EyeMaterial
		local price = item_data.Money
		local donate = item_data.Donate
		local price_text = price and CYBERNETIC_AUGMENTATIONS.formatMoney(price)
		local donate_text = donate and donate .. " " .. CYBER_AUGS_LANGUAGE.Points
		local icon_size = ScrH() / 13
		
		local item = item_scroll:Add("Cyber_Button")
		item:SetText("")
		item:SetSize(button_w, button_h)
		item:SetPos(button_x_padding * i_x, (button_h + 7) * i_y + (down and button_y_padding or 0))
		item:SetButtonStyle(7, item_clr, color_white, item_clr, color_black)
		item:SetAlpha(0)
		item:AlphaTo(255, 0.05, 0.05 * id)

		item.PaintOver = function(self, w, h)
			if self:IsHovered() then
				surface.SetDrawColor(color_white)
				surface.SetMaterial(hover_gradient)
				surface.DrawTexturedRect(0,0,w,h)
			end
			
			local model_image = self.Icon
			if IsValid(model_image) then
				model_image:PaintManual()
			end
			if icon then
				local mat = istable(icon) and icon[1] or icon
				surface.SetDrawColor(color_white)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(w * 0.5 - icon_size * 0.5, h * 0.5 - icon_size * 0.5, icon_size, icon_size)
			end
			name = string.Replace(name, " ", "\n")

			draw.DrawText(name, "CYBER_AUGS_ItemFont", w * 0.5, 5, color_white, TEXT_ALIGN_CENTER)
			
			local price_y = 0
			if price then
				local price_clr = CYBERNETIC_AUGMENTATIONS.CanAfford(CYBER_AUGS_LOCALPLAYER, price, true) and colors.MoneyPriceClr or colors.CantAffordClr
				
				local tt, hh = draw.SimpleText(price_text, "CYBER_AUGS_ItemFont", w * 0.5, h * 0.99, price_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				price_y = price_y + hh 
			end
			if donate then
				local donate_clr = CYBERNETIC_AUGMENTATIONS.CanAffordDonate(CYBER_AUGS_LOCALPLAYER, donate) and colors.DonatePriceClr or colors.CantAffordClr
				
				draw.SimpleText(donate_text, "CYBER_AUGS_ItemFont", w * 0.5, h * 0.99 - price_y, donate_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			end
		end
		item.DoClick = function()
			if not do_click then
				if aug_model then model_panel:SetAugmentation(slot, aug_model, 0, color_white) end
				if eye_material then 
					local mat = istable(eye_material) and table.Random(eye_material) or eye_material
					CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures(model_panel.Entity, mat ) 
				end
				s.SelectedAug = item_data
				s.SelectedAugID = id
				
				CYBERNETIC_AUGMENTATIONS.GlitchAnimation(0.05)
				surface.PlaySound(UISounds.Click2)
			else
				do_click()
			end
		end
		
		if model then
			if use_image then
				local icon = vgui.Create( "ModelImage", item )
				icon:StretchToParent( -100, -30, -100, -30 )
				icon:SetModel(model)
				icon:SetPos(2, 2)
				icon:SetSize(button_w - 4, button_h - 4)
				icon:SetPaintedManually(true)
				icon:SetMouseInputEnabled( false )
				icon:SetKeyboardInputEnabled( false )

				item.Icon = icon
			else
				local icon = vgui.Create( "Cyber_ModelPanel", item )
				icon:SetModel(model)
				icon:SetPos(2, 2)
				icon:SetSize(button_w - 4, button_h - 4)
				icon:SetMouseInputEnabled( false )
				icon:SetKeyboardInputEnabled( false )
				icon:CenterCam()
				icon:SetPaintedManually(true)
				
				item.Icon = icon
			end
		end

		down = not down
		i_x = i_x + 1

		if i_x > 4 then
			down = false
			i_x = 0
			i_y = i_y + 1
		end
		
		DeleteItems[item] = true
	end
	if slot < 5 then
		local aug_paint = vgui.Create("DColorMixer", s)
		aug_paint:SetSize(wide * 0.15, wide * 0.15)
		aug_paint:SetPos(wide * 0.48, tall * 0.5 - wide * 0.075)
		aug_paint:SetAlphaBar(false)
		aug_paint:SetColor(color_white)
		aug_paint:SetLabel(CYBER_AUGS_LANGUAGE.PaintAug)
		aug_paint.label:SetFont("CYBER_AUGS_ItemFont")
		aug_paint.label:SetTextColor(colors.TextColor)
		aug_paint.ValueChanged = function(self, col)
			model_panel:UpdateAugColor(slot, col)
		end
		
		s.ColorMixer = aug_paint
		DeleteItems[aug_paint] = true
	end
end

skin.PagesPaint = {
	[0] = {
		Paint = function(s, w, h)
			draw.DrawText(CYBER_AUGS_LANGUAGE.ClinicWelcome, "CYBER_AUGS_DescFont", 25, h * 0.1 + ScreenScale(25), colors.TextColor, TEXT_ALIGN_LEFT)
		end,
		Elements = function(s)

		end,
	},
	[1] = {
		Paint = function(s, w, h)
			
		end,
		Elements = function(s)
			BuildItems(s, 1)
		end,
		CamData = {"ValveBiped.Bip01_R_Forearm", Vector(10, -15, 0)},
	},
	[2] = {
		Paint = function(s, w, h)
	
		end,
		Elements = function(s)
			BuildItems(s, 2)
		end,
		CamData = {"ValveBiped.Bip01_L_Forearm", Vector(10, 15, 0), true},
	},
	[3] = {
		Paint = function(s, w, h)

		end,
		Elements = function(s)
			BuildItems(s, 3)
		end,
		CamData = {"ValveBiped.Bip01_R_Calf", Vector(10, -15, 0)},
	},	
	[4] = {
		Paint = function(s, w, h)

		end,
		Elements = function(s)
			BuildItems(s, 4)
		end,
		CamData = {"ValveBiped.Bip01_L_Calf", Vector(15, 15, 0), true},
	},
	[5] = {
		Paint = function(s, w, h)
		end,
		Elements = function(s)
			BuildItems(s, 5)
		end,
		CamData = {"ValveBiped.Bip01_Spine", Vector(10, 0, 0)},
	},
	[6] = {
		Paint = function(s, w, h)
		end,
		Elements = function(s)
			BuildItems(s, 6)
		end,
		CamData = {"ValveBiped.Bip01_Head1", Vector(5, 0, 0)},
	},
}

skin.ClinicMain = function(self, w, h)
	if not slots then slots = CYBER_AUGS_LANGUAGE.Slots end
	local parameters_l = CYBER_AUGS_LANGUAGE.Parameters
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations()
	
	CYBERNETIC_AUGMENTATIONS.GlitchAnimation(0.5)
	
	local WorkingPanel = vgui.Create("Panel", self)
	WorkingPanel:SetSize(0, h)
	WorkingPanel:SetPos(w * 0.5, 0)
	
	WorkingPanel:SizeTo(w, h, 0.25)
	WorkingPanel:MoveTo(0, 0, 0.25, nil, nil, function() WorkingPanel.Blur = 0 end)
	
	local padding = w * 0.1
	local padding2 = w * 0.01
	local y = h * 0.075
	local y2 = y + (h - y * 2)
	
	WorkingPanel.CurrentPage = 0
	WorkingPanel.DeleteItems = {}
	WorkingPanel.Poly = {
		{ x = 0, y = y },
		{ x = w - padding, y = y },
		{ x = w - padding + padding2, y = y + padding2 },
		{ x = w, y = y + padding2 },
		{ x = w, y = y2 },
		{ x = padding, y = y2 },
		{ x = padding - padding2, y = y2 - padding2 },
		{ x = 0, y = y2 - padding2 },
	}

	WorkingPanel.Paint = function(s, ww, hh)
		local poly = s.Poly
		if s.Blur then
			s.Blur = math.Approach(s.Blur, 5, 0.2)
			
			surface.SetDrawColor(ColorAlpha(colors.MainBG, 100))
			draw.NoTexture()
			surface.DrawPoly(poly)
			
			CYBERNETIC_AUGMENTATIONS.DrawBlur(s.Blur)
		end

		surface.SetDrawColor(colors.MainBG)
		draw.NoTexture()
		surface.DrawPoly(poly)
		
		surface.SetDrawColor(15, 15, 15)
		surface.DrawRect(0, y + padding2 - 2, w, 1)		
		surface.DrawRect(0, y2 - padding2, w, 1)
		
		local cur_page = s.CurrentPage
		local title = inventory and CYBER_AUGS_LANGUAGE.AugsInventory or cur_page > 0 and slots[cur_page] or CYBER_AUGS_LANGUAGE.ShopTitle
		title = CYBERNETIC_AUGMENTATIONS.TextAnimation(s, title)

		draw.SimpleText(title, "CYBER_AUGS_TitleFont", 25, h * 0.1, colors.TextColor, TEXT_ALIGN_LEFT)
		
		skin.PagesPaint[s.CurrentPage].Paint(s, ww, hh)
	
		draw.SimpleText(string.format(CYBER_AUGS_LANGUAGE.Wallet, CYBERNETIC_AUGMENTATIONS.formatMoney(CYBERNETIC_AUGMENTATIONS.GetMoney(CYBER_AUGS_LOCALPLAYER))), "CYBER_AUGS_TitleFont", 25, hh * 0.99, colors.MainBG, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	end
	
	local start_x, start_y = w * 0.05, h * 0.03
	local button_w = (w - start_x * 2 - 20 * 5) / 6

	for i, name in next, slots do
		local button = vgui.Create("Cyber_Button", self)
		button:SetText(name)
		button:SetFont("CYBER_AUGS_ButtonFont")
		button:SetPos(start_x, start_y)
		button:SetSize(button_w, h * 0.025)
		button:SetButtonStyle(3, colors.MainBG, colors.TextColor, colors.ButtonHover, colors.TextColor)
		button.DoClick = function()
			CYBERNETIC_AUGMENTATIONS.GlitchAnimation(0.25)
			WorkingPanel.CurrentPage = i
			
			local page_data = skin.PagesPaint[i]
			local cam_data = page_data.CamData
			local left = cam_data[3]
			local ModelPanel = WorkingPanel.ModelPanel
			
			ModelPanel:ChangeCamPos(0.35, cam_data[1], cam_data[2])
			ModelPanel:RestoreAugmentations()
			ModelPanel:SetupAugmentations(augs)
			
			local ent = ModelPanel.Entity
			ent:SetPos(ent:GetPos() - (left and -ent:GetForward() or ent:GetForward() * 10))

			WorkingPanel.StartTextAnim = 0
			WorkingPanel.SelectedAug = nil
			
			for item, _ in next, WorkingPanel.DeleteItems do
				if IsValid(item) then item:Remove() end
			end
			
			page_data.Elements(WorkingPanel)
			surface.PlaySound(UISounds.Click1)
		end
		start_x = start_x + button_w + 20
	end

	local parameter_color = colors.ParameterBar
	local minus_clr = colors.NegativeColor
	local light_text_clr = colors.LightText
	
	local ply_model = vgui.Create("Cyber_ModelPanel", self)
	ply_model:SetSize(w * 0.35 - 10, h - y * 2 - padding2 * 2 + 1)
	ply_model:SetPos(w * 0.65 + 5, y + padding2 - 1)
	ply_model:SetModifable(true, true, true)
	ply_model:SetModel(CYBER_AUGS_LOCALPLAYER:GetModel())
	ply_model:SetupAugmentations(augs)
	
	local ent = ply_model.Entity
	ent:SetSkin(CYBER_AUGS_LOCALPLAYER:GetSkin())
	local eyepos = ent:GetBonePosition(ent:LookupBone("ValveBiped.Bip01_Head1"))
	eyepos:Add(Vector(0, 0, 2))	-- Move up slightly
	ply_model:SetLookAt(eyepos)
	ply_model:SetCamPos(eyepos-Vector(-12, 0, 0))	-- Move cam in front of eyes
	ent:SetEyeTarget(eyepos-Vector(-12, 0, 0))

	ply_model:SetDirectionalLight(BOX_FRONT, colors.FrontLight)
	ply_model:SetDirectionalLight(BOX_BACK, colors.MainBG)
	ply_model.PaintOver = function(s, ww, hh)
		local SelectedAug = WorkingPanel.SelectedAug 
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(0,0,1,h)
			
		if SelectedAug then
			local eye_material = SelectedAug.EyeMaterial
			local x,y = 0, 0
			if WorkingPanel.CurrentPage == 6 then
				x,y,ww, hh = ww * 0.1, hh * 0.65, ww * 0.8 + 40, hh * 0.35
			else
				x,y,ww, hh = ww * 0.55, hh * 0.15, ww * 0.4 + 40, hh * 0.7
			end
			surface.SetDrawColor(0,0,0,240)
			surface.DrawRect(x - 20, y - 20, ww, hh)
			
			local name = SelectedAug.Name
			local title_w, title_h = draw.SimpleText(name, "CYBER_AUGS_AugInfo", x + ww * 0.5 - 20, y, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			
			surface.SetDrawColor(color_white)
			surface.DrawRect(x, y + title_h, ww - 40, 4)
			
			local params = SelectedAug.Parameters
			
			local start_y = y + title_h + 10	
			for k, v in next, params do
				local is_b = isbool(v)
				local align = is_b and TEXT_ALIGN_CENTER or TEXT_ALIGN_LEFT
				local text_x = is_b and x + ww * 0.5 - 20 or x
				
				draw.SimpleText(parameters_l[k], "CYBER_AUGS_BoldDescFont", text_x, start_y, (is_b and color_white or light_text_clr), align, TEXT_ALIGN_TOP)

				if isnumber(v) then 
					local bar_y = start_y + s8

					surface.SetDrawColor(color_black)
					surface.DrawOutlinedRect(x, bar_y + 5, ww - 40, 15)
				
					local scale = v * 0.01
					local is_minus = false
					if scale > 1 then scale = 1
					elseif scale < 0 then scale = -scale is_minus = true
					end
					scale = (ww - 38) * scale
					
					surface.SetDrawColor((is_minus and minus_clr or parameter_color))
					surface.DrawRect(x + 1, bar_y + 6, scale, 13)
					
					draw.SimpleText(v .. "%", "CYBER_AUGS_ItemFont", x + scale, bar_y + s8, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
					start_y = start_y + s8 * 3
				elseif istable(v) then
					local res_y = start_y + s8 * 1.5
					local i = 0
					for dmg, amount in next, v do
						local res_x = (x - s8 * 0.5) + s8 * 3 * i
						local mat = DamageTypeIcons[dmg] or unknown_dmg
						draw.SimpleText(amount .. "%", "CYBER_AUGS_ItemFont", res_x + s8 * 2, res_y, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
						
						surface.SetMaterial(mat)
						surface.SetDrawColor(color_white)
						surface.DrawTexturedRect(res_x, res_y, s8, s8)
						i = i + 1
					end
					start_y = start_y + s8 * 3
				else
					start_y = start_y + s8 * 1.5
				end
			end
			
			local money = SelectedAug.Money
			local donate = SelectedAug.Donate
			
			local price_y = y + hh - s10 * 2 - 10
			
			if money then
				local price_clr = CYBERNETIC_AUGMENTATIONS.CanAfford(CYBER_AUGS_LOCALPLAYER, money, true) and colors.MoneyPriceClr or colors.CantAffordClr
				
				local tt, hh = draw.SimpleText(CYBERNETIC_AUGMENTATIONS.formatMoney(money), "CYBER_AUGS_BoldBigFont", x + ww * 0.5 - 20, price_y, price_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
				price_y = price_y - hh 
			end
			if donate then
				local donate_clr = CYBERNETIC_AUGMENTATIONS.CanAffordDonate(CYBER_AUGS_LOCALPLAYER, donate) and colors.DonatePriceClr or colors.CantAffordClr
				
				draw.SimpleText(donate .. " " .. CYBER_AUGS_LANGUAGE.Points, "CYBER_AUGS_BoldBigFont", x + ww * 0.5 - 20, price_y, donate_clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			end
			
			local buy_button = s.BuyButton
			if not IsValid(buy_button) then
				buy_button = vgui.Create("Cyber_Button", s)
				buy_button:SetText(CYBER_AUGS_LANGUAGE.Buy)
				buy_button:SetFont("CYBER_AUGS_BoldBigFont")
				buy_button:SetSize(ww * 0.75, s10)
				buy_button:SetPos(x + ww * 0.125 - 20, y + hh - s10 * 2)
				buy_button:SetButtonStyle(3, colors.MainBG, colors.TextColor, colors.ButtonHover, colors.TextColor)
				buy_button:SetDrawOnTop(true)
				buy_button.DoClick = function()
					if not CYBERNETIC_AUGMENTATIONS.CanBuyAug(CYBER_AUGS_LOCALPLAYER, SelectedAug) then return end
					
					local slot = WorkingPanel.CurrentPage
					local aug_id = WorkingPanel.SelectedAugID
					local clr = IsValid(WorkingPanel.ColorMixer) and WorkingPanel.ColorMixer:GetColor() or color_white
					
					CYBERNETIC_AUGMENTATIONS.Query( CYBER_AUGS_LANGUAGE.BuyConfirmation, name,
					CYBER_AUGS_LANGUAGE.BuyAndInstall, function() 
						CYBERNETIC_AUGMENTATIONS.MakeProgressBar(5, true, function() CYBERNETIC_AUGMENTATIONS.BuyAug_CL(self.npc, slot, aug_id, clr, s.EyeMat) end,
						false, CYBER_AUGS_LANGUAGE.InstallingAug)
					end,
					CYBER_AUGS_LANGUAGE.No )
					surface.PlaySound(UISounds.Click2)
				end
				s.BuyButton = buy_button
				
				WorkingPanel.DeleteItems[buy_button] = true
			end
			local HorScroller = WorkingPanel.HorScroller
			if eye_material and istable(eye_material) then
				if not HorScroller then
					local button_h = 128
					local hor_w = button_h * 4 + 20
					
					local id = WorkingPanel.SelectedAugID
					
					local hor = vgui.Create("DHorizontalScroller", s)
					hor:SetSize(hor_w, button_h)
					hor:SetPos(x + ww - hor_w - 30, 0)
					hor:SetOverlap(-5)
					hor:SetDrawOnTop(true)
					
					for i, ent_mat in next, eye_material do	
						local mat = eye_mats[id][i] 
						local eye = vgui.Create("DButton", hor )
						eye:SetSize(button_h, button_h)
						eye:SetText("")
						eye.Paint = function(eye, w, h)
							surface.SetDrawColor(color_white)
							surface.SetMaterial(mat)
							surface.DrawTexturedRect(0,0,w,h)
							if eye:IsHovered() then
								surface.SetDrawColor(ColorAlpha(parameter_color, 150))
								surface.DrawRect(0,0,w,h)
							end
							surface.SetDrawColor(color_black)
							surface.DrawOutlinedRect(0,0,w,h)
						end
						eye.DoClick = function()
							CYBERNETIC_AUGMENTATIONS.ChangeEyeTextures(s.Entity, ent_mat ) 
							s.EyeMat = i
						end
						hor:AddPanel(eye)
					end
					WorkingPanel.HorScroller = hor
					WorkingPanel.DeleteItems[hor] = true
				end
			else
				if IsValid(HorScroller) then 
					HorScroller:Remove()
					WorkingPanel.HorScroller = nil
				end
			end
		end
		
		local slot = WorkingPanel.CurrentPage
		local CurrentAug = augs[slot]
		local SellButton = s.SellButton
		if CurrentAug then
			local item = items[slot][CurrentAug.id]

			if item and not IsValid(SellButton) then
				SellButton = vgui.Create("Cyber_Button", s)
				SellButton:SetText(CYBER_AUGS_LANGUAGE.Sell)
				SellButton:SetFont("CYBER_AUGS_BoldBigFont")
				SellButton:SetSize(ww * 0.75, s10 * 1.5)
				SellButton:SetPos(ww * 0.125, hh - s10 * 2)
				SellButton:SetButtonStyle(3, colors.TextColor, colors.MainBG, colors.ButtonHover, colors.TextColor)
				SellButton:SetDrawOnTop(true)
				SellButton.DoClick = function()
					local CurrentAug = augs[WorkingPanel.CurrentPage]
					
					item = items[slot][CurrentAug.id]
					local money, donate = (item.Money or 0) * CYBERNETIC_AUGMENTATIONS.SellMoneyMultiply, (item.Donate or 0) * CYBERNETIC_AUGMENTATIONS.SellDonateMultiply

					CYBERNETIC_AUGMENTATIONS.Query( string.format(CYBER_AUGS_LANGUAGE.SellFor, CYBERNETIC_AUGMENTATIONS.formatMoney(money), donate), CYBER_AUGS_LANGUAGE.SellConfirmation,
					CYBER_AUGS_LANGUAGE.Yes, function() 
						net.Start("CYBER_AUGS_SellAugmentation")
						net.WriteUInt(slot, 3)
						net.SendToServer()
					end,
					CYBER_AUGS_LANGUAGE.No )
					surface.PlaySound(UISounds.Click2)
				end
				s.SellButton = SellButton
			end
		else
			if IsValid(SellButton) then SellButton:Remove() end
		end
	end
	
	WorkingPanel.ModelPanel = ply_model
end

skin.CloseButton = function(frame, w, h, font)
	font = font or "CYBER_AUGS_TitleFont"
	surface.SetFont(font)
	local close_wide, close_tall = surface.GetTextSize("x")
	
	local close_button = vgui.Create("DButton", frame)
	close_button:SetText("")
	close_button:SetSize(close_wide + 2, close_tall + 2)
	close_button:SetPos(w - close_wide - 15, 5)
	close_button.Paint = function(self, w, h)
		local clr = self:IsHovered() and colors.SecondaryColor or colors.CloseColor
		draw.SimpleTextOutlined("x", font, w * 0.5, h * 0.5, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, color_black)
	end
	close_button.DoClick = function()
		frame:Remove()
		surface.PlaySound(UISounds.Click2)
	end
end

local function var_hide(slot, var, ply_model)
	net.Start("CYBER_AUGS_HideAug")
	net.WriteUInt(slot, 3)
	net.WriteUInt(var, 3)
	net.SendToServer()
	
	timer.Simple(0.25, function()
		if not IsValid(ply_model) then return end
		if not ply_model.Augmentations[slot] then return end

		CYBERNETIC_AUGMENTATIONS.HideAug(ply_model.Entity, ply_model.Augmentations[slot].Ent, var, slot)
	end)
end

skin.InfoMain = function(w, h)
	if IsValid(CYBER_AUGS_INFO_PANEL) then CYBER_AUGS_INFO_PANEL:Remove() return end

	local slot_color = colors.InfoSlotColor
	local empty_slot_color = colors.EmptySlotColor
	local button_w, button_h = w * 0.05, h * 0.1
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations()
	
	local InfoPanel = vgui.Create("Panel")
	InfoPanel:SetSize(w, h)
	InfoPanel:MakePopup()
	InfoPanel.Buttons = {}
	InfoPanel.StartTextAnim = 0
	
	local buttons = InfoPanel.Buttons
	
	local ply_model = vgui.Create("Cyber_ModelPanel", InfoPanel)
	ply_model:SetSize(w * 0.5 - 10, h)
	ply_model:SetPos(w * 0.25 + 5, 0)
	ply_model:SetModifable(false, true, false)
	ply_model:SetModel(CYBER_AUGS_LOCALPLAYER:GetModel())
	ply_model:SetupAugmentations(augs)
	
	local ent = ply_model.Entity
	local dmodel_augs = ply_model.Augmentations
	ent:SetSkin(CYBER_AUGS_LOCALPLAYER:GetSkin())
	
	local eyepos = ent:GetBonePosition(ent:LookupBone("ValveBiped.Bip01_Pelvis"))
	eyepos:Add(Vector(0, 0, 2))
	ply_model:SetLookAt(eyepos)
	
	local campos = eyepos-Vector(-55, 0, -10)
	
	ply_model:SetCamPos(campos)
	ent:SetEyeTarget(campos)
	
	InfoPanel.Paint = function(self, w, h)
		CYBERNETIC_AUGMENTATIONS.DrawBlur(10)
		local start_text_anim = self.StartTextAnim
		
		surface.SetDrawColor(0,0,0,220)
		surface.DrawRect(0,0,w,h)
		
		-- surface.SetDrawColor(colors.InfoHuman)
		-- surface.SetMaterial(human_png)
		-- surface.DrawTexturedRect(w * 0.5 - h * 0.5,0,h,h)
		
		for slot, pos in next, ui_slot_positions do
			local x, y = w * pos[1], h * pos[2]
			local aug = augs[slot]
			local aug_data = aug and items[slot][aug.id]
			local is_left = slot == 1 or slot == 3
			
			if is_left then x = x - button_w end
			
			local text_w, text_h = draw.SimpleText(slots[slot], "CYBER_AUGS_BoldDescFont", x, y - 5, slot_color, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			if aug_data then
				local data_x, data_y = x + 10 + button_w, y + button_h
				
				if is_left then
					data_x, data_y = x - button_w * 1.5, y + button_h * 0.32
				end
				
				local name_w, name_h = draw.SimpleText(aug_data.Name, "CYBER_AUGS_BoldDescFont", data_x, data_y, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				
				if aug.health then
					local HP = aug.health or 0
					local max = aug_data.Health or 100
					
					local Health = (HP > max and max) or (HP < 0 and 0) or HP
					
					local red = (1 - Health/100)^(1/2) * 255
					local grn = (Health/150)^(1/2) * 255
					local blu = (Health/130)^2 * 255
					
					surface.SetDrawColor(red, grn, blu)
					surface.DrawRect(data_x, data_y - name_h * 0.5, name_w * Health * 0.01, 8)
					
					surface.SetDrawColor(0,0,0)
					surface.DrawOutlinedRect(data_x, data_y - name_h * 0.5, name_w, 8)
				end
			end
			if not IsValid(buttons[slot]) then
				local model = aug and aug_data.Prop
				
				local button = vgui.Create("Cyber_Button", self)
				button:SetSize(button_w, button_h)
				button:SetPos(x, y + text_h)
				button:SetButtonStyle(3)
				if not aug then
					button:SetText("x")
					button:SetFont("CYBER_AUGS_ItemFont")
				else
					button:SetText("")
				end
				button.DoClick = function()
					local menu = DermaMenu() 
					menu:AddOption( CYBER_AUGS_LANGUAGE.AugShow )
					menu:AddSpacer()
					if CYBERNETIC_AUGMENTATIONS.AllowHideAugmentations then 
						menu:AddOption( CYBER_AUGS_LANGUAGE.Hide, function() 
							var_hide(slot, 3, ply_model)
						end )
					end
					if CYBERNETIC_AUGMENTATIONS.AllowCoverAugmentations then
						menu:AddOption( CYBER_AUGS_LANGUAGE.Open, function() 
							var_hide(slot, 0, ply_model)
						end )
						menu:AddOption( CYBER_AUGS_LANGUAGE.Cover, function() 
							var_hide(slot, 2, ply_model)
						end )
						menu:AddOption( CYBER_AUGS_LANGUAGE.HalfCover, function() 
							var_hide(slot, 1, ply_model)
						end )		
					end
					menu:Open()
				end
				
				if model then
					if use_image then
						local icon = vgui.Create( "ModelImage", button )
						icon:StretchToParent( -100, -30, -100, -30 )
						icon:SetModel(model)
						icon:SetPos(2, 2)
						icon:SetSize(button_w - 4, button_h - 4)
						icon:SetMouseInputEnabled( false )
						icon:SetKeyboardInputEnabled( false )

						button.Icon = icon
					else
						local icon = vgui.Create( "Cyber_ModelPanel", button )
						icon:SetModel(model)
						icon:SetPos(2, 2)
						icon:SetSize(button_w - 4, button_h - 4)
						icon:SetMouseInputEnabled( false )
						icon:SetKeyboardInputEnabled( false )
						icon:CenterCam()

						button.Icon = icon
					end
				end
				
				buttons[slot] = button
			end
		end
	end

	CYBER_AUGS_INFO_PANEL = InfoPanel
	
	skin.CloseButton(InfoPanel, w, h, "CYBER_AUGS_BoldBigFont")
end

skin.PaintMenu = function(self, w, h)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations()
	
	CYBERNETIC_AUGMENTATIONS.DrawBlur(8)
	--draw.SimpleText(string.format(CYBER_AUGS_LANGUAGE.Wallet, CYBERNETIC_AUGMENTATIONS.formatMoney(CYBERNETIC_AUGMENTATIONS.GetMoney(CYBER_AUGS_LOCALPLAYER))), "CYBER_AUGS_TitleFont", 25, 25, colors.MainBG, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

	local bar_w = w * 0.135
	for slot, aug in next, augs do
		if slot > 4 then continue end
		
		local pos = ui_slot_positions[slot]
		local x, y = pos[1], pos[2]
		local aug_data = aug and items[slot][aug.id]
		local is_left = slot == 1 or slot == 3
		
		x, y = w * x, h * y - 15
		
		local name_w, name_h = draw.SimpleTextOutlined(aug_data.Name, "CYBER_AUGS_BoldDescFont", x, y - s10, color_white, (is_left and TEXT_ALIGN_RIGHT or TEXT_ALIGN_LEFT), TEXT_ALIGN_TOP, 1, color_black)
		
		if is_left then x = x - bar_w end 
		
		if aug.health then
			local HP = aug.health or 0
			local max = aug_data.Health or 100
			
			local Health = (HP > max and max) or (HP < 0 and 0) or HP
			
			local red = (1 - Health/100)^(1/2) * 255
			local grn = (Health/150)^(1/2) * 255
			local blu = (Health/130)^2 * 255
			
			surface.SetDrawColor(red, grn, blu)
			surface.DrawRect(x, y, bar_w * Health * 0.01, 8)
			
			surface.SetDrawColor(0,0,0)
			surface.DrawOutlinedRect(x, y, bar_w, 8)
		end
	end
end

skin.PaintMenuElements = function(self, w, h)
	local augs = CYBERNETIC_AUGMENTATIONS.GetAugmentations()
	local old_colors = {}
	
	local ply_model = vgui.Create("Cyber_ModelPanel", self)
	ply_model:SetSize(w * 0.5 - 10, h)
	ply_model:SetPos(w * 0.25 + 5, 0)
	ply_model:SetModifable(false, true, false)
	ply_model:SetModel(CYBER_AUGS_LOCALPLAYER:GetModel())
	ply_model:SetupAugmentations(augs)
	
	
	local ent = ply_model.Entity
	local dmodel_augs = ply_model.Augmentations
	
	ent:SetSkin(CYBER_AUGS_LOCALPLAYER:GetSkin())
	
	local eyepos = ent:GetBonePosition(ent:LookupBone("ValveBiped.Bip01_Pelvis"))
	eyepos:Add(Vector(0, 0, 2))
	ply_model:SetLookAt(eyepos)
	
	local campos = eyepos-Vector(-50, 0, -10)
	
	ply_model:SetCamPos(campos)
	ent:SetEyeTarget(campos)
	
	local mixer_w, mixer_h = w * 0.135, h * 0.2
	local price = CYBERNETIC_AUGMENTATIONS.formatMoney(CYBERNETIC_AUGMENTATIONS.PaintPrice)
	
	for i = 1,4 do
		local aug = augs[i]
		
		if not aug then continue end
		
		local pos = ui_slot_positions[i]
		local x, y = pos[1], pos[2]
		local is_left = i == 1 or i == 3
		local aug_hp = aug.health 
		local button_x = w * x - (is_left and (mixer_w * 1.75 + 10) or (-mixer_w - 10))
		local skin_id = aug.skin

		local revoke = vgui.Create("Cyber_Button", self)
		revoke:SetSize(mixer_w * 0.75, s10)
		revoke:SetPos(button_x, h * y)
		revoke:SetButtonStyle((is_left and 6 or 5), colors.MainBG, color_black, colors.ButtonHover, colors.TextColor)
		revoke:SetText(CYBER_AUGS_LANGUAGE.RevokeColor)
		revoke:SetFont("CYBER_AUGS_DialogFont")
		revoke.DoClick = function(self)
			if not old_colors[i] then return end
			
			dmodel_augs[i].Color = old_colors[i]
			old_colors[i] = nil
		end

		local color_mixer = vgui.Create("DColorMixer", self)
		color_mixer:SetSize(mixer_w, mixer_h)
		color_mixer:SetPos(w * x - (is_left and mixer_w or 0), h * y)
		color_mixer.ValueChanged = function(self, col)
			if not old_colors[i] then
				old_colors[i] = dmodel_augs[i].Color
			end
			
			dmodel_augs[i].Color = col
		end
		
		local accept = vgui.Create("Cyber_Button", self)
		accept:SetSize(mixer_w * 0.75, s10)
		accept:SetPos(button_x, h * y + s10 + 5)
		accept:SetButtonStyle((is_left and 6 or 5), colors.MainBG, color_black, colors.ButtonHover, colors.TextColor)
		accept:SetText(CYBER_AUGS_LANGUAGE.AcceptColor)
		accept:SetFont("CYBER_AUGS_DialogFont")
		accept.DoClick = function()
			CYBERNETIC_AUGMENTATIONS.Query( string.format(CYBER_AUGS_LANGUAGE.ColorConfirmation, price), CYBER_AUGS_LANGUAGE.AcceptColor,
 			CYBER_AUGS_LANGUAGE.Yes, function() 
				local clr = color_mixer:GetColor()
				
				net.Start("CYBER_AUGS_PaintAug")
				net.WriteEntity(self.npc)
				net.WriteUInt(i, 4)
				net.WriteColor(Color(clr.r, clr.g, clr.b))
				net.WriteUInt(skin_id, 4)
				net.SendToServer()
			end,
			CYBER_AUGS_LANGUAGE.No )
		end
		
		if aug_hp < 100 then
			local repair_text = string.format(CYBER_AUGS_LANGUAGE.Repair, CYBERNETIC_AUGMENTATIONS.formatMoney(RepairPrice * (100 - aug_hp)))
			
			local repair = vgui.Create("Cyber_Button", self)
			repair:SetSize(mixer_w * 0.75, s10)
			repair:SetPos(button_x, h * y + s10 * 2 + 10)
			repair:SetButtonStyle((is_left and 6 or 5), colors.MainBG, color_black, colors.ButtonHover, colors.TextColor)
			repair:SetText(repair_text)
			repair:SetFont("CYBER_AUGS_DialogFont")
			repair.Think = function(self)
				if aug.health >= 100 then self:Remove() end
			end 
			repair.DoClick = function()
				CYBERNETIC_AUGMENTATIONS.Query( CYBER_AUGS_LANGUAGE.RepairConfirmation, repair_text,
				CYBER_AUGS_LANGUAGE.Yes, function() 
					net.Start("CYBER_AUGS_RepairAug")
					net.WriteEntity(self.npc)
					net.WriteUInt(i, 4)
					net.SendToServer()
				end,
				CYBER_AUGS_LANGUAGE.No )
				surface.PlaySound(UISounds.Click2)
			end
		end
	end
end

local transparent = Color(0,0,0,0)

skin.Dialog = function(w, h, npc, dialog_funcs, cur_stage)
	local npc_name = CYBERNETIC_AUGMENTATIONS.NPCs[npc:GetNPC_ID()].Name
	surface.SetFont("CYBER_AUGS_DialogFont")
	local name_w, name_h = surface.GetTextSize(npc_name)

	npc:SetNoDraw(true)
	
	local bg_frame = vgui.Create("Panel")
	bg_frame:SetSize(w, h)
	bg_frame.Paint = function(s, ww, hh)
		CYBERNETIC_AUGMENTATIONS.DrawBlur(8)
		
		if !IsValid(npc) then s:Remove() return end
		
		cam.Start3D()
			local old_r, old_g, old_b = render.GetColorModulation()
			render.SetColorModulation(1, 1, 1)
				npc:DrawModel()
			render.SetColorModulation(old_r, old_g, old_b)
		cam.End3D()
	end
	bg_frame:SetAlpha(0)
	bg_frame.OnRemove = function()
		npc:SetNoDraw(false)
		
		net.Start("CYBER_AUGS_ExitDialog")
		net.SendToServer()
	end
	bg_frame:AlphaTo(255, 0.2)
	
	local panel = vgui.Create("Panel", bg_frame)
	panel:SetSize(w * 0.6, h * 0.2)
	panel:SetPos(w * 0.2, h * 0.7)
	panel:MakePopup()
	panel.Paint = function(s, ww, hh)
		local cur_q = Dialog[cur_stage].Q
		
		draw.SimpleText(cur_q, "CYBER_AUGS_DialogFont_Blur", ww * 0.5, 5, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		draw.SimpleTextOutlined(cur_q, "CYBER_AUGS_DialogFont", ww * 0.5, 5, colors.MainBG, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
		
		local name_bg_w, name_bg_h, name_bg_x, name_bg_y = ww * 0.5 - name_w - 7, hh * 0.2 - 2, name_w + 14, name_h + 4
		surface.SetDrawColor(ColorAlpha(color_black, 220))
		surface.DrawRect(name_bg_w, name_bg_h, name_bg_x, name_bg_y)
		
		draw.SimpleTextOutlined(npc_name, "CYBER_AUGS_DialogFont", ww * 0.5, hh * 0.2, colors.SecondaryColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, 1, color_black)

		surface.SetDrawColor(colors.SecondaryColor)
		surface.DrawOutlinedRect(name_bg_w, name_bg_h, name_bg_x, name_bg_y)
		surface.DrawRect( 0, 5 + s9, ww, 4)
		
		surface.SetDrawColor(color_black)
		surface.DrawOutlinedRect( 0, 5 + s9, ww, 4)
	end
	
	local wide, tall = panel:GetWide(), panel:GetTall()
	local x, y = wide * 0.5 + 25, tall * 0.2 
	
	for stage, options in next, Dialog do
		for id, text in next, options.A do
			surface.SetFont("CYBER_AUGS_DialogFont")
			local text_w, text_h = surface.GetTextSize(text)
			
			local button = vgui.Create("Cyber_Button", panel)
			button:SetSize(text_w, text_h)
			button:SetPos(x, y)
			button:SetButtonStyle(5, transparent, colors.MainBG, colors.MainBG, colors.TextColor)
			button:SetText("")
			button:SetFont("CYBER_AUGS_DialogFont")
			button.DoClick = function()
				dialog_funcs[cur_stage][id](npc)
				bg_frame:Remove()
				
				surface.PlaySound(UISounds.Click1)
			end
			button.PaintOver = function(s, ww, hh)
				if s:IsHovered() then
					draw.SimpleText(text, "CYBER_AUGS_DialogFont", 2, 0, s:GetTextStyleColor(), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				else
					draw.SimpleTextOutlined(text, "CYBER_AUGS_DialogFont", 2, 0, s:GetTextStyleColor(), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
				end
			end
			y = y + text_h + 5
		end
	end
	
	CYBER_AUGS_DIALOG = bg_frame
end