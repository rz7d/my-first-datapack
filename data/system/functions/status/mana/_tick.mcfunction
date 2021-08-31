# ぶらえん
# ManaがMaxより低い場合 ManaTimer +1
execute as @a if score @s Mana < @s ManaMax run scoreboard players add @s ManaTimer 1

# ManaTimer が ManaRegenWait を超えたら Mana += ManaRegen
execute as @a if score @s ManaTimer >= @s ManaRegenWait run scoreboard players operation @s Mana += @s ManaRegen
execute as @a if score @s ManaTimer >= @s ManaRegenWait run scoreboard players set @s ManaTimer 0

# validate mana
execute as @a run scoreboard players operation @s Mana < @s ManaMax
