-- Récupère la personne la plus riche sur le serveur -> PLAYER or nil
function CELib.GetMostRich()
    
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

-- Récupère la personne la plus pauvre sur le serveur -> CELib.GetMostRich():Name() -> nom du joueur
function CELib.GetMostPoor()
    local money, ply
    
    for _, v in pairs(player.GetAll()) do
        local amount = v:getDarkRPVar("money")
        if not money or amount < money then
            money = amount
            ply = v
        end
    end

    return ply
end

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
