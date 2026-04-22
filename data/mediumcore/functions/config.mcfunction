# ╔══╗╔══╗╔╗─╔╗╔══╗╔══╗╔═══╗───╔╗╔╗╔═══╗╔═══╗╔═══╗
# ║╔═╝║╔╗║║╚═╝║║╔═╝╚╗╔╝║╔══╝───║║║║║╔══╝║╔═╗║║╔══╝
# ║║──║║║║║╔╗─║║╚═╗─║║─║║╔═╗───║╚╝║║╚══╗║╚═╝║║╚══╗
# ║║──║║║║║║╚╗║║╔═╝─║║─║║╚╗║───║╔╗║║╔══╝║╔╗╔╝║╔══╝
# ║╚═╗║╚╝║║║─║║║║──╔╝╚╗║╚═╝║───║║║║║╚══╗║║║║─║╚══╗
# ╚══╝╚══╝╚╝─╚╝╚╝──╚══╝╚═══╝───╚╝╚╝╚═══╝╚╝╚╝─╚═══╝
# items:["enchanted_golden_apple",...] ←--- items, that when consumed will regenerate your health
# max:10 ←--- maximum player hearts
# max_1:11 ←--- maximum player hearts+1 (please do not set it with wrong values, that are not "max"+1)
# max_deaths:7 ←--- maximum player deaths (when you die a lot you will end up with (max)-(max_deaths) hearts. By default your minimum hearts is 3)

data merge storage minecraft:mediumcore {items:["enchanted_golden_apple","golden_apple"]}
data merge storage minecraft:mediumcore {max_1:11, max:10, max_deaths:7}

# =======================================================================================
# =======================================================================================
# =======================================================================================
# =======================================================================================
# =======================================================================================





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
function mediumcore:loop1 with storage minecraft:mediumcore