# Play the sound of glass breaking
playsound minecraft:block.glass.break block @a ~ ~ ~ 1 1 0

# Summon a copy of the item that was in the display case
tag @e[tag=display_case_item,sort=nearest,distance=0..0.25,limit=1] add current_item
execute if entity @e[tag=current_item,nbt=!{item:{id:"minecraft:air"}}] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["newest"]}
data modify entity @e[type=item,tag=newest,limit=1] Item set from entity @e[tag=current_item,limit=1] item
tag @e[tag=newest] remove newest

# Summon the display case item
execute on attacker if entity @s[gamemode=!creative] run summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["newest"]}
data modify entity @e[tag=newest,limit=1] Item set from entity @e[tag=display_case_case,sort=nearest,distance=0..0.25,limit=1] item
data modify entity @e[tag=newest,limit=1] Item.tag.EntityTag.Item set from entity @e[tag=display_case_case,sort=nearest,distance=0..0.25,limit=1] item
data modify entity @e[tag=newest,limit=1] Item.tag.EntityTag.Tags set value ["display_case"]
tag @e[tag=newest] remove newest

# Item Displays are centered in the block
kill @e[tag=display_case_item,sort=nearest,distance=0..0.25,limit=1]
kill @e[tag=display_case_case,sort=nearest,distance=0..0.25,limit=1]

# Block Displays are aligned to the world grid
execute align xyz run kill @e[tag=display_case_platform,sort=nearest,distance=0..0.25,limit=1]
execute align xyz run kill @e[tag=display_case_shell,sort=nearest,distance=0..0.25,limit=1]

# Destroy the barrier, if neccesary
execute if block ~ ~ ~ minecraft:barrier run setblock ~ ~ ~ minecraft:air

# Kill the interaction entity
kill @s