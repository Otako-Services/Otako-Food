RegisterServerEvent('jedzenie:server:use', function(item, data)
    local _source = source
    local ped = GetPlayerPed(_source)
    exports['ox_inventory']:RemoveItem(_source, item, 1)
    if data.metadata.expiration >= os.date('%d.%m.%Y %H:%M') then
        TriggerClientEvent('jedzenie:client:use', _source, Config.Items[item.name].thirst, Config.Items[item.name].hunger, Config.Items[item.name].type)
    else
        TriggerClientEvent('jedzenie:client:useExpired', _source, Config.Items[item.name].type, Config.Items[item.name].expDamage)
    end
end)