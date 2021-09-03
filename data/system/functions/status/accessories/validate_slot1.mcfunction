# HasAccessory = Accessory をスロット 1 に置いている人
# EffectSaved = ステータス処理済み
# AccessorySwapped = Accessory 変更時の比較
execute as @a unless data entity @s Inventory[{Slot: 17b}].tag.EquipmentData[{Type: "Accessory"}] run tag @s remove HasAccessory
execute as @a[tag=!HasAccessory] if data entity @s Inventory[{Slot: 17b}].tag.EquipmentData[{Type: "Accessory"}] run tag @s add HasAccessory
# 装備してたら代入する
execute as @a[tag=HasAccessory,tag=!EffectSaved] store result score @s AccHPNext run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Health
execute as @a[tag=HasAccessory,tag=!EffectSaved] store result score @s AccMPNext run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Mana
execute as @a[tag=HasAccessory,tag=!EffectSaved] store result score @s AccAtkNext run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Attack
execute as @a[tag=HasAccessory,tag=!EffectSaved] store result score @s AccDefNext run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Defense
execute as @a[tag=HasAccessory,tag=!EffectSaved] store result score @s AccIntNext run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Intelligence

# 反映
execute as @a[tag=!EffectSaved,scores={AccHPNext=1..}] run scoreboard players operation @s StatusHealthMax += @s AccHPNext
execute as @a[tag=!EffectSaved,scores={AccMPNext=1..}] run scoreboard players operation @s StatusManaMax += @s AccMPNext
execute as @a[tag=!EffectSaved,scores={AccAtkNext=1..}] run scoreboard players operation @s StatusAttack += @s AccAtkNext
execute as @a[tag=!EffectSaved,scores={AccDefNext=1..}] run scoreboard players operation @s StatusDefense += @s AccDefNext
execute as @a[tag=!EffectSaved,scores={AccIntNext=1..}] run scoreboard players operation @s StatusIntelli += @s AccIntNext

# 負の値
execute as @a[tag=!EffectSaved,scores={AccHPNext=..-1}] run scoreboard players operation @s StatusHealthMax += @s AccHPNext
execute as @a[tag=!EffectSaved,scores={AccMPNext=..-1}] run scoreboard players operation @s StatusManaMax += @s AccMPNext
execute as @a[tag=!EffectSaved,scores={AccAtkNext=..-1}] run scoreboard players operation @s StatusAttack += @s AccAtkNext
execute as @a[tag=!EffectSaved,scores={AccDefNext=..-1}] run scoreboard players operation @s StatusDefense += @s AccDefNext
execute as @a[tag=!EffectSaved,scores={AccIntNext=..-1}] run scoreboard players operation @s StatusIntelli += @s AccIntNext

# ループしないようにする +サウンド
execute as @a[tag=!EffectSaved,tag=HasAccessory] at @s run function system:sound/wear
execute as @a[tag=!EffectSaved,tag=HasAccessory] run tag @s add EffectSaved


### 装備を外した場合HPとDEFをもとに戻す
execute as @a[tag=!HasAccessory, scores={AccHPNext=1..}] run scoreboard players operation @s StatusHealthMax -= @s AccHPNext
execute as @a[tag=!HasAccessory, scores={AccMPNext=1..}] run scoreboard players operation @s StatusManaMax -= @s AccMPNext
execute as @a[tag=!HasAccessory, scores={AccAtkNext=1..}] run scoreboard players operation @s StatusAttack -= @s AccAtkNext
execute as @a[tag=!HasAccessory, scores={AccDefNext=1..}] run scoreboard players operation @s StatusDefense -= @s AccDefNext
execute as @a[tag=!HasAccessory, scores={AccIntNext=1..}] run scoreboard players operation @s StatusIntelli -= @s AccIntNext

execute as @a[tag=!HasAccessory, scores={AccHPNext=..-1}] run scoreboard players operation @s StatusHealthMax -= @s AccHPNext
execute as @a[tag=!HasAccessory, scores={AccMPNext=..-1}] run scoreboard players operation @s StatusManaMax -= @s AccMPNext
execute as @a[tag=!HasAccessory, scores={AccAtkNext=..-1}] run scoreboard players operation @s StatusAttack -= @s AccAtkNext
execute as @a[tag=!HasAccessory, scores={AccDefNext=..-1}] run scoreboard players operation @s StatusDefense -= @s AccDefNext
execute as @a[tag=!HasAccessory, scores={AccIntNext=..-1}] run scoreboard players operation @s StatusIntelli -= @s AccIntNext

# ----------
execute as @a[tag=!HasAccessory, scores={AccHPNext=1..}] run scoreboard players set @s AccHPNext 0
execute as @a[tag=!HasAccessory, scores={AccMPNext=1..}] run scoreboard players set @s AccMPNext 0
execute as @a[tag=!HasAccessory, scores={AccAtkNext=1..}] run scoreboard players set @s AccAtkNext 0
execute as @a[tag=!HasAccessory, scores={AccDefNext=1..}] run scoreboard players set @s AccDefNext 0
execute as @a[tag=!HasAccessory, scores={AccIntNext=1..}] run scoreboard players set @s AccIntNext 0

execute as @a[tag=!HasAccessory, scores={AccHPNext=..-1}] run scoreboard players set @s AccHPNext 0
execute as @a[tag=!HasAccessory, scores={AccMPNext=..-1}] run scoreboard players set @s AccMPNext 0
execute as @a[tag=!HasAccessory, scores={AccAtkNext=..-1}] run scoreboard players set @s AccAtkNext 0
execute as @a[tag=!HasAccessory, scores={AccDefNext=..-1}] run scoreboard players set @s AccDefNext 0
execute as @a[tag=!HasAccessory, scores={AccIntNext=..-1}] run scoreboard players set @s AccIntNext 0

execute as @a[tag=!HasAccessory, tag=EffectSaved] at @s run function system:sound/remove
execute as @a[tag=!HasAccessory, tag=EffectSaved] run tag @s remove EffectSaved

### 装備を外さずに付け替えた場合の処理をする
# 現在の値を取る
execute as @a[tag=HasAccessory] store result score @s AccHPCurrent run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Health
execute as @a[tag=HasAccessory] store result score @s AccManaCurrent run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Mana
execute as @a[tag=HasAccessory] store result score @s AccAtkCurrent run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Attack
execute as @a[tag=HasAccessory] store result score @s AccDefCurrent run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Defense
execute as @a[tag=HasAccessory] store result score @s AccIntCurrent run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Intelligence

# 現在の値と元の値を比べる
execute as @a[tag=HasAccessory] if score @s AccHPNext < @s AccHPCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccHPNext > @s AccHPCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccMPNext < @s AccManaCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccMPNext > @s AccManaCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccAtkNext < @s AccAtkCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccAtkNext > @s AccAtkCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccDefNext < @s AccDefCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccDefNext > @s AccDefCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccIntNext < @s AccIntCurrent run tag @s add AccessorySwapped
execute as @a[tag=HasAccessory] if score @s AccIntNext > @s AccIntCurrent run tag @s add AccessorySwapped

#値が変わっていた場合の処理
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusHealthMax -= @s AccHPNext
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusManaMax -= @s AccMPNext
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusDefense -= @s AccDefNext
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusIntelli -= @s AccIntNext
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusAttack -= @s AccAtkNext
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusHealthMax += @s AccHPCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusManaMax += @s AccManaCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusDefense += @s AccDefCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusIntelli += @s AccIntCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s StatusAttack += @s AccAtkCurrent
#ループさせないようにする
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s AccHPNext = @s AccHPCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s AccMPNext = @s AccManaCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s AccDefNext = @s AccDefCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s AccIntNext = @s AccIntCurrent
execute as @a[tag=AccessorySwapped] run scoreboard players operation @s AccAtkNext = @s AccAtkCurrent
execute as @a[tag=AccessorySwapped] at @s run function system:useful/sound/wear
execute as @a[tag=AccessorySwapped] run tag @s remove AccessorySwapped

