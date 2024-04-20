-----------------------------------
-- ID: 15761
-- Item: chariot band
-- Experience point bonus
-----------------------------------
-- Bonus: +75%
-- Duration: 720 min
-- Max bonus: 10000 exp
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.DEDICATION) then
        result = 56
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.DEDICATION, 75, 0, 3600,0)
end

return item_object
