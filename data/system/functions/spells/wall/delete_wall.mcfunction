execute at @s run playsound minecraft:block.glass.break block @a ~ ~ ~ 1
execute at @s run fill ^-1 ^-1 ^ ^1 ^1 ^ minecraft:air replace minecraft:ice
execute run kill @s[tag=WallCount]
