scoreboard players remove @a[scores={plague_timer=1..}] plague_timer 1
effect give @a[scores={plague_timer=1}] minecraft:instant_damage 1 0
scoreboard players set @a[scores={plague_timer=1,plague_level=..5}] plague_timer 1000
scoreboard players add @a[scores={plague_timer=1,plague_level=..6}] plague_level 1
execute as @a[scores={plague_level=2}] run attribute @s minecraft:generic.max_health base set 18
execute as @a[scores={plague_level=3}] run attribute @s minecraft:generic.max_health base set 16
execute as @a[scores={plague_level=4}] run attribute @s minecraft:generic.max_health base set 14
execute as @a[scores={plague_level=5}] run attribute @s minecraft:generic.max_health base set 12
execute at @e[scores={plague_level=1..}] run scoreboard players add @e[distance=..5] plague_contagion 100
execute as @e[scores={plague_contagion=2400..}] run scoreboard players set @s plague_timer 2400000
execute at @e[scores={plague_level=4..}] run particle minecraft:dust 0 0.25 0 0.25 ~ ~1 ~ 0.125 0.25 0.125 0.1 1 normal
effect give @e[scores={plague_level=4..}] minecraft:slowness 1 0 true
effect give @e[scores={plague_level=3..}] minecraft:weakness 1 1 true
effect give @e[scores={plague_level=1..3}] minecraft:weakness 1 0 true
execute as @a[nbt={SelectedItem:{id:"minecraft:command_block"}}] run title @s actionbar ["",{"text":"| "},{"text":"Level ","bold":true,"color":"#534B53"},{"text":": "},{"score":{"name":"@s","objective":"plague_level"}},{"text":" | "},{"text":"Next Level","bold":true,"color":"dark_gray"},{"text":" : "},{"score":{"name":"@s","objective":"plague_timer"}},{"text":" | "},{"text":"Contagion ","bold":true,"color":"#21602A"},{"text":": "},{"score":{"name":"@s","objective":"plague_contagion"}},{"text":" |"}]
execute at @e[tag=plague_contagion] run scoreboard players add @e[distance=0..3] plague_contagion 1
tag @e[type=minecraft:drowned,tag=!plague_contagion] add plague_contagion
tag @e[type=minecraft:wither_skeleton,tag=!plague_contagion] add plague_contagion
tag @e[type=minecraft:silverfish,tag=!plague_contagion] add plague_contagion
execute as @e[nbt={ActiveEffects:[{Id:10b}]}] run scoreboard players set @s plague_contagion 0
execute as @e[nbt={ActiveEffects:[{Id:10b}]}] run scoreboard players set @s plague_timer 0
execute as @e[nbt={ActiveEffects:[{Id:10b, Amplifier:1b}]}] run scoreboard players remove @s[scores={plague_level=2..}] plague_level 1
scoreboard players set @e[scores={plague_level=1..}] plague_contagion 0
execute at @e[tag=ed_plague_scroll] unless block ~ ~ ~ minecraft:air run scoreboard players add @e[distance=..10] plague_timer 2400