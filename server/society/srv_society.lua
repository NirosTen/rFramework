MySQL.ready(function ()
    GetSocietyToCache()
end)


SocietyCache = {}





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