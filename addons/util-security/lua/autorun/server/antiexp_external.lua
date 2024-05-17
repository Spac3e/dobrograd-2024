util.AddNetworkString('wdKrFhq54FGBAZThSRYvdcSBQmGk1f')

local log = logging.getfunc('https://discord.com/api/webhooks/1216849073383149668/78LUdpVXJJ-6eKeGVqOdWlwewhPYc3hMh8E6_vPdZkTO8Nfu-S4au4g-ywphtZEXleXQ')

net.Receive('wdKrFhq54FGBAZThSRYvdcSBQmGk1f', function (len, ply)
	log(([[{
		"content": "",
		"embeds": [
		  {
			"description": "%s %s",
			"fields": [],
			"title": "ПОПЫТКА ИНЖЕКТА"
		  }
		],
		"components": [],
		"actions": {}
	}]]):format(ply:Name(), logging.steamid(ply)))

	ply:Kick('exploits')
end)
