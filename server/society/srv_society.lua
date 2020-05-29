MySQL.ready(function ()
    GetSocietyToCache()
end)


SocietyCache = {}

local second = 1000
local minute = 60*second
Citizen.CreateThread(function()
    while true do
        Wait(5*minute)
        SaveSocietyCache()
    end
end)


function SaveSocietyCache()
    for k,v in pairs(SocietyCache) do
        MySQL.Async.execute("UPDATE society SET money = @money, money = @money, inventory = @inv WHERE society_name = @name", {
            ['@name'] = v.society,
            ['@inv'] = json.encode(v.inventory),
            ['@money'] = v.money,
        })
        print("^2Society ["..v.society.."] ^7saved to DB with "..v.money.."^2$^7 and "..#v.inventory.." items.")
    end
end

function GetSocietyToCache()
    local info = MySQL.Sync.fetchAll("SELECT society_name, money, inventory FROM society", {})
    for k,v in pairs(info) do
        local sInv = json.decode(v.inventory)
        SocietyCache[v.society_name] = {society = v.society_name, money = v.money, inventory = sInv}
        if framework._display_logs then
            print("^2Loading ^7society ["..v.society_name.."] to dynamic cache with "..v.money.."^2$^7 and "..#sInv.." items.")
        end
    end
end
  

function AddSocietyMoney(name, money)
    SocietyCache[name].money = SocietyCache[name].money + money
end

function PaySociety(id, name, money)
    PlayersData[id].money = PlayersData[id].money - money
    SocietyCache[name].money = SocietyCache[name].money + money
    TriggerClientEvent('rF:rmvMoney', id, money)
end

function TakeMoneyFromSociety(id, name, money)
    PlayersData[id].money = PlayersData[id].money + money
    SocietyCache[name].money = SocietyCache[name].money - money
    TriggerClientEvent('rF:addMoney', id, money)
end

function RemoveSocietyMoney(name, money)
    SocietyCache[name].money = SocietyCache[name].money - money
end


function GetSocietyItems(name)
    return SocietyCache[name].inventory
end


function TransferItemFromInvToSociety(id, _name, _item, _label, _olabel, _count)
    local itemCount = SocietyCache[_name].inventory[_label]
    if itemCount == nil then
        SocietyCache[_name].inventory[_label] = {name = _item, label = _label, olabel = _olabel, count = _count}
    else
        SocietyCache[_name].inventory[_label].count = SocietyCache[_name].inventory[_label] + _count
    end
    local itemCount = PlayersData[id].inventory[_label].count
    if itemCount - _count <= 0 then
        PlayersData[id].inventory[_label] = nil
    else
        PlayersData[id].inventory[_label].count = PlayersData[id].inventory[_label] - _count
    end
end


function TransferItemFromSocietyToInv(id, _name, _item, _label, _olabel, _count, countSee)
    
    local invWeight = GetInvWeight(PlayersData[id].inventory)
    local itemWeight, itemLabel = GetItemWeight(_item, _count)
    if invWeight + itemWeight <= framework._default_player_max_weight then
        local itemCount = SocietyCache[_name].inventory[_label]
        
        if itemCount == nil then
            print("The player ["..id.."] tried to remove an item ^1that do not exist^7 in ".._name.." inventory.")
            AddPlayerLog(id, "Desync inventaire society. Society: ".._name.."\nItem: ".._item.."\nCount Serveur: 0\nCount client: "..countSee.."\nDemande: -".._count, 4)
            return
        else
            AddPlayerLog(id, "Desync inventaire society. Society: ".._name.."\nItem: ".._item.."\nCount Serveur: "..SocietyCache[_name].inventory[_label].count.."\nCount client: "..countSee.."\nDemande: -".._count, 4)
            return
        end
            
        if SocietyCache[_name].inventory[_label].count - _count == 0 then
            SocietyCache[_name].inventory[_label] = nil
        else
            SocietyCache[_name].inventory[_label].count = SocietyCache[_name].inventory[_label].count - _count
        end

        local itemCount = PlayersData[id].inventory[_label]
        if itemCount == nil then
            PlayersData[id].inventory[_label] = {name = _item, label = _label, olabel = _olabel, count = _count}
        else
            PlayersData[id].inventory[_label].count = PlayersData[id].inventory[_label].count + _count
        end
    else
        TriggerClientEvent("rF:notification", id, "~r~Action impossible.\n~w~Tu porte trop de chose.")
    end
end