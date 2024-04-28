extends Sprite2D

var entered
var hic = true
@onready var audio_stream_player_2 = $AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		material.set_shader_parameter("outline_select", true)
		if hic == true:
			audio_stream_player_2.playing = true
			hic = false
	
	else:
		material.set_shader_parameter("outline_select", false)
		hic = true


func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true

func _on_area_2d_body_exited(body):
	entered = false
