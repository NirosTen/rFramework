Citizen.CreateThread(function()
    config = {
        player_money = framework._default_player_money,
        player_bank_balance = framework._default_player_bank_balance,
        player_dirty_money = framework._default_player_dirty_money,
		player_job = framework._default_player_job,
    }
end)



function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dumpinitializeinfo(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

RegisterServerEvent('rF:spawn') 
AddEventHandler('rF:spawn', function()
    local source = source
    TriggerClientEvent("rF:SendToken", source, token) -- Client side
    local player = _player_get_identifier(source)
    local pCache = GetPlayerInfoToCache(source)
    TriggerClientEvent('rF:initializeinfo', source, pCache.money, pCache.dirtyMoney, pCache.bankBalance, pCache.job, pCache.job_grade, pCache.skin, pCache.identity, pCache.cloths, pCache.group, pCache.vip)
    AddToRequestCache(source)
end) 



PlayersData = {} -- Global for now, maybe turning it local later if not needed

local second = 1000
local minute = 60*second
Citizen.CreateThread(function()
    while true do
        SaveDynamicCache()
        Wait(3*minute)
    end
end)


AddEventHandler('playerDropped', function(reason)
    for k,v in pairs(PlayersData) do
        if v.ServerID == source then
            if framework._display_logs then
                print("Player "..v.ServerID.." ^1dropped^7, saving data.")
            end
            SavePlayerCache(v.identifier, v)
        end
    end
end)


function SaveDynamicCache()
    local loop = 0
    for k,v in pairs(PlayersData) do
        loop = loop + 1
        if GetPlayerPing(v.ServerID) == 0 then -- If 0, that mean the player is not connected anymore (i suppose, need some test)
            if framework._display_logs then
                print("^1Removing ^7"..v.ServerID.." - "..loop.." from dynamic cache.")
            end
            PlayersData[v.ServerID] = nil
        else
            SavePlayerCache(v.identifier, v)
        end
    end
end


-- Call this to save user infos to database (identifier + cache table)
function SavePlayerCache(id, cache)
    local encodedInv = EncodeInventory(cache.inventory)
    local encodedIdentity = json.encode(cache.identity)
    local encodedCloth = json.encode(cache.cloths)
    MySQL.Async.execute("UPDATE player_account SET player_position = @pos, player_skin = @skin, player_cloths = @cloths, player_identity = @identity, player_inv = @inv, player_money = @money, player_bank_balance = @bankBalance, player_dirty_money = @bankBalance, player_dirty_money = @dirtyMoney, player_job = @job, player_job_grade = @job_grade, player_group = @group WHERE player_identifier = @identifier", {
        ['@identifier'] = id,
        ['@inv'] = encodedInv,
        ['@money'] = cache.money,
        ['@bankBalance'] = cache.bankBalance,
        ['@dirtyMoney'] = cache.dirtyMoney,
        ['@job'] = cache.job,
        ['@job_grade'] = cache.job_grade,
        ['@group'] = cache.group,
        ['@pos'] = cache.pos,
        ['@skin'] = cache.skin,
        ['@cloths'] = encodedCloth,
        ['@identity'] = encodedIdentity,
    })

    if framework._display_logs then
        print("^2Saving ^7"..id.." cache: "..cache.money, cache.bankBalance, cache.dirtyMoney, cache.job, cache.group)
    end
end


function DoesPlayerExisit(id)
    local player = _player_get_identifier(id)
    local info = MySQL.Sync.fetchAll("SELECT * FROM player_account WHERE player_identifier = @identifier", {
        ['@identifier'] = player
    })
    return info
end

-- Call this on player connexion
function GetPlayerInfoToCache(id)

    local player = DoesPlayerExisit(id)
    if player[1] == nil then
        creation_utilisateur(id)

        if framework._display_logs == true then
            print('' .. _L("new_user") .. '| '..GetPlayerName(id)..'')
        end

    end

    local player = _player_get_identifier(id)
    --table.insert(PlayersData, {ServerID = id})
    PlayersData[id] = {ServerID = id}

    local info = MySQL.Sync.fetchAll("SELECT * FROM player_account WHERE player_identifier = @identifier", {
        ['@identifier'] = player
    })
    
    PlayersData[id].ServerID = id
    PlayersData[id].identifier = player
    if info[1].player_inv ~= nil then
        PlayersData[id].inventory = DecodeInventory(info[1].player_inv)
    else
        PlayersData[id].inventory = {}
    end
    PlayersData[id].money = info[1].player_money
    PlayersData[id].bankBalance = info[1].player_bank_balance
    PlayersData[id].dirtyMoney = info[1].player_dirty_money
    PlayersData[id].job = info[1].player_job
    PlayersData[id].job_grade = info[1].player_job_grade
    PlayersData[id].group = info[1].player_group
    PlayersData[id].pos = info[1].player_position
    PlayersData[id].skin = info[1].player_skin
    PlayersData[id].vip = info[1].vip

    if info[1].player_cloths ~= nil then
        PlayersData[id].cloths = json.decode(info[1].player_cloths)
    else
        PlayersData[id].cloths = {}
    end

    if info[1].player_identity ~= nil then
        PlayersData[id].identity = json.decode(info[1].player_identity)
    else
        PlayersData[id].identity = {}
    end
    if framework._display_logs then
        print("^2Adding ^7["..id.."] "..GetPlayerName(id).." to dynamic cache.")
    end
    return PlayersData[id]
end

function GetPlayerCache(id)
    return PlayersData[id]
end