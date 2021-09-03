scoreboard players set ExpGiven
execute as @s[tag=HasExpX1] store result score @s ExpGiven run clear @s nether_star{Exp:1} 0
execute as @s[tag=HasExpX10] store result score x10 ExpGiven run clear @s nether_star{Exp:10} 0
execute as @s[tag=HasExpX100] store result score x100 ExpGiven run clear @s nether_star{Exp:100} 0

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

function system:experience/consume_xp

execute as @s[tag=PendingLevelUp] run scoreboard players operation @s ExpNeeded -= @s ExpGiven

tellraw @a [{"selector": "@s", "bold": true, "color": "green"}, {"text": " がレベルアップ！", "bold": true}, {"score": {"name": "LevelPrev", "objective": "ExpGiven"}}, {"text": " → "}, {"score": {"name": "@s", "objective": "Level"}}]

scoreboard players reset x10 ExpGiven
scoreboard players reset x100 ExpGiven

scoreboard players



# totalXp = ～～; # 累積
# neededXp = 10000; # 次のレベルに必要な経験値
# expGiven = 20000; # 拾った経験値
# totalXp += expGiven;
# expGiven が neededXp を上回っている間
# while (neededXp <= expGiven) {
#       ++level; // レベル上げる
#       expGiven -= expNeeded; // 取得引く
#       expNeeded = recalculate(level) //
# }
# expNeeded -= expGiven; // 取得引く

