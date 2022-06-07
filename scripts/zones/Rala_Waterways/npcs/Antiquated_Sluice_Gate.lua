-----------------------------------
-- Area: Rala Waterways (258)
--  NPC: Antiquated_Sluice_Gate
-- !pos -529.361 -7.000 59.988 258
-----------------------------------
require('scripts/globals/instance')
require('scripts/globals/zone')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- player:startEvent(5511, 0, 8)
    if not xi.instance.onTrigger(player, npc, xi.zone.RALA_WATERWAYS_U) then
        --player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY) -- TODO: confirm this
    end
end

entity.onEventUpdate = function(player, csid, option)
    if xi.instance.onEventUpdate(player, csid, option) then
        if csid == 5511 and option == 843 then
            player:updateEvent(258, 8, 0, 1, 0, 0, 0, 1)
        elseif csid == 5511 and option == 4939 then
            player:updateEvent(258, 8, 0, 1, 0, 0, 0, 8)
        end
    end
end

entity.onEventFinish = function(player, csid, option)
    xi.instance.onEventFinish(player, csid, option)
end

return entity
