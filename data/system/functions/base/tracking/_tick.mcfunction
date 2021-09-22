# scoreboard objectives remove Relationship
# scoreboard objectives add Relationship dummy
# scoreboard objectives setdisplay sidebar Relationship
scoreboard players set Size Relationship 0
execute as @e[tag=Trackable] run function system:base/tracking/scan_relationship
