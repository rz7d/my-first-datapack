scoreboard players set @s ManaReq 2
function system:spell/cast_prologue
execute as @s[tag=Caster] at @s run function system:spell/fire/summon
function system:spell/cast_epilogue
