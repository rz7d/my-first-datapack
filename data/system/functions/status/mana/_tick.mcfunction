# 回復量のデフォルト値と Tier 0 でも使える
scoreboard players set @a ManaRegen 1
scoreboard players set @a ManaRegenWait 60

execute as @a[nbt={Inventory: [{Slot: 17b, tag: {EquipmentData: [{Effects: [{Type: "Mana"}]}]}}]}] run tag @s add HasManaAccessory
execute as @a[nbt={Inventory: [{Slot: 17b, tag: {EquipmentData: [{Effects: [{Type: "Mana", Value: { RegenInterval: {}, RegenScaledByCapacity: { Value: true }}}]}]}}]}] run tag @s add ScaledByCapacity
execute as @a[nbt={Inventory: [{Slot: 17b, tag: {EquipmentData: [{Effects: [{Type: "Mana", Value: { RegenInterval: {}, RegenScaledByCapacity: { Value: false }}}]}]}}]}] run tag @s add ScaledByCapacity

execute as @a[tag=HasManaAccessory] if score #Slot1 ManaRegenWait <= #0 Constants store result score #Slot1 ManaRegenWait run data get entity @s Inventory[{Slot: 17b}].tag.ManaAccessory.RegenInterval 1
execute as @a[tag=HasManaAccessory] if score #Slot2 ManaRegenWait <= #0 Constants store result score #Slot2 ManaRegenWait run data get entity @s Inventory[{Slot: 26b}].tag.ManaAccessory.RegenInterval 1
execute as @a[tag=HasManaAccessory] if score #Slot3 ManaRegenWait <= #0 Constants store result score #Slot3 ManaRegenWait run data get entity @s Inventory[{Slot: 35b}].tag.ManaAccessory.RegenInterval 1
execute as @a[tag=HasManaAccessory] run scoreboard players operation @s ManaRegenWait = #Slot1 ManaRegenWait
execute as @a[tag=HasManaAccessory] run scoreboard players operation @s ManaRegenWait < #Slot2 ManaRegenWait
execute as @a[tag=HasManaAccessory] run scoreboard players operation @s ManaRegenWait < #Slot3 ManaRegenWait

execute as @a[tag=HasManaAccessory] store result score @s ManaRegenPercent run data get entity @s Inventory[{Slot: 17b}].tag.ManaAccessory.RegenAdvantage 1
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players set @s ManaRegenDivider 100
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players operation @s ManaRegenDivider /= @s ManaRegenPercent
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players operation @s ManaRegen = @s StatusManaMax
execute as @a[tag=HasManaAccessory] if score @s ManaRegenPercent > #0 Constants run scoreboard players operation @s ManaRegen /= @s ManaRegenDivider



tag @a remove HasManaAccessory









# ぶらえん
# ManaがMaxより低い場合 ManaTimer +1
execute as @a if score @s StatusMana < @s StatusManaMax run scoreboard players add @s ManaTimer 1

# ManaTimer が ManaRegenWait を超えたら Mana += ManaRegen
execute as @a if score @s ManaTimer >= @s ManaRegenWait run scoreboard players operation @s StatusMana += @s ManaRegen
execute as @a if score @s ManaTimer >= @s ManaRegenWait run scoreboard players set @s ManaTimer 0

# validate mana
execute as @a run scoreboard players operation @s StatusMana < @s StatusManaMax
