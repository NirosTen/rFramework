local firstspawn = 0
local loaded = false
local OldCoords = nil


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(omg_framework._positionSave*(60*1000))
        local Lastpos = GetEntityCoords(GetPlayerPed(-1))
        local LastPosH = GetEntityHeading(GetPlayerPed(-1))
        if OldCoords == nil then
            OldCoords = Lastpos
        else
            local dst = GetDistanceBetweenCoords(OldCoords, Lastpos, true)
            if dst >= 10.0 then
                TriggerServerEvent("OMG:save_position", LastPosX, LastPosY, LastPosZ, LastPosH)
            end
        end 
    end
end)

function DebugClient(arg)
    if debug_print == true then
        print(arg)
    end
end

RegisterNetEvent('OMG:notification')
AddEventHandler('OMG:notification', function(alert)
    Notify(alert)
end)

RegisterNetEvent("OMG:spawn_last_position")
AddEventHandler("OMG:spawn_last_position", function(data, PosX, PosY, PosZ)
    if not loaded then
        if data == 0 then
            SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ + 1.0, 1, 0, 0, 1)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            Wait(2500)
            FreezeEntityPosition(GetPlayerPed(-1), false)
            Citizen.Wait(10)
            Notify(_L("welcome"))
            PlaySound(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0);
            loaded = true
        else
            SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ + 1.0, 1, 0, 0, 1)
            FreezeEntityPosition(GetPlayerPed(-1), true)
            Wait(2500)
            FreezeEntityPosition(GetPlayerPed(-1), false)
            Notify(_L("welcome_back"))
            PlaySound(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0);
            loaded = true
        end
        DebugClient(data)
        DebugClient(loaded)
    end
end)

AddEventHandler('playerSpawned', function(spawn)
    if firstspawn == 0 then
        TriggerServerEvent("OMG:SpawnPlayer")
        firstspawn = 1
    end
end)