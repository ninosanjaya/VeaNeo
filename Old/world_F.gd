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

var Pos1 : Vector2 

var save_path = "user://variable.save"
const PON_DE_RING = preload("res://Old/pon_de_ring.tscn")
@onready var color_rect = $UI/ColorRect
@onready var camera_2d = $Camera2D

@onready var enemy_final_boss = $Enemy_final_boss

@onready var dialogue_box = $UI/DialogueBox

#var save_path = "user://variable.save"
var segments = [
	preload("res://Old/A.tscn")
	
]

@onready var areas = $Areas

var speed = 50
var stop = true
var can_switch_stop = true

var nextfinal1 = false
@onready var sprite_2d = $Sprite2D
@onready var boss_health = $Camera2D/Boss_health
@onready var sfx = $sfx


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().connect("go_back_requested", paused)
	#sprite_2d.visible = false
	#get_node("Player2").get_parent().queue_free()
	#get_node("Player2").hide()
	#get_node("Player2").position = Vector2(-200,-200)
	#get_node("Player").show()
	#print("ready")
	#self.add_child(P1)
	#self.add_child(P2)
	spawn_inst(0, 0)
	spawn_inst(+1280, 0)
	P1.camera_2d.enabled = false
	P2.camera_2d.enabled = false
	camera_2d.enabled = true
	Global.laser = false
	remove_child.call_deferred(enemy_final_boss)
	sprite_2d.visible = true
	sprite_2d.position = Vector2(-126,-145)
	GameManager.worldF_intro = false
	boss_health.visible = false
	
	
	if GameManager.worldF_intro == false:
		
		if switch == 1:
			P1.global_position = GameManager.last_position
		elif switch == 2:
			P2.global_position = GameManager.last_position
		#GameManager.last_position = P1.global_position
		#GameManager.worldF_intro = true
	#print(P1.state_machine) 
	#P1.Talk_time = true
	#P2.Talk_time = true
		
		#dialogue_box.start("enter_nerissa")
		dialogue_box.start("final_enter")
		stop = true
		nextfinal1 = true
		#GameManager.worldF_intro = true
		##GameManager.save()
		
		#GameManager.dialogue0_intro = true

		
	color_rect.visible = false
	GameManager.player_location = 5
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

	#var ring = PON_DE_RING.instantiate()
	#ring.position = Vector2(-188, -5)
	#add_child(ring) 
	#GameManager.save()
	
	

@onready var timer = $Timer
@onready var laser = $laser

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
			
func _process(delta):
	#print(P1.global_position)
	#print(P1.camera_2d.is_current())
	#print(P1.global_position)
	#print(Global.snap)
	#Nothing: Input.start_joy_vibration(0)
	#Get Hitted: Input.start_joy_vibration(0,0.5,0,1) #weak motor massage/vibrator, strong motor earthquake
	#Defeat: Input.start_joy_vibration(0,0.8,0.2,1)
	#Earthquake/Bad end: Input.start_joy_vibration(0,1,1,1)
	#print(stop)
	
	#print(Global.end)
	
	if Global.wardem_dead  == true && Global.end == false:
		stop = true
		
		
	elif Global.death == true:
		get_tree().change_scene_to_file("res://Old/world.tscn")
			#Door1_pos
			#GameManager.last_position = Vector2(2444, -263) #door 1
			#GameManager.last_position = Vector2(2437, -7) #door 2
		GameManager.last_position = Vector2(1748, -72) #door 3
		Global.death = false
		#GameManager.save()
	
	elif Global.end == true:
		print("end moving")
		get_tree().change_scene_to_file("res://Old/outro.tscn")

	
	if stop == false:
		#print("false stop")
		for area in areas.get_children():
			area.position.x -= speed*delta
			if area.position.x < -+1280:
				spawn_inst(area.position.x +2560, 0)
				#spawn_inst(area.position.x +960, 0)
				area.queue_free()
		check_snap(delta)
		#if can_switch_stop == true:
		#	timer.start()
		#	can_switch_stop = false
		#stop = true
		
	elif stop == true: #&& can_switch_stop == true:
	#	print("true stop")
		#timer.start()
		#can_switch_stop = false
		#stop = false
		pass
			
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
		
func spawn_inst(x,y):
	var inst = segments[randi() % len(segments)].instantiate()
	inst.position = Vector2(x,y)
	areas.add_child(inst)
	
func check_snap(delta):
	if switch == 1:
		if Global.snap == true:
			P1.position.x -= (speed)*delta
	elif switch == 2:
		if Global.snap == true:
			P2.position.x -= (speed)*delta
		
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
	
	
	



func _on_timer_timeout():
	#print("stop")
	#stop = !stop
	can_switch_stop = true

@onready var audio_stream_player_2 = $AudioStreamPlayer2


func _on_dialogue_box_dialogue_ended():
	if nextfinal1 == true:
		stop = false
		nextfinal1 = false
		sprite_2d.visible = false
		add_child(enemy_final_boss)
		enemy_final_boss.position = Vector2(-126,-150)
		boss_health.visible = true
		audio_stream_player_2.playing = true


func _on_dialogue_box_dialogue_proceeded(node_type):
	sfx.playing = true
