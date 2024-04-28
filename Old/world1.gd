extends Node2D

#class_name GameWorld1 

#@onready var cameraNode : Camera2D = get_node("Player/Camera2D")
@export var switch : float = 1
@export var switch_time : bool = true
#1 = player 1
#2 = player 2
@onready var P1 = get_node("Player")
@onready var P2 = get_node("Player2")
@onready var switch_timer = $SwitchTimer

@onready var animation_player = $AnimationPlayer
@onready var pero_fake = $"Pero fake"


var Pos1 : Vector2 
#const SMALL_EXAMPLE_BALLOON = preload("res://addons/dialogue_manager/example_balloon/small_example_balloon.tscn")
#const EXAMPLE_BALLOON = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")
#const DIALOGUE = preload("res://dialogue.tscn")
#const BALLOON = preload("res://balloon.tscn")

#@export var dialogue_resource : DialogueResource
#@export var dialogue_start : String = "start"

#var save_path = "user://variable.save"
# Called when the node enters the scene tree for the first time.

@onready var backgrounds_inside_first_v_2 = $BackgroundsInsideFirstV2
#var new_texture = preload("res://Assets/Passport1Closed.png")
const BACKGROUNDS_INSIDE_V_2 = preload("res://backgrounds_inside_V2.png")

#func _enter_tree():
#	if GameManager.last_position:
#		if switch == 1:
#			P1.global_position = GameManager.last_position
#		elif switch == 2:
#			P2.global_position = GameManager.last_positiin
			
		
var first_intro : bool = false
@onready var dialogue_box = $UI/DialogueBox
@onready var sfx = $sfx

func _ready():
	
	#print(GameManager.last_position)
	get_tree().get_root().connect("go_back_requested", paused)
	
	self.remove_child(P2)
	GameManager.player_location = 1
	
	if GameManager.dialogue0_intro == false:
		introcut()	
		#GameManager.dialogue0_intro = true
		pero_fake.visible = true
		GameManager.enemies_done = false
		GameManager.enemies_done_2 = false
		GameManager.save()
		#P1.Talk_time = false
		#P2.Talk_time = false
	
	#elif GameManager.dialogue0_intro == true:
	#	P1.global_position = GameManager.last_position
		#P2.global_position = GameManager.last_positiin
		
	#get_node("Player2").get_parent().queue_free()
	#get_node("Player2").hide()
	#get_node("Player2").position = Vector2(-200,-200)
	#get_node("Player").show()

	#self.add_child(P1)
	#self.add_child(P2)
	
	#P1.Talk_time = false
	#P2.Talk_time = false
	#if GameManager.last_position:
	if switch == 1:
			P1.global_position = GameManager.last_position
			Global.death = false
	elif switch == 2:
			P2.global_position = GameManager.last_position
			Global.death = false
	#GameManager.save()
	#backgrounds_inside_first_v_2.texture = BACKGROUNDS_INSIDE_V_2
	#print(backgrounds_inside_first_v_2.texture)
	#print(self.get_path())  # prints /root/Control/Node2D
	#print(P1.position)
	#print(P1.global_position)
	#self.remove_child(get_node("Player2"))
	#res://Character/player.tscn
# Called every frame. 'delta' is the elapsed time since the previous frame.



func introcut():
	#self.remove_child(P2)
	P1.global_position = Vector2(-10,-10)
	GameManager.last_position = P1.global_position

	#GameManager.save()
	animation_player.play("pero_idle")
	#print(P1.state_machine) 
	#P1.Talk_time = true
	#P2.Talk_time = true
	dialogue_box.start("Intro_dialogue1")
	#dialogue_box.start("testing")
	#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue1.dialogue"), "start")
	#return
	
	
	#P1.TIME_TO_MOVE = true
signal toggle_game_paused(is_paused : bool)
var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)

func _input(event: InputEvent):
	if (event.is_action_pressed("menu")):
			game_paused = !game_paused
	

func paused():
	game_paused = !game_paused
	
func _process(_delta):
	
	#if Global.talking == true && Global.talking1 == true && Input.is_action_pressed("attack") :
	#	sfx.playing = true
	#if Input.is_action_pressed("down"):
	#	print("down")
	#print(GameManager.skill_switch_state)
	#print(Global.talking)
	#if first_intro == true:
	#P1.Talk_time = Global.talking
	#P2.Talk_time = Global.talking
	#print(global_position)
	#print(P1.global_position)
	#func _process(_delta):
	#print(GameManager.dialogue0_intro)
	if GameManager.dialogue0_intro == true:
		pero_fake.visible = false
	if GameManager.dialogue0_intro == false && Global.talking == false:
		pero_fake.visible = false
		GameManager.dialogue0_intro = true
		#GameManager.save()
	#if Input.is_action_pressed("attack"):
		#var balloon: Node = SMALL_EXAMPLE_BALLOON.instantiate()
		#get_tree().current_scene.add_child(balloon)
		#balloon.start(dialogue_resource, dialogue_start)
		

	#	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue1.dialogue"), "start")
	#	return
		
	#if Input.is_action_pressed("back"):
	#	get_tree().change_scene_to_file("res://menu_pause.tscn")
		
	if Input.is_action_pressed("map") && switch == 1 && switch_time == true && Global.talking == false:
		#get_node("Player").get_parent().queue_free()
		#get_node("Player").position = Vector2(-100,-100)
		
		
		Pos1 = P1.global_position
		self.add_child(P2)
		self.remove_child(P1)

		#get_viewport().get_camera() = get_node("Player2/Camera2D2")
		
		P2.global_position = Pos1
		#get_node("Player2").position = Vector2(-100,-100)
		switch_timer.start()
		switch_time = false

		switch = 2
	
	elif Input.is_action_pressed("map") && switch == 2 && switch_time == true && Global.talking == false:
		
		Pos1 = P2.global_position
		self.add_child(P1)
		self.remove_child(P2)

		#get_viewport().get_camera() = get_node("Player2/Camera2D2")
		
		P1.global_position = Pos1
		#get_node("Player").position = Vector2(-100,-100)
		switch_timer.start()
		switch_time = false
		switch = 1
		
		


func _on_switch_timer_timeout():
	switch_time = true
	
	

	



func _on_dialogue_box_dialogue_proceeded(node_type):
	#print("proceed")
	sfx.playing = true
