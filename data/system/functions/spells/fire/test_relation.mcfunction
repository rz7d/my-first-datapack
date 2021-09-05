execute if score @s UUID0 = Tmp UUID0 run tag @s add UUID0Matches
execute if score @s UUID1 = Tmp UUID1 run tag @s add UUID1Matches
execute if score @s UUID2 = Tmp UUID2 run tag @s add UUID2Matches
execute if score @s UUID3 = Tmp UUID3 run tag @s add UUID3Matches

tag @s[tag=UUID0Matches,tag=UUID1Matches,tag=UUID2Matches,tag=UUID3Matches] add Matched
tag @s remove UUID0Matches
tag @s remove UUID1Matches
tag @s remove UUID2Matches
tag @s remove UUID3Matches

# data modify entity @s[tag=Matched] Motion set from entity @e[tag=Relationship,limit=1] Motion

# Marker: true のとき不要
# execute as @s[tag=Matched] at @e[tag=Relationship,limit=1] run tp ^ ^-0.9875 ^
execute as @s[tag=Matched] at @e[tag=Relationship,limit=1] run tp ^ ^ ^

# data modify entity @s[tag=Matched] Pos set from entity @e[tag=Relationship,limit=1] Pos
# data modify entity @s[tag=Matched] Pos[0] set from entity @e[tag=Relationship,limit=1] Pos[0]
# data modify entity @s[tag=Matched] Pos[1] set from entity @e[tag=Relationship,limit=1] Pos[1]
# data modify entity @s[tag=Matched] Pos[2] set from entity @e[tag=Relationship,limit=1] Pos[2]
# execute as @s[tag=Matched] at @s run tp ~ ~ ~
# execute as @s[tag=Matched] at @s run say @s a

tag @s[tag=Matched] remove Matched
