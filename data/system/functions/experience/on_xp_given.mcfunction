# TODO: ExpGiven はこの中でしか使わないのでどうにかする

scoreboard players set @s ExpGiven 0
execute as @s[tag=HasExpX1] store result score @s ExpGiven run clear @s nether_star{Exp:1}
execute as @s[tag=HasExpX10] store result score x10 ExpGiven run clear @s nether_star{Exp:10}
execute as @s[tag=HasExpX100] store result score x100 ExpGiven run clear @s nether_star{Exp:100}

# has(ExpX1) || has(ExpX10) || has(ExpX100)
# ||
#
# execute as @a[nbt={Inventory:[{tag:{Exp:1}}]}] store success score @s ExpGiven run clear @s nether_star{Exp:1} 0
# execute as @a[scores={ExpGiven=0},nbt={Inventory:[{tag:{Exp:10}}]}] store success score @s ExpGiven run clear @s nether_star{Exp:10} 0
# execute as @a[scores={ExpGiven=0},nbt={Inventory:[{tag:{Exp:100}}]}] store success score @s ExpGiven run clear @s nether_star{Exp:100} 0

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


# totalXp = ～～; # 累積
# neededXp = 10000; # 次のレベルに必要な経験値
# expGiven = 20000; # 拾った経験値
# totalXp += expGiven;
# expGiven が neededXp を上回っている (レベルが上げられる) 間
# while (neededXp <= expGiven) {
#       ++level; // レベル上げる
#       expGiven -= expNeeded; // 取得引く
#       expNeeded = recalculate(level) //
# }
# expNeeded -= expGiven; // 次のおつげ (needed) を事前に計算

