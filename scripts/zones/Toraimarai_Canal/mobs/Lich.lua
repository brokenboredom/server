-----------------------------------
-- Area: Toraimarai Canal
--  Mob: Lich
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 619, 2, xi.regime.type.GROUNDS)
end

return entity
