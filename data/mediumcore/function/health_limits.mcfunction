$execute as @a[scores={score_maxHealth=$(max_1)..}] run scoreboard players set @s scoretemp_needsHealthUpdate 1

$execute as @a[scores={score_maxHealth=$(max_1)..}] run scoreboard players set @s score_maxHealth $(max)

$execute as @a[scores={score_mediumcoreDeaths=$(max_deaths)..}] run scoreboard players set @s score_mediumcoreDeaths $(max_deaths)