execute as @e[tag=Ray] unless entity @s[nbt={PortalCooldown:0}] run function system:spells/wall/ray_move

# cooldown=0 OR collision=true
execute as @e[tag=Ray] if entity @s[nbt={PortalCooldown:0}] run function system:spells/wall/ray_finish
execute as @e[tag=Ray] unless block ~ ~ ~ #system:no_collision run function system:spells/wall/ray_finish
