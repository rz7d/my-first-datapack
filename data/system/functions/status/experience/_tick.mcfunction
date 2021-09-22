execute as @a[nbt={Inventory:[{tag:{Exp:1}}]}] run tag @s add HasExpX1
execute as @a[nbt={Inventory:[{tag:{Exp:10}}]}] run tag @s add HasExpX10
execute as @a[nbt={Inventory:[{tag:{Exp:100}}]}] run tag @s add HasExpX100

tag @a[tag=HasExpX1] add HasExp
tag @a[tag=HasExpX10] add HasExp
tag @a[tag=HasExpX100] add HasExp

execute as @a[tag=HasExp] run function system:status/experience/on_xp_gathered

tag @a[tag=HasExpX1] remove HasExpX1
tag @a[tag=HasExpX10] remove HasExpX10
tag @a[tag=HasExpX100] remove HasExpX100

tag @a[tag=HasExp] remove HasExp
