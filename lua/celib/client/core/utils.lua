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

--Récupère la date et l'heure
function CELib.GetDateTime()

    return os.date( "%d/%m/%Y - %H:%M:%S")
end

-- Récupère la personne la plus riche sur le serveur -> CELib.GetMostRich().name -> nom du joueur
function CELib.GetMostRich()

    local tbl = {}

    for _, v in pairs(player.GetAll()) do

        local nl = {
            ["ply"] = v,
            ["name"] = v:Name(),
            ["money"] = v:getDarkRPVar("money")
        }

        tbl[#tbl + 1] = nl
    end

    for k, v in SortedPairsByMemberValue(tbl, "money", true) do

        tbl = {
            ["ply"] = v.ply,
            ["name"] = v.name,
            ["money"] = v.money
        }


        break
    end

    return tbl
end

-- Récupère la personne la plus pauvre sur le serveur -> CELib.GetMostRich().name -> nom du joueur
function CELib.GetMostPoor()

    local tbl = {}

    for _, v in pairs(player.GetAll()) do

        local nl = {
            ["ply"] = v,
            ["name"] = v:Name(),
            ["money"] = v:getDarkRPVar("money")
        }

        tbl[#tbl + 1] = nl
    end

    for k, v in SortedPairsByMemberValue(tbl, "money", false) do

        tbl = {
            ["ply"] = v.ply,
            ["name"] = v.name,
            ["money"] = v.money
        }


        break
    end

    return tbl
end