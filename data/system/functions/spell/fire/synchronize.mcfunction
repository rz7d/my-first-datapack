tag @s add SyncTarget

# TODO: 衝突判定
# TODO: 衝突時の処理
# execute as @e[tag=Fireball] at @s positioned ^ ^ ^ unless block ~ ~ ~ #system:no_collision run kill @s
# execute as @e[tag=Fireball] at @s positioned ^ ^ ^ if entity @e[tag=!Fireball] run kill @s

# PortalCooldown: 0 のときに消す
execute as @e[tag=SyncSource,nbt={PortalCooldown:0}] run kill @e[tag=SyncTarget]
execute as @e[tag=SyncSource,nbt={PortalCooldown:0}] at @s run kill @e[tag=FireballEffect,limit=1,sort=nearest]
execute as @e[tag=SyncSource,nbt={PortalCooldown:0}] run kill @s

# 位置同期
tp @s @e[tag=SyncSource,limit=1]

tag @s remove SyncTarget
