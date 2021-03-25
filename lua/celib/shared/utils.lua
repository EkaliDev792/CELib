function CELib.GetPercentage(num, effectif)
    if num > effectif then return end
    local percent = (num * 100) / effectif

    return math.Round(percent)
end

function CELib.GetFromPercentage(percentage, effectif)
    local percent = (percentage * effectif) / 100

    return math.Round(percent)
end

function CELib.GetAdvancedPos(ply)

    local pos = {
        x = ply:GetPos().x,
        y = ply:GetPos().y,
        z = ply:GetPos().z,
        a = ply:GetAngles(),
        eyespos = ply:GetEyeTrace().HitPos
    }

    return pos

end

function CELib.TableRandom(tbl)

    if #tbl == 0 then return print("vide") end

    local tbl = tbl[math.random(1, #tbl)]

    return tbl

end