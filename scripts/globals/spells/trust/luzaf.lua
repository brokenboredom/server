-----------------------------------
-- Trust: Luzaf
-----------------------------------
require("scripts/globals/trust")
require("scripts/globals/job_utils/corsair")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
	master = mob:getMaster()
	masterMainJob = master:getMainJob()
    xi.trust.message(mob, xi.trust.message_offset.SPAWN)
	
	mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
	
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.JA, ai.s.SPECIFIC, xi.ja.ICE_SHOT, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.BIO, ai.r.JA, ai.s.SPECIFIC, xi.ja.DARK_SHOT, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.DIA, ai.r.JA, ai.s.SPECIFIC, xi.ja.LIGHT_SHOT, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.POISON, ai.r.JA, ai.s.SPECIFIC, xi.ja.WATER_SHOT, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.SLOW, ai.r.JA, ai.s.SPECIFIC, xi.ja.EARTH_SHOT, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.SILENCE, ai.r.JA, ai.s.SPECIFIC, xi.ja.WIND_SHOT, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, xi.effect.STUN, ai.r.JA, ai.s.SPECIFIC, xi.ja.THUNDER_SHOT, 60)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.TRIPLE_SHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.TRIPLE_SHOT)

end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
