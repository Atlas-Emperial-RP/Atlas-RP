local PANEL = {}

function PANEL:Init()

end

function PANEL:CreateScrollPanel()
    self.scrollPanel = vgui.Create( "pz_scrollpanel", self )
    self.scrollPanel:Dock( FILL )
    self.scrollPanel.Paint = function( self2, w, h )
        self2.screenX, self2.screenY = self2:LocalToScreen( 0, 0 )
    end
end

vgui.Register( "pz_config_page_base", PANEL, "Panel" )