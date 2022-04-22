QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-pizzajob:Payment', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney("cash", 150, "sold-pizza")
    TriggerClientEvent("QBCore:Notify", src, "You recieved $150", "success")
end)

RegisterServerEvent('qb-pizzajob:TakeDeposit', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney("bank", 100, src, "pizza-deposit")
    TriggerClientEvent("QBCore:Notify", src, "You were charged a deposit of $100", "error")
end)

RegisterServerEvent('qb-pizzajob:ReturnDeposit', function(info)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if info == 'cancel' then
        Player.Functions.AddMoney("cash", 50, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", src, "You returned the vehicle and recieved your deposit back", "success")
    elseif info == 'end' then
        Player.Functions.AddMoney("cash", 150, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", src, "You returned the vehicle and recieved your deposit back", "success")
    end
end)
