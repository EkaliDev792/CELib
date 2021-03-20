-- Sers à faire un dégradé
function CELib.DrawGradient(x, y, w, h, ...)

    local clr = { ... }

    local r, g, b, a = clr[1], clr[2], clr[3], clr[4] or 255

    surface.SetMaterial(Material("gradientcelib.png", "smooth"))
    surface.SetDrawColor(r, g, b)
    surface.DrawTexturedRect(x, y, w, h)


end

-- Sers à faire un effet blur
function CELib.DrawBlur(pnl, intIntensity, intAmount)
    local intX, intY = pnl:LocalToScreen(0, 0)
    local intSW, intSH = ScrW(), ScrH()
    
    surface.SetDrawColor(color_white)
    surface.SetMaterial(blur)
    
    for i = 1, 3 do
        blur:SetFloat("$blur", (i / (intIntensity or 3) ) * (intAmount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(intX * -1, intY * -1, intSW, intSH)
    end
end

function CELib.BeginDrawShadow()
    BSHADOWS.BeginShadow()
end

function CELib.EndDrawShadow(intensity, spread, blur, opacity)
    BSHADOWS.EndShadow(intensity, spread, blur, opacity, 0, 0)
end