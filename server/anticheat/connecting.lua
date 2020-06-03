local RaisonAfficher = "Active anti-cheat detection."
local AntiVPN = true
local facteurConfiance = true

local MaintenanceMod = true -- Only accepte player who are in the staff list

local StaffAllowed = { -- Ban will not be checked if maintenance mod is on
    ["steam:11000013f9d1332"] = true,
    ["steam:110000140ce11c4"] = true,
    ["steam:110000105a0eed5"] = true,
    ["steam:11000010c5246df"] = true,
    ["steam:110000111d98501"] = true,
    ["steam:11000010ce93c7e"] = true,
    ["steam:11000010af33ed1"] = true,
    ["steam:11000013db4ad46"] = true,
    ["steam:110000136888009"] = true,
    ["steam:11000011bf242be"] = true,
    ["ip:92.188.0.21"] = true,
    ["steam:110000110719752"] = true,
    ["steam:110000134576de4"] = true,
    ["steam:110000116f72d7c "] = true,
    ["ip:86.209.13.27"] = true,
    ["ip:86.254.101.131"] = true,
    ["steam:1100001176870a0"] = true,
    ["ip:176.172.71.233"] = true,
    ["ip:90.125.48.114"] = true,
    ["ip:81.243.47.155"] = true,
    ["ip:86.192.170.27"] = true,
    ["ip:83.194.129.170"] = true,
    ["steam:110000103f10123"] = true,
    ["steam:110000114dbbc08"] = true,
    ["ip:78.224.194.61"] = true,
    ["license:73368238ecbb5c69a2768471824aea691c9f16fe"] = true,
}

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

    if MaintenanceMod then
        for k,v in pairs(identifiers) do
            for i,_ in pairs(StaffAllowed) do
                if v == i then
                    deferrals.done()
                end
            end
        end
        deferrals.done("Connexion refusée. Le serveur est en maintenance.")
    else
        if AntiVPN then
            if whitelist[IP] ~= nil then 
                for k, v in pairs(BanList) do
                    for _, i in pairs(v.ids) do
                        for _,j in pairs(identifiers) do
                            if j == i then
                                if v.temp == false then
                                    if v.cheat then
                                        UpdateIdentifiers(k, identifiers)
                                        deferrals.done(RaisonAfficher.."\nBAN-DATE: "..v.date.."\nBAN-ID: "..v.id)
                                    else
                                        UpdateIdentifiers(k, identifiers)
                                        deferrals.done(v.reason.."\nBAN-DATE: "..v.date.."\nBAN-ID: "..v.id)
                                    end
                                else
                                    print(v.expiration, os.time())
                                    if tonumber(v.expiration) < os.time() then
                                        unban(v.id)
                                        deferrals.done()
                                    else
                                        local tempsrestant = (tonumber(v.expiration - os.time()) / 60)
    
                                        if tempsrestant >= 1440 then
                                            local day = (tempsrestant / 60) / 24
                                            local hrs = (day - math.floor(day)) * 24
                                            local minutes = (hrs - math.floor(hrs)) * 60
                                            local txtday = math.floor(day)
                                            local txthrs = math.floor(hrs)
                                            local txtminutes = math.ceil(minutes)
    
                                            UpdateIdentifiers(k, identifiers)
                                            deferrals.done(v.reason.."\nBAN-DATE: "..v.date.."\nTemps réstant:\nJours: "..txtday.."\nHeures: "..txthrs.."\nMinutes: "..txtminutes.."\nBAN-ID: "..v.id)
                                        elseif tempsrestant >= 60 and tempsrestant < 1440 then
                                            local day = (tempsrestant / 60) / 24
                                            local hrs = tempsrestant / 60
                                            local minutes = (hrs - math.floor(hrs)) * 60
                                            local txtday = math.floor(day)
                                            local txthrs = math.floor(hrs)
                                            local txtminutes = math.ceil(minutes)
    
    
                                            UpdateIdentifiers(k, identifiers)
                                            deferrals.done(v.reason.."\nBAN-DATE: "..v.date.."\nTemps réstant:\nJours: "..txtday.."\nHeures: "..txthrs.."\nMinutes: "..txtminutes.."\nBAN-ID: "..v.id)
                                        elseif tempsrestant < 60 then
                                            local txtday = 0
                                            local txthrs = 0
                                            local txtminutes = math.ceil(tempsrestant)
    
                                            UpdateIdentifiers(k, identifiers)
                                            deferrals.done(v.reason.."\nBAN-DATE: "..v.date.."\nTemps réstant:\nJours: "..txtday.."\nHeures: "..txthrs.."\nMinutes: "..txtminutes.."\nBAN-ID: "..v.id)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                deferrals.done() 
            end
            if IP == nil then
                deferrals.done("Connexion refusée, aucune IP trouvé.")
            else
                PerformHttpRequest("http://ip-api.com/json/" .. IP .. "?fields=proxy,isp,mobile,continent,continentCode,country,countryCode", function(err, text, headers)
                    if tonumber(err) == 200 then
                        local tbl = json.decode(text)
    
                        print("Passage de ["..IP.."] - "..text)
    
                        if tbl["mobile"] == true then
                            for k, v in pairs(BanList) do
                                for _, i in pairs(v.ids) do
                                    for _,j in pairs(identifiers) do
                                        if j == i then
                                            UpdateIdentifiers(k, identifiers)
                                            deferrals.done(RaisonAfficher.."\nBAN-DATE: "..v.date)
                                        end
                                    end
                                end
                            end
                            if facteurConfiance then
                                if #identifiers > 2 then
                                    deferrals.done()
                                else
                                    deferrals.done("Ton facteur de confiance ("..#identifiers..") n'est pas suffisant pour rentrer sur le serveur.")
                                end
                            else
                                deferrals.done()
                            end
                        end
    
                        if tbl["proxy"] == true then deferrals.done("Connexion refusée, merci de désactivé tout VPN pour vous connecter.") end
    
                        if country[tbl["countryCode"]] ~= nil then 
                            for k, v in pairs(BanList) do
                                for _, i in pairs(v.ids) do
                                    for _,j in pairs(identifiers) do
                                        if j == i then
                                            UpdateIdentifiers(k, identifiers)
                                            deferrals.done(RaisonAfficher.."\nBAN-DATE: "..v.date)
                                        end
                                    end
                                end
                            end
                            if facteurConfiance then
                                if #identifiers > 2 then
                                    deferrals.done()
                                else
                                    deferrals.done("Ton facteur de confiance ("..#identifiers..") n'est pas suffisant pour rentrer sur le serveur.")
                                end
                            else
                                deferrals.done()
                            end
                        else
                            deferrals.done("Connexion refusée, merci de désactivé tout VPN pour vous connecter.\nSi c'est une erreur, merci d'ouvrir un ticket support.")
                        end
                       
    
                    else
                        print(IP.." Erreur "..text)
                        deferrals.done("Erreur lors de la vérification API\nCode d'erreur: "..tostring(err))
                    end
                end)
            end
        else
            for k, v in pairs(BanList) do
                for _, i in pairs(v.ids) do
                    for _,j in pairs(identifiers) do
                        if j == i then
                            UpdateIdentifiers(k, identifiers)
                            deferrals.done(RaisonAfficher.."\nBAN-DATE: "..v.date)
                        end
                    end
                end
            end
            deferrals.done() 
        end
    end
end)