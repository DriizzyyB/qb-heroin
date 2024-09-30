-- client/heroin.lua
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('consumables:client:UseHeroin', function()
    local playerPed = PlayerPedId()
    
    -- Apply visual effects
    SetTimecycleModifier("spectator5")  -- Initial visual effect
    StartScreenEffect("DrugsMichaelAliensFightIn", 0, true)  -- Drug screen effect
    ShakeGameplayCam("DRUNK_SHAKE", 1.0)  -- Camera shake
    
    -- Apply gameplay effects
    AddArmourToPed(playerPed, 50)
    SetPedArmour(playerPed, 100)
    SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
    ResetPedMovementClipset(playerPed, 0)
    SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", 1.0)  -- Drunk walking

    -- Stamina boost
    StatSetInt(GetHashKey("MP0_STAMINA"), 100, true)

    -- Notify player
    QBCore.Functions.Notify("You feel a rush of euphoria...", "success", 5000)
    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", true)

    -- Effects duration
    Citizen.Wait(60000)  -- 1 minute

    -- Remove effects
    SetTimecycleModifier("default")
    StopScreenEffect("DrugsMichaelAliensFightIn")
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    ResetPedMovementClipset(playerPed, 0)
    QBCore.Functions.Notify("The effects of the heroin are wearing off.", "error", 5000)
end)
