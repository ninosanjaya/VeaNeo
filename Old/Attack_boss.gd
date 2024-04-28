extends State

@onready var walk = $"../Walk"
@export var walk_state : State
@export var attack_state : State
var changestate = false
@onready var enemy_walking_boss = $"../.."
@onready var animation_tree = $"../../AnimationTree"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(_delta):
	#print(changestate)
	#pass
	enemy_walking_boss.velocity.x =  0
	if enemy_walking_boss.attacking == false:
		next_state = walk_state
	#if changestate == true:
	#	next_state = walk_state
		#playback.travel("idle")
	#elif changestate == false:
	#	next_state = attack_state
	#	playback.travel("attack")



func changewalk():
	#changestate = true
	next_state = walk_state
	#animation_tree.set("parameters/move/blend_position",  enemy_walking_boss.direction.x)

		


#func _on_animation_player_animation_finished(anim_name):
#	if enemy_walking_boss.attacking == false:
#		next_state = walk_state
