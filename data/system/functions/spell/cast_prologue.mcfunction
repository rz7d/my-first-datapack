scoreboard players set @s CastDetector 0
execute if score @s ManaReq <= @s StatusMana run tag @s add Caster
execute as @s[tag=Caster] run scoreboard players operation @s StatusMana -= @s ManaReq

execute as @s[tag=!Caster] run scoreboard players operation @s ManaReq -= @s StatusMana
execute as @s[tag=!Caster] run function resources:messages/mana_not_enough

scoreboard players reset @s ManaReq
