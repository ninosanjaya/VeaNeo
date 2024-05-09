extends "res://Old/enemy_walking4.gd"



const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _process(_delta):
	# Add the gravity.
	if state_machine.current_state.name == "Dead":
		Global.enemy4 = true
	
