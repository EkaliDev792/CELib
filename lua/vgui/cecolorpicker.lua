local PANEL = {}
local ColorWheel = Material("materials/celib/colorwheel.png")
AccessorFunc(PANEL, 'colorrgb', 'Color')

function PANEL:Init()
    self:SetSize(300,300)
    self:SetColor(Color(255, 255, 255))
    self.posx = -100
    self.posy = -100
end

-- THANKS TO Agent Arthur#0038 for help    
function PANEL:GetPosColor(x, y)
    local colx = (x / self:GetWide()) * ColorWheel:Width()
    local coly = (y / self:GetTall()) * ColorWheel:Height()
    colx = math.Clamp(colx, 10, ColorWheel:Width())
    coly = math.Clamp(coly, 10, ColorWheel:Height())
    local rgb = ColorWheel:GetColor(colx, coly)

    return rgb, colx, coly
end

function PANEL:OnCursorMoved(x, y)
    if not input.IsMouseDown(MOUSE_LEFT) then return end
    local rgb = self:GetPosColor(x, y)

    if rgb then
        self.colorrgb = rgb
        self.colorrgb.a = 255
        self:OnColorIsChange(self.colorrgb)
    end

    self.posx = x
    self.posy = y
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(ColorWheel)
    surface.DrawTexturedRect(0, 0, w, h)
    surface.SetDrawColor(255, 255, 255, 250)
    surface.DrawCircle(self.posx, self.posy - 1, 5, color_white)
    -- surface.SetDrawColor(self.colorrgb)
    -- surface.DrawRect(50, 50, 200, 200) -- FRAME TEST
end

function PANEL:OnColorIsChange()
end

derma.DefineControl('CELib.ColorPicker', 'DFrame', PANEL, 'DPanel')