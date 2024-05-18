extends Node2D

var velocity = 0

var force = 0

var height = 0 #position.y

var target_height = 0 #position.y + 80

#var k = 0.015

#var d = 0.01
@onready var collision_shape_2d = $Area2D/CollisionShape2D

var index = 0
var motion_factor = 0.02

signal splash

func water_update(spring_constant, dampening):
	height = position.y
	
	var x = height - target_height
	
	var loss = -dampening * velocity
	
	force = - spring_constant * x + loss
	
	velocity += force
	
	position.y += velocity
	
#func _physics_process(delta):
#	water_update(k,d)

func initialize(x_position, id):
	height = position.y
	target_height = position.y
	velocity = 0
	position.x = x_position
	index = id

func set_collision_width(value):
	var extents = collision_shape_2d.get_shape().size
	var new_extents = Vector2(value/2, extents.y)
	#print(new_extents)
	collision_shape_2d.get_shape().size = new_extents
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#print(body.name)
	if body.name != "TileMap":
		var speed = body.motion.y * motion_factor
		emit_signal("splash", index,speed)
