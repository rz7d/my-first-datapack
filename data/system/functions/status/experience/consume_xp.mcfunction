# ループ
tag @s remove PendingLevelUp
execute if score @s ExpNeeded <= @s ExpTaken run tag @s add PendingLevelUp
execute as @s[tag=PendingLevelUp] run scoreboard players operation @s ExpTaken -= @s ExpNeeded
execute as @s[tag=PendingLevelUp] run function system:status/experience/level_up
execute as @s[tag=PendingLevelUp] run function system:status/experience/consume_xp
