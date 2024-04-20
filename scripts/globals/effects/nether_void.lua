-----------------------------------
-- xi.effect.NETHER_VOID
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ABSORB_AMOUNT, 50)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ABSORB_AMOUNT, 50)
end

return effect_object
