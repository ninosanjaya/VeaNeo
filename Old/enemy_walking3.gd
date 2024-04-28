extends "res://enemy_walking.gd"


#const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var enemy_walking_3 = $"../Enemy_walking3"
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var enter = false

#func _ready():
#	if state_machine.current_state.name == "Walk_V2":
#		Global.enemy3 = true
		
#state_machine.current_state.name
func _process(_delta):
	# Add the gravity.
	#print(state_machine.current_state.name)
	if state_machine.current_state.name == "Dead":
		Global.enemy3 = true
	
	#if state_machine.current_state.name == "Walk_V2" && GameManager.enemies_done == true && enter == true:
	#	if Input.is_action_just_pressed("attack"):
	#		enemy_walking_3.animation_player.play("pet_v2")
	#	else:
	#		enemy_walking_3.animation_player.play("idle_v2")


