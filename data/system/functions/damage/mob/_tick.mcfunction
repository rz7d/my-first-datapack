execute as @e[type=#minecraft:hostile_mobs,nbt={HurtTime:10s}] run function system:damage/mob/melee
#execute as @e[type=#system:hostile_mobs,nbt={HurtTime:10s}] run function system:damage_calc/mob/mark
#execute as @a if entity @s[tag=pBow] run function system:damage_calc/mob/sys/bow
#execute as @e[type=#system:hostile_mobs,nbt={HurtTime:10s}] store result score @s MobHealth run data get entity @s Health 10
#execute as @e[type=#system:hostile_mobs,nbt={HurtTime:10s}] store result score @s Custom_MaxHealth run data get entity @s Attributes[{Name:"minecraft:generic.max_health"}].Base 10



#MobのHPをチャットにだすやつ
#execute as @e[type=#system:hostile_mobs,nbt={HurtTime:10s}] at @s run tellraw @p [{"entity":"@s","nbt":"CustomName","interpret":true,"color":"aqua"},{"text":" -","color":"white"},{"text":" HP ","color":"light_purple"},{"score":{"name":"@s","objective":"MobHealth"},"color":"gold"},{"text":" / ","color":"white"},{"score":{"name":"@s","objective":"Custom_MaxHealth"},"color":"gold"}]
#execute as @e[type=#system:hostile_mobs,nbt={HurtTime:10s}] at @s run tellraw @p [{"entity":"@s","nbt":"CustomName","interpret":true,"color":"aqua"}]
#tellraw @p [{"text":"HP ","color":"light_purple"},{"score":{"name":"@s","objective":"MobHealth"}},{"text":" / "},{"score":{"name":"@s","objective":"Custom_MaxHealth"}}]

execute as @a[tag=pMelee] run tag @s remove pMelee
execute as @a[tag=pBow] run tag @s remove pBow
