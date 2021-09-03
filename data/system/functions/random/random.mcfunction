# https://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%A3%E3%83%AA%E3%83%BC%E4%BB%98%E3%81%8D%E4%B9%97%E7%AE%97#%E5%9F%BA%E6%9C%AC%E7%90%86%E8%AB%96
# (x = (ax + c) % b), c = x/b
scoreboard players operation x Random *= a Random
scoreboard players operation x Random += c Random
scoreboard players operation c Random = x Random
scoreboard players operation c Random /= b Random
scoreboard players operation x Random %= b Random
scoreboard players get x Random
