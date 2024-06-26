-----------------------------------
-- Area: Beadeaux [S]
--  Mob: Gold Quadav
-- Note: PH for Da'Dha Hundredmask
-----------------------------------
local ID = zones[xi.zone.BEADEAUX_S]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.DA_DHA_HUNDREDMASK_PH, 12, 7200) -- 2 hours
end

return entity
