-----------------------------------
-- Area: West Ronfaure
--  Mob: Carrion Worm
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 1, 1, xi.regime.type.FIELDS)
end

return entity
