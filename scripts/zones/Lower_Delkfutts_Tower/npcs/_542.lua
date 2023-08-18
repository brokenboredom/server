-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Cermet Door for Basty Ambassador
-- Bastok Mission 3.3 "Appointment to Jeuno"
-- !pos 596 16 -19 184
-----------------------------------
local ID = zones[xi.zone.LOWER_DELKFUTTS_TOWER]
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
