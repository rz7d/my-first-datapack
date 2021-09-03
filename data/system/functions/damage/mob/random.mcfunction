execute store result score @s Random run function system:random/random
execute store result score @s MeleeRandom run scoreboard players get @s StatusAttack
scoreboard players operation @s MeleeRandom /= #5 System
scoreboard players add @s MeleeRandom 5
scoreboard players operation @s Random %= @s MeleeRandom

execute store result score @s MeleeRandom run time query daytime
scoreboard players operation @s MeleeRandom %= #2 System
execute if score @s MeleeRandom matches 1 run scoreboard players operation @s Random *= #-1 System
scoreboard players operation @s StatusAttack += @s Random
execute if score @s StatusAttack matches ..0 run scoreboard players set @s StatusAttack 1

