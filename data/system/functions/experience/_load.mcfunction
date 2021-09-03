



#現時点での必須経験値量用
scoreboard objectives add Exp dummy {"text":"次のレベルまで残り","color":"yellow"}
#現在の取得経験値確認用
scoreboard objectives add NowExp dummy
#Expを所持しているか代入用
scoreboard objectives add HasExp dummy
#Expがマイナスになった時に繰り越す用
scoreboard objectives add MinusExp dummy
#トータルのExp
scoreboard objectives add TotalExp dummy
###level_upで使うやつ
scoreboard objectives add Lv dummy {"text":"レベル","color":"yellow"}
#必須経験値量保持用
scoreboard objectives add NextExp dummy
#
scoreboard objectives add CalcExp dummy
