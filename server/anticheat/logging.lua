-- CHANGE THIS
local webhook = "https://discordapp.com/api/webhooks/716579221555642435/VPw3aGWjj8BpM_xGD4ELvMfZNug2aEI8onCDAW1iMMaLMj4DqPVvbodky5hjYKP6wEx9"
local BanStaffHook = "https://discordapp.com/api/webhooks/716579142702727188/F_0O6NwzmqseUt2Nr_Vt8YTBuJ5p3XBf_tNmDCsGMRpx8KMDhYBvX_GLsKuf5Vh9359Y"
local unbanHook = "https://discordapp.com/api/webhooks/716579403014078474/fhCEZmXplcX5ROA5EXEFwqLESm1AbfaSs0-ck5yUf5jZr1cWb0X99ELSNIKRCAb-aoJD"


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
    elseif type == 4 then
        if complement == nil then
            AddPlayerLog(source, "AC: Banned trigger", force)
        else
            AddPlayerLog(source, "AC: Banned trigger: "..complement, force)
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
        CheatBanPlayer(id)
    end
end

function CheatBanPlayer(id)
    if id == nil then return end
    if GetPlayerName(id) == nil then return end
    local logs = DetectionCache[id]
    ban = {}
    ban.name = GetPlayerName(id)
    ban.ids = {}
    ban.reason = {}
    ban.date = os.date("%y/%m/%d %X")
    ban.id = ""..math.random(1000,9999).."-"..math.random(1000,9999)
    ban.temp = false
    ban.cheat = true
    SendLogToDiscord(id, ban.id)
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

function BanPlayer(id, reason, source)
    if id == nil then return end
    if GetPlayerName(id) == nil then return end
    local logs = DetectionCache[id]
    ban = {}
    ban.name = GetPlayerName(id)
    ban.ids = {}
    ban.reason = reason
    ban.date = os.date("%y/%m/%d %X")
    ban.id = ""..math.random(1000,9999).."-"..math.random(1000,9999)
    ban.temp = false

    SendBanToDiscord(id, ban.id, reason, nil, source)
    for k,v in pairs(GetPlayerIdentifiers(id)) do
        table.insert(ban.ids, v)
    end

    table.insert(BanList, ban)
    SaveResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json', json.encode(BanList), -1)
    print("^1BAN: ^7Added ["..id.."] to the ban-list.")
    DropPlayer(id, "Vous avez été banni du serveur.\n"..ban.date)
end

function TempBanPlayer(id, reason, time, source)
    if id == nil then return end
    if GetPlayerName(id) == nil then return end
    local logs = DetectionCache[id]
    ban = {}
    ban.name = GetPlayerName(id)
    ban.ids = {}
    ban.reason = reason
    ban.date = os.date("%y/%m/%d %X")
    ban.id = ""..math.random(1000,9999).."-"..math.random(1000,9999)
    ban.temp = true

    local expiration = time * 86400
    if expiration < os.time() then
        expiration = os.time()+expiration
    end
    ban.expiration = expiration

    SendBanToDiscord(id, ban.id, reason, time, source)
    for k,v in pairs(GetPlayerIdentifiers(id)) do
        table.insert(ban.ids, v)
    end

    table.insert(BanList, ban)
    SaveResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json', json.encode(BanList), -1)
    print("^1BAN: ^7Added ["..id.."] to the ban-list.")
    DropPlayer(id, "Vous avez été banni du serveur.\n"..ban.date)
end


function unban(banid)
    for k,v in pairs(BanList) do
        if v.id == banid then
            table.remove(BanList, k)
            UnbanDiscord(v)
            print("^1BAN: ^7Removed ["..v.id.."] from ban-list.")
            SaveResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json', json.encode(BanList), -1)
            return
        end
    end
end


function acofflineban(id)
    if id == nil then return end
    if GetPlayerName(id) == nil then return end
    local cache = GetIdsFromCache(id)
    if cache ~= false then
        ban = {}
        ban.name = cache.name
        ban.ids = {}
        ban.reason = "Manual console ban."
        ban.date = os.date("%y/%m/%d %X")
        ban.id = ""..math.random(1000,9999).."-"..math.random(1000,9999)
        SendLogToDiscordOfflineBan(id, ban.id, cache)
        for k,v in pairs(cache.ids) do
            table.insert(ban.ids, v)
        end
        table.insert(BanList, ban)
        SaveResourceFile(GetCurrentResourceName(), 'server/anticheat/bans.json', json.encode(BanList), -1)
        print("^1BAN: ^7Added ["..cache.name.."] to the ban-list.")
    else
        print("^1BAN: ^7Player not found in server cache.")
    end
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


function UnbanDiscord(infos)
    local message = "\n"
    if type(infos.reason) == "table" then
        for k,v in pairs(infos.reason) do
            message = message.."\n["..k.."] - "..v
        end
    else
        message = message.."\n[1] - "..infos.reason
    end
    message = message.."\n**IDENTIFIANT**:\n"
    for k,v in pairs(infos.ids) do
        message = message.."\n["..k.."] - "..v
    end  


    local content = {
        {
            ["color"] = '5015295',
            ["title"] = "**UNBAN** ["..infos.id.."] ".. infos.name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Unban du joueur depuis la console serveur.",
            },
        }
    }
    PerformHttpRequest(unbanHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end

function SendLogToDiscordOfflineBan(id, banid, cache)
    local message = "\n"
    message = message.."\n**IDENTIFIANT**:\n"
    for k,v in pairs(cache.ids) do
        message = message.."\n["..k.."] - "..v
    end
    local content = {
        {
            ["color"] = '14177041',
            ["title"] = "**DETECTION ["..id.."] ".. cache.name .."** BAN-ID: "..banid,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Ban offline d'un joueur",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end

function SendLogToDiscord(id, banid)
    if id == nil then return end
    if GetPlayerName(id) == nil then return end
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
            ["color"] = '14177041',
            ["title"] = "**DETECTION ["..id.."] ".. GetPlayerName(id) .."** BAN-ID: "..banid,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Liste des détéction du joueur",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end


function SendBanToDiscord(id, banid, reason, time, source)
    if id == nil then return end
    if GetPlayerName(id) == nil then return end
    local message = "\n"

    message = message.."\n**IDENTIFIANT**:\n"
    for k,v in pairs(GetPlayerIdentifiers(id)) do
        message = message.."\n["..k.."] - "..v
    end

    message = message.."\n**REASON**:\n"..reason

    if source == 0 then
        source = "Console Serveur"
    else
        source = GetPlayerName(source)
    end

    if time ~= nil then
        local content = {
            {
                ["color"] = '14177041',
                ["title"] = "**BAN ["..id.."] ".. GetPlayerName(id) .."** BAN-ID: "..banid.." pour "..time.."j",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "Banni par le staff "..source,
                },
            }
        }
        PerformHttpRequest(BanStaffHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    else
        local content = {
            {
                ["color"] = '14177041',
                ["title"] = "**BAN-PERMA ["..id.."] ".. GetPlayerName(id) .."** BAN-ID: "..banid,
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "Banni par le staff "..source,
                },
            }
        }
        PerformHttpRequest(BanStaffHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end
end