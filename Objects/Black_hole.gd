extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var DD = 1
@onready var timer = $Timer
var directions = Vector2.ZERO

@onready var collision_shape_2d = $Damaging_pro/CollisionShape2D
@onready var bomb_timer = $Timer/BOMB_Timer

@onready var animation_player = $AnimationPlayer


func _ready():
	#velocity.x = SPEED * 1
	pass

func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y = 0
	
	#velocity = Vector2(0,0)
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
	
	velocity.y += gravity * delta
	#velocity.y = 100

	#velocity.			x = SPEED * 1

	move_and_slide()
	
func launch(direction):

	#velocity = Vector2(10,10)
	
	if direction == true:
		sprite_2d.flip_h = true
		DD = -1
		velocity.x = 0
		
		#timer.wait_time = 1.5
		#print(velocity)
	elif direction == false:
		sprite_2d.flip_h = false
		DD = 1
		velocity.x = 0
	collision_shape_2d.disabled = true
	timer.start()
	move_and_slide()
	



func _on_timer_timeout():
	animation_player.play("bomb")
	bomb_timer.start()
	#queue_free()
	collision_shape_2d.disabled = false

func _on_bomb_timer_timeout():
	queue_free()
