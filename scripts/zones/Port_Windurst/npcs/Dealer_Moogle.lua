-----------------------------------
-- Area: Port Windurst
--  NPC: Dealer Moogle
-- Working 0%
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/settings/main")
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
	--Trade me tickets! Earn Silver Points!
	--local itemRange = 28670 --99 Cap No iLvl
	math.randomseed( os.time() )
	local itemRange = 28670 --75 cap
	local augmentRange = 1652 --only currently implemented
	local cost = 10000
	local k = math.random(1,4)
	local a = {0,0,0,0}
	local v = {0,0,0,0}
	if (trade:hasItemQty(65535, cost) and trade:getItemCount() == 1) then
		--R R R Random item!!!
		
		local itemID = math.random(0,itemRange)
		
		for i=1,k do
			a[i] = math.random(0,augmentRange)
			v[i] = math.random(0,10)
		end
		
		-- Ensure the GM has room to obtain the item...
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemID )
			
			return
		end
        if  player:hasItem(itemID) then
            player:PrintToPlayer("Looks like you already have one of those.")
            return
        end
		-- remove gil
		player:delGil(cost)
		player:PrintToPlayer(string.format("Removed %i gil from %s.  They now have %i gil.", cost, player:getName(), player:getGil()))
		player:addItem( itemID, 1, a[1], v[1], a[2], v[2], a[3], v[3], a[4], v[4] , 0)
		player:messageSpecial( ID.text.ITEM_OBTAINED, itemID )
    elseif ( trade:hasItemQty(65535, 100000) and trade:getItemCount() == 2 ) then
        
        for i = 0, trade:getSlotCount()-1 do
        itemID = trade:getItemId(i)
        itemQty = trade:getItemQty(itemID)
        
        --player:PrintToPlayer(string.format("itemId: %d, slot: %d", itemID, i))
        end
        
        --R R R Random item!!!
		for i=1,k do
			a[i] = math.random(0,augmentRange)
			v[i] = math.random(0,10)
		end
		-- Ensure the GM has room to obtain the item...
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemID )
			
			return
		end
        
		-- remove gil
		--player:delGil(100000)
        player:tradeComplete()
		player:PrintToPlayer(string.format("Removed %i gil from %s.  They now have %i gil.", 100000, player:getName(), player:getGil()))
		player:addItem( itemID, 1, a[1], v[1], a[2], v[2], a[3], v[3], a[4], v[4] , 0)
		player:messageSpecial( ID.text.ITEM_OBTAINED, itemID )
    end
end

entity.onTrigger = function(player, npc)
	player:PrintToPlayer(string.format("They call me Gato. I have metal joints."))
	player:PrintToPlayer(string.format("Trade me 10,000g. And earn 15 Silver Points!"))
    player:PrintToPlayer(string.format("Or trade me an item and 100,000g for a gold prize."))
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
