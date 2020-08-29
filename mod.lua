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

Hooks:Add("LocalizationManagerPostInit", "dc2067e9-9b3c-466e-a923-317e342edeb5", function(self)
	function LocalizationManager:text(string_id, macros)
		if self._custom_localizations[string_id] then
			local return_str = self:_text_macroize(self:_text_macroize(self._custom_localizations[string_id], macros), self._default_macros)
			if macros and type(macros) == "table" then
				for k, v in pairs(macros) do
					return_str = return_str:gsub("$" .. k, v)
				end
			end
			return return_str
		end
		return self.orig.text(self, string_id, macros)
	end
end)