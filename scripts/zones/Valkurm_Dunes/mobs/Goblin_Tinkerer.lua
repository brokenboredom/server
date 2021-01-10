-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Goblin Tinkerer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 57, 2, tpz.regime.type.FIELDS)
end

return entity
