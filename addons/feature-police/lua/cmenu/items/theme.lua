
local default = {
    b = Color(65,132,209, 255),
    y = Color(240,202,77, 255),
    r = Color(222,91,73, 255),
    g = Color(102,170,170, 255),
    o = Color(170,119,102, 255),

    bg = Color(85,68,85, 255),
}

local opts = {}
for id, data in ipairs(octogui.themes.presets) do
    opts[#opts+1] = {
        text = data.name,
        icon = octolib.icons.silk16('palette'),
        action = function()
            octolib.changeSkinColor(data.secondary, data.primary, 0.5)
        end,
    }
end

octogui.cmenu.registerItem('themes', 'theme', {
	text = 'Оформление',
	icon = octolib.icons.silk16('color_wheel'),
	options = opts,
})