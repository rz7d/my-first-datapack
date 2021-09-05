# execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "fireball", PickupDelay: 32767s, ExplosionPower: 0, NoGravity: true, Invulnerable: true, Silent: true, Tags: [FireballTrail], PortalCooldown: 60}], PortalCooldown: 60, NoGravity: false, Invisible: true, Invulnerable: true, Tags: [Fireball, Immature], Silent: true, Small: true}
# execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "snowball", NoGravity: true, Invulnerable: true, Silent: true, Tags: [FireballTrail], PortalCooldown: 60}], PortalCooldown: 60, NoGravity: false, Invisible: true, Invulnerable: true, Tags: [Fireball, Immature], Silent: true, Small: true}

playsound entity.snowball.throw player @a ~ ~ ~ 1 1
execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {PortalCooldown: 60, NoGravity: false, Invulnerable: true, Silent: true, Tags: [Fireball, Immature], Invisible: true, Small: true}

execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "minecraft:item", Item: {id: "minecraft:magma_cream", Count: 1}, PickupDelay: 32767s, HasVisualFire: true, Invulnerable: true, Silent: true, NoGravity: true, PortalCooldown: 60, Tags: [FireballTrail]}], PortalCooldown: 60, NoGravity: true, Invulnerable: true, Silent: true, Tags: [FireballTracker, Immature], Invisible: true, Small: true, Marker: true}
# うごく
# execute anchored eyes at @s run summon minecraft:magma_cube ~ ~ ~ {HasVisualFire: true, Size: 0, NoAI: true, PortalCooldown: 60, NoGravity: true, Invulnerable: true, Silent: true, Tags: [FireballTracker, Immature]}

# UUID を紐付ける
execute as @e[tag=Fireball,tag=Immature] store result score @e[tag=FireballTracker,tag=Immature,limit=1] UUID0 run data get entity @s UUID[0]
execute as @e[tag=Fireball,tag=Immature] store result score @e[tag=FireballTracker,tag=Immature,limit=1] UUID1 run data get entity @s UUID[1]
execute as @e[tag=Fireball,tag=Immature] store result score @e[tag=FireballTracker,tag=Immature,limit=1] UUID2 run data get entity @s UUID[2]
execute as @e[tag=Fireball,tag=Immature] store result score @e[tag=FireballTracker,tag=Immature,limit=1] UUID3 run data get entity @s UUID[3]

# できない
# data modify entity @e[tag=Fireball,tag=Immature,limit=1] Tags[2] set from entity @e[tag=Fireball,tag=Immature,limit=1] UUID
# data modify entity @e[tag=FireballTracker,tag=Immature,limit=1] Tags[2] set from entity @e[tag=Fireball,tag=Immature,limit=1] UUID

data modify entity @e[tag=Fireball,tag=Immature,limit=1] Rotation set from entity @s Rotation
execute as @e[tag=Fireball,tag=Immature] run function system:spells/fire/save_motion

tag @e[tag=Fireball,tag=Immature,limit=1] remove Immature
tag @e[tag=FireballTracker,tag=Immature,limit=1] remove Immature

# tellraw @a {"score": {"name": "Direction", "objective": "ScoreSpellFire"}}
# tellraw @a {"score": {"name": "IsOblique", "objective": "ScoreSpellFire"}}

