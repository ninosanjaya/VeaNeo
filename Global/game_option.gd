extends Node

var save_path = "user://option.save"
 
#var variable1 = Global.health_player_one
#var variable2 = Global.mana_player_one
#var variable3 = Global.player_location
#var variable4 = 0 



var tutorial = false



var fullscreen_on = false
var vsync_on = false
#audio
var master_vol = 20
var bgm_vol = 20
var sfx_vol = 20
#contreol?

#Player hp
#Player mana
#Player location (world 1 or world 2, etc)

#Player cleanse the world or not?
#Player item/key item (invetory)
#Dialogue updated?
#Player clear the game or not



	
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)

	#file.store_var(variable4)
	#file.store_var(skill_available)

	file.store_var(tutorial)
	file.store_var(fullscreen_on)
	file.store_var(vsync_on)
	file.store_var(master_vol)
	file.store_var(bgm_vol)
	file.store_var(sfx_vol)
	print(master_vol)

	
		
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		tutorial = file.get_var(tutorial)
		fullscreen_on = file.get_var(fullscreen_on)
		vsync_on = file.get_var(vsync_on)
		master_vol = file.get_var(master_vol)
		bgm_vol = file.get_var(bgm_vol)
		sfx_vol = file.get_var(sfx_vol)


		
		
		#variable4 = file.get_var(variable4)
		
	else:
		print("no data saved...")
		tutorial = false
		fullscreen_on = false
		vsync_on = false
		master_vol = 20
		bgm_vol = 20
		sfx_vol = 20

		#variable4 = 0
		
		
