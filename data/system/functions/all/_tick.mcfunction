# User Calls
function system:status/_tick
function system:spell/_tick

# Library Calls
function system:base/motion/_tick
function system:base/timer/_tick
function system:base/tracking/_tick

# Debug: Kill immature entities
execute as @e[tag=Immature] run say Immature Entity Found: @s
kill @e[tag=Immature]
