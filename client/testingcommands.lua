RegisterCommand("clearchat", function() 
    TriggerEvent('chat:clear')
    SystemNotification("Chat Clear", "SYSTEM")
end)

RegisterCommand("revive", function()
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player)
    SetEntityHealth(player, 200)
    NetworkResurrectLocalPlayer(coords, 100.0, 0, 0)
    SetEntityCoords(player, coords)
    ClearPlayerWantedLevel(GetPlayerIndex())
end)

RegisterCommand("skin", function() 
    local defaultModel = GetHashKey('mp_m_freemode_01')
	RequestModel(defaultModel)
	while not HasModelLoaded(defaultModel) do
		Citizen.Wait(10)
	end
	SetPlayerModel(PlayerId(), defaultModel)
	SetPedDefaultComponentVariation(PlayerPedId())
	SetPedRandomComponentVariation(PlayerPedId(), true)
	SetModelAsNoLongerNeeded(defaultModel)
end)

RegisterCommand("suicide", function()
    local player = GetPlayerPed(-1)
    --RequestAnimDict('mp_suicide')
    --while not HasAnimDictLoaded('mp_suicide') do Wait(0) end
    --TaskPlayAnim(player, 'mp_suicide', 'pill', 8.0, 1.0, 5000, 0, 1, true, true, true)
    --Wait(4600)
    SetEntityHealth(player, 0)
end)

local weaps = {  
    "WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB",  
    "WEAPON_CROWBAR", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50",  
    "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_ASSAULTRIFLE",  
    "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_PUMPSHOTGUN",  
    "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_STUNGUN", "WEAPON_SNIPERRIFLE",  
    "WEAPON_HEAVYSNIPER", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_MINIGUN",  
    "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV",  
    "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_FLARE", "WEAPON_SNSPISTOL", "WEAPON_SPECIALCARBINE",  
    "WEAPON_HEAVYPISTOL", "WEAPON_BULLPUPRIFLE", "WEAPON_HOMINGLAUNCHER", "WEAPON_PROXMINE", "WEAPON_SNOWBALL",  
    "WEAPON_VINTAGEPISTOL", "WEAPON_DAGGER", "WEAPON_FIREWORK", "WEAPON_MUSKET", "WEAPON_MARKSMANRIFLE",  
    "WEAPON_HEAVYSHOTGUN", "WEAPON_GUSENBERG", "WEAPON_HATCHET", "WEAPON_RAILGUN", "WEAPON_COMBATPDW",  
    "WEAPON_KNUCKLE", "WEAPON_MARKSMANPISTOL", "WEAPON_FLASHLIGHT", "WEAPON_MACHETE", "WEAPON_MACHINEPISTOL",  
    "WEAPON_SWITCHBLADE", "WEAPON_REVOLVER", "WEAPON_COMPACTRIFLE", "WEAPON_DBSHOTGUN", "WEAPON_FLAREGUN",  
    "WEAPON_AUTOSHOTGUN", "WEAPON_BATTLEAXE", "WEAPON_COMPACTLAUNCHER", "WEAPON_MINISMG", "WEAPON_PIPEBOMB",  
    "WEAPON_POOLCUE", "WEAPON_SWEEPER", "WEAPON_WRENCH"  
}

RegisterCommand("giveweapons", function()
    local player = GetPlayerPed(-1)
    for k,v in pairs(weaps) do
        GiveWeaponToPed(player, GetHashKey(v), 255, 0, 0) 
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)

Citizen.CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	 end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      --(https://pastebin.com/8EuSv2r1)
      RemoveAllPickupsOfType(0xDF711959) -- Carbine rifle
      RemoveAllPickupsOfType(0xF9AFB48F) -- Pistol
      RemoveAllPickupsOfType(0xA9355DCD) -- Pumpshotgun
    end
end)]]--

RegisterCommand('car', function(source, args, rawCommand)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.5))
    local veh = args[1]
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 10000 then
				Notification ("~r~Impossible spawn vehicle", "Mechanic")
                break
            end
        end
        CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+10, 1, 0)
		Notification ("Vehicle ~g~spawned~s~", "Mechanic")
    end)
end)

RegisterCommand('dv', function(source, args, rawCommand)
local distanceToCheck = 5.0
    local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )
            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )
                if ( DoesEntityExist( vehicle ) ) then 
					Notification ("~r~Impossible delete this vehicle", "Mechanic")
                else 
					Notification ("Vehicle ~r~deleted~s~", "Mechanic")
                end 
            else 
				Notification ("You might be inside the car", "Mechanic")
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )
            if ( DoesEntityExist( vehicle ) ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )
                if ( DoesEntityExist( vehicle ) ) then 
					Notification ("~r~Impossible delete this vehicle", "Mechanic")
                else 
					Notification ("Vehicle ~r~deleted~s~", "Mechanic")
                end 
            else 
				Notification ("You might be near the car", "Mechanic")
            end 
        end 
    end 
end )

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

RegisterCommand('fix', function(source, args, rawCommand)
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		Notification ("Vehicle repaired", "Mechanic")
	else
		SystemNotification ("You might be inside the vehicle", "SYSTEM")
	end
end)

RegisterCommand('clear', function(source, args, rawCommand)
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		Notification ("Vehicle cleaned", "Mechanic")
	else
		SystemNotification ("You might be inside the vehicle", "SYSTEM")
	end
end)


RegisterCommand('givemoney', function(source, args, rawCommand)
    if args[1] ~= nil then
       TriggerServerEvent("rF:AddMoney", token, tonumber(args[1])) 
    end
end)

RegisterCommand('givebankmoney', function(source, args, rawCommand)
    if args[1] ~= nil then
       TriggerServerEvent("rF:AddBankMoney", token, tonumber(args[1])) 
    end
end)

RegisterCommand('removemoney', function(source, args, rawCommand)
    if args[1] ~= nil then
       TriggerServerEvent("rF:RemoveMoney", token, tonumber(args[1])) 
    end
end)


RegisterCommand('removebankmoney', function(source, args, rawCommand)
    if args[1] ~= nil then
       TriggerServerEvent("rF:RemoveBankMoney", token, tonumber(args[1])) 
    end
end)


RegisterCommand('giveitem', function(source, args, rawCommand)
    if args[1] ~= nil then
        local found = false
        for k,v in pairs(items) do
            if tostring(args[1]) == v.name then
                found = true
                TriggerServerEvent("rF:GiveItem", token, tostring(args[1]), tonumber(args[2])) 
                break
            end
        end
        if not found then
            Notify("Item "..tostring(args[1]).." do not exist.") -- to do language later, i let an other dev do it if you want.
        end
    end
end)

RegisterCommand('removeitem', function(source, args, rawCommand)
    if args[1] ~= nil then
        local found = false
        for k,v in pairs(items) do
            if tostring(args[1]) == v.name then
                found = true
                TriggerServerEvent("rF:RemoveItem", token, tostring(args[1]), tonumber(args[2])) 
                break
            end
        end
        if not found then
            Notify("Item "..tostring(args[1]).." do not exist.") -- to do language later, i let an other dev do it if you want.
        end
    end
end)


RegisterCommand('tp', function(source, args, rawCommand)
    print(tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
    if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
        
        local pPed = GetPlayerPed(-1)
        SetEntityCoordsNoOffset(pPed, tonumber(args[1]), tonumber(args[2]), tonumber(args[3]), 0.0, 0.0, 0.0, 0)
    end
end)

local NuiFocus = false
RegisterCommand('nui', function(source, args, rawCommand)
    NuiFocus = not NuiFocus
    SetNuiFocus(NuiFocus, NuiFocus)
    NuiCursor()
end)

function NuiCursor()
    Citizen.CreateThread(function()
        while NuiFocus do
            print(GetNuiCursorPosition())
            Wait(1)
        end
    end)
end


RegisterCommand('hunger', function(source, args, rawCommand)
    if args[1] == nil then args[1] = 0 end
    SendNUIMessage({
		hunger = tonumber(args[1])
	})
end)

RegisterCommand('thirst', function(source, args, rawCommand)
    if args[1] == nil then args[1] = 0 end
    SendNUIMessage({
		thirst = tonumber(args[1])
	})
end)

RegisterCommand('setjob', function(source, args, rawCommand)
    if args[1] ~= nil then
        TriggerServerEvent("rF:ChangePlayerJob", token, args[1])
    end
end)

RegisterCommand('pos', function(source, args, rawCommand)
    print(GetEntityCoords(GetPlayerPed(-1)))
end)


function Notification(message,title)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, title)
    DrawNotification(false, true)
end

function SystemNotification(message,title)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    SetNotificationMessage("CHAR_MP_FM_CONTACT", "CHAR_MP_FM_CONTACT", true, 1, title)
    DrawNotification(false, true)
end