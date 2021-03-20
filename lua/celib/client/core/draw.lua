surface.CreateFont("CELib.Ledare.Medium.Lib", {
    font = "Ledare Medium PERSONAL USE ONLY"
})

hook.Add("HUDPaint", "Celib.DrawHud.Test", function()
    
    draw.SimpleText("Salut mec", "CELib.Ledare.Medium.Lib", ScrW()/2, ScrH()/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

end)