execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {Spell: {Name: "Fire"}}}}] at @s run function system:spell/fire/main

# see synchronize.mcfunction
# TODO: おかしい (FireballTrackerの生存時間はFireballと同じじゃないといけないけど個別に消してるのであとからバグる)
# execute as @e[tag=Fireball,nbt={PortalCooldown:0}] run kill @s
# execute as @e[tag=FireballTracker,nbt={PortalCooldown:0}] run kill @s
# execute as @e[tag=FireballTrail,nbt={PortalCooldown:0}] run kill @s

# 着地したら跳ねる
execute as @e[tag=Fireball,nbt={OnGround:true}] run data modify entity @s Motion[1] set value 0.4d

# 位置・生存情報などを同期
execute as @e[tag=Fireball] if score @s Relationship matches 1.. run function system:spell/fire/foreach_relation
