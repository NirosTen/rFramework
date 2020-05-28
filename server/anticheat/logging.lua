local webhook = "https://discordapp.com/api/webhooks/711302645369012358/7EPYNlE3ujHDkwyif2jJ3q4IPWbIkugaj0eF7rY5ec8bqiAniYnYWx2g8A8DaJYX_kOu"


BanList = {}
Citizen.CreateThread(function()
    BanList = LoadResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json')
    BanList = json.decode(BanList)
    print("^2Loaded^7 ban-list with "..#BanList.." bans.")
end)

RegisterNetEvent("cortana:AddLog")
AddEventHandler("cortana:AddLog", function(type, force, complement)
    if type == 1 then
        AddPlayerLog(source, "AC: Injection de mod menu", force)
    elseif type == 3 then
        if complement == nil then
            AddPlayerLog(source, "AC: Hammafia dected", force)
        else
            AddPlayerLog(source, "AC: Hammafia dected: "..complement, force)
        end
    end
end)

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
    local logs = DetectionCache[id]
    ban = {}
    ban.name = GetPlayerName(id)
    ban.ids = {}
    ban.reason = {}
    ban.date = os.date("%y/%m/%d %X")
    for k,v in pairs(GetPlayerIdentifiers(id)) do
        table.insert(ban.ids, v)
    end
    for k,v in pairs(logs.log) do
        table.insert(ban.reason, v)
    end
    table.insert(BanList, ban)
    SaveResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json', json.encode(BanList), -1)
    print("^1BAN: ^7Added ["..id.."] to the ban-list.")
    DropPlayer(id, "Vous avez été banni du serveur.\n"..ban.date)
end


function UpdateIdentifiers(k, identifiers)
    for _,v in pairs(identifiers) do
        local add = true
        for _,i in pairs(BanList[k].ids) do
            if v == i then
                add = false
            end
        end
        if add then
            print("^1BAN-UPDATE: ^7Adding ["..v.."] to the ban-list.")
            table.insert(BanList[k].ids, v)
        end
    end

    SaveResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json', json.encode(BanList), -1)
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