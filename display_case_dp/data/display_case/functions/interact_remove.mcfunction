item replace entity @p[tag=current_player] weapon.mainhand from entity @e[tag=current_item,limit=1] container.0
item modify entity @e[tag=current_item] container.0 display_case:decrease_count
playsound minecraft:entity.item.pickup player @p[tag=current_player] ~ ~ ~ 1 1
tag @p[tag=current_player] add finished_interaction