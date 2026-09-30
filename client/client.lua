local ESX = exports['es_extended']:getSharedObject()

-- Mission System
RegisterNetEvent('gta:startMission')
AddEventHandler('gta:startMission', function(missionId)
    -- Start mission logic
    TriggerServerEvent('gta:completeMission', missionId)
end)

-- Heist System
RegisterNetEvent('gta:startHeist')
AddEventHandler('gta:startHeist', function(heistId)
    -- Start heist logic
    TriggerServerEvent('gta:completeHeist', heistId)
end)

-- Business System
RegisterNetEvent('gta:upgradeBusiness')
AddEventHandler('gta:upgradeBusiness', function(businessId)
    -- Upgrade business logic
    TriggerServerEvent('gta:completeBusinessUpgrade', businessId)
end)

-- Property System
RegisterNetEvent('gta:buyProperty')
AddEventHandler('gta:buyProperty', function(propertyId)
    -- Buy property logic
    TriggerServerEvent('gta:completePropertyPurchase', propertyId)
end)

-- Phone App
RegisterNetEvent('gta:openPhoneApp')
AddEventHandler('gta:openPhoneApp', function()
    -- Open phone app logic
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openApp'
    })
end)

RegisterNUICallback('closeApp', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)