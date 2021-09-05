function resources:sounds/spell_fireball_shoot

# Order-sensitive

# Motion Simulation
# Z-offset がそのままスピードになる
execute anchored eyes at @s run function system:base/motion/summon_simulator
execute at @s positioned ^ ^ ^0.5 run tp @e[tag=Cursor] ~ ~ ~
data modify entity @e[tag=MotionSimulator,tag=Immature,limit=1] Rotation set from entity @s Rotation
function system:base/motion/save_motion

tag @e[tag=MotionSimulator,tag=Immature,limit=1] add Fireball

# Entity Tracking
summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "minecraft:item", Item: {id: "minecraft:magma_cream", Count: 1}, PickupDelay: 32767s, HasVisualFire: true, Invulnerable: true, Silent: true, NoGravity: true}], PortalCooldown: 80, NoGravity: true, Invulnerable: true, Silent: true, Invisible: true, Marker: true, Tags: [FireballTracker, Tracker, Immature]}
function system:base/tracking/create_relationship

tag @e[tag=Fireball,tag=Immature,limit=1] remove Immature
tag @e[tag=FireballTracker,tag=Immature,limit=1] remove Immature
