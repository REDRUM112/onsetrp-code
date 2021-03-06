local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end
local GPSlocations = {
	{name="Cocaine farm", show=true, locations={
		{x=-220692,y=-85078,z=187}
	}},
	{name="Cocaine Lab", show=true, locations={
		{x=-177203,y=3759,z=2009}
	}},
	{name="Known Acetone location", show=true, locations={
		{x=-186594,y=-36751,z=1148}
	}},
	{name="Known Opium Poppy Field", show=true,locations={
		{x=130085,y=177023,z=1381}
	}},
	{name="Known Calcium location", show=true,locations={
		{x=137745,y=209936,z=1292}
	}},
	{name="Heroin Lab", show=true, locations={
		{x=-5992,y=118385,z=1387}
	}},
	{name="Iron Ore Processing", show=true, locations={
		{x=-82629,y=90991,z=481}
	}},
	{name="Iron Ingot Processing", show=true, locations={
		{x=-191437,y=-31107,z=1148}
	}},
	{name="Acomore", show=true, locations={
		{x=162725,y=205080,z=1358}
	}},
	{name="Tesno", show=true, locations={
		{x=-19525,y=-6205,z=2062}
	}},
	{name="Pinewood", show=true, locations={
		{x=-169735, y=-38014, z=1146}
	}},
	{name="Steveville", show=true, locations={
		{x=42081,y=135863,z=1572}
	}},
	{name="Nearest Store", show=true, locations={
		{x=128765,y=77854,z=1577},
		{x=42650,y=138188,z=1581},
		{x=-15391,y=-2588,z=2065},
		{x=-168934,y=-39183,z=1149},
		{x=171131,y=203562,z=1413},
	}},
	{name="Nearest Weapon Store", show=true, locations={
		{x=-181943,y=-40668,z=1163},
		{x=206067,y=193102,z=1357}
	}},
	{name="Nearest Garage", show=true, locations={
		{x=126574,y=74560,z=1567},
		{x=22083,y=146617,z=1560},
		{x=-16207,y=-8641,z=2062},
		{x=-161738,y=192055,z=1361},
		{x=207317,y=169364,z=1306}
	}},
	{name="Nearest Car Dealership",show=true, locations={
		{x=127891,y=81206,z=1566},
		{x=207113,y=171199,z=1330}
	}},
	{name="Nearest ATM",show=true,locations={
		{x=212950 ,y=190500,z=1250},
		{x=213419,y=190723,z=1250},
		{x=212908,y=189890,z=1250},
		{x=116650,y=163194,z=2980},
		{x=129240,y=77945,z=1500},
		{x=-15000,y=-2385,z=2000},
		{x=43900,y=133143,z=1500},
		{x=213426,y=190578,z=1309},
		{x=-168797,y=-39550,z=1050}
	}},
	{name="Nearest Job Center",show=true,locations={
		{x=213003,y=174652,z=1307}
	}}
}  

local myNumber = 0
local open = false
local ui = 0
function OnPackageStart()
	Delay(1500, function()
		ui = CreateWebUI(0, 0, 0, 0, 5, 40)
		LoadWebFile(ui, "http://asset/onsetrp/phone/gui/_phone.html")
		SetWebAlignment(ui, 0.0, 0.0)
		SetWebAnchors(ui, 0.0, 0.0, 1.0, 1.0)
		SetWebVisibility(ui, WEB_HIDDEN)
	end)
	
end
AddEvent("OnPackageStart", OnPackageStart)

AddEvent("Kuzkay:PhoneLoaded", function()
	CallRemoteEvent("Kuzkay:GetPhoneNumber")
	ExecuteWebJS(ui, "ClearTweets();")

	for k,v in pairs(GPSlocations) do
		if v.show then
			ExecuteWebJS(ui, "AddGPS('"..v.name.."','".. k .."','".. 0 .."','".. 0 .."');")
		end
	end

end)

local cooldown = false
local cooldown2 = false

function OnKeyPress(key)
	if key == "K" and not GetPlayerPropertyValue(GetPlayerId(), 'cuffed') and (not UIOpen or open == true) then
		TogglePhone()
		cooldown = false
		cooldown2 = false
	end
	if key == "Escape" then
		if open then
			UIOpen = false
			open = false
			SetWebVisibility(ui, WEB_HIDDEN)
			SetIgnoreLookInput(false)
			ShowMouseCursor(false)
			SetInputMode(INPUT_GAME)
			CallRemoteEvent("Kuzkay:PlayAnim", "PHONE_PUTAWAY")
		end
	end
end
AddEvent("OnKeyPress", OnKeyPress)

function TogglePhone()
	open = not open
	if open then
		UIOpen = true		
		SetWebVisibility(ui, WEB_VISIBLE)
		SetIgnoreLookInput(true)
		ShowMouseCursor(true)
		SetInputMode(INPUT_GAMEANDUI)
		CallRemoteEvent("Kuzkay:PlayAnim", "PHONE_TAKEOUT")
	else
		UIOpen = false
		SetWebVisibility(ui, WEB_HIDDEN)
		SetIgnoreLookInput(false)
		SetIgnoreMoveInput(false)
		ShowMouseCursor(false)
		SetInputMode(INPUT_GAME)
		CallRemoteEvent("Kuzkay:PlayAnim", "PHONE_PUTAWAY")
	end
end

function SetInputFocus(bool)
	if bool == "true" then
		SetIgnoreMoveInput(true)
		SetInputMode(INPUT_UI)
	else
		SetIgnoreMoveInput(false)
		if open then
			SetInputMode(INPUT_GAMEANDUI)
		end
	end
end
AddEvent("Kuzkay:PhoneInputFocus", SetInputFocus)

function SetPlayerNumber(number)
	myNumber = number
	ExecuteWebJS(ui, "SetMyNumber('"..number.."');")
end
AddRemoteEvent("Kuzkay:PhoneSetClientNumber", SetPlayerNumber)

local waypoints = {}
function SetLocationWaypoint(name,x,y,z)
	if name ~= "Location" then
		local nearest = 0
		local nearestDist = 9999999

		local px,py,pz = GetPlayerLocation()
		for k,v in pairs(GPSlocations[tonumber(x)].locations) do

			if nearestDist > GetDistance3D(px,py,pz, v.x, v.y, v.z) then
				nearest = v
				nearestDist = GetDistance3D(px,py,pz, v.x, v.y, v.z)
			end

		end

		x = nearest.x
		y = nearest.y
		z = nearest.z
	end

	if waypoints[name] ~= nil then
		DestroyWaypoint(waypoints[name])
		waypoints[name] = nil
	else
		if nearest ~= 0 then
			waypoints[name] = CreateWaypoint(x,y,z,name)
		end
		CallEvent('KNotify:Send', _("gps_location_set"), "#0f0")
	end
end
AddEvent("Kuzkay:PhoneSetLocation", SetLocationWaypoint)


function SetCooldown()
	cooldown = true
	Delay(1500, function()
		cooldown = false
	end)
end



function SetCooldown2()
	cooldown2 = true
	Delay(1500, function()
		cooldown2 = false
	end)
end

function AddContact(number, name)
	if not cooldown then
		CallRemoteEvent("Kuzkay:PhoneAddContact", number, name)
		SetCooldown()
	else
		CallEvent('KNotify:Send', _("wait_before_doing_again"), "#f00")
	end
end
AddEvent("Kuzkay:PhoneAddContact", AddContact)

function InsertContact(number, name)
	ExecuteWebJS(ui, "AddContact("..number..",'"..name.."');")
end
AddRemoteEvent("Kuzkay:PhoneInsertContact", InsertContact)

function SendTweet(text)
	if not cooldown then
		CallRemoteEvent("Kuzkay:PhoneSendTweet", text)
		SetCooldown()
	else
		CallEvent('KNotify:Send', _("wait_before_doing_again"), "#f00")
	end
end
AddEvent("Kuzkay:PhoneTweet", SendTweet)

function RecieveTweet(sender, text)
	ExecuteWebJS(ui, "AddTweet('"..sender.."','"..text.."');")
	AddPlayerChat('<span color="#020aff" size="17">['.."twitter"..']</><span> @'..string.gsub(sender, "%s+", "")..': </> '..text)
end
AddRemoteEvent("Kuzkay:PhoneRecieveTweet", RecieveTweet)


function SendMessage(number, text)
	if not cooldown then
		CallRemoteEvent("Kuzkay:PhoneSendMessage", number, text)
		SetCooldown()
	else
		CallEvent('KNotify:Send', _("wait_before_doing_again"), "#f00")
	end
end
AddEvent("Kuzkay:PhoneMessage", SendMessage)


function RecieveMessage(sender, senderNumber, number, text, job)
	number = math.floor(tonumber(number))
	if text == nil then
		return
	end
	
	if number == tonumber(myNumber) or sender == GetPlayerId() then

		if sender == GetPlayerId() then
			ExecuteWebJS(ui, "AddMessage("..number..",'"..text.."','sent');")
		else
			ExecuteWebJS(ui, "AddMessage("..senderNumber..",'"..text.."','recieved');")
			CallEvent('KNotify:Send', _("message_received", senderNumber), "#0f0")
			if GetWebVisibility(ui) == WEB_HIDDEN then
				local sound = CreateSound("utils/vibration.wav")
				Delay(1000, function()
					DestroySound(sound)
				end)
			end
		end
	else
		if (number == 999 and job == "police") or (number == 998 and job == "medic") or (number == 911 and (job == "police" or job == "ems")) then
			ExecuteWebJS(ui, "AddMessage("..number..",'"..text.."','job');")
			CallEvent('KNotify:Send', _("emergency_received", senderNumber, number), "#0f0")
			if GetWebVisibility(ui) == WEB_HIDDEN then
				local sound = CreateSound("utils/vibration.wav")
				Delay(1000, function()
					DestroySound(sound)
				end)
			end

		end
	end
end
AddRemoteEvent("Kuzkay:PhoneRecieveMessage", RecieveMessage)

function DeleteContact(number)
	CallRemoteEvent("Kuzkay:PhoneDeleteContact", number)
end
AddEvent("Kuzkay:PhoneDeleteContact", DeleteContact)


function SendLocationMessage(number)
	if not cooldown2 then
		CallRemoteEvent("Kuzkay:PhoneSendLocationMessage", number)
		SetCooldown2()
	else
		CallEvent("KNotify:Send", "Wait before doing this again", "#f00")
	end
end
AddEvent("Kuzkay:PhoneLocationMessage", SendLocationMessage)

function RecieveLocationMessage(sender, senderNumber, number, x, y, z, job)
	number = math.floor(tonumber(number))
	if tonumber(number) == tonumber(myNumber) or sender == GetPlayerId() then
		if sender == GetPlayerId() then
			ExecuteWebJS(ui, "AddLocationMessage("..number..","..x..","..y..","..z..");")
		else
			ExecuteWebJS(ui, "AddLocationMessage("..senderNumber..","..x..","..y..","..z..");")
		end
	else
		if ((number == 999 and job == "police") or (number == 998 and job == "medic") or (number == 911 and (job == "police" or job == "medic"))) then
			ExecuteWebJS(ui, "AddLocationMessage("..number..","..x..","..y..","..z..");")
		end
	end
end
AddRemoteEvent("Kuzkay:PhoneRecieveLocationMessage", RecieveLocationMessage)