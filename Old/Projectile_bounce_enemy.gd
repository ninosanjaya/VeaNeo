extends CharacterBody2D

#Seems not used? replace by projectiles2.0.gd
const SPEED = 30.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D

@onready var Enemy_final_boss = get_parent().get_parent().get_parent().get_parent().get_node("Enemy_final_boss")
@onready var damageable = get_parent().get_parent().get_parent().get_parent().get_node("Enemy_final_boss/Damageable")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var DD = 1
@onready var timer = $Timer
var directions = Vector2.ZERO
#@export var recoil = false
var enter = false

func _ready():
	#velocity.x = SPEED * 1
	pass

func _physics_process(delta):
	# Add the gravity.
	if (not is_on_floor()) && Global.recoil == false:
		velocity.y += gravity * delta * 0.2

	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()) * 1.1
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
	if enter == true:
		if Input.is_action_pressed("attack"):
			#print("recoil")
			Global.recoil = true
			#bullet.direction = (player.position - global_position).normalized()
			#Vector2(-182,-74)
			target_position = (Vector2(-182,-74) - global_position).normalized()
			velocity = target_position * (400)
			
	move_and_slide()
	
func launch(direction):
	var temp = global_transform
	var scene = get_tree().current_scene
	get_parent().remove_child(self)
	scene.add_child(self)
	global_transform = temp
	#velocity.y = 100
	#print(direction)
	
	if direction == true:
		sprite_2d.flip_h = true
		DD = -1
		velocity.x = SPEED * DD
		#timer.wait_time = 1.5
		#print(velocity)
	elif direction == false:
		sprite_2d.flip_h = false
		DD = 1
		velocity.x = SPEED * DD
		#timer.wait_time = 2
		#print(velocity)
	timer.start()
	move_and_slide()




func _on_timer_timeout():
	
	queue_free()

#@onready var timer_2 = $Timer2
var target_position

func _on_check_recoil_body_entered(body):
	if (body is Player) or (body is Player2):
		#print("detect")
		enter = true
		
			#timer_2.start()
		#entered = true

		


#func _on_timer_2_timeout():
#	print("damaging")
	#queue_free()
	#damageable.health -= 10


func _on_check_recoil_body_exited(body):
	enter = false
