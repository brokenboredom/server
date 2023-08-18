-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Stone Monument
-- Note: Involved in quest "An Explorer's Footsteps"
-- !pos -205.593 -23.210 -119.670 115
-----------------------------------
local ID = zones[xi.zone.WEST_SARUTABARUTA]
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(900)
end

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.items.LUMP_OF_SELBINA_CLAY) and
        npcUtil.giveItem(player, xi.items.CLAY_TABLET)
    then
        player:confirmTrade()
        player:setCharVar("anExplorer-CurrentTablet", 0x00400)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
