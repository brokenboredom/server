-----------------------------------
-- Area: Rolanberry Fields [S]
--  Mob: Ochu
-- Note: PH for Delicieuse Delphine
-----------------------------------
local ID = zones[xi.zone.ROLANBERRY_FIELDS_S]
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.DELICIEUSE_DELPHINE_PH, 10, 3600) -- 1 hour
end

return entity
