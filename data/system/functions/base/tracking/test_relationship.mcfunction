# OwnerUUID == EntityUUID の場合、両方のエンティティに同じ番号を振る
execute if score @s OwnerUUID0 = TestingUUID0 Variables if score @s OwnerUUID1 = TestingUUID1 Variables if score @s OwnerUUID2 = TestingUUID2 Variables if score @s OwnerUUID3 = TestingUUID3 Variables run tag @s add Matched
execute as @s[tag=Matched] run scoreboard players operation @s Relationship = NextId Relationship
execute as @s[tag=Matched] run scoreboard players operation @e[tag=Testing,limit=1] Relationship = NextId Relationship
execute as @s[tag=Matched] run scoreboard players add NextId Relationship 1
tag @s remove Matched
