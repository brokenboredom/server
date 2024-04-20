-----------------------------------
-- xi.effect.MEDICINE
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    --effect:setSubPower(0)
    if effect:getSubPower() == 0 then
        local newDuration = effect:getDuration() / 10
        effect:setSubPower(1)
        effect:setDuration(newDuration * 1000)
    end
end

effect_object.onEffectTick = function(target, effect)
    --local remaining = effect:getDuration()
    --effect:setDuration(remaining-27) --every 3sec subtract an additional 27sec. essentailly tics/10.
end

effect_object.onEffectLose = function(target, effect)
end

return effect_object
