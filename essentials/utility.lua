function OnPlayerDeath(player, instigator)

 	message = '<span color="#9B0700">You were killed by '..GetPlayerName(instigator)..'('..player..')</> '
 	death = '<span color="#9B0700">You played yourself!</> '
    
    if player == instigator then return

       AddPlayerChat(player,  death)

	else

      AddPlayerChat(player,  message)

     end
end

AddEvent("OnPlayerDeath", OnPlayerDeath)

    function OnPackageStart()

	local message1 = '<span color="#575757"> Press F3 during delivery job to start/stop </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message1) end, 100000)

	local message2 = '<span color="#CBD800"> Press F4 to view your inventory </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message2) end, 500000)

	local message3 = '<span color="#00E307"> Press F1 near your vehicle for options </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message3) end, 1000000)

	local message4 = '<span color="#00DCE3"> Press G for GPS </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message4) end, 5000000)

	local message5 = '<span color="#D100FF"> Respect each others gameplay. </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message5) end, 100000)

	local message6 = '<span color="#FF6800"> Type /g [message] to enter global chat</>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message6) end, 500000)

	local message7 = '<span color="#FF00F0"> You can use animations, type /dance etc. </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message7) end, 1400000)

	local message8 = '<span color="#7B061B"> Press U to unlock your vehicle </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message8) end, 1700000)

	local message9 = '<span color="#FFCB0B"> You are playing Sunrise Roleplay </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message9) end, 2000000)

	local message10 = '<span color="#B94F00"> Visit restaurants to quench your hunger/thirst </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message10) end, 2300000)

	local message11 = '<span color="#00B99A"> If you find stuff to harvest, you can sell it! </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message11) end, 2600000)

	local message12 = '<span color="#B92200"> Press U to lock your vehicle </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message12) end, 2900000)

	local message13 = '<span color="#F33DCF"> More updates coming soon. </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message13) end, 3200000)

	local message14 = '<span color="#3D4EF3"> We are open to suggestions. </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message14) end, 3500000)

	local message15 = '<span color="#00FF2A"> Your progress is saved. </>'
	   CreateTimer(function(playerid) AddPlayerChatAll(message15) end, 3800000)
    end


local tips = {  '<span color="#e8e6be"> Checkout our Community forums @ bulbhost.com</>', '<span color="#e8e6be">Thanks for playing on our server!</>' }
for i in pairs(tips) do
 CreateTimer(function() AddPlayerChatAll(tips[i])
end, 900000)
end
 
AddRemoteEvent("EngineOff", function(player)
local vehicle = GetPlayerVehicle(player)
	StopVehicleEngine(vehicle)
            AddPlayerChat(player, "You turn off your vehicle.")
end)	


function vc(player, r, g, b)
	if (r == nil or g == nil or b == nil) then
		return AddPlayerChat(player, "Usage: /vc 220 110 55")
	end

	local vehicle = GetPlayerVehicle(player)

	if (vehicle == 0) then
		return AddPlayerChat(player, "You must be in a vehicle")
	end

	if (GetPlayerVehicleSeat(player) ~= 1) then
		return AddPlayerChat(player, "You must be the driver of the vehicle")
	end

	SetVehicleColor(vehicle, RGB(r, g, b))
	AddPlayerChat(player, "New vehicle color applied.")
end
AddCommand("vc", vc)