$execute as @a[scores={used_$(item)=1..}] run scoreboard players operation @s scoretemp_healed += @s used_$(item)
$execute as @a[scores={used_$(item)=1..}] run scoreboard players reset @s used_$(item)