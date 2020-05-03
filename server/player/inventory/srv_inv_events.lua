

RegisterNetEvent("rF:GetPlayerInventory")
AddEventHandler("rF:GetPlayerInventory", function()
    local player = _player_get_identifier(source)
    local inv = PlayersData[player].inventory
    TriggerClientEvent("rF:SendPlayerInventory", source, inv)
end)


RegisterNetEvent("rF:GiveItem")
AddEventHandler("rF:GiveItem", function(token, item, count)
    if CheckToken(token, source) then
        AddItemToPlayerInv(source, item, count)
    end
end)


RegisterNetEvent("rF:RemoveItem")
AddEventHandler("rF:RemoveItem", function(token, item, count)
    if CheckToken(token, source) then
        RemoveItemFromPlayerInv(source, item, count)
    end
end)