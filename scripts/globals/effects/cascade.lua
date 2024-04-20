-----------------------------------
-- xi.effect.CASCADE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    --target:addMod(xi.mod.MATT, 100)
    target:addMod(xi.mod.MAGIC_DAMAGE, effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    --target:delMod(xi.mod.MATT, 100)
    target:delMod(xi.mod.MAGIC_DAMAGE, effect:getPower())
end

return effect_object
