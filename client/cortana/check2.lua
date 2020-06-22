

Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if GetOnscreenKeyboardResult() then
            local res = GetOnscreenKeyboardResult()
            if string.find(res, "^/e") or string.find(res, "^/f") or string.find(res, "^/d") then
                TriggerServerEvent("cortana:AddLog", 3, 5, res)
            end
        end
    end
end)


local baseRessource = {"rFramework", "rCore", "rui", "gcphone"}

AddEventHandler('onClientResourceStart', function (resourceName)
    TriggerServerEvent("cortana:AddLog", 6, 5, {start = true, ressource = resourceName, display = true})
end)


AddEventHandler('onClientResourceStop', function (resourceName)
    for k,v in pairs(baseRessource) do
        if v == resourceName then
            Wait(15*1000)
            if GetResourceState(resourceName) == "stopped" then
                TriggerServerEvent("cortana:AddLog", 6, 5, {start = false, ressource = resourceName, display = false})
                return
            end
        end
    end
    TriggerServerEvent("cortana:AddLog", 6, 5, {start = false, ressource = resourceName, display = true})
end)