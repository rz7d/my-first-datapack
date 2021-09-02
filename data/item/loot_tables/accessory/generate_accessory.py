import json

class TradingData:
    def __init__(self, sell_price):
        self.SellPrice = sell_price

class Accessory:
    def __init__(self, type, bonus, effects, roll_data):
        self.Type = type
        self.Bonus = bonus
        self.Effects = effects
        self.RollData = roll_data

class AccessoryEffect:
    def __init__(self, type, value):
        self.Type = type
        self.Value = value

class ManaAccessoryEffect:
    def __init__(self, regen_interval, regen_amount, regen_scaled_by_capacity):



{TradingData: {SellPrice: 20}, EquipmentData:[{Type: 'Accessory', Bonus: {Mana: 10}, Effects: [{Type: 'Mana', Value: {RegenInterval: 45, RegenAmount: 1, RegenScaledByCapacity: true}}]}], display:{Name:'\"Mana Booster (Common)\"'}}
