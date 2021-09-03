# TODO: ループ
tag @s remove PendingLevelUp
execute if score @s ExpNeeded <= @s ExpGiven run tag @s add PendingLevelUp
execute as @s[tag=PendingLevelUp] run scoreboard players operation @s ExpGiven -= @s ExpNeeded
execute as @s[tag=PendingLevelUp] run function system:experience/level_up
execute as @s[tag=PendingLevelUp] run function system:experience/consume_xp
