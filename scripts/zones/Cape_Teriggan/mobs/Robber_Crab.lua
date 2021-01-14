-----------------------------------
-- Area: Cape Teriggan
--  Mob: Robber Crab
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 105, 1, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 106, 1, tpz.regime.type.FIELDS)
end

return entity
