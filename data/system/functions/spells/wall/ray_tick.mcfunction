execute as @e[tag=Ray] unless entity @s[nbt={PortalCooldown:0}] run function system:spells/wall/ray_move

# cooldown=0 OR collision=true
execute as @e[tag=Ray] if entity @s[nbt={PortalCooldown:0}] run function system:spells/wall/ray_finish
execute as @e[tag=Ray] at @s unless block ^ ^ ^1 #system:no_collision run function system:spells/wall/ray_finish
execute as @e[tag=Ray] at @s unless block ^1 ^ ^ #system:no_collision run function system:spells/wall/ray_finish

execute as @e[tag=WallCount] at @s unless entity @s[nbt={PortalCooldown:0}] run particle snowflake ~ ~ ~ 1 2 1 0.01 1 force
execute as @e[tag=WallCount,nbt={PortalCooldown:0}] run function system:spells/wall/delete_wall
