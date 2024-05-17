local t = {}
function t:Init()
    self:SetPos(octochat.DefaultPositions.X, octochat.DefaultPositions.Y)
    self:SetSize(octochat.DefaultDimensions.Width, octochat.DefaultDimensions.Height)
    self:MakePopup()
    self:SetTitle("")
    self:SetSizable(true)
    self:DockPadding(5, 0, 5, 5)
    self.Displayed = true
    self:SetDeleteOnClose(false)
    self.Alpha = 255
    local e = file.Read("dbg_chat.dat", "DATA")
    e = e and pon.decode(e)
    self.settingsTbl = {showNew = e and e.showNew or 7, colMsg = e and e.colMsg or Color(0, 0, 0, 200)}
    self.btnClose.DoClick = function()
        self:ChatHide()
    end
    self.btnSettings = self:Add "DButton"
    self.btnSettings:SetText("")
    self.btnSettings:SetSize(24, 24)
    self.btnSettings.DoClick = function()
        self:OpenSettings()
    end
    self.inited = true
    function self.btnSettings:Paint(t, e)
        if self.Disabled then
            return
        end
        if self.Depressed then
            draw.RoundedBox(8, t / 2 - 8, e / 2 - 7, 16, 16, Color(170, 119, 102))
            if self.Hovered then
                draw.SimpleText(
                    utf8.char(61459),
                    "dbg-icons2",
                    t / 2,
                    e / 2 + 1,
                    Color(0, 0, 0, 120),
                    TEXT_ALIGN_CENTER,
                    TEXT_ALIGN_CENTER
                )
            end
        else
            draw.RoundedBox(8, t / 2 - 8, e / 2 - 7, 16, 16, Color(127, 89, 76))
            draw.RoundedBox(8, t / 2 - 8, e / 2 - 8, 16, 16, Color(170, 119, 102))
            if self.Hovered then
                draw.SimpleText(
                    utf8.char(61459),
                    "dbg-icons2",
                    t / 2,
                    e / 2,
                    Color(0, 0, 0, 120),
                    TEXT_ALIGN_CENTER,
                    TEXT_ALIGN_CENTER
                )
            end
        end
    end
    self.ScrollPanel = vgui.Create("DScrollPanel", self)
    self.ScrollPanel:SetSize(self:GetWide() - 5, self:GetTall() - 55)
    self.ScrollPanel:SetPos(0, 24)
    self.ScrollPanel:SetPaintBackgroundEnabled(false)
    local e = self.ScrollPanel:GetVBar()
    e.PerformLayout = function()
        local t = e:GetWide()
        local n = e:GetScroll() / e.CanvasSize
        local a = math.max(e:BarScale() * e:GetTall(), 10)
        local l = e:GetTall() - a
        l = l + 1
        n = n * l
        e:SetWide(10)
        e.btnGrip:SetPos(0, n)
        e.btnGrip:SetSize(t, a)
        e.btnUp:SetPos(0, 0, t, t)
        e.btnUp:SetSize(t, 0)
        e.btnDown:SetPos(0, e:GetTall(), t, t)
        e.btnDown:SetSize(t, 0)
    end
    self.TextEntry = vgui.Create("DTextEntry", self)
    self.TextEntry:SetSize(self:GetWide() - 55, 22)
    self.TextEntry:SetPos(5, self:GetTall() - 26)
    self.TextEntry:SetPaintBackgroundEnabled(true)
    self.TextEntry:SetCursorColor(Color(200, 200, 200, 255))
    self.TextEntry:SetTextColor(Color(200, 200, 200, 255))
    self.TextEntry:SetHighlightColor(octochat.Color)
    self.TextEntry:SetHistoryEnabled(true)
    self.TextEntry:SetDrawLanguageID(false)
    self.TextEntry.OnEnter = function()
        if self.TextEntry.selAC then
            local e = self.TextEntry.selAC
            self.TextEntry:SetText(e)
            self.TextEntry:SetCaretPos(utf8.len(e))
            self.TextEntry:OnTextChanged()
            self.TextEntry:RequestFocus()
        else
            self:Chat()
        end
    end
    self.TextEntry.PerformLayout = function()
        self.TextEntry:SetFontInternal("octochat18")
        self.TextEntry:SetBGColor(Color(46, 39, 46, 255))
    end
    self.TextEntry.OnTextChanged = function(e, t)
        e.HistoryPos = 0
        local l = e:GetText()
        gamemode.Call("ChatTextChanged", l)
        e:OnValueChange(l)
        if IsValid(e.Menu) and not t then
            e.Menu:Remove()
        end
        e:OnChange()
        local t = string.Explode(" ", l)
        if not t and #t == 0 then
            return
        end
        local n = {}
        local a = t[1]:sub(1, 1)
        local cmd = t[1]:lower()
		local fl = cmd:sub(1,1)
        if #t == 1 then
            if a == "!" or a == "~" then
                local e = serverguard.ranks:GetRank(serverguard.player:GetRank(LocalPlayer()))
                local e = serverguard.command:GetTable()
                for l, e in pairs(e) do
                    if (e.command and (not e.permissions or serverguard.player:HasPermission(LocalPlayer(), e.permissions))) and e.command:lower():find(t[1]:sub(2):lower(), 1, true) then
                        table.insert(n, a .. e.command .. " ")
                    end
                end
            elseif a == "/" then
                for l, e in pairs(octochat.commands) do
					if string.StartWith(l, cmd) and octochat.canExecuteCommand(LocalPlayer(), l, {}, '') then
						n[#n + 1] = l .. " "
					end
				end
            end
        end
        if #n < 1 then
            local e = t[#t]
            if e == "" then
                return
            end
            for a, t in ipairs(player.GetAll()) do
                local t = t:Name()
                if utf8.lower(t):find(utf8.lower(e), 1, true) then
                    --table.insert(n, l:sub(1, l:len() - e:len()) .. t .. " ")
                    table.insert(n, l:sub(1, l:len() - e:len()) .. '"' .. t .. '" ')
                end
            end
        end
        if #n > 0 then
            e.Menu = DermaMenu(e)
            for n, t in pairs(n) do
                e.Menu:AddOption(
                    t,
                    function()
                        e:SetText(t)
                        e:SetCaretPos(utf8.len(t))
                        e:RequestFocus()
                    end
                )
            end
            local t, n = e:LocalToScreen(0, 0)
            e.Menu:SetMinimumWidth(e:GetWide())
            e.Menu:Open(t, n - e.Menu:GetTall(), true, e)
            e.Menu:SetMaxHeight(self:GetTall())
            e.Menu:SetPos(t, n - math.min(e.Menu:GetTall(), self:GetTall()))
            e.Menu.OnRemove = function(t)
                e.selAC = nil
            end
        end
    end
    self.TextEntry.UpdateFromMenu = function(e)
        local t = e.HistoryPos
        local n = e.Menu:ChildCount()
        e.Menu:ClearHighlights()
        if (t < 0) then
            t = n
        end
        if (t > n) then
            t = 0
        end
        local n = e.Menu:GetChild(t)
        if not n then
            e:SetText("")
            e.HistoryPos = t
            return
        end
        e.Menu:HighlightItem(n)
        local n = n:GetText()
        e.selAC = n
        e.HistoryPos = t
    end
    self.TextEntry:RequestFocus()
    self.TextActivate = vgui.Create("DButton", self)
    self.TextActivate:SetSize(30, 22)
    self.TextActivate:SetPos(self:GetWide() - 35, self:GetTall() - 26)
    self.TextActivate:SetText("ОК")
    self.TextActivate.DoClick = function()
        self:Chat()
    end
end
function t:Think()
    self.BaseClass.Think(self)
    if not self.Displayed then
        self:MoveToBack()
    else
        if input.IsKeyDown(KEY_ESCAPE) or gui.IsGameUIVisible() then
            gui.HideGameUI()
            self:ChatHide()
        end
        if input.IsKeyDown(KEY_TAB) and self.TextEntry:HasFocus() then
            self.TextEntry:RequestFocus()
        end
    end
end
function t:PerformLayout()
    self.BaseClass.PerformLayout(self)
    if not self.inited then return end
    self.btnSettings:SetPos(self:GetWide() - 52, 0)
    self.TextEntry:SetSize(self:GetWide() - 55, 22)
    self.TextEntry:SetPos(5, self:GetTall() - 26)
    self.TextActivate:SetSize(40, 22)
    self.TextActivate:SetPos(self:GetWide() - 45, self:GetTall() - 26)
    self.ScrollPanel:SetSize(self:GetWide() - 5, self:GetTall() - 55)
    self.ScrollPanel:SetPos(0, 24)
end
function t:Paint(e, t)
    if self.Alpha > 0 then
        draw.RoundedBox(4, 0, 0, e, t, Color(85, 68, 85, 241))
        draw.RoundedBoxEx(4, 0, 0, e, 24, Color(0, 0, 0, 80), true, true, false, false)
        draw.SimpleText("Чат сервера", "DermaDefault", 8, 11, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end
function t:AddNewLine(...)
    local n =
        not self.Displayed or self.ScrollPanel.VBar.CanvasSize == 1 or
        self.ScrollPanel.VBar.CanvasSize == -self.ScrollPanel.VBar:GetOffset()
    local msgPanel = vgui.Create("octochatLine", self.ScrollPanel)
    msgPanel:HandleSetup(...) -- Присваиваем штучки панели сообщения

    local lastY = self.ScrollPanel.pnlCanvas:GetTall()
    local l, msgPanelHeight = msgPanel:GetSize()

    shit = lastY + msgPanelHeight * .5
    otherShit = shit - self.ScrollPanel:GetTall() * .5
    if octochat.pnl.ScrollPanel.pnlCanvas:ChildCount() > octochat.MaxLines then
        octochat.pnl.ScrollPanel.pnlCanvas:GetChild(0):Remove()
    end
    if n then
        self.ScrollPanel.VBar:AnimateTo(otherShit, .5, 0, .5)
    end
end
function t:Chat()
    if #self.TextEntry:GetValue() == 0 then
        self:ChatHide()
        return
    end
    local e = self.TextEntry:GetValue()
    netstream.Start("chat", e, self.TeamBased)
    self.TextEntry:AddHistory(e)
    self.TextEntry:SetText("")
    self.TextEntry:RequestFocus()
    self:ChatHide()
end
function t:ChatHide()
    self.Displayed = false
    self:ApplyAlpha()
    self:SetMouseInputEnabled(false)
    self:SetKeyboardInputEnabled(false)
    gamemode.Call("FinishChat")
    gamemode.Call("ChatTextChanged", "")
end
function t:ChatShow()
    self.Displayed = true
    self:ApplyAlpha()
    self:SetMouseInputEnabled(true)
    self:SetKeyboardInputEnabled(true)
    self.TextEntry:RequestFocus()
    gamemode.Call("StartChat")
end
function t:ApplyAlpha()
    if self.Displayed == true then
        self.Alpha = 255
    else
        self.Alpha = 0
        if IsValid(self.TextEntry.Menu) then
            self.TextEntry.Menu:Remove()
        end
    end
    self.btnClose:SetAlpha(self.Alpha)
    self.btnSettings:SetAlpha(self.Alpha)
    self.ScrollPanel.VBar:SetAlpha(self.Alpha)
    self.TextEntry:SetAlpha(self.Alpha)
    self.TextActivate:SetAlpha(self.Alpha)
end
function t:OpenSettings()
    if IsValid(self.settings) then
        self.settings:Remove()
    end
    local e = vgui.Create "DFrame"
    self.settings = e
    e:SetSize(350, 500)
    e:SetTitle("Настройки чата")
    e:Center()
    local n = e:Add "DPanel"
    n:Dock(TOP)
    n:SetTall(133)
    n:DockPadding(3, 3, 3, 3)
    local t = n:Add "DLabel"
    t:Dock(TOP)
    t:DockMargin(5, 0, 5, 3)
    t:SetFont("f4.normal")
    t:SetText("Фон сообщений")
    t:SetTall(30)
    local t = n:Add "DColorMixer"
    t:Dock(FILL)
    t:SetAlphaBar(true)
    t:SetWangs(true)
    t:SetPalette(false)
    t:SetColor(self.settingsTbl.colMsg)
    t.ValueChanged = function(t, e)
        self.settingsTbl.colMsg = e
    end
    local n = e:Add "DPanel"
    n:Dock(FILL)
    n:DockPadding(3, 3, 3, 3)
    n:DockMargin(0, 5, 0, 0)
    local t = n:Add "DLabel"
    t:Dock(TOP)
    t:DockMargin(5, 0, 5, 3)
    t:SetFont("f4.normal")
    t:SetText("Другие настройки")
    t:SetTall(30)
    local t = n:Add "DNumSlider"
    t:Dock(TOP)
    t:DockMargin(8, 0, 0, 0)
    t:SetText("Время отображения (сек)")
    t:SetTall(15)
    t:SetMinMax(2, 60)
    t:SetValue(self.settingsTbl.showNew)
    t.OnValueChanged = function(n, t)
        self.settingsTbl.showNew = math.Clamp(t, 2, 60)
    end
    e.OnClose = function()
        file.Write("dbg_chat.dat", pon.encode(self.settingsTbl))
    end
end
vgui.Register("octochatBase", t, "DFrame")
if IsValid(octochat.pnl) then octochat.pnl:Remove() end