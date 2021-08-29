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
execute store result score Yaw ScoreSpellWall run data get entity @s Rotation[1] 10
scoreboard players add Yaw ScoreSpellWall 1
scoreboard players remove Yaw ScoreSpellWall 1

scoreboard players operation Direction ScoreSpellWall /= #45 ScoreSpellWall
scoreboard players add Direction ScoreSpellWall 5
scoreboard players operation Direction ScoreSpellWall %= #8 ScoreSpellWall
scoreboard players remove Direction ScoreSpellWall 5
scoreboard players operation Direction ScoreSpellWall /= #2 ScoreSpellWall
scoreboard players operation Direction ScoreSpellWall *= #90 ScoreSpellWall
execute store result entity @s Rotation[0] float 1 run scoreboard players get Direction ScoreSpellWall

execute at @s run tp ~ ~ ~

execute store result score Direction ScoreSpellWall run data get entity @s Rotation[0] 1

execute at @s run function system:spells/wall/wall_create

# morph ray as break-timer
tag @s remove WallRay
tag @s add WallBreakTimer
data modify entity @s PortalCooldown set value 80

# clean-up
execute at @s run kill @e[tag=WallRayTrail,sort=nearest,limit=1]
