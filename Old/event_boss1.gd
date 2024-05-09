extends Area2D


var entered1 = false
#@onready var P1 = get_node("Player")
#@onready var P2 = get_node("Player2")
#@onready var Door1_pos = get_parent().get_node("World/Area2D")
@onready var world_2 = $"../.."
@onready var first = $first
#@onready var P1 = $"../../Player"
#@onready var P2 = $"../../Player2"
@onready var animation_player = $"../AnimationPlayer"

@onready var dialogue_box = $"../../UI/DialogueBox"
@onready var sprite_2d = $"../Sprite2D"
@onready var animation_player_2 = $"../AnimationPlayer2"

var shiori_meeting = false

var next20 = false
var next21_end = false


@onready var player = $"../../Player"
@onready var player2 = $"../../Player2"


@onready var camera_2d = $"../../Camera2D"
@onready var camera_2d_2 = $"../../Camera2D2"
@onready var camera_2d_3 = $"../../Camera2D3"
@onready var camera_2d_4 = $"../../Camera2D4"

var room1 = false
@onready var blocker = $"../StaticBody2D/CollisionShape2D"

@export var Start_Boss_shiori = false

@export var Where_state1 = false
@export var Where_state2 = false
@export var Where_state3 = false
@export var Where_state4 = false

@onready var indicator_1 = $"../Indicator1"
@onready var indicator_4 = $"../Indicator4"

@export var can_lock = false
@export var can_spawn = true
@onready var spawner = $".."
@onready var spawn_time = $Spawn_time

var spawning = false
@onready var alltime = $"../ALLTIME"
@onready var timer_label = $"../../UI/Timer"

var switchc = false

@onready var audio_stream_player = $"../../AudioStreamPlayer"
@onready var audio_stream_player2 = $"../AudioStreamPlayer"


func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered1 = true


func _on_body_exited(_body):
	entered1 = false
	
func _ready():
	
	camera_2d.enabled = false
	camera_2d_2.enabled = false
	camera_2d_3.enabled = false
	camera_2d_4.enabled = false
	blocker.disabled = true
	timer_label.visible = false
	#spawner.spawn1()
func _process(_delta):
	#P1.animation_player.play("move")
	#room()
	#dialogue_box.start("lock_shiori")
	#print(Global.death)
	#print(player2.position)
	#print(player.camera_2d.enabled)

	#shake()
	timer_label.set_text(str(alltime.get_time_left()).pad_decimals(2))
	#print(entered)
	if Input.is_action_pressed("switchc"):
		switchc = true
	else:
		switchc = false
		
	if entered1 == true && switchc == false:
		#Global.talking = true
		#player.camera_2d.set_current(false)
		#player2.camera_2d.set_current(false)
		#print("cutscene")
		player.camera_2d.enabled = false
		player2.camera_2d.enabled = false
		camera_2d.enabled = true
		camera_2d_2.enabled = false
		camera_2d_3.enabled = false
		camera_2d_4.enabled = false
		blocker.disabled = false
		GameManager.Boss1 = true
		print(Global.lock)
		
		if world_2.switch == 1 && shiori_meeting == false && Start_Boss_shiori == false && GameManager.Boss1 == true:
			
			
			audio_stream_player.volume_db = -70
			animation_player.play("cutscene_boss1")
			shiori_meeting = true
			GameManager.Boss1 = false
			#print("scene1")
		elif world_2.switch == 2 && shiori_meeting == false && Start_Boss_shiori == false && GameManager.Boss1 == true:
			world_2.fuwatime()
			#world_2.switch = 1
			audio_stream_player.volume_db = -70
			animation_player.play("cutscene_boss1")
			shiori_meeting = true
			GameManager.Boss1 = false
			#print("scene1")
			
		
		if Start_Boss_shiori == true:
			#world_2.mocotime()
			#sprite_2d.position = Vector2(3319,12)
			#animation_player_2.play("shiori_appear")
			#animation_player_2.queue("shiori_summon")
			#spawner.spawn1()
			#animation_player_2.queue("shiori_disappear")
			#Global.Shiori_location = 2
			Start_Boss_shiori = false
			indicator_4.fourandone = true
			alltime.start()
			timer_label.visible = true
			
			
		
		if indicator_4.fourandone == true && Global.Shiori_location == 1 && Global.lock != 1:
			
			sprite_2d.position = Vector2(3310,10)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_disappear_to_right")
			var tween = create_tween()
			if tween.is_running():
				tween.stop()
			tween.tween_property(sprite_2d, "position", Vector2(3410,14), 0.5)
			tween.play()
			#sprite_2d.position = Vector2(3385,28)
			
			Global.Shiori_location = 2		
			indicator_4.fourandone = false
			print("1to2")
			Global.loop_counter_shiori += 1
			#spawn_time.start()
			#if Global.talking == false && can_spawn == true && spawning == true: 
			spawner.spawn1()
				#spawning = false
			
		elif indicator_1.oneandtwo == true && Global.Shiori_location == 1 && Global.lock != 4 :
		
			sprite_2d.position = Vector2(3320,-179)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_disappear_to_right")
			var tween = create_tween()
			if tween.is_running():
				tween.stop()
			tween.tween_property(sprite_2d, "position", Vector2(3430,-211), 0.5)
			tween.play()
			
			
			Global.Shiori_location = 4
			indicator_1.oneandtwo = false
			print("1to4")
			Global.loop_counter_shiori += 1
			#spawn_time.start()
			#if Global.talking == false && can_spawn == true && spawning == true: 
			spawner.spawn1()
			#	spawning = false
			
		elif indicator_4.fourandone == true && Global.Shiori_location == 1 && Global.lock == 1:
			sprite_2d.position = Vector2(3319,12)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_appear")	
			
			#Global.Shiori_location = 2		
			indicator_4.fourandone = false
			#spawn_time.start()
			#if Global.talking == false && can_spawn == true && spawning == true: 
			#spawner.spawn1()
			#	spawning = false
			#print("1to2")
			#Global.loop_counter_shiori += 1
		
		elif indicator_1.oneandtwo == true && Global.Shiori_location == 1 && Global.lock == 4:
			sprite_2d.position = Vector2(3326,-179)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_appear")
			#Global.Shiori_location = 4
			indicator_1.oneandtwo = false
			#spawn_time.start()
			#if Global.talking == false && can_spawn == true && spawning == true: 
			#spawner.spawn1()
			#	spawning = false
			#print("1to4")
			#Global.loop_counter_shiori += 1
		
		elif Global.game_over == true:
			shake()
			
	elif entered1 == false && Global.death == true:
		alltime.stop()
		timer_label.visible = false
		camera_2d.enabled = false
		camera_2d_2.enabled = false
		camera_2d_3.enabled = false
		camera_2d_4.enabled = false
		player.camera_2d.enabled = true
		player2.camera_2d.enabled = true
		blocker.disabled = true
		shiori_meeting = false
		Start_Boss_shiori = false
		can_lock = false
		next20 = false
		#Global.death = false
		Global.loop_counter_shiori = 0
		Global.lock = 0
		Global.locking = false
		Global.Shiori_location = 1 
		player.global_position = GameManager.last_position
		player2.global_position = GameManager.last_position
		audio_stream_player.playing = true
		audio_stream_player2.playing = false
		audio_stream_player.volume_db = -50
		
		
	if Global.loop_counter_shiori == 6 && can_lock == false:
		
			dialogue_box.start("lock_shiori")
			Global.talking = true
			can_lock = true
			can_spawn = false
	
			
			#animation_player.play("cutscene_boss1p2")
		#P1.animation_player.play("jump")
		#if world_2.switch == 1:
		#	P1.velocity.x = 200
		#	P1.direction.x = 1
		#	P1.animation_tree.set("parameters/move/blend_position", 1)
		#	first.start()
		#	print("runs")
		
	#elif entered == false && shiori_meeting == false:
		#camera_2d.enabled = false
		#camera_2d_2.enabled = false
		#camera_2d_3.enabled = false
		#camera_2d_4.enabled = false
		#blocker.disabled = true
	
	

func _on_first_timeout():
	print("done")

func shiori_meet():
	dialogue_box.start("shiori_meet")
	#dialogue_box.start("lock_shiori")
	Global.talking = true
	next20 = true
	#world_2.mocotime()

func shiori_ending():
	dialogue_box.start("shiori_end")
	#dialogue_box.start("lock_shiori")
	Global.talking = true
	next21_end = true
	audio_stream_player.playing = true
	audio_stream_player2.playing = false
	audio_stream_player.volume_db = -70
	#next20 = true
	
func _on_dialogue_box_dialogue_ended():
	Global.talking = false
	if next20 == true:
		
		animation_player_2.play("shiori_disappear_to_right")
		var tween = create_tween()
		if tween.is_running():
			tween.stop()
		tween.tween_property(sprite_2d, "position", Vector2(3400,9), 0.5)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
	#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
		tween.play()
		next20 = false
		Start_Boss_shiori = true
		audio_stream_player.playing = false
		audio_stream_player2.playing = true
		#world_2.switch = 2
	if next21_end == true:
		#GameManager.last_position = global_position
			#print(GameManager.variable4)
			#GameManager.health_player_one = 3
			#GameManager.mana_player_one = 100
		
		GameManager.key_item1 = true
		GameManager.skill_available[1] = 1.1
		GameManager.player_location = 1
		Global.next_scene = "res://Old/world.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
		get_tree().change_scene_to_packed(preload("res://Old/loading.tscn"))
		#get_tree().change_scene_to_file("res://world.tscn")
			#Door1_pos
		GameManager.last_position = Vector2(2350,-263)
		GameManager.save()

#func room():
#	if shiori_meeting == true:
#		player.camera_2d.enabled = false
#		player2.camera_2d.enabled = false
#		camera_2d.enabled = true
#		blocker.disabled = false
		
		
#1 -> 2 (3319,32) Y -20
#2 -> 1 (3385,48)
#2 -> 3 (3903,64)
#3 -> 2 (3956,48)
#3 -> 4 (3942,-127)
#4 -> 3 (3872,-191)
#4 -> 1 (3416,-191)
#1 -> 4 (3326,-159)


func _on_spawn_time_timeout():
	spawning = true

@onready var gmover = $gmover

func _on_alltime_timeout():
	timer_label.visible = false
	Global.talking = true
	Global.game_over = true
	animation_player_2.play("game_over_shiori")
	gmover.playing = true
	
	
func GM_shiori():
	Global.talking = false
	GameManager.health_player_one -= 3
	Global.game_over = false
	#GameManager.save()
	
var shake_strength : float = 0.0
var rng = RandomNumberGenerator.new()
#@onready var camera_2d = $"../../Camera2D"

func shake():
	#shake_strength = 10.0
	Input.start_joy_vibration(0,1,1,1)
	shake_strength = lerpf(10.0,0,1.2)
	camera_2d.offset = Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))	
	
