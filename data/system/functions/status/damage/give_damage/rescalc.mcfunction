execute store result score @s StatusDefense run data get entity @s ActiveEffects[{Id:11b}].Amplifier 20
scoreboard players add @s StatusDefense 20
scoreboard players operation @s StatusDefense -= #100 Constants
scoreboard players operation @s StatusDefense *= #-1 Constants
scoreboard players operation @s StatusAttack *= @s StatusDefense
scoreboard players operation @s StatusAttack /= #100 Constants
