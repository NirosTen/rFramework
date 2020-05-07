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