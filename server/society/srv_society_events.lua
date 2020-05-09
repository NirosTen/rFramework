RegisterNetEvent("rF:AddSocietyMoney")
AddEventHandler("rF:AddSocietyMoney", function(token, society, amount)
    if CheckToken(token, source) then
        AddSocietyMoney(society, amount)
    end
end)

RegisterNetEvent("rF:PaySociety")
AddEventHandler("rF:PaySociety", function(token, society, amount)
    if CheckToken(token, source) then
        PaySociety(source, society, amount)
    end
end)

RegisterNetEvent("rF:TakeMoneyFromSociety")
AddEventHandler("rF:TakeMoneyFromSociety", function(token, society, amount)
    if CheckToken(token, source) then
        TakeMoneyFromSociety(source, society, amount)
    end
end)

 
RegisterNetEvent("rF:GetSocietyInfos")
AddEventHandler("rF:GetSocietyInfos", function(token, society)
    if CheckToken(token, source) then
        local societyCB = GetCachedSociety(society)
        TriggerClientEvent("rF:SendSocietyInfo", source, societyCB)
    end
end)

RegisterNetEvent("rF:TransferItemFromInvToSociety")
AddEventHandler("rF:TransferItemFromInvToSociety", function(token, _name, _item, _label, _count)
    if CheckToken(token, source) then
        TransferItemFromInvToSociety(_name, _item, _label, _count)
    end
end)

RegisterNetEvent("rF:TransferItemFromSocietyToInv")
AddEventHandler("rF:TransferItemFromSocietyToInv", function(token, _name, _item, _label, _count)
    if CheckToken(token, source) then
        TransferItemFromSocietyToInv(source, _name, _item, _label, _count)
    end
end)