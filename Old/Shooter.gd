extends Node2D

@onready var Projectile = preload("res://Old/ProjectilesEnemy.tscn")
var held_item = null
signal throw_item()
@onready var marker_2d = $Sprite2D/Marker2D
@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var marker_2d_2 = $Sprite2D/Marker2D2
@export var right = false

# Called when the node enters the scene tree for the first time.
func _ready():
	right = false
	sprite_2d.flip_h = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#sprite_2d.flip_h = true
	animation_player.play("shoot")
	
	
func spawn_rock():
	if held_item == null:
		held_item = Projectile.instantiate()
		marker_2d.add_child(held_item)

		


func _on_throw_item():
		#print("throwing")
		if right == false:
			held_item = Projectile.instantiate()
			marker_2d.add_child(held_item)
			held_item.launch(sprite_2d.flip_h)
			#print(Projectile.direction)
			held_item = null
		if right == true:
			held_item = Projectile.instantiate()
			marker_2d_2.add_child(held_item)
			held_item.launch(sprite_2d.flip_h)
			held_item = null
