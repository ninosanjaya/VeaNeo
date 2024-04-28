extends Area2D


var entered = false

#export var Door1_pos : Vector2 
@export var block = true

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _process(_delta):
	if entered == true:
		block = true
		
	if GameManager.enemies_done == true:
		block = false

