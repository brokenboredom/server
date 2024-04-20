-----------------------------------
-- King Cobra Clamp
-- Damage varies with TP.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Skillchain Properties: Fragmentation-IconFragmentation
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
	local duration = 60
	local dInt = mob:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg(), xi.magic.ele.FIRE, dmgmod, xi.mobskills.magicalTpBonus.DMG_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.MAGICAL, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    if dmg > 0 then
        if not target:hasStatusEffect(xi.effect.DEFENSE_DOWN) then
			---- effect = xi.effect.WHATEVER if enfeeble
			-- statmod = the stat to account for resist (INT, MND, etc) e.g. xi.mod.INT
			-- This determines how much the monsters ability resists on the player.
			--xi.mobskills.applyPlayerResistance = function(mob, effect, target, diff, bonus, element)
			
            duration = 60 *  xi.mobskills.applyPlayerResistance(mob, xi.effect.DEFENSE_DOWN, target, dInt, 0, xi.magic.ele.FIRE)
			target:addStatusEffect(xi.effect.DEFENSE_DOWN, 12, 3, duration)
		end
		if not target:hasStatusEffect(xi.effect.MAGIC_DEF_DOWN) then
            duration = 60 *  xi.mobskills.applyPlayerResistance(mob, xi.effect.MAG_DEF_DOWN, target, dInt, 0, xi.magic.ele.FIRE)
			target:addStatusEffect(xi.effect.MAGIC_DEF_DOWN, 12, 3, duration)
		end
	end

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)
    return dmg
end

return mobskill_object
