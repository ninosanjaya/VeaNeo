extends State

#Attack 1 evil
class_name Attackv2

@export var return_state : State
@export var return_animation_node2 : String = "move"
@export var attack1_name : String = "attack1"
@export var attack2_name : String = "attack2"
@export var attack2_node : String = "attack2"

@export var ground_state : State
@export var air_state : State
@export var jump_animation : String = "jump"
@onready var atk_timer = $AtkTimer2
@onready var player_2 = $"../.."


func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		#print("timer start")
		atk_timer.start()
		
func state_process(_delta):
	can_move = false	
	if Global.dog == true:
		next_state = ground_state


		





func _on_animation_tree_2_animation_finished(anim_name):
	
	if (anim_name == attack1_name):
		if(atk_timer.is_stopped()):
			#print("timer stop after 1 atk")
			if (character.is_on_floor()):
				next_state = ground_state
				playback.travel(return_animation_node2)
				can_move = true
			elif (!character.is_on_floor()):
				next_state = air_state
				playback.travel(jump_animation)
				can_move = true
			
		else:
			#print("timer still after 1 atk")
			if player_2.right == true:
				player_2.position.x += 5 
			elif player_2.right == false:
				player_2.position.x -= 5
			playback.travel(attack2_node)
			can_move = true
		
	if (anim_name == attack2_name):
		#print("after 2 atk")
		next_state = return_state
		playback.travel(return_animation_node2)
		can_move = true
		
