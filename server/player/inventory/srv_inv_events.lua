

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


RegisterNetEvent("rF:RenameItem")
AddEventHandler("rF:RenameItem", function(token, item, label, olabel)
    if CheckToken(token, source) then
        RenameItem(source, item, label, olabel)
    end
end)

RegisterNetEvent("rF:ResetRenameItem")
AddEventHandler("rF:ResetRenameItem", function(token, item, label, oldlabel)
    if CheckToken(token, source) then
        ResetRenameItem(source, item, label, oldlabel)
    end
end)

RegisterNetEvent("rF:TransferItemIfTargetCanHoldIt")
AddEventHandler("rF:TransferItemIfTargetCanHoldIt", function(token, target, item, count, label)
    if CheckToken(token, source) then
        TransferItemIfTargetCanHoldIt(source, target, item, count, label)
    end
end)


RegisterNetEvent("rF:AddItemIfNotAlreadyHave")
AddEventHandler("rF:AddItemIfNotAlreadyHave", function(token, item, count)
    if CheckToken(token, source) then
        AddItemIfNotAlreadyHave(source, item, count)
    end
end)

RegisterNetEvent("rF:ExhangeItem")
AddEventHandler("rF:ExhangeItem", function(token, OriginalItem, ItemToGet)
    if CheckToken(token, source) then
        ExhangeItem(source, OriginalItem, ItemToGet)
    end
end)

RegisterNetEvent("rF:SellItem")
AddEventHandler("rF:SellItem", function(token, item, price)
    if CheckToken(token, source) then
        SellItem(source, item, price)
    end
end)