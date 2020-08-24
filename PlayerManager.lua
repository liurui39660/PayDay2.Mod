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

LongRangeRifleman = LongRangeRifleman or {
	base_distance = 1800 -- Const
}

function LongRangeRifleman:on_weapon_fired(weapon_unit, result)
	if alive(weapon_unit) and weapon_unit:base():is_category("smg", "assault_rifle", "snp") and weapon_unit == managers.player:equipped_weapon_unit() then
		for _, hit in ipairs(result.rays) do
			local result = hit.damage_result
			if result and result.attack_data
				and hit.distance >= self.base_distance
				and result.type ~= "death" and not result.type ~= "healed" then
				hit.unit:character_damage():damage_simple({
					variant = "rifleman",
					damage = result.attack_data.damage * (hit.distance / self.base_distance - 1),
					attacker_unit = managers.player:player_unit(),
					pos = hit.position,
					attack_dir = -hit.normal
				})
			end
		end
	end
end

Hooks:PostHook(PlayerManager, "check_skills", "6d116c21-d56b-4500-b436-70c98a2dbe34", function(self)
	if self:has_category_upgrade("pistol", "zoom_increase") then
		self:register_message(Message.OnWeaponFired, "long_range_rifleman", callback(LongRangeRifleman, LongRangeRifleman, "on_weapon_fired"))
	else
		self:unregister_message(Message.OnWeaponFired, "long_range_rifleman")
	end
end)