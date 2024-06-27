local PANEL_META = FindMetaTable("Panel")

local clamp = math.Clamp
local sin = math.sin
local TimeFraction = math.TimeFraction
local random = math.random

function PANEL_META:eSetHoverPanel(generate_panel,preserve)
	if not isfunction(generate_panel) then return end

	local pnl = self

	local oldfunc
	if not self.eHasHoverPanel then 
		oldfunc = self.OnCursorEntered
	end
    function self:OnCursorEntered()
    	if isfunction(oldfunc) then oldfunc(self) end
    	local generated_pnl = generate_panel(self)
    	if not generated_pnl then return end
    	if not IsValid(generated_pnl) then return end
    	generated_pnl:SetMouseInputEnabled(false)
    	generated_pnl:SetAlpha(0)
    	generated_pnl:AlphaTo(255,0.1)

    	local oldthink = generated_pnl.Think
    	self.eHoverPanel = generated_pnl
    	self.eHasHoverPanel = true
    	function generated_pnl:Think()
    		if isfunction(oldthink) then oldthink(self) end
    		if not IsValid(pnl) then
    			if IsValid(generated_pnl) then generated_pnl:Remove() end
    			return 
    		end
    		if not pnl:IsHovered() then
	    		if preserve then
	    			self:Hide()
	    		else
	    			self:Remove()
	    		end
    		end
    	end
    end

    if not self.eHasHoverPanel then 
    	oldfunc = self.OnCursorExited
    end
    function self:OnCursorExited()
    	if isfunction(oldfunc) then oldfunc(self) end
    	if not self.eHoverPanel then return end
    	if IsValid(self.eHoverPanel) then
    		if preserve then
    			self.eHoverPanel:Hide()
    		else
    			self.eHoverPanel:Remove()
    		end
    	end
    end
end
-- --example
-- local pnl = vgui.Create("DPanel")
-- pnl:eSetHoverPanel(function(prnt)
-- 	local pnl = vgui.Create("DPanel")
-- 	pnl:SetSize(200,200)
-- 	return pnl
-- end)

--align uses TEXT_ALIGN ENUM but TEXT_ALIGN_CENTER uses mouse pos
function PANEL_META:eAddHint(text,font,align,parent_panel)
	local skin = esclib.addon:GetCurrentSkin()
	local clr = skin.colors

	local font = font or "es_esclib_20_500"
	local align = align or TEXT_ALIGN_CENTER

	local maxwidth = esclib.scrw*0.3
	local multiline = esclib.text:Multiline(text,font,maxwidth)
	local width = multiline.width+40
	local height = multiline.height+10

	self:eSetHoverPanel(function(hovered_panel)
		local pnl = vgui.Create("DPanel",parent_panel)
		pnl:SetSize(width,height)
		local scrw = esclib.scrw
		local scrh = esclib.scrh

		local posx = 0
		local posy = 0
		function pnl:Think()
			if not IsValid(hovered_panel) then
				self:Remove()
				return
			end
			if parent_panel and IsValid(parent_panel) then
				posx, posy = hovered_panel:LocalToScreen(0,0)
			end

			local x,y  = 0,0
			if (align == TEXT_ALIGN_RIGHT) then
				x = posx+hovered_panel:GetWide()+5
				y = posy+hovered_panel:GetTall()*0.5 - self:GetTall()*0.5
			elseif (align == TEXT_ALIGN_LEFT) then
				x = posx-self:GetWide()-5
				y = posy+hovered_panel:GetTall()*0.5 - self:GetTall()*0.5
			elseif (align == TEXT_ALIGN_TOP) then
				x = posx+hovered_panel:GetWide()*0.5-self:GetWide()*0.5
				y =posy - self:GetTall()-5
			elseif (align == TEXT_ALIGN_BOTTOM) then
				x = posx+hovered_panel:GetWide()*0.5-self:GetWide()*0.5 
				y = posy + hovered_panel:GetTall()+5
			else
				local mx,my = gui.MouseX(), gui.MouseY()
				if parent_panel and IsValid(parent_panel) then
					mx,my = parent_panel:ScreenToLocal(mx,my)
					-- scrw = parent_panel:GetWide()
					-- scrh = parent_panel:GetTall()
				end

				x = mx+5
				y = my+5
			end

			x = clamp(x, 0, scrw-self:GetWide())
			y = clamp(y, 0, scrh-self:GetTall())
			self:SetPos(x,y)
		end

		function pnl:Paint(w,h)
			draw.RoundedBox(8, 0,0, w,h, clr.hint.bg)
			esclib.draw:MaterialCentered(h*0.3, h*0.3, h*0.7, clr.button.main, esclib.Materials["info.png"])
			esclib.text:DrawMultiline(multiline,20,5,clr.hint.text,TEXT_ALIGN_LEFT)
		end

		return pnl
	end,true)
end


---------------------
--# QUICK WINDOWS #--
---------------------
function esclib:GenerateBGClicker(key_input)
	local clr = esclib.addon:GetColors()

	local scrw,scrh = esclib.scrw,esclib.scrh
	local bg = vgui.Create("EditablePanel")
	bg:SetSize(scrw,scrh)
	bg:MakePopup()
	bg:SetKeyboardInputEnabled(key_input or false)
	bg:SetAlpha(0)
	bg:AlphaTo(255,0.1)
	bg:SetZPos(102)
	function bg:Paint(w,h)
		draw.RoundedBox(0, 0,0,w,h, clr.background.col)
	end

	function bg:Close()
		if self.OnClose then self:OnClose() end
		self:AlphaTo(0,esclib.addon:GetVar("animtime"),0,function()
			self:Remove()
		end)
	end

	function bg:OnMousePressed(key)
		self:Close()
	end

	function bg:OnKeyCodePressed(key)
		if (key == KEY_F4) or (key == KEY_ESCAPE) then
			self:Close()
		end
	end

	return bg
end



function esclib:GeneratePopWindow(key_input)
	self.ready2close = false

	local clr = esclib.addon:GetColors()

	local scrw,scrh = esclib.scrw,esclib.scrh
	local bg = self:GenerateBGClicker(key_input)

	local pnl = vgui.Create("esclib.frame",bg)
	pnl.bg = bg
	pnl:SetSize(scrw*0.3, scrh*0.2)
	pnl:Center()
	function pnl:OnRemove()
		bg:Remove()
	end

	function pnl:Close()
		bg:Close()
	end
	
	return pnl
end



function esclib:TextInputWindow(title, text, numeric, callback, custom_check, try_language)
	local wide = esclib.scrw*0.35
	local tall = 0
	local pnl = self:GeneratePopWindow()
	pnl:SetTitle(title)
	pnl:SetSize(wide,esclib.scrh*0.3)
	pnl:Center()
	pnl:SetRoundSize(0)
	local content = pnl:GetContent()

	local font = esclib:AdaptiveFont("esclib", 20, 500)
	local multiline_data = esclib.text:Multiline(text, font, wide)

	local clr = esclib.addon:GetColors()

	local lbl = content:Add("DPanel")
	lbl:SetSize(wide,multiline_data.height+5)
	lbl:Dock(TOP)
	lbl:DockMargin(0,10,0,0)
	function lbl:Paint(w,h)
		esclib.text:DrawMultiline(multiline_data, w*0.5, 0, clr.frame.text, TEXT_ALIGN_CENTER)
	end
	tall = tall +lbl:GetTall()+20

	local textinput = content:Add("DTextEntry")
	local offset = 10
	textinput:SetSize(wide-offset*2,40)
	textinput:Dock(TOP)
	textinput:DockMargin(10,5,10,5)
	-- textinput:SetX(wide*0.5 - textinput:GetWide()*0.5)
	-- textinput:CenterVertical(0.45)
	textinput:SetFont(font)
	textinput:SetTextColor(clr.frame.text)

	tall = tall + textinput:GetTall()+10

	if numeric then 
		textinput:SetPlaceholderText( "500" )
		textinput:SetNumeric(true)
		function textinput:AllowInput(str)
			local disallow = true
			local text = self:GetText()

			if (string.find(str,"%d")) or (str==".") then
				if string.find(text,"%.") then return str=="." end

				disallow = false
			end

			return disallow
		end
	end

	function textinput:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,clr.frame.accent)

		local textcol = self:GetTextColor()
		self:DrawTextEntryText( textcol, clr.frame.text_hover, textcol )
	end

	function textinput:OnGetFocus()
		pnl.bg:SetKeyboardInputEnabled(true)
	end

	function textinput:OnLoseFocus()
		pnl.bg:SetKeyboardInputEnabled(false)
	end

	function textinput:Shake()
		local x = self:GetX()
		local copy_clr = table.Copy(self:GetTextColor())
		local anim = self:NewAnimation( 0.2, 0, -1, function( anim, pnl )
			self:SetX(x)
			self:SetTextColor(copy_clr)
		end )

		anim.Think = function( anim, pnl, fraction )
			local sin_v = sin(Lerp( fraction, -math.pi, math.pi ))
			copy_clr.g = clamp(copy_clr.g + sin_v*50, 0, 255)
			copy_clr.b = clamp(copy_clr.b + sin_v*50, 0, 255)
			pnl:SetTextColor(copy_clr)
			pnl:SetPos( x + sin_v*10, pnl:GetY() )
		end
	end

	function textinput:OnEnter(text)
		if isfunction(custom_check) then
			local custom_check = custom_check(text)

			if custom_check then
				-- lbl.text = custom_check
				local x, y = self:GetPos()
				self:Shake()
				return
			end
		end
		if numeric then
			callback(self:GetFloat() or 0)
		else
			callback(text)
		end
		pnl:Close()
	end

	local buttonlist = content:Add("DPanel")
	buttonlist:SetSize(content:GetWide(), content:GetTall()*0.18)
	buttonlist:Dock(TOP)
	buttonlist:DockMargin(0,10,0,10)
	-- buttonlist:SetY(content:GetTall()-buttonlist:GetTall()-offset)
	buttonlist.Paint = nil

	tall = tall + content:GetTall()*0.18 + 40

	local border = 25
	local revert = buttonlist:Add("DButton")
	revert:SetText("")
	revert:SetSize( buttonlist:GetWide()*0.5-border*2,buttonlist:GetTall() )
	revert:SetX(border)
	local hovcol = clr.button.discard
	function revert:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,self:IsHovered() and hovcol or clr.button.discard_hover)
		draw.SimpleText(esclib.addon:Translate("button_Discard",try_language),"es_esclib_20_500",w*0.5,h*0.5,clr.default.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	function revert:DoClick()
		pnl:Close()
	end

	local confirm = buttonlist:Add("DButton")
	confirm:SetSize(revert:GetWide(),revert:GetTall())
	confirm:SetX(revert:GetX() + revert:GetWide() + border*2)
	confirm:SetText("")
	local hovcol = clr.button.apply_hover
	function confirm:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,self:IsHovered() and hovcol or clr.button.apply)
		draw.SimpleText(esclib.addon:Translate("button_Confirm",try_language),"es_esclib_20_500",w*0.5,h*0.5,clr.default.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	function confirm:DoClick()
		textinput:OnEnter(textinput:GetText())
	end

	pnl:SetTall(tall)

	return textinput
end



function esclib:ConfirmWindow(title, text, callback)
	local pnl = self:GeneratePopWindow(true)
	pnl:SetTitle(title)
	pnl:SetSize(400,125)
	pnl:Center()
	pnl:SetRoundSize(0)
	local content = pnl:GetContent()

	function pnl:OnRemove()
		callback(false)
	end

	local clr = esclib.addon:GetColors()

	local lbl = content:Add("DPanel")
	lbl:SetSize(content:GetWide(),content:GetTall()*0.5)
	function lbl:Paint(w,h)
		draw.SimpleText(text,"es_esclib_24_500",w*0.5,h*0.5,clr.frame.text,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end

	local buttonlist = content:Add("DPanel")
	buttonlist:SetSize(content:GetWide(), content:GetTall()*0.4)
	buttonlist:SetY(content:GetTall()-buttonlist:GetTall()-10)
	buttonlist.Paint = nil

	local border = 25

	local revert = buttonlist:Add("DButton")
	revert:SetText("")
	revert:SetSize( buttonlist:GetWide()*0.5-border*2,buttonlist:GetTall() )
	revert:SetX(border)
	local hovcol = clr.button.discard
	function revert:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,self:IsHovered() and hovcol or clr.button.discard_hover)
		draw.SimpleText(esclib.addon:Translate("button_Discard"),"es_esclib_20_500",w*0.5,h*0.5,clr.default.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	function revert:DoClick()
		callback(false)
		pnl:Close()
	end

	local confirm = buttonlist:Add("DButton")
	confirm:SetSize(revert:GetWide(),revert:GetTall())
	confirm:SetX(revert:GetX() + revert:GetWide() + border*2)
	confirm:SetText("")
	local hovcol = clr.button.apply_hover
	function confirm:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,self:IsHovered() and hovcol or clr.button.apply)
		draw.SimpleText(esclib.addon:Translate("button_Confirm"),"es_esclib_20_500",w*0.5,h*0.5,clr.default.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	function confirm:DoClick()
		callback(true)
		pnl:Close()
	end
end


--sel_count - bool or number | if false then only 1 can be selected
--selected - already selected values or value
function esclib:ChoiceMenu(title,items,max_selections,item_paint,callback,custom_filter,need_search,selected_values)
	local items_list
	if not istable(items) then 
		if isfunction(items) then
			items_list = items()
		end
	else
		items_list = items
	end

	if items_list then
		if not istable(items_list) then return end
	else
		return
	end

	local items_list = table.Copy(items)
	if table.IsEmpty(items_list) then callback() return end
	
	local clr = esclib.addon:GetColors()
	local ply = LocalPlayer()

	local pnl = self:GeneratePopWindow()
	pnl:SetSize(esclib.scrw*0.4,esclib.scrh*0.9)
	pnl:Center()
	pnl:SetRoundSize(16)
	local content = pnl:GetContent()

	local top_bar = content:Add("DPanel")
	if need_search ~= false then
		top_bar:SetSize(content:GetWide(),content:GetTall()*0.05)
		top_bar:SetY(10)
	else
		top_bar:SetHeight(0)
		top_bar:Hide()
	end

	local textinput = top_bar:Add("DTextEntry")
	local offset = esclib.util.GetTextSize(esclib.addon:Translate("phrase_Search"),"es_esclib_20_500").w + 25
	textinput:SetSize(top_bar:GetWide()-offset-10,top_bar:GetTall())
	textinput:SetX(offset)
	textinput:CenterVertical(0.45)
	textinput:SetFont("es_esclib_20_500")
	textinput:SetTextColor(clr.frame.text)

	function textinput:OnGetFocus()
		pnl.bg:SetKeyboardInputEnabled(true)
	end

	function textinput:OnLoseFocus()
		pnl.bg:SetKeyboardInputEnabled(false)
	end


	function top_bar:Paint(w,h)
		draw.SimpleText(esclib.addon:Translate("phrase_Search")..":","es_esclib_20_500", 10, h*0.5-2,clr.frame.text,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

	function textinput:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,clr.frame.accent)

		local textcol = self:GetTextColor()
		self:DrawTextEntryText( textcol, clr.frame.text_hover, textcol )
	end

	local selected
	local max_values = 1

	if isnumber(max_selections) and max_selections ~= 1 then
		max_values = max_selections
		max_selections = true
	else
		max_selections = false
		max_values = 1
	end

	local bot_bar = content:Add("DPanel")
	bot_bar:SetSize(content:GetWide(),content:GetTall()*0.07)
	bot_bar:SetY(content:GetTall()-bot_bar:GetTall())
	function bot_bar:Paint(w,h)
		draw.RoundedBoxEx(16,0,0,w,h,clr.frame.accent,false,false,true,true)
	end
	if not max_selections then
		bot_bar:Hide()
	end

	local scroll = content:Add("esclib.scrollpanel")
	scroll:SetY(top_bar:GetY()+top_bar:GetTall()+5)
	scroll:SetSize(content:GetWide(),content:GetTall()-top_bar:GetTall()-bot_bar:GetTall()-20)

	local list = scroll:Add("DIconLayout")
	list:SetY(5)
	list:SetSize(content:GetWide(),content:GetTall()-10)
	list:SetSpaceY(5)

	
	local cur_count = 0
	if max_selections then
		selected = istable(selected_values) and table.Copy(selected_values) or {}
		cur_count = table.Count(selected)
	else
		selected = selected_values and selected_values or nil
	end

	local function UpdateTitle()
		pnl:SetTitle(("(%d/%d) "):format(cur_count, max_values)..title)
	end
	UpdateTitle()


	function list:eClear()
		for k,v in ipairs(self:GetChildren()) do
			v:Remove()
		end
	end

	local border = 50
	local revert = bot_bar:Add("DButton")
	revert:SetText("")
	revert:SetSize( bot_bar:GetWide()*0.5-border*2,bot_bar:GetTall()*0.7 )
	revert:SetX(border)
	revert:CenterVertical()
	local hovcol = clr.button.discard
	function revert:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,self:IsHovered() and hovcol or clr.button.discard_hover)
		draw.SimpleText(esclib.addon:Translate("button_Discard"),"es_esclib_20_500",w*0.5,h*0.5,clr.default.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	function revert:DoClick()
		callback()
		pnl:Close()
	end

	local confirm = bot_bar:Add("DButton")
	confirm:SetSize(revert:GetWide(),revert:GetTall())
	confirm:SetX(revert:GetX() + revert:GetWide() + border*2)
	confirm:SetText("")
	confirm:CenterVertical()
	local hovcol = clr.button.apply_hover
	function confirm:Paint(w,h)
		draw.RoundedBox(16,0,0,w,h,self:IsHovered() and hovcol or clr.button.apply)
		draw.SimpleText(esclib.addon:Translate("button_Confirm"),"es_esclib_20_500",w*0.5,h*0.5,clr.default.black,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	function confirm:DoClick()
		if istable(selected) then
			if table.IsEmpty(selected) then
				selected = nil
			else
				selected = table.ClearKeys(selected)
			end
		end

		callback(selected)
		pnl:Close()
	end

	local function Update()
		local filter = string.lower(textinput:GetValue())


		local has_results = false
		for k,name in ipairs(items_list) do
			if custom_filter then
				if isfunction(custom_filter) then
					if not custom_filter(name,(filter or "")) then continue end
				end
			else
				if type(name) == "string" then
					if (not string.find(string.lower(name),filter)) then continue end
				end
			end

			local player_panel = list:Add("DButton")
			player_panel:SetSize(scroll:GetWide(),scroll:GetTall()*0.07)
			player_panel:SetText("")

			function player_panel:Paint(w,h)
				local active
				if max_selections then 
					active = selected[name] 
				else
					active = (selected == name)
				end

				if item_paint then
					if isfunction(item_paint) then item_paint(self, w,h, name, active) end
				else
					local hovered = self:IsHovered()

					draw.RoundedBox(0,0,0,w,h,hovered and clr.button.hover or clr.button.main)
					if active then
						draw.RoundedBox(0,0,0,5,h,clr.button.apply)
					end

					draw.SimpleText(name,"es_esclib_24_500",w*0.5,h*0.5,hovered and clr.button.text_hover or clr.button.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			end
			function player_panel:DoClick()
				if max_selections then
					if selected[name] then 
						selected[name] = nil
						cur_count = cur_count - 1
						UpdateTitle()
						return 
					end
					
					if cur_count < max_values then
						selected[name] = name
						cur_count = cur_count + 1
					end
				else
					selected = name
					cur_count = 1
					confirm:DoClick()
				end

				UpdateTitle()
			end
			has_results = true
		end

		if not has_results then
			local player_panel = list:Add("DPanel")
			player_panel:SetSize(scroll:GetWide(),scroll:GetTall()*0.07)
			player_panel:SetText("")

			function player_panel:Paint(w,h)
				-- draw.RoundedBox(0,0,0,w,h,clr.button.main)

				draw.SimpleText(esclib.addon:Translate("phrase_NoResults"),"es_esclib_24_500",w*0.5,h*0.5,hovered and clr.button.text_hover or clr.button.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

			return
		end

	end

	Update()

	function textinput:OnChange()
		list:eClear()
		Update()
	end
end

function esclib:PlayerSelectWindow(title,multi,hide_self,callback,custom_filter)
	local player_list = player.GetAll()
	table.sort(player_list, function(a,b) return a:Nick() < b:Nick() end)

	local filter_func = function(ply,filter)
		if not IsValid(ply) then return false end
		if hide_self then 
			if ply:Name() == LocalPlayer():Name() then return false end
		end

		local res = false

		if ply.Name then
			res = string.find(string.lower(ply:Name()),filter)
		else
			res = (filter == "")
		end

		if custom_filter then
			if isfunction(custom_filter) then
				if not custom_filter(ply) then res = false end
			end
		end

		return res
	end

	local player_paint = function(self,w,h,ply,active)
		local hovered = self:IsHovered()
		local clr = esclib.addon:GetColors()

		draw.RoundedBox(0,0,0,w,h,hovered and clr.button.hover or clr.button.main)
		if active then
			draw.RoundedBox(0,0,0,5,h,clr.button.apply)
		end

		draw.SimpleText(ply:Name(),"es_esclib_24_500",15,h*0.5,hovered and clr.button.text_hover or clr.button.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		if DarkRP then
			local jobclr = team.GetColor(ply:Team()) or color_white
			draw.SimpleText(ply:getDarkRPVar("job"),"es_esclib_24_500",w-15,h*0.5,jobclr, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		end
	end

	local return_result = function(result)
		callback(result)
	end

	-- function esclib:ChoiceMenu(title,items,max_selections,item_paint,callback,custom_filter,need_search, selected_values)
	esclib:ChoiceMenu(title, player_list, multi, player_paint, return_result, filter_func, true)
end

--https://github.com/Be1zebub/Small-GLua-Things/blob/54ce959d8375c1c94d077f7ed1a94095b7ed62d0/ui_animations.lua
function esclib:NewAnimation(length, delay, ease, onend, think_fn)
    ease = ease or -1
    delay = delay or 0

    local systime = SysTime()
    local starttime, endtime = systime + delay, systime + delay + length
    local h_name = "esclib.animation."..starttime.."." ..endtime.."."..random(-1000,1000)
    local fraction, frac

    hook.Add("Think", h_name, function()
        systime = SysTime()
        if starttime > systime then return end

        fraction = clamp(TimeFraction(starttime, endtime, systime), 0, 1)

        if ease < 0 then
            frac = fraction ^ (1 - fraction - 0.5)
        elseif ease > 0 and ease < 1 then
            frac = 1 - (1 - fraction) ^ (1 / ease)
        end

        if fraction == 1 or think_fn(frac) then
            if onend then onend() end
            hook.Remove("Think", h_name)
        end
    end)
    
    return function()
		if onend then onend() end
    	hook.Remove("Think", h_name)
    end
end