extends Control

#Autosave & load at last checkpoint you died
#Save only at checkpoint "pero"
#
#In the future if need repeat to get multiple ending add option to skip tutorial
@onready var resume = $MarginContainer/VBoxContainer/Resume
#@export var game_world : GameWorld
@onready var game_world = get_parent().get_parent()
@onready var option_menu = $Option_menu
@onready var sfx = $sfx

#func _process(_delta):
func _ready():
	#print(game_world.name)
	sfx.playing = false
	hide()
	#game_world.connect("toggle_game_paused", _on_game_world_toggle_game_paused)

	game_world.connect("toggle_game_paused", _on_game_world_toggle_game_paused)
	resume.grab_focus()
	
func _process(_delta):
	#print(GameManager.master_vol)
	#print("do something")
	#if Input.is_action_pressed("back") :
	#	game_world.game_paused = false
	pass
	
func _on_game_world_toggle_game_paused(is_paused : bool):
	if (is_paused):
		sfx.playing = true
		resume.grab_focus()
		show()
	else:
		hide()
		
	
#func _input(event: InputEvent):
#	if (event.is_action_pressed("back")):
#			game_world.game_paused = false
#			sfx.playing = true
			
func _on_resume_pressed():
	
	game_world.game_paused = false
	sfx.playing = true

		
func _on_option_pressed():
	sfx.playing = true
	option_menu.popup_centered()
	#get_tree().change_scene_to_file("res://option.tscn")



func _on_main_menu_pressed():
	sfx.playing = true
	game_world.game_paused = false
	get_tree().change_scene_to_file("res://Old/menu.tscn")


func _on_quit_pressed():
	sfx.playing = true
	get_tree().quit()









