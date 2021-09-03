# totalXp = 累積, neededXp = 次のレベルに必要な経験値, expGiven = 拾った経験値
# totalXp += expGiven;
# while (neededXp <= expGiven) { // expGiven が neededXp を上回っている (レベルが上げられる) 間
#       expGiven -= expNeeded; // 取得引く
#       ++level; // レベル上げる
#       expNeeded = recalculate(level) //
# }
# expNeeded -= expGiven; // 次のおつげ (needed) を事前に計算


scoreboard players set @s ExpGiven 0
execute as @s[tag=HasExpX1] store result score @s ExpGiven run clear @s nether_star{Exp: 1}
execute as @s[tag=HasExpX10] store result score x10 ExpGiven run clear @s nether_star{Exp: 10}
execute as @s[tag=HasExpX100] store result score x100 ExpGiven run clear @s nether_star{Exp: 100}

scoreboard players operation x10 ExpGiven *= #10 Constants
scoreboard players operation x100 ExpGiven *= #100 Constants
scoreboard players operation @s ExpGiven += x10 ExpGiven
scoreboard players operation @s ExpGiven += x100 ExpGiven

scoreboard players operation LevelPrev ExpGiven = @s Level

scoreboard players operation @s ExpTotal += @s ExpGiven

function system:experience/consume_xp

scoreboard players operation @s ExpNeeded -= @s ExpGiven

execute as @s[tag=LevelModified] run function system:sound/level_up
execute as @s[tag=LevelModified] run tellraw @a [{"selector": "@s", "bold": true, "color": "green"}, {"text": " がレベルアップ！", "bold": true, "color": "white"}, " ", {"score": {"name": "LevelPrev", "objective": "ExpGiven"}}, {"text": " → "}, {"score": {"name": "@s", "objective": "Level"}}]

tag @s remove LevelModified
scoreboard players reset x10 ExpGiven
scoreboard players reset x100 ExpGiven
