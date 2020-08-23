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

local sniper_ratio = 0.5

Hooks:PreHook(RaycastWeaponBase, "add_ammo", "01c7c2d9-541b-4757-90b0-769266c1fc5a", function(self)
	if managers.player:upgrade_level("player", "head_shot_ammo_return") == 2 and self:is_category("snp") then
		self._ammo_pickup[1] = self._ammo_pickup[1] * sniper_ratio
		self._ammo_pickup[2] = self._ammo_pickup[2] * sniper_ratio
	end
end)

Hooks:PostHook(RaycastWeaponBase, "add_ammo", "39bb041d-1a3d-42ae-b719-1cba0078e842", function(self)
	if managers.player:upgrade_level("player", "head_shot_ammo_return") == 2 and self:is_category("snp") then
		self._ammo_pickup[1] = self._ammo_pickup[1] / sniper_ratio
		self._ammo_pickup[2] = self._ammo_pickup[2] / sniper_ratio
	end
end)
