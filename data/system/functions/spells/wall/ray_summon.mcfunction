summon minecraft:armor_stand ~ ~ ~ {PortalCooldown:40,Marker:true,Invulnerable:1b,NoGravity:true,Tags:[Ray]}
execute as @e[tag=Ray] at @s run data modify entity @s Rotation set from entity @p[distance=0,tag=SpellWall] Rotation
