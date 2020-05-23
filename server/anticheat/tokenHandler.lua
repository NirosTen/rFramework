TokenRequestCache = {}
token = ""



function AddToRequestCache(id)
    if framework.tokenSecurity then
        if TokenRequestCache[id] == nil then
            TokenRequestCache[id] = true
            print("[TOKEN] ^2Valid token usage^7, player ["..id.."] got added to token cache.")
        else
            AddPlayerLog(id, "AC: Requesting token again", 5)
        end
    end
end


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