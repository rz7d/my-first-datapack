#execute at @s align xyz run fill ^-1 ^-1 ^ ^1 ^1 ^ minecraft:ice keep

execute at @s align xyz positioned ~ ~ ~ run summon armor_stand ~ ~ ~ {Tags:[WallTemp,WallTempSync],NoGravity:true,Marker:false}
# execute at @s as @e[tag=WallTempSync,sort=nearest,limit=1] run data modify entity @s Rotation[0] set from entity @e[tag=Ray,sort=nearest,limit=1] Rotation[0]

execute as @e[tag=WallTemp] store result score PosX Calc run data get entity @s Pos[0] 10
execute as @e[tag=WallTemp] store result score PosZ Calc run data get entity @s Pos[2] 10
scoreboard players add PosX Calc 5
scoreboard players add PosZ Calc 5
execute as @e[tag=WallTemp] store result entity @s Pos[0] float 0.1 run scoreboard players get @s PosX 
execute as @e[tag=WallTemp] store result entity @s Pos[2] float 0.1 run scoreboard players get @s PosZ
#scoreboard players operation Direction Calc /= #90 Calc
#scoreboard players operation Direction Calc *= #90 Calc


# orientation = Math.floor(rotation % 90 / 90) -> x=0, y=1
execute store result score D Calc run data get entity @s Rotation[0] 1

scoreboard players operation D Calc += #180 Calc
scoreboard players operation D Calc /= #90 Calc
scoreboard players operation D Calc *= #90 Calc

execute as @e[tag=WallTempSync] store result entity @s Rotation[0] float 1 run scoreboard players get D Calc
tag @e[tag=WallTempSync] remove WallTempSync


# fill ice
execute as @e[tag=WallTemp] at @s run fill ^-1 ^-1 ^ ^1 ^1 ^ minecraft:ice keep



# clean-up
#kill @e[tag=WallTemp]
execute as @a[tag=SpellWall] run tag @s remove SpellWall
kill @s[tag=Ray]