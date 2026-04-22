scoreboard objectives add score_mediumcoreDeaths deathCount
scoreboard objectives add score_maxHealth dummy
scoreboard objectives add scoreconst_maxHealth dummy
scoreboard objectives add scoretemp_needsHealthUpdate deathCount
scoreboard objectives add scoreconst_var1 dummy
scoreboard players set #mediumcore scoreconst_var1 1
scoreboard objectives add scoreconst_var_1 dummy
scoreboard players set #mediumcore scoreconst_var_1 -1

scoreboard objectives add scoretemp_healed dummy

# ===========================================
# main config
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
scoreboard objectives add scoretemp_itemsCount dummy
scoreboard objectives add scoreinloop_currIndex dummy

function mediumcore:config

data remove storage minecraft:mediumcore storagetemp_IndexInLoop
data remove storage minecraft:mediumcore_items item
scoreboard objectives remove scoretemp_itemsCount
scoreboard objectives remove scoreinloop_currIndex

# ===========================================
# IF THE PLAYER JOINS THE WORLD AFTER THE load.mcfunction
# see more in tick.mcfunction
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
scoreboard objectives add lateload dummy
execute as @a store result score @s score_maxHealth run data get storage minecraft:mediumcore max
execute as @a store result score @s scoreconst_maxHealth run data get storage minecraft:mediumcore max
execute as @a run scoreboard players set @s scoretemp_needsHealthUpdate 1
scoreboard players set @a lateload 1