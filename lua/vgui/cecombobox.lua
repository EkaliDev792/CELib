local PANEL = {}
CELib.CreateFontSize("Espera", "CELib", 28, 19)


function PANEL:Init()


	local mat = "materials/celib/arrow.png"
	self.ChoiceIcons = { }
	self.Spacers = { }
	self.BorderRounded = { true, true, true, true }

	self.BackgroundColor = Color(41, 61, 86)

	self.DropButton.Paint = function( panel, w, h ) end
	self.ComboText = "Choisir un item"

	self:SetText( "" )
	self:SetContentAlignment( 4 )
	self:SetTextInset( 2, 0 )
	self:SetIsMenu( true )
	self:SetSortItems( true )
	

	self:SetTall( 35 )
	self:SetFont( "CELib:19" )

	self.Arrow = vgui.Create( 'DButton', self )
	self.Arrow:Dock( LEFT )
	self.Arrow:SetIcon( mat)
	self.Arrow:SetText("")
	self.Arrow:SetMouseInputEnabled( false )
	self.Arrow:DockMargin( 0, 0, 0, 0 )
	self.Arrow.Paint = function(self, w ,h)
	end

end

function PANEL:SetBorder( left, top, right, bottom )
	self.BorderRounded = { left, top, right, bottom }
	return self
end

function PANEL:Paint( w, h )
		draw.RoundedBoxEx( 5, 0, 0, w, h, self.BackgroundColor, self.BorderRounded[ 1 ], self.BorderRounded[ 2 ], false, false )
		draw.SimpleText(self:GetSelected() or self.ComboText, "CELib:19", w/2, h/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		return true
end

function PANEL:OpenMenu( pControlOpener )

	if ( pControlOpener and pControlOpener == self.TextEntry ) then
		return
	end

	-- Don't do anything if there aren't any options..
	if ( #self.Choices == 0 ) then return end

	-- If the menu still exists and hasn't been deleted
	-- then just close it and don't open a new one.
	if ( IsValid( self.Menu ) ) then
		self.Menu:Remove()
		self.Menu = nil
	end

	self.Menu = vgui.Create( 'CELib.ComboBoxMenu', self )
	if ( self:GetSortItems() ) then
		local sorted = {}
		for k, v in pairs( self.Choices ) do
			local val = tostring( v ) --tonumber( v ) || v -- This would make nicer number sorting, but SortedPairsByMemberValue doesn't seem to like number-string mixing
			if ( string.len( val ) > 1 and not tonumber( val ) and val:StartWith( '#' ) ) then val = language.GetPhrase( val:sub( 2 ) ) end
			table.insert( sorted, { id = k, data = v, label = val } )
		end
		for k, v in SortedPairsByMemberValue( sorted, 'label' ) do
			local option = self.Menu:AddOption( v.data, function() self:ChooseOption( v.data, v.id ) end )
			if ( self.ChoiceIcons[ v.id ] ) then
				option:SetIcon( self.ChoiceIcons[ v.id ] )
			end
		end
	else
		for k, v in pairs( self.Choices ) do
			local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
			if ( self.ChoiceIcons[ k ] ) then
				option:SetIcon( self.ChoiceIcons[ k ] )
			end
		end
	end

	local x, y = self:LocalToScreen( 0, self:GetTall() )

	self.Menu:SetMinimumWidth( self:GetWide() )
	self.Menu:Open( x, y, false, self )
end


function PANEL:PerformLayout( )
	self:SetColor(self.BackgroundColor)
end

function PANEL:SetDock( docking )
	self:Dock( docking )
	return self
end

function PANEL:SetBackgroundColor( color )
	self.BackgroundColor = color
	return self
end

function PANEL:SetHoveredColor( color )
	self.HoveredColor = color
	return self
end

function PANEL:GetHoveredColor( )
	if self.HoveredColor then
		return self.HoveredColor
	else
		return self.BackgroundColor
	end
end

function PANEL:SetPlaceholder( placeholder )
	self.Placeholder = placeholder
	return self
end

vgui.Register("CELib.Combobox", PANEL, "DComboBox")