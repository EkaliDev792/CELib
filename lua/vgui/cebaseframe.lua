local PANEL = {}
CELib.CreateFontSize("Espera", "CELib", 30)

function PANEL:Init()
    self:SetDraggable(false)
    self:ShowCloseButton(FALSE)
    self:DockMargin(100, 100, 100, 100)
    self:DockPadding(0, 0, 0, 0)
    self:FadeIn()
    self.lblTitle:SetText("")
    self.title = "CELib-Frame"
    local top = self:Add("DPanel")
    top:Dock(TOP)
    top:DockMargin(10, 5, 0, 10)

    top.Paint = function(_self, w, h)
        surface.SetDrawColor(Color(44, 62, 82))
        surface.DrawRect(5, 0, w - 20, 500)
        draw.SimpleText(self.title, "CELib:30", 10, -3, Color(93, 127, 165), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
    end

    local close = top:Add("DButton")
    close:Dock(RIGHT)
    close:DockMargin(0, 0, 15, 0)
    close:SetSize(top:GetTall(), top:GetTall())
    close:SetText("X")
    close:SetTextColor(Color(207, 98, 98))

    close.DoClick = function()
        self:Remove()
        surface.PlaySound("garrysmod/ui_click.wav")
    end

    close.Paint = function(_self, w, h)
        draw.RoundedBox(1, 0, 0, w + 5, h, Color(32, 44, 58))
    end
end

function PANEL:SetTitle(title)
    self.title = title
end

function PANEL:Paint(w, h)
    local x, y = self:LocalToScreen(0, 0)
    CELib.BeginDrawShadow()
    draw.RoundedBox(2, x, y, w, h, Color(23, 32, 42))
    CELib.EndDrawShadow(3, 8, 2, 255)
end

vgui.Register("CELib.Frame", PANEL, "DFrame")