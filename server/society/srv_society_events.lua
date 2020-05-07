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