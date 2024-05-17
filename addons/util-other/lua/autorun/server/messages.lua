local msgCD = 180
local messages = {
    'Дискорд нашего сервера - https://discord.gg/hvrZU34x',
    'Продаём админку - /donate',
}
local whitelistRanks = octolib.array.toKeys({'founder', 'superadmin', 'dev'})

timer.Create('doberman.reklama', msgCD, 0, function()
    for _, ply in ipairs(player.GetAll()) do
        if whitelistRanks[ply:GetUserGroup()] then continue end
        ply:Notify('hint', messages[math.random(1, #messages)])
    end
end)