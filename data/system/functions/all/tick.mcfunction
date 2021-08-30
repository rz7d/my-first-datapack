# User Calls
function system:timer/_tick
function system:status/_tick
function system:spells/_tick


# Debug: Kill immature entities
execute as @e[tag=Immature] run say Immature Entity Found: @s
kill @e[tag=Immature]
