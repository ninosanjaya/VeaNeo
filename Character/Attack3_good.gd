extends State


#class_name Attack
@onready var player = $"../.."

@export var return_state : State
@export var return_animation_node2 : String = "move"
@export var attack1_name : String = "attack1"
@export var attack2_name : String = "attack2"
@export var attack2_node : String = "attack2"

@export var ground_state : State
@export var air_state : State
@export var jump_animation : String = "jump"


@onready var atk_timer = $AtkTimer

func state_input(event : InputEvent):

	if(event.is_action_pressed("attack")):
		#print("timer start")
		atk_timer.start()
		
func state_process(_delta):
	can_move = false
	if Global.dog == true:
		next_state = ground_state
	

func _on_animation_tree_animation_finished(anim_name):
	#playback.travel(attack2_node)
	
	if (anim_name == attack1_name):
		if(atk_timer.is_stopped()):
			#print("timer stop after 1 atk, go back to normal")
			#playback.travel(attack2_node)
			
			if (character.is_on_floor()):
				next_state = ground_state
				playback.travel(return_animation_node2)
				can_move = true
			elif (!character.is_on_floor()):
				next_state = air_state
				playback.travel(jump_animation)
				can_move = true
			
		else:
			#print("timer still after 1 atk, more attack")
			if player.right == true:
				player.position.x += 5 
			elif player.right == false:
				player.position.x -= 5
			playback.travel(attack2_node)
			can_move = true
		
	if (anim_name == attack2_name):
		#print("after 2 atk, go back to normal")
		next_state = ground_state
		playback.travel(return_animation_node2)
		can_move = true
		#playback.travel(attack2_node)
		





#func _on_animation_tree_animation_started(anim_name):
#	if (anim_name == attack1_name):
#		atk_timer.start()
