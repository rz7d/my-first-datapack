# 受けたダメージ - DEFENSE/2 = 基本ダメージ
# 基本ダメージ ±乱数幅 = 確定ダメージ
#              ┗乱数幅 = 基本ダメージ/25 + 10

# Defense = pDamageCalc1
execute store result score @s pDamageCalc1 run scoreboard players get @s Defense

# 受けたダメージ - DEFENSE/2 = 基本ダメージ
scoreboard players operation @s pDamageCalc1 /= #2 Constants
scoreboard players operation @s Damage_Res -= @s pDamageCalc1

### 基本ダメージが1以上の場合
# 乱数幅生成
# pDamageCalc1 = 基本ダメージ
# Random %= ( pDamageCalc1 / 25 + 10 )
# pDamageCalc1 = daytime %= 2
# 1 = - // 0 = +
execute store result score @s pDamageCalc1 run scoreboard players get @s Damage_Res
scoreboard players operation @s pDamageCalc1 /= #25 Constants
scoreboard players operation @s pDamageCalc1 += #10 Constants

# ダメージ幅の乱数生成 @s Randomに乱数が入る
execute store result score @s Random run function system:random/random
scoreboard players operation @s Random %= @s pDamageCalc1
# 乱数のプラスかマイナスを判定する 判定方法は マイクラ内時刻%=2
execute store result score @s pDamageCalc1 run time query daytime
scoreboard players operation @s pDamageCalc1 %= #2 Constants


# 1だった場合に処理される 0の場合はなにもなし
execute as @s[scores={pDamageCalc1=1}] run scoreboard players operation @s Random *= #-1 Constants
### 乱数のやつおわり

### ダメージ数の確定
scoreboard players operation @s Damage_Res += @s Random
execute as @s[scores={Defense=..-1}] run scoreboard players operation @s Damage_Res *= #3 Constants
# 確定した後にダメージが0以下の場合5にする (1=0.1dmg)
execute as @s[scores={Damage_Res=..4}] run scoreboard players set @s Damage_Res 5
# クリティカルの判定
execute store result score @s Critical run function system:random/random
scoreboard players operation @s Critical %= #50 Constants
### 0ならCriticalでダメージを1.5倍 0~49
execute as @s[scores={Critical=0}] run scoreboard players operation @s Damage_Res *= #15 Constants
execute as @s[scores={Critical=0}] run scoreboard players operation @s Damage_Res /= #10 Constants
tellraw @s [{"score":{"name":"@s","objective":"Critical"}}]
###ダメージカットの処理
#そもそもDEFの値を上げてあげればいいだけだった
#execute if score @s Damage_Res matches 1..

### ここからHPに代入
scoreboard players operation @s StatusHealth -= @s Damage_Res
scoreboard players operation @s StatusHealth -= @s TrueDamage
##### メッセージ
function system:damage/msg


### HPが0になったらkill
execute as @s[scores={StatusHealth=..0}] run kill @s
execute as @s[scores={StatusHealth=..0}] run scoreboard players operation @s StatusMana = @s StatusManaMax
execute as @s[scores={StatusHealth=..0}] run scoreboard players operation @s StatusHealth = @s StatusHealthMax

# リセット
scoreboard players set @s Random 0
scoreboard players set @s Damage_Res 0
scoreboard players set @s TrueDamage 0
