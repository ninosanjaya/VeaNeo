extends Area2D

var entered = false
@onready var sprite_2d = $Sprite2D

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
		GameManager.save()
		sprite_2d.material.set_shader_parameter("outline_select", true)
		if Input.is_action_just_pressed("attack"):
			GameManager.player_location = 1
			Global.next_scene = "res://world.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
			get_tree().change_scene_to_packed(preload("res://loading.tscn"))
			#get_tree().change_scene_to_file("res://world.tscn")
			#Door1_pos
			#GameManager.last_position = Vector2(2444, -263) #door 1
			GameManager.last_position = Vector2(2437, -7) #door 2
			#GameManager.last_position = Vector2(2433, 280) #door 3
			GameManager.save()
			
	else: 
		sprite_2d.material.set_shader_parameter("outline_select", false)


