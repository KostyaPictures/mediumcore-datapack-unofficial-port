function mediumcore:load

# scoretemp_needsHealthUpdate - if set to >=1, then the game updates player's health
# 
# ===========================================
# IF THE PLAYER JOINS THE WORLD AFTER THE load.mcfunction
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
execute as @a[scores={lateload=0}] store result score @s score_maxHealth run data get storage minecraft:mediumcore max
execute as @a[scores={lateload=0}] store result score @s scoreconst_maxHealth run data get storage minecraft:mediumcore max
execute as @a[scores={lateload=0}] run scoreboard players set @s scoretemp_needsHealthUpdate 1
execute as @a[scores={lateload=0}] run scoreboard players set @s lateload 1


# ===========================================
# LIMITS TO PLAYERS' MAX HEALTH
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓

 with storage minecraft:mediumcore

# ======================================================================================
# IF THE PLAYER WAS HEALED BY AN ITEM IN CONFIG (default: gapple, notch apple) AND HE HAS >=1 DEATHS
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓

# ===========================================
# LOOP SETUP
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓

scoreboard objectives add scoretemp_itemsCount dummy
scoreboard objectives add scoreinloop_currIndex dummy


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
function mediumcore:loop_sum_healed with storage minecraft:mediumcore

data remove storage minecraft:mediumcore storagetemp_IndexInLoop
data remove storage minecraft:mediumcore_items item
scoreboard objectives remove scoretemp_itemsCount
scoreboard objectives remove scoreinloop_currIndex

# ===========================================
# HEALTH SET
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓

execute as @a[scores={scoretemp_healed=1..,score_mediumcoreDeaths=1..}] run scoreboard players operation @s score_mediumcoreDeaths -= #mediumcore scoreconst_var1

execute as @a[scores={scoretemp_healed=1..}] run scoreboard players set @s scoretemp_needsHealthUpdate 1

execute as @a[scores={scoretemp_healed=1..}] run scoreboard players reset @s scoretemp_healed


# ======================================================================================
# HEALTH UPDATE
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
execute as @a[scores={scoretemp_needsHealthUpdate=1..}] run scoreboard players operation @s score_maxHealth -= @s score_mediumcoreDeaths

execute as @a[scores={scoretemp_needsHealthUpdate=1..}] store result storage minecraft:mediumcore storagetemp_health int 2 run scoreboard players get @s score_maxHealth
# ↑ ↑ ↑
# int 2 - because player's health = player's hearts * 2

execute as @a[scores={scoretemp_needsHealthUpdate=1..}] run function mediumcore:max_health_main_setter with storage minecraft:mediumcore
# ↑ ↑ ↑
# main health setter

execute as @a[scores={scoretemp_needsHealthUpdate=1..}] run scoreboard players operation @s score_maxHealth = @s scoreconst_maxHealth

execute as @a[scores={scoretemp_needsHealthUpdate=1..}] run scoreboard players reset @s scoretemp_needsHealthUpdate