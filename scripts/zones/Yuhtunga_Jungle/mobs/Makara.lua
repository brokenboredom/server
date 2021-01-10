-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Makara
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 127, 2, tpz.regime.type.FIELDS)
end

return entity
