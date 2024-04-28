extends Sprite2D


var entered
var ollie_once = true
@onready var dialogue_box = $"../UI/DialogueBox"
@onready var audio_stream_player_2 = $AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		material.set_shader_parameter("outline_select", true)
		if  Input.is_action_just_pressed("attack") && ollie_once == true:
			dialogue_box.start("ollie")
			ollie_once = false
			audio_stream_player_2.playing = true
	else:
		material.set_shader_parameter("outline_select", false)
		ollie_once = true

func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_area_2d_body_exited(body):
	entered = false
