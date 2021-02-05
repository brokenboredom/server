-----------------------------------
-- Ability: Tacticians's Roll
-- Grants a Regain effect to party members within area of effect.
-- Optimal Job: None
-- Lucky Number: 5
-- Unlucky Number: 8
-- Level: 86
-- Phantom Roll +1 Value: 2
--
-- Die Roll    | Regain
-- --------    -------
-- 1           |+10
-- 2           |+10
-- 3           |+10
-- 4           |+10
-- 5           |+30
-- 6           |+10
-- 7           |+10
-- 8           |+0
-- 9           |+20
-- 10          |+20
-- 11          |+40
-- Bust        |-10
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
local corsair = require("scripts/globals/job_utils/corsair")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    local effectID = tpz.effect.TACTICIANS_ROLL
    return corsair.onAbilityCheck(player, target, ability, effectID)
end

ability_object.onUseAbility = function(caster, target, ability, action)
    if caster:getID() == target:getID() then
        corsair.corsairSetup(caster, ability, action, tpz.effect.TACTICIANS_ROLL, tpz.job.COR)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return corsair.applyRoll(caster, target, ability, action, total)
end

return ability_object
