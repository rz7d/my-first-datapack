tag @s[tag=Ray,tag=Immature] add WallRay

# TODO: Rewrite this with Relational Entity Tracking Framework
data merge entity @s[tag=WallRay] {Passengers: [{id: "minecraft:snowball", Tags: ["WallRayTrail"], Invulnerable: true, NoGravity: true, Silent: true}]}
data modify entity @s[tag=WallRay] PortalCooldown set value 5
tag @s[tag=Ray,tag=Immature] remove Immature
playsound minecraft:entity.snowball.throw player @a ~ ~ ~ 1 1
