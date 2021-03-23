local PANEL = { }
CELib.CreateFontSize("Espera", "CELib", 28, 19)

function PANEL:Init()
	self:SetIsMenu( true )
	self:SetDrawBorder( true )
	self:SetPaintBackground( true )
	self:SetMinimumWidth( 100 )
	self:SetDrawOnTop( true )
	self:SetMaxHeight( ScrH() * 0.9 )
	self:SetDeleteSelf( true )

	self:SetPadding( 0 )
	RegisterDermaMenuForClose( self )
end

function PANEL:AddOption( strText, funcFunction )
	local pnl = vgui.Create( 'DMenuOption', self )
	pnl:SetMenu( self )
	pnl:SetText( strText )
	pnl:SetFont( "CELib:19" )
	pnl:SetColor( Color(255,255,255) )
	if ( funcFunction ) then
		pnl.OnMouseReleased = funcFunction
	end
	self:AddPanel( pnl )

	return pnl
end

function PANEL:AddCVar( strText, convar, on, off, funcFunction )
	local pnl = vgui.Create( 'DMenuOptionCVar', self )
	pnl:SetMenu( self )
	pnl:SetText( strText )
	if ( funcFunction ) then pnl.DoClick = funcFunction end

	pnl:SetConVar( convar )
	pnl:SetValueOn( on )
	pnl:SetValueOff( off )

	self:AddPanel( pnl )

	return pnl
end

function PANEL:AddSpacer( strText, funcFunction )
	local pnl = vgui.Create( 'DPanel', self )
	pnl.Paint = function( p, w, h )
		derma.SkinHook( 'Paint', 'MenuSpacer', p, w, h )
	end

	pnl:SetTall( 1 )
	self:AddPanel( pnl )

	return pnl
end

function PANEL:AddSubMenu( strText, funcFunction )
	local pnl = vgui.Create( 'DMenuOption', self )
	local SubMenu = pnl:AddSubMenu( strText, funcFunction )

	pnl:SetText( strText )
	if ( funcFunction ) then pnl.DoClick = funcFunction end

	self:AddPanel( pnl )

	return SubMenu, pnl
end

function PANEL:Paint( w, h )
	if ( !self:GetPaintBackground() ) then return end
	draw.RoundedBoxEx( 2, 0, 0, w, h, Color(15, 50, 92, 255), false, false, true, true )
	return true
end

function PANEL:Open( x, y, skipanimation, ownerpanel )
	RegisterDermaMenuForClose( self )

	local maunal = x && y

	x = x or gui.MouseX()
	y = y or gui.MouseY()

	local OwnerHeight = 0

	if ( ownerpanel ) then
		OwnerHeight = ownerpanel:GetTall()
	end

	self:PerformLayout()

	local w = self:GetWide()
	local h = self:GetTall()

	self:SetSize( w, h )

	if ( y + h > ScrH() ) then y = ( ( maunal && ScrH() ) or ( y + OwnerHeight ) ) - h end
	if ( x + w > ScrW() ) then x = ( ( maunal && ScrW() ) or x ) - w end
	if ( y < 1 ) then y = 1 end
	if ( x < 1 ) then x = 1 end

	self:SetPos( x, y )
	self:MakePopup()
	self:SetVisible( true )
	self:SetKeyboardInputEnabled( false )
end

derma.DefineControl( 'CELib.ComboBoxMenu', nil, PANEL, 'DMenu' )