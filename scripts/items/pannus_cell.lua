-----------------------------------
-- Pannus Cell
-- ID 5376
-- Removes STR Down effect
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.salvage.onCellItemCheck(target, xi.effect.DEBILITATION, 0x001)
end

itemObject.onItemUse = function(target)
    return xi.salvage.onCellItemUse(target, xi.effect.DEBILITATION, 0x001, 11)
end

return itemObject
