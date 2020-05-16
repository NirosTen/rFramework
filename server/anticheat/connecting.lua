local RaisonAfficher = "Active anti-cheat detection."

function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)

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

end

AddEventHandler("playerConnecting", OnPlayerConnecting)