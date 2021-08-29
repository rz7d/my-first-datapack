data merge entity @s[tag=Ray,tag=Immature] {Passengers: [{id: "minecraft:snowball", Tags: ["WallRayTrail"], Invulnerable: true, NoGravity: true, Silent: true}]}
tag @s[tag=Ray,tag=Immature] add WallRay
tag @s[tag=Ray,tag=Immature] remove Immature
playsound minecraft:entity.snowball.throw player @a ~ ~ ~ 1 1
