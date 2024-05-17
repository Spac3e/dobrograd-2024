--[[
addons/chat/lua/octochat/vgui/cl_line.lua
--]]
local PANEL = {}

function PANEL:Init()
	self.Name 				= ""
	self.Ply 				= nil
	self.Col 				= nil
	self.ShouldCountDown 	= false
	self.TimeUp 			= false
	self.Time 				= os.date("%X", os.time())
	self.FadeOutTime 		= math.ceil(os.time()) + octochat.pnl.settingsTbl.showNew
	self.IsServerMessage	= false

	self:SetSize(self:GetParent():GetWide(), 10)
	self:Dock(TOP)
	self:DockMargin(5, 3, 5, 0)
	self:DockPadding(0, 5, 0, 5)
	--self:LerpPositions( 1, true)

	self.Ava = vgui.Create("AvatarCircleMask", self)
	self.Ava:SetSize(16, 16)
	self.Ava:SetPos(10, 8)
	self.Ava:SetMaskSize(32 / 2)

	self.Txt = vgui.Create("RichText", self)
	self.Txt:SetPos(8, 25)
	self.Txt:SetWide(self:GetParent():GetWide() - 39)
	self.Txt:InsertColorChange(215, 215, 215, 255)
	-- self.Txt.OnMouseWheeled = function(self, delta)
	-- 	octochat.pnl.ScrollPanel:OnMouseWheeled(delta)
	-- end
end

function PANEL:Paint(w, h)
	if octochat.pnl.Alpha == 0 then
		draw.RoundedBox(4, 0, 0, w, h, octochat.pnl.settingsTbl.colMsg)
	end

	draw.SimpleText(self.Name, "octochat19", 30, 7, self.NameCol, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	local tw, th = surface.GetTextSize(self.Name)
	if octochat.ShowTimestamps then
		draw.SimpleText("в " .. self.Time, "octochat18Italic", (self.IsServerMessage and 30 or 35) + tw, 8, Color(180, 180, 180, 200), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	end

	if self.IsServerMessage then
		surface.SetMaterial(octochat.ServerIcon)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(10, 8, 16, 16)
	end


end

function PANEL:PerformLayout()
	self.Txt:SetFontInternal("octochat18")
	self.Txt:SetVerticalScrollbarEnabled(false)
	self.Txt:SetToFullHeight()
	self.Txt:SetWide(self:GetParent():GetWide() - 64)
	self:SizeToChildren(false, true)

	self:InvalidateParent()
end

function PANEL:Think()
	if octochat.pnl.Displayed then
		self.ShouldCountDown = false
	else
		self.ShouldCountDown = true
	end

	if self.ShouldCountDown then
		if self.TimeUp then
			self:SetAlpha(0)
			return
		end

		if self.FadeOutTime < math.ceil(os.time()) then
			self:AlphaTo(0, 0.5)
			timer.Simple(1.5, function()
				self.TimeUp = true
			end)
		end
	else
		self:SetAlpha(255)
	end
end

function PANEL:HandleSetup(info)
	for k, v in ipairs(info) do
		if type(v) == "Player" then
			self.Ava:SetPlayer(v, 32)
			self.Ply = v
			self.Name = v:Nick()
			self.NameCol = Color(240,202,77)
			self.Col = team.GetColor(self.Ply:Team())
		elseif type(v) == "string" then
			self.Txt:AppendText(v)
		elseif type(v) == "table" then -- hack
			if v.r then
				self.Txt:InsertColorChange(v.r, v.g, v.b, 255)
			elseif v[1] then
				self.Txt:AppendText(v[1])
			end
		end

	end

	if not self.Ply then
		self.IsServerMessage = true
		self.Name = ""
		self.NameCol = Color(255,255,255)
		self.Col = Color(210, 210, 210)
		self.Ava:Remove()
		self:InvalidateLayout()
	end
end

function PANEL:OnMouseWheeled(delta)
	octochat.pnl.ScrollPanel:OnMouseWheeled(delta)
end

vgui.Register("octochatLine", PANEL, "DPanel")


