------------------------------------------------------------------------------------------------------------------
 -- Cube Development
------------------------------------------------------------------------------------------------------------------


-- Framework selection. DO NOT TOUCH.
if Config.FrameworkSystem == 'ESX' then
    if Config.NewESX then
        ESX = exports['es_extended']:getSharedObject()
    else
        ESX =nil
    end
elseif Config.FrameworkSystem == 'qb-core' then
    QBCore = nil
    QBCore = exports["qb-core"]:GetCoreObject()
end

local function PlateInformation(source)
    local Ped = GetPlayerPed(source)
    local Vehicle = GetVehiclePedIsIn(Ped, false)
    local Plate = GetVehicleNumberPlateText(Vehicle)

    return Plate
end

local function CharacterInformation(source)
    if Config.FrameworkSystem == 'ESX' then
        -- WIP
    elseif Config.FrameworkSystem == 'qb-core' then
        local Player = QBCore.Functions.GetPlayer(source)
        local FirstName = Player.PlayerData.charinfo.firstname
        local LastName = Player.PlayerData.charinfo.lastname
        local CharName = FirstName .. ' ' .. LastName

        return CharName
    end
end

local webhook = Config.Logs.Webhook
RegisterNetEvent('cube-pursuitmode:server:RegisterLogs', function(message)
    if message ~= nil then
        if Config.Logs.Enabled then
            local license = nil
            for k, v in pairs(GetPlayerIdentifiers(source)) do
                if string.sub(v, 1, string.len('license:')) == 'license:' then
                    license = v
                end
            end
            if Config.Logs.Type == 'ox_lib' then
                lib.logger(source, 'pursuitmode', message)
            elseif Config.Logs.Type == 'webhook' then
                local embed = {
                    {
                        ['color'] = 9164989,
                        ['title'] = 'cube-pursuitmode',
                        ['description'] = 
                            '**[License]: **' .. license .. '\n' ..
                            '**[Character]: **' .. CharacterInformation(source) .. '\n' .. 
                            '**[Name]: **' .. GetPlayerName(source) .. '\n' .. 
                            '**[Plate]: **' .. PlateInformation(source) .. '\n' ..
                            message,
                        ['footer'] = {
                            ['text'] = '[Logs] by Cube Development',
                        },
                    }
                }
                PerformHttpRequest(webhook, function(err, text, headers) end, 'POST',
                    json.encode({ username = 'Cube Development [Logs]', embeds = embed,
                        avatar_url = 'https://i.imgur.com/EymYYV4.png' })
                    , { ['Content-Type'] = 'application/json' })
            end
        end
    end
end)
