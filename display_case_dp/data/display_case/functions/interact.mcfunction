execute positioned ~ ~0.5 ~ run tag @e[tag=display_case_item,sort=nearest,limit=1] add current_item
execute on target run tag @s add current_player

execute unless entity @p[tag=current_player,tag=finished_interaction] if entity @e[tag=current_item,nbt={item:{id:"minecraft:air"}}] if data entity @p[tag=current_player] SelectedItem run function display_case:interact_place
execute unless entity @p[tag=current_player,tag=finished_interaction] if entity @e[tag=current_item,nbt=!{item:{id:"minecraft:air"}}] unless data entity @p[tag=current_player] SelectedItem run function display_case:interact_remove
execute unless entity @p[tag=current_player,tag=finished_interaction] if entity @e[tag=current_item,nbt=!{item:{id:"minecraft:air"}}] if data entity @p[tag=current_player] SelectedItem run function display_case:interact_swap


data remove entity @s interaction
tag @e[tag=current_item] remove current_item
tag @a[tag=finished_interaction] remove finished_interaction
tag @a[tag=current_player] remove current_player