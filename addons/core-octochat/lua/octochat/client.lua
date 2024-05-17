include("vgui/cl_circleavatar.lua")
include("vgui/cl_basepanel.lua")
include("vgui/cl_line.lua")

octochat = octochat or {}

hook.Add('HUDShouldDraw', 'octochat', function(name)
    if name == 'CHudChat' then return false end
end)

hook.Add("PlayerBindPress", "octochatBindPress", function(ply, bind, pressed)
    if ply == LocalPlayer() then
        if bind == "messagemode" and pressed then
            if not IsValid(octochat.pnl) then
                octochat.pnl = vgui.Create("octochatBase")
            end
            octochat.pnl:ChatShow()
            octochat.pnl.TeamBased = false
            return true
        elseif bind == "messagemode2" and pressed then
            if not IsValid(octochat.pnl) then
                octochat.pnl = vgui.Create("octochatBase")
            end
            octochat.pnl:ChatShow()
            octochat.pnl.TextEntry:SetText('/r ')
            octochat.pnl.TextEntry:SetCaretPos(3)
            octochat.pnl.TeamBased = true
            return true
        end
    end
end)

hook.Add('StartCommand', 'octochat', function(ply, cmd)
	if cmd:KeyDown(IN_ATTACK) and input.IsKeyDown(KEY_ENTER) then
		cmd:RemoveKey(IN_ATTACK)
	end
end)

hook.Add('InitPostEntity', 'octochat.noVoice', function()
	if IsValid(g_VoicePanelList) then
		g_VoicePanelList:Remove()
	end
end)

function octochat.create()
    if not octochat.pnl then
        octochat.pnl = vgui.Create("octochatBase")
        octochat.pnl:ChatHide()
    end
end

function octochat.validate()
    if not IsValid(octochat.pnl) then octochat.create() end
end

function chat.AddText(...)
    --octochat.AddChat(...)
    octochat.validate()
    octochat.pnl:AddNewLine({...})
end

octochat.AddChat = octochat.AddChat or chat.AddText
octochat.msg = chat.AddText

chat.AddNonParsedText = chat.AddText

function chat.GetChatBoxPos()
    octochat.validate()
    return octochat.pnl:GetPos()
end

function chat.GetChatBoxSize()
    octochat.validate()
    return octochat.pnl:GetSize()
end

local ply = FindMetaTable 'Player'
function ply:ChatPrint(str)
	chat.AddText(str)
end

hook.Add("OnPlayerChat", "octochatHandle", function(ply, msg, team, dead, prefixText, col1, col2)
    if octochat.pnl then
        if IsValid(ply) and ply:IsPlayer() then ply:DoVoice(msg) end
        if string.find(string.lower(GAMEMODE.FolderName), "rp") then
            if prefixText then
                prefixText = prefixText .. ": "
                prefixText = string.Replace(prefixText, ply:Nick() .. ": ", "")
                chat.AddText(ply, col1, prefixText, col2, msg)
            else --Most likely a server 'say' message
                chat.AddText(Color(143, 218, 230), msg)
            end
            return true
        else
            local tab = {}

            if (dead) then
                table.insert(tab, Color(255, 30, 40))
                table.insert(tab, "*МЕРТВ* ")
            end

            if (team) then
                table.insert(tab, Color(30, 160, 40))
                table.insert(tab, "(ГРУППА) ")
            end

            if (IsValid(ply)) then
                table.insert(tab, ply)
            end

            table.insert(tab, Color(255, 255, 255))
            table.insert(tab, msg)

            chat.AddText(unpack(tab))
            return true
        end
    end
end)

netstream.Hook('octochat.addEntry', chat.AddText)

netstream.Hook('chat', function(txt)
    chat.AddText(txt)
end)

function octochat.say(text)
    netstream.Start("chat", text)
end

hook.Add('StartChat', 'crim-compat', function(t)

	netstream.Start('isTyping', true)

end)

hook.Add('FinishChat', 'crim-compat', function()

	netstream.Start('isTyping', false)

end)