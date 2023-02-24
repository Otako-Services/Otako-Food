exports['ox_inventory']:displayMetadata('expiration', 'Data ważności')

exports('use', function(data, slot)
	TriggerServerEvent('jedzenie:server:use', data, slot)
end)

RegisterNetEvent('jedzenie:client:use', function(thirst, hunger, eatType)
	TriggerEvent('esx_status:add', 'thirst', thirst)
	TriggerEvent('esx_status:add', 'hunger', hunger)
    if eatType == 'eat' then
        TriggerEvent('esx_basicneeds:onEat')
    else
        TriggerEvent('esx_basicneeds:onDrink')
    end
end)

RegisterNetEvent('jedzenie:client:useExpired', function(eatType, damage)
    local playerPed = PlayerPedId()
    TriggerEvent('esx_status:add', 'thirst', 5000)
	TriggerEvent('esx_status:add', 'hunger', 5000)
    if eatType == 'eat' then
        TriggerEvent('esx_basicneeds:onEat')
    else
        TriggerEvent('esx_basicneeds:onDrink')
    end
    local health = GetEntityHealth(PlayerPedId())
    SetEntityHealth(PlayerPedId(), health-damage)
    ShakeGameplayCam('DRUNK_SHAKE', 1.0)
    Wait(5000)
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
end)