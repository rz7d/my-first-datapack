# ^1 の部分がそのままスピードになる
data merge entity @s {Pose: { Head: [0f, 0f, 0f] }}
execute at @s positioned ^ ^ ^2 run tp @e[tag=Cursor] ~ ~ ~
execute store result score CurrentPosX ScoreSpellFire run data get entity @s Pos[0] 100
# execute store result score CurrentPosY ScoreSpellFire run data get entity @s Pos[1] 100
execute store result score CurrentPosZ ScoreSpellFire run data get entity @s Pos[2] 100
execute store result score NextVelocityX ScoreSpellFire run data get entity @e[tag=Cursor,limit=1] Pos[0] 100
# execute store result score NextVelocityY ScoreSpellFire run data get entity @e[tag=Cursor,limit=1] Pos[1] 100
execute store result score NextVelocityZ ScoreSpellFire run data get entity @e[tag=Cursor,limit=1] Pos[2] 100
scoreboard players operation NextVelocityX ScoreSpellFire -= CurrentPosX ScoreSpellFire
# scoreboard players operation NextVelocityY ScoreSpellFire -= CurrentPosY ScoreSpellFire
scoreboard players operation NextVelocityZ ScoreSpellFire -= CurrentPosZ ScoreSpellFire

# Hacky スコアボード使ってるんだからスコアボードから復元すればいい気もする...
execute store result entity @s Pose.Head[0] float 0.01 run scoreboard players get NextVelocityX ScoreSpellFire
# execute store result entity @s Pose.Head[1] float 0.01 run scoreboard players get NextVelocityY ScoreSpellFire
execute store result entity @s Pose.Head[2] float 0.01 run scoreboard players get NextVelocityZ ScoreSpellFire

# デバッグ用 (100倍なので見づらい)
scoreboard players operation NextVelocityX ScoreSpellFire /= #100 Constants
# scoreboard players operation NextVelocityY ScoreSpellFire /= #100 Constants
scoreboard players operation NextVelocityZ ScoreSpellFire /= #100 Constants

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
