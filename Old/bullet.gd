extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Vector2.ZERO
@onready var timer = $Timer

func _ready():
	pass
	
func _process(delta):
	#move_and_collide(direction * SPEED * delta)
	#var scene = get_tree().current_scene
	#get_parent().remove_child(self)
	#scene.add_child(self)
	move_and_collide(direction * SPEED * delta)
	#print(collisionResult.get_name())
	#if collisionResult != null:
	#	queue_free()
	#else: 
	#	timer.start()
		


func _on_timer_timeout():
	queue_free()
