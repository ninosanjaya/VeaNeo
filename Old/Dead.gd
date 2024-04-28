extends State


@export var walk2_state : State
@export var walk2_animation : String = "idle_v2"
@export var damageable : Damageable
@onready var enemy_walking = $"../.."
@export var dead_animation : String = "dead_v1"
@onready var character_state_machine = $".."
#func _ready():
#	playback.travel(dead_animation)

func state_process(_delta):
	
	if GameManager.enemies_done_2 == false:
		playback.travel(dead_animation)
		enemy_walking.direction.x = 0
	if GameManager.enemies_done_2 == true:
		playback.travel(walk2_animation)
		next_state = walk2_state
	
func _on_animation_tree_animation_finished(_anim_name):
	#damageable.health = 3
	#enemy_walking.walk22 = true
	
	
	enemy_walking.walk33 = false #walk33 true move
	enemy_walking.walk22 = true #walk22 false attack player, walk22 true stop
	
	#next_state = walk2_state
	
	character_state_machine.current_state.can_move = false
	
