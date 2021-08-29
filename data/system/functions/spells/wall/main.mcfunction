# @s = Player
scoreboard players set @s CastDetector 0

tag @s add CasterWall
execute at @s run playsound minecraft:entity.snowball.throw player @a ~ ~ ~ 1 1
execute at @s[predicate=!system:is_shifted] positioned ^ ^1.65 ^ run function system:spells/wall/raycast_summon
execute at @s[predicate=system:is_shifted] positioned ^ ^1.35 ^ run function system:spells/wall/raycast_summon
tag @s[tag=CasterWall] remove CasterWall
