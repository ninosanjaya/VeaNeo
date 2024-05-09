extends Control

#MAIN MENU 
#TODO: ################################################################################
#
#Later/Optional bugs & improvement:
# enemy stop walking after getting attack (enable state label first)
##-Program/add VFX/SFX, paralax effect background, effects stuff
#redraw stuff:
#-?
#-Testing with controller?
#
#
#Credits:
#Ninhydro Studio
#Nino Sanjaya
#?
#Godot 4.2
#bugs fix:
#

#######################################################################################
#
#const GAME_MANAGER = preload("res://game_manager.tscn")
@onready var start = $MarginContainer/VBoxContainer/Start
@onready var option_menu = $Option_menu
@onready var sfx = $sfx
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var continue1 = $MarginContainer/VBoxContainer/Continue

func _ready():
	animated_sprite_2d.play("default")
	sfx.playing = false
	start.grab_focus()
	#print("menu")
	#GameOption.fullscreen_on = false
	#GameOption.vsync_on = false
	#GameOption.master_vol = 90
	#GameOption.bgm_vol = 90
	#GameOption.sfx_vol = 90
	if FileAccess.file_exists("user://savefile2.save"):
		continue1.disabled = false
	else:
		continue1.disabled = true

func _on_play_pressed():
	sfx.playing = true
	get_tree().change_scene_to_file("res://Old/intro.tscn")
	#Cutscene intro world the -> world.tscn

func _on_continue_pressed():
	#print("preesssedd")
	sfx.playing = true
	Global.reset()
	GameManager.load_data()
	#print(GameManager.player_location)
	if GameManager.player_location == 1:
		Global.next_scene = "res://Old/world.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
		get_tree().change_scene_to_packed(load("res://Old/loading.tscn"))
	elif GameManager.player_location == 2:
		Global.next_scene = "res://Old/world_2.tscn"
		get_tree().change_scene_to_packed(load("res://Old/loading.tscn"))
	elif GameManager.player_location == 3:
		Global.next_scene = "res://Old/world_3.tscn"
		get_tree().change_scene_to_packed(load("res://Old/loading.tscn"))
	elif GameManager.player_location == 4:
		Global.next_scene = "res://Old/world_4.tscn"
		get_tree().change_scene_to_packed(load("res://Old/loading.tscn"))
	elif GameManager.player_location == 5:
		Global.next_scene = "res://Old/world_F.tscn"
		get_tree().change_scene_to_packed(load("res://Old/loading.tscn"))
		
	#print(GameManager.variable4)

func _on_option_pressed():
	sfx.playing = true
	option_menu.popup_centered()
	#get_tree().change_scene_to_file("res://option.tscn")
	


func _on_quit_pressed():
	sfx.playing = true
	get_tree().quit()



