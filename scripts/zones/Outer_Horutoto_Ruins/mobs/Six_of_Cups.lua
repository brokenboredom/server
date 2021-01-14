-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Six of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 665, 1, tpz.regime.type.GROUNDS)
end

return entity
