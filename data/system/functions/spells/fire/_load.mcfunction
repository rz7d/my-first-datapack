scoreboard objectives add ScoreSpellFire dummy
scoreboard objectives add NextVelocityX dummy
scoreboard objectives add NextVelocityZ dummy
kill @e[tag=Cursor,type=armor_stand]
summon minecraft:armor_stand 0 0 0 {Invulnerable: true, Marker: true, NoGravity: true, Invisible: true, Tags: [Cursor]}
