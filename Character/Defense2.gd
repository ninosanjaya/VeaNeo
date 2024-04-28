extends State


class_name defensev2

#@export var return_state : State
@export var return_animation_node2 : String = "move"
#@export var attack1_name : String = "attack1"
#@export var attack2_name : String = "attack2"
#@export var attack2_node : String = "attack2"

@export var ground_state : State
@export var air_state : State
@export var jump_animation : String = "jump"
#@onready var collision_shape_2d = $"../../CollisionShape2D"
@onready var defense_timer = $DefenseTimer


#@onready var atk_timer = $AtkTimer

#func state_process(_delta):
	#collision_shape_2d.disabled = true

#func state_input(event : InputEvent):
#	if(event.is_action_pressed("attack")):
#		#print("timer start")
#		atk_timer.start()
		
func state_process(_delta):
	can_move = false
	if Global.dog == true:
		next_state = ground_state
	
	



#func _on_animation_tree_animation_finished(anim_name):
	#collision_shape_2d.disabled = false
#	if (character.is_on_floor()):
#				next_state = ground_state
#				playback.travel(return_animation_node2)
#	elif (!character.is_on_floor()):
#				next_state = air_state
#				playback.travel(jump_animation)


func _on_defense_timer_timeout():
	if (character.is_on_floor()):
			next_state = ground_state
			playback.travel(return_animation_node2)
			can_move = true
	elif (!character.is_on_floor()):
			next_state = air_state
			playback.travel(jump_animation)
			can_move = true
				
