-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Koo Saxu the Everfast
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special"),
    require("scripts/mixins/remove_doom")
}
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
end

return entity
