token = ""

RegisterNetEvent("rF:SendToken")
AddEventHandler("rF:SendToken", function(NewToken)
    token = NewToken
end)