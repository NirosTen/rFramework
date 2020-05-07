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
        MySQL.Async.execute("UPDATE society SET money = @money, money = @money, inventory = @inv WHERE society_name = @name", {
            ['@name'] = v.name,
            ['@inv'] = json.encode(v.inventory),
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


function AddSocietyMoney(name, money)
    local _, i = GetCachedSociety(name)
    SocietyCache[i].money = SocietyCache[i].money + money
end

function PaySociety(id, name, money)
    local _, i = GetCachedSociety(name)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].money = PlayersData[pCache].money - money
    SocietyCache[i].money = SocietyCache[i].money + money
    TriggerClientEvent('rF:rmvMoney', id, money)
end

function RemoveSocietyMoney(name, money)
    local _, i = GetCachedSociety(name)
    SocietyCache[i].money = SocietyCache[i].money - money
end


function GetSocietyItems(name)
    local _, i = GetCachedSociety(name)
    return SocietyCache[i].inventory
end


function AddSocietyItems(_name, _item, _label, _count)
    local _, i = GetCachedSociety(name)
    local itemCount, k = GetSocietyItemCount(_item, SocietyCache[i].inventory)
    if itemCount == 0 then
        table.insert(SocietyCache[i].inventory, {name = _item, lavel = _label, count = _count})
    else
        table.remove(SocietyCache[i].inventory, k)
        table.insert(SocietyCache[i].inventory, {name = _item, label = _label, count = itemCount + _count})
    end
end


function RemoveSocietyItems(_name, _item, _label, _count)
    local _, i = GetCachedSociety(name)
    local itemCount, k = GetSocietyItemCount(_item, SocietyCache[i].inventory)
    if itemCount == 0 then
        -- Display error, the item do not exist
    elseif itemCount - _count == 0 then
        table.remove(SocietyCache[i].inventory, k)
    else
        table.remove(SocietyCache[i].inventory, k)
        table.insert(SocietyCache[i].inventory, {name = _item, label = _label, count = itemCount - _count})
    end
end

function GetSocietyItemCount(item, inv)
    local found = false
    for k,v in pairs(inv) do 
        if v.name == item then
            found = true
            return v.count, k
        end
    end
    -- Not sure if the if is needed, i think the return stop the for, not sure tho
    if not found then
        return 0
    end
end




function GetCachedSociety(name)
    for k,v in pairs(SocietyCache) do
        if v.name == name then
            return v, k
        end
    end
end