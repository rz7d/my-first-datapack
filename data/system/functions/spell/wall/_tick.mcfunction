execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {Spell: {Name: "Wall"}}}}] at @s run function system:spell/wall/main

execute as @e[tag=WallRay,tag=Ray] at @s run function system:spell/wall/ray/moving
execute as @e[tag=WallRay,tag=RayTimedOut] at @s run function system:spell/wall/ray/finished
execute as @e[tag=WallRay,tag=RayFinished] at @s run function system:spell/wall/ray/finished

execute as @e[tag=WallBreakTimer,nbt=!{PortalCooldown: 0}] at @s run function system:spell/wall/wall_keep
execute as @e[tag=WallBreakTimer,nbt={PortalCooldown: 0}] at @s run function system:spell/wall/wall_dispose
