local img = "https://media.discordapp.net/attachments/717811885864517713/720626444740591746/271590_20200610135036_1.png?width=812&height=457"

local webhooks = {
    ["group"] = {w = "https://discordapp.com/api/webhooks/720711970927542352/IPMcncdsW_9sXA3ZGh5xQyLp_noinGoIYV0-e6VjI04SulVC6E5TJt-QvJl8Uy5Bbjfx"},
    ["staffmod"] = {w = "https://discordapp.com/api/webhooks/720719668477689948/rHo6qwCWyTI93Kp2Q4-eCnNEZlUO3RLTJi72098681sUWi4nXAXcaXH2-ZvtyPQT0I1e"},
}

function SendLog(msg, type)
    local webhook = webhooks[type].w

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = type, content = msg, avatar_url = img, tts = false}), { ['Content-Type'] = 'application/json' })
end