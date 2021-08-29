function system:spells/wall/_tick

# Debug: Kill immature entities
execute as @e[tag=Immature] run say IMMATURE ENTITY FOUND: @s
kill @e[tag=Immature]
