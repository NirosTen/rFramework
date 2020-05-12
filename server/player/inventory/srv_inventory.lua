

function AddItemToPlayerInvBypass(id, item, _count, _label, _olabel)
    if DoesItemExist(item) then
        local inv, place = GetInventoryFromCache(id)
        local countOld, num = GetItemCountWithLabel(item, inv, _label)

        if countOld == 0 then
            table.insert(inv, {name = item, label = _label, olabel = _olabel, count = _count})
            TriggerClientEvent("rF:addItem", id, item.." x".._count)
            PlayersData[place].inventory = inv
        else
            if itemLabel == _label then
                
                PlayersData[place].inventory[num].name = item
                PlayersData[place].inventory[num].label = _label
                PlayersData[place].inventory[num].olabel = _olabel
                PlayersData[place].inventory[num].count = countOld + _count

                TriggerClientEvent("rF:addItem", id, item.." x".._count)
            else

                PlayersData[place].inventory[num].name = item
                PlayersData[place].inventory[num].label = _label
                PlayersData[place].inventory[num].olabel = _olabel
                PlayersData[place].inventory[num].count = countOld + _count

                TriggerClientEvent("rF:addItem", id, _label.." x".._count)
            end
        end

        
    end
end

function AddItemToPlayerInv(id, item, _count, _label)
    if DoesItemExist(item) then
        local inv, place = GetInventoryFromCache(id)
        local invWeight = GetInvWeight(inv)
        local itemWeight, itemLabel = GetItemWeight(item, _count)
        
        if _label == nil then 
            _label = itemLabel
        end

        if invWeight + itemWeight <= framework._default_player_max_weight then
            local countOld, num = GetItemCountWithLabel(item, inv, _label)

            if countOld == 0 then
                table.insert(inv, {name = item, label = itemLabel, olabel = itemLabel, count = _count})
                TriggerClientEvent("rF:addItem", id, item.." x".._count)
            else
                if itemLabel == _label then
                    
                    PlayersData[place].inventory[num].name = item
                    PlayersData[place].inventory[num].label = itemLabel
                    PlayersData[place].inventory[num].olabel = itemLabel
                    PlayersData[place].inventory[num].count = countOld + _count

                    TriggerClientEvent("rF:addItem", id, item.." x".._count)
                else

                    PlayersData[place].inventory[num].name = item
                    PlayersData[place].inventory[num].label = _label
                    PlayersData[place].inventory[num].olabel = itemLabel
                    PlayersData[place].inventory[num].count = countOld + _count

                    TriggerClientEvent("rF:addItem", id, _label.." x".._count)
                end
            end

            

        else
            TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu porte trop de chose.")
        end
    end
end

-- This bypass weight calculation
function AddItemIfNotAlreadyHave(id, item, _count)
    local inv, place = GetInventoryFromCache(id)
    local count, num = GetItemCount(item, inv)
    local oLabel = GetOriginalLabel(item)
    if count == 0 then
        table.insert(inv, {name=item, label=oLabel, olabel=oLabel, count = _count})
        TriggerClientEvent("rF:addItem", id, oLabel.." x".._count)
        PlayersData[place].inventory = inv
    else
        TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu possède déja l'objets ~g~"..oLabel.."~w~.")
    end
end

function RenameItem(id, item, _label, _olabel)
    local inv, place = GetInventoryFromCache(id)
    local countOld, num = GetItemCountWithLabel(item, inv, _olabel)
    if countOld - 1 > 0 then

        PlayersData[place].inventory[num].name = item
        PlayersData[place].inventory[num].label = _olabel
        PlayersData[place].inventory[num].olabel = _olabel
        PlayersData[place].inventory[num].count = countOld - 1

        table.insert(inv, {name = item, label = _label, olabel = _olabel, count = 1})
        TriggerClientEvent("rF:addItem", id, _label.." x1")
    else
        table.remove(inv, num)
        table.insert(inv, {name = item, label = _label, olabel = _olabel, count = 1})
        TriggerClientEvent("rF:addItem", id, _label.." x1")
    end

    PlayersData[place].inventory = inv

    -- To remove later 
    for k,v in pairs(PlayersData[place].inventory) do
        DebugPrint(v.name.." - x"..v.count)
    end
end

function ResetRenameItem(id, item, _label, oldLabel)
    local inv, place = GetInventoryFromCache(id)
    local countOld, numOld = GetItemCountWithLabel(item, inv, oldLabel)
    local count, num = GetItemCountWithLabel(item, inv, _label)
    
    
    if countOld - 1 == 0 then
        table.remove(inv, numOld)
    else
        PlayersData[place].inventory[numOld].name = item
        PlayersData[place].inventory[numOld].label = oldLabel
        PlayersData[place].inventory[numOld].olabel = _label
        PlayersData[place].inventory[numOld].count = countOld - 1
    end

    if count + 1 == 1 then
        table.insert(inv, {name = item, label = _label, olabel = _label, count = count + 1})
        TriggerClientEvent("rF:addItem", id, _label.." x1")
    else
        PlayersData[place].inventory[num].name = item
        PlayersData[place].inventory[num].label = _label
        PlayersData[place].inventory[num].olabel = _label
        PlayersData[place].inventory[num].count = count + 1
        TriggerClientEvent("rF:addItem", id, _label.." x1")
    end

    PlayersData[place].inventory = inv
end


function BuyItemIfCanHoldIt(id, item, _count, price)
    if DoesItemExist(item) then
        local inv, place = GetInventoryFromCache(id)
        local invWeight = GetInvWeight(inv)
        local itemWeight, itemLabel = GetItemWeight(item, _count)
        
        DebugPrint(invWeight, itemWeight, invWeight + itemWeight)
        if invWeight + itemWeight <= framework._default_player_max_weight then
            local pCache = GetPlayerCache(id)
            local pMoney = PlayersData[pCache].money
            if pMoney >= price * _count then
                RemovePlayerMoneyNoToken(id, price)
                local countOld, num = GetItemCountWithLabel(item, inv, itemLabel)
                if countOld == 0 then
                    table.insert(inv, {name = item, label = itemLabel, olabel = itemLabel, count = _count})
                    TriggerClientEvent("rF:addItem", id, item.." x".._count)
                else

                    PlayersData[place].inventory[num].name = item
                    PlayersData[place].inventory[num].label = itemLabel
                    PlayersData[place].inventory[num].olabel = itemLabel
                    PlayersData[place].inventory[num].count = countOld + _count


                    --table.remove(inv, num)
                    --table.insert(inv, {name = item, label = itemLabel, olabel = itemLabel, count = countOld + _count})
                    TriggerClientEvent("rF:addItem", id, item.." x".._count)
                end

                PlayersData[place].inventory = inv

            else
                TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu n'a pas assez d'argent.")
            end
        else
            TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu porte trop de chose.")
        end
    end
end

function TransferItemIfTargetCanHoldIt(id, target, item, _count, _label)
    local inv, place = GetInventoryFromCache(target)
    local sInv, sPlace = GetInventoryFromCache(id)
    local invWeight = GetInvWeight(inv)
    local itemWeight, itemLabel = GetItemWeight(item, _count)
    
    if invWeight + itemWeight <= framework._default_player_max_weight then
        local countOld, num = GetItemCountWithLabel(item, inv, _label)
        local sCountOld, sNum = GetItemCountWithLabel(item, sInv, _label)
        if countOld == 0 then
            table.insert(inv, {name = item, label = _label, olabel = itemLabel, count = _count})
            TriggerClientEvent("rF:addItem", target, _label.." x".._count)
        else
            DebugPrint(countOld, _count, countOld + _count)
            table.remove(inv, num)
            table.insert(inv, {name = item, label = _label, olabel = itemLabel, count = countOld + _count})
            TriggerClientEvent("rF:addItem", target, _label.." x".._count)
        end

        if sCountOld - _count == 0 then
            table.remove(sInv, sNum)
            TriggerClientEvent("rF:rmvItem", id, _label.." x".._count)
        else
            table.remove(sInv, sNum)
            table.insert(sInv, {name = item, label = _label, olabel = itemLabel, count = sCountOld - _count})
            TriggerClientEvent("rF:rmvItem", id, item.." x".._count)
        end

        PlayersData[sPlace].inventory = sInv
        PlayersData[place].inventory = inv

    else
        TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~La personne porte trop de chose.")
    end
end


function ExhangeItem(id, OriginalItem, ItemToGet)
    local inv, p = GetInventoryFromCache(id)
    local invWeight = GetInvWeight(inv)
    local oWheight, oLabel = GetItemWeight(OriginalItem, 1)
    if oLabel == nil then oLabel = GetOriginalLabel(itemToSell) end
    local iWheight, iLabel = GetItemWeight(ItemToGet, 1)
    if invWeight - oWheight + iWheight <= framework._default_player_max_weight then
        local oCount, oNum = GetItemCountWithLabel(OriginalItem, inv, oLabel)
        if oCount > 0 then
            if oCount - 1 <= 0 then
                table.remove(inv, oNum)
                TriggerClientEvent("rF:rmvItem", id, oLabel.." x1")
            else
                PlayersData[p].inventory[oNum].count = oCount - 1
                TriggerClientEvent("rF:rmvItem", id, oLabel.." x1")
            end

            local iCount, iNum = GetItemCountWithLabel(ItemToGet, inv, iLabel)
            if iCount + 1 == 1 then
                table.insert(inv, {name = ItemToGet, label = iLabel, olabel = iLabel, count = 1})
                TriggerClientEvent("rF:addItem", id, iLabel.." x1")
            else
                print(OriginalItem, ItemToGet, iCount, iNum)
                PlayersData[p].inventory[iNum].count = iCount + 1
                TriggerClientEvent("rF:addItem", id, iLabel.." x1")
            end

            PlayersData[p].inventory = inv
        else
            TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu ne possède pas assez de ~g~"..oLabel.."~w~.") 
        end
    else
        TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~La personne porte trop de chose.")
    end
end

function SellItem(id, itemToSell, price)
    local inv, p = GetInventoryFromCache(id)
    local _, oLabel = GetItemWeight(itemToSell, 1)
    if oLabel == nil then oLabel = GetOriginalLabel(itemToSell) end
    local oCount, oNum = GetItemCountWithLabel(itemToSell, inv, oLabel)
    if oCount > 0 then
        if oCount - 1 <= 0 then
            table.remove(inv, oNum)
            PlayersData[p].money = PlayersData[p].money + price
            TriggerClientEvent('rF:addMoney', id, price)
        else
            PlayersData[p].inventory[oNum].count = PlayersData[p].inventory[oNum].count - 1
            PlayersData[p].money = PlayersData[p].money + price
            TriggerClientEvent('rF:addMoney', id, price)
        end
    else
        TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu ne possède pas assez de ~g~"..oLabel.."~w~.") 
    end
end

function RemoveItemFromPlayerInv(id, item, _count)
    local inv, place = GetInventoryFromCache(id)
    local count, i = GetItemCountWithLabel(_, inv, item)
    print(id, item, _count, count)
    if count - _count <= 0 then -- So we don't get player with negative items 
        table.remove(PlayersData[place].inventory, k)
        TriggerClientEvent("rF:rmvItem", id, item.." x".._count)
    else
        PlayersData[place].inventory[i].count = PlayersData[place].inventory[i].count - _count
        TriggerClientEvent("rF:rmvItem", id, item.." x".._count)
    end
end

function GetInventoryFromCache(id)
    for k,v in pairs(PlayersData) do
        if v.ServerID == id then
            return v.inventory, k
        end
    end
end

function GetInvWeight(inv)
    local weight = 0
    for _,v in ipairs(inv) do
        local ItemWeight = GetItemWeight(v.name, v.count)
        weight = weight + ItemWeight
    end
    return weight
end


function GetItemWeight(item, count)
    for _,v in pairs(items) do
        if item == v.name then
            return v.weight * count, v.label
        end
    end
end

function GetOriginalLabel(item)
    for k,v in pairs(items) do
        if v.name == item then
            return v.label
        end
    end
end


function GetItemCountWithLabel(item, inv, label)
    local found = false
    for k,v in pairs(inv) do 
        if v.label == label then
            found = true
            return v.count, k
        end
    end
    -- Not sure if the if is needed, i think the return stop the for, not sure tho
    if not found then
        return 0
    end
end


function GetItemCount(item, inv)
    local found = false
    for k,v in pairs(inv) do 
        if v.name == item then
            found = true
            return v.count, k
        end
    end
    -- Not sure if the if is needed, i think the return stop the for, not sure tho
    if not found then
        return 0
    end
end


function DoesItemExist(item)
    local exist = false
    for k,v in pairs(items) do
        if v.name == item then
            exist = true
            return exist
        end
    end
    return exist
end

function EncodeInventory(inv)
    local invToJson = json.encode(inv)
    return invToJson
end


function DecodeInventory(inv)
    local JsonToTable = json.decode(inv)
    return JsonToTable
end 


local debug = false
function DebugPrint(text)
    if debug then
        print(text)
    end
end