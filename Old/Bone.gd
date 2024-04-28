extends Area2D


var entered = false
var next39 = false
#@onready var Door1_pos = get_parent().get_node("World/Area2D")
@onready var bone_2 = $"../Bone2"
@onready var sprite_2d = $Sprite2D

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true

@onready var audio_stream_player = $AudioStreamPlayer

func _on_body_exited(_body):
	entered = false
	
func _ready():
	if bone_2.next39_2 == false && GameManager.passkeyB == false:
		visible = true
	elif GameManager.passkeyB == true:
		visible = false
	else:
		visible = false
	
func _process(_delta):
	
	if entered == true && next39 == false:
		sprite_2d.material.set_shader_parameter("outline_select", true)
		if Input.is_action_just_pressed("attack"):
			next39 = true
			Global.dog = true
			visible = false
			audio_stream_player.playing = true
	
	elif entered == false && Global.death == true && bone_2.next39_2 == false:
		Global.dog = false
		visible = true
		next39 = false
		sprite_2d.material.set_shader_parameter("outline_select", false)
		
	else:
		sprite_2d.material.set_shader_parameter("outline_select", false)
	
		
		
		
