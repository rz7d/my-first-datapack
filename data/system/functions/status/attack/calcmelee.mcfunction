execute store result score @s MobHealth run data get entity @s Health 10
# execute as @s run function system:damage_calc/mob/mark
tellraw @a [{"text":"beforeMOBHP : "},{"score":{"name":"@s","objective":"MobHealth"}}]
function system:damage/mob/random
#クリティカルの判定
execute store result score @s Critical run function system:random/random
execute run scoreboard players operation @s Critical %= #20 Constants
###0ならCriticalでダメージを1.5倍 0~19

execute if score @s Critical matches 0 run scoreboard players add @s StatusAttack 20
execute if score @s Critical matches 1 run scoreboard players add @s StatusAttack 30
execute if score @s Critical matches 0..1 run scoreboard players set @s Critical 0
execute if score @s Critical matches 0 run scoreboard players operation @s StatusAttack *= #15 Constants
execute if score @s Critical matches 0 run scoreboard players operation @s StatusAttack /= #10 Constants
execute if score @s Critical matches 0 at @s if entity @s[type=!silverfish] run particle minecraft:block minecraft:redstone_block ~ ~1 ~ 0 0.3 0 2 40 force
execute if score @s Critical matches 0 at @s if entity @s[type=silverfish] run particle minecraft:block minecraft:redstone_block ~ ~0.2 ~ 0 0.1 0 2 40 force
execute if score @s Critical matches 0 at @s run playsound minecraft:entity.player.attack.sweep master @a ~ ~ ~ 1 2

execute if data entity @s ActiveEffects[{Id:11b}].Amplifier run function system:damage/mob/rescalc

#武器を持っていない場合のダメージ減少処理
scoreboard players operation @s MobHealth -= @s StatusAttack
tellraw @a [{"text":"afterMOBHP : "},{"score":{"name":"@s","objective":"MobHealth"}}]
execute if score @s MobHealth matches ..0 run function system:damage/mob/deathvoice
execute if score @s MobHealth matches 1.. store result entity @s Health float 0.1 run scoreboard players get @s MobHealth
scoreboard players set @s StatusAttack 0
