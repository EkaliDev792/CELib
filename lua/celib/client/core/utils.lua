--Récuperer un pourcentage, exemple 320 de 400 = 80% = CELib.GetPercentage(320, 400)
function CELib.GetPercentage(num, effectif)
    if num > effectif then return end
    local percent = (num * 100) / effectif

    return math.Round(percent)
end

--Récuperer un nombre d'un pourcentage, exemple 80% de 400 = 320 = CELib.GetFromPercentage(80, 400)
function CELib.GetFromPercentage(percentage, effectif)
    local percent = (percentage * effectif) / 100

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
    return os.date("%d/%m/%Y - %H:%M:%S")
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

-- Récupère toutes les icons de font awesome exemeple pour get toutes les solids -> icons.solid
/* Liste

    solid
    regular
    brands

*/
function CELib.GetAllFontAwesomeIcon()
    local icons = {}

    http.Fetch("https://raw.githubusercontent.com/gluons/Font-Awesome-Icon-Chars/master/character-list/character-list.json", function(body)
        icons = util.JSONToTable(body)
    end)

    return icons
end

-- Sers à créer une font avec plusieurs size différentes rapidement -> fontname:size
/* exemple

    CELib.CreateFontSize("masuperfont", "Arial", ( les différentes size vous pouvez en mettre autant que vous vouliez))

*/
function CELib.CreateFontSize(fontname, myname, ...)
    if not fontname then return end
    if not myname then return end
    if not ... then return end

    local differentSize = { ... }

    for k, v in pairs(differentSize) do
        surface.CreateFont( myname..":"..v, {
            font = fontname,
            size = v,
        })
    end
end

-- Récupère et vérifie si un joueur est connecté avec un steamid
function CELib.GetPlayerBySteamID(stid)

    local pl = player.GetBySteamID( stid )

    if not pl then return false end

    return pl
end

-- Récupère et vérifie si un joueur est connecté avec un steamid64
function CELib.GetPlayerBySteamID64(stid)

    local pl = player.GetBySteamID64( stid )

    if not pl then return false end

    return pl
end