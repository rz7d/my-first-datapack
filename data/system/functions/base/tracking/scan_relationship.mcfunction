execute store result score TestingUUID0 Variables run data get entity @s UUID[0]
execute store result score TestingUUID1 Variables run data get entity @s UUID[1]
execute store result score TestingUUID2 Variables run data get entity @s UUID[2]
execute store result score TestingUUID3 Variables run data get entity @s UUID[3]

tag @s add Testing
execute as @e[tag=Tracker] run function system:base/tracking/test_relationship
tag @s remove Testing
