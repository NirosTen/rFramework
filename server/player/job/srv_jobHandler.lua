

-- Change the job and call rF:OnJobChange with the new job in argument
function ChangePlayerJob(id, job)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].job = job
    PlayersData[pCache].job_grade = 0
    TriggerClientEvent("rF:OnJobChange", id, job)
end


RegisterNetEvent("rF:ChangePlayerJob")
AddEventHandler("rF:ChangePlayerJob", function(tokenToCheck, job)
    if CheckToken(tokenToCheck, source) then
        ChangePlayerJob(source, job)
    end
end)


function ChangePlayerJobGrade(id, grade)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].job_grade = tonumber(grade)
    TriggerClientEvent("rF:OnJobChange", id, job)
end


RegisterNetEvent("rF:ChangePlayerJobGrade")
AddEventHandler("rF:ChangePlayerJobGrade", function(tokenToCheck, grade)
    if CheckToken(tokenToCheck, source) then
        ChangePlayerJobGrade(source, grade)
    end
end)