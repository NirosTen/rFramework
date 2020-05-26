local RaisonAfficher = "Active anti-cheat detection."
local AntiVPN = true

function OnPlayerConnecting(name, setKickReason, deferrals)
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
                    setKickReason(RaisonAfficher.."\nBAN-DATE: "..v.date)
                    CancelEvent()
                    break
                end
            end
        end
    end

    if AntiVPN then
        if IP == nil then
            setKickReason("Connexion refusée, aucune IP trouvé.")
            CancelEvent()
        else
            PerformHttpRequest("http://ip-api.com/json/" .. IP .. "?fields=proxy", function(err, text, headers)
                if tonumber(err) == 200 then
                    local tbl = json.decode(text)
                    if tbl["proxy"] == false then
                        return
                    else
                        setKickReason("Connexion refusée, merci de désactivé tout VPN pour vous connecter.")
                        CancelEvent()
                    end
                else
                    setKickReason("Erreur lors de la vérification API\nCode d'erreur: "..tostring(err))
                    CancelEvent()
                end
            end)
        end
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)