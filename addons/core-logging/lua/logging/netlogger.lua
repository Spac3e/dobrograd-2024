--local netloggerCache = '' -- TODO
local netloggerPattern = '[%s] %s[%s] -> %s (%s) -> %s\n'
local netlogText = ''

file.CreateDir('netlogs')

local loggerFile = 'netlogs/netlog' .. os.date('_%d_%m_%Y' , os.time()) .. '.txt'
if not file.Exists(loggerFile, 'DATA') then
    file.Write(loggerFile, '')
end

local ignoreNets = {
    NetStreamDS = true,
    NetStreamHeavy = true,
    simfphys_blockcontrols = true,
    ['DLib.getinfo.replicate'] = true,
    isTyping = true,
    TalkIconColor = true,
    ['chat'] = true,
    ['dbg-flyover.requestPos'] = true,
    ['IGS.nw.PlayerSync'] = true,
    ['DarkRP_preferredjobmodels'] = true,
    ['ServerGuardDS'] = true,
    ['dlib.clientlang'] = true,
    ['gAC.PlayerInit'] = true,
    ['DLib.friendstatus'] = true,
    ['WireLib.SyncBinds'] = true,
    ['car.steer'] = true,
}

local util_tabletojson = util.TableToJSON

local function log(client, netname, net_type, varargs)
    if ignoreNets[netname] then return end
    if not IsValid(client) then return end

    local currentHMS = os.date('%H:%M:%S' , os.time())

    if varargs then
        for _, value in ipairs(varargs) do
            if istable(value) then value = util_tabletojson(value) end
        end
    end

    local text = netloggerPattern:format(
        currentHMS, client:Name(), client:SteamID(), netname, net_type, varargs and unpack(varargs) or ''
    )
    file.Append(loggerFile, text)
end

function netstream.Hook(name, waited_callback)
    local function callback(...)
        local args = {...}
        local pl = args[1]

        --antispam
        if not ignoreNets[name] then
            pl.netCounter = pl.netCounter or 0
            if pl.netCounter >= 150 then
                pl:Kick(('Net Spam (%s)'):format(name))
                return
            end
            pl.netCounter = pl.netCounter + 1
            timer.Simple(1, function()
                if IsValid(pl) then
                    pl.netCounter = math.Clamp((pl.netCounter or 1), 0, 1000) - 1
                end
            end)
        end
        --

        table.remove(args, 1)

        log(pl, name, 'netstream', args) -- log here

        waited_callback(...)
    end

    local shouldRewrite = name:find('nsr-') and false or true

    netstream.stored[name] = shouldRewrite and callback or waited_callback
end

function netstream.Request(ply, name, ...)
	local args = {...}
	return util.Promise(function(res, rej)
		local reqID = netstream.nextReqID
		netstream.nextReqID = netstream.nextReqID + 1

		local msgName = 'nsr-' .. reqID
		netstream.Hook(msgName, function(_, data)
			netstream.Hook(msgName, nil)

            log(ply, name, 'netstream-request', {data}) -- log here
			res(data)
		end)
		netstream.Start(ply, 'nsr', name, reqID, unpack(args))

		timer.Create(msgName, netstream.requestTimeout, 1, function()
			rej('timeout')
			timer.Remove(msgName)
		end)
	end)
end



function net.Incoming( len, client )
	local i = net.ReadHeader()
	local strName = util.NetworkIDToString( i )
	if ( !strName ) then return end

	local func = net.Receivers[ strName:lower() ]
	if ( !func ) then return end

    if not ignoreNets[strName] then
        client.netCounter = client.netCounter or 0
        if client.netCounter >= 50 then
            client:Kick(('Net Spam (%s)'):format(strName))
            return
        end
        client.netCounter = client.netCounter + 1
        timer.Simple(1, function()
            if IsValid(client) then
                client.netCounter = math.Clamp((client.netCounter or 1), 0, 1000) - 1
            end
        end)
    end

	len = len - 16

    log(client, strName, 'net') -- log here

	func( len, client )
end