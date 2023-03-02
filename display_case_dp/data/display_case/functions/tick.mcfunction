execute as @a[nbt={SelectedItem:{tag:{Trim:{pattern:"display_case:display_case"}}}},nbt=!{SelectedItem:{tag:{EntityTag:{Tags:[display_case]}}}}] run item modify entity @s weapon.mainhand display_case:add_tags_mainhand

# Supress interaction while crouching (to allow for placing blocks)
tag @e[tag=display_case_interaction] remove interaction_suppressed
execute as @a if predicate display_case:crouching at @s anchored eyes rotated as @s run function display_case:suppress_interactions
execute as @e[tag=display_case_interaction,tag=interaction_suppressed,nbt=!{width:0.98f}] at @s run tp @s ~ ~0.02 ~
execute as @e[tag=display_case_interaction,tag=interaction_suppressed,nbt=!{width:0.98f}] run data merge entity @s {width:0.98f,height:0.98f}
execute as @e[tag=display_case_interaction,tag=!interaction_suppressed,nbt=!{width:1.02f}] at @s run tp @s ~ ~-0.02 ~
execute as @e[tag=display_case_interaction,tag=!interaction_suppressed,nbt=!{width:1.02f}] run data merge entity @s {width:1.02f,height:1.02f}

# Handle interactions
execute as @e[tag=display_case_interaction] at @s if data entity @s interaction run function display_case:interact

# Create or destroy display cases
execute as @e[type=#display_case:item_frames,tag=display_case] at @s run function display_case:create_case
execute as @e[tag=display_case_interaction] at @s positioned ~ ~0.5 ~ if data entity @s attack run function display_case:destroy_case
execute as @e[tag=display_case_interaction] at @s positioned ~ ~0.5 ~ unless block ~ ~ ~ minecraft:barrier run function display_case:destroy_case

# Handle rotation
scoreboard players add ROT display_case_angle 4
scoreboard players operation ROT display_case_angle %= MAX display_case_angle
execute store result storage minecraft:display_case rotation.angle float 0.01 run scoreboard players get ROT display_case_angle
execute as @e[tag=display_case_item] run data modify entity @s transformation.right_rotation set from storage minecraft:display_case rotation
execute as @e[tag=display_case_item] run data modify entity @s interpolation_start set value -1
