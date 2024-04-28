extends State

@export var walk_state : State
@export var attack_state : State
@onready var enemy_walking_boss = $"../.."
# Called when the node enters the scene tree for the first time.
@onready var animation_tree = $"../../AnimationTree"

func _ready():
	#playback.travel("blink")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(_delta):
	if Global.count_pebble >= 10:
		#print("blink")
		playback.travel("blink")
	if Global.count_pebble < 10:
		
		next_state = walk_state
		#playback.travel("idle")
		#animation_tree.set("parameters/move/blend_position",  enemy_walking_boss.direction.x)
