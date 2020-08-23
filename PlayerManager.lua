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

AmmoEfficiency = AmmoEfficiency or {
	headshot_count = 0, -- Var
	headshot_target = 2, -- Const
	time_limit = 6, -- Const
	target_time = 0, -- Var
	level = 0, -- Set by PlayerManager
	distance_req = math.huge, -- Set by PlayerManager
	bullet_refund = 1, -- Const
}

function AmmoEfficiency:on_weapon_fired(weapon_unit, result)
	if alive(weapon_unit) and weapon_unit:base():fire_mode() == "single" and weapon_unit == managers.player:equipped_weapon_unit()
		and (weapon_unit:base():is_category("smg", "assault_rifle") or weapon_unit:base():is_category("snp") and self.level == 1) then
		local time = Application:time()
		for _, hit in ipairs(result.rays) do
			local result = hit.damage_result
			if result and result.attack_data -- Hit is valid
				and not hit.unit:in_slot(sentry_mask) and not hit.unit:in_slot(ally_mask) -- Target is a foe
				and hit.distance >= self.distance_req and result.attack_data.headshot then
				if self.target_time <= time then
					self.target_time = time + self.time_limit
					self.headshot_count = 0
				end
				self.headshot_count = self.headshot_count + 1
				if self.headshot_count == self.headshot_target then
					managers.player:on_ammo_increase(self.bullet_refund)
					self.target_time = 0
				end
			end
		end
	end
end

AmmoEfficiencySniper = AmmoEfficiencySniper or {
	distance_req = 1800, -- Const
	bullet_refund = 1, -- Const
}

function AmmoEfficiencySniper:on_sniper_rifle_fired(weapon_unit, result)
	if alive(weapon_unit) and weapon_unit:base():is_category("snp") and weapon_unit == managers.player:equipped_weapon_unit() then
		for _, hit in ipairs(result.rays) do
			local result = hit.damage_result
			if result and result.attack_data -- Hit is valid
				and not hit.unit:in_slot(sentry_mask) and not hit.unit:in_slot(ally_mask) -- Target is a foe
				and hit.distance >= self.distance_req and result.attack_data.headshot and (result.type == "death" or result.type == "healed") then
				managers.player:on_ammo_increase(self.bullet_refund) -- Here's your reward
			end
		end
	end
end

Hooks:PostHook(PlayerManager, "check_skills", "f85f68da-53a0-4a01-ad25-a3cc7f435ce0", function(self)
	local level = self:upgrade_level("player", "head_shot_ammo_return")
	if level == 1 then
		AmmoEfficiency.level = level
		AmmoEfficiency.distance_req = 1800
		self:register_message(Message.OnWeaponFired, "ammo_efficiency", callback(AmmoEfficiency, AmmoEfficiency, "on_weapon_fired"))
	elseif level == 2 then
		AmmoEfficiency.level = level
		AmmoEfficiency.distance_req = 0
		self:register_message(Message.OnWeaponFired, "ammo_efficiency", callback(AmmoEfficiency, AmmoEfficiency, "on_weapon_fired"))
		self:register_message(Message.OnWeaponFired, "ammo_efficiency_sniper", callback(AmmoEfficiencySniper, AmmoEfficiencySniper, "on_sniper_rifle_fired"))
	else
		AmmoEfficiency.level = 0
		self:unregister_message(Message.OnWeaponFired, "ammo_efficiency")
		self:unregister_message(Message.OnWeaponFired, "ammo_efficiency_sniper")
	end
end)