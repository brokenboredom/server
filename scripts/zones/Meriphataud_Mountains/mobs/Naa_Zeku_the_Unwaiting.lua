-----------------------------------
-- Area: Meriphataud Mountains
--   NM: Naa Zeku the Unwaiting
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 271)
end

return entity
