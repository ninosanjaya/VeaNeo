extends State

@onready var enemy_walking = $"../.."
@export var walk_animation : String = "idle_v2"
@onready var character_state_machine = $".."
@export var dead_animation : String = "dead_v1"
@export var pet_animation : String = "pet_v2"
@onready var hit = $"../Hit"
@export var walk2_state : State
@export var dead_state : State

func _ready():
	hit.connect("hit_state", hitted)
	#playback.travel(walk_animation)
# Called when the node enters the scene tree for the first time.
func state_process(_delta):
	
	#playback.travel(walk_animation)
	enemy_walking.walk33 = false
	enemy_walking.walk22 = true
	#enemy_walking.velocity.x = 0
	character_state_machine.current_state.can_move = false
	
	



func hitted():
	print("get hit")
	if GameManager.enemies_done_2 == true:
		playback.travel(pet_animation)
		#next_state = dead_state
	#else: 
		#playback.travel(walk_animation)
		#next_state = walk2_state

