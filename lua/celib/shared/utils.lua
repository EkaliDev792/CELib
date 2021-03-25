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

-- Récupère la personne la plus riche sur le serveur -> PLAYER or nil
function CELib.GetRichest()
    
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
function CELib.GetPoorest()
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