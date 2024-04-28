extends State

@export var walk_animation : String = "walk"
# Called when the node enters the scene tree for the first time.
@onready var enemy_walking = $"../.."
@onready var character_state_machine = $".."
#@export var hit_state : State

#@onready var found_wall = is_on_wall()

#@onready var ledgecheckright = $"../../ledgecheckright"
#@onready var ledgecheckleft = $"../../ledgecheckleft"

#var found_ledge 
@onready var animation_tree = $"../../AnimationTree"
@onready var enemy_walking_boss = $"../.."
var entered = false

@onready var player = get_parent().get_parent().get_parent().get_node("Player")
@onready var player2 = get_parent().get_parent().get_parent().get_node("Player2")
@onready var world = get_parent().get_parent().get_parent().get_parent().get_node("World4")

@export var attack_state : State
@onready var timer = $Timer
@export var skill_state : State

func _ready():
	pass # Replace with function body.

@onready var audio_stream_player = $"../../AudioStreamPlayer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(_delta):
	#playback.travel(walk_animation)
	
	animation_tree.set("parameters/move/blend_position",  enemy_walking_boss.direction.x)
	if world.switch == 1 && Global.count_pebble < 10:
		
		enemy_walking_boss.direction = (player.position - enemy_walking_boss.global_position).normalized()
		enemy_walking_boss.velocity.x = enemy_walking_boss.direction.x * 50
	elif world.switch == 2 && Global.count_pebble < 10:
		#animation_tree.set("parameters/move/blend_position",  enemy_walking_boss.direction.x)
		enemy_walking_boss.direction = (player2.position - enemy_walking_boss.global_position).normalized()
		enemy_walking_boss.velocity.x = enemy_walking_boss.direction.x * 50
	
	#elif (enemy_walking_boss.global_position.x > 1289 and enemy_walking_boss.global_position.x < 1291) && Global.count_pebble >= 10:
	#	playback.travel("blink")
		#timer.start()
	
	#animation_tree.set("parameters/move/blend_position", enemy_walking_boss.direction.x)
	#enemy_walking.walk33 = true #walk33 true move
	#enemy_walking.walk22 = false #walk22 false attack player, walk22 true stop
	
	
	if entered == true && Global.count_pebble < 10:
		playback.travel("attack")
		next_state = attack_state
		audio_stream_player.playing = true
		
	elif Global.count_pebble >= 10:
		#pass
		#animation_tree.set("parameters/move/blend_position",  enemy_walking_boss.direction.x)
		enemy_walking_boss.direction = (Vector2(1290,820) - enemy_walking_boss.global_position).normalized()
		enemy_walking_boss.velocity.x = enemy_walking_boss.direction.x * 50
		#timer.start()
		if enemy_walking_boss.global_position.x > 1289 and enemy_walking_boss.global_position.x < 1291:
			#print(global_position.x)
			next_state = skill_state
			
		#else:
			#animation_tree.set("parameters/move/blend_position",  enemy_walking_boss.direction.x)
		#1291,820
	#character_state_machine.current_state.can_move = true
	#if enemy_walking.direction.x  && enemy_walking.state_machine.check_if_can_move():
	#	enemy_walking.velocity.x = enemy_walking.direction.x * 20
	#elif (enemy_walking.state_machine.current_state != hit_state):
	#	enemy_walking.velocity.x = move_toward(enemy_walking.velocity.x, 0, 20)
		
	#found_ledge = not ledgecheckright.is_colliding() or not ledgecheckleft.is_colliding()
	
	#if enemy_walking.is_on_wall() or found_ledge:
	#	enemy_walking.direction *= -1
	#pass


func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_area_2d_body_exited(_body):
	entered = false


func _on_timer_timeout():
	#print("blink")
	#playback.travel("blink")
	#Global.game_over_pebble = true
	pass
