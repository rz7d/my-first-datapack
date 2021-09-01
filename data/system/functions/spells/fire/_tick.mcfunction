execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {Spell: {Name: "Fire"}}}}] at @s run function system:spells/fire/main

execute as @e[tag=Fireball,nbt={OnGround:true}] run data merge entity @s {Motion:[0d, 0.5d, 0.5d]}
execute as @e[tag=FireballTrail,nbt={PortalCooldown:0}] run kill @s
execute as @e[tag=Fireball,nbt={PortalCooldown:0}] run kill @s
