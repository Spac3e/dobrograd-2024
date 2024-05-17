local log = logging.getfunc('https://discord.com/api/webhooks/1216843049129349240/ZFpDbylV5konsr8NRWZfiR23RJmUxmcdcgyFhIPhTeshKuePLpWShMgK2BpDcT8JXuMA')

hook.Add('PlayerInitialSpawn', 'dbm.logs', function(ply)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
          {
            "description": "### %s %s",
            "fields": [],
            "title": "Игрок подключился",
            "color": 10857215,
            "footer": {
              "text": "#connect"
            }
          }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), logging.steamid(ply)))
end)

hook.Add('PlayerDisconnected', 'dbm.logs', function(ply)
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
          {
            "description": "### %s %s",
            "fields": [],
            "title": "Игрок отключился",
            "color": 16754342,
            "footer": {
              "text": "#disconnect"
            }
          }
        ],
        "components": [],
        "actions": {}
    }]]):format(ply:Name(), logging.steamid(ply)))
end)