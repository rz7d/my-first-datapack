scoreboard players set @s ManaReq 10
function system:spell/cast_prologue
execute as @s[tag=Caster] run function raylib:raycast
execute as @s[tag=Caster] as @e[tag=Ray,tag=Immature] run function system:spell/wall/ray/summoning
function system:spell/cast_epilogue
