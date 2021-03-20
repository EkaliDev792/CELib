-- Sers à faire un dégradé
function CELib.DrawGradient(x, y, w, h, ...)

    local clr = { ... }

    local r, g, b = clr[1], clr[2], clr[3]

    surface.SetMaterial(Material("gradientcelib.png", "smooth"))
    surface.SetDrawColor(r, g, b)
    surface.DrawTexturedRect(x, y, w, h)


end