-----------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Greed
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 185)
end

return entity
