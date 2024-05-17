local log = logging.getfunc('https://discord.com/api/webhooks/1216838764924637234/hGpWcvoFAgrwVbJJL8zcw2VyxiKFhejbqA4zdpvXXd4ydTAqxlalWdzeoYtCtVzp4s4q')

hook.Add('PlayerDeath', 'dbm.logs', function(victim, _, attacker)
    local vicName, vicSteamID = logging.validate(victim)
    local attName, attSteamID = logging.validate(attacker)
    local wep = attSteamID ~= 'NULL' and attacker:GetActiveWeapon()
    local wepclass = IsValid(wep) and wep:GetClass() or '😂'
    local wepname = IsValid(wep) and wep.PrintName or '😂'
    log(([[{
        "content": "",
        "tts": false,
        "embeds": [
            {
            "description": "😈 **Убийца:** %s %s\n❤️‍🩹 **Жертва:** %s %s\n🔫 **Оружие:** %s [%s]",
            "fields": [],
            "title": "Новый лог!",
            "color": 11543074,
            "footer": {
                "text": "#kill #death",
                "icon_url": "https://i.imgur.com/6FmxDJf.png"
            }
            }
        ],
        "components": [],
        "actions": {}
    }]]):format(attName, logging.steamid(attacker), vicName, logging.steamid(victim), wepname, wepclass))
end)