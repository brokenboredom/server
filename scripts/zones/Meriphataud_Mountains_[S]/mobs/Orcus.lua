-----------------------------------
-- Area: Meriphataud Mountains [S]
--  VNM: Orcus
-----------------------------------
require("scripts/globals/titles")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ORCUS_TROPHY_HUNTER)
end

return entity
