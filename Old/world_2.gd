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
const PON_DE_RING = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING2 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING3 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING4 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING5 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING6 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING7 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING8 = preload("res://Old/pon_de_ring.tscn")
const PON_DE_RING9 = preload("res://Old/pon_de_ring.tscn")

#@export var PON_DE_RING : PackedScene
@onready var dialogue_box = $UI/DialogueBox

var Pos1 : Vector2 

var bread_geto = false
@onready var color_rect = $UI/ColorRect
@onready var camera_2d = $Camera2D

@onready var sprite_2d = $UI/Sprite2D
@onready var audio_stream_player = $AudioStreamPlayer

@onready var sfx = $sfx

#var save_path = "user://variable.save"

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("ready")
	get_tree().get_root().connect("go_back_requested", paused)
	audio_stream_player.playing = true
	sprite_2d.visible = false
	#get_node("Player2").get_parent().queue_free()
	#get_node("Player2").hide()
	#get_node("Player2").position = Vector2(-200,-200)
	#get_node("Player").show()

	#self.add_child(P1)
	#self.add_child(P2)
	if GameManager.world2_intro == false:
		
		if switch == 1:
			P1.global_position = GameManager.last_position
		elif switch == 2:
			P2.global_position = GameManager.last_position
		#GameManager.last_position = P1.global_position
		GameManager.world2_intro = true
		GameManager.save()
	#print(P1.state_machine) 
	#P1.Talk_time = true
	#P2.Talk_time = true
		dialogue_box.start("shiori_enter")
		#GameManager.dialogue0_intro = true

		
	color_rect.visible = false
	GameManager.player_location = 2
	self.remove_child(P2)
	#P1.global_position = Vector2(-10,-10)
	#if GameManager.last_position:
	#GameManager.last_position = Vector2(-10,-10)
	if switch == 1:
			P1.global_position = GameManager.last_position
			Global.death = false
	elif switch == 2:
			P2.global_position = GameManager.last_position
			Global.death = false
	#print(self.get_path())  # prints /root/Control/Node2D
	#print(P1.position)
	#print(P1.global_position)
	#self.remove_child(get_node("Player2"))
	#res://Character/player.tscn
# Called every frame. 'delta' is the elapsed time since the previous frame.

	var ring = PON_DE_RING.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	ring.position = Vector2(1390, -14)
	#ring.position = Vector2(1170, -235)
	add_child(ring) 
	
	var ring2 = PON_DE_RING2.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring2.position = Vector2(1170, -235)
	add_child(ring2) 
	
	var ring3 = PON_DE_RING3.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring3.position = Vector2(2919,-87)
	add_child(ring3) 
	
	var ring4 = PON_DE_RING4.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring4.position = Vector2(3499,-375)
	add_child(ring4) 

	var ring5 = PON_DE_RING5.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring5.position = Vector2(3847,-375)
	add_child(ring5)

	var ring6 = PON_DE_RING6.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring6.position = Vector2(4331,-42)
	add_child(ring6)

	var ring7 = PON_DE_RING7.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring7.position = Vector2(3574,190)
	add_child(ring7)
	
	var ring8 = PON_DE_RING8.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring8.position = Vector2(3727,190)
	add_child(ring8)

	var ring9 = PON_DE_RING9.instantiate()
	#money.connect("body_entered", self, "_on_Coin_body_entered")
	#ring2.position = Vector2(1390, -14)
	ring9.position = Vector2(-150,-22)
	add_child(ring9)
	#GameManager.save()
	
	
	
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
	#print(Global.loop_counter_shiori)
	#print(Global.lock)
	#rint(Global.death)
	#print(Global.loop_counter_shiori)
	#print("Process")
	#print( Global.talking )
	#print(P1.position)
	#print(P2.position)
	#print(P1.camera_2d.is_current())
	#print(P1.global_position)
	#Nothing: Input.start_joy_vibration(0)
	#Get Hitted: Input.start_joy_vibration(0,0.5,0,1) #weak motor massage/vibrator, strong motor earthquake
	#Defeat: Input.start_joy_vibration(0,0.8,0.2,1)
	#Earthquake/Bad end: Input.start_joy_vibration(0,1,1,1)
	#
	#if Input.is_action_pressed("back"):
	#	get_tree().change_scene_to_file("res://menu_pause.tscn")
		
	if Input.is_action_pressed("map") && switch == 1 && switch_time == true && Global.talking == false:
		#get_node("Player").get_parent().queue_free()
		#get_node("Player").position = Vector2(-100,-100)
		
		
		Pos1 = P1.global_position
		self.add_child(P2)
		self.remove_child(P1)

		#get_viewport().get_camera() = get_node("Player2/Camera2D2")
		#self.add_child(P2)
		P2.global_position = Pos1
		#get_node("Player2").position = Vector2(-100,-100)
		#P1.camera_2d.enabled = false
		#P2.camera_2d.enabled = true
		switch_timer.start()
		switch_time = false

		switch = 2
	
	elif Input.is_action_pressed("map") && switch == 2 && switch_time == true && Global.talking == false:
		
		Pos1 = P2.global_position
		self.add_child(P1)
		self.remove_child(P2)

		#get_viewport().get_camera() = get_node("Player2/Camera2D2")
		#self.add_child(P1)
		P1.global_position = Pos1
		#get_node("Player").position = Vector2(-100,-100)
		#P1.camera_2d.enabled = true
		#P2.camera_2d.enabled = false
		switch_timer.start()
		switch_time = false
		switch = 1
		
		
func fuwatime():
		
		Pos1 = P2.global_position
		self.add_child(P1)
		self.remove_child(P2)


		P1.global_position = Pos1

		#switch_timer.start()
		#switch_time = false
		switch = 1
func mocotime():
	
		Pos1 = P1.global_position
		self.add_child(P2)
		self.remove_child(P1)

		#get_viewport().get_camera() = get_node("Player2/Camera2D2")
		#self.add_child(P2)
		P2.global_position = Pos1
		switch = 2

func _on_switch_timer_timeout():
	switch_time = true
	
	



#func _on_area_2d_body_exited(body):
#	pass # Replace with function body.





func _on_dialogue_box_dialogue_proceeded(node_type):
	sfx.playing = true
