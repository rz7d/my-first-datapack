playsound minecraft:block.snow.place block @a ~ ~ ~ 1

execute at @s align xyz run tp ~ ~ ~

execute store result score PosX ScoreSpellWall run data get entity @s Pos[0] 10
execute store result score PosZ ScoreSpellWall run data get entity @s Pos[2] 10
scoreboard players add PosX ScoreSpellWall 5
scoreboard players add PosZ ScoreSpellWall 5
execute store result entity @s Pos[0] double 0.1 run scoreboard players get PosX ScoreSpellWall
execute store result entity @s Pos[2] double 0.1 run scoreboard players get PosZ ScoreSpellWall

# 回転を取得 → 設定する
data modify entity @s Rotation[1] set value 0F
execute store result score Direction ScoreSpellWall run data get entity @s Rotation[0] 1
execute store result score Yaw ScoreSpellWall run data get entity @s Rotation[1] 1

# to unsigned
scoreboard players add Yaw ScoreSpellWall 90

# 0 ~ 10 (-90 ~ -80), 170 ~ 180 (+80 ~ +90)
# 10 ~ 170 の範囲に clamp する
scoreboard players operation Yaw ScoreSpellWall < #10 Constants
scoreboard players operation Yaw ScoreSpellWall > #170 Constants

scoreboard players operation Up ScoreSpellWall = Yaw ScoreSpellWall
scoreboard players operation Up ScoreSpellWall -= #170 Constants


scoreboard players operation Direction ScoreSpellWall /= #45 Constants
scoreboard players operation Direction ScoreSpellWall %= #8 Constants
scoreboard players operation Direction ScoreSpellWall /= #2 Constants
execute store result entity @s Rotation[0] float 90 run scoreboard players get Direction ScoreSpellWall

execute at @s run tp ~ ~ ~

execute store result score Direction ScoreSpellWall run data get entity @s Rotation[0] 1

execute at @s run function system:spells/wall/wall_create

# morph ray as break-timer
tag @s remove WallRay
tag @s add WallBreakTimer
data modify entity @s PortalCooldown set value 80

# clean-up
execute at @s run kill @e[tag=WallRayTrail,sort=nearest,limit=1]
