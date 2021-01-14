-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Vanguard Partisan
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
local ID = require("scripts/zones/Dynamis-Beaucedine/IDs")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob, ID.mob.MAA_ZAUA_THE_WYRMKEEPER_PH, 10, 1200) -- 20 minutes
end

return entity
