-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Stream Sahagin
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 127, 1, xi.regime.type.FIELDS)
end

return entity
