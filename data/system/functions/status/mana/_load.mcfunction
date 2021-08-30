# プレイヤーの Mana の現在値
scoreboard objectives add Mana dummy

# プレイヤーの Mana の最大値
scoreboard objectives add ManaMax dummy

# 呪文を唱えるときにその都度設定する Mana 必要量
scoreboard objectives add ManaReq dummy


# Mana 自然回復用のタイマー
scoreboard objectives add ManaTimer dummy

# Mana が回復する量
scoreboard objectives add ManaRegen dummy

# Mana が回復するまでの待ち時間
scoreboard objectives add ManaRegenWait dummy

scoreboard objectives add ManaRegenPercent dummy
scoreboard objectives add ManaRegenDivider dummy
