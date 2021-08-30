# Tier 0 (アクセサリ持ってない人)
execute as @a[nbt={Inventory:[{Slot: 17b, tag: {ManaAccessory: {}}}]}] run tag @s add HasManaAccessory

scoreboard players set @a ManaRegen 1
execute as @a[tag=!HasManaAccessory] run scoreboard players set @s ManaRegenWait 60

# {tag: {ManaAccessory: {"Tier": 1, "Timer": 45}
# {tag: {ManaAccessory: {"Tier": 2, "Timer": 30}
# {tag: {ManaAccessory: {"Tier": 3, "Timer": 15}
# {tag: {ManaAccessory: {"Tier": 4, "Timer": 5, "RegenAdvantage": 2}
execute as @a[tag=HasManaAccessory] store result score @s ManaRegenWait run data get entity @s Inventory[{Slot: 17b}].tag.ManaAccessory.RegenInterval 1

execute as @a[tag=HasManaAccessory] store result score @s ManaRegenPercent run data get entity @s Inventory[{Slot: 17b}].tag.ManaAccessory.RegenAdvantage 1
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players set @s ManaRegenDivider 100
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players operation @s ManaRegenDivider /= @s ManaRegenPercent
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players operation @s ManaRegen = @s ManaMax
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players operation @s ManaRegen /= @s ManaRegenDivider

#ぶらえん
#ManaがMaxより低い場合 ManaTimer +1
execute as @a if score @s Mana < @s ManaMax run scoreboard players add @s ManaTimer 1
#ManaTimerがManaRegenTierに満たしていたら Mana +ManaRegen

execute as @a if score @s ManaTimer >= @s ManaRegenWait run scoreboard players operation @s Mana += @s ManaRegen
execute as @a if score @s ManaTimer >= @s ManaRegenWait run scoreboard players set @s ManaTimer 0

# validate mana
execute as @a run scoreboard players operation @s Mana < @s ManaMax

tag @a remove HasManaAccessory
