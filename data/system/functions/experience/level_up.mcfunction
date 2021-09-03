scoreboard players add @s Level 1

# 計算式: https://minecraft.fandom.com/ja/wiki/%E7%B5%8C%E9%A8%93%E5%80%A4

# レベルに応じて変わるので この行は mandatory
scoreboard players operation @s ExpNeeded = @s Level

# 16レベルまで
execute if score @s Level matches ..16 run scoreboard players operation @s ExpNeeded *= #17 Constants

# 各レベルに合わせて計算
execute if score @s Level matches 17..29 run scoreboard players operation @s ExpNeeded *= #3 Constants
execute if score @s Level matches 17..29 run scoreboard players operation @s ExpNeeded -= #28 Constants
execute if score @s Level matches 30.. run scoreboard players operation @s ExpNeeded *= #7 Constants
execute if score @s Level matches 30.. run scoreboard players operation @s ExpNeeded -= #148 Constants

tag @s add LevelModified
