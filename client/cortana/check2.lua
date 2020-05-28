

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