local ESX = exports['es_extended']:getSharedObject()

-- Mission System
RegisterNetEvent('gta:completeMission')
AddEventHandler('gta:completeMission', function(missionId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('INSERT INTO gta_missions (player_id, mission_id, completed, last_completed) VALUES (@player_id, @mission_id, TRUE, NOW())', {
        ['@player_id'] = playerId,
        ['@mission_id'] = missionId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.addAccountMoney('bank', Config.MissionRewardMultiplier * 1000)
            TriggerClientEvent('esx:showNotification', source, 'Mission completed!')
        end
    end)
end)

-- Heist System
RegisterNetEvent('gta:completeHeist')
AddEventHandler('gta:completeHeist', function(heistId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('INSERT INTO gta_heists (player_id, heist_id, completed, last_completed) VALUES (@player_id, @heist_id, TRUE, NOW())', {
        ['@player_id'] = playerId,
        ['@heist_id'] = heistId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.addAccountMoney('bank', Config.HeistRewardMultiplier * 5000)
            TriggerClientEvent('esx:showNotification', source, 'Heist completed!')
        end
    end)
end)

-- Business System
RegisterNetEvent('gta:completeBusinessUpgrade')
AddEventHandler('gta:completeBusinessUpgrade', function(businessId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('UPDATE gta_businesses SET level = level + 1, last_upgraded = NOW() WHERE player_id = @player_id AND business_id = @business_id', {
        ['@player_id'] = playerId,
        ['@business_id'] = businessId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('esx:showNotification', source, 'Business upgraded!')
        end
    end)
end)

-- Property System
RegisterNetEvent('gta:completePropertyPurchase')
AddEventHandler('gta:completePropertyPurchase', function(propertyId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('INSERT INTO gta_properties (player_id, property_id, owned, last_updated) VALUES (@player_id, @property_id, TRUE, NOW())', {
        ['@player_id'] = playerId,
        ['@property_id'] = propertyId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('esx:showNotification', source, 'Property purchased!')
        end
    end)
end)