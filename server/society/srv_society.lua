MySQL.ready(function ()
    GetSocietyToCache()
end)


SocietyCache = {}

local second = 1000
local minute = 60*second
Citizen.CreateThread(function()
    while true do
        Wait(3*minute)
        SaveSocietyCache()
    end
end)


function SaveSocietyCache()
    for k,v in pairs(SocietyCache) do
        MySQL.Async.execute("UPDATE society SET money = @money, player_money = @money, inventory = @inv WHERE society_name = @name", {
            ['@name'] = v.name,
            ['@inv'] = json.encore(v.inventory),
            ['@money'] = v.money,
        })
    end
end

function GetSocietyToCache()
    local info = MySQL.Sync.fetchAll("SELECT society_name, money, inventory FROM society", {})
    for k,v in pairs(info) do
        local sInv = json.decode(v.inventory)
        table.insert(SocietyCache, {
            society = v.society_name,
            money = v.money,
            inventory = sInv,
        })
        if framework._display_logs then
            print("^2Loading ^7society ["..v.society_name.."] to dynamic cache with "..v.money.."^2$^7 and "..#sInv.." items.")
        end
    end
end