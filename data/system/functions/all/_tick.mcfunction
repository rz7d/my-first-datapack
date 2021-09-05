# User Calls
function system:timer/_tick
function system:status/_tick
function system:experience/_tick
function system:damage/_tick

function system:spells/_tick

# ダメージ計算用
execute as @a[nbt=!{ActiveEffects:[{Id:11b}]}] run effect give @s minecraft:resistance 1000000 4 true
execute as @a[nbt=!{ActiveEffects:[{Id:23b}]}] run effect give @s minecraft:saturation 1000000 4 true

# Debug: Kill immature entities
execute as @e[tag=Immature] run say Immature Entity Found: @s
kill @e[tag=Immature]
