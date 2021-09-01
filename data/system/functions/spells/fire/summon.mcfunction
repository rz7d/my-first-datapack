summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "snowball", NoGravity: true, Invulnerable: true, Silent: true, HasVisualFire: false, Tags: ["FireballTrail"], PortalCooldown: 60}], PortalCooldown: 60, NoGravity: false, Invisible: false, Invulnerable: true, Tags: [Fireball, Immature], Silent: true}
data modify entity @e[tag=Fireball,tag=Immature,limit=1] Rotation set from entity @s Rotation
tag @e[tag=Fireball,tag=Immature,limit=1] remove Immature

execute as @e[tag=Fireball,tag=Immature] run function system:spells/fire/set_motion
tellraw @a {"score": {"name": "Direction", "objective": "ScoreSpellFire"}}
# tellraw @a {"score": {"name": "IsOblique", "objective": "ScoreSpellFire"}}
