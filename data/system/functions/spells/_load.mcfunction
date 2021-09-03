scoreboard objectives add CastDetector minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add CastDetector minecraft.used:minecraft.brick
scoreboard objectives add CastDetector minecraft.used:minecraft.stick

# TODO: Tracker API に移動する
scoreboard objectives add UUID0 dummy
scoreboard objectives add UUID1 dummy
scoreboard objectives add UUID2 dummy
scoreboard objectives add UUID3 dummy

function system:spells/fire/_load
function system:spells/wall/_load
