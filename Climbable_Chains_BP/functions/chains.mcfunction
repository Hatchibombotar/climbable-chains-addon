# ensure scoreboards exist
scoreboard objectives add soundTick dummy soundTick
scoreboard objectives add preSlowFalling dummy preSlowFalling
scoreboard objectives add preLevitation dummy preLevitation
scoreboard objectives add addSlowFalling dummy addSlowFalling
scoreboard objectives add addLevitation dummy addLevitation

execute @a[rxm=-90,rx=35] ~ ~ ~ detect ^ ^1 ^1 chain -1 scoreboard players set @s addLevitation 1
execute @a[rxm=-90,rx=35] ~ ~ ~ detect ^ ^1 ^2 chain -1 scoreboard players set @s addLevitation 1

execute @a[rxm=35,rx=90] ~ ~ ~ detect ^ ^ ^0.1 chain -1 scoreboard players set @s addSlowFalling 1
execute @a[rxm=35,rx=90] ~ ~ ~ detect ^ ^ ^0.5 chain -1 scoreboard players set @s addSlowFalling 1
execute @a[rxm=35,rx=90] ~ ~ ~ detect ^ ^ ^1 chain -1 scoreboard players set @s addSlowFalling 1
execute @a[rxm=35,rx=90] ~ ~ ~ detect ^ ^ ^2 chain -1 scoreboard players set @s addSlowFalling 1

execute @a[rxm=-90,rx=35] ~ ~ ~ detect ^ ^1 ^1 chain -1 effect @s resistance 5 10 true
execute @a[rxm=-90,rx=35] ~ ~ ~ detect ^ ^1 ^2 chain -1 effect @s resistance 5 10 true

# Sounds
execute @a[rxm=-90,rx=35,scores={soundTick=19..}] ~ ~ ~ detect ^ ^1 ^1 chain -1 playsound dig.chain @s ~ ~ ~ 
execute @a[rxm=-90,rx=35,scores={soundTick=19..}] ~ ~ ~ detect ^ ^1 ^2 chain -1 playsound dig.chain @s ~ ~ ~ 

execute @a[rxm=35,rx=90,scores={soundTick=19..}] ~ ~ ~ detect ^ ^ ^0.1 chain -1 playsound dig.chain @s ~ ~ ~ 
execute @a[rxm=35,rx=90,scores={soundTick=19..}] ~ ~ ~ detect ^ ^ ^0.5 chain -1 playsound dig.chain @s ~ ~ ~ 
execute @a[rxm=35,rx=90,scores={soundTick=19..}] ~ ~ ~ detect ^ ^ ^1 chain -1 playsound dig.chain @s ~ ~ ~ 
execute @a[rxm=35,rx=90,scores={soundTick=19..}] ~ ~ ~ detect ^ ^ ^2 chain -1 playsound dig.chain @s ~ ~ ~ 

scoreboard players add @a soundTick 1

execute @a[scores={soundTick=20..}] ~ ~ ~ scoreboard players set @s soundTick 0

effect @s[scores={addSlowFalling=1}] slow_falling 1 1 true
effect @s[scores={addLevitation=1}] levitation 1 1 true

effect @s[scores={addSlowFalling=0, preSlowFalling=1}] slow_falling 0 0 true
effect @s[scores={addLevitation=0, preLevitation=1}] levitation 0 0 true

scoreboard players operation @s preSlowFalling = @s addSlowFalling
scoreboard players operation @s preLevitation = @s addLevitation

# reset scores
scoreboard players set @s addLevitation 0
scoreboard players set @s addSlowFalling 0