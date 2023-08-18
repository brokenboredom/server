-----------------------------------
-- Area: Davoi
--  Mob: Orcish Brawler
-- Note: PH for Poisonhand Gnadgad
-----------------------------------
local ID = zones[xi.zone.DAVOI]
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.POISONHAND_GNADGAD_PH, 10, 3600) -- 1 hour
end

return entity
