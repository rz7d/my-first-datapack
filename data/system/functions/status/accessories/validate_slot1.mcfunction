# WearAcc1A = Accessory をスロット 1 に置いている人
# WearAcc1B = ステータス処理済み
# WearAcc1C = Accessory 変更時の比較
execute as @a unless data entity @s Inventory[{Slot: 17b}].tag.EquipmentData[{Type: "Accessory"}] run tag @s remove WearAcc1A
execute as @a[tag=!WearAcc1A] if data entity @s Inventory[{Slot: 17b}].tag.EquipmentData[{Type: "Accessory"}] run tag @s add WearAcc1A
# 装備してたら代入する
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] store result score @s CalcAcc1HP run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Health
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] store result score @s CalcAcc1MP run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Mana
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] store result score @s CalcAcc1ATK run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Attack
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] store result score @s CalcAcc1DEF run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Defense
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] store result score @s CalcAcc1INT run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Intelligence

# 反映
execute as @a[tag=!WearAcc1B,scores={CalcAcc1HP=1..}] run scoreboard players operation @s StatusHealthMax += @s CalcAcc1HP
execute as @a[tag=!WearAcc1B,scores={CalcAcc1MP=1..}] run scoreboard players operation @s StatusManaMax += @s CalcAcc1MP
execute as @a[tag=!WearAcc1B,scores={CalcAcc1ATK=1..}] run scoreboard players operation @s StatusAttack += @s CalcAcc1ATK
execute as @a[tag=!WearAcc1B,scores={CalcAcc1DEF=1..}] run scoreboard players operation @s StatusDefense += @s CalcAcc1DEF
execute as @a[tag=!WearAcc1B,scores={CalcAcc1INT=1..}] run scoreboard players operation @s StatusIntelli += @s CalcAcc1INT

# 負の値
execute as @a[tag=!WearAcc1B,scores={CalcAcc1HP=..-1}] run scoreboard players operation @s StatusHealthMax += @s CalcAcc1HP
execute as @a[tag=!WearAcc1B,scores={CalcAcc1MP=..-1}] run scoreboard players operation @s StatusManaMax += @s CalcAcc1MP
execute as @a[tag=!WearAcc1B,scores={CalcAcc1ATK=..-1}] run scoreboard players operation @s StatusAttack += @s CalcAcc1ATK
execute as @a[tag=!WearAcc1B,scores={CalcAcc1DEF=..-1}] run scoreboard players operation @s StatusDefense += @s CalcAcc1DEF
execute as @a[tag=!WearAcc1B,scores={CalcAcc1INT=..-1}] run scoreboard players operation @s StatusIntelli += @s CalcAcc1INT

# ループしないようにする +サウンド
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] at @s run function system:sound/wear
execute as @a[tag=WearAcc1A,tag=!WearAcc1B] run tag @s add WearAcc1B

### 装備を外した場合HPとDEFをもとに戻す
execute as @a[tag=!WearAcc1A, scores={CalcAcc1HP=1..}] run scoreboard players operation @s StatusHealthMax -= @s CalcAcc1HP
execute as @a[tag=!WearAcc1A, scores={CalcAcc1MP=1..}] run scoreboard players operation @s StatusManaMax -= @s CalcAcc1MP
execute as @a[tag=!WearAcc1A, scores={CalcAcc1ATK=1..}] run scoreboard players operation @s StatusAttack -= @s CalcAcc1ATK
execute as @a[tag=!WearAcc1A, scores={CalcAcc1DEF=1..}] run scoreboard players operation @s StatusDefense -= @s CalcAcc1DEF
execute as @a[tag=!WearAcc1A, scores={CalcAcc1INT=1..}] run scoreboard players operation @s StatusIntelli -= @s CalcAcc1INT

execute as @a[tag=!WearAcc1A, scores={CalcAcc1HP=..-1}] run scoreboard players operation @s StatusHealthMax -= @s CalcAcc1HP
execute as @a[tag=!WearAcc1A, scores={CalcAcc1MP=..-1}] run scoreboard players operation @s StatusManaMax -= @s CalcAcc1MP
execute as @a[tag=!WearAcc1A, scores={CalcAcc1ATK=..-1}] run scoreboard players operation @s StatusAttack -= @s CalcAcc1ATK
execute as @a[tag=!WearAcc1A, scores={CalcAcc1DEF=..-1}] run scoreboard players operation @s StatusDefense -= @s CalcAcc1DEF
execute as @a[tag=!WearAcc1A, scores={CalcAcc1INT=..-1}] run scoreboard players operation @s StatusIntelli -= @s CalcAcc1INT

# ----------
execute as @a[tag=!WearAcc1A, scores={CalcAcc1HP=1..}] run scoreboard players set @s CalcAcc1HP 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1MP=1..}] run scoreboard players set @s CalcAcc1MP 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1ATK=1..}] run scoreboard players set @s CalcAcc1ATK 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1DEF=1..}] run scoreboard players set @s CalcAcc1DEF 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1INT=1..}] run scoreboard players set @s CalcAcc1INT 0

execute as @a[tag=!WearAcc1A, scores={CalcAcc1HP=..-1}] run scoreboard players set @s CalcAcc1HP 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1MP=..-1}] run scoreboard players set @s CalcAcc1MP 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1ATK=..-1}] run scoreboard players set @s CalcAcc1ATK 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1DEF=..-1}] run scoreboard players set @s CalcAcc1DEF 0
execute as @a[tag=!WearAcc1A, scores={CalcAcc1INT=..-1}] run scoreboard players set @s CalcAcc1INT 0

execute as @a[tag=!WearAcc1A, tag=WearAcc1B] at @s run function system:sound/remove
execute as @a[tag=!WearAcc1A, tag=WearAcc1B] run tag @s remove WearAcc1B

### 装備を外さずに付け替えた場合の処理をする
# 現在の値を取る
execute as @a[tag=WearAcc1A] store result score @s CalcAcc1HP2 run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Health
execute as @a[tag=WearAcc1A] store result score @s CalcAcc1MP2 run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Mana
execute as @a[tag=WearAcc1A] store result score @s CalcAcc1ATK2 run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Attack
execute as @a[tag=WearAcc1A] store result score @s CalcAcc1DEF2 run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Defense
execute as @a[tag=WearAcc1A] store result score @s CalcAcc1INT2 run data get entity @s Inventory[{Slot:17b}].tag.EquipmentData[{Type: "Accessory"}].Bonus.Intelligence

#現在の値と元の値を比べる
execute as @a[tag=WearAcc1A] if score @s CalcAcc1HP < @s CalcAcc1HP2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1HP > @s CalcAcc1HP2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1MP < @s CalcAcc1MP2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1MP > @s CalcBootMP2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1ATK < @s CalcAcc1ATK2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1ATK > @s CalcAcc1ATK2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1DEF < @s CalcAcc1DEF2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1DEF > @s CalcAcc1DEF2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1INT < @s CalcAcc1INT2 run tag @s add WearAcc1C
execute as @a[tag=WearAcc1A] if score @s CalcAcc1INT > @s CalcAcc1INT2 run tag @s add WearAcc1C

#値が変わっていた場合の処理
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusHealthMax -= @s CalcAcc1HP
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusManaMax -= @s CalcAcc1MP
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusDefense -= @s CalcAcc1DEF
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusIntelli -= @s CalcAcc1INT
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusAttack -= @s CalcAcc1ATK
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusHealthMax += @s CalcAcc1HP2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusManaMax += @s CalcAcc1MP2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusDefense += @s CalcAcc1DEF2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusIntelli += @s CalcAcc1INT2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s StatusAttack += @s CalcAcc1ATK2
#ループさせないようにする
execute as @a[tag=WearAcc1C] run scoreboard players operation @s CalcAcc1HP = @s CalcAcc1HP2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s CalcAcc1MP = @s CalcAcc1MP2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s CalcAcc1DEF = @s CalcAcc1DEF2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s CalcAcc1INT = @s CalcAcc1INT2
execute as @a[tag=WearAcc1C] run scoreboard players operation @s CalcAcc1ATK = @s CalcAcc1ATK2
execute as @a[tag=WearAcc1C] at @s run function system:useful/sound/wear
execute as @a[tag=WearAcc1C] run tag @s remove WearAcc1C

