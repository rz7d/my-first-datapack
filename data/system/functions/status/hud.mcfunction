execute as @a run title @s actionbar [{"text": "HP: "}, {"score": {"objective": "StatusHealth", "name": "@s"}}, "/", {"score": {"objective": "StatusHealthMax", "name": "@s"}}, "  ",{"text": "Mana: "}, {"score": {"objective": "StatusMana", "name": "@s"}}, "/", {"score": {"objective": "StatusManaMax", "name": "@s"}}, "  ", {"text": "ATK: "}, {"score": {"objective": "StatusAttack", "name": "@s"}}, "  ", {"text": "DEF: "}, {"score": {"objective": "StatusDefense", "name": "@s"}}, "  ", {"text": "INT: "}, {"score": {"objective": "StatusIntelli", "name": "@s"}}]