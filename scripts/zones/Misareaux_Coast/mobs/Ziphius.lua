-----------------------------------
-- Area: Misareaux Coast
--   NM: Ziphius
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 445)
end

return entity
