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

local sniper_ratio = 2.5

Hooks:PreHook(RaycastWeaponBase, "add_ammo", "45f770df-b07c-410c-9341-4332ca6f1900", function(self)
	self._ammo_pickup[1] = self._ammo_pickup[1] * sniper_ratio
	self._ammo_pickup[2] = self._ammo_pickup[2] * sniper_ratio
end)

Hooks:PostHook(RaycastWeaponBase, "add_ammo", "75524917-c99f-42ab-b7ed-6f22b93c8322", function(self)
	self._ammo_pickup[1] = self._ammo_pickup[1] / sniper_ratio
	self._ammo_pickup[2] = self._ammo_pickup[2] / sniper_ratio
end)