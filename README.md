45-degree sights have the same zoom level as the red dot sight (on a sniper rifle).  
Only applies for 45-degree red dot sights, i.e., Riktpunkt 45 Degree Sight and 45 Degree Red-Dot Sight.   
Technically, change the zoom level of them from 1 to 4.  
Put the decompressed folder into `mod/`, like most other mods.

The preview screenshots are the red dot sight (no change) and the angled sight (zoom level 1 -> 4).

Q: I remember the red dot sight is a +3 sight, why do you set the 45-degree sight to level 4?    
A: The angled sights have a different mechanism as regular sights. While regular sights add a certain level to the weapon's default zoom level, angled sights directly use the zoom level specified by the sight. For a sniper rifle, the default zoom level is 1, so an angled sight with level 4 is the same as a regular red dot sight with +3 levels.

Q: The zoom level of my sniper rifle with a 45-degree sight is still lower than my assault rifle with a red dot sight.  
A: Most assault rifle has a default zoom level 3, a red dot sight +3 levels for that, so it results in level 6, i.e., FOV 40. But an angled sight, with this mod turned on, is level 4, i.e., FOV 50.

Q: From the source code of the game, some angled sights may also add their zoom level to the base zoom level.  
A: Yes, angled sights should have a `gadget_zoom` and/or a `gadget_zoom_add`. The former directly specify a constant zoom level, regardless of the weapon it equips on, while the latter adds a specific zoom level to the weapon's base zoom level. If the former is presented, the latter will be ignored. However, as of August 14, 2020, there isn't any angled sight with `gadget_zoom_add`.

Comments and suggestions are welcomed. 
