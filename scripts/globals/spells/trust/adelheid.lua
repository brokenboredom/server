-----------------------------------
-- Trust: Adelheid
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spell_object.onSpellCast = function(caster, target, spell)

    -- Records of Eminence: Alter Ego: Adelheid
    if caster:getEminenceProgress(936) then
        xi.roe.onRecordTrigger(caster, 936)
    end

    return xi.trust.spawn(caster, spell)
end

spell_object.onMobSpawn = function(mob)
	local dayElement = VanadielDayElement()
	local helixFamily = 0
	local stormEffect = 0
	local stormFamily = 0
	local nukeFamily = 0
	if dayElement == xi.magic.ele.FIRE then
		helixFamily = xi.magic.spellFamily.PYROHELIX
		stormFamily = xi.magic.spellFamily.FIRESTORM
		stormEffect = xi.effect.FIRESTORM
		nukeFamily = xi.magic.spellFamily.FIRE
	elseif dayElement == xi.magic.ele.ICE then
		helixFamily = xi.magic.spellFamily.CRYOHELIX
		stormFamily = xi.magic.spellFamily.ICESTORM
		stormEffect = xi.effect.ICESTORM
		nukeFamily = xi.magic.spellFamily.BLIZZARD
	elseif dayElement == xi.magic.ele.WATER then
		helixFamily = xi.magic.spellFamily.HYDROHELIX
		stormFamily = xi.magic.spellFamily.RAINSTORM
		stormEffect = xi.effect.RAINSTORM
		nukeFamily = xi.magic.spellFamily.WATER
	elseif dayElement == xi.magic.ele.WIND then
		helixFamily = xi.magic.spellFamily.ANEMOHELIX
		stormFamily = xi.magic.spellFamily.WINDSTORM
		stormEffect = xi.effect.WINDSTORM
		nukeFamily = xi.magic.spellFamily.AERO
	elseif dayElement == xi.magic.ele.EARTH then
		helixFamily = xi.magic.spellFamily.GEOHELIX
		stormFamily = xi.magic.spellFamily.SANDSTORM
		stormEffect = xi.effect.SANDSTORM
		nukeFamily = xi.magic.spellFamily.STONE
	elseif dayElement == xi.magic.ele.THUNDER then
		helixFamily = xi.magic.spellFamily.IONOHELIX
		stormFamily = xi.magic.spellFamily.THUNDERSTORM
		stormEffect = xi.effect.THUNDERSTORM
		nukeFamily = xi.magic.spellFamily.THUNDER
	elseif dayElement == xi.magic.ele.LIGHT then
		helixFamily = xi.magic.spellFamily.LUMINOHELIX
		stormFamily = xi.magic.spellFamily.AURORASTORM
		stormEffect = xi.effect.AURORASTORM
		nukeFamily = xi.magic.spellFamily.NONE
	elseif dayElement == xi.magic.ele.DARK then
		helixFamily = xi.magic.spellFamily.NOCTOHELIX
		stormFamily = xi.magic.spellFamily.VOIDSTORM
		stormEffect = xi.effect.VOIDSTORM
		nukeFamily = xi.magic.spellFamily.NONE
	end

    xi.trust.message(mob, xi.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ADDENDUM_BLACK, ai.r.JA, ai.s.SPECIFIC, xi.ja.DARK_ARTS)
    -- TODO: Restrict Addendum Black to Level 30+
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ADDENDUM_BLACK, ai.r.JA, ai.s.SPECIFIC, xi.ja.ADDENDUM_BLACK)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    -- TODO: Choose Storms based on Mob Weakness before falling back to matching day
    mob:addSimpleGambit(ai.t.SELF, ai.c.NO_STORM, 0, ai.r.MA, ai.s.STORM_DAY, 0, 0)

    -- TODO: Choose Helix based on Mob Weakness before falling back to matching day
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.HELIX, ai.r.MA, ai.s.HELIX_DAY, 0, 0)

    mob:addSimpleGambit(ai.t.TANK, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 33, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    -- TODO: Add Magic Burst Logic to Gambits to MB with Helix corresponding to SC
	mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE, 15)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, nukeFamily, 15)
end

spell_object.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DESPAWN)
end

spell_object.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.message_offset.DEATH)
end

return spell_object
