-----------------------------------
-- Ability: Clarion Call
-- Description: Increases the number of songs that can affect party members by one.
-- Obtained: BRD Level 96
-- Recast Time: 01:00:00
-- Duration: 0:03:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.CLARION_CALL, 10, 0, 180)
end

return abilityObject
