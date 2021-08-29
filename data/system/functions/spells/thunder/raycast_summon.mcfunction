summon minecraft:armor_stand ~ ~ ~ {Passengers: [{id: "minecraft:snowball", Tags: ["WallRayTrail"], Invulnerable: true, NoGravity: true, Silent: true}], PortalCooldown: 10, Marker: true, NoGravity: true, Invisible: false, Tags: [WallRay, Immature], Silent: true}
execute as @e[tag=WallRay,tag=Immature] run data modify entity @s Rotation set from entity @p[tag=CasterWall] Rotation
execute as @e[tag=WallRay,tag=Immature] run tag @s remove Immature
