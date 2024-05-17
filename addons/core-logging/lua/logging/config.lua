local http
if pcall(require, 'chttp') and _G.CHTTP ~= nil then
    http = _G.CHTTP
else
    return print('Failed to Load Discord Logs module! Verify that you installed CHTTP Module!')
end

local table_to_json = util.TableToJSON

function logging.post(webhook, data)
    http({
        url = webhook,
        type = "application/json",
        method = 'POST',
        headers = {
            ['User-Agent'] = 'curl/7.54',
        },
        body = data,
    })
end

function logging.log(data)
    local _text = {
        embeds = {data}
    }
    post(table_to_json(_text))
end

function logging.validate(ent)
    if ent:IsValid() and ent:IsPlayer() then
        if ent:IsBot() then
            return ent:GetName(), 'NULL'
        end

        return ent:GetName(), ent:SteamID() or 'NULL'
    else
        return ent:GetClass(), 'NULL'
    end
end

function logging.profile(ply)
    local _, is = logging.validate(ply)
    if is == 'NULL' then return 'NULL' end

    return 'https://steamcommunity.com/id/' .. ply:SteamID64()
end

function logging.steamid(ply)
    local _, is = logging.validate(ply)
    if is == 'NULL' then return ("[%s]"):format('NULL') end

    local link = logging.profile(ply)
    return ("[[%s](%s)]"):format(ply:SteamID(), link)
end

function logging.getfunc(webhookID)
    return function(data)
        http({
            url = webhookID,
            type = "application/json",
            method = 'POST',
            headers = {
                ['User-Agent'] = 'curl/7.54',
            },
            body = data,
        })
    end
end

hook.Run('dbm.logsLoaded')

octolib.server('kills')
octolib.server('misc')
octolib.server('netlogger')
octolib.server('admin')
octolib.server('lockpick')