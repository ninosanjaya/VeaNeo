extends State

@export var walk_animation : String = "walk_v1"
# Called when the node enters the scene tree for the first time.
@onready var enemy_walking = $"../.."
@onready var character_state_machine = $".."
@export var hit_state : State
@onready var damageable = $"../../Damageable"

#@onready var found_wall = is_on_wall()

#@onready var ledgecheckright = $"../../ledgecheckright"
#@onready var ledgecheckleft = $"../../ledgecheckleft"

#var found_ledge 

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(_delta):

	
	#if (damageable.health > 0):
		playback.travel(walk_animation)
		enemy_walking.walk33 = true #walk33 true move
		enemy_walking.walk22 = false #walk22 false attack player, walk22 true stop
	#else:
		#next_state = dead_state
	#	enemy_walking.queue_free()
	
	#character_state_machine.current_state.can_move = true
	#if enemy_walking.direction.x  && enemy_walking.state_machine.check_if_can_move():
	#	enemy_walking.velocity.x = enemy_walking.direction.x * 20
	#elif (enemy_walking.state_machine.current_state != hit_state):
	#	enemy_walking.velocity.x = move_toward(enemy_walking.velocity.x, 0, 20)
		
	#found_ledge = not ledgecheckright.is_colliding() or not ledgecheckleft.is_colliding()
	
	#if enemy_walking.is_on_wall() or found_ledge:
	#	enemy_walking.direction *= -1
	#pass
