ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterUsableItem('greenchair', function(source)  
	TriggerClientEvent('chair:spawn', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx:showNotification', source, 'Chair placed!')
end)

ESX.RegisterUsableItem('classicchair', function(source)  
	TriggerClientEvent('chair:spawn2', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx:showNotification', source, 'Chair placed!')
end)

ESX.RegisterUsableItem('bluechair', function(source)  
	TriggerClientEvent('chair:spawn3', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx:showNotification', source, 'Chair placed!')
end)

ESX.RegisterUsableItem('officechair', function(source)  
	TriggerClientEvent('chair:spawn4', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx:showNotification', source, 'Chair placed!')
end)



