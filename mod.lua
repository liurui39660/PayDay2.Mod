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

local _get_swap_speed_multiplier = PlayerStandard._get_swap_speed_multiplier
function PlayerStandard:_get_swap_speed_multiplier(...)
	return _get_swap_speed_multiplier(self, ...) * 1.25
end