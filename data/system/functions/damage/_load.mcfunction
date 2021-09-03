# ダメージを軽減した値が入る
## Resistance 4をつければ100％軽減なので受けたダメージもろもろここに入る
scoreboard objectives add Damage_Res minecraft.custom:minecraft.damage_resisted
# 計算用
scoreboard objectives add pDamageCalc1 dummy
# Resistance付与用
#scoreboard objectives add Resistance dummy
# 敵のクリティカル判定
scoreboard objectives add Critical dummy
# True Damage
scoreboard objectives add TrueDamage dummy
# 弓のダメージ
#scoreboard objectives add BowDamage dummy
# Lightningのマーク用
#scoreboard objectives add Mark minecraft.custom:minecraft.damage_dealt

# 殴った時の相手のHP表示用
scoreboard objectives add MobHealth dummy

# ダメージ増加の計算用
scoreboard objectives add MeleeRandom dummy
