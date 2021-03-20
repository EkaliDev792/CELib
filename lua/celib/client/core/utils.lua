--Récuperer un pourcentage, exemple 320 de 400 = 80% = CELib.GetPercentage(320, 400)
function CELib.GetPercentage(num, effectif)
    if num > effectif then return end
    local percent = (num*100)/effectif

    return math.Round(percent)
end

--Récuperer un nombre d'un pourcentage, exemple 80% de 400 = 320 = CELib.GetFromPercentage(80, 400)
function CELib.GetFromPercentage(percentage, effectif)
    local percent = (percentage*effectif)/100

    return math.Round(percent)
end

--Récuperer la taille d'un text
function CELib.GetTextSize(texte, police)
    surface.SetFont(police)
    return surface.GetTextSize(texte)
end

--Récuperer les infos du server, exemple print(CELib.ServerInfo().map) -> output la map
function CELib.ServerInfo()
    local tbl = {
        ["map"] = game.GetMap(),
        ["ip"] = game.GetIPAddress(),
        ["online"] = #player.GetAll(),
        ["name"] = GetHostName()
    }

    return tbl
end