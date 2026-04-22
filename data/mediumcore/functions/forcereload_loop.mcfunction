# scoreinloop_currIndex sets to storagetemp_IndexInLoop
$scoreboard players set #mediumcore scoreinloop_currIndex $(storagetemp_IndexInLoop)

# ===========================================
# FUNCTION CALL
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# now storage mediumcore_items{item:""} is equal to item with storagetemp_IndexInLoop index in storage mediumcore
function mediumcore:funcinloop_mediumcore_items_tempmodify with storage minecraft:mediumcore
# now there is a scoreboard with this item name and its trigger
function mediumcore:forcereload_funcinloop_used_scores with storage minecraft:mediumcore_items

# ===========================================
# CONTINUE LOOP
# ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
# loop continues with value by 1 smaller
scoreboard players operation #mediumcore scoreinloop_currIndex -= #mediumcore scoreconst_var1
# storagetemp_IndexInLoop is now 
execute store result storage minecraft:mediumcore storagetemp_IndexInLoop int 1 run scoreboard players get #mediumcore scoreinloop_currIndex

execute if score #mediumcore scoreinloop_currIndex > #mediumcore scoreconst_var_1 run function mediumcore:loop1 with storage minecraft:mediumcore