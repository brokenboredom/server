-----------------------------------
-- Area: The Boyahda Tree
--   NM: Leshonki
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 360)
end

return entity
