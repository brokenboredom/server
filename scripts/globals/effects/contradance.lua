-----------------------------------
-- xi.effect.CONTRADANCE
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.WALTZ_POTENCY, 50)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.WALTZ_POTENCY, 50)
end

return effect_object
