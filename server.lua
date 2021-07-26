
RegisterServerEvent('qb-pizzajob:Payment')
AddEventHandler('qb-pizzajob:Payment', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.AddMoney("cash", 150, "sold-pizza")
    TriggerClientEvent("QBCore:Notify", _source, "You recieved $150", "success")
end)

RegisterServerEvent('qb-pizzajob:TakeDeposit')
AddEventHandler('qb-pizzajob:TakeDeposit', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney("bank", 100, _source, "pizza-deposit")
    TriggerClientEvent("QBCore:Notify", _source, "You were charged a deposit of $100", "error")
end)

RegisterServerEvent('qb-pizzajob:ReturnDeposit')
AddEventHandler('qb-pizzajob:ReturnDeposit', function(info)
	local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    
    if info == 'cancel' then
        Player.Functions.AddMoney("cash", 50, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "You returned the vehicle and recieved your deposit back", "success")
    elseif info == 'end' then
        Player.Functions.AddMoney("cash", 150, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "You returned the vehicle and recieved your deposit back", "success")
    end
end)
