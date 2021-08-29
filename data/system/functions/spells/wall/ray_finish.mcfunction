execute at @s run setblock ~ ~ ~ minecraft:stone

# clean-up
execute as @a[tag=SpellWall] run tag @s remove SpellWall
kill @s[tag=Ray]
