scoreboard players set @s CastDetector 0
playsound block.enchantment_table.use block @a ~ ~ ~
loot replace entity @s[nbt={SelectedItem: {tag: {Spell: {}}}}] weapon.mainhand loot item:wand/wand_wall
