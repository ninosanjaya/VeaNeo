extends Node

#const SMALL_EXAMPLE_BALLOON = preload("res://addons/dialogue_manager/example_balloon/small_example_balloon.tscn")
#const EXAMPLE_BALLOON = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")
#const DIALOGUE = preload("res://dialogue.tscn")
#const BALLOON = preload("res://balloon.tscn")

#@export var dialogue_resource : DialogueResource
@export var dialogue_start : String = "start"
@onready var timer = $Timer
@onready var animation_player = $AnimationPlayer

var play : bool = false
var time_play : bool = true
@onready var sfx = $sfx
var press = false
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("outro1")
	#pass # Replace with function body.
#	print("starting cutscene")
	#var balloon: Node = SMALL_EXAMPLE_BALLOON.instantiate()
	#get_tree().current_scene.add_child(balloon)
	#balloon.start(dialogue_resource, dialogue_start)
	
	
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue1.dialogue"), "start")
	#return
	
#	timer.start()
	#get_tree().change_scene_to_file("res://world.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if animation_player.current_animation == "intro1":
	#	if Input.is_action_pressed("attack"):
	#		animation_player.play("intro2")
	#elif animation_player.current_animation == "intro2":
	#	get_tree().change_scene_to_file("res://world.tscn")
	#if animation_player.stop(false):
	if Input.is_action_pressed("attack") or press == true:
			animation_player.play()
			#print("play")
			play = true
			timer.start()
			sfx.playing = true
			#time_play = false
			
#	handle_animation()	
#	if Global.next1 == true:
#		get_tree().change_scene_to_file("res://world.tscn")
	
	#get_tree().change_scene_to_file("res://world.tscn")
	#if Input.is_action_pressed("attack"):
		#var balloon: Node = SMALL_EXAMPLE_BALLOON.instantiate()
		#get_tree().current_scene.add_child(balloon)
		#balloon.start(dialogue_resource, dialogue_start)
		
		#DialogueManager.show_dialogue_balloon(load("res://Dialogue1.dialogue"), "start")
		#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue1.dialogue"), "start")
		#return

func _on_timer_timeout():
	#time_play = true
	play = false

func pause_anim():
	if play  == true :
			#sfx.playing = true
			animation_player.play()
			#print("play")
			play = false
	
	else:
		animation_player.pause()
		#print("pause")
		play = false
	
#func handle_animation():
#	if Input.is_action_pressed("attack"):
#		animation_player.play()
#		print("play")
		
	#else:
	#	animation_player.stop(false)
	#	print("pause")
		
#func finish_anim():
#	get_tree().change_scene_to_file("res://world.tscn")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "outro1":
	#		animation_player.play("intro2")
	#elif anim_name == "intro2":
		#Credits, then go to menu
		get_tree().change_scene_to_file("res://Old/credits.tscn")
		#get_tree().change_scene_to_file("res://menu.tscn")
		
		


func _on_touch_screen_button_pressed():
	press = true

func _on_touch_screen_button_released():
	press = false
