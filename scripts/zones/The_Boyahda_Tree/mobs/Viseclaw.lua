-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Viseclaw
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 726, 1, tpz.regime.type.GROUNDS)
end

return entity
