octoinv.addShopCat('chelog_weapon', {
	name = 'Оружие (CHELOG)',
	icon = 'octoteam/icons/bomb2.png',
    chelog = true,
})

local chelog_weps = {
    {'MAC-10', 'weapon_octo_mac10', 'octoteam/icons/gun_smg.png', 100},
    {'Glock', 'weapon_octo_glock', 'octoteam/icons/gun_pistol.png', 100},
    {'P228', 'weapon_octo_p228', 'octoteam/icons/gun_pistol.png', 100},
    {'Dual Elites', 'weapon_octo_dualelites', 'octoteam/icons/gun_pistol.png', 100},
    {'USP', 'weapon_octo_usp', 'octoteam/icons/gun_pistol.png', 100},
}

for _, data in ipairs(chelog_weps) do
    local wepData = octoinv.gunsItemData[data[2]]
    wepData.wepclass = data[2]

    octoinv.addShopItem(data[2] .. '1', {
        cat = 'chelog_weapon',
        item = 'weapon',
        name = data[1],
        icon = data[3],
        price = data[4],
        data = wepData
    })
end

octoinv.addShopCat('chelogplus_weapon', {
	name = 'Оружие (CHELOG+)',
	icon = 'octoteam/icons/bomb2.png',
    chelog_plus = true,
})

local chelogplus_weps = {
    {'AK', 'weapon_octo_ak', 'octoteam/icons/gun_rifle.png', 100},
    {'M4A1', 'weapon_octo_m4a1', 'octoteam/icons/gun_rifle.png', 100},
    {'UMP-45', 'weapon_octo_ump45', 'octoteam/icons/gun_smg.png', 100},
    {'MP-5', 'weapon_octo_mp5', 'octoteam/icons/gun_smg.png', 100},
    {'TMP', 'weapon_octo_tmp', 'octoteam/icons/gun_smg.png', 100},
    {'P90', 'weapon_octo_p90', 'octoteam/icons/gun_smg.png', 100},
    {'M3', 'weapon_octo_m3', 'octoteam/icons/gun_shotgun.png', 100},
    {'Scout', 'weapon_octo_scout', 'octoteam/icons/gun_sniper.png', 100},
}

for _, data in ipairs(chelog_weps) do
    local wepData = octoinv.gunsItemData[data[2]]
    wepData.wepclass = data[2]

    octoinv.addShopItem(data[2] .. '2', {
        cat = 'chelogplus_weapon',
        item = 'weapon',
        name = data[1],
        icon = data[3],
        price = data[4],
        data = wepData
    })
end
for _, data in ipairs(chelogplus_weps) do
    local wepData = octoinv.gunsItemData[data[2]]
    wepData.wepclass = data[2]

    octoinv.addShopItem(data[2] .. '2', {
        cat = 'chelogplus_weapon',
        item = 'weapon',
        name = data[1],
        icon = data[3],
        price = data[4],
        data = wepData
    })
end

local chelog_ranks = {
    chelog = true,
}

local chelogplus_ranks = {
    chelog_plus = true,
    chelog = true
}

hook.Add('octoinv.shop.order-override', 'doberman.weps', function(ply, basket, methodID, receiver)
    local rank = ply:GetUserGroup()
	if ply:IsAdmin() then return end
    for itemID, amount in pairs(basket) do
		local item = octoinv.shopItems[itemID]
        local category = octoinv.shopCats[item.cat]

        if category.chelog and not chelogplus_ranks[rank] then
            return true, 'Такой заказ можно оформить только игрокам с привилегией "Челог" и выше'
        end

        if category.chelog_plus and rank ~= 'chelog_plus' then
            return true, 'Такой заказ можно оформить только игрокам с привилегией "Челог+"'
        end
	end
end)