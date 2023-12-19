local get_skin = CYBERNETIC_AUGMENTATIONS.Skins[CYBERNETIC_AUGMENTATIONS.Skin]
local colors = get_skin.Colors

local VisorMode = 1
local VisorDelay = 0
local On_Sound = Sound("geralts_augmentations/visor_on.wav")
local Off_Sound = Sound("geralts_augmentations/visor_off.wav")

local TMRange = 750 * 750
local red_color = Color(255, 0, 0)

local thermalEnts = {}
local echoEnts = {}

local Items = CYBERNETIC_AUGMENTATIONS.Items

local notifyTable = {}
local scrw, scrh = ScrW(), ScrH()
local spacing = 40 + 5
local s10 = ScreenScale(10)
local top_gradient = Material("vgui/gradient-u")
local energybar = get_skin.EnergyBar

local hideTabl = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudCrosshair"] = true,
	["CHudDamageIndicator"] = true,
}

hook.Add("HUDShouldDraw","HIDE_Hl2_HUD",function(name)
	if hideTabl[name] and CYBERNETIC_AUGMENTATIONS.HideSandboxHUD then
		return false
	end
end)

local function ThermalVisionToggleON()
	local lp = CYBER_AUGS_LOCALPLAYER
	local cur_pos_player = lp:GetPos()
	local cur_ang_eyes = lp:EyeAngles()
	local cur_pos_eyes = lp:EyePos()+cur_ang_eyes:Forward()*4.5

	cur_ang_eyes = Angle(cur_ang_eyes.p+90, cur_ang_eyes.y, 0)

	render.ClearStencil()
	render.SetStencilEnable(true)
		render.SetStencilWriteMask(255)
		render.SetStencilTestMask(255)
		render.SetStencilReferenceValue(1)
		
		for ent, _ in next,CYBERNETIC_AUGMENTATIONS_PLAYERS do
			if ent == lp or not IsValid(ent) then continue end 
			if (ent:GetPos():DistToSqr(cur_pos_player) > TMRange) then continue end
		
			
			render.SetStencilCompareFunction(STENCIL_ALWAYS)

			render.SetStencilZFailOperation(STENCIL_KEEP)

			
			render.SetStencilPassOperation(STENCIL_REPLACE)
			render.SetStencilFailOperation(STENCIL_KEEP)
				
			ent:DrawModel()
			for k, v in next, ent:GetChildren() do 
            	if v:GetClass() == "geralts_augmentations_bonemerge" then v:DrawModel() end
            end 
			render.SetStencilCompareFunction(STENCIL_EQUAL)
			render.SetStencilZFailOperation(STENCIL_KEEP)
			render.SetStencilPassOperation(STENCIL_KEEP)
			render.SetStencilFailOperation(STENCIL_KEEP)	
			
			cam.Start3D2D(cur_pos_eyes, cur_ang_eyes, 1)
				surface.SetDrawColor(255, 255, 0, 220)
				surface.DrawRect(-scrw, -scrh, scrw*2, scrh*2)		
			cam.End3D2D()	
	
			thermalEnts[#thermalEnts + 1] = ent
			
            for k, v in next, ent:GetChildren() do
                if v:GetClass() == "geralts_augmentations_bonemerge" then
            		thermalEnts[#thermalEnts + 1] = v 
                end
            end 
		end

		render.SetStencilCompareFunction(STENCIL_NOTEQUAL)
		render.SetStencilZFailOperation(STENCIL_KEEP)
		render.SetStencilPassOperation(STENCIL_KEEP)
		render.SetStencilFailOperation(STENCIL_KEEP)
	render.SetStencilEnable(false)
end

local function ThermalVisionAction()
	VisorMode = 2
	surface.PlaySound(Off_Sound)
	if IsValid(CYBER_AUGS_NVLamp) then CYBER_AUGS_NVLamp:Remove() end
	hook.Remove("Think", "CYBER_AUGS_Visor")
	
	local w, h = scrw, scrh

	hook.Add("PostDrawTranslucentRenderables", "CYBER_AUGS_Visor", ThermalVisionToggleON)
	hook.Add("RenderScreenspaceEffects", "CYBER_AUGS_Visor", function()
		surface.SetDrawColor(0, 50, 150, 50)
		surface.DrawRect(0, 0, w, h)
		DrawMaterialOverlay("drg_nvg/drg_nvg", 0)

		DrawSharpen(1, 1)		
	end)
end

local tab = {
	["$pp_colour_brightness"] = 0.75,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0.15,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0,
	["$pp_colour_addr"] = -1,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = -1,
}

local function NightVision()
	VisorMode = 1
	surface.PlaySound(On_Sound)
	
	hook.Add("RenderScreenspaceEffects", "CYBER_AUGS_Visor", function()
		DrawMaterialOverlay("drg_nvg/drg_nvg", 0)
		DrawColorModify(tab)
		DrawSharpen(1, 1)
	end)
	local lamp = ProjectedTexture() 
	CYBER_AUGS_NVLamp = lamp 

	lamp:SetTexture( "effects/flashlight/soft" )
	lamp:SetFarZ( 750 )
	lamp:SetBrightness(5)
	lamp:SetFOV(120)
	lamp:SetColor(Color(255,255,255))
	lamp:SetEnableShadows(false)
	lamp:Update()
	
	hook.Add("Think", "CYBER_AUGS_Visor", function()

		local tr = CYBER_AUGS_LOCALPLAYER:EyePos()
		local eye = CYBER_AUGS_LOCALPLAYER:EyeAngles()
		lamp:SetPos(tr - eye:Forward() * 50)
		lamp:SetAngles(Angle(0, eye.y, 0))
		lamp:Update()
		
	end)	
end 

local echo_range = 500 * 500
local next_echo = 0
local function EchoLocation()
	local lp = CYBER_AUGS_LOCALPLAYER
	local cur_pos_player = lp:GetPos()
	local cur_ang_eyes = lp:EyeAngles()
	local cur_pos_eyes = lp:EyePos()+cur_ang_eyes:Forward()*4.5

	cur_ang_eyes = Angle(cur_ang_eyes.p+90, cur_ang_eyes.y, 0)

	local datas = {}	
	
	for ent, _ in next,CYBERNETIC_AUGMENTATIONS_PLAYERS do
		if ent == lp then continue end 
        if !IsValid(ent) then continue end 
        
		local pos = ent:GetPos()
		local dist = pos:DistToSqr(cur_pos_player)

		if (dist > echo_range) then continue end
		if ent:IsSpeaking() or ent:IsTyping() or ent:GetVelocity():Length() > 3 then 
       		echoEnts[#echoEnts + 1] = ent

            for k, v in next, ent:GetChildren() do
                if v:GetClass() == "ent_bonemerged" then
            		echoEnts[#echoEnts + 1] = v 
                end
            end 
		end
	end
end

local function EchoLocator()
	
	-- hook.Remove("RenderScreenspaceEffects", "NVVisor")
	local start_a = 0
	local w, h = scrw, scrh
	surface.PlaySound(Off_Sound)
	
	hook.Add("PostDrawTranslucentRenderables", "CYBER_AUGS_Visor", EchoLocation)
	hook.Add("RenderScreenspaceEffects", "CYBER_AUGS_Visor", function()
		if start_a < 245 then start_a = start_a + 2 end 
		surface.SetDrawColor(0,0,0,start_a)
		surface.DrawRect(-2, -2, w + 4, h + 4)
	end)
end 

local visor_keys = {
	[1] = "Nightvision",
	[2] = "Thermalvision",
	[3] = "Echolocation",
}

local visor_modes = {
	[1] = NightVision, -- thermal visor 
	[2] = ThermalVisionAction, -- night vision
	[3] = EchoLocator, -- echo locator
}

concommand.Add("cyber_augs_command_visor", function()
	local CT = CurTime()
	
	if CT < VisorDelay then return end 
	
	local eyes = CYBERNETIC_AUGMENTATIONS.GetAugmentations()[6]
	
	if not eyes or table.IsEmpty(eyes) then return end
	
	local id = eyes.id

	local eye_data = Items[6][id]
	local params = eye_data.Parameters

	for i = 1, 4 do
		if i <= VisorMode then continue end
		if i != 4 and not params[visor_keys[i]] then continue end
		
		if i == 4 then
			VisorMode = 0
		else
			VisorMode = i
		end
		
		break
	end
	
	if VisorMode == 0 then 
		hook.Remove("PostDrawTranslucentRenderables", "CYBER_AUGS_Visor")
		hook.Remove("Think", "CYBER_AUGS_Visor")
		hook.Remove("RenderScreenspaceEffects", "CYBER_AUGS_Visor")

		if IsValid(CYBER_AUGS_NVLamp) then CYBER_AUGS_NVLamp:Remove() end
		surface.PlaySound(Off_Sound)
	else 
		visor_modes[VisorMode]()
	end 
	VisorDelay = CT + 0.15
end ) 

hook.Add("PreDrawHalos", "CYBER_AUGS_DrawHalos", function()
    -- if VisorMode > 0 and CYBER_AUGS_LOCALPLAYER:GetNWInt("CyberHUD") == 0 then
        -- VisorMode = 0
        -- hook.Remove("PostDrawTranslucentRenderables", "CYBER_AUGS_Visor")
        -- hook.Remove("Think", "CYBER_AUGS_Visor")
        -- hook.Remove("RenderScreenspaceEffects", "CYBER_AUGS_Visor")

        -- if IsValid(CYBER_AUGS_NVLamp) then CYBER_AUGS_NVLamp:Remove() end
	-- end

	halo.Add(echoEnts, color_white, 1, 1, 1, true, true)
	halo.Add(thermalEnts, red_color, 1, 1, 1, true, false)

	thermalEnts = {}
	echoEnts = {}
end)

local function create_notify(msg, type, len)
	local t_len = 1
	for k, v in next, notifyTable do
		if v.y == t_len then t_len = t_len + 1 end
	end

	local newNotify = {}
	newNotify.y = t_len
	newNotify.msg = msg or ""
	newNotify.msgType = type or 1
	newNotify.msgLen = len or 4
	newNotify.msgCreationTime = CurTime()
	newNotify.a = 1
	newNotify.StartTextAnim = 0
	
	local start_y = scrh * 0.8 - spacing * t_len
	newNotify.Poly = {
		{x = scrw, y = start_y},
		{x = scrw - 15, y = start_y},
		{x = scrw - 15, y = start_y + s10 + 10},
		{x = scrw + 10, y = start_y + s10 + 10},
		{x = scrw, y = start_y + s10},
	}
	return newNotify
end

CYBERNETIC_AUGMENTATIONS.SendNotify = function(msg, type, len)
	if CYBERNETIC_AUGMENTATIONS.CustomNotifyFunction then CYBERNETIC_AUGMENTATIONS.CustomNotifyFunction(ply, msg, type, len) return end
	
	local newNotify = create_notify(msg, type, len)
	notifyTable[#notifyTable + 1] = newNotify
	
	surface.PlaySound("buttons/lightswitch2.wav")
end

net.Receive("CYBER_AUGS_SendNotify", function()
	local msg, type, len = net.ReadString(), net.ReadInt(4), net.ReadInt(6)
	
	CYBERNETIC_AUGMENTATIONS.SendNotify(msg, type, len)
end )

local notifyTypeToCol = colors.NotifyColors

hook.Add("PostRenderVGUI", "CYBER_AUGS_DrawNotifications", function()
	if table.IsEmpty(notifyTable) then return end 

	local RFT = RealFrameTime() 
	local CT = CurTime()
	
	for k,v in next,notifyTable do
		local start_anim = v.StartTextAnim
		local is_closing = v.msgCreationTime + v.msgLen
		local alpha = v.a 
		
		if alpha < 0 then 
			table.remove(notifyTable, k)
			continue
		end 			
		if is_closing < CT then 
			v.a = alpha - 0.01
		end 
		local start_x, start_y = scrw, scrh * 0.8 - spacing * v.y
		
		
		local msg = v.msg
		local txt_anim = CYBERNETIC_AUGMENTATIONS.TextAnimation(v, msg, 1)

		local vw = v.w
		if !vw then vw = 0 v.w = 0 end 
		
		start_x = scrw - 40 - vw * (start_anim / #msg )
		
		local poly = v.Poly 
		local text_color = colors.TextColor
		
		local start_y1 = start_y + s10
		poly[1].x = start_x
		poly[1].y = start_y	
		
		poly[4].x = start_x + 10
		poly[4].y = start_y1 + 10		
		
		poly[5].x = start_x
		poly[5].y = start_y1

		local clr = notifyTypeToCol[v.msgType]
		local r, g, b = clr.r,clr.g,clr.b
		
		surface.SetDrawColor(0, 0, 0, 220 * alpha)
		draw.NoTexture()
		surface.DrawPoly(poly)
		
		surface.SetDrawColor(r, g, b, 50 * alpha)
		surface.SetMaterial(top_gradient)
		surface.DrawTexturedRect(start_x, start_y, (scrw - 15) - start_x, 10) 	

		surface.SetDrawColor(r, g, b, 255 * alpha)		

		surface.DrawLine(start_x, start_y, scrw - 15, start_y)
		surface.DrawLine(start_x, start_y + 1, scrw - 15, start_y + 1)
		
		local w = draw.SimpleText(txt_anim, "CYBER_AUGS_NotifyFont", scrw - 25, start_y + 10 + s10 * 0.25, clr, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		
		v.w = w
	end
end )

local alpha = 255
local energy_lerp = 0
local x,y,w,h = scrw * energybar.X, scrh * energybar.Y, scrw * energybar.W, scrh * energybar.H

local cloak_cc = {
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = 0,
	[ "$pp_colour_contrast" ] = 1,
	[ "$pp_colour_colour" ] = 0.5,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}

hook.Add("HUDPaint", "CYBER_AUGS_EnergyBar", function()
	local ply = CYBER_AUGS_LOCALPLAYER
	local energy = ply:GetNWFloat("CYBER_AUGS_Energy")
	
	if ply:GetMaterial() == "sprites/heatwave" then	
		DrawColorModify( cloak_cc )
	end
	
	if energy < 100 then
		alpha = math.Approach(alpha, 255, 3)
	else
		alpha = math.Approach(alpha, 0, 3)
	end
	
	energy_lerp = Lerp( RealFrameTime() * 10, energy_lerp, energy)
	
	surface.SetDrawColor(ColorAlpha(energybar.Color, alpha))
	surface.DrawOutlinedRect(x,y,w,h)
	surface.DrawRect(x + 2,y + 2,(w - 4) * energy_lerp * 0.01,h - 4)
end )