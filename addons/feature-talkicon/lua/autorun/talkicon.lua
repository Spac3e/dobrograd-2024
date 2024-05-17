
CreateConVar('talkicon_computablecolor', 1, FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_SERVER_CAN_EXECUTE, 'Compute color from location brightness.')
CreateConVar('talkicon_showtextchat', 1, FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_SERVER_CAN_EXECUTE, 'Show icon on using text chat.')
CreateConVar('talkicon_ignoreteamchat', 1, FCVAR_ARCHIVE + FCVAR_REPLICATED + FCVAR_SERVER_CAN_EXECUTE, 'Disable over-head icon on using team chat.')

local rangeColors = {
	[2250000] = {0.5, 0.5, 1, 8},
	[150000] = {1, 0.7, 0.4, 4},
	[500000] = {1, 0.4, 0.4, 6},
	[10000] = {0.5, 0.5, 1, 3},
}

if (SERVER) then

	RunConsoleCommand('mp_show_voice_icons', '0')

	util.AddNetworkString('TalkIconChat')

	-- net.Receive('TalkIconChat', function(_, ply)
	-- 	local bool = net.ReadBool()
	-- 	ply:SetNW2Bool('ti_istyping', (bool ~= nil) and bool or false)
	-- end)

elseif (CLIENT) then

	local computecolor = GetConVar('talkicon_computablecolor')
	local showtextchat = GetConVar('talkicon_showtextchat')
	local noteamchat = GetConVar('talkicon_ignoreteamchat')

	local voice_mat = Material('talkicon/voice.png')
	local text_mat = Material('talkicon/text.png')

	hook.Add('PostPlayerDraw', 'TalkIcon', function(ply)
		if ply == LocalPlayer() and GetViewEntity() == LocalPlayer() then return end
		if not ply:Alive() then return end
		if not ply:IsSpeaking() and not (showtextchat:GetBool() and ply:IsTyping()) then return end

		local pos = ply:GetPos() + Vector(0, 0, ply:GetModelRadius() + 7)

		local attachment = ply:GetAttachment(ply:LookupAttachment('eyes'))
		if attachment then
			pos = ply:GetAttachment(ply:LookupAttachment('eyes')).Pos + Vector(0, 0, 7)
		end


		local color_var = 255

		if computecolor:GetBool() then
			local computed_color = render.ComputeLighting(ply:GetPos(), Vector(0, 0, 1))
			local max = math.max(computed_color.x, computed_color.y, computed_color.z)
			color_var = math.Clamp(max * 255 * 1.11, 0, 255)
		end

		if ply:IsSpeaking() then
			local data = rangeColors[ply:GetNetVar('TalkRange', 0)] or rangeColors[150000]
			render.SetMaterial(voice_mat)
			local size = data[4] + ply:VoiceVolume() * 2
			render.DrawSprite(pos, size, size, Color(color_var * data[1], color_var * data[2], color_var * data[3], 150))
		else
			render.SetMaterial(text_mat)
			render.DrawSprite(pos, 4, 4, Color(color_var, color_var * 0.7, color_var * 0.4, 150))
		end
	end)

	hook.Add('StartChat', 'TalkIcon', function(isteam)
		if isteam and noteamchat:GetBool() then return end
		net.Start('TalkIconChat')
			net.WriteBool(true)
		net.SendToServer()
	end)

	hook.Add('FinishChat', 'TalkIcon', function()
		net.Start('TalkIconChat')
			net.WriteBool(false)
		net.SendToServer()
	end)

	hook.Add("InitPostEntity", "RemoveChatBubble", function()
		hook.Remove("StartChat", "StartChatIndicator")
		hook.Remove("FinishChat", "EndChatIndicator")
	end)

end