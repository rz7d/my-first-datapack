scoreboard players set @s CastDetector 0
execute if score @s ManaReq <= @s StatusMana run tag @s add Caster
execute as @s[tag=Caster] run scoreboard players operation @s StatusMana -= @s ManaReq

# Mana 不足のときのメッセージ
execute as @s[tag=!Caster] run scoreboard players operation @s ManaReq -= @s StatusMana
execute as @s[tag=!Caster] run tellraw @s [{"score": {"name":"@s","objective":"ManaReq"}, "bold": true, "color": "red"},{"text":" Mana ","bold":true,"color":"aqua"},{"text":"不足しています","bold":true,"color":"white"}]

scoreboard players reset @s ManaReq


# ManaReq MP10 / ManaReq < StatusMana / StatusMana -= ManaReq
