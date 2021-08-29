# Lifecycles
# Wall: Create
execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {spell: "wall"}}}] at @s run function system:spells/wall/main

# Raycast: Move
execute as @e[tag=WallRay,nbt=!{PortalCooldown: 0}] at @s run function system:spells/wall/raycast_move

# Raycast: Finish
execute as @e[tag=WallRay,nbt={PortalCooldown: 0}] at @s run function system:spells/wall/raycast_finish
execute as @e[tag=WallRay] at @s unless block ^ ^ ^1 #system:no_collision at @s run function system:spells/wall/raycast_finish
execute as @e[tag=WallRay] at @s unless block ^1 ^ ^ #system:no_collision at @s run function system:spells/wall/raycast_finish

# Wall: Tick
execute as @e[tag=WallBreakTimer,nbt=!{PortalCooldown: 0}] at @s run function system:spells/wall/wall_keep

# Wall: Dispose
execute as @e[tag=WallBreakTimer,nbt={PortalCooldown: 0}] at @s run function system:spells/wall/wall_dispose
