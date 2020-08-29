It seems SuperBLT can't correctly parse macros in some strings, so I wrote this as a workaround.  
This is not a mod for the game, but something (I don't want to call it a library) that for mod developers (mostly myself).  
Put the decompressed folder into `mods/`, same as other mods.

Q: What does this "mod" do?  
A: If you want to use SuperBLT's localization functions `LocalizationManager.add_localized_strings` or `LocalizationManager.load_localization_file` and there are some macros in the strings, maybe this mod can better parse them.

Q: Any example?  
A: The default description for Graze (string ID `menu_sniper_graze_damage_desc`).

> `BASIC: ##$basic;##$NL;Snipers that hit their target deal ##$multibasic;## of the damage dealt in a ##$multibasic2;## radius around the bullet trajectory.$NL;$NL;ACE: ##$pro;##$NL;If a bullet would headshot-kill someone, the graze skill will deal ##$multipro;## of the weapon's damage instead of ##$multipro2;##.`  

Q: How can I demonstrate if those issues indeed exist?  
A: You can disable this mod, then append the following code to any enabled mod's any source file, then check the description of the skill Graze.

```lua
Hooks:Add("LocalizationManagerPostInit", "3e98f6e0-656e-4fdc-a330-589da3667c71", function(self)
	self:add_localized_strings({
		["menu_sniper_graze_damage_desc"] = "BASIC: ##$basic;##$NL;Snipers that hit their target deal ##$multibasic;## of the damage dealt in a ##$multibasic2;## radius around the bullet trajectory.$NL;$NL;ACE: ##$pro;##$NL;If a bullet would headshot-kill someone, the graze skill will deal ##$multipro;## of the weapon's damage instead of ##$multipro2;##."
	})
end)
```

Q: How can I test if this mod works as expected?  
A: Keep the above code, and enable this mod. Now the description of Graze should be what you are familiar with.

Comments and suggestions are welcomed.