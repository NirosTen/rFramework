

local hunger = 70
local thirst = 70



Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        if IsPedSprinting(pPed) then
            hunger = hunger - 0.005
            thirst = thirst - 0.010
        elseif IsPedRunning(pPed) then
            hunger = hunger - 0.0025
            thirst = thirst - 0.005
        else
            hunger = hunger - 0.0015
            thirst = thirst - 0.002
        end

        if hunger < 0 then
            hunger = 0
        end

        if thirst < 0 then
            thirst = 0
        end

        SendNUIMessage({
            thirst = thirst,
            hunger = hunger,
        })
        Wait(1000)
    end
end)