-----------------------------------
-- Area: Ruhotz Silvermines
--  Mob: Lambton Worm
-----------------------------------
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.LAMBTON_WORM_DESEGMENTER)
end

return entity
