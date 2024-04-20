-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Loose sand
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.MIMEO_JEWEL) then
        player:setPos(320, -27, -30, 7)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
