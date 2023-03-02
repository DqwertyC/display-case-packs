# Summon a placeholder entity to make dropping the display case easier when we break it
execute align xyz run summon minecraft:item_display ~0.5 ~0.5 ~0.5 {Tags:["newest","display_case_case"]}
data modify entity @e[tag=newest,limit=1] transformation.scale set value [0.001f,0.001f,0.001f]
item replace entity @e[tag=newest,limit=1] container.0 from entity @s container.0
tag @e[tag=newest] remove newest

# Summon the appropriate glass case, and set brightness if we're a glowing case
execute align xyz run summon minecraft:block_display ~ ~ ~ {block_state:{Name:"minecraft:glass"},transformation:{scale:[1.0f,1.0f,1.0f]},Tags:["newest","display_case_shell"]}
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:black_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:black_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:blue_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:blue_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:brown_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:brown_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:cyan_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:cyan_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:gray_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:gray_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:green_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:green_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:light_blue_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:light_blue_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:light_gray_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:light_gray_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:lime_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:lime_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:magenta_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:magenta_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:orange_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:orange_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:pink_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:pink_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:purple_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:purple_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:red_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:red_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:white_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:white_stained_glass"
execute if entity @s[nbt={Item:{tag:{Trim:{material:"display_case:yellow_case"}}}}] run data modify entity @e[tag=newest,limit=1] block_state.Name set value "minecraft:yellow_stained_glass"
execute if entity @s[type=glow_item_frame] run data merge entity @e[tag=newest,limit=1] {brightness:{block:15,sky:15}}
tag @e[tag=newest] remove newest

# Summon the item platform
execute align xyz summon minecraft:block_display run data merge entity @s {block_state:{Name:"minecraft:smooth_stone_slab"},transformation:{scale:[0.75f,0.25f,0.75f],translation:[0.125f,0.01f,0.125f]},Tags:["display_case_platform"]}

# Summon the interaction entity for placing/removing items
execute align xyz run summon minecraft:interaction ~.5 ~-.01 ~.5 {Tags:["display_case_interaction"],width:1.02f,height:1.02f}

# Summon the display entity for showing the item. If we're a glow display case, set item brightness
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon minecraft:item_display run data merge entity @s {interpolation_duration:2,transformation:{scale:[0.7f,0.7f,0.7f],translation:[0.0f,0.0625f,0.0f]},Tags:["display_case_item","newest"]}
execute if entity @s[type=glow_item_frame] run data merge entity @e[tag=newest,limit=1] {brightness:{block:15,sky:15}}
tag @e[tag=newest] remove newest

# Cancel the normal item frame sound
stopsound @p * minecraft:entity.item_frame.place

# Set the block to be a barrier so it has collision
setblock ~ ~ ~ minecraft:barrier
kill @s

