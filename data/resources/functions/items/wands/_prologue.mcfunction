tag @s[nbt={SelectedItem: {tag: {Spell: {}}}}] add HasWand
scoreboard players set @s[tag=HasWand] CastDetector 0
playsound block.enchantment_table.use block @a ~ ~ ~
