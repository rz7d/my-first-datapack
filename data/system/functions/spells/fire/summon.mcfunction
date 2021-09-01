# execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "fireball", PickupDelay: 32767s, ExplosionPower: 0, NoGravity: true, Invulnerable: true, Silent: true, Tags: [FireballTrail], PortalCooldown: 60}], PortalCooldown: 60, NoGravity: false, Invisible: true, Invulnerable: true, Tags: [Fireball, Immature], Silent: true, Small: true}
execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "snowball", NoGravity: true, Invulnerable: true, Silent: true, Tags: [FireballTrail], PortalCooldown: 60}], PortalCooldown: 60, NoGravity: false, Invisible: true, Invulnerable: true, Tags: [Fireball, Immature], Silent: true, Small: true}
playsound entity.snowball.throw player @a ~ ~ ~ 1 1
# execute anchored eyes at @s run summon minecraft:armor_stand ~ ~ ~ {PortalCooldown: 60, NoGravity: false, Invulnerable: true, Silent: true, Tags: [Fireball, Immature], Invisible: true, Small: true}
# execute anchored eyes at @s run summon minecraft:snowball ~ ~ ~ {PortalCooldown: 60, NoGravity: true, Invulnerable: true, Silent: true, Tags: ["FireballTrail"]}
data modify entity @e[tag=Fireball,tag=Immature,limit=1] Rotation set from entity @s Rotation
execute as @e[tag=Fireball,tag=Immature] run function system:spells/fire/save_motion

tag @e[tag=Fireball,tag=Immature,limit=1] remove Immature

# tellraw @a {"score": {"name": "Direction", "objective": "ScoreSpellFire"}}
# tellraw @a {"score": {"name": "IsOblique", "objective": "ScoreSpellFire"}}

