extends State

# Called when the node enters the scene tree for the first time.
@export var dead_animation : String = "dead"
var once = false
@onready var animation_tree = $"../../AnimationTree"
@onready var timer = $Timer

func _ready():
	#playback.travel(dead_animation)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _state_process(_delta):

	if Global.wardem_dead == true:# && once == false:
		print("animate dead")
		playback.travel(dead_animation)
		#once = true
		#animation_tree.active = false


func _on_animation_tree_animation_finished(anim_name):
	if Global.wardem_dead == true:# && once == false:
		print("deadend")
		animation_tree.active = false
		timer.start()


func _on_timer_timeout():
	print("ending")
	Global.end = true
