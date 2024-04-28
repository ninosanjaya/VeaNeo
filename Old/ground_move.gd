extends Area2D


var entered = false

#@onready var Door1_pos = get_parent().get_node("World/Area2D")

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _process(_delta):
	if entered == true:
		Global.snap = true
