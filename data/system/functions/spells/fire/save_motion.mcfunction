# Z-offset がそのままスピードになる
execute at @s positioned ^ ^ ^0.5 run tp @e[tag=Cursor] ~ ~ ~
execute store result score CurrentPosX ScoreSpellFire run data get entity @s Pos[0] 100
execute store result score CurrentPosZ ScoreSpellFire run data get entity @s Pos[2] 100
execute store result score @s NextVelocityX run data get entity @e[tag=Cursor,limit=1] Pos[0] 100
execute store result score @s NextVelocityZ run data get entity @e[tag=Cursor,limit=1] Pos[2] 100
scoreboard players operation @s NextVelocityX -= CurrentPosX ScoreSpellFire
scoreboard players operation @s NextVelocityZ -= CurrentPosZ ScoreSpellFire

# ↓こんなことしなくても positioned で奥 (z+1) を計算したあとスコアボードにぶちこんで引き算で良かった↓
# execute store result score Direction ScoreSpellFire run data get entity @s[tag=Fireball] Rotation[0]

# # 45でわる (8角度)
# scoreboard players operation Direction ScoreSpellFire /= #45 Constants

# # 符号なし
# scoreboard players add Direction ScoreSpellFire 4

# # 思いついたので書く 45で割って奇数の場合斜め
# scoreboard players operation IsOblique ScoreSpellFire = Direction ScoreSpellFire
# scoreboard players operation IsOblique ScoreSpellFire %= #2 Constants

# # d=7 same as d=0
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #0 Constants run data modify entity @s Motion set value [0d, 0d, -1d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #1 Constants run data modify entity @s Motion set value [1d, 0d, -1d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #2 Constants run data modify entity @s Motion set value [1d, 0d, 0d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #3 Constants run data modify entity @s Motion set value [1d, 0d, 1d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #4 Constants run data modify entity @s Motion set value [0d, 0d, 1d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #5 Constants run data modify entity @s Motion set value [-1d, 0d, 1d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #6 Constants run data modify entity @s Motion set value [-1d, 0d, 0d]
# execute as @s[tag=Fireball] if score Direction ScoreSpellFire = #7 Constants run data modify entity @s Motion set value [-1d, 0d, -1d]
