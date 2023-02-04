local QBCore = exports['qb-core']:GetCoreObject()
local inacopcar = false


CreateThread(function()
        while true do
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                if not inacopcar then
                    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
                    local vehicle = GetVehiclePedIsIn(ped)
                    local vehicleClass = GetVehicleClass(vehicle)
                    if DoesEntityExist(vehicle) and vehicleClass == 18 and PlayerJob == 'police' then
                        StartListeningForControlmegaphone()
                        inacopcar = true
                    end
                end
            else
                inacopcar = false
                listentokey = false
            end
            Wait(1000)
        end
end)


function StartListeningForControlmegaphone()
	listentokey = true
	CreateThread(function()
		while listentokey do
			if IsControlJustPressed(0, 61) then 
				exports["pma-voice"]:overrideProximityRange(30.0, true)
                QBCore.Functions.Notify('Megaphone on', 'success')
            elseif IsControlJustReleased(0, 61) then 
                exports["pma-voice"]:clearProximityOverride()
                QBCore.Functions.Notify('Megaphone off', 'error')
			end
			Wait(1)
		end
	end)
end