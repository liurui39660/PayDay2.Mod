Farther the distance, higher the damage.  
This mod gives the Rifleman Aced a new effect.  
Put the decompressed folder to `mods/`, same as other mods.  
Requires [Localization Macro Replacement](https://modworkshop.net/mod/28831) to properly render the in-game description.

In-game description  
Aced: If you shoot at an enemy from **18m** away, bonus damage exponential to the distance will be applied. It can only be triggered by sniper rifles and functions as simple damage.

Q: How to compute the bonus damage?  
A: The bonus part is `pow(damage, distance / 18) - damage`,  
where `damage` is the actual damage you deal towards the enemy after all the computation except for this skill,  
and `distance` is the distance (unit: meter) to the target.

Q: What's the simple damage?  
A: Just pure damage, similar to what Graze causes to nearby units. It does not count towards any weapon, also can't land a headshot. 

Q: How will this mod affect sniper rifles?  
A: It encourages players to snipe targets very far away, since the damage increases significantly with the distance.

Q: How about the original Rifleman Aced?  
A: Most old upgrades except for the pistol zoom increase are removed.

Comments, suggestion and ideas for thumbnails are welcomed.