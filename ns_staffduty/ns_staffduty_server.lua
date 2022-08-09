ESX = nil
local activeDuties = {}
-- source = startTime



RegisterCommand("staffduty", function(source)
	if IsPlayerAdmin(source) then
		if activeDuties[source] then
			TriggerClientEvent("EasyAdmin:staffduty:toggle", source, false)
			activeDuties[source] = os.time()
			local _source = source	
			local xPlayer = ESX.GetPlayerFromId(_source)    
				local connect = {
					{
						["color"] = "16711680",
						["title"] = 'Player: '  ..GetPlayerName(source).."",
						["description"] = 'Went off-duty as staff, was on-duty for '..disp_time(os.difftime(os.time(), activeDuties[source])).. "",
						["footer"] = {
						["text"] = os.date('%H:%M - %d. %m. %Y', os.time()),
						["icon_url"] = "",
						},
					}
				}
				PerformHttpRequest('<DISCORD WEBHOOK GOES HERE>', function(err, text, headers) end, 'POST', json.encode({username = "Nicks Scripts - Easy Admin", embeds = connect, avatar_url = 'https://cdn.discordapp.com/attachments/969028303153426443/1004100536657788988/looted_-_Copy.png'}), { ['Content-Type'] = 'application/json' })
			activeDuties[source] = nil
		else
			TriggerClientEvent("EasyAdmin:staffduty:toggle", source, true)
			local _source = source	
			local xPlayer = ESX.GetPlayerFromId(_source)    
				local connect = {
					{
						["color"] = "16711680",
						["title"] = 'Player: '  ..GetPlayerName(source).."",
						["description"] = 'Went on-duty as staff',
						["footer"] = {
						["text"] = os.date('%H:%M - %d. %m. %Y', os.time()),
						["icon_url"] = "",
						},
					}
				}	
				PerformHttpRequest('<DISCORD WEBHOOK GOES HERE>', function(err, text, headers) end, 'POST', json.encode({username = "Nicks Scripts - Easy Admin", embeds = connect, avatar_url = 'https://cdn.discordapp.com/attachments/969028303153426443/1004100536657788988/looted_-_Copy.png'}), { ['Content-Type'] = 'application/json' })
			activeDuties[source] = os.time()
		end
	end
end, false)

function disp_time(time)
	local hours = math.floor((time % 86400)/3600)
	local minutes = math.floor((time % 3600)/60)
	local seconds = math.floor((time % 60))
	return string.format("%02d:%02d:%02d",hours,minutes,seconds)
end
