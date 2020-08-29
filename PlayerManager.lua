-- ------------------------------------------------------------------------------
-- Copyright 2020 Rui LIU (@liurui39660)
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
-- 	http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ------------------------------------------------------------------------------

BetterFullyLoaded = BetterFullyLoaded or {
	next_throwable_t = 0, -- Var
	throwable_regain_cd = 3, -- Const
	rocket_regain_chance = 0, -- Set by PlayerManager
}

function BetterFullyLoaded:on_ammo_pickup(unit)
	if unit == managers.player:player_unit() then
		local time = Application:time()
		local base_cooldown = tweak_data.blackmarket.projectiles[managers.blackmarket:equipped_grenade()].base_cooldown

		if self.next_throwable_t <= time then
			-- Bow and crossbow
			for _, weapon in pairs(unit:inventory():available_selections()) do
				local base = weapon.unit:base()
				if base:is_category("bow", "crossbow") then
					base:add_ammo_in_bullets(1)
				end
			end
			-- Regular throwable
			if not base_cooldown then
				managers.player:add_grenade_amount(1, true)
			end
			self.next_throwable_t = time + self.throwable_regain_cd
		end
		-- Rocket
		for _, weapon in pairs(unit:inventory():available_selections()) do
			local base = weapon.unit:base()
			if base:is_category("grenade_launcher") and base:weapon_tweak_data().AMMO_PICKUP[2] == 0 and math.random() <= self.rocket_regain_chance then
				base:add_ammo_in_bullets(1)
			end
		end
		-- Cooldown-based throwable
		if base_cooldown and math.random() <= self.rocket_regain_chance then
			managers.player:speed_up_grenade_cooldown(base_cooldown)
		end
	end
end

Hooks:PostHook(PlayerManager, "check_skills", "b49779e5-acfa-4fd3-b7df-b079e205cd6a", function(self)
	if managers.player:has_category_upgrade("player", "regain_throwable_from_ammo") then
		BetterFullyLoaded.rocket_regain_chance = managers.player:upgrade_value("player", "regain_throwable_from_ammo").chance
		self:register_message(Message.OnAmmoPickup, "better_fully_loaded", callback(BetterFullyLoaded, BetterFullyLoaded, "on_ammo_pickup"))
	else
		self:unregister_message(Message.OnAmmoPickup, "better_fully_loaded")
	end
end)