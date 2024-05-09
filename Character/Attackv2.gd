extends State

#Attackv 1 evil
class_name Attackv22

@export var return_animation_node2 : String = "move"
#@export var attack1_name : String = "attack1"
#@export var attack2_name : String = "attack2"
#@export var attack2_node : String = "attack2"

@export var ground_state : State
@export var air_state : State
@export var jump_animation : String = "jump"
@onready var player_2 = $"../.."

func state_process(_delta):
	can_move = false
	player_2.velocity.x = 0
	if Global.dog == true:
		next_state = ground_state
# Called when the node enters the scene tree for the first time.



func _on_atk_timerv_2_timeout():
	if (character.is_on_floor()):
			next_state = ground_state
			playback.travel(return_animation_node2)
			can_move = true
			player_2.can_attack2 = true
	elif (!character.is_on_floor()):
			next_state = air_state
			playback.travel(jump_animation)
			can_move = true
			player_2.can_attack2 = true
