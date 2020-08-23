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

MoreADSZoom = MoreADSZoom or {
	save_path = SavePath .. "MoreADSZoom.json",
	mod_path = ModPath,
	settings = {
		choice = 3
	},
	scheme = {
		nil, -- Original
		{
			63.00, -- +0, e.g. iron sight, no change
			52.00, -- +1, only marksman sight and bipod, 1.25x
			43.33, -- +2, only surgeon sight, 1.5x
			32.50, -- +3, e.g. red dot, 2x
			21.67, -- +4, e.g. milspec, 3x
			16.25, -- +5, e.g. acog, 4x
			13.00, -- +6, default sniper scope, 5x
			10.83, -- +7, broomstick scope, 6x
			9.296, -- Empty level, 7x
			8.125, -- +10, theia, box buddy, a5 sight, 8x
		}, {
			63.00, -- +0, e.g. iron sight, no change
			52.00, -- +1, only marksman sight and bipod, 1.25x
			43.33, -- +2, only surgeon sight, 1.5x
			32.50, -- +3, e.g. red dot, 2x
			26.00, -- +4, e.g. milspec, 2.5x
			21.67, -- +5, e.g. acog, 3x
			16.25, -- +6, default sniper scope, 4x
			10.83, -- +7, broomstick scope, theia, box buddy, a5 sight, 6x
		}
	}
}

function MoreADSZoom:save()
	local file = io.open(self.save_path, "w")
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function MoreADSZoom:load()
	local file = io.open(self.save_path, "r")
	if file then
		for key, value in pairs(json.decode(file:read("*a"))) do
			self.settings[key] = value
		end
		file:close()
	end
end

Hooks:Add("LocalizationManagerPostInit", "374f5585-c7e9-40fa-b1bf-adabaac6c0a8", function(loc)
	loc:load_localization_file(MoreADSZoom.mod_path .. 'locale/en-US.json')
end)

Hooks:Add("MenuManagerInitialize", "c3c6fde3-a5b5-494b-8478-b6877444ef9a", function(menu_manager)
	-- Back callback
	MenuCallbackHandler["a1d67758-7a5e-4978-a0a7-76172b727cc1"] = function(self)
		MoreADSZoom:save()
	end
	-- Scheme multiple choice
	MenuCallbackHandler["a6bc7789-1cd0-4b39-83c0-4f21112e4e96"] = function(self, item)
		MoreADSZoom.settings.choice = item:value()
	end
	MoreADSZoom:load()
	tweak_data.weapon.stats.zoom = MoreADSZoom.scheme[MoreADSZoom.settings.choice]
	MenuHelper:LoadFromJsonFile(MoreADSZoom.mod_path .. "option.json", MoreADSZoom, MoreADSZoom.settings)
end)

Hooks:PostHook(WeaponTweakData, "_init_stats", "4eb837fd-51bf-47d8-88f9-458e1c18a7d2", function(self)
	MoreADSZoom.scheme[1] = CloneClass(self.stats.zoom)
end)