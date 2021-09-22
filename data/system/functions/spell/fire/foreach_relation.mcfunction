scoreboard players operation RelationId Variables = @s Relationship
tag @s add SyncSource
execute as @e[tag=FireballTracker] if score @s Relationship = RelationId Variables run function system:spell/fire/synchronize
tag @s remove SyncSource
