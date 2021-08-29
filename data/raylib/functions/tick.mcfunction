execute as @e[tag=Ray,tag=!Override,nbt=!{PortalCooldown: 0}] at @s run function raylib:_raycast_move
execute as @e[tag=Ray,tag=!Override,nbt={PortalCooldown: 0}] at @s run function raylib:_raycast_timeout
execute as @e[tag=Ray,tag=!Override] at @s unless block ^ ^ ^1 #system:no_collision at @s run function raylib:_raycast_finish
execute as @e[tag=Ray,tag=!Override] at @s unless block ^1 ^ ^ #system:no_collision at @s run function raylib:_raycast_finish
