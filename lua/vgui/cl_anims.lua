local PANEL = FindMetaTable("Panel")

function PANEL:FadeIn(duration, callback)
    duration = duration or 0.3

    self:SetAlpha(0)
    self:AlphaTo(255, duration, 0, function()
        if callback and isfunction(callback) then
            callback()
        end
    end)
end

function PANEL:FadeOut(duration, callback)
    duration = duration or 0.3

    self:AlphaTo(0, duration, 0, function()
        self:Remove()

        if callback and isfunction(callback) then
            callback()
        end
    end)
end
