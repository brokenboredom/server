-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Balakaf
-- Type: Standard NPC
-- !pos 25.505 -6.999 126.478 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/equipment")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/weaponskillids")
local entity = {}

entity.onTrade = function(player, npc, trade)
	if (trade:hasItemQty(2187, 25) and trade:getItemCount() == 25) then --25 imp. gold pieces
		local mainJobId = player:getMainJob()
		-- Ensure the GM has room to obtain the item...
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, BaseNyzulWeapons[mainJobId] )
			
			return
		end
		player:tradeComplete()
		player:addItem( BaseNyzulWeapons[mainJobId] )
		player:messageSpecial( ID.text.ITEM_OBTAINED, BaseNyzulWeapons[mainJobId] )
		
	else
		player:PrintToPlayer("Something wrong?")
	end
	
end

entity.onTrigger = function(player, npc)

	player:PrintToPlayer("Sorrowful Sage won't let you into Nyzul eh?")
	player:PrintToPlayer("I might be willing to misplace certain \"research materials\" that we've got stored away...")
	player:PrintToPlayer("For a price that is... Let's say, 25 Imperial Gold Pieces.")
	--DEBUG
	--local mainJobId = player:getMainJob()
	--player:PrintToPlayer(string.format("%d",mainJobId))
	--player:addItem( BaseNyzulWeapons[8] )
	--player:messageSpecial( ID.text.ITEM_OBTAINED, BaseNyzulWeapons[8] )
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
