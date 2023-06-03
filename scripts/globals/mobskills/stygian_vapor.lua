-----------------------------------
-- Stygian Vapor
-- Description: AoE Powerful plague
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.PLAGUE

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 5, 0, 60))

    return typeEffect
end

return mobskillObject
