ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


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
