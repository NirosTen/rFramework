token = ""

-- Token Checker

function CheckToken(tokenToCheck, player)
    if tokenToCheck == token then
        return true
    else
        if framework._display_logs then
            print("[TOKEN] ^1Invalid token usage^7, player: ["..player.."] used token "..tokenToCheck.." instead of "..token.."^7")
        end
        return false
    end
end



-- Token generation and sending


local function SendTokenToClients()
    TriggerEvent("rF:SendToken", token) -- Server side 
    TriggerClientEvent("rF:SendToken", -1, token) -- Client side
end

local char = {"/","*","-","+","*","ù","%"}
local function GenerateToken()
	local res = ""
    for i = 1, 20 do
        if math.random(1,10) > 5 then
            res = res .. string.upper(string.char(math.random(97, 122))) .. math.random(1,20) .. char[math.random(1,#char)]
        else
            res = res .. string.char(math.random(97, 122)) .. math.random(1,20)
        end
	end
	return res
end


Citizen.CreateThread(function()
    while true do
        token = GenerateToken()
        SendTokenToClients()
        if framework._display_logs then
            print("[TOKEN] ^2New token generated - "..token.."^7")
        end
        Wait(5*60000) -- Generate new token every 5 min
    end
end)
