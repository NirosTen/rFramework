local img = "https://media.discordapp.net/attachments/717811885864517713/720626444740591746/271590_20200610135036_1.png?width=812&height=457"

local webhooks = {
    ["group"] = {w = "https://discordapp.com/api/webhooks/720711970927542352/IPMcncdsW_9sXA3ZGh5xQyLp_noinGoIYV0-e6VjI04SulVC6E5TJt-QvJl8Uy5Bbjfx"},
    ["staffmod"] = {w = "https://discordapp.com/api/webhooks/720719668477689948/rHo6qwCWyTI93Kp2Q4-eCnNEZlUO3RLTJi72098681sUWi4nXAXcaXH2-ZvtyPQT0I1e"},
    ["concess"] = {w = "https://discordapp.com/api/webhooks/721692134138183700/sDhbyGl5yGj57rJlRsSwZ-TvkeY-QUw6aIQbR_VgUpmK7J0OQ9MzkS5YzuEclNj3MB0F"},
    ["veh-vente"] = {w = "https://discordapp.com/api/webhooks/721695612533342323/7aIjqpV-4RHwqc2yXnGggVDIJcLxtY4bvXc7eUzAFgyFRcEYUnR31mApRHg86J377qwW"},
    ["identity"] = {w = "https://discordapp.com/api/webhooks/721717426416517172/0rR2ZFAe4o-XWDr8zJ2m91T_XB5lxigmUZgbkk6A1NkzJ8RuGNfzhaN2fWH5NfZD43N2"},
    ["items"] = {w = "https://discordapp.com/api/webhooks/721773930662330378/6fB4Bv2k7s4eADFGPh4ekQqNiNxr8DcjAJbL1IYXkrVr2uKNmJtLvSWbMzJhzV8Ejpyy"},
    ["money"] = {w = "https://discordapp.com/api/webhooks/721774048706691162/uSymGE9a2cm3242iz8dPM3QXmhLcfnMMkoebk_cAcb7_OZizK9bH2kQz3tZ96ZFPWDcj"},
    ["society"] = {w = "https://discordapp.com/api/webhooks/721777083876900905/pYj8g9QcAlma4D0aath0sf_tJWk7CJaJZ0i-0qyn4a96CWs7KEU319guxrvkPTjovDC6"},
    ["society-money"] = {w = "https://discordapp.com/api/webhooks/721778218671276112/VuPhzQd-KLv2Q_k2JXmUAyngIKO7uRJpRh9mSn07H90RJIMTZV1Si6TzF0_DEVGbhP7O"},
    ["give-staff"] = {w = "https://discordapp.com/api/webhooks/721810891447861268/QFmkS5_8to3LxDhdi7tJh2OAeNFym9nPNz4oPmL6H1UFX4f7ZXifJpYkt7ACCUkPcDnf"},
    ["veh"] = {w = "https://discordapp.com/api/webhooks/724182800059596810/5gM3VyomYbV3XrT4iZSl6r9LrrPA_8w31Gf8v-hGqvzk1lcrysljv7tzBAFr7tSI0np6"},
    ["gross-transaction"] = {w = "https://discordapp.com/api/webhooks/724714617493782598/du5_THZ9rPd56HGPphODscAw8F8VZCJTUC94yAvrmCoJYiToS3djKu1c1-YFuMdqJSE0"},
    ["connexion"] = {w = "https://discordapp.com/api/webhooks/724979332006805544/v00wmV_eGnSSMcpJLzzsLdUTQvIZPOKWRQ-FIpHrXCVI4gdd54EMr47tCC0V_UawvvlV"},
    ["transaction-louche"] = {w = "https://discordapp.com/api/webhooks/725296410286882877/GT4I8eGaVofIE0gyMbTFFhjeRF1dC-_TtLjo7Gz0Gnyv4z4Kuy3dnyTQowcR0YkUQHMP"},
    ["kill"] = {w = "https://discordapp.com/api/webhooks/725304441275940895/MbhHw-PrPJRKi52iT38ilT9C_NmoIgxTm63veFHT90bTV_UI08Cq0vcN90eYc4jIe2ZD"},
    ["superette"] = {w = "https://discordapp.com/api/webhooks/725638006823977002/f7yOjGKnpKELFTfy4fKa8Qsm3BuMNwE0F0g9qgvIK4HVcnXKHUsSx7FrXBA1S0WM9HUV"},
    ["facture"] = {w = "https://discordapp.com/api/webhooks/725670751830802533/qTdN3spzjg0rpRaoxGnQgxU0rlDOjpgIV1vtDTiBe0a_rIDqu9WFWWijy_Nkk2bgPTVp"},
}

function SendLog(msg, type)
    local webhook = webhooks[type].w

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = type, content = msg, avatar_url = img, tts = false}), { ['Content-Type'] = 'application/json' })
end

local DeathType = {
    [1] = {name = "mêlée"},
    [2] = {name = "tiré sur"},
    [3] = {name = "tranché"},
    [4] = {name = "renversé"},
    [5] = {name = "tué par un animal"},
    [6] = {name = "tué par dégats de chute"},
    [7] = {name = "tué par une explosion"},
    [8] = {name = "tué avec du fuel"},
    [9] = {name = "brulé"},
    [10] = {name = "noyé"},
    [11] = {name = "Inconnu"},
}


RegisterNetEvent("rF:LogPlayerDeath") 
AddEventHandler("rF:LogPlayerDeath", function(type, killerName, killerId)
    if type == 1 or type == 2 or type == 3 or type == 4 then
        SendLog("**["..killerId.."]** "..killerName.." "..DeathType[type].name.." **["..source.."]** "..GetPlayerName(source), "kill")
    else
        SendLog("**["..source.."]** "..GetPlayerName(source) .. " "..DeathType[type].name, "kill")
    end
end)