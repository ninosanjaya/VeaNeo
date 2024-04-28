extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

var entered = false
#@onready var dialogue_box = $UI/DialogueBox
@onready var dialogue_box = $"../UI/DialogueBox"


#@onready var timer = $Timer
#@onready var static_body_2d = $StaticBody2D

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
	"res://tileset_1.png",
	"res://tileset_2.png"
]

const TEXTURES2 = [
	"res://backgrounds_inside_V1.png",
	"res://backgrounds_inside_V2.png"
]

const TEXTURES3 = [
	"res://backgrounds_inside_first_V0.png",
	"res://backgrounds_inside_first_V02.png"
]

var switch_tile = 0
#const GAME_MANAGER = preload("res://game_manager.tscn")
var next10 = false
var next11 = false

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		#if timer.time_left:
		
			entered = true


func _on_body_exited(_body):
	entered = false
	#print("exit")
	
@onready var color_rect = $ColorRect
@onready var sfx_sparkle = $sfx_sparkle
@onready var timer = $Timer

var pero_once2 = true

func _ready():
	color_rect.modulate.a = 0
	#print(GameManager.enemies_done)
#	if GameManager.enemies_done == true:
#		static_body_2d.queue_free()
	
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
			
			GameManager.last_position = global_position
			#GameManager.last_position = Vector2(2400, -10)
			#print(GameManager.variable4)
			GameManager.health_player_one = 3
			GameManager.mana_player_one = 100
			
			
			#print("press")
			sprite_2d.material.set_shader_parameter("outline_select", true)
			if pero_once2 == true:
				dialogue_box.start("checkpoint1")
			
				if Global.enemy4 == true && Global.enemy5 == true && Global.enemy6 == true && Global.enemy7 == true && GameManager.enemies_done_2 == false:
					GameManager.enemies_done_2 = true
					print("you did it!")
				
					sfx_sparkle.playing = true
				#var tween = create_tween()
				#if tween.is_running():
				#	tween.stop()
				#tween.tween_property(color_rect, "modulate:a", 1, 0.4)
				#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
				#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
				#tween.play()
					timer.start()
					
				GameManager.save()
				pero_once2 = false
	else:
		sprite_2d.material.set_shader_parameter("outline_select", false)
		pero_once2 = true
			
			
			









func _on_timer_timeout():
	print("blinking2")
	var tween = create_tween()
	if tween.is_running():
			tween.stop()
	tween.tween_property(color_rect, "modulate:a", 0, 0.4)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
	#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
	tween.play()
