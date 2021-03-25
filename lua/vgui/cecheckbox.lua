local PANEL = {}
CELib.CreateFontSize("Espera", "CELib", 28, 19)
AccessorFunc( PANEL, 'check', 'Checked', FORCE_BOOL )
AccessorFunc( PANEL, 'color', 'CheckColor' )
-- local mat = Material("materials/check.png")
function PANEL:Init( )

	self:SetSize( 15, 15 )
	self:SetText( '' )
	self.Color = Color(15, 50, 92, 255)

end

function PANEL:Paint( w, h )
	draw.RoundedBox( 3, 0, 0, w, h, Color(15, 50, 92, 255) )

	if self:GetChecked( ) then
		draw.SimpleText( "X", "CELib:18", w / 2, h / 2, self:GetCheckColor( ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		-- surface.SetDrawColor( 255, 255, 255, 255 )
		-- surface.SetMaterial( mat )
		-- surface.DrawTexturedRect( 2, 2, 12, 12 ) 
	end
end

derma.DefineControl( 'CELib.CheckBox', 'CELib CheckBox', PANEL, 'DCheckBox' )