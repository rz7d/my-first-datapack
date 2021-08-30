scoreboard players set @s CastDetector 0
playsound block.enchantment_table.use block @a ~ ~ ~
item modify entity @s[nbt={SelectedItem: {tag: {Spell: {}}}}] weapon.mainhand system:wand_wall
