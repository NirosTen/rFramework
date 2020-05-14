

-- Change the job and call rF:JobRefresh with the new job in argument
function ChangePlayerJob(id, job)
    PlayersData[id].job = job
    PlayersData[id].job_grade = 0
    TriggerClientEvent("rF:JobRefresh", id, PlayersData[id].job, PlayersData[id].job_grade)
    TriggerClientEvent("rF:job", id, job)
end


function ResetPlayerJob(id)
    PlayersData[id].job = "Aucun"
    PlayersData[id].job_grade = 0
    TriggerClientEvent("rF:JobRefresh", id, PlayersData[id].job, PlayersData[id].job_grade)
    TriggerClientEvent("rF:job", id, job) 
end

function ChangePlayerJobGrade(id, grade)
    PlayersData[id].job_grade = grade
    TriggerClientEvent("rF:JobRefresh", id, PlayersData[id].job, PlayersData[id].job_grade)
    TriggerClientEvent("rF:job", id, job)
end


function GetPlayerJob(id)
    return PlayersData[id].job, PlayersData[id].job_grade
end
