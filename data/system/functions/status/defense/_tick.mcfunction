# ダメージ計算用
execute as @a[nbt=!{ActiveEffects:[{Id:11b}]}] run effect give @s minecraft:resistance 1000000 4 true
execute as @a[nbt=!{ActiveEffects:[{Id:23b}]}] run effect give @s minecraft:saturation 1000000 4 true

# 被ダメ
# Damage TAKEN from hostiles
execute as @a[scores={Damage_Res=1..}] run function system:status/defense/damage_taken
