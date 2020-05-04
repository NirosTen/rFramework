

-- Change the job and call rF:OnJobChange with the new job in argument
function ChangePlayerJob(id, job)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].job = job
    TriggerClientEvent("rF:OnJobChange", id, job)
end


RegisterNetEvent("rF:ChangePlayerJob")
AddEventHandler("rF:ChangePlayerJob", function(tokenToCheck, job)
    if CheckToken(tokenToCheck, source) then
        ChangePlayerJob(source, job)
    end
end)