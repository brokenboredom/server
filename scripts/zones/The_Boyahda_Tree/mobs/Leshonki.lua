-----------------------------------
-- Area: The Boyahda Tree
--   NM: Leshonki
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 360)
end

return entity
