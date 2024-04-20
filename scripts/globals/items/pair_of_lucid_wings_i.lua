-----------------------------------
-- ID: 4202
-- Daedalus Wing
-- Increases TP of the user by 100
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    
    return 0
end

item_object.onItemUse = function(target)
    local members = target:getPartyWithTrusts()
	local final = 1000
	for i,v in pairs(members) do
		v:addTP(final)

	end
end

return item_object
