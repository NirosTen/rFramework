

-- Change the job and call rF:JobRefresh with the new job in argument
function ChangePlayerJob(id, job)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].job = job
    PlayersData[pCache].job_grade = 0
    TriggerClientEvent("rF:JobRefresh", id, job)
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
    TriggerClientEvent("rF:JobRefresh", id, job)
end


RegisterNetEvent("rF:ChangePlayerJobGrade")
AddEventHandler("rF:ChangePlayerJobGrade", function(tokenToCheck, grade)
    if CheckToken(tokenToCheck, source) then
        ChangePlayerJobGrade(source, grade)
    end
end)


function GetPlayerJob(id)
    local pCache = GetPlayerCache(id) 
    return PlayersData[pCache].job, PlayersData[pCache].job_grade
end

RegisterNetEvent("rF:GetPlayerJob")
AddEvetnHandler("rF:GetPlayerJob", function()
    local job, grade = GetPlayerJob(source)
    TriggerServerEvent("rF:JobRefresh", source, job, grade)
end)