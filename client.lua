------------------------------------------------------------------------------------------------------------------
 -- Cube Development
------------------------------------------------------------------------------------------------------------------

-- Framework selection. DO NOT TOUCH.
if Config.FrameworkSystem == 'ESX' then
    if Config.NewESX then
        ESX = exports.es_extended:getSharedObject()
    else
        ESX = nil
        CreateThread(function()
            while ESX == nil do
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                Wait(100)
            end
        end)
    end
elseif Config.FrameworkSystem == 'qb-core' then
    QBCore = nil
    QBCore = exports["qb-core"]:GetCoreObject()
end

local Gear = 1
local CurrentVehicle = 0
local CurrentVehicleMode = Config.VehicleModes[1]
local HashModelList = {}

-- Functions
function GetVehicleMode()
    return CurrentVehicleMode
end

function GetPlayerJob()
    if Config.FrameworkSystem == 'ESX' then
        if ESX and ESX.GetPlayerData and ESX.GetPlayerData().job then
            return ESX.GetPlayerData().job.name
        end
    elseif Config.FrameworkSystem == 'qb-core' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData and PlayerData.job then
            return PlayerData.job.name
        end
    end
    return nil
end

function CreateModelHashList()
    for k, _ in pairs(Config.VehiclesConfig) do
        HashModelList[GetHashKey(k)] = k
    end
end

if Config.FrameworkSystem == 'qb-core' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        CreateModelHashList()
    end)
elseif Config.FrameworkSystem == 'ESX' then
    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        CreateModelHashList()
        PlayerData = xPlayer
    end)
end

-- DO NOT TOUCH. This is required otherwise changing pursuit modes does nothing.
function ResetHandling(Veh)
    SetVehicleModKit(Veh, 0)
    SetVehicleMod(Veh, 0, GetVehicleMod(Veh, 0), false)
    SetVehicleMod(Veh, 1, GetVehicleMod(Veh, 1), false)
    SetVehicleMod(Veh, 2, GetVehicleMod(Veh, 2), false)
    SetVehicleMod(Veh, 3, GetVehicleMod(Veh, 3), false)
    SetVehicleMod(Veh, 4, GetVehicleMod(Veh, 4), false)
    SetVehicleMod(Veh, 5, GetVehicleMod(Veh, 5), false)
    SetVehicleMod(Veh, 6, GetVehicleMod(Veh, 6), false)
    SetVehicleMod(Veh, 7, GetVehicleMod(Veh, 7), false)
    SetVehicleMod(Veh, 8, GetVehicleMod(Veh, 8), false)
    SetVehicleMod(Veh, 9, GetVehicleMod(Veh, 9), false)
    SetVehicleMod(Veh, 10, GetVehicleMod(Veh, 10), false)
    SetVehicleMod(Veh, 11, GetVehicleMod(Veh, 11), false)
    SetVehicleMod(Veh, 12, GetVehicleMod(Veh, 12), false)
    SetVehicleMod(Veh, 13, GetVehicleMod(Veh, 13), false)
    SetVehicleMod(Veh, 15, GetVehicleMod(Veh, 15), false)
    SetVehicleMod(Veh, 16, GetVehicleMod(Veh, 16), false)
    SetVehicleMod(Veh, 25, GetVehicleMod(Veh, 25), false)
    SetVehicleMod(Veh, 27, GetVehicleMod(Veh, 27), false)
    SetVehicleMod(Veh, 28, GetVehicleMod(Veh, 28), false)
    SetVehicleMod(Veh, 30, GetVehicleMod(Veh, 30), false)
    SetVehicleMod(Veh, 33, GetVehicleMod(Veh, 33), false)
    SetVehicleMod(Veh, 34, GetVehicleMod(Veh, 34), false)
    SetVehicleMod(Veh, 35, GetVehicleMod(Veh, 35), false)
    SetVehicleWheelIsPowered(Veh, 0, true)
    SetVehicleWheelIsPowered(Veh, 1, true)
    SetVehicleWheelIsPowered(Veh, 2, true)
    SetVehicleWheelIsPowered(Veh, 3, true)
end

function GetModelFromHash(Hash)
    return HashModelList[Hash]
end

function isVehicleValid(Vehicle)
    local VehicleHash = GetEntityModel(Vehicle)
    local VehicleModel = GetModelFromHash(VehicleHash)
    return Config.VehiclesConfig[VehicleModel]
end

local function GetHandlingConfig(VehicleHash)
    local VehicleModel = GetModelFromHash(VehicleHash)
    if Config.VehiclesConfig[VehicleModel] then
        return Config.VehiclesConfig[VehicleModel][CurrentVehicleMode]
    end
end

function UpdateHandling(Vehicle)
    local HandlingConfig = GetHandlingConfig(GetEntityModel(Vehicle))
    for k, v in pairs(HandlingConfig) do
        if math.type(v) == 'float' then
            SetVehicleHandlingFloat(Vehicle, "CHandlingData", k, v)
        elseif math.type(v) == 'integer' then
            SetVehicleHandlingInt(Vehicle, "CHandlingData", k, v)
        elseif type(v) == 'vector3' then
            SetVehicleHandlingVector(Vehicle, "CHandlingData", k, v)
        end
    end
    ResetHandling(Vehicle)
end

function ApplyVehicleMods(Vehicle)
    local PursuitMode = Config.VehicleModes[Gear]

    ToggleVehicleMod(Vehicle, 18, Config["VehicleModifications"][PursuitMode]["Turbo"]) -- Turbo
    ToggleVehicleMod(Vehicle, 22, Config["VehicleModifications"][PursuitMode]["XenonHeadlights"]) -- Xenon Headlights
    SetVehicleMod(Vehicle, 11, Config["VehicleModifications"][PursuitMode]["Engine"], false) -- Engine
    SetVehicleMod(Vehicle, 12, Config["VehicleModifications"][PursuitMode]["Brakes"], false) -- Brakes
    SetVehicleMod(Vehicle, 13, Config["VehicleModifications"][PursuitMode]["Transmission"], false) -- Transmission
    SetVehicleXenonLightsColour(Vehicle, Config["VehicleModifications"][PursuitMode]["XenonHeadlightsColor"]) -- Xenon Headlights Color

    if Config.SlowDown then
        local Speed = GetEntitySpeed(vehicle)
        SetVehicleForwardSpeed(vehicle, Speed * (1.0 - Config.SlowdownPercentage))
    end
end

function CycleVehicleMode(Vehicle)
    Gear = Gear % #Config.VehicleModes + 1
    if Vehicle ~= CurrentVehicle then
        Gear = 1
    end
    CurrentVehicle = Vehicle
    CurrentVehicleMode = Config.VehicleModes[Gear]
end

function AuthorisedToSwitchMode()
    if next(Config.AuthorizedJobs) == nil then -- No jobs defined
        return true
    end
    if Config.FrameworkSystem == 'qb-core' then
        for _, v in ipairs(Config.AuthorizedJobs) do
            if GetPlayerJob() == v then
                return true
            end
        end
    elseif Config.FrameworkSystem == 'esx' then
        for _, v in ipairs(Config.AuthorizedJobs) do
            if GetPlayerJob() == v then
                return true
            end
        end
    end
    return false
end

function PlaySound(vehicle)
    if Config.PlaySound then
        if Config.PlayerServerSyncedSound then
            local MaxSoundDistance = Config.MaxSoundDistance
            local Speed = GetEntitySpeed(vehicle)
            if Speed > 30.0 then
                MaxSoundDistance = Config.MaxSoundDistanceAtMediumSpeeds
            elseif Speed > 70.0 then
                MaxSoundDistance = Config.MaxSoundDistanceAtHighSpeeds
            end
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', MaxSoundDistance, Config.SoundFile, Config.SoundVolume)
        else
            TriggerEvent('InteractSound_CL:PlayOnOne', Config.SoundFile, Config.SoundVolume)
        end
    end
end

RegisterNetEvent('cube-pursuitmode:client:RegisterLogs')
AddEventHandler('cube-pursuitmode:client:RegisterLogs', function(CurrentVehicleMode)
    local message = ((Config.Logs.Message):format(CurrentVehicleMode))
    TriggerServerEvent('cube-pursuitmode:server:RegisterLogs', message)
end)

RegisterNetEvent('cube-pursuitmode:client:CycleVehicleMode')
AddEventHandler('cube-pursuitmode:client:CycleVehicleMode', function()
    local Ped = PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        local Vehicle = GetVehiclePedIsIn(Ped)
        if DoesEntityExist(Vehicle) and isVehicleValid(Vehicle) and AuthorisedToSwitchMode() then
            CycleVehicleMode(Vehicle)
            UpdateHandling(Vehicle)
            ApplyVehicleMods(Vehicle)
            if Config.PlaySound then PlaySound(vehicle) end
            if Config.FrameworkSystem == 'qb-core' then
                QBCore.Functions.Notify((Config.Notification):format(CurrentVehicleMode))
            elseif Config.FrameworkSystem == 'ESX' then
                lib.notify({
                    title = 'success',
                    description = (Config.Notification):format(CurrentVehicleMode),
                    type = 'success',
                    duration = 1000,
                })
            end
        end
    end
    TriggerEvent('cube-pursuitmode:client:RegisterLogs', CurrentVehicleMode)
end)


local InPursuitMode = false
CreateThread(function()
    while true do
        local Ped = PlayerPedId()
        if IsPedInAnyVehicle(Ped) then
            if not InPursuitMode then
                local Vehicle = GetVehiclePedIsIn(Ped)
                if DoesEntityExist(Vehicle) then
                    TriggerEvent('cube-pursuitmode:client:CycleVehicleMode')
                    InPursuitMode = true
                end
            end
        else
            InPursuitMode = false
        end
        Wait(1000)
    end
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    CreateModelHashList()
end)

RegisterCommand("pursuitmode", function(source, args, rawCommand)
    TriggerEvent('cube-pursuitmode:client:CycleVehicleMode')
end, false)

RegisterKeyMapping('pursuitmode', 'Change pursuitmode', 'keyboard', Config.CycleKey)
