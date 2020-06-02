
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
    MySQL.Async.execute("INSERT INTO `player_account` (`player_identifier`, `player_group`, `player_money`, `player_bank_balance`,`player_dirty_money`, `player_inv`, `player_job_grade`) VALUES (@identifier,'user', @money, @player_bank_balance, @dirtymoney, '{}', 0) ", {
        ['@identifier'] = player,
        ['@money'] = tonumber(config.player_money),
        ['@player_bank_balance'] = tonumber(config.player_bank_balance),
        ['@dirtymoney'] = tonumber(config.player_dirty_money)
    })
end

function GetPlayerAccounts(id)
    return PlayersData[id].money, PlayersData[id].bankBalance, PlayersData[id].dirtyMoney
end

RegisterNetEvent("rF:GetPlayerAccounts") 
AddEventHandler("rF:GetPlayerAccounts", function(tokenToCheck)
    if CheckToken(tokenToCheck, source, "GetPlayerAccounts") then
        local money, bank, dirty = GetPlayerAccounts(source)
        TriggerClientEvent("rF:SendPlayerAccounts", source, money, bank, dirty)
    end
end)


-- Setter 
function RemovePlayerMoney(tokenToCheck, id, rmv)
    if CheckToken(tokenToCheck, id, "RemovePlayerMoney") then
        local player = _player_get_identifier(id)
        PlayersData[id].money = tonumber(PlayersData[id].money - rmv)
        TriggerClientEvent('rF:rmvMoney', id, rmv)
        if framework._display_logs == true then
            print('' .. _L("user") .. ' | '..player..' ' .. _L("remove_money_wallet") .. ' '..rmv)
        end
    end
end

function RemovePlayerMoneyNoToken(id, rmv)
    local player = _player_get_identifier(id)
    PlayersData[id].money = tonumber(PlayersData[id].money - rmv)
    TriggerClientEvent('rF:rmvMoney', id, rmv)
    if framework._display_logs == true then
        print('' .. _L("user") .. ' | '..player..' ' .. _L("remove_money_wallet") .. ' '..rmv)
    end
end

RegisterNetEvent("rF:RemoveMoney")
AddEventHandler("rF:RemoveMoney", function(tokenToCheck, rmv)
    RemovePlayerMoney(tokenToCheck, source, rmv)
end)

function _player_add_money(tokenToCheck, id, add)
    if CheckToken(tokenToCheck, id, "_player_add_money") then
        local player = _player_get_identifier(id)
        PlayersData[id].money = tonumber(PlayersData[id].money + add)
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
    if CheckToken(tokenToCheck, id, "_player_add_bank_money") then
        local player = _player_get_identifier(id)
        PlayersData[id].bankBalance = tonumber(PlayersData[id].bankBalance + add)
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
    if CheckToken(tokenToCheck, id, "_player_remove_bank_money") then
        local player = _player_get_identifier(id)
        PlayersData[id].bankBalance = tonumber(PlayersData[id].bankBalance - rmv)
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
    if CheckToken(tokenToCheck, id, "_player_remove_dirty_money") then
        local player = _player_get_identifier(id)
        PlayersData[id].dirtyMoney = tonumber(PlayersData[id].dirtyMoney + add)
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
    if CheckToken(tokenToCheck, id, "_player_set_dirty_money") then
        local player = _player_get_identifier(id)
        PlayersData[id].dirtyMoney = tonumber(nb)
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
    if CheckToken(tokenToCheck, id, "_player_remove_money_for_bank") then
        local player = _player_get_identifier(id)
        if PlayersData[id].money >= rmv then
            PlayersData[id].money = tonumber(PlayersData[id].money - rmv)
            PlayersData[id].bankBalance = tonumber(PlayersData[id].bankBalance + rmv)
            TriggerClientEvent("rF:MoneyToBank", id, tonumber(rmv))
        end
    end
end

RegisterNetEvent("rF:MoveMoneyToBank")
AddEventHandler("rF:MoveMoneyToBank", function(tokenToCheck, rmv)
    _player_remove_money_for_bank(tokenToCheck, source, rmv)
end)

function _player_remove_bank_for_money(tokenToCheck, id, rmv)
    if CheckToken(tokenToCheck, id, "_player_remove_bank_for_money") then
        local player = _player_get_identifier(id)
        if PlayersData[id].bankBalance >= rmv then
            PlayersData[id].money = tonumber(PlayersData[id].money + rmv)
            PlayersData[id].bankBalance = tonumber(PlayersData[id].bankBalance - rmv)
            TriggerClientEvent("rF:BankToMoney", id, tonumber(rmv))
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

RegisterNetEvent("rF:GiveMoneyToPlayer")
AddEventHandler("rF:GiveMoneyToPlayer", function(tokenToCheck, target, money)
    if CheckToken(tokenToCheck, id, "GiveMoneyToPlayer") then
        GiveMoneyToPlayer(source, target, money)
    end
end)


function GiveMoneyToPlayer(source, target, money)
    local pCache = GetPlayerCache(source)
    local tCache = GetPlayerCache(target)
    if PlayersData[source].money >= money then
        PlayersData[source].money = PlayersData[source].money - money
        PlayersData[target].money = PlayersData[target].money + money
    end
end


RegisterNetEvent("rF:SaveSkin")
AddEventHandler("rF:SaveSkin", function(tokenToCheck, skin)
    if CheckToken(tokenToCheck, id, "SaveSkin") then
        PlayersData[source].skin = skin
    end
end)

RegisterNetEvent("rF:SaveCloth")
AddEventHandler("rF:SaveCloth", function(tokenToCheck, _name, cloth)
    if CheckToken(tokenToCheck, id, "SaveCloth") then
        PlayersData[source].cloths[_name] = {name = _name, data = cloth}
        TriggerClientEvent("rF:RefreshCloths", source, PlayersData[source].cloths)
    end
end)

-- Table to send
--
--   Identity = {
--       nom = pNom, -- String
--       prenom = pPrenom, -- String
--       age = page, -- String
--   }
RegisterNetEvent("rF:ChangePlayerIdentity")
AddEventHandler("rF:ChangePlayerIdentity", function(tokenToCheck, _identity)
    if CheckToken(tokenToCheck, id, "ChangePlayerIdentity") then
        local pCache = GetPlayerCache(source)
        PlayersData[source].identity = _identity
        TriggerClientEvent("rF:UpdateIdentity", source, _identity) -- Refresh the player identity in ressource
        SetNotFirstSpawn()
    end
end)

function GetPlayerJob(id)
    return PlayersData[id].job
end

-- Callback exemple

RegisterServerCallback('rF:TestCallback', function(source, cb)
    local money = PlayersData[source].money -- GetPlayerMoney
    local job = PlayersData[source].job -- GetPlayerJob
	cb(money, job) -- Send back those data
end)