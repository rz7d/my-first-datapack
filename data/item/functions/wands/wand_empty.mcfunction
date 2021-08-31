tag @s[nbt={SelectedItem: {tag: {Spell: {}}}}] add HasWand
scoreboard players set @s[tag=HasWand] CastDetector 0
playsound block.enchantment_table.use block @a ~ ~ ~ 1 0.5
loot replace entity @s[nbt={SelectedItem: {tag: {Spell: {}}}}] weapon.mainhand loot item:wand/wand_empty
function item:wands/_epilogue
