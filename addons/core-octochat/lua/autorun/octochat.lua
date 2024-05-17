octochat = octochat or {}

octolib.module('octochat')
octolib.client('octochat/cl_notifications')

octolib.module('octochat/commands')
local _, cmds = file.Find('config/octochat-commands/*', 'LUA')
for _, t in ipairs(cmds) do
	octolib.module('config/octochat-commands/' .. t)
end

if CLIENT then
	--[[
	addons/chat/lua/octochat/octochat_config.lua
	--]]
	octochat = octochat or {}

	octochat.ServerMask = Material("achat/circlemask.png")
	octochat.ServerIcon = Material("icon16/computer.png")
	--Don't touch this one above please, things break otherwise.

	--The overall colour of octochat (uncomment to enable, make sure only one is active at a time though!)
	--octochat.Color 					= Color(56, 162, 201) 	--Red
	--octochat.Color 					= Color(66, 139, 202, 255) 	--Blue
	--octochat.Color 					= Color(26, 188, 156, 255)	--Turquoise
	--octochat.Color 					= Color(92, 184, 92, 255)	--Green
	--octochat.Color 					= Color(91, 192, 222, 255)	--Light blue
	--octochat.Color 					= Color(228, 100, 75, 255)	--Orange
	octochat.Color = Color(102,170,170)

	--The default x and y positions of the chatbox on a player's screen (they can manually move it afterwards).
	octochat.DefaultPositions 			= {} 						--Don't touch this part
	octochat.DefaultPositions.X 		= ScrW()*3/4						--The x co-ordinate
	octochat.DefaultPositions.Y 		= ScrH()/2				--The y co-ordinate

	--The default width and height values of the chatbox (they can manually resize it afterwards).
	octochat.DefaultDimensions 		= {}						--Don't touch this part
	octochat.DefaultDimensions.Width	= ScrW()/4					--The width value
	octochat.DefaultDimensions.Height 	= ScrH()/2					--The height value

	--How long should messages stay on the screen when that chatbox isn't open before they fade out?
	--(Value is in seconds)
	octochat.RemainTime 			= 7

	--Whether or not to show timestamps on each chat message
	octochat.ShowTimestamps 		= true

	--Whether or not to show player connections/disconnections from the server
	octochat.ShowConnections		= false

	octochat.MaxLines = 500

	--All fonts used for the chatbox are listed below.
	--Default font is Open Sans, which is included in the workshop download.
	--Feel free to change them to what you want, but try to keep the font sizes the same.
	surface.CreateFont("octochat18", {
		font = "Arial",
		extended = true,
		size = 17,
		weight = 800
	})

	surface.CreateFont("octochat18Italic", {
		font = "Arial",
		extended = true,
		size = 16,
		weight = 300,
		italic = true
	})

	surface.CreateFont("octochat19", {
		font = "Roboto Bold",
		extended = true,
		size = 19,
		weight = 300
	})

	surface.CreateFont("octochat20", {
		font = "Roboto Bold",
		extended = true,
		size = 20,
		weight = 300
	})

end
