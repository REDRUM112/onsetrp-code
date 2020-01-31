local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

StylistNPCObjectsCached = { }
StylistNPCTable = {
	{
		location = { 211665, 174487, 1307, 90}
		
	}
}

-- Event ----------------------------------------------------

AddEvent("OnPackageStart", function()
	for k,v in pairs(StylistNPCTable) do
		v.npc = CreateNPC(v.location[1], v.location[2], v.location[3], v.location[4])
		CreateText3D(_("stylist").."\n".._("press_e"), 18, v.location[1], v.location[2], v.location[3] + 120, 0, 0, 0)
		table.insert(StylistNPCObjectsCached, v.npc)
	end
end)


AddEvent("OnPlayerJoin", function(player)
	CallRemoteEvent(player, "stylistSetup", StylistNPCObjectsCached)
end)

AddRemoteEvent("stylistInteract", function(player, stylistobject)
    local stylist = GetStylistByObject(stylistobject)
	if stylist then
		CallRemoteEvent(player, "openStylist")
	end
end)

AddRemoteEvent("startModify", function(player)
	CallRemoteEvent(player, "openModify", hairsModel, shirtsModel, pantsModel, shoesModel, hairsColor)
end)

AddRemoteEvent("ModifyEvent", function(player, hairsChoice, shirtsChoice, pantsChoice, shoesChoice, colorChoice)
local clothesRequest = "[\""..hairsModel[hairsChoice].."\",\""..colorChoice.."\",\""..shirtsModel[shirtsChoice].."\",\""..pantsModel[pantsChoice].."\",\""..shoesModel[shoesChoice].."\"]"
	if GetPlayerCash(player) < 200 then
		return CallRemoteEvent(player, 'KNotify:Send', _("not_enought_cash"), "#f00")
	else
		RemovePlayerCash(player, 200)
		CallRemoteEvent(player, 'KNotify:Send', _("clothes_changed"), "#0f0")
	end

	local query = mariadb_prepare(sql, "UPDATE accounts SET clothing = '?' WHERE id = ? LIMIT 1;",
	clothesRequest,
	player
	)
        
	mariadb_query(sql, query)
	
	PlayerData[player].clothing = {}
	table.insert(PlayerData[player].clothing, hairsModel[hairsChoice])
    table.insert(PlayerData[player].clothing, colorChoice)
    table.insert(PlayerData[player].clothing, shirtsModel[shirtsChoice])
    table.insert(PlayerData[player].clothing, pantsModel[pantsChoice])
    table.insert(PlayerData[player].clothing, shoesModel[shoesChoice])

	UpdateClothes(player)
	SavePlayerAccount(player)
end)

-- Function ----------------------------------------------------

function GetStylistByObject(stylistobject)
	for k,v in pairs(StylistNPCObjectsCached) do
		if v == stylistobject then
			return v
		end
	end
	return nil
end
