execute at @s align xyz positioned ~ ~ ~ run summon armor_stand ~ ~ ~ {Tags:[WallTemp,WallTempSync],NoGravity:true,Marker:false}

execute as @e[tag=WallTemp] store result score PosX Calc run data get entity @s Pos[0] 10
execute as @e[tag=WallTemp] store result score PosZ Calc run data get entity @s Pos[2] 10
scoreboard players add PosX Calc 5
scoreboard players add PosZ Calc 5
execute as @e[tag=WallTemp] store result entity @s Pos[0] double 0.1 run scoreboard players get PosX Calc
execute as @e[tag=WallTemp] store result entity @s Pos[2] double 0.1 run scoreboard players get PosZ Calc
execute as @e[tag=WallTemp] at @s run tp ~ ~ ~

# 回転を設定する
execute store result score D Calc run data get entity @s Rotation[0] 1
scoreboard players operation D Calc /= #90 Calc
scoreboard players operation D Calc *= #90 Calc
execute as @e[tag=WallTempSync] store result entity @s Rotation[0] float 1 run scoreboard players get D Calc

tag @e[tag=WallTempSync] remove WallTempSync


# fill ice
execute as @e[tag=WallTemp] at @s run fill ^-1 ^-1 ^ ^1 ^1 ^ minecraft:ice keep



# clean-up
kill @e[tag=WallTemp]
execute as @a[tag=SpellWall] run tag @s remove SpellWall
kill @s[tag=Ray]