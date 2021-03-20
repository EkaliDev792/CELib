
local PANEL = FindMetaTable("Panel")

function PANEL:FadeInPanel(duration, cb)
    self:SetVisible(true)
    self:SetAlpha(0)
    self:LerpFade(duration, 0, 255, cb)
end

function PANEL:FadeOutPanel(duration, cb)
    self:LerpFade(duration, self:GetAlpha(), 0, cb)
end

function PANEL:FadeTo(finalAlpha)
    self:LerpFade(0.5, nil, finalAlpha)
end

function PANEL:LerpFade(duration, _currAlpha, _finalAlpha, _cb)
    local startTime = SysTime()
    local origAlpha = _currAlpha or self:GetAlpha()
    local finalAlpha = _finalAlpha or 0

    local anim = self:NewAnimation(duration, 0, -1, function (_b, pnl)
        if (_cb) then _cb() end
        if (origAlpha > finalAlpha) then
            pnl:SetVisible(false)
        end
    end)

    anim.Think = function (anim, pnl, fraction)
        local alpha = Lerp(fraction, origAlpha, finalAlpha)
        pnl:SetAlpha(alpha)
    end

end