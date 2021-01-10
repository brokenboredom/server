-----------------------------------
-- Area: Davoi
--  Mob: Barakbok
-- Involved in Quest: The Doorman
-----------------------------------
require("scripts/globals/settings")
-----------------------------------
local entity = {}

function onMobDeath(mob, player, isKiller)
    if (player:getCharVar("theDoormanMyMob") == 1) then
        player:addCharVar("theDoormanKilledNM", 1)
    end
end

return entity
