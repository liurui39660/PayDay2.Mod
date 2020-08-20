local _get_swap_speed_multiplier = PlayerStandard._get_swap_speed_multiplier
function PlayerStandard:_get_swap_speed_multiplier()
	return _get_swap_speed_multiplier(self) * 1.5
end