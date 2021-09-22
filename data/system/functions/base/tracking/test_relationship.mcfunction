# OwnerUUID == EntityUUID の場合、両方のエンティティに同じ番号を振る
execute if score @s OwnerUUID0 = TestingUUID0 Relationship if score @s OwnerUUID1 = TestingUUID1 Relationship if score @s OwnerUUID2 = TestingUUID2 Relationship if score @s OwnerUUID3 = TestingUUID3 Relationship run tag @s add Matched
execute as @s[tag=Matched] run scoreboard players operation @s Relationship = Size Relationship
execute as @s[tag=Matched] run scoreboard players operation @e[tag=Testing,limit=1] Relationship = Size Relationship
execute as @s[tag=Matched] run scoreboard players add Size Relationship 1
tag @s remove Matched
