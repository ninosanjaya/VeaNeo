extends CharacterBody2D

#Seems not used? replace by projectiles2.0.gd
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var DD = 1
@onready var timer = $Timer
var directions = Vector2.ZERO
@onready var timer_2 = $Timer2


func _ready():
	#velocity.x = SPEED * 1
	pass

func _physics_process(_delta):
	# Add the gravity.
	#if not is_on_floor():
	#velocity.y = 0

	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	#
	
	#velocity.y += gravity * delta
	#velocity.y = 100

	#velocity.			x = SPEED * 1

	move_and_slide()
	
func launch(_direction):
	#print(direction)
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform = temp
	#velocity.y = 100
	#print(direction)
	
	#if direction == true:
	sprite_2d.flip_h = true
	DD = 1
	velocity.y = SPEED * DD
		#timer_2.wait_time = 1.5
		#print(velocity)
	#elif direction == false:
		#sprite_2d.flip_h = false
		#DD = 1
		#velocity.y = SPEED * DD
		#timer_2.wait_time = 2
		#print(velocity)
	timer_2.start()
	move_and_slide()




func _on_timer_timeout():
	#print("free")
	#sprite_2d.visible = false
	#queue_free()
	pass

func _on_timer_2_timeout():
	queue_free()
