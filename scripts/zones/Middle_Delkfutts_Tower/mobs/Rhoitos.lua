-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Rhoitos
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 336)
end

return entity
