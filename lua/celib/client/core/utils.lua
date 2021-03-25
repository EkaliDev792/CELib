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
