execute at @s if entity @p[tag=pMelee] run tag @s add Melee_Damaged

execute as @s[tag=Melee_Damaged] unless score @p[tag=pMelee] StatusAttack matches 0 store result score @s StatusAttack run scoreboard players get @p[tag=pMelee] StatusAttack
execute as @s[tag=Melee_Damaged] unless score @p[tag=pMelee] StatusAttack matches 0 unless data entity @p[tag=pMelee] SelectedItem.tag.EquipmentData[{Type:Weapon}].BaseDamage run scoreboard players operation @s StatusAttack /= #5 Constants
execute as @s[tag=Melee_Damaged] unless score @s StatusAttack matches 0 run function system:damage/mob/calcmelee

execute as @s[tag=Melee_Damaged] run tag @s remove Melee_Damaged
