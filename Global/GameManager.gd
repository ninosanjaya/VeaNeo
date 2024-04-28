extends Node

var save_path = "user://savefile2.save"
 
#var variable1 = Global.health_player_one
#var variable2 = Global.mana_player_one
#var variable3 = Global.player_location
#var variable4 = 0 

var health_player_one = 3
var mana_player_one = 100
var player_location = 1

var skill_switch_state = 0
var skill_available=[1,0,0,0] 
var SA0 : float
var SA1 : float
var SA2 : float
var SA3 : float
var counter = 0
#var attack_set_state = 2
var attack_set_state : bool = true

var last_position : Vector2 
var pos_x : float 
var pos_y : float 

var dialogue0_intro : bool = false
var enemies_done : bool = false
var enemies_done_2 : bool = false
var enemies_done_3 : bool = false
var enemies_done_4 : bool = false

var key_item_all : bool = false
var key_item1 : bool = false
var key_item2 : bool = false
var key_item3 : bool = false
var final : bool = false

var next21 : bool = false
var next22 : bool = false

var world2_intro : bool = false
var world3_intro : bool = false
var world4_intro : bool = false
var worldF_intro : bool = false

var show1 = false
var show2 = false
var show3 = false
var show1_1 = false


var passkeyN = false
var passkeyB = false

var tutorial = false

#Settings:
#display
var Boss1 = false
var Boss2 = false
var Boss3 = false
var BossF = false


var fullscreen_on = false
var vsync_on = false
#audio
var master_vol = -10
var bgm_vol = -10
var sfx_vol = -10
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
	file.store_var(health_player_one)
	file.store_var(mana_player_one)
	file.store_var(player_location)
	pos_x = last_position.x
	pos_y = last_position.y
	file.store_var(pos_x)
	file.store_var(pos_y)
	file.store_var(dialogue0_intro)
	file.store_var(enemies_done)
	file.store_var(enemies_done_2)
	file.store_var(enemies_done_3)
	file.store_var(enemies_done_4)
	file.store_var(key_item_all)
	file.store_var(key_item1)
	file.store_var(key_item2)
	file.store_var(key_item3)
	file.store_var(final)
	file.store_var(next21)
	file.store_var(next22)
	file.store_var(world2_intro)
	file.store_var(world3_intro)
	file.store_var(world4_intro)
	file.store_var(worldF_intro)
	#file.store_var(variable4)
	file.store_var(skill_switch_state)
	file.store_var(counter)
	#file.store_var(skill_available)
	SA0 = skill_available[0]
	SA1 = skill_available[1]
	SA2 = skill_available[2]
	SA3 = skill_available[3]
	file.store_var((SA0))
	file.store_var((SA1))
	file.store_var((SA2))
	file.store_var((SA3))
	file.store_var(show1)
	file.store_var(show2)
	file.store_var(show3)
	file.store_var(show1_1)
	file.store_var(passkeyN)
	file.store_var(passkeyB)
	file.store_var(tutorial)
	file.store_var(fullscreen_on)
	file.store_var(vsync_on)
	file.store_var(master_vol)
	file.store_var(bgm_vol)
	file.store_var(sfx_vol)
	file.store_var(Boss1)
	file.store_var(Boss2)
	file.store_var(Boss3)
	file.store_var(BossF)
	
		
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		health_player_one = file.get_var(health_player_one)
		mana_player_one = file.get_var(mana_player_one)
		player_location = file.get_var(player_location)
		pos_x = file.get_var(pos_x)
		pos_y = file.get_var(pos_y)
		last_position.x = pos_x
		last_position.y = pos_y
		dialogue0_intro = file.get_var(dialogue0_intro)
		enemies_done = file.get_var(enemies_done)
		enemies_done_2 = file.get_var(enemies_done_2)
		enemies_done_3 = file.get_var(enemies_done_3)
		enemies_done_4 = file.get_var(enemies_done_4)
		key_item_all = file.get_var(key_item_all)
		key_item1 = file.get_var(key_item1)
		key_item2 = file.get_var(key_item2)
		key_item3 = file.get_var(key_item3)
		final = file.get_var(final)
		next21 = file.get_var(next21)
		next22 = file.get_var(next22)
		world2_intro = file.get_var(world2_intro)
		world3_intro = file.get_var(world3_intro)
		world4_intro = file.get_var(world4_intro)
		worldF_intro = file.get_var(worldF_intro)
		skill_switch_state = file.get_var(skill_switch_state)
		counter = file.get_var(counter)
		SA0 = file.get_var(SA0)
		SA1 = file.get_var(SA1)
		SA2 = file.get_var(SA2)
		SA3 = file.get_var(SA3)
		skill_available[0] = SA0
		skill_available[1] = SA1
		skill_available[2] = SA2
		skill_available[3] = SA3
		show1 = file.get_var(show1)
		show2 = file.get_var(show2)
		show3 = file.get_var(show3)
		show1_1 = file.get_var(show1_1)
		passkeyN = file.get_var(passkeyN)
		passkeyB = file.get_var(passkeyB)
		tutorial = file.get_var(tutorial)
		fullscreen_on = file.get_var(fullscreen_on)
		vsync_on = file.get_var(vsync_on)
		master_vol = file.get_var(master_vol)
		bgm_vol = file.get_var(bgm_vol)
		sfx_vol = file.get_var(sfx_vol)
		Boss1 = file.get_var(Boss1)
		Boss2 = file.get_var(Boss2)
		Boss3 = file.get_var(Boss3)
		BossF = file.get_var(BossF)

		
		
		#variable4 = file.get_var(variable4)
		
	else:
		print("no data saved...")
		health_player_one = 3
		mana_player_one = 100
		player_location = 1
		attack_set_state = true
		last_position = Vector2(0, 0)
		dialogue0_intro = false
		enemies_done = false
		enemies_done_2 = false
		enemies_done_3 = false
		enemies_done_4 = false
		key_item_all = false
		key_item1 = false
		key_item2 = false
		key_item3 = false
		final = false
		next21 = false
		next22 = false
		world2_intro = false
		world3_intro = false
		world4_intro = false
		worldF_intro = false
		skill_switch_state = 1
		skill_available=[1,0,0,0] 
		counter = 0
		show1 = false
		show2 = false
		show3 = false
		show1_1 = false
		passkeyN = false
		passkeyB = false
		tutorial = false
		fullscreen_on = false
		vsync_on = false
		master_vol = -10
		bgm_vol = -10
		sfx_vol = -10
		Boss1 = false
		Boss2 = false
		Boss3 = false
		BossF = false
		#variable4 = 0
		
		
