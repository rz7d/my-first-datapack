scoreboard players set @s CastDetector1 0
tag @s add SpellWall
execute at @s[predicate=!system:is_shifted] positioned ^ ^1.65 ^ run function system:spells/wall/ray_summon
execute at @s[predicate=system:is_shifted] positioned ^ ^1.35 ^ run function system:spells/wall/ray_summon
execute as @e[tag=Ray] at @s run data modify entity @s[tag=RotateSync] Rotation set from entity @p[tag=SpellWall] Rotation
execute as @e[tag=Ray] run tag @s[tag=RotateSync] remove RotateSync

