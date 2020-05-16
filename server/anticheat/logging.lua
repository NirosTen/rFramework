local webhook = "https://discordapp.com/api/webhooks/711302645369012358/7EPYNlE3ujHDkwyif2jJ3q4IPWbIkugaj0eF7rY5ec8bqiAniYnYWx2g8A8DaJYX_kOu"


local RaisonAfficher = "Active anti-cheat detection."


function AddPlayerLog(id, log, force)
    if DetectionCache[id] == nil then
        DetectionCache[id] = {}
        DetectionCache[id].count = 0
        DetectionCache[id].log = {}
    end
    DetectionCache[id].count = DetectionCache[id].count + force
    table.insert(DetectionCache[id].log, log)

    if DetectionCache[id].count  >= 5 then
        -- BAN PLAYER
        BanPlayer(id)
    end
end

function BanPlayer(id)

    SendLogToDiscord(id)
end


function SendLogToDiscord(id)
    local message = "\n"
    local logs = DetectionCache[id]
    for k,v in pairs(logs.log) do
        message = message.."\n["..k.."] - "..v
    end
    message = message.."\n**IDENTIFIANT**:\n"
    for k,v in pairs(GetPlayerIdentifiers(id)) do
        message = message.."\n["..k.."] - "..v
    end
    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "**DETECTION ["..id.."] ".. GetPlayerName(id) .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Liste des détéction du joueur",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end