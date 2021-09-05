execute store result score Origin NextVelocityX run data get entity @s Pos[0] 100
execute store result score Origin NextVelocityZ run data get entity @s Pos[2] 100

execute store result score @s NextVelocityX run data get entity @e[tag=Cursor,limit=1] Pos[0] 100
execute store result score @s NextVelocityZ run data get entity @e[tag=Cursor,limit=1] Pos[2] 100

scoreboard players operation @s NextVelocityX -= Origin NextVelocityX
scoreboard players operation @s NextVelocityZ -= Origin NextVelocityZ
