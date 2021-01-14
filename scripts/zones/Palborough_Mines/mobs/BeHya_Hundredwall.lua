-----------------------------------
-- Area: Palborough Mines
--   NM: Be'Hya Hundredwall
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 222)
end

return entity
