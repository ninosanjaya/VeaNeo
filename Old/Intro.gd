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
	animation_player.play("intro1")
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
	if Input.is_action_pressed("attack") or press == true: # InputEventScreenTouch :
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
	if anim_name == "intro1":
	#		animation_player.play("intro2")
	#elif anim_name == "intro2":
		Global.next_scene = "res://Old/world.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
		get_tree().change_scene_to_packed(load("res://Old/loading.tscn"))
		#get_tree().change_scene_to_file("res://world.tscn")
		GameManager.health_player_one = 3
		GameManager.mana_player_one = 100
		GameManager.skill_switch_state = 0
		GameManager.attack_set_state = true
		GameManager.dialogue0_intro = false
		GameManager.last_position = Vector2(-10,-10)
		GameManager.enemies_done = false
		GameManager.enemies_done_2 = false
		GameManager.world2_intro = false
		GameManager.world3_intro = false
		GameManager.world4_intro = false
		GameManager.worldF_intro = false
		GameManager.key_item_all = false
		GameManager.key_item1 = false
		GameManager.key_item2 = false
		GameManager.key_item3 = false
		GameManager.final = false
		GameManager.next21 = false
		GameManager.next22 = false
		GameManager.skill_switch_state = 1
		GameManager.skill_available=[1,0,0,0] 
		GameManager.counter = 0
		GameManager.show1 = false
		GameManager.show2 = false
		GameManager.show3 = false
		GameManager.show1_1 = false
		GameManager.passkeyN = false
		GameManager.passkeyB = false
		GameManager.tutorial = false
		
		GameManager.save()


	





func _on_touch_screen_button_pressed():
	press = true


func _on_touch_screen_button_released():
	press = false
