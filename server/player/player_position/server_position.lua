function GetIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function GetIdentifier(id)
    local identifiers = GetPlayerIdentifiers(id)
    local player = GetIdentifiant(identifiers)
    return player
end

RegisterServerEvent("rF:save_position")
AddEventHandler("rF:save_position", function(LastPosX, LastPosY, LastPosZ)
    local source = source
    local player = GetIdentifier(source)
    local pCache = GetPlayerCache(source)
    local lastPosition = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. "}"
    PlayersData[pCache].pos = lastPosition
    if framework._display_logs == true then
        print('' .. _L("position_save") .. ' - ' .. _L("user") .. '' .. player .. ' - '..lastPosition)
		TriggerClientEvent("rF:notification", source, "~g~Position Saved")
    end
end)

RegisterServerEvent("rF:SpawnPlayer")
AddEventHandler("rF:SpawnPlayer", function()
    local source = source
    local player = GetIdentifier(source)
    local player_data = MySQL.Sync.fetchAll('SELECT player_first_spawn, player_position FROM player_account WHERE player_identifier = @player_identifier', {
        ["@player_identifier"] = player
    })
    if player_data[1].player_first_spawn == 'first_spawn' then
        if framework._player_first_spawn_location ~= "" then
            local pos = framework._player_first_spawn_location
            TriggerClientEvent("rF:spawn_last_position", source, 0, pos.x, pos.y, pos.z)

            if framework._display_logs == true then
                print('' .. _L("new_spawn_user") .. ' | ' .. player)
            end

        end
        MySQL.Async.execute("UPDATE player_account SET player_first_spawn = @player_first_spawn", { ["@player_first_spawn"] = 'not_first_spawn', })
    else
        local ToSpawnPos = json.decode(player_data[1].player_position)
        local PosX = ToSpawnPos[1]
        local PosY = ToSpawnPos[2]
        local PosZ = ToSpawnPos[3]
        TriggerClientEvent("rF:spawn_last_position", source, 1, PosX, PosY, PosZ)
        if framework._display_logs == true then
            print('' .. _L("user_reconnect") .. ' | '..player..' ' .. _L("user_reconnect2") .. '')
        end
    end
end)