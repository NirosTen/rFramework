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
}

function SendLog(msg, type)
    local webhook = webhooks[type].w

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = type, content = msg, avatar_url = img, tts = false}), { ['Content-Type'] = 'application/json' })
end