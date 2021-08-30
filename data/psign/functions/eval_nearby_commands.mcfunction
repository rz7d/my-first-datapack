# Retrieve from nearby signs
# @s = Block

# left
execute as @s at @s if block ^-1 ^ ^ #wall_signs run function psign:interpret_command

# right
execute as @s at @s if block ^1 ^ ^ #wall_signs run function psign:interpret_command

# bottom
execute as @s at @s if block ^ ^-1 ^ #wall_signs run function psign:interpret_command

# top
execute as @s at @s if block ^ ^1 ^ #wall_signs run function psign:interpret_command

give @s minecraft:oak_sign{display: {Lore: ['"wand_wall"']}, BlockEntityTag: {id: "minecraft:sign", Color: "black", Text1: '{"text":""}', Text2: '{"text": "クリックで杖を入手", "clickEvent": {"action": "run_command","value": "function system:wands/wand_wall"}}', Text3: '{"text":""}', Text4: '{"text":""}'}}
