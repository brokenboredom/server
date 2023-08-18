-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Kindred White Mage
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = zones[xi.zone.DYNAMIS_XARCABARD]
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.PRINCE_SEERE_PH, 10, 1200) -- 20 minutes
end

return entity
