execute at @s[type=zombie] run playsound entity.zombie.death hostile @a ~ ~ ~ 0.8
execute at @s[type=skeleton] run playsound entity.skeleton.death hostile @a ~ ~ ~ 0.8
execute at @s[type=wither_skeleton] run playsound entity.skeleton.death hostile @a ~ ~ ~ 0.8
execute at @s[type=spider] run playsound entity.spider.death hostile @a ~ ~ ~ 0.8

#scoreboard players add @p MobKillCount 1
kill @s
