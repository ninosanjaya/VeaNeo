extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

var entered = false
#@onready var dialogue_box = $UI/DialogueBox
@onready var dialogue_box = $"../UI/DialogueBox"
#@onready var timer = $Timer
@onready var static_body_2d = $StaticBody2D

#@onready var Tile_map = $"../TileMap"
#@export var switchT = false => entered
#@export var latch = 0 
#@onready var animation_player_switch = $AnimationPlayer_switch
#@onready var animation_player_switch = $AnimationPlayer2

#@onready var backgrounds_inside_first_v_1 = $"../BackgroundsInsideFirstV1" 
#@onready var backgrounds_inside_first_v_2 = $"../BackgroundsInsideFirstV2"
#@onready var backgrounds_inside_first_v_3 = $"../BackgroundsInsideFirstV3"

#const BACKGROUNDS_INSIDE_V_1 = preload("res://backgrounds_inside_V1.png")
#const BACKGROUNDS_INSIDE_V_2 = preload("res://backgrounds_inside_V2.png")

#@onready var backgrounds_inside_first_v_0 = $"../BackgroundsInsideFirstV0"
#@onready var backgrounds_inside_first_v_4 = $"../BackgroundsInsideFirstV4"
#@onready var backgrounds_inside_first_v_5 = $"../BackgroundsInsideFirstV5"
#@onready var backgrounds_inside_first_v_6 = $"../BackgroundsInsideFirstV6"
#@onready var backgrounds_inside_first_v_7 = $"../BackgroundsInsideFirstV7"
#const BACKGROUNDS_INSIDE_FIRST_V_0 = preload("res://backgrounds_inside_first_V0.png")
#const BACKGROUNDS_INSIDE_FIRST_V_02 = preload("res://backgrounds_inside_first_V02.png")

#@onready var directional_light_2d = $"../DirectionalLight2D"

#@onready var enemy_walking = $"../Enemy_walking"
#@onready var enemy_walking_2 = $"../Enemy_walking2"
#@onready var enemy_walking_3 = $"../Enemy_walking3"


#const TILESET_1 = preload("res://tileset_1.png")
#const TILESET_2 = preload("res://tileset_2.png")
const TEXTURES = [
	"res://Old/tileset_1.png",
	"res://Old/tileset_2.png"
]

const TEXTURES2 = [
	"res://Old/backgrounds_inside_V1.png",
	"res://Old/backgrounds_inside_V2.png"
]

const TEXTURES3 = [
	"res://Old/backgrounds_inside_first_V0.png",
	"res://Old/backgrounds_inside_first_V02.png"
]

var switch_tile = 0
#const GAME_MANAGER = preload("res://game_manager.tscn")
var next10 = false
var next11 = false

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		#if timer.time_left:
		
			entered = true
		#print("enter")

func _on_body_exited(_body):
	entered = false
	#print("exit")

@onready var color_rect = $ColorRect
@onready var sfx_sparkle = $sfx_sparkle
@onready var timer = $Timer

var pero_once = true

func _ready():
	#print(GameManager.enemies_done)
	color_rect.modulate.a = 0
	if GameManager.enemies_done == true:
		static_body_2d.queue_free()
	
func _process(_delta):
	
	animation_player.play("pero_idle")
	#if GameManager.enemies_done == true:
	#			switch_tile = 1
	#			
	#			var texture = load(TEXTURES[switch_tile])
	#			var texture2 = load(TEXTURES2[switch_tile])
	#			var texture3 = load(TEXTURES3[switch_tile])
				
	#			Tile_map.tile_set.get_source(2).texture = texture
				
	#			backgrounds_inside_first_v_1.texture = texture2
	#			backgrounds_inside_first_v_2.texture = texture2
	#			backgrounds_inside_first_v_3.texture = texture2
				
	#			backgrounds_inside_first_v_0.texture = texture3
	#			backgrounds_inside_first_v_4.texture = texture3
	#			backgrounds_inside_first_v_5.texture = texture3
	#			backgrounds_inside_first_v_6.texture = texture3
	#			backgrounds_inside_first_v_7.texture = texture3
				
	#			if switch_tile == 0 :
	#				directional_light_2d.energy = 0.8
	#			elif switch_tile == 1 :
	#				directional_light_2d.energy = 0.4
					
				#print("you did it!")
				#print(switch_tile)
				#animation_player_switch.play("on")
				#enemy_walking.playback.travel("idle_v2")
				#enemy_walking_2.playback.travel("idle_v2")
				#enemy_walking_3.playback.travel("idle_v2")
				#nemy_walking.animation_player.play("idle_v2")
				#enemy_walking_2.animation_player.play("idle_v2")
				#enemy_walking_3.animation_player.play("idle_v2")
				

				
				
	if entered == true:
		#if Input.is_action_just_pressed("attack"):
			#get_tree().change_scene_to_file("res://world_4.tscn")
			#emit_signal()
			#print(GameManager.key_item_all)
			GameManager.last_position = global_position
			#print(GameManager.variable4)
			#GameManager.health_player_one = 3
			#GameManager.mana_player_one = 100
			GameManager.save()
			sprite_2d.material.set_shader_parameter("outline_select", true)
			#print("press")
			if Global.enemy1 == true && Global.enemy2 == true && Global.enemy3 == true && GameManager.enemies_done == false && pero_once == true:
				sprite_2d.material.set_shader_parameter("outline_select", true)
	#			switch_tile = (switch_tile + 1)%2
				
	#			var texture = load(TEXTURES[switch_tile])
	#			var texture2 = load(TEXTURES2[switch_tile])
	#			var texture3 = load(TEXTURES3[switch_tile])
				
	#			Tile_map.tile_set.get_source(2).texture = texture
				
	#			backgrounds_inside_first_v_1.texture = texture2
	#			backgrounds_inside_first_v_2.texture = texture2
	#			backgrounds_inside_first_v_3.texture = texture2
				
	#			backgrounds_inside_first_v_0.texture = texture3
	#			backgrounds_inside_first_v_4.texture = texture3
	#			backgrounds_inside_first_v_5.texture = texture3
	#			backgrounds_inside_first_v_6.texture = texture3
	#			backgrounds_inside_first_v_7.texture = texture3
				
	#			if switch_tile == 0 :
	#				directional_light_2d.energy = 0.8
	#			elif switch_tile == 1 :
	#				directional_light_2d.energy = 0.4
					
				print("you did it!")
				dialogue_box.start("Clean1_yes")
				#print(switch_tile)
				#animation_player_switch.play("on")
				#enemy_walking.playback.travel("idle_v2")
				#enemy_walking_2.playback.travel("idle_v2")
				#enemy_walking_3.playback.travel("idle_v2")
				#nemy_walking.animation_player.play("idle_v2")
				#enemy_walking_2.animation_player.play("idle_v2")
				#enemy_walking_3.animation_player.play("idle_v2")
				
				GameManager.enemies_done = true
				GameManager.health_player_one = 3
				GameManager.mana_player_one = 100
				#area_2d.block = false
				timer.start()
				#entered = false
				static_body_2d.queue_free()
				#static_body_2d.remove_child()
				#GameManager.save()
				
				sfx_sparkle.playing = true
				#var tween = create_tween()
				#if tween.is_running():
			#		tween.stop()
			#	tween.tween_property(color_rect, "modulate:a", 1, 0.4)
				#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
				#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
			#	tween.play()
				timer.start()
				pero_once = false
				
			elif GameManager.enemies_done == true && pero_once == true:
				
				sprite_2d.material.set_shader_parameter("outline_select", true)
				GameManager.health_player_one = 3
				GameManager.mana_player_one = 100
				print("done already")
				timer.start()
				#entered = false
				#GameManager.save()
				#static_body_2d.remove_child()
				#static_body_2d.queue_free()
				pero_once = false
			
			elif next11 == false && GameManager.enemies_done == false && pero_once == true:
				sprite_2d.material.set_shader_parameter("outline_select", true)
				dialogue_box.start("Clean1_no")
				next10 = true
				next11 = true
				print("need to defeat monster")
				print(Global.enemy1)
				print(Global.enemy2)
				print(Global.enemy3)
				print(GameManager.enemies_done)
				timer.start()
				#entered = false
				pero_once = false
				
	
	elif entered == false:
			sprite_2d.material.set_shader_parameter("outline_select", false)
			pero_once = true	
			#print("print")






func _on_dialogue_box_dialogue_ended():
	if next10 == true:
		Global.talking = false
		Global.talking1 = false
		next10 = false
		next11 = false
		







func _on_timer_timeout():
	print("BLINKING")
	var tween = create_tween()
	if tween.is_running():
			tween.stop()
	tween.tween_property(color_rect, "modulate:a", 0, 0.4)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
	#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
	tween.play()
	
