

RegisterNetEvent("rF:GetPlayerInventory")
AddEventHandler("rF:GetPlayerInventory", function()
    local inv = GetInventoryFromCache(source)
    local weight = GetInvWeight(inv)
    TriggerClientEvent("rF:SendPlayerInventory", source, inv, weight)
end)


RegisterNetEvent("rF:GetOtherPlayerInventory")
AddEventHandler("rF:GetOtherPlayerInventory", function(target)
    local inv = GetInventoryFromCache(target)
    local weight = GetInvWeight(inv)
    TriggerClientEvent("rF:SendPlayerInventory", source, inv, weight)
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


RegisterNetEvent("rF:BuyItemIfCan")
AddEventHandler("rF:BuyItemIfCan", function(token, item, count, price)
    if CheckToken(token, source) then
        BuyItemIfCanHoldIt(source, item, count, price)
    end
end)