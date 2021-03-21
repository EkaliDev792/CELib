local PANEL = {}

function PANEL:Init( )

	self.BorderRounded = { true, true, true, true }


	self:SetSize( 15, 15 )
	self:SetText( '' )
	self.color = Color(41, 61, 86)
end

function PANEL:SetBorder( left, top, right, bottom )
	self.BorderRounded = { left, top, right, bottom }
	return self
end


function PANEL:Paint( w, h )
	if IsValid( self.Menu ) and self.Menu:IsVisible( ) then
		draw.RoundedBoxEx( 5, 0, 0, w, h, self.color, self.BorderRounded[ 1 ], self.BorderRounded[ 2 ], false, false )
	else
		draw.RoundedBoxEx( 5, 0, 0, w, h, self.color)
	end

	if not self.selected and self.Placeholder then
		if self:IsHovered() and ( not IsValid( self.Menu ) or not self.Menu:IsVisible( ) ) then
			draw.SimpleText( self.Placeholder, self:GetFont( ), 15, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		else
			draw.SimpleText( self.Placeholder, self:GetFont( ), 15, h / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		end
	elseif self:IsHovered( ) then
		self:SetColor( color_white )
	end

end

derma.DefineControl( 'CELib.Combobox', 'Simple DComboBox', PANEL, 'DComboBox' )