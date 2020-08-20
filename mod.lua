local function on_ammo_pickup(unit, next_grenade_t)
	if unit == managers.player:player_unit() and next_grenade_t < managers.player:player_timer():time() then
		managers.player:add_grenade_amount(1, true)
		return managers.player:player_timer():time() + 3
	end
	return next_grenade_t
end

PlayerAction.FullyLoaded = {
	Priority = 1,
	Function = function(player_manager, pickup_chance, increase)
		local co = coroutine.running()
		local next_grenade_t = 0
		local function on_ammo_pickup_message(unit)
			next_grenade_t = on_ammo_pickup(unit, next_grenade_t)
		end
		player_manager:register_message(Message.OnAmmoPickup, co, on_ammo_pickup_message)
		while true do
			coroutine.yield(co)
		end
		player_manager:unregister_message(Message.OnAmmoPickup, co)
	end
}
