local firstSpawn = true

AddEventHandler("playerSpawned", function(spawn)
	if firstSpawn == true then
		TriggerServerEvent('rF:spawn')
		firstSpawn = false
	end
end)

-- Spawn with a fake skin, just for now xD [WIP]
AddEventHandler("playerSpawned", function(spawn)
	local defaultModel = GetHashKey('mp_m_freemode_01')
	RequestModel(defaultModel)
	while not HasModelLoaded(defaultModel) do
		Citizen.Wait(10)
	end
	SetPlayerModel(PlayerId(), defaultModel)
	SetPedDefaultComponentVariation(PlayerPedId())
	SetModelAsNoLongerNeeded(defaultModel)
end)

RegisterNetEvent('rF:initializeinfo')
AddEventHandler('rF:initializeinfo', function(money,dirtymoney,bankbalance, job)

	SendNUIMessage({
		initialise = true,
		money = money,
		dirtymoney = dirtymoney,
		bankbalanceinfo = bankbalance,
		job = job,
	})

end)

RegisterNetEvent('rF:job')
AddEventHandler('rF:job', function(rslt)

	SendNUIMessage({
		jobinfo = rslt
	})

end)

RegisterNetEvent('rF:bankbalance')
AddEventHandler('rF:bankbalance', function(rslt)

	SendNUIMessage({
		bankbalanceinfo = rslt
	})

end)

RegisterNetEvent('rF:dirtymoney')
AddEventHandler('rF:dirtymoney', function(rslt)

	SendNUIMessage({
		dirtymoneyinfo = rlst
	})

end)

RegisterNetEvent('rF:money')
AddEventHandler('rF:money', function(rslt)

	SendNUIMessage({
		moneyinfo = rslt
	})

end)

RegisterNetEvent('rF:rmvMoney')
AddEventHandler('rF:rmvMoney', function(rslt)

	SendNUIMessage({
		rmvMoney = rslt
	})

end)

RegisterNetEvent('rF:addMoney')
AddEventHandler('rF:addMoney', function(rslt)

	SendNUIMessage({
		addMoney = rslt
	})

end)

RegisterNetEvent('rF:rmvBank')
AddEventHandler('rF:rmvBank', function(rslt)

	SendNUIMessage({
		rmvBank = rslt
	})

end)

RegisterNetEvent('rF:addBank')
AddEventHandler('rF:addBank', function(rslt)

	SendNUIMessage({
		addBank = rslt
	})

end)

RegisterNetEvent('rF:removeMoneyForBank')
AddEventHandler('rF:removeMoneyForBank', function(rslt)

	SendNUIMessage({
		rmvMoneyForBank = rslt
	})

end)

RegisterNetEvent('rF:removeBankForMoney')
AddEventHandler('rF:removeBankForMoney', function(rslt)

	SendNUIMessage({
		rmvBankForMoney = rslt
	})

end)


RegisterNetEvent('rF:addDirtyMoney')
AddEventHandler('rF:addDirtyMoney', function(rslt)

	SendNUIMessage({
		addDirtyMoney = rslt
	})

end)


RegisterNetEvent('rF:rmvDirtyMoney')
AddEventHandler('rF:rmvDirtyMoney', function(rslt)

	SendNUIMessage({
		rmvDirtyMoney = rslt
	})

end)


RegisterNetEvent('rF:setDirtyMoney')
AddEventHandler('rF:rmvDirtyMoney', function(rslt)

	SendNUIMessage({
		dirtymoneyinfo = rslt
	})

end)

Citizen.CreateThread(function()
	RequestIpl('shr_int') -- Load vehicleshop
	RequestIpl("rc12b_default") -- Pillbox Hospital (hole in map)
end)