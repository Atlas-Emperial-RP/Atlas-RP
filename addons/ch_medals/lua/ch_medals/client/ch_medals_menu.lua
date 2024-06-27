function CH_Medals.OpenMedalsMenu( sort, descending )
	local ply = LocalPlayer()

	local GUI_DashboardFrame = vgui.Create( "DFrame" )
	GUI_DashboardFrame:SetTitle( "" )
	GUI_DashboardFrame:SetSize( CH_Medals.ScrW * 0.6, CH_Medals.ScrH * 0.6875 )
	GUI_DashboardFrame:Center()
	GUI_DashboardFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Medals.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )

		surface.DrawOutlinedRect( 0, 0, w, h * 0.059, 1 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Medals.LangString( "Medals Dashboard" ), "CH_Medals_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_DashboardFrame:MakePopup()
	GUI_DashboardFrame:SetDraggable( false )
	GUI_DashboardFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_CloseMenu:SetPos( CH_Medals.ScrW * 0.582, CH_Medals.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( 24, 24 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.Red or color_white )
		surface.SetMaterial( CH_Medals.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Medals.ScrW * 0.0125, CH_Medals.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_DashboardFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_DashboardFrameBtn:SetSize( CH_Medals.ScrW * 0.1, CH_Medals.ScrH * 0.04 )
	GUI_DashboardFrameBtn:SetPos( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.0475 )
	GUI_DashboardFrameBtn:SetText( "" )
	GUI_DashboardFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( CH_Medals.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Medals.Materials.MenuDashboard )
		surface.DrawTexturedRect( w * 0.065, h * 0.2, CH_Medals.ScrW * 0.014065, CH_Medals.ScrH * 0.025 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		draw.SimpleText( CH_Medals.LangString( "Dashboard" ), "CH_Medals_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_DashboardFrameBtn.DoClick = function()
		GUI_DashboardFrame:Remove()
		
		CH_Medals.OpenMedalsMenu( sort, descending )
	end

	local GUI_ManageMedalsFrameBtn = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_ManageMedalsFrameBtn:SetSize( CH_Medals.ScrW * 0.1, CH_Medals.ScrH * 0.04 )
	GUI_ManageMedalsFrameBtn:SetPos( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.095 )
	GUI_ManageMedalsFrameBtn:SetText( "" )
	GUI_ManageMedalsFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Medals.Materials.MenuManageMedals )
		surface.DrawTexturedRect( w * 0.065, h * 0.2, CH_Medals.ScrW * 0.014065, CH_Medals.ScrH * 0.025 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		draw.SimpleText( CH_Medals.LangString( "Medals" ), "CH_Medals_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Medals.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_ManageMedalsFrameBtn.DoClick = function()
		GUI_DashboardFrame:Remove()
		
		CH_Medals.OpenManageMedalsMenu( sort, descending )
	end
	
	-- The dashboard panel
	local GUI_DashboardPanel = vgui.Create( "DPanel", GUI_DashboardFrame )
	GUI_DashboardPanel:SetSize( CH_Medals.ScrW * 0.487, CH_Medals.ScrW * 0.356 )
	GUI_DashboardPanel:SetPos( CH_Medals.ScrW * 0.109, CH_Medals.ScrH * 0.0475 )
	GUI_DashboardPanel.Paint = function( self, w, h )
		-- Background
		surface.SetDrawColor( color_transparent )
		surface.DrawRect( 0, 0, w, h )
		
		-- Top box with info
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.14 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h * 0.14, 1 )
		
		surface.SetFont( "CH_Medals_Font_Size14" )
		local welcome_back = CH_Medals.LangString( "Welcome back" ) ..", ".. ply:Nick()
		local x, y = surface.GetTextSize( welcome_back )

		draw.SimpleText( welcome_back, "CH_Medals_Font_Size14", w * 0.01, h * 0.04, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Medals.Materials.WavingHand )
		surface.DrawTexturedRect( w * 0.01 + ( x + CH_Medals.ScrW * 0.005 ), h * 0.0225, 28, 28 )

		draw.SimpleText( CH_Medals.LangString( "You can see your medals and show/hide them here." ), "CH_Medals_Font_Size9", w * 0.01, h * 0.1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	
	-- Sort buttons
	local GUI_SortByButton = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_SortByButton:SetSize( CH_Medals.ScrW * 0.13, CH_Medals.ScrH * 0.04 )
	GUI_SortByButton:SetPos( CH_Medals.ScrW * 0.109, CH_Medals.ScrH * 0.1425 )
	GUI_SortByButton:SetText( "" )
	GUI_SortByButton.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )

		draw.SimpleText( CH_Medals.LangString( "Sorting by" ) ..": ".. CH_Medals.LangString( sort ), "CH_Medals_Font_Size9", w * 0.04, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_SortByButton.DoClick = function()
		GUI_DashboardFrame:Remove()
		
		if sort == "Name" then
			sort = "Category"
		elseif sort == "Category" then
			sort = "Name"
		end
		
		CH_Medals.OpenMedalsMenu( sort, descending )
	end
	
	local GUI_DescendingSortButton = vgui.Create( "DButton", GUI_DashboardFrame )
	GUI_DescendingSortButton:SetSize( CH_Medals.ScrW * 0.13, CH_Medals.ScrH * 0.04 )
	GUI_DescendingSortButton:SetPos( CH_Medals.ScrW * 0.2425, CH_Medals.ScrH * 0.1425 )
	GUI_DescendingSortButton:SetText( "" )
	GUI_DescendingSortButton.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		local is_descending = descending and CH_Medals.LangString( "Yes" ) or CH_Medals.LangString( "No" )
		draw.SimpleText( CH_Medals.LangString( "Descending" ) ..": ".. is_descending, "CH_Medals_Font_Size9", w * 0.04, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_DescendingSortButton.DoClick = function()
		GUI_DashboardFrame:Remove()
		
		if descending then
			descending = false
		else
			descending = true
		end
		
		CH_Medals.OpenMedalsMenu( sort, descending )
	end
	
	-- The medals
	local GUI_MedalsList = vgui.Create( "DPanelList", GUI_DashboardFrame )
	GUI_MedalsList:SetSize( CH_Medals.ScrW * 0.491, CH_Medals.ScrH * 0.489 )
	GUI_MedalsList:SetPos( CH_Medals.ScrW * 0.109, CH_Medals.ScrH * 0.189 )
	GUI_MedalsList:EnableVerticalScrollbar( true )
	GUI_MedalsList:EnableHorizontal( true )
	GUI_MedalsList:SetSpacing( CH_Medals.ScrW * 0.00417 )
	GUI_MedalsList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
	end
	if ( GUI_MedalsList.VBar ) then
		GUI_MedalsList.VBar.Paint = function( self, w, h ) -- BG
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w * 0.6, h )
		end
		
		GUI_MedalsList.VBar.btnUp.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w * 0.6, h )
		end
		
		GUI_MedalsList.VBar.btnGrip.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Medals.Colors.GMSBlue )
			surface.DrawRect( 0, 0, w * 0.6, h )
		end
		
		GUI_MedalsList.VBar.btnDown.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w * 0.6, h )
		end
	end
	
	-- We have no medals :(
	if not ply.CH_Medals then
		return
	end
	
	--for k, tbl_mdl in ipairs( ply.CH_Medals ) do
	for name, info in SortedPairsByMemberValue( CH_Medals.Medals, sort, descending ) do
		local tbl_mdl = false
		local tbl_mdl_key = nil
		
		for k, v in ipairs( ply.CH_Medals ) do
			if v.Key == name then
				tbl_mdl = v
				tbl_mdl_key = k
			end
		end
		
		if not tbl_mdl then
			continue
		end
		
		local GUI_MedalPanel = vgui.Create( "DPanelList" )
		GUI_MedalPanel:SetSize( CH_Medals.ScrW * 0.2375, CH_Medals.ScrH * 0.1 )
		GUI_MedalPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			-- Draw outline
			surface.SetDrawColor( color_black )
			surface.DrawOutlinedRect( 0, 0, w, h, 1 )
			
			-- Icon
			surface.SetDrawColor( color_white )
			surface.SetMaterial( info.Icon )
			surface.DrawTexturedRect( w * 0.785, h * 0.14, CH_Medals.ScrW * 0.04, CH_Medals.ScrW * 0.04 )
			
			-- Medal name
			local medal_name = info.Name
			local font = "CH_Medals_Font_Size12"
			
			if #medal_name >= 22 then
				font = "CH_Medals_Font_Size10"
			end
			surface.SetFont( font )
			
			local x, y = surface.GetTextSize( medal_name )
			draw.SimpleText( medal_name, font, w * 0.025, h * 0.2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

			-- Category
			if CH_Medals.Config.ShowCategoryInMenu then
				draw.SimpleText( info.Category, "CH_Medals_Font_Size8", w * 0.025 + ( x + CH_Medals.ScrW * 0.003 ), h * 0.23, CH_Medals.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end
			
			-- Description
			local wrapped_desc = CH_Medals.textWrap( info.Description, "CH_Medals_Font_Size8", w * 0.75 )
			draw.DrawText( wrapped_desc, "CH_Medals_Font_Size8", w * 0.025, h * 0.35, color_white, TEXT_ALIGN_LEFT )
		end
		
		local GUI_ShowHideMedal = vgui.Create( "DCheckBox", GUI_MedalPanel )
		GUI_ShowHideMedal:SetSize( CH_Medals.ScrW * 0.009, CH_Medals.ScrW * 0.009 )
		GUI_ShowHideMedal:SetPos( CH_Medals.ScrW * 0.226, CH_Medals.ScrH * 0.075 )
		if tbl_mdl.Display then
			GUI_ShowHideMedal:SetValue( true )
		else
			GUI_ShowHideMedal:SetValue( false )
		end
		GUI_ShowHideMedal.Paint = function( self, w, h )
			if self:GetChecked() then
				surface.SetDrawColor( CH_Medals.Colors.Green )
				surface.SetMaterial( CH_Medals.Materials.CheckmarkIcon )
			else
				surface.SetDrawColor( CH_Medals.Colors.Red )
				surface.SetMaterial( CH_Medals.Materials.CloseIcon )
			end
			surface.DrawTexturedRect( 0, 0, w, h )
		end
		GUI_ShowHideMedal.OnChange = function( self, checked )
			if checked then
				net.Start( "CH_Medals_Net_ShowHideMedal" )
					net.WriteUInt( tbl_mdl_key, 32 )
					net.WriteBool( true )
				net.SendToServer()
			else
				net.Start( "CH_Medals_Net_ShowHideMedal" )
					net.WriteUInt( tbl_mdl_key, 32 )
					net.WriteBool( false )
				net.SendToServer()
			end
		end

		GUI_MedalsList:AddItem( GUI_MedalPanel )
	end
end

--[[
	Open the medals menu from net message
--]]
net.Receive( "CH_Medals_Net_OpenMedalsMenu", function( len, ply )
	CH_Medals.OpenMedalsMenu( "Name", false )
end )

--[[
	MANAGE MEDALS
--]]
function CH_Medals.OpenManageMedalsMenu( sort, descending )
	local ply = LocalPlayer()

	local GUI_ManageMedalFrame = vgui.Create( "DFrame" )
	GUI_ManageMedalFrame:SetTitle( "" )
	GUI_ManageMedalFrame:SetSize( CH_Medals.ScrW * 0.6, CH_Medals.ScrH * 0.6875 )
	GUI_ManageMedalFrame:Center()
	GUI_ManageMedalFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Medals.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.059 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		surface.DrawOutlinedRect( 0, 0, w, h * 0.059, 1 )
		
		-- Draw the top title.
		draw.SimpleText( CH_Medals.LangString( "Medals Dashboard" ), "CH_Medals_Font_Size10", w / 2, h * 0.03, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_ManageMedalFrame:MakePopup()
	GUI_ManageMedalFrame:SetDraggable( false )
	GUI_ManageMedalFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_ManageMedalFrame )
	GUI_CloseMenu:SetPos( CH_Medals.ScrW * 0.582, CH_Medals.ScrH * 0.01 )
	GUI_CloseMenu:SetSize( 24, 24 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.Red or color_white )
		surface.SetMaterial( CH_Medals.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, CH_Medals.ScrW * 0.0125, CH_Medals.ScrH * 0.02223 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_ManageMedalFrame:Remove()
	end
	
	local GUI_DashboardFrameBtn = vgui.Create( "DButton", GUI_ManageMedalFrame )
	GUI_DashboardFrameBtn:SetSize( CH_Medals.ScrW * 0.1, CH_Medals.ScrH * 0.04 )
	GUI_DashboardFrameBtn:SetPos( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.0475 )
	GUI_DashboardFrameBtn:SetText( "" )
	GUI_DashboardFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Medals.Materials.MenuDashboard )
		surface.DrawTexturedRect( w * 0.065, h * 0.2, CH_Medals.ScrW * 0.014065, CH_Medals.ScrH * 0.025 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		draw.SimpleText( CH_Medals.LangString( "Dashboard" ), "CH_Medals_Font_Size9", w * 0.25, h / 2, self:IsHovered() and color_white or CH_Medals.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_DashboardFrameBtn.DoClick = function()
		GUI_ManageMedalFrame:Remove()
		
		CH_Medals.OpenMedalsMenu( sort, descending )
	end

	local GUI_ManageMedalsFrameBtn = vgui.Create( "DButton", GUI_ManageMedalFrame )
	GUI_ManageMedalsFrameBtn:SetSize( CH_Medals.ScrW * 0.1, CH_Medals.ScrH * 0.04 )
	GUI_ManageMedalsFrameBtn:SetPos( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.095 )
	GUI_ManageMedalsFrameBtn:SetText( "" )
	GUI_ManageMedalsFrameBtn.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( CH_Medals.Colors.GMSBlue )
		surface.DrawRect( 0, 0, 2, h )
		
		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Medals.Materials.MenuManageMedals )
		surface.DrawTexturedRect( w * 0.065, h * 0.2, CH_Medals.ScrW * 0.014065, CH_Medals.ScrH * 0.025 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		draw.SimpleText( CH_Medals.LangString( "Medals" ), "CH_Medals_Font_Size9", w * 0.25, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_ManageMedalsFrameBtn.DoClick = function()
		GUI_ManageMedalFrame:Remove()
		
		CH_Medals.OpenManageMedalsMenu( sort, descending )
	end
	
	-- The dashboard panel
	local GUI_DashboardPanel = vgui.Create( "DPanel", GUI_ManageMedalFrame )
	GUI_DashboardPanel:SetSize( CH_Medals.ScrW * 0.487, CH_Medals.ScrW * 0.356 )
	GUI_DashboardPanel:SetPos( CH_Medals.ScrW * 0.109, CH_Medals.ScrH * 0.0475 )
	GUI_DashboardPanel.Paint = function( self, w, h )
		-- Background
		surface.SetDrawColor( color_transparent )
		surface.DrawRect( 0, 0, w, h )
		
		-- Top box with info
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.14 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h * 0.14, 1 )
		
		surface.SetFont( "CH_Medals_Font_Size14" )
		local welcome_back = CH_Medals.LangString( "Welcome back" ) ..", ".. ply:Nick()
		local x, y = surface.GetTextSize( welcome_back )

		draw.SimpleText( welcome_back, "CH_Medals_Font_Size14", w * 0.01, h * 0.04, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		surface.SetDrawColor( color_white )
		surface.SetMaterial( CH_Medals.Materials.WavingHand )
		surface.DrawTexturedRect( w * 0.01 + ( x + CH_Medals.ScrW * 0.005 ), h * 0.0225, 28, 28 )

		draw.SimpleText( CH_Medals.LangString( "View all available medals" ), "CH_Medals_Font_Size9", w * 0.01, h * 0.1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	
	-- Sort buttons
	local GUI_SortByButton = vgui.Create( "DButton", GUI_ManageMedalFrame )
	GUI_SortByButton:SetSize( CH_Medals.ScrW * 0.13, CH_Medals.ScrH * 0.04 )
	GUI_SortByButton:SetPos( CH_Medals.ScrW * 0.109, CH_Medals.ScrH * 0.1425 )
	GUI_SortByButton:SetText( "" )
	GUI_SortByButton.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )

		draw.SimpleText( CH_Medals.LangString( "Sorting by" ) ..": ".. CH_Medals.LangString( sort ), "CH_Medals_Font_Size9", w * 0.05, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_SortByButton.DoClick = function()
		GUI_ManageMedalFrame:Remove()
		
		if sort == "Name" then
			sort = "Category"
		elseif sort == "Category" then
			sort = "Name"
		end
		
		CH_Medals.OpenManageMedalsMenu( sort, descending )
	end
	
	local GUI_DescendingSortButton = vgui.Create( "DButton", GUI_ManageMedalFrame )
	GUI_DescendingSortButton:SetSize( CH_Medals.ScrW * 0.13, CH_Medals.ScrH * 0.04 )
	GUI_DescendingSortButton:SetPos( CH_Medals.ScrW * 0.2425, CH_Medals.ScrH * 0.1425 )
	GUI_DescendingSortButton:SetText( "" )
	GUI_DescendingSortButton.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		local is_descending = descending and CH_Medals.LangString( "Yes" ) or CH_Medals.LangString( "No" )
		draw.SimpleText( CH_Medals.LangString( "Descending" ) ..": ".. is_descending, "CH_Medals_Font_Size9", w * 0.05, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
	GUI_DescendingSortButton.DoClick = function()
		GUI_ManageMedalFrame:Remove()
		
		if descending then
			descending = false
		else
			descending = true
		end
		
		CH_Medals.OpenManageMedalsMenu( sort, descending )
	end
	
	-- The list of medals
	local GUI_MedalsList = vgui.Create( "DPanelList", GUI_ManageMedalFrame )
	GUI_MedalsList:SetSize( CH_Medals.ScrW * 0.491, CH_Medals.ScrH * 0.489 )
	GUI_MedalsList:SetPos( CH_Medals.ScrW * 0.109, CH_Medals.ScrH * 0.189 )
	GUI_MedalsList:EnableVerticalScrollbar( true )
	GUI_MedalsList:EnableHorizontal( true )
	GUI_MedalsList:SetSpacing( CH_Medals.ScrW * 0.00417 )
	GUI_MedalsList.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, color_transparent )
	end
	if ( GUI_MedalsList.VBar ) then
		GUI_MedalsList.VBar.Paint = function( self, w, h ) -- BG
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, CH_Medals.ScrW * 0.00415, h )
		end
		
		GUI_MedalsList.VBar.btnUp.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, CH_Medals.ScrW * 0.00415, h )
		end
		
		GUI_MedalsList.VBar.btnGrip.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Medals.Colors.GMSBlue )
			surface.DrawRect( 0, 0, CH_Medals.ScrW * 0.00415, h )
		end
		
		GUI_MedalsList.VBar.btnDown.Paint = function( self, w, h )
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, CH_Medals.ScrW * 0.00415, h )
		end
	end

	for k, info in SortedPairsByMemberValue( CH_Medals.Medals, sort, descending ) do
		local GUI_MedalPanel = vgui.Create( "DPanelList" )
		GUI_MedalPanel:SetSize( CH_Medals.ScrW * 0.2375, CH_Medals.ScrH * 0.1 )
		GUI_MedalPanel.Paint = function( self, w, h )
			-- Background
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			-- Draw outline
			surface.SetDrawColor( color_black )
			surface.DrawOutlinedRect( 0, 0, w, h, 1 )
			
			-- Icon
			surface.SetDrawColor( color_white )
			surface.SetMaterial( info.Icon )
			surface.DrawTexturedRect( w * 0.785, h * 0.14, CH_Medals.ScrW * 0.04, CH_Medals.ScrW * 0.04 )
			
			-- Medal name
			local medal_name = info.Name
			local font = "CH_Medals_Font_Size12"
			
			if #medal_name >= 22 then
				font = "CH_Medals_Font_Size10"
			end
			surface.SetFont( font )
			
			local x, y = surface.GetTextSize( medal_name )
			draw.SimpleText( medal_name, font, w * 0.025, h * 0.2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

			-- Category
			if CH_Medals.Config.ShowCategoryInMenu then
				draw.SimpleText( info.Category, "CH_Medals_Font_Size8", w * 0.025 + ( x + CH_Medals.ScrW * 0.003 ), h * 0.23, CH_Medals.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			end
			
			-- Description
			local wrapped_desc = CH_Medals.textWrap( info.Description, "CH_Medals_Font_Size8", w * 0.75 )
			draw.DrawText( wrapped_desc, "CH_Medals_Font_Size8", w * 0.025, h * 0.35, color_white, TEXT_ALIGN_LEFT )
		end
		
		if ply:CH_Medals_MedalAuthorized() then
			local GUI_GiveTakeMedal = vgui.Create( "DButton", GUI_MedalPanel )
			GUI_GiveTakeMedal:SetSize( CH_Medals.ScrW * 0.012, CH_Medals.ScrW * 0.012 )
			GUI_GiveTakeMedal:SetPos( CH_Medals.ScrW * 0.224, CH_Medals.ScrH * 0.0725 )
			GUI_GiveTakeMedal:SetText( "" )
			GUI_GiveTakeMedal:SetToolTip( CH_Medals.LangString( "Assign or take this medal from a player." ) )
			GUI_GiveTakeMedal.Paint = function( self, w, h )
				surface.SetDrawColor( color_white )
				surface.SetMaterial( CH_Medals.Materials.PlusIcon )
				surface.DrawTexturedRect( 0, 0, CH_Medals.ScrW * 0.012, CH_Medals.ScrW * 0.012 )
			end
			GUI_GiveTakeMedal.DoClick = function()
				GUI_ManageMedalFrame:Remove()
				
				CH_Medals.GiveTakeMedalMenu( k, sort, descending )
			end
		end
		
		GUI_MedalsList:AddItem( GUI_MedalPanel )
	end
end

--[[
	Give medal menu
--]]
function CH_Medals.GiveTakeMedalMenu( medal_to_give, sort, descending )
	local ply = LocalPlayer()
	if not ply:CH_Medals_MedalAuthorized() then
		return
	end
	
	local medal_info = CH_Medals.Medals[ medal_to_give ]
	local GUI_SelectedPlayer_Text = CH_Medals.LangString( "Select Player" )
	local SelectedPlayer = nil
	
	local GUI_GiveMedalFrame = vgui.Create( "DFrame" )
	GUI_GiveMedalFrame:SetTitle( "" )
	GUI_GiveMedalFrame:SetSize( CH_Medals.ScrW * 0.23, CH_Medals.ScrH * 0.265 )
	GUI_GiveMedalFrame:Center()
	GUI_GiveMedalFrame.Paint = function( self, w, h )
		-- Draw frame
		surface.SetDrawColor( CH_Medals.Colors.GrayFront )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw top
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h * 0.12 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		surface.DrawOutlinedRect( 0, 0, w, h * 0.12, 1 )
		
		-- Draw the top title.
		draw.SimpleText( medal_info.Name .." ".. CH_Medals.LangString( "Medal" ), "CH_Medals_Font_Size9", w / 2, CH_Medals.ScrH * 0.015, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		-- Icon
		surface.SetDrawColor( color_white )
		surface.SetMaterial(  medal_info.Icon )
		surface.DrawTexturedRect( CH_Medals.ScrW * 0.006, h * 0.15, CH_Medals.ScrW * 0.04, CH_Medals.ScrW * 0.04 )
		
		-- Medal name
		local medal_name = medal_info.Name
		local font = "CH_Medals_Font_Size12"
		
		if #medal_name >= 22 then
			font = "CH_Medals_Font_Size10"
		end
		surface.SetFont( font )
		
		local x, y = surface.GetTextSize( medal_name )
		draw.SimpleText( medal_name, font, w * 0.225, h * 0.2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

		-- Category
		if CH_Medals.Config.ShowCategoryInMenu then
			draw.SimpleText( medal_info.Category, "CH_Medals_Font_Size8", w * 0.225 + ( x + CH_Medals.ScrW * 0.003 ), h * 0.21, CH_Medals.Colors.WhiteAlpha2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end
		
		-- Description
		local wrapped_desc = CH_Medals.textWrap( medal_info.Description, "CH_Medals_Font_Size8", w * 0.75 )
		draw.DrawText( wrapped_desc, "CH_Medals_Font_Size8", w * 0.225, h * 0.25, color_white, TEXT_ALIGN_LEFT )
		
		-- Left Text Entry BG
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.1675, CH_Medals.ScrW * 0.221, CH_Medals.ScrH * 0.04 )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.1675, CH_Medals.ScrW * 0.221, CH_Medals.ScrH * 0.04, 1 )
	end
	GUI_GiveMedalFrame:MakePopup()
	GUI_GiveMedalFrame:SetDraggable( false )
	GUI_GiveMedalFrame:ShowCloseButton( false )
	
	local GUI_CloseMenu = vgui.Create( "DButton", GUI_GiveMedalFrame )
	GUI_CloseMenu:SetPos( CH_Medals.ScrW * 0.2175, CH_Medals.ScrH * 0.0085 )
	GUI_CloseMenu:SetSize( 16, 16 )
	GUI_CloseMenu:SetText( "" )
	GUI_CloseMenu.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.Red or color_white )
		surface.SetMaterial( CH_Medals.Materials.CloseIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_CloseMenu.DoClick = function()
		GUI_GiveMedalFrame:Remove()
	end
	
	local GUI_GoBack = vgui.Create( "DButton", GUI_GiveMedalFrame )
	GUI_GoBack:SetPos( CH_Medals.ScrW * 0.205, CH_Medals.ScrH * 0.0085 )
	GUI_GoBack:SetSize( 16, 16 )
	GUI_GoBack:SetText( "" )
	GUI_GoBack.Paint = function( self, w, h )
		surface.SetDrawColor( self:IsHovered() and CH_Medals.Colors.GMSBlue or color_white )
		surface.SetMaterial( CH_Medals.Materials.BackIcon )
		surface.DrawTexturedRect( 0, 0, 16, 16 )
	end
	GUI_GoBack.DoClick = function()
		CH_Medals.OpenManageMedalsMenu( sort, descending )
		
		GUI_GiveMedalFrame:Remove()
	end
	
	local GUI_TextField = vgui.Create( "DTextEntry", GUI_GiveMedalFrame )
	GUI_TextField:SetPos( CH_Medals.ScrW * 0.006, CH_Medals.ScrH * 0.1675 )
	GUI_TextField:SetSize( CH_Medals.ScrW * 0.221, CH_Medals.ScrH * 0.04 ) 
	GUI_TextField:SetFont( "CH_Medals_Font_Size10" )
	GUI_TextField:SetTextColor( color_white )
	GUI_TextField:SetPlaceholderText( CH_Medals.LangString( "Select player or enter SteamID64" ) )
	GUI_TextField:SetAllowNonAsciiCharacters( false ) -- When allowing non-ASCII characters, a small box appears inside the text entry, indicating your keyboard's current language.  That makes the user unable to input some letters from German, French, Swedish, etc. alphabet. 
	GUI_TextField:SetMultiline( false )
	GUI_TextField:SetNumeric( true )
	GUI_TextField:SetDrawBackground( false )
	
	local GUI_SelectPlayer = vgui.Create( "DComboBox", GUI_GiveMedalFrame )
	GUI_SelectPlayer:SetSize( CH_Medals.ScrW * 0.221, CH_Medals.ScrH * 0.04 )
	GUI_SelectPlayer:SetPos( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.1185 )
	GUI_SelectPlayer:SetValue( "" )
	GUI_SelectPlayer.OnSelect = function( index, text, data )
		GUI_SelectedPlayer_Text = data
		GUI_SelectPlayer:SetValue( "" )
		
		-- Update the selected player by their nick
		for k, v in ipairs( player.GetAll() ) do
			if v:Nick() == GUI_SelectedPlayer_Text then
				SelectedPlayer = v
				GUI_TextField:SetValue( v:SteamID64() )
				
				break
			end
		end
	end
	for k, v in ipairs( player.GetAll() ) do
		--if ply != v then
			GUI_SelectPlayer:AddChoice( v:Nick() )
		--end
	end
	GUI_SelectPlayer.Paint = function( self, w, h )
		surface.SetDrawColor( CH_Medals.Colors.GrayBG )
		surface.DrawRect( 0, 0, w, h )
		
		-- Draw outline
		surface.SetDrawColor( color_black )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		
		draw.SimpleText( GUI_SelectedPlayer_Text, "CH_Medals_Font_Size8", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	
	local GUI_GiveMedalBtn = vgui.Create( "DButton", GUI_GiveMedalFrame )
	GUI_GiveMedalBtn:SetSize( CH_Medals.ScrW * 0.1075, CH_Medals.ScrH * 0.04 )
	GUI_GiveMedalBtn:SetPos( CH_Medals.ScrW * 0.005, CH_Medals.ScrH * 0.2165 )
	GUI_GiveMedalBtn:SetText( "" )
	GUI_GiveMedalBtn.Paint = function( self, w, h )
		if self:IsHovered() then
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
		
			surface.SetDrawColor( ( GUI_SelectedPlayer_Text != CH_Medals.LangString( "Select Player" ) or #GUI_TextField:GetValue() == 17 ) and CH_Medals.Colors.Green or CH_Medals.Colors.Red )
			surface.DrawRect( 0, 0, w, 1 )
			surface.DrawRect( 0, h-1, w, 1 )
			surface.DrawRect( w-1, 0, 1, h )
			surface.DrawRect( 0, 0, 1, h )
		else
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			surface.SetDrawColor( ( GUI_SelectedPlayer_Text != CH_Medals.LangString( "Select Player" ) or #GUI_TextField:GetValue() == 17 ) and CH_Medals.Colors.Green or CH_Medals.Colors.Red )
			surface.DrawRect( 0, 0, 1, 10 )
			surface.DrawRect( 0, 0, 10, 1 )
			surface.DrawRect( 0, h-10, 1, 10 )
			surface.DrawRect( 0, h-1, 10, 1 )
			surface.DrawRect( w-1, 0, 1, 10 )
			surface.DrawRect( w-10, 0, 10, 1 )
			surface.DrawRect( w-1, h-10, 1, 10 )
			surface.DrawRect( w-10, h-1, 10, 1 )
		end
		
		draw.SimpleText( CH_Medals.LangString( "Give Medal" ), "CH_Medals_Font_Size8", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_GiveMedalBtn.DoClick = function()		
		if not SelectedPlayer and #GUI_TextField:GetValue() != 17 then
			return
		end

		net.Start( "CH_Medals_Net_GiveMedal" )
			net.WriteString( GUI_TextField:GetValue() )
			net.WriteString( medal_to_give )
		net.SendToServer()
		
		GUI_GiveMedalFrame:Remove()
	end
	
	local GUI_TakeMedalBtn = vgui.Create( "DButton", GUI_GiveMedalFrame )
	GUI_TakeMedalBtn:SetSize( CH_Medals.ScrW * 0.1085, CH_Medals.ScrH * 0.04 )
	GUI_TakeMedalBtn:SetPos( CH_Medals.ScrW * 0.1175, CH_Medals.ScrH * 0.2165 )
	GUI_TakeMedalBtn:SetText( "" )
	GUI_TakeMedalBtn.Paint = function( self, w, h )
		if self:IsHovered() then
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
		
			surface.SetDrawColor( ( GUI_SelectedPlayer_Text != CH_Medals.LangString( "Select Player" ) or #GUI_TextField:GetValue() == 17 ) and CH_Medals.Colors.Green or CH_Medals.Colors.Red )
			surface.DrawRect( 0, 0, w, 1 )
			surface.DrawRect( 0, h-1, w, 1 )
			surface.DrawRect( w-1, 0, 1, h )
			surface.DrawRect( 0, 0, 1, h )
		else
			surface.SetDrawColor( CH_Medals.Colors.GrayBG )
			surface.DrawRect( 0, 0, w, h )
			
			surface.SetDrawColor( ( GUI_SelectedPlayer_Text != CH_Medals.LangString( "Select Player" ) or #GUI_TextField:GetValue() == 17 ) and CH_Medals.Colors.Green or CH_Medals.Colors.Red )
			surface.DrawRect( 0, 0, 1, 10 )
			surface.DrawRect( 0, 0, 10, 1 )
			surface.DrawRect( 0, h-10, 1, 10 )
			surface.DrawRect( 0, h-1, 10, 1 )
			surface.DrawRect( w-1, 0, 1, 10 )
			surface.DrawRect( w-10, 0, 10, 1 )
			surface.DrawRect( w-1, h-10, 1, 10 )
			surface.DrawRect( w-10, h-1, 10, 1 )
		end
		
		draw.SimpleText( CH_Medals.LangString( "Take Medal" ), "CH_Medals_Font_Size8", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	GUI_TakeMedalBtn.DoClick = function()		
		if not SelectedPlayer and #GUI_TextField:GetValue() != 17 then
			return
		end

		net.Start( "CH_Medals_Net_TakeMedal" )
			net.WriteString( GUI_TextField:GetValue() )
			net.WriteString( medal_to_give )
		net.SendToServer()
		
		GUI_GiveMedalFrame:Remove()
	end
end