-----------------------------------
-- Nott
--
-- Description: Restores MP.
--
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if mob:getPool() == 5981 then --TRUST_Sylvie_UC
		if mob:getMPP() > 50 then
			return 1
		end
	else
		return 0
	end
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local ftpmp = fTP(mob:getTP(), 0.15, 0.22, 0.35)
	
    skill:setMsg(xi.msg.basic.SKILL_RECOVERS_MP)

    return xi.mobskills.mobHealMove(mob, mob:getMaxMP() * ftpmp)
end

return mobskill_object
