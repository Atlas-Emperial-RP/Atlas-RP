local PANEL = {}

function PANEL:Init()
    self:SetFont("NCS_LOD_FRAME_TITLE")
end

function PANEL:Paint(w, h)
    surface.SetDrawColor( Color(122,132,137, 180) )
    surface.DrawOutlinedRect( 0, 0, w, h )

    self:DrawTextEntryText(color_white, color_white, color_white)
end

vgui.Register( "NCS_LOD_TextEntry", PANEL, "DTextEntry" )