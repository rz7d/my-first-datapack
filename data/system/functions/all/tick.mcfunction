function system:ray/_tick
function system:spells/wall/_tick

# Debug: Kill immature entities
execute as @e[tag=Immature] run say Immature Entity Found: @s
kill @e[tag=Immature]
