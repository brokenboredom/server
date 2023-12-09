-----------------------------------
-- func: animatenpc
-- desc: Changes the animation of the given npc. (For testing purposes.)
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'ss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!animatenpc (npcID) <animationID>')
end

commandObj.onTrigger = function(player, arg1, arg2)
    local targ
    local animationId

    if arg2 == nil then
        -- player did not provide npcId.  Shift arguments by one.
        targ = player:getCursorTarget()
        animationId = arg1
    else
        -- player provided npcId and animationId.
        targ = GetNPCByID(tonumber(arg1))
        animationId = arg2
    end

    -- validate target
    if targ == nil then
        error(player, 'You must either enter a valid npcID or target an NPC.')
        return
    end

    if not targ:isNPC() then
        error(player, 'Targeted entity is not an NPC.')
        return
    end

    -- validate animationID
    if animationId ~= nil then
        animationId = tonumber(animationId) or xi.anim[string.upper(animationId)]
    end

    if animationId == nil then
        error(player, 'Invalid animationID.')
        return
    end

    local oldAnimation = targ:getAnimation()
    targ:setAnimation(animationId)
    player:printToPlayer(string.format('NPC ID: %i - %s | Old animation: %i | New animation: %i\n', targ:getID(), targ:getName(), oldAnimation, animationId))
end

return commandObj
