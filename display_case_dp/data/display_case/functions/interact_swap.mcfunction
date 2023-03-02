execute at @p[tag=current_player] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["newest"]}
data modify entity @e[tag=newest,limit=1] Item set from entity @e[tag=current_item,limit=1] item
tag @e[tag=newest] remove newest

item replace entity @e[tag=current_item,limit=1] container.0 from entity @p[tag=current_player] weapon.mainhand
item modify entity @p[tag=current_player] weapon.mainhand display_case:decrease_count
item modify entity @e[tag=current_item] container.0 display_case:reset_count
tag @p[tag=current_player] add finished_interaction