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

local _chk_dmg_too_soon = PlayerDamage._chk_dmg_too_soon
function PlayerDamage:_chk_dmg_too_soon(damage, ...)
	if self._RESULT_INDEX_TABLE then
		return _chk_dmg_too_soon(self, damage, ...)
	end
	return false
end
