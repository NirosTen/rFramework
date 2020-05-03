

RegisterNetEvent("rF:GetPlayerInventory")
AddEventHandler("rF:GetPlayerInventory", function()
    local player = _player_get_identifier(source)
    local inv = PlayersData[player].inventory
    TriggerClientEvent("rF:SendPlayerInventory", source, inv)
end)


RegisterNetEvent("rF:GetOtherPlayerInventory")
AddEventHandler("rF:GetOtherPlayerInventory", function(target)
    local player = _player_get_identifier(target)
    local inv = PlayersData[player].inventory
    TriggerClientEvent("rF:SendPlayerInventory", source, inv)
end)


RegisterNetEvent("rF:GiveItem")
AddEventHandler("rF:GiveItem", function(token, item, count)
    if CheckToken(token, source) then
        AddItemToPlayerInv(source, item, count)
    end
end)

RegisterNetEvent("rF:GiveItemToPlayer")
AddEventHandler("rF:GiveItemToPlayer", function(token, target, item, count)
    if CheckToken(token, source) then
        AddItemToPlayerInv(target, item, count)
    end
end)


RegisterNetEvent("rF:RemoveItem")
AddEventHandler("rF:RemoveItem", function(token, item, count)
    if CheckToken(token, source) then
        RemoveItemFromPlayerInv(source, item, count)
    end
end)


RegisterNetEvent("rF:RemoveItemToPlayer")
AddEventHandler("rF:RemoveItemToPlayer", function(token, target, item, count)
    if CheckToken(token, source) then
        RemoveItemFromPlayerInv(target, item, count)
    end
end)