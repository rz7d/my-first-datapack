scoreboard players set @s ManaReq 2
function system:spells/cast_prologue
execute as @s[tag=Caster] at @s run function system:spells/fire/summon
function system:spells/cast_epilogue
