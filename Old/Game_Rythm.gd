extends Area2D

var entered = false
# Called when the node enters the scene tree for the first time.

#const GAME_R = preload("res://gameR.tscn")
@onready var animation_player = $AnimationPlayer
@onready var dialogue_box = $"../UI/DialogueBox"
var next30 = false
var next31 = false
var done_game = false
var nerissa_meeting = false



@onready var game_r = $"../UI/GameR"
@onready var world_3 = $".."
@onready var player = $"../Player"
@onready var player2 = $"../Player2"
@onready var camera_2d = $"../Camera2D"
@onready var sprite_2d = $Sprite2D

var switchc = false

@onready var audio_stream_player = $"../AudioStreamPlayer"

func _ready():
	camera_2d.enabled = false
	#pass # Replace with function body.

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	

func _process(_delta):
	
	if Input.is_action_pressed("switchc"):
		switchc = true
	else:
		switchc = false
		
	if entered == true && switchc == false:
		#get_tree().change_scene("res://gameR.tscn")
		#get_tree().change_scene_to_file("res://gameR.tscn")
		#game_r.visible = true
		#if world_3.switch == 1 && 
		player.camera_2d.enabled = false
		player2.camera_2d.enabled = false
		camera_2d.enabled = true
		GameManager.Boss2 = true
		#_set_zoom_level(0.9)
		
		#tween.tween_property(camera_2d,"global_position", lerp(cam.global_position, get_global_mouse_position(), 0.5), tween_duration)
		
		if world_3.switch == 1 && nerissa_meeting == false && GameManager.Boss2 == true:
			audio_stream_player.volume_db = -70
			sprite_2d.visible = true
			animation_player.play("intro_rhythm")
			nerissa_meeting = true
			GameManager.Boss2 = false
			#print("scene1")
		elif world_3.switch == 2 && nerissa_meeting == false && GameManager.Boss2 == true:
			audio_stream_player.volume_db = -70
			sprite_2d.visible = true
			world_3.fuwatime()
			#world_2.switch = 1
			animation_player.play("intro_rhythm")
			nerissa_meeting = true
			GameManager.Boss2 = false
			
		if game_r.Rhythm_done == true && done_game == false:
			var tween = get_tree().create_tween()
			tween.set_parallel(true)
			tween.tween_property(camera_2d,"zoom", camera_2d.zoom * 0.5, 0.1)
			sprite_2d.visible = true
			dialogue_box.start("nerissa_ending")
			next31 = true
			done_game = true
			audio_stream_player.playing = true
			audio_stream_player.volume_db = -70
	
	elif entered == false && Global.death == true:
		player.camera_2d.enabled = true
		player2.camera_2d.enabled = true
		camera_2d.enabled = false
		nerissa_meeting = false
		camera_2d.zoom = Vector2(1,1)
		audio_stream_player.playing = true
		audio_stream_player.volume_db = -50
		#game_r.game_start = true
		
func nerissa_meet():
	dialogue_box.start("nerissa_meet")
	#dialogue_box.start("lock_shiori")
	
	Global.talking = true
	next30 = true
	
	
	
	
func nerissa_ending():
	dialogue_box.start("nerissa_ending")
	#dialogue_box.start("lock_shiori")
	Global.talking = true
	next31 = true
	
	




func _on_dialogue_box_dialogue_ended():
	Global.talking = false
	if next30 == true:
		var tween = get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(camera_2d,"zoom", camera_2d.zoom * 1.5, 0.1)
		#animation_player_2.play("shiori_disappear")
		
		next30 = false
		game_r.game_start = true
		sprite_2d.visible = false
		player2.global_position = player.global_position
		audio_stream_player.playing = false
		#print(sprite_2d.position)
		#Start_Boss_shiori = true
		#world_2.switch = 2
	if next31 == true:
		GameManager.key_item2 = true
		GameManager.skill_available[2] = 1.2
		GameManager.player_location = 1
		Global.next_scene = "res://Old/world.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
		get_tree().change_scene_to_packed(preload("res://Old/loading.tscn"))
		#get_tree().change_scene_to_file("res://world.tscn")
			#Door1_pos
		GameManager.last_position = Vector2(2355, -7) #door 2
		next31 = false
		GameManager.save()
