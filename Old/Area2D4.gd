extends Area2D


var entered = false
var final = false
#@export var Door1_pos : Vector2 
@onready var dialogue_box = $"../UI/DialogueBox"
@onready var sprite_2d_4 = $Sprite2D4


var next20 = false
var endchat = true
#var next21 = false
#var next22 = false

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _ready():
	#GameManager.key_item_all = false
	pass
	
func _process(_delta):
	#print(sprite_2d_4.global_position)
	#print(GameManager.final)
	if GameManager.final == true:
			Global.next_scene = "res://Old/world_F.tscn"
		#get_tree().change_scene_to_file("res://Loading.tscn")
			get_tree().change_scene_to_packed(preload("res://Old/loading.tscn"))
			#get_tree().change_scene_to_file("res://world_F.tscn")
			GameManager.last_position = Vector2(100,16) #position of next world door
			GameManager.final = false
			#GameManager.save()
			
	if entered == true:
		
		
		GameManager.last_position = sprite_2d_4.global_position
		#print(GameManager.last_position)
			#print(GameManager.variable4)
		GameManager.health_player_one = 3
		GameManager.mana_player_one = 100
		GameManager.save()
		
		#GameManager.next22 = true
		#GameManager.key_item_all = true
		#print(GameManager.next22)
		#rint(GameManager.key_item_all)
		#print(GameManager.key_item_all)
		#print(GameManager.key_item1)
		#print(GameManager.key_item2)
		#print(GameManager.key_item3)
		#print(GameManager.next21)
		#print(GameManager.key_item_all)
		sprite_2d_4.material.set_shader_parameter("outline_select", true)
		
		if Global.next20 ==  false && GameManager.next21 == false && GameManager.key_item_all == false && endchat == true:
			dialogue_box.start("Main_gate") #first time oneshot
			endchat = false
			Global.next20  = true
			GameManager.next21 = true
			GameManager.save()
		
		elif GameManager.next22 == false && GameManager.next21 == true && GameManager.key_item_all == false && (GameManager.key_item1 == false or GameManager.key_item2 == false or GameManager.key_item3 == false) && endchat == true:
			dialogue_box.start("Main_gate_no") #repeat second time
			endchat = false
		
		elif GameManager.next22 == false && GameManager.next21 == true && GameManager.key_item1 == true && GameManager.key_item2 == true && GameManager.key_item3 == true && endchat == true:
			dialogue_box.start("Main_gate_yes") #oneshot second
			endchat = false
			GameManager.key_item_all = true
			#GameManager.next21 = false
			GameManager.next22 = true
			GameManager.save()
			
		elif GameManager.next22 == true && GameManager.key_item_all == true && endchat == true:
			dialogue_box.start("Last_prepare") #repeat third
			endchat = false
		
	
			#GameManager.last_position = Vector2(1720,-71) #position of next world door
			#Door1_pos = global_position
	else:
		sprite_2d_4.material.set_shader_parameter("outline_select", false)
		endchat = true

func _on_dialogue_box_variable_changed(var_name, value):
	print(var_name)
	if var_name == "final":
		if value == true:
			GameManager.final = true
			GameManager.save()
		
		
