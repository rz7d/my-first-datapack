summon minecraft:armor_stand ~ ~ ~ {PortalCooldown: 10, Marker: true, NoGravity: true, Invisible: true, Tags: [Ray, Immature], Silent: true}
execute as @e[tag=Ray,tag=Immature] run data modify entity @s Rotation set from entity @p[tag=Caster] Rotation
