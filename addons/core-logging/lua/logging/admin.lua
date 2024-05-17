local log = logging.getfunc('https://discord.com/api/webhooks/1217901582239141918/03exOLLPSe3vLlFG3tQWtwrpRnzgaaqob8dqiYBrUaMblxRvHDondzFoShPa7EuJLKEj')

hook.Add('octoinv.search', 'dbm.logs', function(ply, victim)
    local vicName = logging.validate(victim)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Игрок:** %s\n❤️‍🩹 **Обыскивает:** %s",
            "fields": [],
            "title": "Новый лог обыска человека!",
            "color": 5029888,
            "footer": {
                "text": "#searched",
                "icon_url": "https://i.imgur.com/n0Y1zhp.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), vicName))
end)

hook.Add('octoinv.search-corpse', 'dbm.logs', function(ply, ent)
    local vicName = logging.validate(ent)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Игрок:** %s\n❤️‍🩹 **Обыскивает:** %s",
            "fields": [],
            "title": "Новый лог обыска трупа!",
            "color": 5029888,
            "footer": {
                "text": "#searched",
                "icon_url": "https://i.imgur.com/n0Y1zhp.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), vicName))
end)

hook.Add('octoinv.storageSpawned', 'dbm.logs', function(ply, ent)
    local vicName = logging.validate(ent)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Игрок:** %s\n❤️‍🩹 **Поставил:** %s",
            "fields": [],
            "title": "Новый лог спавна храна!",
            "color": 5029888,
            "footer": {
                "text": "#searched",
                "icon_url": "https://i.imgur.com/tS8XPTU.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), vicName))
end)

-- hook.Add('onLockpickCompleted', 'dbm.logs', function(ply, success, ent, vzlom)
--     local invName = logging.validate(ent)
--     local owner
--     if IsValid(ent) then
--         if ent.GetPlayerOwner then
--             owner = ent:GetPlayerOwner()
--             if IsValid(owner) then
--                 local pl = player.GetBySteamID(owner:SteamID())
--                 owner = IsValid(pl) and pl or owner
--             end
--         elseif ent.owner and IsValid(ent.owner) then
--             owner = ent.owner
--         elseif ent.steamID then
--             local ply = player.GetBySteamID(ent.steamID)
--             owner = IsValid(ply) and ply or ent.steamID
--         end
--     end

--     log(([[{
--         "content": "",
--         "tts": false,
--         "embeds": [
--             {
--             "description": "💀 **Взломщик:** %s %s %s \n📦 **Статус Взлома:** %s [%s]",
--             "fields": [],
--             "title": "Новый лог взлома!",
--             "color": 5029888,
--             "footer": {
--                 "text": "#lockpick/criminal",
--                 "icon_url": "https://i.imgur.com/7bY34dr.png"
--             }
--             }
--         ],
--         "components": [],
--         "actions": {}
--     }]]):format(ply:Name(), '', owner and '\'s ' or '', success and 'Взломал' or 'Не взломал', string.format(invName) ))
-- end)

hook.Add('dbg-karma.changed', 'dbm.logs', function(ply, new, old)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Игрок:** %s\n❤️‍🩹 **Карма:** %s",
            "fields": [],
            "title": "Новый лог добавление кармы!",
            "color": 5029888,
            "footer": {
                "text": "#karma",
                "icon_url": "https://i.imgur.com/x7l4ZKu.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), string.format(old .. ' ➞ ' .. new)))
end)

hook.Add('OnHandcuffed', 'dbm.logs', function(ply, victim, cuff)
    local vicName = logging.validate(victim)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Игрок:** %s\n❤️‍🩹 **Связал:** %s",
            "fields": [],
            "title": "Новый лог связывания!",
            "color": 5029888,
            "footer": {
                "text": "#cuffed",
                "icon_url": "https://i.imgur.com/Li1Czpa.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), vicName))
end)

hook.Add('OnHandcuffBreak', 'dbm.logs', function(ply, victim, cuff)
    local vicName = logging.validate(victim)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Игрок:** %s\n❤️‍🩹 **Развязал:** %s",
            "fields": [],
            "title": "Новый лог  развязывания!",
            "color": 5029888,
            "footer": {
                "text": "#cuffed",
                "icon_url": "https://i.imgur.com/Li1Czpa.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), vicName))
end)

