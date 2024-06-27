--[[
	Display the medals of all players above their heads when they're close enough
	-- 76561198165273585
--]]
function CH_Medals.DrawMedals3D2D( target )
	local ply = LocalPlayer()
	local OurPos = ply:GetPos() + Vector( 0, 0, 65 )
	
	if ply == target then return end
    if not IsValid( ply ) or not ply:Alive() or not IsValid( target ) or not target:Alive() then return end
    if target:GetColor().a == "0" then return end
    if ply:GetPos():DistToSqr( target:GetPos() ) > CH_Medals.Config.DrawDistance3D2D then return end
	
	local target_medals = target.CH_Medals
	if not target_medals then return end
	
	local pos = target:GetPos() + Vector( 0, 0, target:OBBMaxs().z * 1.15 ) 
    local ang = Angle( 0, ply:EyeAngles().y - 90, 90 )
	
	local icon_size_y = CH_Medals.Config.Medal3D2DSizeY
	local icon_size_x = CH_Medals.Config.Medal3D2DSizeX
	local w_to_add = icon_size_x * CH_Medals.Config.Medal3D2DIconSpacing
	local TPos = target:GetPos() + Vector( 0, 0, 65 )
	local Distance = TPos:Distance( OurPos )
	local clam = math.Clamp( Distance, 0, 255 )
	local main = ( 255 - clam / 1.7 )
	
	-- y pos
	local y_pos = CH_Medals.Config.YPos3D2D
	if target:Crouching() then
		y_pos = CH_Medals.Config.YPosCrouched3D2D
	end
	
	cam.Start3D2D( pos, ang, 0.1 )
		local count = 0
		local show = 0
		local row_count = 0
		for k, v in ipairs( target_medals ) do
			if v.Display and CH_Medals.Medals[ v.Key ] then
				count = count + 1
			end
		end
		
		local start_pos = 0
		start_pos = start_pos - ( ( w_to_add / 2 ) * ( math.Clamp( CH_Medals.Config.MedalNewRowCount, 0, count ) + 2 ) )
		
		y_pos = y_pos - math.floor( ( count - 1 ) / CH_Medals.Config.MedalNewRowCount ) * CH_Medals.Config.MedalRowSpaceY
		
		-- Draw icons
		for k, v in ipairs( target_medals ) do
			if not v.Display then
				continue
			end
			local info = CH_Medals.Medals[ v.Key ]
			if not info then
				continue
			end
			
			-- Check row spacing
			if show == CH_Medals.Config.MedalNewRowCount then
				row_count = row_count + 1
				
				show = 0
			end
			
			show = show + 1
			
			surface.SetDrawColor( ColorAlpha( color_white, main + 70 ) )
			surface.SetMaterial( info.Icon )
			surface.DrawTexturedRect( start_pos + ( show * w_to_add ), y_pos + ( row_count * CH_Medals.Config.MedalRowSpaceY ), icon_size_x, icon_size_y )
		end
    cam.End3D2D()
end
hook.Add( "PostPlayerDraw", "CH_Medals.DrawMedals3D2D", CH_Medals.DrawMedals3D2D )