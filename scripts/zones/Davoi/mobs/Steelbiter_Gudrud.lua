-----------------------------------
-- Area: Davoi
--   NM: Steelbiter Gudrud
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 194)
end

return entity
