

RegisterCommand("acunban", function(source, args, rawCommand)
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