extends Area2D


var entered = false

#@export var Door1_pos : Vector2 
@onready var dialogue_box = $"../UI/DialogueBox"
@onready var sprite_2d_2 = $Sprite2D2

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _process(_delta):
	if entered == true:
		#GameManager.last_position = global_position
			#print(GameManager.variable4)
			#GameManager.health_player_one = 3
			#GameManager.mana_player_one = 100
		GameManager.save()
		sprite_2d_2.material.set_shader_parameter("outline_select", true)
		if Input.is_action_just_pressed("attack") && GameManager.key_item2 == false:
			GameManager.player_location = 3
			Global.next_scene = "res://world_3.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
			get_tree().change_scene_to_packed(preload("res://loading.tscn"))
			#get_tree().change_scene_to_file("res://world_3.tscn")
			GameManager.last_position = Vector2(12,16) #position of next world door
			#GameManager.last_position = Vector2(2435,-7) #position of next world door
			#Door1_pos = global_position
			GameManager.save()
		if Input.is_action_just_pressed("attack") && GameManager.key_item2 == true && Global.talking == false:
			dialogue_box.start("key2")
	else:
		sprite_2d_2.material.set_shader_parameter("outline_select", false)
