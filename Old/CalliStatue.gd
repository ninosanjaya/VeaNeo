extends Sprite2D

var entered 
var calli_once = true
@onready var dialogue_box = $"../UI/DialogueBox"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		material.set_shader_parameter("outline_select", true)
		if  Input.is_action_just_pressed("attack") && calli_once == true:
			dialogue_box.start("calli")
			calli_once = false
	else:
		material.set_shader_parameter("outline_select", false)
		calli_once = true


func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_area_2d_body_exited(body):
	entered = false
