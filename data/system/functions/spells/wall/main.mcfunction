scoreboard players set @s ManaReq 10
function system:spells/cast_prologue
execute as @s[tag=Caster] run function raylib:raycast
execute as @s[tag=Caster] as @e[tag=Ray,tag=Immature] run function system:spells/wall/ray/summoning
function system:spells/cast_epilogue



# ManaReq MP10 / ManaReq < Mana / Mana -= ManaReq
