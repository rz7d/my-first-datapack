execute as @a[scores={CastDetector=1..},nbt={SelectedItem: {tag: {Spell: {Name: "Fire"}}}}] at @s run function system:spells/fire/main

# TODO: おかしい (FireballTrackerの生存時間はFireballと同じじゃないといけないけど個別に消してるのであとからバグる)
execute as @e[tag=Fireball,nbt={PortalCooldown:0}] run kill @s
execute as @e[tag=FireballTracker,nbt={PortalCooldown:0}] run kill @s


# for (fireball : fireballs) {
#     for (tracker : trackers) {
#         if (tracker.uuid0 == fireball.uuid0
#         && tracker.uuid1 == fireball.uuid1
#         && tracker.uuid2 == fireball.uuid2
#         && tracker.uuid3 == fireball.uuid3) {
#             // relationship: OK
#             return tracker;
#         }
#     }
# }
execute as @e[tag=Fireball] run function system:spells/fire/relation_tracker

# execute as @e[tag=Fireball] at @s run particle snowflake ~ ~ ~ 0 0 0 0.1 1


# TODO: 衝突時の処理
# execute as @e[tag=Fireball] at @s positioned ^ ^ ^1 unless block ~ ~ ~ #system:no_collision run kill @s

execute as @e[tag=Fireball] store result entity @s Motion[0] double 0.01 run scoreboard players get @s NextVelocityX
execute as @e[tag=Fireball] store result entity @s Motion[2] double 0.01 run scoreboard players get @s NextVelocityZ

# 1だと動かない
execute as @e[tag=Fireball,nbt={OnGround:true}] run data modify entity @s Motion[1] set value 0.4d
