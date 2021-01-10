-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Thread Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 57, 1, tpz.regime.type.FIELDS)
end

return entity
