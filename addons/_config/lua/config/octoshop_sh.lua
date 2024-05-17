--
-- SALARY
--

octoshop.salaryAFKTime = 45 -- seconds
octoshop.salaryPeriod = 60 -- minutes

--
-- MISC FUNCTIONS
--

octoshop.openTopup = function(but, pnl)

	F4:Hide()
	gui.ActivateGameUI()
	octoesc.OpenURL('https://gm-donate.net/donate/17785')

end

local owners = {
	['STEAM_0:1:506925538'] = true, -- дезроу пупсчик
}

octoshop.checkOwner = function(ply)

	return owners[ply:SteamID()]

end
