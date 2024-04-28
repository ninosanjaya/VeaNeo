extends Area2D

@onready var camera_2d = $"../Camera2D"
var entered = false

var switchc = false

@onready var world_4 = $".."
#@onready var player = $"../Player"
#@onready var player2 = $"../Player2"
@onready var player = get_parent().get_node("Player")
@onready var player2 = get_parent().get_node("Player2")
# Called when the node enters the scene tree for the first time.

@onready var dialogue_box = $"../UI/DialogueBox"
var bijou_meeting = false
#onready var animation_player = $AnimationPlayer
@onready var animation_player = $"../AnimationPlayer"
@onready var attack = $Attack

@onready var bijou = $bijou
@onready var pebble = $pebble

var next40 = false
var next41 = false
var next42_end = false
var bijou_ending1 = false
#const BOSS_ENEMY_WALKING = preload("res://boss_enemy_walking.tscn")
#@onready var enemy_walking_boss = $"../Enemy_walking_boss"
@onready var enemy_walking_boss = get_parent().get_node("Enemy_walking_boss")
@onready var boss_health = get_parent().get_node("Enemy_walking_boss/Damageable")
@onready var spikes_2 = $"../Spikes2"
@onready var spikes_3 = $"../Spikes3"
@onready var spikes_2_collision = $"../Spikes2/CollisionShape2D"
@onready var spikes_3_collision = $"../Spikes3/CollisionShape2D"

var canskill = true
@onready var timer = $Timer

@onready var audio_stream_player = $"../AudioStreamPlayer"
@onready var audio_stream_player2 = $AudioStreamPlayer

func _ready():
	camera_2d.enabled = false
	pebble.visible = false
	
	spikes_2.visible = false
	spikes_3.visible = false
	spikes_2_collision.disabled = true
	spikes_3_collision.disabled = true
	#self.add_child(P2)
	#world_4.remove_child.call_deferred(enemy_walking_boss)

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
@onready var gmover = $gmover

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("switchc"):
		switchc = true
	else:
		switchc = false
		
	#print(Global.game_over_pebble)
	#print(canskill)
	
	if entered == true && switchc == false:
		#get_tree().change_scene("res://gameR.tscn")
		#get_tree().change_scene_to_file("res://gameR.tscn")
		#game_r.visible = true
		#if world_3.switch == 1 && 
		player.camera_2d.enabled = false
		player2.camera_2d.enabled = false
		camera_2d.enabled = true
		GameManager.Boss3 = true
		#_set_zoom_level(0.9)
		
		#tween.tween_property(camera_2d,"global_position", lerp(cam.global_position, get_global_mouse_position(), 0.5), tween_duration)
		
		if world_4.switch == 1 && bijou_meeting == false && GameManager.Boss3 == true:
			#sprite_2d.visible = true
			audio_stream_player.volume_db = -70
			player.position = Vector2(1181,848)
			animation_player.play("intro_bijou")
			bijou_meeting = true
			GameManager.Boss3 = false
			#print("scene1")
		elif world_4.switch == 2 && bijou_meeting == false && GameManager.Boss3 == true:
			#sprite_2d.visible = true
			world_4.fuwatime()
			#world_2.switch = 1
			audio_stream_player.volume_db = -70
			player.position = Vector2(1181,848)
			animation_player.play("intro_bijou")
			bijou_meeting = true
			GameManager.Boss3 = false
			
		#if game_r.Rhythm_done == true && done_game == false:
		#	var tween = get_tree().create_tween()
		#	tween.set_parallel(true)
		#	tween.tween_property(camera_2d,"zoom", camera_2d.zoom * 0.5, 0.1)
		#	sprite_2d.visible = true
		#	dialogue_box.start("meet_bijou")
		#	next31 = true
		#	done_game = true
		
			
	
	elif entered == false && Global.death == true:
		player.camera_2d.enabled = true
		player2.camera_2d.enabled = true
		camera_2d.enabled = false
		bijou_meeting = false
		#world_4.remove_child.call_deferred(enemy_walking_boss)
		pebble.visible = false
		bijou.visible = true
		spikes_2.visible = false
		spikes_3.visible = false
		spikes_2_collision.disabled = true
		spikes_3_collision.disabled = true
		audio_stream_player.playing = true
		audio_stream_player2.playing = false
		audio_stream_player.volume_db = -50
		if Global.there_pebble == true:
			world_4.remove_child.call_deferred(enemy_walking_boss)
			Global.there_pebble = false
		elif Global.there_pebble == false:
			pass
		#camera_2d.zoom = Vector2(1,1)
	if Global.pebble_dead == true:
		if Global.there_pebble == true:
			world_4.remove_child.call_deferred(enemy_walking_boss)
			Global.there_pebble = false
		elif Global.there_pebble == false:
			pass
		if world_4.switch == 1 && bijou_ending1 == false:
			#sprite_2d.visible = true
			player.position = Vector2(1181,848)
			animation_player.play("bijou_end")
			bijou_ending1 = true
			#print("scene1")
		elif world_4.switch == 2 && bijou_ending1 == false:
			#sprite_2d.visible = true
			world_4.fuwatime()
			#world_2.switch = 1
			player.position = Vector2(1181,848)
			animation_player.play("bijou_end")
			bijou_ending1 = true
			
	elif Global.game_over_pebble == true && canskill == true:
			#print("spiking!")
			spikes_2.visible = true
			spikes_3.visible = true
			spikes_2_collision.disabled = false
			spikes_3_collision.disabled = false
			attack.play("attack")
			canskill = false
			shake()
			timer.start()
			gmover.playing = true
		

func bijou_meet():
	#print(next40)
	
	Global.talking = true
	dialogue_box.start("meet_bijou")
	#dialogue_box.start("lock_shiori")
	next40 = true
	

func bijou_meet2():
	Global.talking = true
	print(Global.talking)
	dialogue_box.start("meet_bijou2")
	#dialogue_box.start("lock_shiori")
	next41 = true

func bijou_ending():
	dialogue_box.start("win_bijou")
	#dialogue_box.start("lock_shiori")
	Global.talking = true
	next42_end = true
	audio_stream_player.playing = true
	audio_stream_player2.playing = false
	audio_stream_player.volume_db = -70
	#next20 = true
	


func _on_dialogue_box_dialogue_ended():
	#print(next40)
	if next40 == true:
		#print("intro bijou2")
		animation_player.play("intro_bijou_2")
		pebble.visible = true
		next40 = false
	if next41 == true:
		pebble.visible = false
		bijou.visible = false
		world_4.add_child(enemy_walking_boss)
		enemy_walking_boss.global_position = Vector2(1190,807)
		boss_health.health = 20
		Global.there_pebble = true
		next41 = false
		Global.talking = false
		player.cutscene = false
		player2.cutscene = false
		audio_stream_player.playing = false
		audio_stream_player2.playing = true
	
	if next42_end == true:
		#GameManager.last_position = global_position
			#print(GameManager.variable4)
			#GameManager.health_player_one = 3
			#GameManager.mana_player_one = 100
		
		GameManager.key_item3 = true
		GameManager.skill_available[3] = 1.3
		GameManager.player_location = 1
		Global.next_scene = "res://world.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
		get_tree().change_scene_to_packed(preload("res://loading.tscn"))
		#get_tree().change_scene_to_file("res://world.tscn")
			#Door1_pos
		GameManager.last_position = Vector2(2339, 280) #door 3
		GameManager.save()


func _on_timer_timeout():
	
	attack.play("attack_reset")
	Global.count_pebble = 0
	Global.game_over_pebble = false
	canskill = true
	
var shake_strength : float = 0.0
var rng = RandomNumberGenerator.new()

func shake():
	#shake_strength = 10.0
	Input.start_joy_vibration(0,1,1,1)
	shake_strength = lerpf(10.0,0,1.2)
	camera_2d.offset = Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))	
	

