execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {Spell: {Name: "Fire"}}}}] at @s run function system:spells/fire/main

execute as @e[tag=Fireball,nbt={PortalCooldown:0}] run kill @s
execute as @e[tag=FireballTrail,nbt={PortalCooldown:0}] run kill @s


# TODO: 衝突時の処理
# execute as @e[tag=Fireball] at @s positioned ^ ^ ^1 unless block ~ ~ ~ #system:no_collision run kill @s

execute as @e[tag=Fireball] store result entity @s Motion[0] double 0.01 run scoreboard players get @s NextVelocityX
execute as @e[tag=Fireball] store result entity @s Motion[2] double 0.01 run scoreboard players get @s NextVelocityZ
execute as @e[tag=Fireball] run data modify entity @s Motion[1] set value -1d

execute as @e[tag=Fireball,nbt={OnGround:true}] run data modify entity @s Motion[1] set value 0.5d
