-----------------------------------
-- Zone: Windurst-Jeuno_Airship
-----------------------------------
local ID = zones[xi.zone.WINDURST_JEUNO_AIRSHIP]
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0 then
        player:setPos(math.random(-4, 4), 1, math.random(-23, -12))
    end

    return cs
end

zoneObject.onTransportEvent = function(player, transport)
    player:startEvent(100)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
end

zoneObject.onEventFinish = function(player, csid, option, npc)
    if csid == 100 then
        local prevzone = player:getPreviousZone()

        if prevzone == xi.zone.PORT_JEUNO then
            player:setPos(0, 0, 0, 0, 240)
        elseif prevzone == xi.zone.PORT_WINDURST then
            player:setPos(0, 0, 0, 0, 246)
        end
    end
end

return zoneObject
