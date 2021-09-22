scoreboard players operation Current Relationship = @s Relationship
tag @s add SyncSource
execute as @e[tag=FireballTracker] if score @s Relationship = Current Relationship run function system:spell/fire/synchronize
tag @s remove SyncSource
