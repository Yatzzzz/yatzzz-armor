ESX = nil
local IsDead = false
local level = -1


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


RegisterNetEvent('yatzzz-armor:SmallArmor')
AddEventHandler('yatzzz-armor:SmallArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'SmallArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('error', 'Zaten bir yelek giydin!')
        TriggerServerEvent('returnItem', item)
        return
    end
    TriggerEvent('mythic_progbar:client:progress', {
        name = "smallb_armor",
        duration = 4000,
        label = 'Çelik Yelek Giyiliyor...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
            flags = 49,
        },
        prop = {
            model = "prop_bodyarmour_02",
            bone = 18905,
            coords = { x = 0.10, y = 0.02, z = 0.08 },
            rotation = { x = -80.0, y = 0.0, z = 0.0 },
        },
    }, function(status)
        if not status then
            SetPedComponentVariation(ped, 9, 10, 0, 0)
            SetPedArmour(ped, 20)
            exports['mythic_notify']:DoHudText('success', 'Hafif yeleği giydin!')
            level = 0
        end
    end)
end)

RegisterNetEvent('yatzzz-armor:MedArmor')
AddEventHandler('yatzzz-armor:MedArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'MedArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('error', 'Zaten bir yelek giydin!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = "smallb_armor",
        duration = 4000,
        label = 'Çelik Yelek Giyiliyor...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
            flags = 49,
        },
        prop = {
            model = "prop_bodyarmour_02",
            bone = 18905,
            coords = { x = 0.10, y = 0.02, z = 0.08 },
            rotation = { x = -80.0, y = 0.0, z = 0.0 },
        },
    }, function(status)
        if not status then
            SetPedComponentVariation(ped, 9, 10, 0, 0)
            SetPedArmour(ped, 60)
            exports['mythic_notify']:DoHudText('success', 'Ağır yeleği giydin!')
            level = 1
        end
    end)
end)

RegisterNetEvent('yatzzz-armor:HeavyArmor')
AddEventHandler('yatzzz-armor:HeavyArmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'HeavyArmor'

    if(armor >= 100) or (armor+30 > 100) then
        exports['mythic_notify']:DoHudText('error', 'Zaten bir yelek giydin!')
        TriggerServerEvent('returnItem', item)
        return
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = "smallb_armor",
        duration = 4000,
        label = 'Çelik Yelek Giyiliyor...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
            flags = 49,
        },
        prop = {
            model = "prop_bodyarmour_02",
            bone = 18905,
            coords = { x = 0.10, y = 0.02, z = 0.08 },
            rotation = { x = -80.0, y = 0.0, z = 0.0 },
        },
    },
    function(status)
        if not status then
            SetPedComponentVariation(ped, 9, 10, 0, 0)
            SetPedArmour(ped, 100)
            exports['mythic_notify']:DoHudText('success', 'Ağır yeleği giydin!')
            level = 2
        end
    end)
end)

RegisterNetEvent('yatzzz:armorcikra')
AddEventHandler('yatzzz:armorcikra', function()

    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local sikis = GetPedDrawableVariation(ped, 9)
    print(sikis .. " Kevlar numarasi")
    print(armor .. " Armor sayisi")
    if sikis == 10 then
        if armor >= 20 then
            TriggerEvent('mythic_progbar:client:progress', {
                name = "smallb_armor",
                duration = 4000,
                label = 'Çelik Yelek Çıkartılıyor...',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "rcmfanatic3",
                    anim = "kneel_idle_a",
                    flags = 49,
                },
                prop = {
                    model = "prop_bodyarmour_02",
                    bone = 18905,
                    coords = { x = 0.10, y = 0.02, z = 0.08 },
                    rotation = { x = -80.0, y = 0.0, z = 0.0 },
                },
            },
            function(status)
                if not status then
                    SetPedComponentVariation(ped, 9, 0, 0, 0)
                    SetPedArmour(ped, 0)
                    if level == 0 then
                        TriggerServerEvent("armor0")
                    elseif level == 1 then
                        TriggerServerEvent("armor1")
                    else
                        TriggerServerEvent("armor2")
                    end
                    exports['mythic_notify']:DoHudText('success', 'Yeleği Çıkardın!')
                end
            end)
        else 
            exports['mythic_notify']:DoHudText('error', 'Çelik yeleğini patlatıldı')
            TriggerEvent('mythic_progbar:client:progress', {
                name = "smallb_armor",
                duration = 4000,
                label = 'Çelik Yelek Çıkartılıyor...',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "rcmfanatic3",
                    anim = "kneel_idle_a",
                    flags = 49,
                },
                prop = {
                    model = "prop_bodyarmour_02",
                    bone = 18905,
                    coords = { x = 0.10, y = 0.02, z = 0.08 },
                    rotation = { x = -80.0, y = 0.0, z = 0.0 },
                },
            },
            function(status)
                if not status then
                    SetPedComponentVariation(ped, 9, 0, 0, 0)
                    SetPedArmour(ped, 0)
                    exports['mythic_notify']:DoHudText('success', 'Yeleği Çıkardın!')
                end
            end)
        end
    else
        exports['mythic_notify']:DoHudText('error', 'Üzerinde çelik yelek yok!')
    end
end)