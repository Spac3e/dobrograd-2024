--[[
addons/chat/lua/octochat/vgui/cl_circleavatar.lua
--]]
--I think Handsome Matt made this one so credit to him - http://pastebin.com/FVEKbxM9

local cos, sin, rad = math.cos, math.sin, math.rad
local PANEL = {}

AccessorFunc( PANEL, "m_masksize", "MaskSize", FORCE_NUMBER )

function PANEL:Init()
    -- self.Avatar = vgui.Create("AvatarImage", self)
    -- self.Avatar:SetPaintedManually(true)
    -- self:SetMaskSize( 24 )

    self.Button = self:Add 'DButton'
    self.Button:SetText('')
    self.Button.Paint = function() end

    self.icon = Material('icon16/computer.png')
end

function PANEL:PerformLayout()
    -- self.Avatar:SetSize(self:GetWide(), self:GetTall())
end

function PANEL:SetPlayer( ply )
    -- self.Avatar:SetPlayer( ply, self:GetWide() )

    self.icon = Material('icon16/' .. (ply:getJobTable().icon or 'computer') .. '.png')
    self.Button:SetToolTip(ply:SteamName())

    local sID = ply:SteamID64()
    self.Button.DoClick = function()
        octochat.pnl:ChatHide()
        gui.OpenURL('https://steamcommunity.com/profiles/' .. sID)
    end
end

function PANEL:Paint(w, h)
    -- render.ClearStencil() -- some people are so messy
    -- render.SetStencilEnable(true)
    --
    -- render.SetStencilWriteMask( 1 )
    -- render.SetStencilTestMask( 1 )
    --
    -- render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
    -- render.SetStencilPassOperation( STENCILOPERATION_ZERO )
    -- render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
    -- render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
    -- render.SetStencilReferenceValue( 1 )
    --
    -- local _m = self.m_masksize
    --
    -- local circle, t, segs = {}, 0, 30
    -- for i = 1, segs do
    --     t = math.pi * 2 * i / segs
    --     circle[i] = { x = w/2 + cos(t)*_m, y = h/2 + sin(t)*_m }
    -- end
    -- draw.NoTexture()
    -- surface.SetDrawColor(color_white)
    -- surface.DrawPoly(circle)
    --
    -- render.SetStencilFailOperation( STENCILOPERATION_ZERO )
    -- render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
    -- render.SetStencilZFailOperation( STENCILOPERATION_ZERO )
    -- render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
    -- render.SetStencilReferenceValue( 1 )
    --
    -- -- self.Avatar:SetPaintedManually(false)
    -- self.Avatar:PaintManual()
    -- -- self.Avatar:SetPaintedManually(true)
    --
    -- render.SetStencilEnable(false)
    -- render.ClearStencil() -- you're welcome, bitch.

    surface.SetDrawColor(255,255,255, 255)
    surface.SetMaterial(self.icon)
    surface.DrawTexturedRect(w/2 - 8, h/2 - 8, 16, 16)
end

vgui.Register( "AvatarCircleMask", PANEL )


