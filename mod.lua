local reload_speed_multiplier = NewRaycastWeaponBase.reload_speed_multiplier
function NewRaycastWeaponBase:reload_speed_multiplier()
	return reload_speed_multiplier(self) * 1.5
end