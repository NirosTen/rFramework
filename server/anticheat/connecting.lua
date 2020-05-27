local RaisonAfficher = "Active anti-cheat detection."
local AntiVPN = true

local whitelist = {
    ["127.0.0.1"] = true,
}

local country = {
    ["BE"] = true,
    ["FR"] = true,
    ["CHE"] = true,
    ["CA"] = true,
    ["IDF"] = true,
}

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    deferrals.defer()
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    local IP = nil
    for _, v in pairs(identifiers) do
        if string.find(v, "ip") then
            IP = v:sub(4)
            break
        end
    end

    for k, v in pairs(BanList) do
        for _, i in pairs(v.ids) do
            for _,j in pairs(identifiers) do
                if j == i then
                    UpdateIdentifiers(k, identifiers)
                    --setKickReason(RaisonAfficher.."\nBAN-DATE: "..v.date)
                    --CancelEvent()
                    deferrals.done(RaisonAfficher.."\nBAN-DATE: "..v.date)
                end
            end
        end
    end

    if AntiVPN then
        if whitelist[IP] ~= nil then deferrals.done() end
        if IP == nil then
            print("Connexion refusée, aucune IP trouvé.")
        else
            PerformHttpRequest("http://ip-api.com/json/" .. IP .. "?fields=proxy,isp,mobile,continent,continentCode,country", function(err, text, headers)
                if tonumber(err) == 200 then
                    local tbl = json.decode(text)

                    print("Passage de ["..IP.."] - "..text)


                    if tbl["mobile"] == true then deferrals.done() end
                    if tbl["proxy"] == true then deferrals.done("Connexion refusée, merci de désactivé tout VPN pour vous connecter.") end
                    if country[tbl["proxy"]] ~= nil then deferrals.done() end
                   

                    deferrals.done()
                else
                    print(IP.." Erreur "..text)
                    deferrals.done("Erreur lors de la vérification API\nCode d'erreur: "..tostring(err))
                end
            end)
        end
    end
end)