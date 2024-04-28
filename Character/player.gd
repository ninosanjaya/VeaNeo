extends CharacterBody2D

class_name Player

#idle
#run/walk
#jump
#dash
#attack
#skill
#ultimate & switchable also
#switch character
@onready var camera_2d = $Camera2D


@export var SPEED = 100.0
@export var ACCELERATION = 800.0
@export var FRICTION = 1000.0

@export var air_resistance = 200.0
@export var air_acceleration = 400.0


#var air_jump = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#@onready var sprite_2d = $Sprite2D
##Change this to fuwamoco sprites
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var sprite_2d = $fuwawa
@onready var animation_player = $AnimationPlayer

var direction : Vector2 = Vector2.ZERO
signal facing_direction_changed(facing_right : bool)

#@onready var cameraNode : Camera2D = get_node("/root/World/Camera2D")
#@onready var cameraNode2 : Camera2D = get_node("/root/World2/Camera2D2")

#@export var health_player : float = 3
@export var normal_speed : bool = true
@export var right : bool = true
@export var left : bool = false

#@onready var enemy = get_parent().get_node("Enemy_walking")
#@onready var enemy2 = get_parent().get_node("Enemy_walking2")
#@onready var enemy3 = get_parent().get_node("Enemy_walking3")
@onready var knock_timer = $KnockTimer
var knockback = Vector2.ZERO
@export var hit_animation : String = "hit"
@export var hit_state : State


@export var attack_state : State
@export var attack_animation : String = "attack1"
@onready var playback:AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")
@onready var attack_timer_pp = $AttackTimerPP
@export var can_attack : bool = true

const whiten_duration = 0.15
#@export var whiten_material : ShaderMaterial 
@export var whiten_material : ShaderMaterial 

@export var defense_state = State
@export var defense_animation : String = "defensev2"
@onready var defense_timer = $CharacterStateMachine/Defense2/DefenseTimer
var cutscene : bool = false
#@export var Talk_time : bool = false
#@export var idle_animation : String = "idle"
#@export var nomove : bool = false
@onready var fuwawa = $fuwawa


func _ready():
	animation_tree.active = true
	#direction.x = 1
	#print(direction)
	#print(enemy.knockback)
	#print(health_player)
	#cameraNode.current = true

	
func _physics_process(delta):
	#print(Global.death)
	#print(state_machine.check_if_can_move())
	#print(GameManager.attack_set_state)
	#Talk_time = Global.talking
	#print(Global.talking)
	#cutscene = true
	#animation_tree.set("parameters/move/blend_position", 1)
	
	var input_axis = Input.get_axis("left", "right")
	direction = Input.get_vector("left", "right", "up", "down")
	# Control whether to move or not to move
	apply_gravity(delta)
#	handle_jump()
#	handle_acceleration(input_axis, delta)
#	handle_air_acceleration(input_axis,delta)
	apply_air_resistance(input_axis, delta)
	apply_friction(input_axis,delta)
	#whiten_material.set_shader_parameter("whiten", true)
	#print(whiten_material.get_shader_parameter("whiten"))
	#print(enemy.knockback)
	if direction.x != 0 && state_machine.check_if_can_move() && normal_speed == true && Global.talking == false &&  Global.enemy_knockback == false:
		velocity.x = direction.x * SPEED
		#nomove = false
		#print(direction)
		
	#elif direction.x != 0 && state_machine.check_if_can_move() && Input.is_action_pressed("dash") :
	#	velocity.x = direction.x * DASH_VELOCITY
	#	ground_state.can_dash = false
	#	next_state = dash_state
	#	playback.travel(dash_animation)

	elif Global.enemy_knockback == true:
		
		velocity = direction * SPEED + knockback
		
		fuwawa.material.set_shader_parameter("whiten", true)
		await get_tree().create_timer(0.2).timeout
		fuwawa.material.set_shader_parameter("whiten", false)
		
		knock_timer.start()
		knockback = lerp(knockback, Vector2.ZERO, 0.1)
		state_machine.current_state = hit_state
		playback.travel(hit_animation)
		Global.enemy_knockback = false
		
		

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#nomove = true
		
	handle_attack()
	move_and_slide()
	update_animations(input_axis)
	update_facing_direction()
	death()
	

	
	# Add the gravity.
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	
		
		
func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
func apply_air_resistance(input_axis, delta):
	if input_axis == 0 and not is_on_floor():
		velocity.x = move_toward(velocity.x, 0, air_resistance *delta)
		

@export var dogwalk : String = "dogwalk"
@export var dogidle : String = "dogidle"
@onready var collision_shape_2d = $CollisionShape2D

func update_animations(_input_axis):
	
	if Global.talking == true && cutscene == false && Global.dog == false:
		#animation_player.play("idle")
		animation_tree.set("parameters/move/blend_position", 0)
		
	elif Global.talking == false && cutscene == false && Global.dog == false: #moving
		#animation_tree.set("parameters/move/blend_position", direction.x)
		animation_tree.set("parameters/move/blend_position", direction.x)
		
	#else:
	#	pass
		
	if Global.dog == true:
		#animation_tree.set("parameters/dog/blend_position", direction.x)
		if  direction.x > 0 or direction.x < 0:
			playback.travel(dogwalk)
			collision_shape_2d.scale = Vector2(0.5,0.5)
		elif  direction.x == 0:
			playback.travel(dogidle)
			collision_shape_2d.scale = Vector2(0.5,0.5)
	else:
		collision_shape_2d.scale = Vector2(1,1)
	#if Global.talking == true:
	#else:
	#	animation_player.play("idle")


@onready var effect = $fuwawa/Marker2D/effect
@onready var effect_2 = $fuwawa/Marker2D2/effect2
var rng2 = RandomNumberGenerator.new()

func slash_on():
	#print("slashon")
	#if right == true :
	#	print("right")
	#	effect.visible = true
	#	effect.rotation = rng2.randi_range(0,60)
	#elif right == false:
	#	print("left")
	#	effect_2.visible = true
	#	effect_2.rotation = rng2.randi_range(0,60)
	pass
		
func slash_off():
	#print("slashoff")
	effect.visible = false
	effect_2.visible = false


func update_facing_direction():
	if direction.x > 0 && cutscene == false:
		sprite_2d.flip_h = false
		right = true
		left = false

		
	elif direction.x < 0 && cutscene == false:
		sprite_2d.flip_h = true
		left = true
		right = false

		
	emit_signal("facing_direction_changed", sprite_2d.flip_h)
	
@onready var reset = $reset

func death():
	if GameManager.health_player_one <= 0:
		Global.death = true	
		Input.start_joy_vibration(0,0.8,0.2,1)
		#reset.start()
		get_tree().change_scene_to_file("res://gameover.tscn")
		##GameManager.save()
		
		


#TBD Make checkpoint at starting point if player didn't interact with Pero yet
#Make start menu option & continue menu option different (add firt time play boolean?) #save problem


#func _on_knock_timer_timeout():
#	enemy.knockback = false
	#velocity.y += gravity 
	
func handle_attack():
	
	if (Input.is_action_pressed("attack")) and (can_attack == true) and (GameManager.attack_set_state == true) and (Global.talking == false) && Global.dog == false:
		state_machine.current_state = attack_state
		playback.travel(attack_animation)
		attack_timer_pp.start()
		can_attack = false
		if right == true:
			position.x += 5 
		elif right == false:
			position.x -= 5
		
	if (Input.is_action_pressed("skill"))  and (GameManager.attack_set_state == true) and (Global.talking == false) && Global.dog == false:
		state_machine.current_state = defense_state
		playback.travel(defense_animation)
		defense_timer.start()
		#attack_timer_pp.start()
		#can_attack = false
		


func _on_attack_timer_pp_timeout():
	can_attack = true
	
func _input(event : InputEvent):
	if(event.is_action_pressed("down") && is_on_floor()):
		position.y += 1
		

	
func play_anim(animation):
	playback.travel(animation)
	cutscene = true
	
func play_anim_move(DDD):
	Global.talking = true
	cutscene = true
	animation_tree.set("parameters/move/blend_position", DDD)
	if DDD > 0 :
		sprite_2d.flip_h = false

	elif DDD < 0 :
		sprite_2d.flip_h = true
	
func normal_anim():
	cutscene = false
	Global.talking = false
	
@export var jump_state = State
@export var jump_animation : String = "jump"
func normal():
	playback.travel(jump_animation)
	state_machine.current_state = jump_state


func _on_reset_timeout():
	Global.death = false

var held_item = null
@onready var bullet_tone = preload("res://Old/Projectile_Tone.tscn")
@onready var held_item_position = $fuwawa/Marker2D
@onready var held_item_position_2 = $fuwawa/Marker2D2
signal throw_item_Nerissa()



func _on_throw_item_nerissa():
	if right == true:
		held_item = bullet_tone.instantiate()
		held_item_position.add_child(held_item)
		held_item.launch(sprite_2d.flip_h)
		held_item = null
	elif right == false:
		held_item = bullet_tone.instantiate()
		held_item_position_2.add_child(held_item)
		held_item.launch(sprite_2d.flip_h)
		held_item = null

func get_hitted():
	playback.travel(hit_animation)
