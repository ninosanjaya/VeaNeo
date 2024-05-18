extends Area2D

@onready var Tile_map = $"../TileMap"
@export var switchT = false
@export var latch = 0 
#@onready var animation_player_switch = $AnimationPlayer_switch
@onready var animation_player_switch = $AnimationPlayer

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
@onready var collision_shape_2d2 = $CollisionShape2D


const TEXTURES = [
	"res://Old/tilemap_packed.png", 
	"res://Old/tilemap_packed_edited.png",
	"res://Old/tileset_1.png"
]

var switch_tile = 0

func _process(_delta):
	if Global.Xray == false:
		sprite_2d.visible = false
		collision_shape_2d.disabled = true
		collision_shape_2d2.disabled = true
	elif Global.Xray == true:
		sprite_2d.visible = true
		collision_shape_2d.disabled = false
		collision_shape_2d2.disabled = false
		
	#if switchT == true:
	if Input.is_action_just_pressed("attack"):
			#switch_tile = (switch_tile + 1)%2
			#var texture = load(TEXTURES[switch_tile])
			#Tile_map.tile_set.get_source(0).texture = texture
			if latch == 0:
				latch = 1
				animation_player_switch.play("on")
			elif latch == 1:
				latch = 0
				animation_player_switch.play("off")

			#latch = 1


			#var tilemap = Tile_map
			#remove_child(tilemap)
			#add_child(tilemap)
			#switchT = false
	if latch == 0:
		animation_player_switch.play("off")
	elif latch == 1:
		animation_player_switch.play("on")

	#elif switchT == false:
	#	animation_player_switch.play("off")
		#latch = false
		
func _on_body_entered(_body):
	if (_body is Player) or (_body is Player2):
		switchT = true
		#animation_player_switch.play("on")
		if latch == 0:
			animation_player_switch.play("off")
		elif latch == 1:
			animation_player_switch.play("on")



func _on_body_exited(_body):
	switchT = false
	if latch == 0:
		animation_player_switch.play("off")
	elif latch == 1:
		animation_player_switch.play("on")



