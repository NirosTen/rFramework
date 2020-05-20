
local blacklisted = {
    [GetHashKey("hydra")] = true, -- Le true sert à rien
    [GetHashKey("cerberus2")] = true,
    [GetHashKey("cerberus")] = true,
    [GetHashKey("cutter")] = true,
    [GetHashKey("dump")] = true,
    [GetHashKey("apc")] = true,
    [GetHashKey("halftrack")] = true,
    [GetHashKey("khanjali")] = true,
    [GetHashKey("minitank")] = true,
    [GetHashKey("rhino")] = true,
    [GetHashKey("scarab")] = true,
    [GetHashKey("scarab2")] = true,
    [GetHashKey("scarab3")] = true,
    [GetHashKey("thruster")] = true,
    [GetHashKey("trailersmall2")] = true,
    [GetHashKey("oppressor")] = true,
    [GetHashKey("oppressor2")] = true,
    [GetHashKey("blazer5")] = true,
    [GetHashKey("dune2")] = true,
    [GetHashKey("dune3")] = true,
    [GetHashKey("dune4")] = true,
    [GetHashKey("dune5")] = true,
    [GetHashKey("insurgent")] = true,
    [GetHashKey("insurgent3")] = true,
    [GetHashKey("menacer")] = true,
    [GetHashKey("technical")] = true,
    [GetHashKey("technical2")] = true,
    [GetHashKey("technical3")] = true,
    [GetHashKey("cargoplane")] = true,
    [GetHashKey("strikeforce")] = true,
    [GetHashKey("titan")] = true,
    [GetHashKey("volatol")] = true,
    [GetHashKey("freight")] = true,
    [GetHashKey("freightcar")] = true,
    [GetHashKey("freightcont1")] = true,
    [GetHashKey("freightcont2")] = true,
    [GetHashKey("freightgrain")] = true,
    [GetHashKey("metrotrain")] = true,
    [GetHashKey("tankercar")] = true,
    [GetHashKey("blimp2")] = true,
    -- prosp
    [GetHashKey("xs_prop_hamburgher_wl")] = true,
}

DetectionCache = {}

AddEventHandler("entityCreating", function(entity)
    if DoesEntityExist(entity) then
        if blacklisted[GetEntityModel(entity)] then
            print("^1ENTITY ERROR:^7 An blacklisted entity tried to be spawned by the ID ["..NetworkGetEntityOwner(entity).."]")
            CancelEvent()
            AddPlayerLog(NetworkGetEntityOwner(entity), "AC: Tentative de spawn d'entité blacklist", 1)
        end
    end
end)