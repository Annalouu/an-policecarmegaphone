local QBCore = exports['qb-core']:GetCoreObject()
local inVeh = false

AddEventHandler('gameEventTriggered', function(name, args)
if name == "CEventNetworkPlayerEnteredVehicle" then
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
    local vehicle = tonumber(args[2])
    local vehicleClass = GetVehicleClass(vehicle)
    if DoesEntityExist(vehicle) and vehicleClass == 18 and PlayerJob == 'police' then
        inVeh = true
    end
end
end)

--https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/
RegisterCommand('+Megaphone', function()
if inVeh then
    exports["pma-voice"]:overrideProximityRange(30.0, true)
    QBCore.Functions.Notify('Megaphone on', 'success')
end
end, false)

RegisterCommand('-Megaphone', function()
 if inVeh then
	exports["pma-voice"]:clearProximityOverride()
	QBCore.Functions.Notify('Megaphone off', 'error')
 end
end, false)

RegisterKeyMapping('+Megaphone', 'Talk on the Megaphone', 'keyboard', 'LSHIFT')
