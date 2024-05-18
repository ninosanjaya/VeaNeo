extends Control

@onready var yes = $VBoxContainer/Yes
@onready var no = $VBoxContainer/No


		
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.death = true	
	yes.grab_focus()
	#print("redy retry")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_yes_pressed():
	GameManager.health_player_one = 3
	Global.reset()
	#global_position = GameManager.last_position
	GameManager.load_data()
	#print("retry?")
	if GameManager.player_location == 1:
		get_tree().change_scene_to_file("res://practice.tscn")
	#elif GameManager.player_location == 2:
	#	get_tree().change_scene_to_file("res://practice.tscn")
	#elif GameManager.player_location == 3:
	#	get_tree().change_scene_to_file("res://Old/world_3.tscn")
	#elif GameManager.player_location == 4:
	#	get_tree().change_scene_to_file("res://Old/world_4.tscn")
	#elif GameManager.player_location == 5:
	#	get_tree().change_scene_to_file("res://Old/world_F.tscn")


func _on_no_pressed():
	
	#get_tree().change_scene_to_file("res://Old/menu.tscn")
	get_tree().quit()
