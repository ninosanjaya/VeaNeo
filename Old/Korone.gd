extends Sprite2D

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@onready var audio_stream_player = $AudioStreamPlayer
@onready var timer = $Timer
var once = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		material.set_shader_parameter("outline_select", true)
		if once == true:
			audio_stream_player.playing = true
			once = false
			timer.start()
	else:
		material.set_shader_parameter("outline_select", false)	
		
func _on_area_2d_5_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_area_2d_5_body_exited(body):
	entered = false


func _on_timer_timeout():
	once = true
