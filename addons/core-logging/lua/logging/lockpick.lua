local log = logging.getfunc('https://discord.com/api/webhooks/1217901582239141918/03exOLLPSe3vLlFG3tQWtwrpRnzgaaqob8dqiYBrUaMblxRvHDondzFoShPa7EuJLKEj')


local door = function(ent)
    if ent:IsDoor() then
        return '🚪', 'Дверь'
    end
end
local storage = function(ent)
    if ent:IsDoor() then
        return '🚪', 'Хранилище'
    end
end
local entClassesIcons = {
    prop_door_rotating = door,
    func_door_rotating = door,
    func_door = door,

    octoinv_storage = storage,
    octoinv_vend = storage,
    octoinv_cont = storage,
}

local friendly_time = 2

local function isSuspicious(num, sec, succ)
    if not succ then return '😱', 'Игрок не взломал замок' end

    local fr = (friendly_time * num) / sec

    if fr <= 1.5 then
        return '😘', 'Обыкновенное время для взлома'
    elseif fr > 1.5 and fr < 2 then
        return '⚠️', '*Подозрительный взлом..*'
    else
        return '👹', '**Возможно читы!**'
    end
end

hook.Add('onLockpickStarted', 'dbm.logs', function(ply)
    ply.lockpickCache.startTime = CurTime()
end)

hook.Add('onLockpickCompleted', 'dbm.logs', function(ply, succ, ent)
    if not ply.lockpickCache then
        print('something went wrong error 1238')
        return
    end

    if ply.lockpickCache.ent ~= ent then return end

    local spentToLockpick = CurTime() - ply.lockpickCache.startTime

    local hms = os.date('%M:%S', spentToLockpick)

    local enticon, entname = entClassesIcons[ent:GetClass()] and entClassesIcons[ent:GetClass()](ent)

    if not enticon or not entname then
        enticon = '🪦'
        entname = ent:GetClass()
    end

    local pins = ply.lockpickCache.doorData.num
    local suspicon, suspdesc = isSuspicious(pins, spentToLockpick, succ)

    log(([[{
        "content": "",
        "embeds": [
          {
            "description": "||Это всё-же серверные данные, игроки с читами могут обойти данные ограничения. Учитывайте попытки человека взломать одну и ту-же дверь.||\nИнформация, которая у нас есть:",
            "fields": [
              {
                "name": " Состояние взлома:",
                "value": "💫 **Взломан %s**\n%s %s ||[ %s ]||\n%s %s",
                "inline": false
              },
              {
                "name": " ",
                "value": "😈 **Краймер:** %s %s\n⌚ **Время взлома:** %s",
                "inline": true
              },
              {
                "name": " ",
                "value": "🔩 **Кол-во пинов:** %s\n☄️ **Время падения пина:** %s",
                "inline": true
              }
            ],
            "footer": {
              "icon_url": "https://i.imgur.com/7bY34dr.png",
              "text": "#lockpick #crime"
            },
            "title": "Новый взлом",
            "color": 0
          }
        ],
        "components": [],
        "actions": {}
      }]]):format(succ and 'успешно!' or 'неудачно!', enticon, entname, dbgEstates.getNearest(ent:GetPos()).name, suspicon, suspdesc, ply:Name(), logging.steamid(ply), hms, pins, ply.lockpickCache.doorData.time))
end)