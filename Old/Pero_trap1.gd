extends Area2D

@onready var area_2d = $"../Area2D"

# Called when the node enters the scene tree for the first time.'
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
@onready var sprite_2d = $StaticBody2D/Sprite2D
@onready var sprite_2d_0 = $StaticBody2D/Sprite2D0

var entered = false
var locking = false

func _ready():
	collision_shape_2d.disabled = true
	sprite_2d.visible = false
	sprite_2d_0.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if area_2d.can_lock == true:
#		print("can_lock is true")
#		sprite_2d_0.visible = true
		
#	if entered == true && area_2d.can_lock == true && Global.talking == false && locking == false:
#		print("entering")
#		if Input.is_action_pressed("attack"):
#			collision_shape_2d.disabled = false
#			sprite_2d_0.visible = false
#			sprite_2d.visible = true
#			locking = true
#			print("locking")
	

