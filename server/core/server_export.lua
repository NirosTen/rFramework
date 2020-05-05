
-- Getter
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function _player_get_identifier(id)
    local identifiers = GetPlayerIdentifiers(id)
    local player = getIdentifiant(identifiers)
    return player
end

-- Export Config
function Config()
    return config
end

-- Sending back money / bank / dirty money
function _server_get_player_all_money(id)
    local player = _player_get_identifier(id)
    return PlayersData[player].money, PlayersData[player].bankBalance, PlayersData[player].dirtyMoney
end

function _server_refrech_player_money(id) -- not sure why we would need this ? Maybe if we make a change on the DB and the player is still connected ? Not sure.
    local player = _player_get_identifier(id)
    local info = MySQL.Sync.fetchAll("SELECT player_account.player_money, player_account.player_bank_balance, player_account.player_dirty_money FROM player_account WHERE player_identifier = @identifier", {
        ['@identifier'] = player
    })
    PlayersData[id].money = info[1].player_money
    PlayersData[id].bankBalance = info[1].player_bank_balance
    PlayersData[id].dirtyMoney = info[1].player_dirty_money
end

function creation_utilisateur(id)
    local player = _player_get_identifier(id)
    MySQL.Async.execute("INSERT INTO `player_account` (`player_identifier`, `player_group`, `player_money`, `player_bank_balance`,`player_dirty_money`, `player_inv`) VALUES (@identifier,'user', @money, @player_bank_balance, @dirtymoney, '{}') ", {
        ['@identifier'] = player,
        ['@money'] = tonumber(config.player_money),
        ['@player_bank_balance'] = tonumber(config.player_bank_balance),
        ['@dirtymoney'] = tonumber(config.player_dirty_money)
    })
end

function GetPlayerAccounts(id)
    local pCache = GetPlayerCache(id) 
    return PlayersData[pCache].money, PlayersData[pCache].bankBalance, PlayersData[pCache].dirtyMoney
end

RegisterNetEvent("rF:GetPlayerAccounts")
AddEventHandler("rF:GetPlayerAccounts", function(tokenToCheck)
    if CheckToken(tokenToCheck, source) then
        local money, bank, dirty = GetPlayerAccounts(source)
        TriggerClientEvent("rF:SendPlayerAccounts", source, money, bank, dirty)
    end
end)


-- Setter 
function RemovePlayerMoney(tokenToCheck, id, rmv)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id) 
        PlayersData[pCache].money = tonumber(PlayersData[pCache].money - rmv)
        TriggerClientEvent('rF:rmvMoney', id, rmv)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' | '..player..' ' .. _L("remove_money_wallet") .. ' '..rmv)
        end
    end
end

RegisterNetEvent("rF:RemoveMoney")
AddEventHandler("rF:RemoveMoney", function(tokenToCheck, rmv)
    RemovePlayerMoney(tokenToCheck, source, rmv)
end)

function _player_add_money(tokenToCheck, id, add)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id) 
        PlayersData[pCache].money = tonumber(PlayersData[pCache].money + add)
        TriggerClientEvent('rF:addMoney', id, add)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' |'..player..' ' .. _L("add_money_wallet") .. ' '..add)
        end
    end
end

RegisterNetEvent("rF:AddMoney")
AddEventHandler("rF:AddMoney", function(tokenToCheck, add)
    _player_add_money(tokenToCheck, source, add)
end)

function _player_add_bank_money(tokenToCheck, id, add)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id)
        PlayersData[pCache].bankBalance = tonumber(PlayersData[pCache].bankBalance + add)
        TriggerClientEvent('rF:addBank', id, add)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' |'..player..' ' .. _L("add_bank_money") .. ''..add)
        end
    end
end

RegisterNetEvent("rF:AddBankMoney")
AddEventHandler("rF:AddBankMoney", function(tokenToCheck, add)
    _player_add_bank_money(tokenToCheck, source, add)
end)

function _player_remove_bank_money(tokenToCheck, id, rmv)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id)
        PlayersData[pCache].bankBalance = tonumber(PlayersData[pCache].bankBalance - rmv)
        TriggerClientEvent('rF:rmvBank', id, rmv)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' |'..player..' ' .. _L("bank_money_removed") .. ' '..rmv..'')
        end
    end
end

RegisterNetEvent("rF:RemoveBankMoney")
AddEventHandler("rF:RemoveBankMoney", function(tokenToCheck, rmv)
    _player_remove_bank_money(tokenToCheck, source, rmv)
end)

function _player_remove_dirty_money(tokenToCheck, id, add)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id)
        PlayersData[pCache].dirtyMoney = tonumber(PlayersData[pCache].dirtyMoney + add)
        TriggerClientEvent('rF:rmvDirtyMoney', id, add)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' |'..player..' ' .. _L("remove_dirty_money") .. ' '..add)
        end
    end
end

RegisterNetEvent("rF:RemoveDirtyMoney")
AddEventHandler("rF:RemoveDirtyMoney", function(tokenToCheck, rmv)
    _player_remove_dirty_money(tokenToCheck, source, rmv)
end)

function _player_set_dirty_money(tokenToCheck, id, nb)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id)
        PlayersData[pCache].dirtyMoney = tonumber(nb)
        TriggerClientEvent('rF:setDirtyMoney', id, nb)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' |'..player..' ' .. _L("add_dirty_money") .. ' '..nb)
        end
    end
end

RegisterNetEvent("rF:SetDirtyMoney")
AddEventHandler("rF:SetDirtyMoney", function(tokenToCheck, set)
    _player_set_dirty_money(tokenToCheck, source, set)
end)

function _player_remove_money_for_bank(tokenToCheck, id, rmv)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id)
        if PlayersData[pCache].money >= rmv then
            PlayersData[pCache].money = tonumber(PlayersData[pCache].money - rmv)
            PlayersData[pCache].bankBalance = tonumber(PlayersData[pCache].bankBalance + rmv)
            TriggerClientEvent('rF:removeMoneyForBank', id, tonumber(rmv))
        end
    end
end

RegisterNetEvent("rF:MoveMoneyToBank")
AddEventHandler("rF:MoveMoneyToBank", function(tokenToCheck, rmv)
    _player_remove_money_for_bank(tokenToCheck, source, rmv)
end)

function _player_remove_bank_for_money(tokenToCheck, id, rmv)
    if CheckToken(tokenToCheck, id) then
        local player = _player_get_identifier(id)
        local pCache = GetPlayerCache(id)
        if PlayersData[pCache].bankBalance >= rmv then
            PlayersData[pCache].money = tonumber(PlayersData[pCache].money + rmv)
            PlayersData[pCache].bankBalance = tonumber(PlayersData[pCache].bankBalance - rmv)
            TriggerClientEvent('rF:removeBankForMoney', id, tonumber(rmv))
        end
    end
end

RegisterNetEvent("rF:MoveMoneyFromBankToPlayer")
AddEventHandler("rF:MoveMoneyFromBankToPlayer", function(tokenToCheck, rmv)
    _player_remove_bank_for_money(tokenToCheck, source, rmv)
end)

function save_player_position(LastPosX, LastPosY, LastPosZ, LastPosH)
    TriggerEvent('rF:save_position', LastPosX, LastPosY, LastPosZ, LastPosH)
end