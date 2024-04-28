extends Control

# use loading scene:
#global/Loading.load_scene(self, "res://scene2.tscn")
@onready var progress_bar = get_node("ProgressBar")#$ProgressBar
#@onready var progress_bar = $ProgressBar
@onready var animated_sprite_2d = $AnimatedSprite2D
var rng = RandomNumberGenerator.new()
var dice
@onready var timer = $Timer
var one_time = true
# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(Global.next_scene)
	dice = rng.randi_range(0,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var progress = []
	ResourceLoader.load_threaded_get_status(Global.next_scene, progress)
	
	progress_bar.value = progress[0] * 100
	
	if dice == 0:
		animated_sprite_2d.play("fuwawa")
	elif dice == 1:
		animated_sprite_2d.play("mococo")
	animated_sprite_2d.position.x = ((progress_bar.value -1)/(100-1)*(300-32))+32
	#print(progress[0])
	if progress[0] == 1 && one_time == true:
		#print("timer?")
		timer.start()
		one_time = false
#32-300

#new_scene.connect("ready", self, "initialize_scene")

func _on_timer_timeout():
	one_time = true
	#print("done")
	var packed_scene = ResourceLoader.load_threaded_get(Global.next_scene)
	get_tree().change_scene_to_packed(packed_scene)
