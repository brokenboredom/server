-----------------------------------
-- Area: Norg
--  NPC: Muzaffar
-- Quests: Black Market
-- !pos 16.678, -2.044, -14.600 252
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()
    local northernFurs = trade:hasItemQty(xi.items.NORTHERN_FUR, 4)
    local easternPottery = trade:hasItemQty(xi.items.PIECE_OF_EASTERN_POTTERY, 4)
    local southernMummies = trade:hasItemQty(xi.items.SOUTHERN_MUMMY, 4)

    if
        player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_ACCEPTED or
        player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_COMPLETED
    then
        if northernFurs and count == 4 then
            player:tradeComplete()
            player:startEvent(17, xi.items.NORTHERN_FUR, xi.items.NORTHERN_FUR)
        elseif easternPottery and count == 4 then
            player:tradeComplete()
            player:startEvent(18, xi.items.PIECE_OF_EASTERN_POTTERY, xi.items.PIECE_OF_EASTERN_POTTERY)
        elseif southernMummies and count == 4 then
            player:tradeComplete()
            player:startEvent(19, xi.items.SOUTHERN_MUMMY, xi.items.SOUTHERN_MUMMY)
        end
    end
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_ACCEPTED or
        player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_COMPLETED
    then
        player:startEvent(16)
    else
        player:startEvent(15)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 15 and option == 1 then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET)
    elseif csid == 17 then
        npcUtil.giveCurrency(player, 'gil', 1500)
        if player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_ACCEPTED then
            player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET)
        end

        player:addFame(xi.quest.fame_area.NORG, 40)
        player:addTitle(xi.title.BLACK_MARKETEER)
        player:startEvent(20)
    elseif csid == 18 then
        npcUtil.giveCurrency(player, 'gil', 2000)
        if player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_ACCEPTED then
            player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET)
        end

        player:addFame(xi.quest.fame_area.NORG, 50)
        player:addTitle(xi.title.BLACK_MARKETEER)
        player:startEvent(20)
    elseif csid == 19 then
        npcUtil.giveCurrency(player, 'gil', 3000)
        if player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET) == QUEST_ACCEPTED then
            player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.BLACK_MARKET)
        end

        player:addFame(xi.quest.fame_area.NORG, 80)
        player:addTitle(xi.title.BLACK_MARKETEER)
        player:startEvent(20)
    end
end

return entity
