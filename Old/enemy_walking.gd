extends CharacterBody2D


var direction = Vector2.RIGHT
#var velocity = Vector2.ZERO #Godot 4 no need to put this line
@onready var ledgeCheckRight = $ledgecheckright
@onready var ledgeCheckLeft = $ledgecheckleft
#@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var sprite_2d = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var animation_player = $AnimationPlayer

#var direction : Vector2 = Vector2.ZERO
@export var hit_state : State

const SPEED = 20.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#onready var ledgeCheckRight: = $LedgeCheckRight
#onready var ledgeCheckLeft: = $LedgeCheckLeft
#onready var sprite: = $AnimatedSprite
@export var damage : float = 1
@onready var enemy_timer = $EnemyTimer
@export var get_hit : bool = false
@onready var player = get_parent().get_node("Player")
@onready var player2 = get_parent().get_node("Player2")
@onready var defense = get_parent().get_node("Player/CharacterStateMachine/Defense2")

@export var walk22 : bool = false
@export var walk33 : bool = false

@export var knockback : bool = false
@export var walk_state : State
@onready var hit = $CharacterStateMachine/Hit
@onready var playback:AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")
@export var walk2_state : State
@export var walk2_animation : String = "idle_v2"
@export var damageable : Damageable


const HIT_EFFECTS = preload("res://hit_effects.tscn")

func _ready():
	animation_tree.active = true
#	hit.connect("hit_state", V2)
	#print(self.get_path()) 
	if GameManager.enemies_done == true:
		playback.travel(walk2_animation)
		state_machine.current_state = walk2_state
		damageable.dead1 = true
	
#func V2():
#	if GameManager.enemies_done == true:
#		playback.travel("pet_v2")

func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta

	var found_wall = is_on_wall()
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
	

	if direction.x  && state_machine.check_if_can_move():
		velocity.x = direction.x * SPEED
	
	#elif (walk33 == true):
	#	velocity.x = direction.x * SPEED

	#elif (state_machine.current_state != hit_state):
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	
	elif (walk22 == true):
		velocity.x = 0
		#animation_tree.set("parameters/idle_v1/blend_position", direction.x)

	update_animations()
	update_facing_direction()
	move_and_slide()
	

	#print(sprite_2d.flip_h)

func update_animations():
	animation_tree.set("parameters/walk_v1/blend_position", direction.x)
	
func update_facing_direction():
	if direction.x > 0:
		sprite_2d.flip_h = true #right ->
		
	elif direction.x < 0:
		sprite_2d.flip_h = false #left <-
		
	#emit_signal("facing_direction_changed", sprite_2d.flip_h)
	


func _on_enemy_attack_body_entered(body):
	

	if ((body.get_name() == "Player" or body.get_name() == "Player2") and (get_hit == false) and (walk22 == false)):
		#print(player.state_machine.current_state)
		
		#print(player.health_player)
		enemy_timer.start()
		get_hit = true
		
		
		if (body.get_name() == "Player"):
			#_spawn_hit_effect()
			if (player.state_machine.current_state == defense):
					#print("defense")
				GameManager.health_player_one -= 0
				#GameManager.save()
				
			else:
				
				GameManager.health_player_one -= damage
				Input.start_joy_vibration(0,0.5,0,1)
				var directionK = global_position.direction_to(body.global_position)
				var explosion_force = directionK * 10.0
				body.knockback = explosion_force
				Global.enemy_knockback = true
				#print(knockback)
				#print("hitted")
				#GameManager.save()
		if (body.get_name() == "Player2"):
			#_spawn_hit_effect()
			GameManager.health_player_one -= damage
			Input.start_joy_vibration(0,0.5,0,1)
			var directionK2 = global_position.direction_to(body.global_position)
			var explosion_force = directionK2 * 10.0
			body.knockback = explosion_force
			Global.enemy_knockback = true
			#GameManager.save()
			#print(player.sprite_2d.flip_h)
		#print("get hit")
		



func _on_enemy_timer_timeout():
	get_hit = false

func _spawn_hit_effect() -> void:
	var hit_effect : Sprite2D = HIT_EFFECTS.instantiate()
	add_child(hit_effect)

