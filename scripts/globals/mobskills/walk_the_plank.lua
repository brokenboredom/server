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
	local dInt = mob:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
	local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, 
	 xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.LIGHT, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    local typeEffect = xi.effect.BIND

    if dmg > 0 then
        if not target:hasStatusEffect(typeEffect) then
            duration = 30 *  xi.mobskills.applyPlayerResistance(mob, typeEffect, target, dInt, 0, xi.magic.ele.LIGHT)
			target:addStatusEffect(typeEffect, 1, 3, duration)
		end
	end
	
	target:dispelStatusEffect()

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.BLUNT)
    return dmg
end

return mobskill_object
