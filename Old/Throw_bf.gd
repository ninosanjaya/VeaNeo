extends State

@onready var walk = $"../Walk"

@export var throw_animation : String = "throw"
# Called when the node enters the scene tree for the first time.
@export var walk_animation : String = "walk"
@export var walk_state : State

func _ready():
	#playback.travel(throw_animation)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



		


func _on_animation_tree_animation_finished(anim_name):
	if walk.attacking == 1:
	#print("done")
		playback.travel(walk_animation)
		next_state = walk_state
		walk.can_attack = false
