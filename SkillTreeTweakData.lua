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

Hooks:PostHook(SkillTreeTweakData, "init", "0b03c6e4-ff1b-4f2f-a928-a5a44dee5f32", function(self)
	self.skills.bandoliers[1].upgrades = {
		"extra_ammo_multiplier1",
		"player_pick_up_ammo_multiplier",
		"player_pick_up_ammo_multiplier_2",
	}
	self.skills.bandoliers[2].upgrades = {
		"player_regain_throwable_from_ammo_1",
	}
end)

local mod_path = ModPath
Hooks:Add("LocalizationManagerPostInit", "8f7ed638-0354-4556-928f-f6a3d327abde", function(self)
	self:load_localization_file(mod_path .. 'locale/en.json')
end)