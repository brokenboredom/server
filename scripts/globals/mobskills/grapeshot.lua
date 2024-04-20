-----------------------------------
--  Frypan
--
--  Description: Damage varies with TP. Additional effect: "Stun."
--  Type: Physical (Blunt)
--
--
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/mobskills")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 5
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    local typeEffect = xi.effect.STUN

    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 3, 4)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.PIERCING)
    return dmg
end

return mobskill_object
