execute store result score TestingUUID0 Relationship run data get entity @s UUID[0]
execute store result score TestingUUID1 Relationship run data get entity @s UUID[1]
execute store result score TestingUUID2 Relationship run data get entity @s UUID[2]
execute store result score TestingUUID3 Relationship run data get entity @s UUID[3]

tag @s add Testing
execute as @e[tag=Tracker] run function system:base/tracking/test_relationship
tag @s remove Testing
