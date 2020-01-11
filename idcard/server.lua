local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

local function GetNearestPlayer(player, distanceMax)
    local x, y, z = GetPlayerLocation(player)
    local listStreamed = GetStreamedPlayersForPlayer(player)
    local closestDistance = 50000
    local otherPlayer
    local _x, _y, _z
    for k,v in pairs(listStreamed) do
        _x, _y, _z = GetPlayerLocation(v)
	    local tmpDistance = GetDistance3D(x, y, z, _x, _y, _z)
	    if(tmpDistance < closestDistance and v ~= player and tmpDistance < distanceMax) then
		closestDistance = tmpDistance
		otherPlayer = v
	    end
    end
    if(otherPlayer ~= nil) then
	return {otherPlayer, _x, _y, _z}
    end
    return
end

AddRemoteEvent("SeeIdCard", function(player)
    -- Coming soon: job and jobTitle
    -- CallRemoteEvent(player, "OnCardDataLoaded", PlayerData[player].name, playerInfo['company']['name'], playerInfo['job'])
    local job = PlayerData[player].job
    if job == "" then
        job = "Citizen"
    end
    CallRemoteEvent(
        player, 
        "OnCardDataLoaded", 
        PlayerData[player].accountid, 
        PlayerData[player].name,
        PlayerData[player].driver_license == 1, 
        PlayerData[player].gun_license == 1, 
        PlayerData[player].helicopter_license == 1,
        job
    )
end)

AddRemoteEvent("ShowIdCard", function(player)
    local nearestPlayer = GetNearestPlayer(player, 115)
    if(nearestPlayer ~= nil) then
	    CallRemoteEvent(nearestPlayer[1], "OnCardDataLoaded", PlayerData[player].accountid, PlayerData[player].name)
    else
        CallRemoteEvent(player, 'KNotify:Send', _("no_players_around"), "#f00")
	end
    -- Coming soon: job and jobTitle
    -- CallRemoteEvent(player, "OnCardDataLoaded", PlayerData[player].name, playerInfo['company']['name'], playerInfo['job'])
    
end)