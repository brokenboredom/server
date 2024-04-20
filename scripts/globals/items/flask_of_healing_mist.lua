-----------------------------------
-- ID: 5835
-- Item: 
-- Item Effect: Heals valid targets in AoE range.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    
    return 0
end

item_object.onItemUse = function(target)
    local members = target:getPartyWithTrusts()
	local final = 600
	for i,v in pairs(members) do
		v:addHP(final)
		v:messageBasic(tpz.msg.basic.RECOVERS_HP, 0, final)
	end
end

return item_object
