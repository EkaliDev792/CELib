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

-- Récupère la personne la plus riche sur le serveur -> PLAYER or nil
function CELib.GetRichestPlayer()
    
    local mostRich
    local targetMoney = 0
    for _, v in pairs(player.GetAll()) do
        if not IsValid(v) then continue end
            
        local vMoney = v:getDarkRPVar("money")
        if targetMoney < vMoney then
            targetMoney = vMoney
            mostRich = v
        end
    end
    
    return mostRich
end

-- Récupère la personne la plus pauvre sur le serveur -> CELib.GetMostRich().name -> nom du joueur
function CELib.GetPoorestPlayer()
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
--[[ Liste

    solid
    regular
    brands

]]
function CELib.GetAllFontAwesomeIcon()
    local icons = {}

    http.Fetch("https://raw.githubusercontent.com/gluons/Font-Awesome-Icon-Chars/master/character-list/character-list.json", function(body)
        icons = util.JSONToTable(body)
    end)

    return icons
end

-- Sers à créer une font avec plusieurs size différentes rapidement -> fontname:size
--[[ exemple

    CELib.CreateFontSize("masuperfont", "Arial", ( les différentes size vous pouvez en mettre autant que vous vouliez))

]]
function CELib.CreateFontSize(fontname, myname, ...)
    if not fontname then return end
    if not myname then return end
    if not ... then return end

    local differentSize = {...}

    for k, v in pairs(differentSize) do
        surface.CreateFont(myname .. ":" .. v, {
            font = fontname,
            size = v,
        })
    end
end

-- Récupère les informations avancé d'un joueur, et on peut bouclé dessus !
--[[
    CELib.GetAdvancedPlayerGetAll().ply -> Récupère le joueur ( l'entité )
    CELib.GetAdvancedPlayerGetAll().name -> Récupère le nom du joueur
    CELib.GetAdvancedPlayerGetAll().rank -> Récupère le groupe du joueur
    CELib.GetAdvancedPlayerGetAll().health -> Récupère la vie du joueur
    CELib.GetAdvancedPlayerGetAll().armor -> Récupère l'armure du joueur
    CELib.GetAdvancedPlayerGetAll().team -> Récupère la team du joueur
    CELib.GetAdvancedPlayerGetAll().teamName -> Récupère le nom de la team du joueur
    CELib.GetAdvancedPlayerGetAll().steamid -> Récupère le steamid
    CELib.GetAdvancedPlayerGetAll().steamid64 -> Récupère le steamid64
    CELib.GetAdvancedPlayerGetAll().steamname -> Récupère le nom steam
    CELib.GetAdvancedPlayerGetAll().steamprofile -> Récupère le profile steam
]]
function CELib.GetAdvancedPlayerGetAll()
    local tbl = {}

    for k, v in ipairs(player.GetAll()) do
        if not v:SteamID64() then continue end

        local nl = {
            ["ply"] = v,
            ["name"] = v:Name(),
            ["rank"] = v:GetUserGroup(),
            ["health"] = v:Health(),
            ["armor"] = v:Armor(),
            ["team"] = v:Team(),
            ["teamName"] = team.GetName(v:Team()),
            ["steamid"] = v:SteamID(),
            ["steamid64"] = v:SteamID64(),
            ["steamname"] = v:SteamName(),
            ["steamprofile"] = "https://steamcommunity.com/profiles/" .. v:SteamID64(),
        }

        tbl[#tbl + 1] = nl
    end

    return tbl
end

-- Récupère le joueur qu'il regarde
function CELib.WhoPlayerLook()
    local plSee = LocalPlayer():GetEyeTrace().Entity
    if not plSee:IsPlayer() then return end

    return plSee
end

-- Récupère les informations avancée de la position du joueur
--[[
    CELib.GetPos(LocalPlayer()).x = position x
    CELib.GetPos(LocalPlayer()).y = position y
    CELib.GetPos(LocalPlayer()).z = position z
    CELib.GetPos(LocalPlayer()).a = angle
    CELib.GetPos(LocalPlayer()).eyepos = position de ou le joueur regarde

]]
function CELib.GetPos(ply)
    local pos = ply:GetPos()

    local nl = {
        x = pos.x,
        y = pos.y,
        z = pos.z,
        a = ply:GetAngles(),
        eyepos = ply:GetEyeTrace().HitPos,
    }

    return nl
end

-- Récupère les différentes vitesses du joueur
--[[
    CELib.GetSpeed(ply).speed_run -> Récupère la vitesse de course
    CELib.GetSpeed(ply).speed_walk -> Récupère la vitesse de marche
    CELib.GetSpeed(ply).speed_crouch -> Récupère la vitesse accroupie
]]
function CELib.GetSpeed(ply)
    local spd_run = ply:GetRunSpeed()
    local spd_walk = ply:GetWalkSpeed()
    local spd_crouch = ply:GetCrouchedWalkSpeed()

    local nl = {
        speed_run = spd_run,
        speed_walk = spd_walk,
        speed_crouch = spd_crouch
    }

    return nl
end

-- Merci DARZ <3
--[[
    CELib.DownloadMaterialURL("url de l'image", "repertoire", "nom de limage dans le repertoire") 
]]
function CELib.DownloadMaterialURL(...)
    if not ... then return end

    local args = {...}

    local url = args[1]
    local dir = args[2]
    local matName = args[3]
    local path = dir .. "/" .. matName .. ".png"
    failed = failed or function() end

    http.Fetch(url, function(body)
        if not body then
            failed()

            return
        end

        if (not file.IsDir(dir, "DATA")) then
            file.CreateDir(dir)
        end

        local ok = pcall(function()
            file.Write(path, body)
            success(Material("data/" .. path, "noclamp smooth"))
        end)

        if not ok then
            failed()
        end
    end)
end

function CELib.IsDownloadMatURL(...)
    if not ... then return end

    local args = {...}

    local url = args[1]
    local dir = args[2]
    local matName = args[3]
    local path = dir .. "/" .. matName .. ".png"
    if file.Exists(path, "DATA") then return Material("data/" .. path, "noclamp smooth") end

    return CELib.DownloadMaterialURL(url, dir, matName)
end

function CELib.RemoveDownloadedMatURL(...)
    if not ... then return end

    local args = {...}

    local dir = args[1]
    local matName = args[2]
    local path = dir .. "/" .. matName .. ".png"

    if file.Exists(path, "DATA") then
        file.Delete(path)
    end

    return false
end
