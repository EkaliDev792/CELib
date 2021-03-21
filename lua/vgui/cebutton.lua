local PANEL = {}

function PANEL:Init()
    CELib.CreateFontSize("Espera", "CELib", 22, 18, 20, 26, 24, 16, 14)
    self.hoveredFactor = 20
    self.color = Color(208, 213, 221)
    self.bgColor = Color(41, 61, 86)
    self.textColor = Color(113, 136, 164)
    self.text = "SELECT"
    self.font = "CELib:28"
    self.cercle = 0
    self.contour = 1
    self:SetText("")

    self.SetText = function(self, text)
        self.text = string.upper(text)
        surface.SetFont(self.font)
        local sizeX = surface.GetTextSize(self.text)

        if (sizeX > 180) then
            self.font = "CELib:22"
        end
    end
end

function PANEL:SetColor(col, bgCol)
    self.color = col

    if (bgCol) then
        self.bgColor = bgCol
    end
end

function PANEL:SetSmaller()
    self.cercle = 16
    self.contour = 1
    self:SetFont("CELib:18")
end

function PANEL:SetMedium()
    self.cercle = 16
    self.contour = 1
    self:SetFont("CELib:22")
end

function PANEL:SetSmallerMedium()
    self.cercle = 14
    self.contour = 1
    self:SetFont("CELib:20")
end

function PANEL:SetCompact()
    self.font = "CELib:18"
    self.cercle = 8
    self.contour = 1
    self.text = string.upper(self.text)
end

function PANEL:SetSelected(bool)
    self.isSelected = bool
    self:SetEnabled(not bool)
end

function PANEL:SetTextColor(col)
    self.textColor = col
end

function PANEL:SetFont(font)
    self.font = font
end

function PANEL:Paint(w, h)
    local isHovered = self:IsHovered() or self.isSelected
    local color = self.color
    local textColor = self.textColor
    local bgColor = self.bgColor

    if (not self:IsEnabled() and not self.enableShow) then
        color = color_white
        textColor = Color(113, 136, 164)
        isHovered = false
        self:SetCursor("no")
    else
        self:SetCursor("hand")
    end

    local sizeX = surface.GetTextSize(self.text)
    local space = 5

    if (sizeX - space > w) then
        local i = 28

        while (sizeX + space > w) do
            i = i - 2
            if (i < 14) then break end
            self:SetFont("CELib:" .. i)
            surface.SetFont("CELib:" .. i)
            sizeX = surface.GetTextSize(self.text)
        end
    end

    draw.RoundedBox(self.cercle, 0, 0, w, h, color)
    draw.RoundedBox(self.cercle, self.contour, self.contour, w - self.contour * 2, h - self.contour * 2, isHovered and color or bgColor)
    draw.SimpleText(self.isSelected and (not self.selectStr and "SELECTED" or self.selectStr) or self.text, self.font, w / 2, h / 2 - 1, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

PANEL.DoClick = function()
    surface.PlaySound("garrysmod/ui_click.wav")
end

vgui.Register("CELib.Button", PANEL, "DButton")