# totalXp = 累積, neededXp = 次のレベルに必要な経験値, expTaken = 拾った経験値
# totalXp += expTaken;
# while (neededXp <= expTaken) { // expTaken が neededXp を上回っている (レベルが上げられる) 間
#       expTaken -= expNeeded; // 取得引く
#       ++level; // レベル上げる
#       expNeeded = recalculate(level) //
# }
# expNeeded -= expTaken; // 次のおつげ (needed) を事前に計算


scoreboard players set @s ExpTaken 0
execute as @s[tag=HasExpX1] store result score @s ExpTaken run clear @s nether_star{Exp: 1}

# x10, x100
execute as @s[tag=HasExpX10] store result score x10 Variables run clear @s nether_star{Exp: 10}
execute as @s[tag=HasExpX100] store result score x100 Variables run clear @s nether_star{Exp: 100}
scoreboard players operation x10 Variables *= #10 Constants
scoreboard players operation x100 Variables *= #100 Constants
scoreboard players operation @s ExpTaken += x10 Variables
scoreboard players operation @s ExpTaken += x100 Variables

scoreboard players operation LevelPrev Variables = @s Level

scoreboard players operation @s ExpTotal += @s ExpTaken

function system:status/experience/consume_xp

scoreboard players operation @s ExpNeeded -= @s ExpTaken

execute as @s[tag=LevelModified] run function resources:sounds/level_up
execute as @s[tag=LevelModified] run tellraw @a [{"selector": "@s", "bold": true, "color": "green"}, {"text": " がレベルアップ！", "bold": true, "color": "white"}, " ", {"score": {"name": "LevelPrev", "objective": "ExpTaken"}}, {"text": " → "}, {"score": {"name": "@s", "objective": "Level"}}]

tag @s remove LevelModified
scoreboard players reset x10 Variables
scoreboard players reset x100 Variables
