extends CharacterBody2D

#class_name Player1

@onready var camera_2d = $Camera2D


@export var SPEED = 100
@export var ACCELERATION = 800.0
@export var FRICTION = 1000.0

@export var air_resistance = 200.0
@export var air_acceleration = 400.0



#var air_jump = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#@onready var sprite_2d = $Sprite2D2
@onready var animation_tree : AnimationTree = $AnimationTree2
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine2
@onready var sprite_2d = $mococo



var direction : Vector2 = Vector2.ZERO
signal facing_direction_changed(facing_right : bool)

#@onready var cameraNode : Camera2D = get_node("/root/World/Camera2D")
#@onready var cameraNode2 : Camera2D = get_node("/root/World2/Camera2D2")

@export var normal_speed : bool = true
@export var right : bool = true
@export var left : bool = false

@onready var player = get_parent().get_node("Player")

@onready var Projectile = preload("res://Objects/Web.tscn")
var held_item = null
signal throw_item()
@onready var held_item_position = $mococo/HeldItemPosition
@onready var held_item_position_2 = $mococo/HeldItemPosition2




@export var attack_state : State #claw
@export var attack_animation : String = "attack1"
@export var sneeze_animation : String = "attackv2"
#@export var attackv2_state : State
@onready var playback:AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")
@onready var attack_timer_ppp = $AttackTimerPPP
@export var can_attack2 : bool = true
@export var attackv2_state : State #sneeze
@onready var atk_timerv_2 = $CharacterStateMachine2/Attackv2/AtkTimerv2
@onready var animation_player_2 = $AnimationPlayer2


#@onready var player_2 = $"../.."
#@onready var facing = player_2.right #true is right

#@onready var enemy = get_parent().get_node("Enemy_walking")
@onready var knock_timer = $KnockTimer
var knockback = Vector2.ZERO
@export var hit_animation : String = "hit"
@export var hit_state : State

const whiten_duration = 0.15
#@export var whiten_material : ShaderMaterial 
@export var whiten_material : ShaderMaterial
var cutscene : bool = false
#@export var Talk_time : bool = false
@onready var mococo = $mococo

@onready var climb_collision = $CollisionShape2D2/climb/CollisionShape2D3
var entered = false
#@export var cam = false
@export var motion : Vector2

func _ready():
	animation_tree.active = true
	#print(player.health_player)
	#cameraNode.current = true

#func _process(delta):
#	if cameraNode != null:
#		cameraNode.position = position
#	else:
		#cameraNode.current = not cameraNode.current
		#cameraNode2.current = true
#		cameraNode2.position = position
		

	
func _physics_process(delta):
	
	#Talk_time = Global.talking
	#print(Talk_time)
	#print(direction)
	var input_axis = Input.get_axis("left", "right")
	direction = Input.get_vector("left", "right", "up", "down")
	# Control whether to move or not to move
	apply_gravity(delta)
#	handle_jump()
#	handle_acceleration(input_axis, delta)
#	handle_air_acceleration(input_axis,delta)
	apply_air_resistance(input_axis, delta)
	apply_friction(input_axis,delta)
	
	if direction.x != 0 && state_machine.check_if_can_move() && normal_speed == true && can_attack2 == true && Global.talking == false && Global.enemy_knockback == false:
		velocity.x = direction.x * SPEED
		
	#elif direction.x != 0 && state_machine.check_if_can_move() && Input.is_action_pressed("dash") :
	#	velocity.x = direction.x * DASH_VELOCITY
	#	ground_state.can_dash = false
	#	next_state = dash_state
	#	playback.travel(dash_animation)

	elif Global.enemy_knockback == true:
		
		mococo.material.set_shader_parameter("whiten", true)
		#await $Timer.timeout
		await get_tree().create_timer(0.2).timeout
		mococo.material.set_shader_parameter("whiten", false)
		
		velocity = direction * SPEED + knockback
		knock_timer.start()
		knockback = lerp(knockback, Vector2.ZERO, 0.1)
		state_machine.current_state = hit_state
		playback.travel(hit_animation)
		Global.enemy_knockback = false
		
		


	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	handle_atk()
	move_and_slide()
	update_animations(input_axis)
	update_facing_direction()
	death()
	handleclimb()
	
	if Global.cam == true:
		sprite_2d.modulate = Color(0,0,0,0)
	elif Global.cam == false:
		sprite_2d.modulate = Color(255,255,255,255)
	
	motion.y += gravity
	motion.y = clamp(motion.y, -450,450)
	#GameManager.variable4 += 1
	#print(GameManager.variable4)
	
	# Add the gravity.
func handleclimb():
	if entered == true:
		velocity.y = 0
		if  (Input.is_action_pressed("up")):
			velocity.y -= 50
		elif  (Input.is_action_pressed("down")):
			velocity.y += 50
		
func apply_gravity(delta):
	if not is_on_floor() && entered == false:
		velocity.y += gravity * delta

	
		
		
func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
func apply_air_resistance(input_axis, delta):
	if input_axis == 0 and not is_on_floor():
		velocity.x = move_toward(velocity.x, 0, air_resistance *delta)
		

		

@export var dogwalk : String = "dogwalk"
@export var dogidle : String = "dogidle"
@onready var collision_shape_2d_2 = $CollisionShape2D2

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
			collision_shape_2d_2.scale = Vector2(0.5,0.5)
		elif  direction.x == 0:
			playback.travel(dogidle)
			collision_shape_2d_2.scale = Vector2(0.5,0.5)
	else:
		collision_shape_2d_2.scale = Vector2(1,1)
	
@onready var effects = $mococo/HeldItemPosition/effects
@onready var effects_2 = $mococo/HeldItemPosition2/effects2

var rng2 = RandomNumberGenerator.new()



func slash_on():
	#print("slashon")
	#if right == true :
	#	print("right")
	#	effects.visible = true
	##	effects.rotation = rng2.randi_range(0,60)
	#elif right == false:
	#	print("left")
	#	effects_2.visible = true
	#	effects_2.rotation = rng2.randi_range(0,60)
	pass
		
func slash_off():
	effects.visible = false
	effects_2.visible = false
	
func update_facing_direction():
	if direction.x > 0 && cutscene == false:
		sprite_2d.flip_h = false
		right = true
		left = false
		climb_collision.position = climb_collision.facing_left_position
		
	elif direction.x < 0 && cutscene == false:
		sprite_2d.flip_h = true
		left = true
		right = false
		climb_collision.position = climb_collision.facing_right_position

		
	emit_signal("facing_direction_changed", sprite_2d.flip_h)
#res://Character/player.tscn.
#get_node("../a_sibling_node")
@onready var reset = $reset
@onready var cam = $Cam

func death(): 
	if GameManager.health_player_one <= 0:
		Global.death = true	
		Input.start_joy_vibration(0,0.8,0.2,1)
		#reset.start()
		get_tree().change_scene_to_file("res://Old/gameover.tscn")
		##GameManager.save()

func handle_atk():
	
		
	#Shooting arrow web
	if (Input.is_action_pressed("attack"))  and (can_attack2 == true) and Global.talking == false :
		
			
		playback.travel(sneeze_animation)
		atk_timerv_2.start()
		can_attack2 = false
		state_machine.current_state = attackv2_state
		#state_machine.current_state.can_move = false
		
	#Camouflage, not attack/detected by enemies
	#climbing wall, automatically
	#make enemies unable find players
	if (Input.is_action_pressed("skill")) and (can_attack2 == true) and Global.talking == false :
		#spawn_rock()
		#state_machine.current_state = attack_state
		#print("camouflage")
		#sprite_2d.modulate = Color(0,0,0,0)
		#atk_timerv_2.start()
		#can_attack2 = false
		Global.cam = true
		cam.start()
	#elif Input.is_action_just_released("skill"):
	#	Global.cam = false
		#print("NOT_camouflage")
		#sprite_2d.modulate = Color(255,255,255,255)




#func _on_knock_timer_timeout():
#	enemy.knockback = false

func spawn_rock():
	if held_item == null:
		held_item = Projectile.instantiate()
		held_item_position.add_child(held_item)

		


func _on_throw_item():
	if right == true:
		held_item = Projectile.instantiate()
		held_item_position.add_child(held_item)
		held_item.launch(sprite_2d.flip_h)
		held_item = null
	elif right == false:
		held_item = Projectile.instantiate()
		held_item_position_2.add_child(held_item)
		held_item.launch(sprite_2d.flip_h)
		held_item = null


func _on_attack_timer_ppp_timeout():
	can_attack2 = true
	#state_machine.current_state.can_move = true

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
	
	
#var held_item = null
@onready var bullet_tone = preload("res://Old/Projectile_Tone.tscn")
#@onready var held_item_position = $fuwawa/Marker2D
#@onready var held_item_position_2 = $fuwawa/Marker2D2
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

@onready var TileMap1 =  get_parent().get_parent().get_node("TileMap")

func _on_climb_body_entered(body):
	if (body is TileMap):
		var cellleft = TileMap1.local_to_map(position - Vector2(15,5))
		var cellright = TileMap1.local_to_map(position - Vector2(-15,5))
		#print(TileMap1.get_cell_source_id(0, cellright))
		
		if TileMap1.get_cell_source_id(0, cellright) == 1 or TileMap1.get_cell_source_id(0, cellleft) == 1:
			
			entered = true
			print("climbing")

func _on_climb_body_exited(body):
	entered = false
	print(entered)


func _on_cam_timeout():
	Global.cam = false
	print("cam_false")
