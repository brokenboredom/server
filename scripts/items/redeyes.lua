-----------------------------------
-- ID: 16120
-- redeyes
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.ANGELWING, 99 } }) -- Angelwing x99
end

return itemObject
