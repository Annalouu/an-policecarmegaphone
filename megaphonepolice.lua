local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
  PlayerData = val
end)

local function CheckPlayer()
  local Player = PlayerPedId()
  local getVehiclePedIsIn = GetVehiclePedIsIn(Player, false) > 0 and GetVehiclePedIsIn(Player, false) or
      0 -- Get the vehicle the ped is in, if is > than 0 means the player is in a vehicle
  if getVehiclePedIsIn == 0 then return end
  local vehicleClass = GetVehicleClass(getVehiclePedIsIn) == 18 and true or false --get the class of it
  if not vehicleClass then
    return
  end
  return vehicleClass
end

--https://cookbook.fivem.net/2020/01/06/using-the-new-console-key-bindings/
RegisterCommand('+Megaphone', function()
  if not PlayerData.job then PlayerData = QBCore.Functions.GetPlayerData() end
  if PlayerData.job.name == "police" and CheckPlayer() then
    exports["pma-voice"]:overrideProximityRange(30.0, true)
    QBCore.Functions.Notify('Megaphone on', 'success')
  end
end, false)

RegisterCommand('-Megaphone', function()
  if not PlayerData.job then PlayerData = QBCore.Functions.GetPlayerData() end
  if PlayerData.job.name == "police" and CheckPlayer() then
    exports["pma-voice"]:clearProximityOverride()
    QBCore.Functions.Notify('Megaphone off', 'error')
  end
end, false)

RegisterKeyMapping('+Megaphone', 'Talk on the Megaphone', 'keyboard', 'LSHIFT')
