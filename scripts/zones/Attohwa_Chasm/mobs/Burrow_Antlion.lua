-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Burrow Antlion
-----------------------------------
mixins = { require('scripts/mixins/families/antlion_ambush') }
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
