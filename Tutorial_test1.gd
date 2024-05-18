extends Area2D

"""
@onready var dialogue_box = $"../UI/DialogueBox"


var entered = false
var next1 = false
var next1_1 = false
var next2 = false
var next3 = false
var next4 = false
var tutorial_first = false
#var finish_tutorial1 = false
#@export var Door1_pos : Vector2 
@onready var timer = $Timer

@onready var sprite_2d = $Sprite2D

var press = false

#sprite_2d.material.set_shader_parameter("outline_select", true)
func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _process(_delta):
	#print(Global.finish_tutorial1)
	#print("running")
	#print(texture_rect_2.visible )
	if entered == true:
	#	print("00")
		sprite_2d.material.set_shader_parameter("outline_select", true)
					
				
				
		if (Input.is_action_just_pressed("attack")) && next1 == false :
	#		print("enter")
			#if  next1_1 == false:
		#	get_tree().change_scene_to_file("res://world_4.tscn")
		#	GameManager.last_position = Vector2(-10,-10) #position of next world door
			#GameManager.last_position = Vector2(2429,280) #position of next world door
			#Door1_pos = global_position
				#next1_1 = true
				#next1 = true
				dialogue_box.start("Start")
				next1 = true
				#print("1.1")
			#texture_rect.visible = true
			#elif Global.finish_tutorial1 == true:
			#	pass
			#if Input.is_action_just_pressed("attack") && next == true:
			#	texture_rect.visible = false
			#	dialogue_box.start("Tutorial_dialogue3")
			#	next = false
	

				
			
	else:
		sprite_2d.material.set_shader_parameter("outline_select", false)	
			

func _on_dialogue_box_dialogue_ended():
	print("dialogue ended")
	if next1 == true:
		#Global.talking = true
		#Global.talking1 = true
		#next2 = true
		#next1 = false
		#texture_rect_2.visible = true
		#entered = true
		next1 = false
		print("2")
		
	#elif next3 == true:
	#	Global.talking = true
	#	Global.talking1 = true
	#	next4 = true
	#	next3 = false
	#	next2 = false
	#	texture_rect.visible = true
	#	print("4")


func _on_timer_timeout():
	print("timeout1")
	GameManager.tutorial = true
	#GameManager.save()


func _on_touch_screen_button_pressed():
	press = true


func _on_touch_screen_button_released():
	press = false

"""

