local blur = Material("pp/blurscreen")

function CELib.DrawGradient(x, y, w, h, ...)
    local color = { ... }
    if IsColor(color[1]) then color = color[1] end

    local r, g, b, a = color[1], color[2], color[3], color[4] or 255

    surface.SetMaterial(Material("celibg/gradientcelib.png", "smooth"))
    surface.SetDrawColor(r, g, b, a)
    surface.DrawTexturedRect(x, y, w, h)
end

function CELib.DrawBlur(panel, level, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local w, h = ScrW(), ScrH()

    surface.SetDrawColor(color_white)
    surface.SetMaterial(blur)

    for i = 1, 3 do
        blur:SetFloat("$blur", (i / (level or 3) ) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, w, h)
    end
end