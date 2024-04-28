extends Area2D


var entered3 = false
#@onready var P1 = get_node("Player")
#@onready var P2 = get_node("Player2")
#@onready var Door1_pos = get_parent().get_node("World/Area2D")
@onready var world_2 = $"../.."
#@onready var first = $first
#@onready var P1 = $"../../Player"
#@onready var P2 = $"../../Player2"
#@onready var animation_player = $"../../AnimationPlayer"

@onready var dialogue_box = $"../../UI/DialogueBox"
@onready var sprite_2d = $"../Sprite2D"
@onready var animation_player_2 = $"../AnimationPlayer2"

#var shiori_meeting = false

#var next20 = false

@onready var player = $"../../Player"
@onready var player2 = $"../../Player2"


@onready var camera_2d = $"../../Camera2D"
@onready var camera_2d_2 = $"../../Camera2D2"
@onready var camera_2d_3 = $"../../Camera2D3"
@onready var camera_2d_4 = $"../../Camera2D4"

var room2 = false
@onready var blocker = $"../StaticBody2D/CollisionShape2D"

@onready var indicator_2 = $"../Indicator2"
@onready var indicator_3 = $"../Indicator3"

@onready var area_2d = $"../Area2D"

@onready var spawner = $".."
@onready var spawn_time = $Spawn_time3
var spawning = false

var switchc = false

func _process(_delta):
	#P1.animation_player.play("move")
	if Input.is_action_pressed("switchc"):
		switchc = true
	else:
		switchc = false
		
	if entered3 == true && switchc == false:
		#Global.talking = true
		#player.camera_2d.set_current(false)
		#player2.camera_2d.set_current(false)
			#animation_player.play("cutscene_boss1p2")
		#P1.animation_player.play("jump")
		#if world_2.switch == 1:
		#	P1.velocity.x = 200
		#	P1.direction.x = 1
		#	P1.animation_tree.set("parameters/move/blend_position", 1)
		#	first.start()
		#	print("runs")
			#room2 = true
		#player.camera_2d.enabled = false
		#player2.camera_2d.enabled = false
		camera_2d.enabled = false
		camera_2d_2.enabled = false
		camera_2d_3.enabled = true
		camera_2d_4.enabled = false
		#blocker.disabled = false
		
		if indicator_2.twoandthree == true && Global.Shiori_location == 3 && Global.lock != 3:
			
			sprite_2d.position = Vector2(3990,-147)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_disappear_to_left")
			var tween = create_tween()
			if tween.is_running():
				tween.stop()
			tween.tween_property(sprite_2d, "position", Vector2(3820,-211), 0.5)
			tween.play()
			
			Global.Shiori_location = 4	
			indicator_2.twoandthree = false
			print("3to4")
			Global.loop_counter_shiori += 1
			#spawn_time.start()
			#if Global.talking == false && area_2d.can_spawn == true && spawning == true: 
			spawner.spawn3()
			#	spawning = false
			
		elif indicator_3.threeandfour == true && Global.Shiori_location == 3 && Global.lock != 2:
		
			sprite_2d.position = Vector2(3960,28)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_disappear_to_left")
			var tween = create_tween()
			if tween.is_running():
				tween.stop()
			tween.tween_property(sprite_2d, "position", Vector2(3890,40), 0.5)
			tween.play()

			Global.Shiori_location = 2
			indicator_3.threeandfour = false
			print("3to2")
			Global.loop_counter_shiori += 1
			#spawn_time.start()
			#if Global.talking == false && area_2d.can_spawn == true && spawning == true: 
			spawner.spawn3()
			#	spawning = false
			
		elif indicator_2.twoandthree == true && Global.Shiori_location == 3 && Global.lock == 3:
			sprite_2d.position = Vector2(3942,-147)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_appear")	
		
			#Global.Shiori_location = 4	
			indicator_2.twoandthree = false
			#spawn_time.start()
			#if Global.talking == false && area_2d.can_spawn == true && spawning == true: 
			#spawner.spawn3()
			#	spawning = false
			#print("1to2")
			#Global.loop_counter_shiori += 1
		
		elif indicator_3.threeandfour == true && Global.Shiori_location == 3 && Global.lock == 2:
			sprite_2d.position = Vector2(3956,28)
			#animation_player.play("shiori_appear")
			#animation_player.queue("shiori_summon")
			animation_player_2.play("shiori_appear")

			#Global.Shiori_location = 2
			indicator_3.threeandfour = false
			#spawn_time.start()
			#if Global.talking == false && area_2d.can_spawn == true && spawning == true: 
			#spawner.spawn3()
			#	spawning = false
		
		elif Global.game_over == true :
			shake()
			
	elif entered3 == false && Global.death == true:
		camera_2d_3.enabled = false
		camera_2d.enabled = false
		camera_2d_2.enabled = false
		camera_2d_4.enabled = false
		player.camera_2d.enabled = true
		player2.camera_2d.enabled = true
		blocker.disabled = true
		area_2d.can_lock = false
		#Global.death = false
		Global.loop_counter_shiori = 0
		Global.lock = 0
		Global.locking = false
		Global.Shiori_location = 1 
		
	if Global.loop_counter_shiori == 6 && area_2d.can_lock == false:
			dialogue_box.start("lock_shiori")
			area_2d.can_lock = true
			area_2d.can_spawn = false
		
	#elif entered == false:
	#	room2 = false
	#	camera_2d.enabled = false
	#	camera_2d_2.enabled = false
	#	camera_2d_3.enabled = false
	#	camera_2d_4.enabled = false


		
		
func _on_body_entered(body):
	if (body is Player) or (body is Player2):
		entered3 = true



func _on_body_exited(_body):
	entered3 = false


#1 -> 2 (3319,32) Y -20
#2 -> 1 (3385,48)
#2 -> 3 (3903,64)
#3 -> 2 (3956,48)
#3 -> 4 (3942,-127)
#4 -> 3 (3872,-191)
#4 -> 1 (3416,-191)
#1 -> 1 (3326,-159)


func _on_spawn_time_3_timeout():
	spawning = true

var shake_strength : float = 0.0
var rng = RandomNumberGenerator.new()

func shake():
	#shake_strength = 10.0
	Input.start_joy_vibration(0,1,1,1)
	shake_strength = lerpf(10.0,0,1.2)
	camera_2d_3.offset = Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))	
	
