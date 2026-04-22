scoreboard objectives add scoretemp_itemsCount dummy
scoreboard objectives add scoreinloop_currIndex dummy

# ===========================================
# LOOP SETUP
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
data merge storage minecraft:mediumcore_items {item:""}

# number of strings inside items[] in mediumcore storage
execute store result score #mediumcore scoretemp_itemsCount run data get storage minecraft:mediumcore items

# in programming, the index starts from 0, not from 1, so we subtract 1 from scoretemp_itemsCount
scoreboard players operation #mediumcore scoretemp_itemsCount -= #mediumcore scoreconst_var1

# storagetemp_*Index*InLoop sets to maximum (to our itemsCount-1)
execute store result storage minecraft:mediumcore storagetemp_IndexInLoop int 1 run scoreboard players get #mediumcore scoretemp_itemsCount

# ===========================================
# LOOP
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
function mediumcore:forcereload_loop with storage minecraft:mediumcore

# ===========================================
# CLEAN LOOP
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
data remove storage minecraft:mediumcore storagetemp_IndexInLoop
data remove storage minecraft:mediumcore_items item
scoreboard objectives remove scoretemp_itemsCount
scoreboard objectives remove scoreinloop_currIndex

# ===========================================
# MAIN CLEAN
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
scoreboard objectives remove score_mediumcoreDeaths
scoreboard objectives remove score_maxHealth
scoreboard objectives remove scoreconst_maxHealth
scoreboard objectives remove scoretemp_needsHealthUpdate
scoreboard objectives remove scoreconst_var1
scoreboard objectives remove scoreconst_var_1
scoreboard objectives remove lateload
data remove storage minecraft:mediumcore storagetemp_health
data remove storage minecraft:mediumcore max_1
data remove storage minecraft:mediumcore max
data remove storage minecraft:mediumcore max_deaths
function mediumcore:load
execute as @a run attribute @s minecraft:max_health base reset
tellraw @s {text:">>> \"mediumcore\" datapack was force-reloaded",color:yellow}