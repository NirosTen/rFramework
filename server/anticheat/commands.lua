

RegisterCommand("unban", function(source, args, rawCommand)
    if source == 0 then
        if args[1] ~= nil then
            unban(args[1])
        else
            print("Aucun ban-id spécifié.")
        end
    else
        print("Console only command.")
    end
end, true)



RegisterCommand("acofflineban", function(source, args, rawCommand)
    if source == 0 then
        if args[1] ~= nil then
            acofflineban(args[1])
        else
            print("Aucun id spécifié.")
        end
    else
        print("Console only command.")
    end
end, true)


RegisterCommand("ban", function(source, args, rawCommand)
    if source == 0 then
        local target = tonumber(args[1])
        local duree = tonumber(args[2])
        local reason = table.concat(args, " ",3)
        print(target, duree, reason)
        if target ~= nil then
            if duree == 0 then
                BanPlayer(target, reason, 0)
            else
                TempBanPlayer(target, reason, duree, 0)
            end
        else
            print("Aucun id spécifié.")
        end
    elseif PlayersCache[source].group ~= "user" then
        local target = tonumber(args[1])
        local duree = tonumber(args[2])
        local reason = table.concat(args, " ",3)
        if target ~= nil then
            if duree == 0 then
                BanPlayer(target, reason, source)
            else
                TempBanPlayer(target, reason, duree, source)
            end
        end
    end
end, true)


RegisterCommand("maintenance", function(source, args, rawCommand)
    if source == 0 then
        if args[1] ~= nil then
            AddToMaintenance(args[1])
        end
    end
end, true)



RegisterNetEvent("rF:BanPlayer")
AddEventHandler("rF:BanPlayer", function(token, target, duree, reason)
    if CheckToken(token, source, "rF:BanPlayer") then
        local target = tonumber(target)
        local duree = tonumber(duree)

        if duree == 0 then
            BanPlayer(target, reason, source)
        else
            TempBanPlayer(target, reason, duree, source)
        end
    end
end)


RegisterNetEvent("rF:KickPlayer")
AddEventHandler("rF:KickPlayer", function(token, target, reason)
    if CheckToken(token, source, "rF:BanPlayer") then
        DropPlayer(target, reason)
    end
end)