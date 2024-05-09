extends "res://Old/Pero_trap1.gd"
@onready var perotraps = $"../perotraps"


# Called when the node enters the scene tree for the first time.

#extends Area2D

#@onready var area_2d = $"../Area2D"

# Called when the node enters the scene tree for the first time.'
#@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
#@onready var sprite_2d = $StaticBody2D/Sprite2D
#@onready var sprite_2d_0 = $StaticBody2D/Sprite2D0

#var entered = false
#var locking = false

func _ready():
	collision_shape_2d.disabled = true
	sprite_2d.visible = false
	sprite_2d_0.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	if entered == true:
#		print("2")
	if area_2d.can_lock == true:
		#print("can_lock is true")
		sprite_2d_0.visible = true
	elif area_2d.can_lock == false:
		#print("can_lock is true")
		collision_shape_2d.disabled = true
		sprite_2d.visible = false
		sprite_2d_0.visible = false
		
	if entered == true && area_2d.can_lock == true && Global.talking == false && Global.locking == false:
		#print("entering")
		if Input.is_action_pressed("attack"):
			collision_shape_2d.disabled = false
			sprite_2d_0.visible = false
			sprite_2d.visible = true
			Global.locking = true
			Global.lock = 1
			perotraps.playing = true
			#print("locking")
	if Global.locking == true:
		sprite_2d_0.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if locking == true:
	#	Global.lock = 2

func _on_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true



func _on_body_exited(_body):
	entered = false
