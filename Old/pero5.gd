extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D

var entered = false
#@onready var dialogue_box = $UI/DialogueBox
@onready var dialogue_box = $"../UI/DialogueBox"
var pero_once2 = true

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


func _on_body_exited(_body):
	entered = false
	#print("exit")
	
#func _ready():
	#print(GameManager.enemies_done)
#	if GameManager.enemies_done == true:
#		static_body_2d.queue_free()
	
func _process(_delta):
	
	animation_player.play("pero_idle")
				

				
				
	if entered == true:
		#if Input.is_action_just_pressed("attack"):
			#get_tree().change_scene_to_file("res://world_4.tscn")
			#emit_signal()
			
			GameManager.last_position = global_position
			#print(GameManager.variable4)
			GameManager.health_player_one = 3
			GameManager.mana_player_one = 100
			GameManager.save()
			
			#print("press")
			
			dialogue_box.start("checkpoint")
			
			#if Global.enemy8 == true && Global.enemy9 == true && Global.enemy10 == true && GameManager.enemies_done_3 == false:
				#GameManager.enemies_done_3 = true
			print("you did it!")

			entered = false
			
			

