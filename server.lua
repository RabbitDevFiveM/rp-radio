ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem(radioConfig.ItemRadio, function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('mail3ee-radio:startRadio', source)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = "คุณไม่ใช่หน่วยงานเราขอลบวิทยุของคุณ" })
			xPlayer.removeInventoryItem('radio', xPlayer.getInventoryItem('radio').count)
		end
	end
end)

RegisterServerEvent('esx:onRemoveInventoryItem')
AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if radioConfig.DropWhenRemove then	
		if item.name == radioConfig.ItemRadio then
			--drop radio
			TriggerClientEvent('mail3ee-radio:dropradio', source)
		end
		if item.name == radioConfig.ItemCarRadio then
			--drop radio
			TriggerClientEvent('mail3ee-radio:dropradio', source)
		end
	end
end)
