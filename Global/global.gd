extends Node

var current_scene = null

#var health_player_one = 3
#var mana_player_one = 100
#var player_location = 1

#var skill_switch_state = 0
#var attack_set_state = 2
#var attack_set_state : bool = true

var talking : bool = false
var talking1 : bool = false
var finish_tutorial1 : bool = false
var next1 : bool = false


var enemy1 : bool = false
var enemy2 : bool = false
var enemy3 : bool = false

var enemy4 : bool = false
var enemy5 : bool = false
var enemy6 : bool = false
var enemy7 : bool = false

var enemy8 : bool = false
var enemy9 : bool = false
var enemy10 : bool = false

var enemy11 : bool = false
var enemy12 : bool = false
var enemy13 : bool = false
var enemy14 : bool = false


var enemy_knockback : bool = false
var Shiori_location = 1
var loop_counter_shiori = 0
var locking = false
var lock = 0

var death = false
var game_over = false


var sensor_AL = 0
var sensor_AU = 0
var sensor_AD = 0
var sensor_AR = 0

var score : int = 0
var passkeyNumber = ""
var rhythm_start = false

var dog = false
var openB = false

var there_pebble = true
var pebble_dead = false
var count_pebble = 0
var game_over_pebble = false
var next20 = false

var snap = false
var wardem_dead = false
var laser = false
var throw = false
var recoil = false

var end = false

var can_skill : bool = true

#VEA NEO:
var control_metal = false


#scenes
var next_scene = ""

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene

func toggle_fullscreen(value):
	if value == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	GameOption.fullscreen_on = value
	#GameManager.save()
	#OS.window_fullscreen = value
	
func toggle_vsync(value):
	if value == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	GameOption.vsync_on = value
	#GameManager.save()
	
func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	GameOption.master_vol = vol
	#GameManager.save()
	
func update_bgm_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	GameOption.bgm_vol = vol
	#GameManager.save()
	
func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	GameOption.sfx_vol = vol
	#GameManager.save()
	
		
func reset():
	current_scene = null


	talking = false
	talking1 = false
	finish_tutorial1 = false
	next1 = false


	enemy1 = false
	enemy2 = false
	enemy3  = false

	enemy4 = false
	enemy5  = false
	enemy6  = false
	enemy7 = false

	enemy8  = false
	enemy9  = false
	enemy10  = false

	enemy11  = false
	enemy12  = false
	enemy13  = false
	enemy14  = false


	enemy_knockback = false
	Shiori_location = 1
	loop_counter_shiori = 0
	locking = false
	lock = 0
	death = false
	game_over = false


	sensor_AL = 0
	sensor_AU = 0
	sensor_AD = 0
	sensor_AR = 0

	score  = 0
	passkeyNumber = ""
	rhythm_start = false

	dog = false
	openB = false

	there_pebble = true
	pebble_dead = false
	count_pebble = 0
	game_over_pebble = false
	next20 = false

	snap = false
	wardem_dead = false
	laser = false
	throw = false
	recoil = false

	end = false
	can_skill = true

