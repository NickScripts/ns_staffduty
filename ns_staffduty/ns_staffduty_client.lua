local onDuty = false

AddEventHandler("EasyAdmin:BuildSettingsOptions", function(playerId)
	if not onDuty then
		repeat
			Wait(1)
		until _menuPool:IsAnyMenuOpen() -- wait until menu has fully loaded only to kill it again.
		_menuPool:CloseAllMenus()
		ShowNotification("You need to go On Duty first! ~y~/staffduty")
	end
end)

RegisterNetEvent("EasyAdmin:staffduty:toggle")
AddEventHandler("EasyAdmin:staffduty:toggle", function(toggle)
	onDuty=toggle
	if toggle then
		ShowNotification("You're now on staff duty!")
	else
		ShowNotification("You're no longer on staff duty!")
	end
end)