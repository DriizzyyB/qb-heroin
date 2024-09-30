-- server/heroin.lua
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("heroin", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem("heroin", 1) then
        TriggerClientEvent('consumables:client:UseHeroin', source)
    end
end)
