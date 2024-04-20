-----------------------------------
-- Trust: Sylvie UC
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)
    local master = mob:getMaster()
    local mJob   = master:getMainJob()
	local power = mJob/5
    
    mob:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 6, 3, 0, xi.effect.GEO_MAGIC_ATK_BOOST, power, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
	
	--mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)
    mob:SetAutoAttackEnabled(false)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
