extends Node2D

var game_start = false

const AL = preload("res://move_arrow_left.tscn")
const AU = preload("res://move_arrow_up.tscn")	
const AD = preload("res://move_arrow_down.tscn")	
const AR = preload("res://move_arrow_right.tscn")	

@onready var position1 = $Create/Marker2D.global_position
@onready var position2 = $Create/Marker2D2.global_position
@onready var position3 = $Create/Marker2D3.global_position
@onready var position4 = $Create/Marker2D4.global_position
	
var random = 0
var RNG = RandomNumberGenerator.new()

var start = false
@onready var animation_player = $AnimationPlayer
var time_elapsed := 0.0
@onready var timer_2 = $Timer2
var press = false
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@onready var player = get_parent().get_parent().get_node("Player")
@onready var player2 = get_parent().get_parent().get_node("Player2")

@onready var camera = get_parent().get_parent().get_node("Camera2D")

func _ready():
	animation_player.active = true
	visible = false
	#print(player.position)
#high score 2500
#goal is 2000 to beat Nerissa
#Make goal like filling bottle goal
func _process(_delta):
	#print(time_elapsed)
	if game_start == true:
		#time_elapsed += delta
		if start == false: 
			visible = true
			animation_player.play("Game_rhythm")
			#audio_stream_player_2d.play()
			Global.talking = true
			start = true
			Global.rhythm_start = true
			#rint("start boss rythm game")
			#$Timer.start()
			#position.y += speed
		
	#if Input.is_action_pressed("left") && press == false:
	#	print("left")
	#	press = true
	#	timer_2.start()
	#if Input.is_action_pressed("up") && press == false:
	#	print("up")
	#	press = true
	#	timer_2.start()
	#if Input.is_action_pressed("down") && press == false:
	#	print("down")
	#	press = true
	#	timer_2.start()
	#if Input.is_action_pressed("right") && press == false:
	#	print("right")
	#	press = true
	#	timer_2.start()


func _on_timer_timeout():
	$Timer.start()
	RNG.randomize()
	var random_int = RNG.randi_range(0,4)
	random = random_int
	
	if random == 1:
		var al = AL.instantiate()
		#position1.add_child(al)		
		get_parent().add_child(al)
		al.position = $Create/Marker2D.global_position
	if random == 2:
		var au = AU.instantiate()
		#position2.add_child(au)		
		get_parent().add_child(au)
		au.position = $Create/Marker2D2.global_position
	if random == 3:
		var ad = AD.instantiate()
		#position3.add_child(ad)		
		get_parent().add_child(ad)
		ad.position = $Create/Marker2D3.global_position
	if random == 4:
		var ar = AR.instantiate()
		#position4.add_child(ar)		
		get_parent().add_child(ar)
		ar.position = $Create/Marker2D4.global_position
		

func left():
		var al = AL.instantiate()
		#position1.add_child(al)		
		get_parent().add_child(al)
		al.position = $Create/Marker2D.global_position
		
func up():
		var au = AU.instantiate()
		#position2.add_child(au)		
		get_parent().add_child(au)
		au.position = $Create/Marker2D2.global_position
		
func down():
		var ad = AD.instantiate()
		#position3.add_child(ad)		
		get_parent().add_child(ad)
		ad.position = $Create/Marker2D3.global_position
		
func right():
		var ar = AR.instantiate()
		#position4.add_child(ar)		
		get_parent().add_child(ar)
		ar.position = $Create/Marker2D4.global_position
		
#
#Fuwamoco Rhythm game, important Fuwamoco time:
# 1. 0:33-0:48
# 2. 1:34-1:48 (94-108)
# 3. 
#
#Important Nerissa time:
# 1. 1:12-1:26 (72 -86)
# 2. 2:11-2:26 (131-146)
#
#optional done at 2:30
#Buttons:
#


func _on_timer_2_timeout():
	press = false

var Rhythm_done = false

func _on_animation_player_animation_finished(_anim_name):
	audio_stream_player_2d.stop()
	if Global.score > 2200:
		print("WIN")
		visible = false
		Rhythm_done = true
	else:
		camera.enabled = false
		player.camera_2d.enabled = true
		player2.camera_2d.enabled = true
		visible = false
		game_start = false
		start = false
		Global.talking = false
		Global.rhythm_start = false
		GameManager.health_player_one -= 3
		player.global_position = GameManager.last_position
		player2.global_position = GameManager.last_position
		Global.score = 0
		#GameManager.save()
		

		
