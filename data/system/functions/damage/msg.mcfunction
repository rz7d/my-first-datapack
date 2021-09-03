execute as @s[scores={Critical=1..}] run tellraw @s ["",{"score":{"name":"@s","objective":"Damage_Res"},"bold":true,"color":"#e34848"},{"text":" ダメージ"},{"text":" ||| 残りHP : "},{"score":{"name":"@s","objective":"StatusHealth"},"bold":true,"color":"#FDA8FD"}]
#execute if score @s Damage_Res matches 1.. if score @s Critical matches 0 run tellraw @s ["",{"score":{"name":"@s","objective":"Damage_Res"},"bold":true,"color":"#e34848"},{"text":" ダメージ"},{"text":" クリティカルヒット","bold":true,"color":"dark_red"},{"text":"(被ダメージ1.5倍)"},{"text":" ||| 残りHP : "},{"score":{"name":"@s","objective":"Custom_Health"},"bold":true,"color":"#FDA8FD"}]
execute as @s[scores={Critical=0}] run tellraw @s ["",{"score":{"name":"@s","objective":"Damage_Res"},"bold":true,"color":"#e34848"},{"text":" ダメージ"},{"text":" クリティカルヒット","bold":true,"color":"dark_red"},{"text":" ||| 残りHP : "},{"score":{"name":"@s","objective":"StatusHealth"},"bold":true,"color":"#FDA8FD"}]
execute as @s[scores={TrueDamage=1..}] run tellraw @s ["",{"text":"┗ +"},{"score":{"name":"@s","objective":"TrueDamage"},"bold":true},{"text":" ダメージ(防御貫通)"}]