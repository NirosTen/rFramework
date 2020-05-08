

-- Change the job and call rF:JobRefresh with the new job in argument
function ChangePlayerJob(id, job)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].job = job
    PlayersData[pCache].job_grade = 0
    TriggerClientEvent("rF:JobRefresh", id, PlayersData[pCache].job, PlayersData[pCache].job_grade)
    TriggerClientEvent("rF:job", id, job)
end


function ResetPlayerJob(id)
    local pCache = GetPlayerCache(id)
    PlayersData[pCache].job = "Aucun"
    PlayersData[pCache].job_grade = 0
    TriggerClientEvent("rF:JobRefresh", id, PlayersData[pCache].job, PlayersData[pCache].job_grade)
    TriggerClientEvent("rF:job", id, job) 
end

function ChangePlayerJobGrade(id, grade)
    local pCache = GetPlayerCache(id) 
    PlayersData[pCache].job_grade = grade
    TriggerClientEvent("rF:JobRefresh", id, PlayersData[pCache].job, PlayersData[pCache].job_grade)
    TriggerClientEvent("rF:job", id, job)
end


function GetPlayerJob(id)
    local pCache = GetPlayerCache(id) 
    return PlayersData[pCache].job, PlayersData[pCache].job_grade
end
