extends Sprite2D

var entered 
@onready var dialogue_box = $"../../UI/DialogueBox"
var pekora_end = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		material.set_shader_parameter("outline_select", true)
		#udio_stream_player.playing = true
		#once = false
		#timer.start()
		if Input.is_action_just_pressed("attack") && pekora_end == false:
			dialogue_box.start("pekora")
			pekora_end = true
	else:
		material.set_shader_parameter("outline_select", false)	


func _on_area_2d_5_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true

func _on_area_2d_5_body_exited(body):
	entered = false


func _on_dialogue_box_dialogue_ended():
	pekora_end = false
