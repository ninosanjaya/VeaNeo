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
		#GameManager.last_position = Vector2(102,16)
			#print(GameManager.variable4)
			#GameManager.health_player_one = 3
			#GameManager.mana_player_one = 100
		#GameManager.save()
		if Input.is_action_just_pressed("attack"):
			#GameManager.final = false
			get_tree().change_scene_to_file("res://world.tscn")
			#Door1_pos
			#GameManager.last_position = Vector2(2444, -263) #door 1
			#GameManager.last_position = Vector2(2437, -7) #door 2
			GameManager.last_position = Vector2(1748, -72) #door 3
			#GameManager.save()

