local EnableESP = 0

function SetEnableESP(enable)
	EnableESP = enable
end
AddRemoteEvent("SetEnableESP", SetEnableESP)

function OnRenderHUD()
	if EnableESP ~= 1 then
		return
	end

	--local lX, lY, lZ = GetPlayerCameraLocation()
	local x, y, z
	local sX, sY
	local ScreenX, ScreenY = GetScreenSize()
	local t = { 1 }
	--local bones = GetPlayerBoneNames()
	for k, v in pairs(GetStreamedPlayers()) do
		x, y, z = GetPlayerLocation(v)
		sX, sY, sZ = WorldToScreen(x, y, z)
		if sZ ~= 0.0 then
			--local length = GetDistance3D(x, y, z, lX, lY, lZ)
			
			--DrawPoint3D(x, y, z)
			--DrawRect(sX, sY, 10.0, 40.0)
			DrawLine(ScreenX / 2, ScreenY, sX, sY)
			DrawBox(sX - 50, sY - 100, 100, 200)
			
			--[[for k2, v2 in pairs(bones) do
				local bX, bY, bZ = GetPlayerBoneLocation(v, v2)
				DrawPoint3D(bX, bY, bZ, 3.0)
			end]]--
		end
	end
end
AddEvent("OnRenderHUD", OnRenderHUD)