Change the global zoom level.  
It should be applied to all sights, including gadget sights.  
Put the decompressed folder into `mod/` folder, like most other mods.

Tl;dr, for the zooms, vanilla < scheme B < scheme A; for ADS FOV, the order is reversed. 

If you don't know how sights work, you can read this [guide](https://steamcommunity.com/sharedfiles/filedetails/?id=267214370). There's a section (almost) comprehensively explains the mechanism about sights. One thing the guide seems to forget to mention is gadget sights are not +X sights; they override the zoom levels.

I use the hip-fire FOV 65 as the baseline (1.0x); when giving examples, I assume weapons' base zoom level is 1 (typical sniper rifles).

This mod provides two schemes, scheme A has 10 levels. FOVs range from 1.25x to 8x. This is also the only choice in the initial release of this mod. These levels are

63 -> 63.00, +0, e.g. iron sight, no change  
60 -> 52.00, +1, only marksman sight and bipod, 1.25x  
55 -> 43.33, +2, only surgeon sight, 1.5x  
50 -> 32.50, +3, e.g. red dot, 2x  
45 -> 21.67, +4, e.g. milspec, 3x  
40 -> 16.25, +5, e.g. acog, 4x  
35 -> 13.00, +6, default sniper scope, 5x  
30 -> 10.83, +7, broomstick scope, 6x  
25 -> 9.296, empty level, 7x  
20 -> 8.125, +10, theia, box buddy, a5 sight, 8x

In 2.0.0, scheme B is also provided. This scheme only has 8 levels, FOVs range from 1.25x to 6x. The purpose of this scheme is to 1) allow high-level scopes useable in medium-size maps and 2) allow players to see the on-sight range finder. The zoom levels are

63 -> 63.00, +0, e.g. iron sight, no change  
60 -> 52.00, +1, only marksman sight and bipod, 1.25x  
55 -> 43.33, +2, only surgeon sight, 1.5x  
50 -> 32.50, +3, e.g. red dot, 2x  
45 -> 26.00, +4, e.g. milspec, 2.5x  
40 -> 21.67, +5, e.g. acog, 3x  
35 -> 16.25, +6, default sniper scope, 4x  
30 -> 10.83, +7, broomstick scope, theia, box buddy, a5 sight, 6x

The preview screenshots are respectively Theia Magnified Scope (+10), Advanced Combat Sight (+5), Speculator Sight (+3), Milspec Scope (+4), using the scheme A, with the mod on/off.

Comments and suggestions are welcomed.

Demo  
All uses scheme A.

For Theia, in a random forest ↓  
[![](https://img.youtube.com/vi/QJoBrVGJ1RU/0.jpg))](https://youtu.be/QJoBrVGJ1RU)

For Advanced Combat Sight, in someone's breakout ↓  
[![](https://img.youtube.com/vi/t2MmK5fwLS8/0.jpg))](https://youtu.be/t2MmK5fwLS8)
