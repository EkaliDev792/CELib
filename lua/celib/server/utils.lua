--[[
    CELib.GetDarkRPInfoPlayer(stid64).rpname -> nom du joueur
    CELib.GetDarkRPInfoPlayer(stid64).salary -> dernier salaire enregistré
    CELib.GetDarkRPInfoPlayer(stid64).wallet -> argent en poche
]]--
function CELib.GetDarkRPInfoPlayer(stid64)

    if not stid64 then return end

    if string.StartWith(stid64, "STEAM_") then stid64 = util.SteamIDTo64(stid64) end

    local stid64 = sql.Query("SELECT * FROM darkrp_player WHERE uid = '"..stid64.."';")

    return stid64[1]

end