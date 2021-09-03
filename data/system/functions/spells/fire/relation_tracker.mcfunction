execute store result score Tmp UUID0 run data get entity @s UUID[0]
execute store result score Tmp UUID1 run data get entity @s UUID[1]
execute store result score Tmp UUID2 run data get entity @s UUID[2]
execute store result score Tmp UUID3 run data get entity @s UUID[3]

tag @s add Relationship
execute as @e[tag=FireballTracker] run function system:spells/fire/test_relation
tag @s remove Relationship
