execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {Spell: {Name: "Fire"}}}}] at @s run function system:spells/fire/main

execute as @e[tag=Fireball,nbt={PortalCooldown:0}] run kill @s
execute as @e[tag=FireballTrail,nbt={PortalCooldown:0}] run kill @s

# カスタムタグつかえなくて泣いた
# execute as @e[tag=Fireball] run data modify entity @s Motion set from entity @s SavedMotion

execute as @e[tag=Fireball] store result entity @s Motion[0] double 0.01 run data get entity @s Pose.Head[0] 100
# execute as @e[tag=Fireball] store result entity @s Motion[1] double 1 run data get entity @s Pose.Head[1] 1
execute as @e[tag=Fireball] store result entity @s Motion[2] double 0.01 run data get entity @s Pose.Head[2] 100

execute as @e[tag=Fireball,nbt=!{OnGround:true}] run data modify entity @s Motion[1] set value -0.5d
execute as @e[tag=Fireball,nbt={OnGround:true}] run data modify entity @s Motion[1] set value 0.5d
# execute as @e[tag=Fireball,nbt={OnGround:true}] run say @s
